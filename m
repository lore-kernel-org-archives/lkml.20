Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793740247;
	b=U8mKA6tf3ohddIYf1qRM4U8N73vkaTD/0FHiEzVwOnM/zco+ShwjI6Q+BsMqv/f8Oz59
	 cJ4/4ulTiPwy/dyqP8xU3o1IGf7A8dpgTqF+J8S46Xt2YYEdOEZP0qLG+ggZLDcLb+mXI
	 YVJW2T2YShvQYsElWWeqBFgKaOAkvCunJfC+ooiJcK1yCRby3O7xQ1SmBe7aNw1eFvO2d
	 Wd4/EWKaSiO/Nw7kbJ2WDy4OKkl6dl7Kl2Gf9vatrPT/FF1z6ypwBoW49yUEqGRoV7ibe
	 MBr+Ki+CEQ+qgcOxMhMv3Miv+w2CMbLhB99cddi1R1SuV6jhCGcm6rPud8+wuboZ6CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740247;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Z/c7thLq9Zvvx1dPeFeesBNXT/hr+K5ZVBzcsSspvNQ=;
	b=CqaJEAxac5BNOxxfOUMOV1FXQVvVa31ldLWBTyCnDDNMFGoipu7h3I2q0wdTD0Mg3Qoc
	 aevj8xIOHVdh+80iHEMDVx8LSkzSScRYrG0ZdB/xg65sk46cwy+qTCFcIOu1oLj2zLgVP
	 vFRV0u2hvchOrgPsLYbDynSI2Setjwfg3apHYGWl4HW2+PWZcOE2jlVe7DrYIFSS62ztk
	 Rm/9MloFmKjY6cni6lxoScL1PUoRtlm636/TAaqEoAo2/eSUwXS5xsYIA1v+jE2YGsmr2
	 YwUt9HO1h68GuSR3S3u8rz6SsurFiYZurRPTdy9nFP9fnlRWZhTKvri25ENmqksrBKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=GaXsA5OG;
	arc=none smtp.remote-ip=109.224.244.18
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD554606D815;
	Tue,  3 Nov 2026 21:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD554606D815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=GaXsA5OG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793740241; x=1793999441;
	bh=Z/c7thLq9Zvvx1dPeFeesBNXT/hr+K5ZVBzcsSspvNQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=GaXsA5OGU5wiRENEWAOMXxq8WpEqLEit3hmpXLgCtDIrQPddu4SJdoRoGLvEts485
	 Ce/6Ho1jFG0hTjJ2q4sJgYjsKb7xvb96F9sFV4lByGbpPc9G8518CzSmBah+CiR9EC
	 xAzEldhajKli+Hb6TDhbsmqQlFW5LlzxqMfAh96L9UwwBiAu9gjFcxYlsE5vy3Dmq4
	 PprlM90WK3xC4RjP8bIkNVxjyCEHo/bh5Z0tZ3qACrBhjiY/91iFJU/UZcbxUKqiz7
	 IDuPXDYx3U0RSXUGxbt+azEoMFJWr5kI+4+uTrt6coIShWMuzliR3rgKfAJwvwlrFa
	 6QjDpoD4VBpKg==
Date: Tue, 03 Nov 2026 21:10:36 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Valerii Sokolov <valerii.sokolov@pm.me>
Cc: Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Antti Laakso <antti.laakso@linux.intel.com>, Sarang Sapre <sarang.sapre@intel.com>, Divyamani Tripathi <divyamani.tripathi@intel.com>, Manik Bajpai <manik.bajpai@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Valerii Sokolov <valerii.sokolov@pm.me>
Subject: [PATCH v2 00/11] media: intel/ipu6: bounds, leak, and error handling fixes
Message-ID: <20261103211031.1573726-1-valerii.sokolov@pm.me>
Feedback-ID: 17117034:user:proton
X-Pm-Message-ID: 172459e04e7abf2cb043cf682b98dbb185fb4691
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

Changes in v2:
- Patch 8: Return the negative error code from ipu6_dma_map_sg() instead
  of checking for 0 in ipu6_dma_map_sgtable() (Sakari Ailus). Omitted
  Antti's Reviewed-by on this patch as the implementation changed.
- Collected Reviewed-by from Antti Laakso on patches 1-7 and 9-11.
- Link to v1:
  https://lore.kernel.org/r/20261023195446.22578-1-valerii.sokolov@pm.me

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
  media: intel/ipu6: return an error from ipu6_dma_map_sg() on failure
  media: intel/ipu6: unmap the dummy L2 page table in ipu6_mmu_destroy()
  media: intel/ipu6: pass the device to dev_err() in ipu6_mmu_unmap()
  media: intel/ipu6: fix EOF sequence logging in ipu6_isys_isr_one()

 drivers/media/pci/intel/ipu6/ipu6-buttress.c   |  3 ++-
 drivers/media/pci/intel/ipu6/ipu6-dma.c        | 10 ++++++----
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c    | 10 ++++++++--
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c  |  2 ++
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c |  4 +++-
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c |  7 ++++---
 drivers/media/pci/intel/ipu6/ipu6-mmu.c        |  5 +++--
 7 files changed, 28 insertions(+), 13 deletions(-)


base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
--=20
2.56.0


