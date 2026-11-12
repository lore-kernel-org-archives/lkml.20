Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481225;
	b=JjaUCcNLcTByUhyzgUTxdcPTw9zJCGKgDZsJQmkMry5JdMBwj91UAzBR86BezX8Kuflz
	 CUiYFhlP0YySqudR65ILGcqE+vk2r/YrXnA6X1ad94Ndo8WpMea6IrZ8PH/nZf4hkCvU3
	 YYRZQ8LxLLiOee/Zq6x6nOSK2q1JkuRqeVfhtCjFxfF2NReeBosupaWYskLQzh3i4i6n1
	 +LjB8Bg3105XdZeY0MRIgR6sA4MPj1gKYd3zN01fYIOtr0IAIjLvUIe4oYLlt0Nfwet1v
	 znDtQD6ag1gQQFkinVwRyY5QrYU9c3ydJDTnLSZ1+wTdJxp+IJJNRDPLt6HQDiRvhzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EHL+ZSQQJOt6k6Fmf6PJcWAXM06Cn8Zw4xySScxtGSI=;
	b=OmacRKx01OmWscb4MTzE14xhhMXZ7qeGdKyXmEfx73nY5uDJsxyM8eUg5OMCZtLJFd5X
	 60GmPh42X84nuvjIEHHPPNUKMt0hTuPp0MJV5wJa34KjlNSGl4R23gayqMdOIbqau1pkL
	 N8wTYjKq/ojIgYolJFVWVEZpyzc2ZaKxbCpmUSHj9/pvjv2FL6SxL7IjJwYB73vxo1e5y
	 nBe/Nl4BBNHehgYm/JdOMvs50m4j1Uoh6C+yK8pMTkS5ykt5xv43VNizttTmPOxKCC+WI
	 s2TOKmz5575gLJPk8oLVCuqZ7R79vQXPCpLIowT05bsvCWNuuaSulvqiIN7IUTUX0TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xM79bSxZ;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0880606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:00:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0880606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xM79bSxZ
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso1818280f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794481223; x=1795086023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EHL+ZSQQJOt6k6Fmf6PJcWAXM06Cn8Zw4xySScxtGSI=;
        b=xM79bSxZIjAQKwxPPLERuag1Cs3Lt42zaITnGfEZHfz/WiLVsrtzQX5B37G6L1OVxP
         iHAa0qmn/tdIhI3f2BXK3NjoHx1gwVx4HwyPuSnB7uwWJZrjj1UDKolgiPlLfjleFgAv
         DE62YExOtW78mOtO/6GOSZtZV0M5rHU+hUbrN8WNBRS2g+4MqwXcKNxJZOZQVeeL15Cr
         SZy49lafpFIG1fZTf1Vb6Bzj0bIwHHJpAWZD4o5r1yfX7oGvy0Oqzak9BlbMAulWu7iz
         BfrDhWZzVd8NBHyazKRglhlUTZOOYSR3C+hRLV7adg4zJQ6mH0XAKDOY8vgrAFOOb/0k
         5X9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794481223; x=1795086023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EHL+ZSQQJOt6k6Fmf6PJcWAXM06Cn8Zw4xySScxtGSI=;
        b=tme1JoeqiZxLltcrHAQIDai4KfGkzukTS2+iAsx+8lAkXxoSve7o/NN5PISWODJYwx
         OI01E6P7zqOcCB16Ee66W62XB5Ndyu2RmIJC44V0xVZ4eM1vsfjYAHj9JXaA36jdW5h/
         3ezZTrsssI4X33CBc5P8PtqkEN1Y7PQA4m55UvCvTtx1ZoUpS8niYCWQyH8Wirg8JTXb
         Rmk3aK+suKLRN8v3+8eo8j5SDF0fhREky8EEgNDnUi7RBMoZsqBnydZQQAdSBAnehcJs
         StYkFc21AsJbF0Bi8mX9JZK8O901B67/4x3K2/7+UPqReRIw2DZfl74nb1SWKFGG4Wa+
         cTQw==
X-Forwarded-Encrypted: i=1; AL+hErGNf10HMlL8BJ1Ooa3sA3sPBz3l8L7iB8iunfGSNbx54II8iA3fkm2saEwpyB4+BM/3KRizdjbDfhPquoA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Fhsjy+2c40EiAwQDsJhtBr9Grrr+wRi7mNPPP0tcqFaifuqsS
	sgNrFwP2S/S9LDJtCT+lMJXi6/FYvLZgE6eONFltQt17JC6ZeYJHCgsJ
