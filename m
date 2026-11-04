Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793805893;
	b=FXSuU6qmd29B9AoTkNGyq4FoqGFRNFXCCpHeHb7rI25KK2XDIBHrN7EZ55HWcJ/Sb2B4
	 UZNORoW+RKNHSDroEZnfYO3zQNywi+0VspypIjPYUpsDQAIn0njLHBNukkczhixmw+AUs
	 F0fwlfCFX+oyp3SZkTzi1cw2WadybpoE3NRrZ0ycI70ePMVofJn4wkh45U5eDxrFSZqot
	 o7la1TpDKiobrhI+f4RtsWs37JaZMo1thVqjWKVb2xih+3iZow1xRct2oc5+rTj35L8fL
	 WPc9BII5X5x0bgeaSzEC15zNj1H5LjGyFZ4k2P2gLFM00AfYWme7r0g2goNtOJ1gDbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805893;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=xpZkooV31y8XeCrxswSlMvlMuc9ffbe6HQ7JD8aBNwA=;
	b=ZbAZBN0iiDPHGifue386Jo3P0Q8IkLbxc6qdho3dWfc6P41ZrYC7G16MxouJW4OPpH4m
	 O5YnNcsy7yBs+SOMUZncoz/T+O98cWg8F0wcpWk1FzfShHJ/NJF3d90xErVKZwQtdLGua
	 hxuftaRHyLk3Rp7+1VUEunv1+DHkfuyiEaT4XgjCAi8zpfdx1eGDTEsErThi0HZGcofSo
	 vyb71cC50mvqmAI8XByEWScJ0Ann5CemjxT8yK6MZLZJN530FGRnbe7Rs8gc1AaWy0NkD
	 OWV8alYrnJ2HpBX2VAHNrMdUEGLwsKSQvyjgy+80zt5KQzbkqVbbDgSmDCisuB9oJuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dluzdfs9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BE2606A336;
	Wed,  4 Nov 2026 15:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dluzdfs9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A4271F000C1;
	Wed,  4 Nov 2026 15:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793805892;
	bh=xpZkooV31y8XeCrxswSlMvlMuc9ffbe6HQ7JD8aBNwA=;
	h=From:Date:Subject:To:Cc;
	b=Dluzdfs9L2wE9P6kJ8u3S7So+Wa12RoDecC2qIGFtqJKUMxGYlm0Y0Tb9ynQqPMHN
	 H1AFLZ0iFTNYFg+SKOnLp/G6gWiFQMLjxU/tytKC+yEULZLGKg/tUr+HpGbwqqVK3p
	 857YoIRR5TeHyqMkN0tdNA6yHf5jzc7QahpH/z6F2H3vljc/9ArOPGESK45WB57iiK
	 8Pp1zltll/KlQxPKY0d3IWHXgNek2PJDRGVSABUQOk2SsUeyuoXoHGYo5RzdhEztQU
	 /aD6oQ4u7K8G1BK+dRcslqFGlDJiqL/PTidu3GeGRoFgRVHFQ8BvcCBiplJbmPq0pS
	 xA5mbEgoHFNqw==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Date: Wed, 04 Nov 2026 16:24:46 +0100
Subject: [PATCH] media: ti: j721e-csi2rx: Stop DMA on failure in
 sd_enable_streams()
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
Message-Id: <20261104-j721e-csi2rx-crash-sd-enable-streams-v1-1-b77ee38c8dcf@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQrCQAxG4auUrA10hqLiVcRFOvNrU3SUpJVC6
 d0ddflt3lvJYQqnU7OS4a2uz1IRdg2lQcoNrLmaYhv3IbQdj4cYwMk12sLJxAf2zCjS38E+GeT
 hLPkoUZC7FHqqqZfhqstvc7787XM/Ik3fNm3bB7FjH/+IAAAA
