Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792785335;
	b=kcAIuDf9gLR7LM/xVPJX6TBsvcHfeR6Iz7S4EIV0ai1SyqjYNqouzKoLziKzJlDq2zYH
	 lAnJozpHhCMm7apNyIGeR+dT/VSoJ+H3C73zTEbLRbF6X3vEqx2j5iIjeFVbkS/AlrLSg
	 13zUYyINjtHL34KENPbTbY7Gyp946767zayXAYLLmsG7eAK906vQVszuJ+O1oPWHo2+zn
	 g+MlzcJhuxmwvEFwEqaZATZ/8P+V6urtlrgVITexZYDC/TOM+dQaEBQH3aWS0iHtjOBth
	 cepZKVSAtQF79f+ntssiR/FHe5SdqfOzCDxtU2rNogbeJmvcKfY3nOodkXrLGfwcNtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785335;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=8xvwrqQBlQhTkqlhO5GeE8hY/qczaZZlOy7A8TlB+4s=;
	b=IfweMVdRZ5Ix+edre6XIL2lnJkGhKKb41NK5btS4NJdT2ixILiKJwfA19EayI6PMuWE5
	 vJyWGPFqbzRF4J2VMHrU+u/yh8n4e4Kph3f4X5zf821VH0NV8AcNCw+m/vJz5JtCPPCeP
	 JgpGDjQFuYpcdW/nKU5mWJcXs05Vr6GZ6yeT3P151uceoGQcad1Yhhk6Nn+veP6mObKlV
	 Z8O4cSgRQn/Iv7CyyM+MqrMJURyAOI1w0mNemTXmS/uZnbTbQOmGkj5Cc1KtlkovHKs69
	 n6I9XVHyC6DfiOYjCQ9kwfZwRRrzoU8+NGvNigMtAaSqQHLYQqbHrWl7s5Tu4b9mRag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=FvjvuzzP;
	arc=none smtp.remote-ip=185.70.43.16
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4AC60A3804;
	Fri, 23 Oct 2026 19:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF4AC60A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=FvjvuzzP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792785332; x=1793044532;
	bh=8xvwrqQBlQhTkqlhO5GeE8hY/qczaZZlOy7A8TlB+4s=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=FvjvuzzPrTwEHD5nFSk8EWLSM6LzO4p2KsvWk6fc+A/smj0uM4L5zcODubsz6JNNx
	 IPFOkvEHURyh6nw545UEAiYwytdIk+k+rrba36lSsURksYmdv3z4uiTszPkyRpnbri
	 TWs9DqC0UToizT04acuelJs6VCrylpsBfg4pw+ZR+grTA9TL8egvB2txLthoK1Q7Of
	 zfNO1SXzSXwk9k+1yBbeEU7ILlSYSGqpxVk/8HHFUaJRrnIYRP3zNb5vfN5LjAx6D+
	 o9QfFwJLhRg7w2bpD6c4ZQH+aRqsh8dmrCX9tt8zVNEBdS63lOv2M6vmhqTrUbY9Rw
	 k32H7qbzUGn7A==
Date: Fri, 23 Oct 2026 19:55:28 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Valerii Sokolov <valerii.sokolov@pm.me>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, Sarang Sapre <sarang.sapre@intel.com>, Divyamani Tripathi <divyamani.tripathi@intel.com>, Manik Bajpai <manik.bajpai@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Valerii Sokolov <valerii.sokolov@pm.me>
Subject: [PATCH v1 00/11] media: intel/ipu6: bounds, leak, and error handling fixes
Message-ID: <20261023195446.22578-1-valerii.sokolov@pm.me>
Feedback-ID: 17117034:user:proton
X-Pm-Message-ID: d759c95a0847fce6483b6ca1b6b8272dc6a89ca4
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This series fixes bugs in the Intel IPU6 input system (ISYS), Buttress,
DMA/MMU and firmware interface code:

 1    Move the vb2_is_busy() check from VIDIOC_TRY_FMT to VIDIOC_S_FMT, so
      TRY_FMT never returns -EBUSY and S_FMT can no longer overwrite
      av->pix_fmt with an unvalidated format while buffers are allocated.
 2    Return firmware message buffers to the free pool when sending a
      stream start or capture command fails.
 3    Bound the number of input and output pins in
      ipu6_isys_fw_pin_cfg().
 4    Clamp the crop top offset in ipu6_isys_csi2_set_sel().
 5    Only call auxiliary device ISRs for interrupts that belong to them.
 6    Release the firmware context when ipu6_fw_com_open() fails.
 7-10 DMA/MMU fixes: an IOVA leak and a silently ignored mapping failure
      in the scatterlist mapping helpers, a missing DMA unmap of the dummy
      L2 page table, and a dev_err(NULL, ...).
11    Log the correct frame sequence number on EOF (debug only).

Patches 1, 3, 4 and 8 are tagged for stable. The other fixes address
bounded leaks or cosmetic issues.

The IPU7 code recently added to this driver appears to have the same
issues as patches 3 and 11 (ipu7_isys_fw_pin_cfg() and
ipu7_isys_isr_one()). I have left those alone as I have no IPU7 hardware
to test on.

Testing: each patch was build-tested with W=3D1 on top of
media-committers/next, and the series was runtime-tested on a Raptor
Lake laptop (Lenovo ThinkPad X1 Carbon Gen 11, OV2740 sensor).

Signed-off-by: Valerii Sokolov <valerii.sokolov@pm.me>

Valerii Sokolov (11):
  media: intel/ipu6: move busy check to ipu6_isys_vidioc_s_fmt_vid_cap()
  media: intel/ipu6: fix firmware message buffer leak on send failure
  media: intel/ipu6: check pin bounds in ipu6_isys_fw_pin_cfg()
  media: intel/ipu6: clamp crop top offset in ipu6_isys_csi2_set_sel()
  media: intel/ipu6: check irq_status mask before calling subdevice ISR
  media: intel/ipu6: clean up fwctx on ipu6_fw_com_open() failure
  media: intel/ipu6: fix IOVA leak on first entry failure in
    ipu6_dma_map_sg()
  media: intel/ipu6: return an error from ipu6_dma_map_sgtable() on
    failure
  media: intel/ipu6: unmap the dummy L2 page table in ipu6_mmu_destroy()
  media: intel/ipu6: pass the device to dev_err() in ipu6_mmu_unmap()
  media: intel/ipu6: fix EOF sequence logging in ipu6_isys_isr_one()

 drivers/media/pci/intel/ipu6/ipu6-buttress.c   |  3 ++-
 drivers/media/pci/intel/ipu6/ipu6-dma.c        |  9 ++++++---
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c    | 10 ++++++++--
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c  |  2 ++
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c |  4 +++-
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c |  7 ++++---
 drivers/media/pci/intel/ipu6/ipu6-mmu.c        |  5 +++--
 7 files changed, 28 insertions(+), 12 deletions(-)


base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
--=20
2.56.0