X-Gm-Gg: AYBFou2oOOHx4PAp37rNo0aGcBUyEtEp1klsXQTjEt3VkzxCTNt6gFVy/SCj7Bki7wO
	Ic/cfUY0J3cbxSiXOP85WQlOpYElH++scRr4tKggp2PsZ9bbgbD2M/tX/WPscDcrM9oT+hFbaAf
	hKGXk5FImIdF7Qwow6g+dE6HzbD3z+BrZ2P5JnfW/yFD/XpTpoD8YedE1tExHAdaKPUxuS/wnFG
	xvLTsbIj/60T8BmKCciwNLtZxaWjg25XSDP+6xhvwyt3T22Bz5H8m/WCJ22CSDqzPBm+QoHxvlk
	4JaXcISk4mPOEVgxLI7Fwn2JxeNsVNDBtKO4qwi6B4MWpLweh9ngcftMGRV6nM3quSAz8ylIxPe
	jF14aThb6Uwb+O+AeeSvi6sc+grHwvrB+JCa2duH17uEDl7+tw6svHv0MFfnSheFCaH+fAs3iAA
	PIlMmZyJjGkVEzNvdbkvUYl2KVyY+6G7LAmVl2yfud7FoqRlVzSpI1VSVaOvakzu/xt6wQAHKRz
	IYmnYRz6Y9Wb4sH7jnorKzvO2dR53lWdgrVIs4GliR1fd6BKrAK1fx80f49zmNXpBcEFyvK6UBT
	pp1sjzmkst4GO690nXHM8tgmAl2wd1TqfafdtUN96q/THMxmaEvptwU=
X-Received: by 2002:a05:6000:1acc:b0:490:ae2:b841 with SMTP id ffacd0b85a97d-499c64069ddmr9415525f8f.30.1794481222371;
        Thu, 12 Nov 2026 03:00:22 -0800 (PST)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498366c500asm15473859f8f.48.2026.11.12.03.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:00:22 -0800 (PST)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] wifi: ath12k: recover from a firmware crash during resume
Date: Thu, 12 Nov 2026 13:00:04 +0200
Message-ID: <20261112110008.1229-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On my device the firmware sometimes crashes during the cold boot of a
resume from s2idle (no WoWLAN, so the device is powered down in
suspend). Without these patches the driver does not recover: the resume
takes 20 s longer, pci_pm_resume returns -110 and the device is dead
until a reboot. Patches 1 and 2 fix that. Patches 3 and 4 fix two
oopses I hit when the firmware crashed more than once in a row while
testing them.

Platform: OnePlus Pad 3 (SM8750) with a WCN7880 hw2.0 (PCI 17cb:110e),
firmware WLAN.GNG.1.0-03342-QCAGNGSWPL_V1.0_V2.0_SILICONZ-1.81206.153.
ath-next does not support this chip; I run it with an out-of-tree patch
that adds it as a WCN7850 derivative, on v7.3-rc5 plus board patches.
For that reason the patches carry no Tested-on tag. On ath-next
(ff4c7359e310) the series is only build tested.

The firmware crash itself is not addressed here; I am sending a
separate report about it. It happened in 1 of 64 and in 1 of 240
suspend cycles.

Tests, all on the tree described above:

- Patches 1-3, crash forced with ath12k_mhi_force_rddm() at the
  ATH12K_QMI_EVENT_FW_READY event of the resume boot: 6 of 6 resumes
  recovered, the link was back 16 s after the resume (6 s without a
  crash). The same build without patch 1 fails like the natural crash
  ("Service connect timeout", "failed to connect to HTT: -110").
- Patches 1-3, no forced crash: 240 suspend cycles, the firmware
  crashed once and the driver recovered, 16 s.
- Patch 4, two forced crashes in a row, the second 3 to 9 s after
  "pdev 0 successfully recovered", followed by "iw scan trigger":
  without the patch the oops in 2 of 2 runs, on the first pair; with
  it 12 pairs without one.

The test hook is not part of the series; I can post it if it is of
use.

Two things I would like comments on:

- Patch 2 lets ath12k_core_resume() return while the reset is still
  running. The alternative I tried, keeping the MHI devices over the
  reset as suspend does (ath12k_hif_power_down(ab, true)), does not
  work: QMI stays silent after the second power up.
- With the series a crash during resume still ends in "Hardware became
  unavailable upon resume" from ieee80211_reconfig(), as the device is
  not up yet when mac80211 resumes, and userspace has to bring the
  interface up again. That is where the 16 s come from. I have not
  tried to change that.

I used an AI assistant (Claude) for the analysis and to draft the
patches and their descriptions; I reviewed the result and ran the tests
on my device.

Vladyslav Tymoshchuk (4):
  wifi: ath12k: disable and enable the CE interrupts only once
  wifi: ath12k: do not wait in resume for a reset that cannot finish
    there
  wifi: ath12k: unregister the thermal devices of a radio only once
  wifi: ath12k: skip the links without a radio when a scan fails

 drivers/net/wireless/ath/ath12k/core.c    | 6 ++++++
 drivers/net/wireless/ath/ath12k/core.h    | 1 +
 drivers/net/wireless/ath/ath12k/mac.c     | 3 +++
 drivers/net/wireless/ath/ath12k/pci.c     | 6 ++++--
 drivers/net/wireless/ath/ath12k/thermal.c | 2 +-
 5 files changed, 15 insertions(+), 3 deletions(-)


base-commit: ff4c7359e310744a7abe53cf66d921fa2969eb19
-- 
2.43.0