X-Change-ID: 20261104-j721e-csi2rx-crash-sd-enable-streams-ad8a2aed4c1b
To: Jai Luthra <jai.luthra@linux.dev>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 Pratyush Yadav <p.yadav@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Rishikesh Donadkar <r-donadkar@ti.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6163;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=vaFSgLWR4VxgiWznyRDzEbr536UF8X1OdAEsBfl4+yA=;
 b=owEBbQGS/pANAwAKARkNHbRmThk1AcsmYgBq605CKigSmyGXozsXv11fBKdnSV/lhTck7bG8S
 2RbNUuQXwmJATMEAAEKAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCautOQgAKCRAZDR20Zk4Z
 NfYAB/9YA8+VNfWtj/VdNJAzlpnPg66FuVRg57QpqiVlnIzbW+kfjEBkkFUqtIFMJa70AR1uNW9
 nOJ8BniCINdl7mNN8ssDTycEccp5hQIV8BlpWouOwVXywTsgNKZ3EaASvSlXVKx2zMKtcH+Fvxj
 ZVUyIBNaM8USxvlJQvlBgdlPtj4dlLASnPaPa6C+WZm7lwKtKPxUkDnhpmoHSQQVNw4xiy2Up9a
 Zj7mwKK3ftiZQZn/cZidGH0x7DadVKhxTdXRAJlkL4OaUa3RAIhOW1Qjj0O1ZobOkJwI/7M8qOM
 8uNOSsW0B1XMRyS8KSewzrb2LQ0GaS18+M4diE8634u7P03Z
X-Developer-Key: i=mkorpershoek@kernel.org; a=openpgp;
 fpr=8234A35B45C0D26B31C1A2DA570338B018144F28

ti_csi2rx_sd_enable_streams() configures some hardware
resources (PIX_RST and shim). It also marks the DMA as active.

When v4l2_subdev_enable_streams() fails in that function, an early
return is done without cleaning up these resources.
This crashes the kernel when the buffer gets unmapped later:

