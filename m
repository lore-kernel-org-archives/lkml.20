Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=37.187.101.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794520317;
	b=lT0n4Yb7nYeU0m69cRw3vqG1D3d1DK7KYVBd95kxzQx9VhDc04Z2ATNr0nJ0eWqIeyZ/
	 Baqqf5VyRO/PfSi+NisfUAP+jnwwvWTyVFUQ0VrGmwZ8WXonZSroL8jWoVVjzs6ijRlUf
	 8VgtJUk3cIEjZJY/esAbFazc5yDvfITYTFAMddFdFVO0l39S9YPXwk5ZkQcX5ss6ODBtU
	 Ul7DqTWJ4zOb0DaOxL88YUvvZ4UEYweH1r2LY5ijsS3pz9W6gHS2/kk2feQEMwq/MNgkW
	 D4sCE3dC2hviWiNb3cIo+afBmz3YT0LVqLZ/PhXJ/T+t+v09VnL1dyACIkrCvWPmLQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794520317;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id;
	bh=oKdPeZEiz+TI1pLlUzkyxdqqDHu8undhNSSzV2c3Nos=;
	b=VsGECsrmMk0nwk9MEOHUpInTfFIqIRZV87EImoTkrQDatgJXXhi9EPSodsZny4/fSYvR
	 jz95QOJH/HbzqajG9JkVpRJtIyu6JyyqqVxi7/MczekWroqdn0pHyuZT42VLmxV/PBdcV
	 4zKxoSgRz/H0njLFFf2Jwk0PY73mXT/a9cAncJOaLX0xyyF0yfveZJI7+bL8fJyTUmwqo
	 +QY3rOlRa773Nw3QIaSimsl/BnHdmbK1rnzne2WX8fSEwfquBxAlu7f/Q47coPKTu3mQq
	 Cv8MPVqWG+/qfD9sknqowESEov5Fs+T1uNANqEBjxDp641uSzbfvBEo7rKMNeOdJ37g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sven.de;
	spf=pass smtp.mailfrom=sven.de;
	dkim=pass header.d=sven.de header.i=@sven.de header.a=rsa-sha256 header.s=default header.b=Ik5ntKUi;
	arc=none smtp.remote-ip=37.187.101.158
Received: from mail.sven.de (mail.sven.de [37.187.101.158])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF66606A31C;
	Thu, 12 Nov 2026 21:51:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BF66606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sven.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sven.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sven.de header.i=@sven.de header.a=rsa-sha256 header.s=default header.b=Ik5ntKUi
Received: by mail.sven.de (Postfix, from userid 1000)
	id AC033C0070C; Thu, 12 Nov 2026 22:51:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sven.de; s=default;
	t=1794520305; bh=oKdPeZEiz+TI1pLlUzkyxdqqDHu8undhNSSzV2c3Nos=;
	h=From:To:Cc:Subject:Date;
	b=Ik5ntKUiDcpUae3W1ecHFgyrfo1T0tWcisp8LWKP3FyKWW1LmHu2Kvgm0Z3jxeOY3
	 HEcEhImJezgAO0FGtCSERwCQwpR0RFPLFaL3UbrB42m5AZYRtSm1jlsJ9WLYw1o6Sh
	 3zj+Q553Ot46G2dwQT1WFrovR+UVI296G/beL4R0=
From: Sven Neuhaus <sven-kernel@sven.de>
To: linux-usb@vger.kernel.org
Cc: westeri@kernel.org,
	andreas.noever@gmail.com,
	YehezkelShB@gmail.com,
	linux-kernel@vger.kernel.org,
	Sven Neuhaus <sven-kernel@sven.de>
Subject: [PATCH 0/2] thunderbolt: Fix lost ring interrupts and an XDomain use-after-free
Date: Thu, 12 Nov 2026 22:51:41 +0100
Message-Id: <1794520303-5758-1-git-send-email-sven-kernel@sven.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Hi folks,

here are two independent fixes found while running an out-of-tree 
USB4 service driver between two hosts with AMD Strix Halo USB4 host 
routers (1022:158d, 1022:158e). The driver exchanges XDomain requests 
and responses in both directions and moves data over its own rings.

Patch 1 stops tb_xdomain_match() from matching received packets to the
requests that tb_xdomain_response() queues. Those requests have no
response buffer, and a match after their work has run makes the work
run again after the request was freed (refcount underflow in
tb_cfg_request_work()).

Patch 2 reads back the NHI after the ring's interrupt status is cleared
in ring_msix() on hosts without QUIRK_AUTO_CLEAR_INT. Without the read
the posted clear can take effect after the next frame has completed
and clear its status too, so that frame raises no interrupt. On these
hosts that left an XDomain request unprocessed until the sender timed
out (about 75 ms in 3-7% of request/reply exchanges), and data ring
completions were lost in the same way.

Each patch says how it was tested and what was not tested. Both apply
to the fixes branch (f1ae606eb404) and to 7.3.3. They were built on
7.3.3 with W=1 and add no warnings; they were not built on the fixes
branch. The analysis, the fixes and the tests were done
with an AI coding assistant.

Sven Neuhaus (2):
  thunderbolt: Do not match XDomain responses to received packets
  thunderbolt: Flush the ring interrupt status clear

 drivers/thunderbolt/nhi.c     | 8 ++++++++
 drivers/thunderbolt/xdomain.c | 7 +++++++
 2 files changed, 15 insertions(+)


base-commit: f1ae606eb404bca2498b9ad69b923073655556e4
-- 
2.47.3

