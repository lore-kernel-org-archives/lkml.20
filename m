Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.65.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793363518;
	b=1KQuTB+eFCk2RBATriy608uqlMV2paOU/azcIfl0dYsPCumwpYi9ShDPBAFm7KFhQ2i/
	 vyomNOSduYEGaIMLIIZjf/P/nGiWRKoAOJuueZL6YTHs3dnIG2X3d73BOXBOtMUMxHBO1
	 eicfvdl5keNhgT2nlIosvTaXEPrHaGzmJdsep31jKfSslJ5/SPC/7P7PcGwMKnUqx6+id
	 i5U0Obk0so8XCcZ0LxKGCu3/ybhDk0JXuH+2O4i+GapWDgRkb1VDsjDs4HBvxo46KWh5p
	 sY5iFIH2FUX+lqyR202EI8ugSAyh/x3cc4weX6woa+F92mh+pjrKxrIpIReBYZLx18w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793363518;
	h=DMARC-Filter:Received:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Flowmailer-Platform:Feedback-ID;
	bh=2ekTq4LD9WUXbHIwYh2uVJEFS6fDDKjHpz3RXNXUhxI=;
	b=0+fbiTo8ALDdrJfH6IWPqr4NdLFjnKDVWzh+STSBAV/UB9eBzaZhOdmdZx7AMxkqYV91
	 gC29bALmnqDFR/MxFdF0nDo69fcwOtMnuMLP6IIHzUHz/EqTqlQhL3QsQL/rdGTs7RxfF
	 cw40R9vOwz/69xX0GGAs5/4Y33SDdTSNfjsM71t2hsb2/m4j0lLfLGDc3rSMvVCj2CT/3
	 puQPp5jUpvwl0Wc+vv447mJ7f227zfh5mbE8wpepy0595Fx/RE8NPtZSjV7g1H2c+MUxf
	 jn6LUIK7HtTsU68uulVTaipDi3ufggUETqYPrPc/EbiW0joXACchkg6ZLS67+JtdrWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=florian.bezdeka@siemens.com header.a=rsa-sha256 header.s=fm2 header.b="Htc/hcSd";
	arc=none smtp.remote-ip=185.136.65.226
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38382606A321
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38382606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=florian.bezdeka@siemens.com header.a=rsa-sha256 header.s=fm2 header.b=Htc/hcSd
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20261030123149fe42345c4c000207a6
        for <linux-kernel@vger.kernel.org>;
        Fri, 30 Oct 2026 13:31:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=florian.bezdeka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=2ekTq4LD9WUXbHIwYh2uVJEFS6fDDKjHpz3RXNXUhxI=;
 b=Htc/hcSdjtoIL8v7RPzlbnAPuwnFYf+44NtfYIQgpqEXvjGHTwyztnHDNFIf+cslCTb1kf
 qM1AVklZvlBUnBGN0218tnGwbWjrn9ZCh+1xaLemqW3rakrlwS2BhzrX2LXrn5JCUYEBfRbv
 Fi+TYPTncFzHB5F9jmGV0KFxNjxQ7bb/KekcQ+w53FtDVrBv411PHwrGEYvUNB9lKrUj+B6r
 8rgrjw0LCK2j4CIba84j9dAXabfwt0M9x8c6h2WJiy+X4dTCRzVXOASChDm1ut2Do1jU/TMb
 NrtF1X/u6Nv+D410ju2BmPDJvy8B5xeZRM0BplAc/3hU0CHUVd70/DIA==;
From: Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [PATCH 0/2] entry: Drive-by fixes for the entry code
Date: Fri, 30 Oct 2026 13:31:40 +0100
Message-Id: <20261030-wip-flo-fixup-entry-code-v1-0-7724c29e800b@siemens.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACyO5GoC/x2MSQrEIBAAvxL6nAY1ICFfCTkYbWcagopmJfj3k
 TkWVNULhTJTgal7IdPJhWNoIPsO7NeEDyG7xqCE0lIMAi9O6LeInu8jIYU9P2ijI9RmdZqUGaW
 30PKUqTn/9bzU+gMxEh54agAAAA==
X-Change-ID: 20261030-wip-flo-fixup-entry-code-6abd6e2a81fc
To: Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux-kernel@vger.kernel.org, 
 Florian Bezdeka <florian.bezdeka@siemens.com>
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-68982:519-21489:flowmailer

Hi all,

I had to debug and read a lot of the low level entry code today. While
doing so two minor things jumped at me. I hope those "fixes" are
valuable. Feel free to ignore.

Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
---
Florian Bezdeka (2):
      entry: Fix return type of syscall_trace_enter()
      entry: Complete syscall_enter_from_user_mode_work() to bool migration

 include/linux/entry-common.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
---
base-commit: a39c950806213f6861d00f90729acaaa21f2d95a
change-id: 20261030-wip-flo-fixup-entry-code-6abd6e2a81fc

Best regards,
-- 
Florian Bezdeka <florian.bezdeka@siemens.com>