Unable to start streaming: Link has been severed (67).
[ 4492.749621] Unable to handle kernel paging request at virtual address fffffdffd829c388
[ 4492.762081] Mem abort info:
[ 4492.764862]   ESR = 0x0000000096000006
[ 4492.768606]   EC = 0x25: DABT (current EL), IL = 32 bits
[ 4492.773913]   SET = 0, FnV = 0
[ 4492.776956]   EA = 0, S1PTW = 0
[ 4492.780090]   FSC = 0x06: level 2 translation fault
[ 4492.784959] Data abort info:
[ 4492.787835]   ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
[ 4492.793311]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[ 4492.798359]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[ 4492.803663] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000c58227000
[ 4492.810358] [fffffdffd829c388] pgd=0000000000000000, p4d=1000000ffbf4f403, pud=1000000ffbf4e403, pmd=0000000000000000
[ 4492.820959] Internal error: Oops: 0000000096000006 [#1]  SMP
[ 4492.826602] Modules linked in: imx219 v4l2_cci ds90ub953 mux_gpio j721e_csi2rx ds90ub960 cdns_csi2rx wave5 videobuf2_dma_contig videobuf2_memops v4l2_fwnode v4l2_mem2mem videobuf2_v4l2 videobuf2_common v4l2_async at24 m_can_platform videodev k3_j72xx_bandgap ti_k3_dsp_remoteproc mc m_can can_dev mc_evbase i2c_atr
onboard_usb_dev fuse zram zsmalloc rpmsg_ctrl rpmsg_char cdns display_connector omap_hwspinlock ti_k3_r5_remoteproc phy_can_transceiver tidss ti_k3_common omap_mailbox drm_client_lib drm_dma_helper cdns_mhdp8546 ti_tfp410 drm_display_helper drm_kms_helper cec sa2ul cdns_dphy_rx drm cdns3_ti rti_wdt drm_panel_orientat
ion_quirks backlight dm_mirror dm_region_hash dm_log dm_mod
[ 4492.887132] CPU: 3 UID: 0 PID: 1457 Comm: yavta Not tainted 7.2.0-rc1-00371-g40ef2669cb4a #86 PREEMPT
[ 4492.896417] Hardware name: ti Texas Instruments AM69 SK/Texas Instruments AM69 SK, BIOS 2027.01-rc1-00132-gee9fc27f2a2a 01/01/2027
[ 4492.908128] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[ 4492.915071] pc : __zap_vma_range+0x5c8/0x1500
[ 4492.919427] lr : __zap_vma_range+0x5bc/0x1500
[ 4492.923770] sp : ffff800087c438e0
[ 4492.927070] x29: ffff800087c439e0 x28: ffff800087c43aa8 x27: 0000ffffb720c000
[ 4492.934189] x26: ffff00080dfd2060 x25: fffffdffd829c380 x24: ffff00080dfd2060
[ 4492.941307] x23: 000000068a70efc3 x22: 0000ffffb720c000 x21: 0000000000000000
[ 4492.948427] x20: ffff800087c43a58 x19: 0000ffffb72f9000 x18: 0000000000000000
[ 4492.955545] x17: 0000000000000000 x16: 0000000000000000 x15: 0000ffffb72f9000
[ 4492.962663] x14: 0000000000000000 x13: 0000ffffb7eacfff x12: 0000ffffb70fe000
[ 4492.969781] x11: 0000ffffb7ea1fff x10: 0000ffffb7e9ffff x9 : 0000ffffb7ed9fff
[ 4492.976899] x8 : ffff800087c43b28 x7 : 0000000000000000 x6 : ffff00080a621dc8
[ 4492.984018] x5 : 0000ffffb720c000 x4 : 0000000000ffffff x3 : 00000000000000ed
[ 4492.991137] x2 : 000000068a70efc3 x1 : ffffc1ffc0000000 x0 : fffffdffd829c380
[ 4492.998255] Call trace:
[ 4493.000690]  __zap_vma_range+0x5c8/0x1500 (P)
[ 4493.005035]  unmap_vmas+0x54/0x11c
[ 4493.008426]  unmap_region+0x84/0xe0
[ 4493.011903]  vms_complete_munmap_vmas+0xec/0x1e0
[ 4493.016506]  do_vmi_align_munmap+0x164/0x1a0
[ 4493.020761]  do_vmi_munmap+0xa8/0x160
[ 4493.024411]  __vm_munmap+0xa8/0x130
[ 4493.027887]  __arm64_sys_munmap+0x20/0x3c
[ 4493.031883]  invoke_syscall.constprop.0+0x40/0x108
[ 4493.036662]  el0_svc_common.constprop.0+0x38/0xd8
[ 4493.041351]  do_el0_svc+0x1c/0x28
[ 4493.044653]  el0_svc+0x20/0x78
[ 4493.047700]  el0t_64_sync_handler+0xa0/0xe4
[ 4493.051870]  el0t_64_sync+0x198/0x19c
[ 4493.055522] Code: 97fffe63 b94013e3 aa0003f9 b4002d40 (f9400400)
[ 4493.061597] ---[ end trace 0000000000000000 ]---
[ 4493.066226] note: yavta[1457] exited with preempt_count 1
[ 4493.071790] ------------[ cut here ]------------

Implement proper clean-up on error handling to avoid this crash.
Also fix the error handling for media_entity_remote_source_pad_unique().

Fixes: 3ed9c0a1fdba ("media: ti: j721e-csi2rx: add multistream support")
Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
---
This can be reproduced on TI AM69-SK with the Arducam FPD V3Link using
2 cameras:

- Configure routing/pixel formats
- Disconnect one camera sensor
- Start a stream using yavta
---
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 022ea3d616c9..865562fa5ec8 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -1208,8 +1208,10 @@ static int ti_csi2rx_sd_enable_streams(struct v4l2_subdev *sd,
 	spin_unlock_irqrestore(&dma->lock, flags);
 
 	remote_pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
-	if (IS_ERR(remote_pad))
-		return PTR_ERR(remote_pad);
+	if (IS_ERR(remote_pad)) {
+		ret = PTR_ERR(remote_pad);
+		goto err_dma;
+	}
 	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
 						       TI_CSI2RX_PAD_SINK,
 						       &streams_mask);
@@ -1217,11 +1219,19 @@ static int ti_csi2rx_sd_enable_streams(struct v4l2_subdev *sd,
 	ret = v4l2_subdev_enable_streams(csi->source, remote_pad->index,
 					 sink_streams);
 	if (ret)
-		return ret;
+		goto err_dma;
 
 	csi->enable_count++;
 
 	return 0;
+
+err_dma:
+	ti_csi2rx_stop_dma(ctx);
+	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
+	if (!csi->enable_count)
+		writel(0, csi->shim + SHIM_CNTL);
+
+	return ret;
 }
 
 static int ti_csi2rx_sd_disable_streams(struct v4l2_subdev *sd,

---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261104-j721e-csi2rx-crash-sd-enable-streams-ad8a2aed4c1b

Best regards,
--  
Mattijs Korpershoek <mkorpershoek@kernel.org>

