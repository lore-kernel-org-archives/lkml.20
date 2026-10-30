Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377251;
	b=RMvCXLjLQBDkDmVClEq1cFvSkgDozrnOYdw0RLwvjxYHnQB5GU0xNxStrr9MHJp6kELE
	 vM2jSDrdZma/JRUZI8Kll6qynF0nRSO8EpPAkqcN0F0k3akuMUPSH6uMOkBNiYI+3j6Px
	 O0I1cdd3QmssKpM5CL3xvAoJsS5zKmbQAoOFTEwHhufyWFJ1vV4T8zqZVU35Vi+XlUwIl
	 SQCnT8650iwodcgXkO7sGV2mTUF0/z14sSH3zXjKgpNzNC+gm3Be7kySswe6VVEEDYA4B
	 H87SUmzcQ2UD7iIkMM+VAAoter0BY/rlUwMJh4TFWpBjn9S+9MSUyk0l6UNbakCA6ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Y0qxUp8kBfnr/dk+xkgp/Wes9AkSXjPM3A7y83JMIdo=;
	b=OS+fL5oaCZzSjy3kCgejENleTRvU7Vacq1qiNdY7zG0VGurNrKy6My9THhyIEWI/dY6t
	 fg+3y0ydmA4WW8keg0TkM8nq1LEipBy1v/Nm15LjUyhuDfE21L23cdyUAFGV/E3tpHxFW
	 e9nOlzSsfy+PpL78UBOFUrMrNypoaQvWfeO2uxY8Fg9q9cg0RHlgFgw7DUN9DN1ZCOFVC
	 /rwHYw3OOFhzWKOdSpaNVI8qcr2pfbiSRhOC2UukD0Ig69KMPSdu2LddflOrFTvIZ8UkG
	 Eri+pnd+qHG9FsAbHbNK3R0IQXpmjWNaqgr3lCAalJeGrMDFpWvq7W7KDkmlDOcRoSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EBkGlNai;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0C1606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D0C1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EBkGlNai
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6dde81a6820so643557eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377249; x=1793982049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y0qxUp8kBfnr/dk+xkgp/Wes9AkSXjPM3A7y83JMIdo=;
        b=EBkGlNaim3mLCi983A5zighQ7n43aKODY1AR6Lr45eP1ck471vLzW2w/YCxaGnMuy7
         iLBif6UY++eM+PkLfUM5DNpAnmlVxIBdIjy3gN9bBzV6vl4NWVG15OuAO377oYVddtDl
         98QpQv5okBGxWw/anzYcaIO2q5SLbuVscOLt9MV9VaL1nk7SZ6nF6+6P9mRJ4tUDrSX6
         hjuVGITTZtQRqxcLVDKMua0JxmkV2OOzrLZTcHUarxoM/Pb+4y2mCY7IN/E9s6U28W49
         ZGOnAJ45TGvngkBGv4pj2UoLRuCMK+Hg7HPfAsF9mrLlQySdF3IZUTshJBClp1nMuT/q
         ZEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377249; x=1793982049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y0qxUp8kBfnr/dk+xkgp/Wes9AkSXjPM3A7y83JMIdo=;
        b=2vlIAxyuFstVzVHfPguAioXUGRVD0n2lcCzRUAK8274gJZzZOGIvUy8Bjl2w4m87+a
         Bpjg0zzsE5m0aqL70FvrEaQw2jKLraxTyl4oD0NMapc8YJwIIQliBaOnZPvPWhuuaIQk
         U8msRceMDWDMG1tngt+sXwWIoic8Fzso8R16Lvp5VxwY3BPeBvpuDvYlN8bw02QzuxgR
         I3XheAAnycjV+5Sdkoqk4o/TlZhZQVd6VwDodLufL7oezVCWB7Unsq6eMNffzOLqurha
         BG4kzqEpzY5BueoAbk0rFZ/dKPWOsk1aYW/ZL6jD/DNzrQmONlnBo3dhdkAVJyBmPr6n
         V9SA==
X-Forwarded-Encrypted: i=1; AKwUvBzPMQuRj1nB6eNjyVTkPFqvAhFI2jb2HYo6yoJTa2azua4AqTtz3sEjBn289BnV23c1JXASeHl+hx+n/jQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFjJUTVXX/OWH93RGsjuTttnHAaf7fDWd6u49mcfLFqJSee66b
	1DPXSpYZXSmcVD9W95vEa9DojmW6gsMTAiDp+0GMoA2GSNU3ZSms1PpvsHdl0xU7rrY=
