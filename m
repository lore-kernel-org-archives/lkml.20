Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=94.130.186.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844610;
	b=SXFFnIl2sZWbrKrftEIhsEm8Mf0jczN0F0aAHq//rG+AwpHPa02AsFjp6gG6Qeflnjwt
	 pBejGdODPcl+nSOC+gpI2ksLEbZFAuvTcvgSs38Z39GGixowRWMCT+5YwbdyWp7vzTGph
	 SAKq614fTuVuu8ajkSz0S/KHMunfoeMcRWJJg3ZwAxqNNqj+BQ4wpKUMdQyiP+kcuL08V
	 pklxpvu4aSIQOfenvVgCyHnUMNrzuhoPPwUIXSbRCTqVrRRbCt1Vl324G5Dar6ubNAhIF
	 Re9gDSl4563/RaWK8S3wVYF8YBVjVsETREeHGvduYJ+Zq/Aq2F83ZNYo9LGS7uAd+OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844610;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=FqHPthAcq6Uz03AJHp7aohO3mOH1sdAWWLoVN9Y6wig=;
	b=LgahlU9chq9TidNTU8s/etyJg7p1aBSlVNLJT6pKYFq7VMBFmERQMqXhJyh4tBR4dA9l
	 wAHEBBYeMvC9yG6pxN6VVtyPrBv2QdZtMibnzfglU7xMzq1YEWaw6C8psIc9xLb/gUyaI
	 LRPv1fzYJlMXFpPWEFw276d5rrEd+8g7laajD+IdlTlLq3trMWBro3LI8p9AnTDqrXgo4
	 q1ZrCzUJ3Jtgxb4mX8UfGs1T55QLtnLQQLU72NkxTd8OzIGlDDKgWKn6xw+Ko2fhi1ofM
	 7vgAdjfDSLQ3aW2GQVbXi8f3jCTyZGR5MgINdfKrA+Rx9rs8S6epAxjflKR3kAeJyFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hardeman.nu;
	spf=pass smtp.mailfrom=hardeman.nu;
	arc=none smtp.remote-ip=94.130.186.121
Received: from thor.hardeman.nu (thor.hardeman.nu [94.130.186.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4543606A329;
	Mon, 16 Nov 2026 15:56:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4543606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hardeman.nu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hardeman.nu
Received: from thor.hardeman.nu (thor.hardeman.nu [IPv6:fd27:2a41:8fcb:2::f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "thor.hardeman.nu", Issuer "Hardeman Internal Mail Relay CA" (verified OK))
	(Authenticated sender: nullmailer@mil.hardeman.nu)
	by thor.hardeman.nu (Postfix) with ESMTPSA id 4jSstH1RpmzFphN;
	Mon, 16 Nov 2026 16:56:39 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=hardeman.nu;
	s=202608-ed25519; t=1794844599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FqHPthAcq6Uz03AJHp7aohO3mOH1sdAWWLoVN9Y6wig=;
	b=Q8o5/JAJmH9QlLxMvuTr00iub0uKfhPO9QX7eUBR1FNYaXyiqe8xZuG12qoHX+WMeLogH1
	y0IgwQt3y9aODfDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hardeman.nu; s=202608-rsa;
	t=1794844599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FqHPthAcq6Uz03AJHp7aohO3mOH1sdAWWLoVN9Y6wig=;
	b=CdC7Xm8/1khQiaO+ZENY2XlvHRx7yCGz/oVdDXbls18ZB2bKDhCXABuO7J8I0+oxraVK5J
	mQrgx3Eqiwr0zo6QRe2jnMVYI8gmP3fHLqh/HE4MpLHwK3yO/hDrbueKhCkNiaOzpy+VkK
	gClUYxthYwUaSVfS/VcJJ6tXJYqUtmwxjXQ/p6nesSws7wH2t2uD8q6l3SrCemnNrBbJ7A
	l+5mWZSUG57PVAKxLk6DkJ9dWXO8LwVZayj84qCzxmsCE1jUbA3ncRYn/bjK5o8jcloT1U
	Xnbbb7flQFCUVMzCkn6jsQgt/+WcyM1Sm1jDKMtdjXzbxVfEY4vQoCusXwvlww==
Received: from mil.hardeman.nu ([fd27:2a41:8fcb:2::f])
	by thor.hardeman.nu with ESMTPSA
	id XNFhMrYn+2qE7igAWTs42w
	(envelope-from <david@mil.hardeman.nu>); Mon, 16 Nov 2026 16:56:38 +0100
Received: (nullmailer pid 535617 invoked by uid 2002000001);
	Mon, 16 Nov 2026 15:56:38 -0000
From: =?UTF-8?q?David=20H=C3=A4rdeman?= <david@hardeman.nu>
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: Emmanuel Grumbach <emmanuel.grumbach@intel.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?David=20H=C3=A4rdeman?= <david@hardeman.nu>
Subject: [PATCH 0/2] wifi: iwlwifi: release frames before one beyond the reorder window
Date: Mon, 16 Nov 2026 16:56:07 +0100
Message-ID: <20261116155609.535595-1-david@hardeman.nu>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

An AP that gives up on an MPDU of a BA session without sending a BAR
and keeps transmitting will eventually send a frame with SN ==
head_sn + buf_size. Both iwlmvm and iwlmld store that frame in the slot
of head_sn and then release it ahead of the frames before it, which
all fail the PN check. A single lost MPDU becomes a burst of up to 63
dropped frames, i.e. a TCP loss burst.

I ran into this with an AX210 (iwlmvm) on an rtw88 SDIO AP (RTL8822CS)
that drops frames without a BAR while the client is off-channel for
background scans; the AP side is a separate problem. A kprobe at the
PN check showed every burst starting with the frame at hole + 64.

Patch 1 restores the window check that iwlmvm had before the reorder
buffer was simplified. Tested on 7.2.15 (same code): PN-replay drops
per client scan went from about 280 to about 12, and in normal use
(8 two-minute bidirectional TCP runs each) from 290 to 3 per run.

Patch 2 does the same for iwlmld, which has the same code. I have no
iwlmld hardware; it adds a KUnit case that fails without the fix and
passes with it.

The patches were generated with the help of an LLM; I have reviewed
them (to the best of my ability), and tested patch 1 on actual hardware
as described above (patch 2 only with the KUnit case).

David Härdeman (2):
  wifi: iwlwifi: mvm: release frames before one beyond the window
  wifi: iwlwifi: mld: release frames before one beyond the window

 drivers/net/wireless/intel/iwlwifi/mld/agg.c  | 14 ++++++++++
 .../wireless/intel/iwlwifi/mld/tests/agg.c    | 28 +++++++++++++++++++
 drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c | 13 +++++++++
 3 files changed, 55 insertions(+)


base-commit: 3627924ed81fd7783394fb2555ea179c6606a231
-- 
2.47.3