X-Gm-Gg: AYBFou0VookvYGMeko/DNdLqtZxZIvcDvM+dX6jhchGY7SmsUL4YZWpI3hU/pgmSc+A
	7vYu9+GOLHCnczLLOpuGIMcp//lZGuUwxrsXzNqxyAMEduo+pCAvifA16vVYgmBpYISAtzVGrNI
	EukXPLfY2GN5pbKfg7+5JSWl8qvKTNNTgBnnjJ0ISe7s51qxuOH5kijhdCxoERfLsBMfymje3ID
	TY9NS3/fxvR2n1gdXaQ7vNS5xFwYrOC2ZtkxbAPYJAR2E9EnfMfhi9vo0sxbkuG9hbhm4Dnwt+n
	MIs9WqyTZTA04Gwrwy4Jn1pWBI1VImC2BViQW75LghiMv3ksRv1XmtGAVN40VoV6GDfDYP+f+nD
	uVyinH1QBoztZTGiQMda46YXkSi1iLuXLSKGSKgGuXy+aednREv8VgeOo34nvDSSkhTsgRoYjD3
	Bwh2WvZh368fjBMMmrjpyFO5NUIiSh0hmXJOw/L4HA3DOKTjtE18MGybLNcLxwdMyHp1uq4A7m3
	XeZR6Zjhx+zeAFyDiVTcVXKjysOqzIsS63cTFRRJrOalOHfD82ffd36ooPPueSXa0pqfITCbSDm
	Gh5QWv9qQpo1rabuZYEDAnDdL1L1QeB8q4vS98X4rYIv6EA4HRuMqgH5Hkp2+2hQcV7Jtb1jWUL
	zHV+F9ZD1g79jzj3gOmQLrBM3ANANGD+8edDAV7U/b1FqzT8eE15aAfi58ywYNskYvF4zIMB5p6
	9/rtEsvhVPmy9sLd4=
X-Received: by 2002:a05:6820:7082:10b0:70d:9d05:dbf with SMTP id 006d021491bc7-714f27fe3cemr1142319eaf.90.1793377249547;
        Fri, 30 Oct 2026 09:20:49 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167b03csm322536fac.2.2026.10.30.09.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:20:48 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Han Xu <han.xu@nxp.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH v2 0/6] mtd: nand: stop DMA before unmapping on error and timeout paths
Date: Fri, 30 Oct 2026 16:20:35 +0000
Message-Id: <20261030162041.2998170-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
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

This series addresses DMA lifecycle issues in six NAND drivers where
error or timeout paths may unmap buffers before the associated DMA
transfers have stopped. Some paths do not terminate the outstanding
transfers, while others use dmaengine_terminate_all(), which does not
guarantee that the channel has stopped before returning. The patches use
dmaengine_terminate_sync() to ensure that DMA has stopped before
releasing the mappings, and all affected functions already run in a
context where sleeping is permitted.

These issues were identified by a research static analyzer for DMA
lifecycle ordering and have not been validated on hardware. The patches
have only been compile-tested on arm64 with W=1.

Changes in v2:
- Combined the previously submitted patches into a single series, as
  requested by Miquel, and included three additional drivers with
  similar issues (omap2, marvell, and sh_flctl).
- Removed the code comment from the gpmi patch.
- Left qpic_common and stm32_fmc2 unchanged from their earlier
  submissions.

Two questions remain for the qpic_common patch. The BAM driver warns
that resetting a pipe while the attached engine is still active may
cause a fatal error, so it is unclear whether the NAND controller must
be stopped or reset before terminating the DMA channels. The success
path also assumes that completion of the final command descriptor
guarantees completion of the RX data descriptor, which may need
confirmation from the hardware maintainers.

v1:
https://lore.kernel.org/all/20261030143945.2923554-1-samarth.colleges@gmail.com/
https://lore.kernel.org/all/20261030150929.2944717-1-samarth.colleges@gmail.com/
https://lore.kernel.org/all/20261030150646.2942368-1-samarth.colleges@gmail.com/
https://lore.kernel.org/all/20261030151843.2953269-1-samarth.colleges@gmail.com/

Samarth Narang (6):
  mtd: rawnand: gpmi: terminate the DMA chain on completion timeout
  mtd: nand: qpic_common: terminate DMA channels on transfer timeout
  mtd: rawnand: stm32_fmc2: retire data DMA before unmapping on errors
  mtd: rawnand: omap2: terminate DMA when prefetch cannot be enabled
  mtd: rawnand: marvell: stop DMA before unmapping on timeout
  mtd: rawnand: sh_flctl: use dmaengine_terminate_sync() on DMA timeout

 drivers/mtd/nand/qpic_common.c             | 11 +++++++++--
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c |  1 +
 drivers/mtd/nand/raw/marvell_nand.c        |  9 +++++----
 drivers/mtd/nand/raw/omap2.c               |  4 +++-
 drivers/mtd/nand/raw/sh_flctl.c            |  2 +-
 drivers/mtd/nand/raw/stm32_fmc2_nand.c     | 13 ++++++++-----
 6 files changed, 27 insertions(+), 13 deletions(-)

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.34.1
