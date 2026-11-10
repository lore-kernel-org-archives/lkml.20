Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794339278;
	b=vrL0yBWoS8lw0grdo1rnZ64JCNOk1DDFnm7Isq0MAmViYMh1n+/EuyxXkk/zhSIcde6q
	 KKh5iy0BUwlTer2Uzr4AI+T4X/AwVD2RsdysdF5YZDn6p6+zOH8X0KJvZvqHpRfu8+UJK
	 03MQgjMA+Wk5beRvnpdZMZjtcfxaNkQIoDqP/XTJX2/D1iJM9hRGDa4sibky2PWkF6q3n
	 piEd8uWX5K4SRsthpaZwUeczP2flObN1qqV9tFqcUxNv8fC1vCzkIojlLz2UNYLLma4A7
	 LjgqzjvKVHQ+Ws8bvPikRLgje31ukCCDGOCkhUP8e8qCf5Gt7v+9+e9V52SSI3fAu3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794339278;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=7Xo+D3q+CYGJglJtKmH2crQHUG/R05BYrbzFqkmQD84=;
	b=D6WYxj+PJEQbUePE7gAXhHygq3D+FcJRsS5zito66ArC8UAloIwWh7vEzQAt9YhjWeRV
	 csoCD1PavZYQuCo8+9XQ6QR5IcV699MBdr1zLmzQOeuKJ3qG+IRi3HCK85RZ/jTjV0XNp
	 OaO9em9UQFBUsAV6Kh0YJC47nZWyVyL39cMmHdgXhvG5qlj/7thh39rQM5hFh01Q8Mxlj
	 jJeTWFSlU99ql2pGdyt/OFp9ULynQXkadUIvzZ14jTKPypK1N2mHaIqFTOM7hK6/bnakJ
	 tG8GsLdqXr0s0UDgoh3KpgMBY3jbnUQmLDW1EmsblS8MVeE8me5SBh4hFpSljMGgUBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="a/RdyrEB";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB9B606A320;
	Tue, 10 Nov 2026 19:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a/RdyrEB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48F5C1F0089F;
	Tue, 10 Nov 2026 19:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794339276;
	bh=7Xo+D3q+CYGJglJtKmH2crQHUG/R05BYrbzFqkmQD84=;
	h=Date:From:To:Cc:Subject;
	b=a/RdyrEBG8B0E3qJzHam27jAyQK0oBY/I4EmIBKyuYkDhGJA5ZBeg42RPoSTp3/Jg
	 ozm2TMLnciDtYAxKddBhsJ9l+GRhVK4UGlDc7VlhQmpEnn+JpTmeAsvTXF9+HEObVx
	 BErCzCmrdGoA8gGnkQ/ezOvsAnfLTRzUUnu4/qyzcXm0FxM33dpUrSwn/w+Rg3f5VO
	 K9qFg8cHuy9+RPtXt00urL7F52HRP5ZYohKzLGi8Dm1Eak/yvLAFd9p8fDo3Y57T9/
	 nv37Bh9JW1x6ffn5e9h6kmdade1PCDU4qpsT/TyZGtQr16AAEvWyvOJNK8bTDA0EOL
	 dzks5umntiZhw==
Date: Tue, 10 Nov 2026 19:34:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Alex Hung <alex.hung@amd.com>,
	Asad Kamal <asad.kamal@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	Heng Zhou <Heng.Zhou@amd.com>, Ivan Lipski <ivan.lipski@amd.com>,
	Jesse Zhang <Jesse.Zhang@amd.com>,
	John Harrison <John.Harrison@igalia.com>,
	Kees Cook <kees@kernel.org>, Kees Cook <kees+treewide@kernel.org>,
	Kenneth Feng <kenneth.feng@amd.com>,
	Kevin Wang <kevin.wang@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Luqmaan Irshad <luqmaan.irshad@amd.com>,
	Maxime Ripard <mripard@kernel.org>, Ray Wu <ray.wu@amd.com>,
	Sunil Khatri <sunil.khatri@amd.com>,
	Tom Chung <chiahsuan.chung@amd.com>
Subject: linux-next: manual merge of the amdgpu tree with the origin tree
Message-ID: <avNxxfHK_Zh2GN2o@sirena.org.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XIUw+ZzEVHJD1wTf"
Content-Disposition: inline


--XIUw+ZzEVHJD1wTf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got conflicts in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
  drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
  drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_crtc_test.c
  drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_irq_test.c
  drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
  drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
  drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_8_ppt.h

between commits:

  0af298e62e5cf ("treewide: refresh kmalloc_obj() conversions")
  e5e23f4d97d3e ("drm/amdgpu: dm: Switch to drm_atomic_helper_connector_cre=
ate_state")
  6027db7db7737 ("drm/amd/pm: preserve committed OD features for SMU 13.0.0=
/13.0.7")
  44d0d3031e479 ("drm/amd/pm:restate all customized OD features on every ta=
ble upload for smu 13.0.0/smu 14.0.2")
  947da95066248 ("drm/amdgpu: wake the GPU for INFO queries that access the=
 hardware")
  4c2c17f639b39 ("drm/amd/pm: Notify node unload during driver unload")
  0c8b2a9b97852 ("drm/amd/pm: Add NPM metrics reads and SetNpmLimit")
  1afded4c7642e ("drm/amd/pm: Add set_npm_limit function")

=66rom the origin tree and commits:

  184c9b0c4bd16 ("drm/amdgpu/gfx12: program the SPM VMID once the RLC runs")
  b1680aea938dd ("drm/amd/display: Fix use-after-free in dm_test_hpd_rx_off=
load_work_msg_rdy")
  907aebc5578ae ("drm/amdgpu/gfx12: disallow GFXOFF while updating the SPM =
VMID")
  5c99c1a6f168c ("drm/amd/pm: Add a metrics revision for SMU 15.0.8")
  3888e12e4cd5a ("drm/amd/pm: Report SMU 15.0.8 XGMI bandwidth")
  ea449fd526d2c ("drm/amdgpu/gfx12: flush the scratch register write in the=
 ring test")
  a5b825c0c583c ("drm/amd/display: Assert NOT_NULL on allocs")
  137f79a560320 ("drm/amd/display: Use kunit_kcalloc for arrays")
  adf63026e1fa7 ("drm/amd/pm: preserve committed OD features for SMU 13.0.0=
/13.0.7")
  d2c1e98658b6c ("drm/amd/pm: report smu energy accumulator updates")
  1b63bb397db20 ("drm/amd/pm:restate all customized OD features on every ta=
ble upload for smu 13.0.0/smu 14.0.2")
  d0cf969e9fdc5 ("drm/amd/display: fix NULL dc deref in hpd_init KUnit test=
s")
  f9fcae49dfef2 ("drm/amdgpu: return copy errors from AMDGPU_INFO_UQ_FW_ARE=
AS")
  09e125304063e ("drm/amdgpu: defer XCP DRM device free until primary relea=
se")
  90b1b26bb030d ("drm/amdgpu: remove the unused ring parameter from update_=
spm_vmid()")
  0788f801df5ad ("drm/amdgpu: use spm_vmid for the default RLC SPM VMID")
  6c056350226aa ("drm/amdkfd: fix lost wakeup in interrupt drain on debugge=
d process exit")
  f02d796d69b68 ("drm/amdgpu/gfx_v12_0: Remove legacy CP programming")
  002bf1a555a0c ("drm/amdgpu: store the user-queue VMID mask instead of fir=
st_kfd_vmid")
  5ee0ab19c2c0e ("drm/amdgpu: wake the GPU for INFO queries that access the=
 hardware")
  8b810d7825aa9 ("drm/amd/pm: Notify node unload during driver unload")
  f918ad983d61e ("drm/amd/pm: Add NPM metrics reads and SetNpmLimit")
  65d4256d3cf01 ("drm/amd/pm: Add set_npm_limit function")

=66rom the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 335c523592bfa,7c9c58af06583..0000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@@ -919,7 -919,8 +919,7 @@@ int amdgpu_info_ioctl(struct drm_devic
  		if (ret)
  			return ret;
 =20
 -		regs =3D kmalloc_array(info->read_mmr_reg.count, sizeof(*regs),
 -				     GFP_KERNEL);
 +		regs =3D kmalloc_objs(*regs, info->read_mmr_reg.count);
  		if (!regs)
  			return -ENOMEM;
 =20
@@@ -1430,24 -1431,24 +1430,24 @@@
  				return ret;
 =20
  			ret =3D copy_to_user(out, &meta_info,
- 						min((size_t)size, sizeof(meta_info))) ? -EFAULT : 0;
- 			return 0;
+ 						min((size_t)size, sizeof(meta_info)));
+ 			return ret ? -EFAULT : 0;
  		case AMDGPU_HW_IP_COMPUTE:
  			ret =3D amdgpu_userq_metadata_info_compute(adev, info, &meta_info.comp=
ute);
  			if (ret)
  				return ret;
 =20
  			ret =3D copy_to_user(out, &meta_info,
- 						min((size_t)size, sizeof(meta_info))) ? -EFAULT : 0;
- 			return 0;
+ 						min((size_t)size, sizeof(meta_info)));
+ 			return ret ? -EFAULT : 0;
  		case AMDGPU_HW_IP_DMA:
  			ret =3D amdgpu_userq_metadata_info_sdma(adev, info, &meta_info.sdma);
  			if (ret)
  				return ret;
 =20
  			ret =3D copy_to_user(out, &meta_info,
- 						min((size_t)size, sizeof(meta_info))) ? -EFAULT : 0;
- 			return 0;
+ 						min((size_t)size, sizeof(meta_info)));
+ 			return ret ? -EFAULT : 0;
  		default:
  			return -EINVAL;
  		}
@@@ -1517,7 -1518,7 +1517,7 @@@ int amdgpu_driver_open_kms(struct drm_d
  	if (r < 0)
  		goto pm_put;
 =20
 -	fpriv =3D kzalloc(sizeof(*fpriv), GFP_KERNEL);
 +	fpriv =3D kzalloc_obj(*fpriv);
  	if (unlikely(!fpriv)) {
  		r =3D -ENOMEM;
  		goto out_suspend;
@@@ -1533,6 -1534,8 +1533,8 @@@
  	if (r)
  		goto error_pasid;
 =20
+ 	init_completion(&fpriv->irq_drain_done);
+=20
  	pasid =3D amdgpu_pasid_alloc(16, fpriv);
  	if (pasid < 0) {
  		dev_warn(adev->dev, "No more PASIDs available!");
@@@ -1668,6 -1671,7 +1670,7 @@@ void amdgpu_driver_release_kms(struct d
  {
  	struct amdgpu_device *adev =3D drm_to_adev(dev);
 =20
+ 	amdgpu_xcp_dev_fini(adev);
  	amdgpu_device_fini_sw(adev);
  	pci_set_drvdata(adev->pdev, NULL);
  }
diff --combined drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
index 95f2dbba65852,cb15dad0e57b9..0000000000000
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
@@@ -286,6 -286,8 +286,8 @@@ static void gfx_v12_0_ring_invalidate_t
  					   bool all_hub, uint8_t dst_sel);
  static void gfx_v12_0_set_safe_mode(struct amdgpu_device *adev, int xcc_i=
d);
  static void gfx_v12_0_unset_safe_mode(struct amdgpu_device *adev, int xcc=
_id);
+ static void gfx_v12_0_update_spm_vmid(struct amdgpu_device *adev, int xcc=
_id,
+ 				      unsigned int vmid);
  static void gfx_v12_0_userq_priv_fault_work(struct work_struct *work);
  static void gfx_v12_0_update_perf_clk(struct amdgpu_device *adev,
  				      bool enable);
@@@ -458,6 -460,11 +460,11 @@@ static int gfx_v12_0_ring_test_ring(str
  	int r;
 =20
  	WREG32(scratch, 0xCAFEDEAD);
+ 	/*
+ 	 * Read the value back so the posted write reaches the register before
+ 	 * the CP writes the test value; otherwise it can overwrite the result.
+ 	 */
+ 	RREG32(scratch);
  	r =3D amdgpu_ring_alloc(ring, 5);
  	if (r) {
  		drm_err(adev_to_drm(adev),
@@@ -771,10 -778,6 +778,6 @@@ static int gfx_v12_0_rlc_init(struct am
  			return r;
  	}
 =20
- 	/* init spm vmid with 0xf */
- 	if (adev->gfx.rlc.funcs->update_spm_vmid)
- 		adev->gfx.rlc.funcs->update_spm_vmid(adev, 0, NULL, 0xf);
-=20
  	return 0;
  }
 =20
@@@ -1808,7 -1811,7 +1811,7 @@@ static void gfx_v12_0_init_compute_vmid
  			SCRATCH_APP_BASE;
 =20
  	mutex_lock(&adev->srbm_mutex);
- 	for (i =3D adev->vm_manager.first_kfd_vmid; i < AMDGPU_NUM_VMID; i++) {
+ 	for_each_uq_gfx_vmid(i, adev) {
  		soc24_grbm_select(adev, 0, 0, 0, i);
  		/* CP and shaders */
  		WREG32_SOC15(GC, 0, regSH_MEM_CONFIG, DEFAULT_SH_MEM_CONFIG);
@@@ -2147,6 -2150,12 +2150,12 @@@ static int gfx_v12_0_rlc_resume(struct=20
  		adev->gfx.rlc.funcs->start(adev);
  	}
 =20
+ 	/*
+ 	 * The RLC comes up with RLC_SPM_MC_CNTL cleared, program the SPM VMID
+ 	 * once it runs, also after a GPU reset or a resume.
+ 	 */
+ 	gfx_v12_0_update_spm_vmid(adev, 0, adev->vm_manager.spm_vmid);
+=20
  	return 0;
  }
 =20
@@@ -2714,109 -2723,6 +2723,6 @@@ static int gfx_v12_0_cp_gfx_start(struc
  		     adev->gfx.config.max_hw_contexts - 1);
  	WREG32_SOC15(GC, 0, regCP_DEVICE_ID, 1);
 =20
- 	if (!amdgpu_async_gfx_ring)
- 		gfx_v12_0_cp_gfx_enable(adev, true);
-=20
- 	return 0;
- }
-=20
- static void gfx_v12_0_cp_gfx_switch_pipe(struct amdgpu_device *adev,
- 					 CP_PIPE_ID pipe)
- {
- 	u32 tmp;
-=20
- 	tmp =3D RREG32_SOC15(GC, 0, regGRBM_GFX_CNTL);
- 	tmp =3D REG_SET_FIELD(tmp, GRBM_GFX_CNTL, PIPEID, pipe);
-=20
- 	WREG32_SOC15(GC, 0, regGRBM_GFX_CNTL, tmp);
- }
-=20
- static void gfx_v12_0_cp_gfx_set_doorbell(struct amdgpu_device *adev,
- 					  struct amdgpu_ring *ring)
- {
- 	u32 tmp;
-=20
- 	tmp =3D RREG32_SOC15(GC, 0, regCP_RB_DOORBELL_CONTROL);
- 	if (ring->use_doorbell) {
- 		tmp =3D REG_SET_FIELD(tmp, CP_RB_DOORBELL_CONTROL,
- 				    DOORBELL_OFFSET, ring->doorbell_index);
- 		tmp =3D REG_SET_FIELD(tmp, CP_RB_DOORBELL_CONTROL,
- 				    DOORBELL_EN, 1);
- 	} else {
- 		tmp =3D REG_SET_FIELD(tmp, CP_RB_DOORBELL_CONTROL,
- 				    DOORBELL_EN, 0);
- 	}
- 	WREG32_SOC15(GC, 0, regCP_RB_DOORBELL_CONTROL, tmp);
-=20
- 	tmp =3D REG_SET_FIELD(0, CP_RB_DOORBELL_RANGE_LOWER,
- 			    DOORBELL_RANGE_LOWER, ring->doorbell_index);
- 	WREG32_SOC15(GC, 0, regCP_RB_DOORBELL_RANGE_LOWER, tmp);
-=20
- 	WREG32_SOC15(GC, 0, regCP_RB_DOORBELL_RANGE_UPPER,
- 		     CP_RB_DOORBELL_RANGE_UPPER__DOORBELL_RANGE_UPPER_MASK);
- }
-=20
- static int gfx_v12_0_cp_gfx_resume(struct amdgpu_device *adev)
- {
- 	struct amdgpu_ring *ring;
- 	u32 tmp;
- 	u32 rb_bufsz;
- 	u64 rb_addr, rptr_addr, wptr_gpu_addr;
-=20
- 	/* Set the write pointer delay */
- 	WREG32_SOC15(GC, 0, regCP_RB_WPTR_DELAY, 0);
-=20
- 	/* set the RB to use vmid 0 */
- 	WREG32_SOC15(GC, 0, regCP_RB_VMID, 0);
-=20
- 	/* Init gfx ring 0 for pipe 0 */
- 	mutex_lock(&adev->srbm_mutex);
- 	gfx_v12_0_cp_gfx_switch_pipe(adev, PIPE_ID0);
-=20
- 	/* Set ring buffer size */
- 	ring =3D &adev->gfx.gfx_ring[0];
- 	rb_bufsz =3D order_base_2(ring->ring_size / 8);
- 	tmp =3D REG_SET_FIELD(0, CP_RB0_CNTL, RB_BUFSZ, rb_bufsz);
- 	tmp =3D REG_SET_FIELD(tmp, CP_RB0_CNTL, RB_BLKSZ, rb_bufsz - 2);
- 	tmp =3D REG_SET_FIELD(tmp, CP_RB0_CNTL, KMD_QUEUE, 1);
- 	WREG32_SOC15(GC, 0, regCP_RB0_CNTL, tmp);
-=20
- 	/* Initialize the ring buffer's write pointers */
- 	ring->wptr =3D 0;
- 	WREG32_SOC15(GC, 0, regCP_RB0_WPTR, lower_32_bits(ring->wptr));
- 	WREG32_SOC15(GC, 0, regCP_RB0_WPTR_HI, upper_32_bits(ring->wptr));
-=20
- 	/* set the wb address whether it's enabled or not */
- 	rptr_addr =3D ring->rptr_gpu_addr;
- 	WREG32_SOC15(GC, 0, regCP_RB0_RPTR_ADDR, lower_32_bits(rptr_addr));
- 	WREG32_SOC15(GC, 0, regCP_RB0_RPTR_ADDR_HI, upper_32_bits(rptr_addr) &
- 		     CP_RB_RPTR_ADDR_HI__RB_RPTR_ADDR_HI_MASK);
-=20
- 	wptr_gpu_addr =3D ring->wptr_gpu_addr;
- 	WREG32_SOC15(GC, 0, regCP_RB_WPTR_POLL_ADDR_LO,
- 		     lower_32_bits(wptr_gpu_addr));
- 	WREG32_SOC15(GC, 0, regCP_RB_WPTR_POLL_ADDR_HI,
- 		     upper_32_bits(wptr_gpu_addr));
-=20
- 	mdelay(1);
- 	WREG32_SOC15(GC, 0, regCP_RB0_CNTL, tmp);
-=20
- 	rb_addr =3D ring->gpu_addr >> 8;
- 	WREG32_SOC15(GC, 0, regCP_RB0_BASE, rb_addr);
- 	WREG32_SOC15(GC, 0, regCP_RB0_BASE_HI, upper_32_bits(rb_addr));
-=20
- 	WREG32_SOC15(GC, 0, regCP_RB_ACTIVE, 1);
-=20
- 	gfx_v12_0_cp_gfx_set_doorbell(adev, ring);
- 	mutex_unlock(&adev->srbm_mutex);
-=20
- 	/* Switch to pipe 0 */
- 	mutex_lock(&adev->srbm_mutex);
- 	gfx_v12_0_cp_gfx_switch_pipe(adev, PIPE_ID0);
- 	mutex_unlock(&adev->srbm_mutex);
-=20
- 	/* start the ring */
- 	gfx_v12_0_cp_gfx_start(adev);
  	return 0;
  }
 =20
@@@ -3520,9 -3426,6 +3426,6 @@@ static int gfx_v12_0_kcq_resume(struct=20
  {
  	int i, r;
 =20
- 	if (!amdgpu_async_gfx_ring)
- 		gfx_v12_0_cp_compute_enable(adev, true);
-=20
  	for (i =3D 0; i < adev->gfx.num_compute_rings; i++) {
  		r =3D gfx_v12_0_kcq_init_queue(&adev->gfx.compute_ring[i]);
  		if (r)
@@@ -3553,10 -3456,8 +3456,8 @@@ static int gfx_v12_0_cp_resume(struct a
 =20
  	gfx_v12_0_cp_set_doorbell_range(adev);
 =20
- 	if (amdgpu_async_gfx_ring) {
- 		gfx_v12_0_cp_compute_enable(adev, true);
- 		gfx_v12_0_cp_gfx_enable(adev, true);
- 	}
+ 	gfx_v12_0_cp_compute_enable(adev, true);
+ 	gfx_v12_0_cp_gfx_enable(adev, true);
 =20
  	if (adev->enable_mes_kiq && adev->mes.kiq_hw_init) {
  		r =3D amdgpu_mes_kiq_hw_init(adev, 0);
@@@ -3578,15 -3479,9 +3479,9 @@@
  	if (r)
  		return r;
 =20
- 	if (!amdgpu_async_gfx_ring) {
- 		r =3D gfx_v12_0_cp_gfx_resume(adev);
- 		if (r)
- 			return r;
- 	} else {
- 		r =3D gfx_v12_0_cp_async_gfx_ring_resume(adev);
- 		if (r)
- 			return r;
- 	}
+ 	r =3D gfx_v12_0_cp_async_gfx_ring_resume(adev);
+ 	if (r)
+ 		return r;
 =20
  	for (i =3D 0; i < adev->gfx.num_gfx_rings; i++) {
  		ring =3D &adev->gfx.gfx_ring[i];
@@@ -3902,10 -3797,8 +3797,8 @@@ static int gfx_v12_0_hw_fini(struct amd
  	amdgpu_irq_put(adev, &adev->gfx.priv_reg_irq, 0);
 =20
  	if (!adev->no_hw_access) {
- 		if (amdgpu_async_gfx_ring) {
- 			if (amdgpu_gfx_disable_kgq(adev, 0))
- 				DRM_ERROR("KGQ disable failed\n");
- 		}
+ 		if (amdgpu_gfx_disable_kgq(adev, 0))
+ 			DRM_ERROR("KGQ disable failed\n");
 =20
  		if (amdgpu_gfx_disable_kcq(adev, 0))
  			DRM_ERROR("KCQ disable failed\n");
@@@ -4075,7 -3968,6 +3968,6 @@@ static void gfx_v12_0_update_perf_clk(s
 =20
  static void gfx_v12_0_update_spm_vmid(struct amdgpu_device *adev,
  				      int xcc_id,
- 				      struct amdgpu_ring *ring,
  				      unsigned vmid)
  {
  	u32 reg, data;
@@@ -4095,14 -3987,6 +3987,6 @@@
  	else
  		WREG32_SOC15(GC, 0, regRLC_SPM_MC_CNTL, data);
  	amdgpu_gfx_off_ctrl(adev, true);
-=20
- 	if (ring
- 	    && amdgpu_sriov_is_pp_one_vf(adev)
- 	    && ((ring->funcs->type =3D=3D AMDGPU_RING_TYPE_GFX)
- 		|| (ring->funcs->type =3D=3D AMDGPU_RING_TYPE_COMPUTE))) {
- 		uint32_t reg =3D SOC15_REG_OFFSET(GC, 0, regRLC_SPM_MC_CNTL);
- 		amdgpu_ring_emit_wreg(ring, reg, data);
- 	}
  }
 =20
  static const struct amdgpu_rlc_funcs gfx_v12_0_rlc_funcs =3D {
diff --combined drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_crtc_=
test.c
index abdcf8fd808b9,c130d809098ca..0000000000000
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_crtc_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_crtc_test.c
@@@ -114,7 -114,7 +114,7 @@@ static void dm_test_crtc_vrr_active_irq
  	struct amdgpu_crtc *acrtc =3D kunit_kzalloc(test, sizeof(*acrtc),
  						  GFP_KERNEL);
 =20
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, acrtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, acrtc);
 =20
  	acrtc->dm_irq_params.freesync_config.state =3D VRR_STATE_ACTIVE_VARIABLE;
 =20
@@@ -130,7 -130,7 +130,7 @@@ static void dm_test_crtc_vrr_active_irq
  	struct amdgpu_crtc *acrtc =3D kunit_kzalloc(test, sizeof(*acrtc),
  						  GFP_KERNEL);
 =20
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, acrtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, acrtc);
 =20
  	acrtc->dm_irq_params.freesync_config.state =3D VRR_STATE_ACTIVE_FIXED;
 =20
@@@ -146,7 -146,7 +146,7 @@@ static void dm_test_crtc_vrr_active_irq
  	struct amdgpu_crtc *acrtc =3D kunit_kzalloc(test, sizeof(*acrtc),
  						  GFP_KERNEL);
 =20
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, acrtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, acrtc);
 =20
  	acrtc->dm_irq_params.freesync_config.state =3D VRR_STATE_INACTIVE;
 =20
@@@ -162,7 -162,7 +162,7 @@@ static void dm_test_crtc_vrr_active_irq
  	struct amdgpu_crtc *acrtc =3D kunit_kzalloc(test, sizeof(*acrtc),
  						  GFP_KERNEL);
 =20
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, acrtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, acrtc);
 =20
  	acrtc->dm_irq_params.freesync_config.state =3D VRR_STATE_DISABLED;
 =20
@@@ -178,7 -178,7 +178,7 @@@ static void dm_test_crtc_vrr_active_irq
  	struct amdgpu_crtc *acrtc =3D kunit_kzalloc(test, sizeof(*acrtc),
  						  GFP_KERNEL);
 =20
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, acrtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, acrtc);
 =20
  	acrtc->dm_irq_params.freesync_config.state =3D VRR_STATE_UNSUPPORTED;
 =20
@@@ -197,7 -197,7 +197,7 @@@ static void dm_test_crtc_vrr_active_var
  						       sizeof(*dm_state),
  						       GFP_KERNEL);
 =20
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dm_state);
+ 	KUNIT_ASSERT_NOT_NULL(test, dm_state);
 =20
  	dm_state->freesync_config.state =3D VRR_STATE_ACTIVE_VARIABLE;
 =20
@@@ -214,7 -214,7 +214,7 @@@ static void dm_test_crtc_vrr_active_fix
  						       sizeof(*dm_state),
  						       GFP_KERNEL);
 =20
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dm_state);
+ 	KUNIT_ASSERT_NOT_NULL(test, dm_state);
 =20
  	dm_state->freesync_config.state =3D VRR_STATE_ACTIVE_FIXED;
 =20
@@@ -231,7 -231,7 +231,7 @@@ static void dm_test_crtc_vrr_active_ina
  						       sizeof(*dm_state),
  						       GFP_KERNEL);
 =20
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dm_state);
+ 	KUNIT_ASSERT_NOT_NULL(test, dm_state);
 =20
  	dm_state->freesync_config.state =3D VRR_STATE_INACTIVE;
 =20
@@@ -248,7 -248,7 +248,7 @@@ static void dm_test_crtc_vrr_active_dis
  						       sizeof(*dm_state),
  						       GFP_KERNEL);
 =20
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dm_state);
+ 	KUNIT_ASSERT_NOT_NULL(test, dm_state);
 =20
  	dm_state->freesync_config.state =3D VRR_STATE_DISABLED;
 =20
@@@ -265,7 -265,7 +265,7 @@@ static void dm_test_crtc_vrr_active_uns
  						       sizeof(*dm_state),
  						       GFP_KERNEL);
 =20
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dm_state);
+ 	KUNIT_ASSERT_NOT_NULL(test, dm_state);
 =20
  	dm_state->freesync_config.state =3D VRR_STATE_UNSUPPORTED;
 =20
@@@ -304,7 -304,7 +304,7 @@@ static void dm_test_crtc_is_headless_no
  	struct amdgpu_device *adev =3D kunit_kzalloc(test, sizeof(*adev), GFP_KE=
RNEL);
  	struct drm_device *dev =3D dm_kunit_alloc_drm_with_connector_list(test);
 =20
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev);
  	adev->dm.ddev =3D dev;
 =20
  	KUNIT_EXPECT_TRUE(test, amdgpu_dm_is_headless(adev));
@@@ -320,8 -320,8 +320,8 @@@ static void dm_test_crtc_is_headless_wr
  	struct drm_device *dev =3D dm_kunit_alloc_drm_with_connector_list(test);
  	struct drm_connector *wb =3D kunit_kzalloc(test, sizeof(*wb), GFP_KERNEL=
);
 =20
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, wb);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev);
+ 	KUNIT_ASSERT_NOT_NULL(test, wb);
  	adev->dm.ddev =3D dev;
 =20
  	dm_test_add_connector(dev, wb, DRM_MODE_CONNECTOR_WRITEBACK,
@@@ -340,8 -340,8 +340,8 @@@ static void dm_test_crtc_is_headless_di
  	struct drm_device *dev =3D dm_kunit_alloc_drm_with_connector_list(test);
  	struct drm_connector *display =3D kunit_kzalloc(test, sizeof(*display), =
GFP_KERNEL);
 =20
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, display);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev);
+ 	KUNIT_ASSERT_NOT_NULL(test, display);
  	adev->dm.ddev =3D dev;
 =20
  	dm_test_add_connector(dev, display, DRM_MODE_CONNECTOR_HDMIA,
@@@ -360,8 -360,8 +360,8 @@@ static void dm_test_crtc_is_headless_co
  	struct drm_device *dev =3D dm_kunit_alloc_drm_with_connector_list(test);
  	struct drm_connector *display =3D kunit_kzalloc(test, sizeof(*display), =
GFP_KERNEL);
 =20
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, display);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev);
+ 	KUNIT_ASSERT_NOT_NULL(test, display);
  	adev->dm.ddev =3D dev;
 =20
  	dm_test_add_connector(dev, display, DRM_MODE_CONNECTOR_HDMIA,
@@@ -381,9 -381,9 +381,9 @@@ static void dm_test_crtc_is_headless_mi
  	struct drm_connector *wb =3D kunit_kzalloc(test, sizeof(*wb), GFP_KERNEL=
);
  	struct drm_connector *display =3D kunit_kzalloc(test, sizeof(*display), =
GFP_KERNEL);
 =20
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, wb);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, display);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev);
+ 	KUNIT_ASSERT_NOT_NULL(test, wb);
+ 	KUNIT_ASSERT_NOT_NULL(test, display);
  	adev->dm.ddev =3D dev;
 =20
  	dm_test_add_connector(dev, wb, DRM_MODE_CONNECTOR_WRITEBACK,
@@@ -426,7 -426,7 +426,7 @@@ static void dm_test_crtc_set_vupdate_ir
  	adev =3D dm_kunit_alloc_adev(test);
 =20
  	acrtc =3D kunit_kzalloc(test, sizeof(*acrtc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, acrtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, acrtc);
 =20
  	acrtc->base.dev =3D &adev->ddev;
  	acrtc->otg_inst =3D -1;
@@@ -451,7 -451,7 +451,7 @@@ static void dm_test_crtc_set_vupdate_ir
  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
 =20
  	acrtc =3D kunit_kzalloc(test, sizeof(*acrtc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, acrtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, acrtc);
 =20
  	acrtc->base.dev =3D &adev->ddev;
  	acrtc->otg_inst =3D 0;
@@@ -514,20 -514,19 +514,19 @@@ static void dm_test_crtc_set_vupdate_ir
  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
 =20
  	acrtc =3D kunit_kzalloc(test, sizeof(*acrtc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, acrtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, acrtc);
 =20
  	dc =3D dm_kunit_alloc_dc_with_ctx(test);
  	res_pool =3D kunit_kzalloc(test, sizeof(*res_pool), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, res_pool);
+ 	KUNIT_ASSERT_NOT_NULL(test, res_pool);
  	irqs =3D kunit_kzalloc(test, sizeof(*irqs), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, irqs);
+ 	KUNIT_ASSERT_NOT_NULL(test, irqs);
 =20
  	/*
  	 * Populate the per-source info table so amdgpu_dm_irq_set() succeeds.
  	 */
- 	info =3D kunit_kzalloc(test, sizeof(*info) * DAL_IRQ_SOURCES_NUMBER,
- 			     GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, info);
+ 	info =3D kunit_kcalloc(test, DAL_IRQ_SOURCES_NUMBER, sizeof(*info), GFP_=
KERNEL);
+ 	KUNIT_ASSERT_NOT_NULL(test, info);
  	for (i =3D 0; i < DAL_IRQ_SOURCES_NUMBER; i++)
  		info[i].funcs =3D &dm_test_vupdate_irq_src_funcs;
 =20
@@@ -560,7 -559,7 +559,7 @@@ static void dm_test_idle_create_workque
  	struct idle_workqueue *idle_work;
 =20
  	adev =3D kunit_kzalloc(test, sizeof(*adev), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev);
 =20
  	idle_work =3D idle_create_workqueue(adev);
  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, idle_work);
@@@ -588,7 -587,7 +587,7 @@@ static void dm_test_idle_worker_disable
  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
 =20
  	idle_work =3D kunit_kzalloc(test, sizeof(*idle_work), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, idle_work);
+ 	KUNIT_ASSERT_NOT_NULL(test, idle_work);
 =20
  	idle_work->dm =3D &adev->dm;
  	idle_work->enable =3D false;
@@@ -623,7 -622,7 +622,7 @@@ static void dm_test_idle_worker_enabled
  	adev->dm.dc->idle_optimizations_allowed =3D false;
 =20
  	idle_work =3D kunit_kzalloc(test, sizeof(*idle_work), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, idle_work);
+ 	KUNIT_ASSERT_NOT_NULL(test, idle_work);
 =20
  	idle_work->dm =3D &adev->dm;
  	idle_work->enable =3D true;
@@@ -668,12 -667,12 +667,12 @@@ static void dm_test_idle_worker_enabled
 =20
  	/* A connected display makes amdgpu_dm_is_headless() false. */
  	display =3D kunit_kzalloc(test, sizeof(*display), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, display);
+ 	KUNIT_ASSERT_NOT_NULL(test, display);
  	dm_test_add_connector(adev->dm.ddev, display, DRM_MODE_CONNECTOR_HDMIA,
  			      connector_status_connected);
 =20
  	idle_work =3D kunit_kzalloc(test, sizeof(*idle_work), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, idle_work);
+ 	KUNIT_ASSERT_NOT_NULL(test, idle_work);
  	idle_work->dm =3D &adev->dm;
  	idle_work->enable =3D true;
  	adev->dm.idle_workqueue =3D idle_work;
@@@ -727,7 -726,7 +726,7 @@@ static void dm_test_idle_worker_enabled
  	adev->dm.dc->caps.is_apu =3D true;
  	/* dc_allow() logs via DC_LOG_DEBUG() when it flips the flag. */
  	logger =3D kunit_kzalloc(test, sizeof(*logger), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, logger);
+ 	KUNIT_ASSERT_NOT_NULL(test, logger);
  	logger->dev =3D &adev->ddev;
  	adev->dm.dc->ctx->logger =3D logger;
  	/* dc_allow() only flips the flag when clk_mgr and apply() are present. =
*/
@@@ -736,7 -735,7 +735,7 @@@
  	adev->dm.dc->hwss.apply_idle_power_optimizations =3D dm_test_idle_apply_=
flip;
 =20
  	idle_work =3D kunit_kzalloc(test, sizeof(*idle_work), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, idle_work);
+ 	KUNIT_ASSERT_NOT_NULL(test, idle_work);
  	idle_work->dm =3D &adev->dm;
  	idle_work->enable =3D true;
  	adev->dm.idle_workqueue =3D idle_work;
@@@ -764,7 -763,7 +763,7 @@@ static void dm_test_crtc_set_static_scr
  	struct dc_stream_state *stream;
 =20
  	dm =3D kunit_kzalloc(test, sizeof(*dm), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dm);
+ 	KUNIT_ASSERT_NOT_NULL(test, dm);
 =20
  	link =3D dm_kunit_alloc_link(test);
  	stream =3D dm_kunit_alloc_stream(test, link);
@@@ -790,7 -789,7 +789,7 @@@ static void dm_test_crtc_set_static_scr
  	struct dc_stream_state *stream;
 =20
  	dm =3D kunit_kzalloc(test, sizeof(*dm), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dm);
+ 	KUNIT_ASSERT_NOT_NULL(test, dm);
 =20
  	link =3D dm_kunit_alloc_link(test);
  	stream =3D dm_kunit_alloc_stream(test, link);
@@@ -816,7 -815,7 +815,7 @@@ static void dm_test_crtc_set_static_scr
  	struct dc_stream_state *stream;
 =20
  	dm =3D kunit_kzalloc(test, sizeof(*dm), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dm);
+ 	KUNIT_ASSERT_NOT_NULL(test, dm);
 =20
  	link =3D dm_kunit_alloc_link(test);
  	stream =3D dm_kunit_alloc_stream(test, link);
@@@ -842,7 -841,7 +841,7 @@@ static void dm_test_crtc_enable_vblank_
  	struct amdgpu_crtc *acrtc;
 =20
  	acrtc =3D kunit_kzalloc(test, sizeof(*acrtc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, acrtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, acrtc);
 =20
  	acrtc->base.dev =3D &adev->ddev;
  	acrtc->base.enabled =3D false;
@@@ -926,7 -925,7 +925,7 @@@ static void dm_test_crtc_arm_irq_src(st
  	atomic_t *enabled;
 =20
  	enabled =3D kunit_kzalloc(test, sizeof(*enabled), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, enabled);
+ 	KUNIT_ASSERT_NOT_NULL(test, enabled);
 =20
  	atomic_set(enabled, count);
  	src->num_types =3D 1;
@@@ -970,11 -969,11 +969,11 @@@ dm_test_crtc_setup_enable(struct kunit=20
  	adev->mode_info.num_crtc =3D 1;
 =20
  	reset_domain =3D kunit_kzalloc(test, sizeof(*reset_domain), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, reset_domain);
+ 	KUNIT_ASSERT_NOT_NULL(test, reset_domain);
  	adev->reset_domain =3D reset_domain;
 =20
  	acrtc =3D kunit_kzalloc(test, sizeof(*acrtc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, acrtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, acrtc);
  	acrtc->base.dev =3D &adev->ddev;
  	acrtc->base.funcs =3D &dm_test_crtc_funcs;
  	acrtc->base.enabled =3D true;
@@@ -988,7 -987,7 +987,7 @@@
  	stream =3D dm_kunit_alloc_stream(test, link);
 =20
  	dm_state =3D kunit_kzalloc(test, sizeof(*dm_state), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dm_state);
+ 	KUNIT_ASSERT_NOT_NULL(test, dm_state);
  	dm_state->stream =3D stream;
  	acrtc->base.state =3D &dm_state->base;
 =20
@@@ -1053,16 -1052,15 +1052,15 @@@ static void dm_test_crtc_enable_vblank_
  	acrtc_state->freesync_config.state =3D VRR_STATE_ACTIVE_VARIABLE;
 =20
  	res_pool =3D kunit_kzalloc(test, sizeof(*res_pool), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, res_pool);
+ 	KUNIT_ASSERT_NOT_NULL(test, res_pool);
  	irqs =3D kunit_kzalloc(test, sizeof(*irqs), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, irqs);
+ 	KUNIT_ASSERT_NOT_NULL(test, irqs);
 =20
  	/*
  	 * Per-source .set fails so amdgpu_dm_irq_set() reports the source busy.
  	 */
- 	info =3D kunit_kzalloc(test, sizeof(*info) * DAL_IRQ_SOURCES_NUMBER,
- 			     GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, info);
+ 	info =3D kunit_kcalloc(test, DAL_IRQ_SOURCES_NUMBER, sizeof(*info), GFP_=
KERNEL);
+ 	KUNIT_ASSERT_NOT_NULL(test, info);
  	for (i =3D 0; i < DAL_IRQ_SOURCES_NUMBER; i++)
  		info[i].funcs =3D &dm_test_vupdate_irq_src_busy_funcs;
 =20
@@@ -1286,7 -1284,7 +1284,7 @@@ static struct drm_crtc *dm_test_crtc_se
  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
 =20
  	crtc =3D kunit_kzalloc(test, sizeof(*crtc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, crtc);
  	crtc->dev =3D &adev->ddev;
 =20
  	adev->ip_versions[DCE_HWIP][0] =3D ip_version;
@@@ -1375,7 -1373,7 +1373,7 @@@ static void dm_test_crtc_update_active_
  	struct dm_crtc_state *dm_state;
 =20
  	dm_state =3D kunit_kzalloc(test, sizeof(*dm_state), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dm_state);
+ 	KUNIT_ASSERT_NOT_NULL(test, dm_state);
 =20
  	dm_state->stream =3D NULL;
  	dm_state->active_planes =3D 5;
@@@ -1413,11 -1411,11 +1411,11 @@@ static void dm_test_count_crtc_active_p
  	INIT_LIST_HEAD(&dev->mode_config.plane_list);
 =20
  	state =3D kunit_kzalloc(test, sizeof(*state), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+ 	KUNIT_ASSERT_NOT_NULL(test, state);
  	state->dev =3D dev;
 =20
  	crtc_state =3D kunit_kzalloc(test, sizeof(*crtc_state), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+ 	KUNIT_ASSERT_NOT_NULL(test, crtc_state);
  	crtc_state->state =3D state;
  	crtc_state->plane_mask =3D 0;
 =20
@@@ -1452,15 -1450,15 +1450,15 @@@ static void dm_test_count_crtc_active_p
  	INIT_LIST_HEAD(&dev->mode_config.plane_list);
 =20
  	plane_no_state =3D kunit_kzalloc(test, sizeof(*plane_no_state), GFP_KERN=
EL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane_no_state);
+ 	KUNIT_ASSERT_NOT_NULL(test, plane_no_state);
  	plane_cursor =3D kunit_kzalloc(test, sizeof(*plane_cursor), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane_cursor);
+ 	KUNIT_ASSERT_NOT_NULL(test, plane_cursor);
  	plane_with_fb =3D kunit_kzalloc(test, sizeof(*plane_with_fb), GFP_KERNEL=
);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane_with_fb);
+ 	KUNIT_ASSERT_NOT_NULL(test, plane_with_fb);
  	plane_no_fb =3D kunit_kzalloc(test, sizeof(*plane_no_fb), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane_no_fb);
+ 	KUNIT_ASSERT_NOT_NULL(test, plane_no_fb);
  	plane_excluded =3D kunit_kzalloc(test, sizeof(*plane_excluded), GFP_KERN=
EL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane_excluded);
+ 	KUNIT_ASSERT_NOT_NULL(test, plane_excluded);
 =20
  	dm_test_add_plane(dev, plane_no_state, 0, DRM_PLANE_TYPE_PRIMARY);
  	dm_test_add_plane(dev, plane_cursor, 1, DRM_PLANE_TYPE_CURSOR);
@@@ -1469,19 -1467,19 +1467,19 @@@
  	dm_test_add_plane(dev, plane_excluded, 4, DRM_PLANE_TYPE_PRIMARY);
 =20
  	fb =3D kunit_kzalloc(test, sizeof(*fb), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fb);
+ 	KUNIT_ASSERT_NOT_NULL(test, fb);
  	ps_fb =3D kunit_kzalloc(test, sizeof(*ps_fb), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ps_fb);
+ 	KUNIT_ASSERT_NOT_NULL(test, ps_fb);
  	ps_fb->fb =3D fb;
  	ps_no_fb =3D kunit_kzalloc(test, sizeof(*ps_no_fb), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ps_no_fb);
+ 	KUNIT_ASSERT_NOT_NULL(test, ps_no_fb);
  	ps_no_fb->fb =3D NULL;
 =20
  	state =3D kunit_kzalloc(test, sizeof(*state), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+ 	KUNIT_ASSERT_NOT_NULL(test, state);
  	state->dev =3D dev;
- 	state->planes =3D kunit_kzalloc(test, sizeof(*state->planes) * 5, GFP_KE=
RNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state->planes);
+ 	state->planes =3D kunit_kcalloc(test, 5, sizeof(*state->planes), GFP_KER=
NEL);
+ 	KUNIT_ASSERT_NOT_NULL(test, state->planes);
  	state->planes[0].new_state =3D NULL;
  	state->planes[1].new_state =3D ps_fb;
  	state->planes[2].new_state =3D ps_fb;
@@@ -1489,7 -1487,7 +1487,7 @@@
  	state->planes[4].new_state =3D ps_fb;
 =20
  	crtc_state =3D kunit_kzalloc(test, sizeof(*crtc_state), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+ 	KUNIT_ASSERT_NOT_NULL(test, crtc_state);
  	crtc_state->state =3D state;
  	/* Exclude plane index 4 from the CRTC. */
  	crtc_state->plane_mask =3D BIT(0) | BIT(1) | BIT(2) | BIT(3);
@@@ -1514,9 -1512,9 +1512,9 @@@ static void dm_test_crtc_duplicate_stat
  	struct dm_crtc_state *dm_dup;
 =20
  	crtc =3D kunit_kzalloc(test, sizeof(*crtc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, crtc);
  	cur =3D kunit_kzalloc(test, sizeof(*cur), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cur);
+ 	KUNIT_ASSERT_NOT_NULL(test, cur);
 =20
  	cur->abm_level =3D 3;
  	cur->active_planes =3D 2;
@@@ -1560,9 -1558,9 +1558,9 @@@ static void dm_test_crtc_duplicate_stat
  	struct dc_link *link;
 =20
  	crtc =3D kunit_kzalloc(test, sizeof(*crtc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, crtc);
  	cur =3D kunit_kzalloc(test, sizeof(*cur), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cur);
+ 	KUNIT_ASSERT_NOT_NULL(test, cur);
 =20
  	link =3D dm_kunit_alloc_link(test);
  	stream =3D dm_kunit_alloc_stream(test, link);
@@@ -1595,7 -1593,7 +1593,7 @@@ static void dm_test_crtc_duplicate_stat
  	struct drm_crtc *crtc;
 =20
  	crtc =3D kunit_kzalloc(test, sizeof(*crtc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, crtc);
  	crtc->state =3D NULL;
 =20
  	KUNIT_EXPECT_NULL(test, amdgpu_dm_crtc_duplicate_state(crtc));
@@@ -1628,8 -1626,8 +1626,8 @@@ static void dm_test_crtc_destroy_cleans
  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane);
 =20
  	/* amdgpu_dm_crtc_destroy() kfree()s the CRTC, so use a plain alloc. */
 -	acrtc =3D kzalloc_obj(*acrtc, GFP_KERNEL);
 +	acrtc =3D kzalloc_obj(*acrtc);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, acrtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, acrtc);
 =20
  	ret =3D drm_crtc_init_with_planes(&adev->ddev, &acrtc->base, plane,
  					NULL, &dm_test_crtc_funcs, NULL);
@@@ -1657,7 -1655,7 +1655,7 @@@ static void dm_test_crtc_create_state_a
  	struct drm_crtc *crtc;
 =20
  	crtc =3D kunit_kzalloc(test, sizeof(*crtc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, crtc);
  	crtc->dev =3D &adev->ddev;
  	crtc->state =3D NULL;
 =20
@@@ -1686,7 -1684,7 +1684,7 @@@ static void dm_test_crtc_reset_state_re
  	struct dc_link *link;
 =20
  	crtc =3D kunit_kzalloc(test, sizeof(*crtc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, crtc);
  	crtc->dev =3D &adev->ddev;
 =20
  	link =3D dm_kunit_alloc_link(test);
@@@ -1695,8 -1693,8 +1693,13 @@@
  	kref_get(&stream->refcount);
 =20
  	/* reset_state kfree()s the old state, so use a plain (unmanaged) alloc.=
 */
++<<<<<<< HEAD
 +	old =3D kzalloc_obj(*old);
 +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old);
++=3D=3D=3D=3D=3D=3D=3D
+ 	old =3D kzalloc_obj(*old, GFP_KERNEL);
+ 	KUNIT_ASSERT_NOT_NULL(test, old);
++>>>>>>> amdgpu/drm-next
  	old->stream =3D stream;
  	crtc->state =3D &old->base;
 =20
@@@ -1725,7 -1723,7 +1728,7 @@@ static void dm_test_crtc_destroy_state_
 =20
  	/* destroy_state kfree()s the state, so use a plain (unmanaged) alloc. */
  	dm_state =3D kzalloc_obj(*dm_state);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dm_state);
+ 	KUNIT_ASSERT_NOT_NULL(test, dm_state);
 =20
  	amdgpu_dm_crtc_destroy_state(NULL, &dm_state->base);
  }
@@@ -1755,7 -1753,7 +1758,7 @@@ static void dm_test_crtc_destroy_state_
 =20
  	/* destroy_state kfree()s the state, so use a plain (unmanaged) alloc. */
  	dm_state =3D kzalloc_obj(*dm_state);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dm_state);
+ 	KUNIT_ASSERT_NOT_NULL(test, dm_state);
  	dm_state->stream =3D stream;
 =20
  	amdgpu_dm_crtc_destroy_state(NULL, &dm_state->base);
@@@ -1783,7 -1781,7 +1786,7 @@@ static void dm_test_crtc_handle_vblank_
  	KUNIT_ASSERT_EQ(test, drm_vblank_init(&adev->ddev, 1), 0);
 =20
  	acrtc =3D kunit_kzalloc(test, sizeof(*acrtc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, acrtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, acrtc);
  	acrtc->base.dev =3D &adev->ddev;
  	acrtc->event =3D NULL;
 =20
@@@ -1811,9 -1809,9 +1814,9 @@@ static void dm_test_crtc_handle_vblank_
  	KUNIT_ASSERT_EQ(test, drm_vblank_init(&adev->ddev, 1), 0);
 =20
  	acrtc =3D kunit_kzalloc(test, sizeof(*acrtc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, acrtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, acrtc);
  	event =3D kunit_kzalloc(test, sizeof(*event), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, event);
+ 	KUNIT_ASSERT_NOT_NULL(test, event);
 =20
  	acrtc->base.dev =3D &adev->ddev;
  	acrtc->base.funcs =3D &dm_test_crtc_funcs;
@@@ -1850,11 -1848,11 +1853,11 @@@ static void dm_test_crtc_handle_vblank_
  	KUNIT_ASSERT_EQ(test, drm_vblank_init(&adev->ddev, 1), 0);
 =20
  	acrtc =3D kunit_kzalloc(test, sizeof(*acrtc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, acrtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, acrtc);
 =20
  	/* drm_crtc_send_vblank_event() consumes (kfree()s) the event. */
  	event =3D kzalloc_obj(*event);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, event);
+ 	KUNIT_ASSERT_NOT_NULL(test, event);
 =20
  	acrtc->base.dev =3D &adev->ddev;
  	acrtc->base.funcs =3D &dm_test_crtc_funcs;
@@@ -1907,7 -1905,7 +1910,7 @@@ dm_test_vblank_control_worker_setup(str
  	adev->dm.active_vblank_irq_count =3D count;
 =20
  	acrtc =3D kunit_kzalloc(test, sizeof(*acrtc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, acrtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, acrtc);
  	acrtc->base.dev =3D &adev->ddev;
  	acrtc->base.state =3D NULL;
 =20
@@@ -1918,7 -1916,7 +1921,7 @@@
 =20
  	/* Worker kfree()s the work item, so it must be a plain allocation. */
  	work =3D kzalloc_obj(*work);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, work);
+ 	KUNIT_ASSERT_NOT_NULL(test, work);
  	work->dm =3D &adev->dm;
  	work->acrtc =3D acrtc;
  	work->stream =3D stream;
@@@ -2012,7 -2010,7 +2015,7 @@@ static void dm_test_crtc_disable_vblank
  	adev->irq.installed =3D false;
 =20
  	acrtc =3D kunit_kzalloc(test, sizeof(*acrtc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, acrtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, acrtc);
  	acrtc->base.dev =3D &adev->ddev;
  	acrtc->crtc_id =3D 0;
 =20
@@@ -2047,7 -2045,7 +2050,7 @@@ static void dm_test_crtc_disable_vblank
  	adev->irq.installed =3D true;
 =20
  	reset_domain =3D kunit_kzalloc(test, sizeof(*reset_domain), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, reset_domain);
+ 	KUNIT_ASSERT_NOT_NULL(test, reset_domain);
  	adev->reset_domain =3D reset_domain;
 =20
  	/* Seed with 2 so amdgpu_irq_put() drops to a non-zero refcount. */
@@@ -2055,7 -2053,7 +2058,7 @@@
  	dm_test_crtc_arm_irq_src(test, &adev->pageflip_irq, 2);
 =20
  	acrtc =3D kunit_kzalloc(test, sizeof(*acrtc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, acrtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, acrtc);
  	acrtc->base.dev =3D &adev->ddev;
  	acrtc->crtc_id =3D 0;
  	/* OTG unassigned -> amdgpu_dm_crtc_set_vupdate_irq() returns 0 early. */
@@@ -2098,7 -2096,7 +2101,7 @@@ static void dm_test_crtc_disable_vblank
  	adev->irq.installed =3D true;
 =20
  	reset_domain =3D kunit_kzalloc(test, sizeof(*reset_domain), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, reset_domain);
+ 	KUNIT_ASSERT_NOT_NULL(test, reset_domain);
  	adev->reset_domain =3D reset_domain;
 =20
  	/* Seed with 2 so amdgpu_irq_put() drops to a non-zero refcount. */
@@@ -2106,7 -2104,7 +2109,7 @@@
  	dm_test_crtc_arm_irq_src(test, &adev->pageflip_irq, 2);
 =20
  	acrtc =3D kunit_kzalloc(test, sizeof(*acrtc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, acrtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, acrtc);
  	acrtc->base.dev =3D &adev->ddev;
  	acrtc->crtc_id =3D 0;
  	acrtc->otg_inst =3D -1;
@@@ -2118,7 -2116,7 +2121,7 @@@
 =20
  	/* CRTC state with no stream -> the stream-retain branch is skipped. */
  	dm_state =3D kunit_kzalloc(test, sizeof(*dm_state), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dm_state);
+ 	KUNIT_ASSERT_NOT_NULL(test, dm_state);
  	acrtc->base.state =3D &dm_state->base;
 =20
  	/* Real workqueue so the queue_work() branch runs the control worker. */
@@@ -2152,7 -2150,7 +2155,7 @@@ static void dm_test_crtc_late_register_
  	int ret;
 =20
  	crtc =3D kunit_kzalloc(test, sizeof(*crtc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, crtc);
 =20
  	crtc->debugfs_entry =3D debugfs_create_dir("dm_test_crtc", NULL);
 =20
@@@ -2304,18 -2302,18 +2307,18 @@@ static void dm_test_crtc_atomic_check_n
  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
 =20
  	crtc =3D kunit_kzalloc(test, sizeof(*crtc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, crtc);
  	crtc->dev =3D &adev->ddev;
 =20
  	dm_crtc_state =3D kunit_kzalloc(test, sizeof(*dm_crtc_state), GFP_KERNEL=
);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dm_crtc_state);
+ 	KUNIT_ASSERT_NOT_NULL(test, dm_crtc_state);
  	dm_crtc_state->base.crtc =3D crtc;
 =20
  	state =3D kunit_kzalloc(test, sizeof(*state), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+ 	KUNIT_ASSERT_NOT_NULL(test, state);
  	state->dev =3D &adev->ddev;
  	state->crtcs =3D kunit_kzalloc(test, sizeof(*state->crtcs), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state->crtcs);
+ 	KUNIT_ASSERT_NOT_NULL(test, state->crtcs);
  	state->crtcs[0].new_state =3D &dm_crtc_state->base;
  	dm_crtc_state->base.state =3D state;
 =20
@@@ -2364,24 -2362,24 +2367,24 @@@ static void dm_test_crtc_atomic_check_e
  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
 =20
  	primary =3D kunit_kzalloc(test, sizeof(*primary), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, primary);
+ 	KUNIT_ASSERT_NOT_NULL(test, primary);
 =20
  	crtc =3D kunit_kzalloc(test, sizeof(*crtc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, crtc);
  	crtc->dev =3D &adev->ddev;
  	crtc->primary =3D primary;
 =20
  	dm_crtc_state =3D kunit_kzalloc(test, sizeof(*dm_crtc_state), GFP_KERNEL=
);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dm_crtc_state);
+ 	KUNIT_ASSERT_NOT_NULL(test, dm_crtc_state);
  	dm_crtc_state->base.crtc =3D crtc;
  	dm_crtc_state->base.enable =3D true;
  	dm_crtc_state->base.plane_mask =3D 0;
 =20
  	state =3D kunit_kzalloc(test, sizeof(*state), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+ 	KUNIT_ASSERT_NOT_NULL(test, state);
  	state->dev =3D &adev->ddev;
  	state->crtcs =3D kunit_kzalloc(test, sizeof(*state->crtcs), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state->crtcs);
+ 	KUNIT_ASSERT_NOT_NULL(test, state->crtcs);
  	state->crtcs[0].new_state =3D &dm_crtc_state->base;
  	dm_crtc_state->base.state =3D state;
 =20
@@@ -2409,20 -2407,20 +2412,20 @@@ static void dm_test_crtc_atomic_check_a
  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
 =20
  	crtc =3D kunit_kzalloc(test, sizeof(*crtc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, crtc);
  	crtc->dev =3D &adev->ddev;
 =20
  	dm_crtc_state =3D kunit_kzalloc(test, sizeof(*dm_crtc_state), GFP_KERNEL=
);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dm_crtc_state);
+ 	KUNIT_ASSERT_NOT_NULL(test, dm_crtc_state);
  	dm_crtc_state->base.crtc =3D crtc;
  	dm_crtc_state->base.async_flip =3D true;
  	dm_crtc_state->update_type =3D UPDATE_TYPE_FULL;
 =20
  	state =3D kunit_kzalloc(test, sizeof(*state), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+ 	KUNIT_ASSERT_NOT_NULL(test, state);
  	state->dev =3D &adev->ddev;
  	state->crtcs =3D kunit_kzalloc(test, sizeof(*state->crtcs), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state->crtcs);
+ 	KUNIT_ASSERT_NOT_NULL(test, state->crtcs);
  	state->crtcs[0].new_state =3D &dm_crtc_state->base;
  	dm_crtc_state->base.state =3D state;
 =20
@@@ -2453,33 -2451,33 +2456,33 @@@ static void dm_test_crtc_atomic_check_v
  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
 =20
  	primary =3D kunit_kzalloc(test, sizeof(*primary), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, primary);
+ 	KUNIT_ASSERT_NOT_NULL(test, primary);
 =20
  	crtc =3D kunit_kzalloc(test, sizeof(*crtc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, crtc);
  	crtc->dev =3D &adev->ddev;
  	crtc->primary =3D primary;
 =20
  	dm_crtc_state =3D kunit_kzalloc(test, sizeof(*dm_crtc_state), GFP_KERNEL=
);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dm_crtc_state);
+ 	KUNIT_ASSERT_NOT_NULL(test, dm_crtc_state);
  	dm_crtc_state->base.crtc =3D crtc;
  	dm_crtc_state->freesync_config.state =3D VRR_STATE_ACTIVE_VARIABLE;
 =20
  	state =3D kunit_kzalloc(test, sizeof(*state), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+ 	KUNIT_ASSERT_NOT_NULL(test, state);
  	state->dev =3D &adev->ddev;
  	state->crtcs =3D kunit_kzalloc(test, sizeof(*state->crtcs), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state->crtcs);
+ 	KUNIT_ASSERT_NOT_NULL(test, state->crtcs);
  	state->crtcs[0].new_state =3D &dm_crtc_state->base;
  	dm_crtc_state->base.state =3D state;
 =20
  	/* acquire ctx must be set; existing plane state avoids taking a lock. */
  	state->acquire_ctx =3D kunit_kzalloc(test, sizeof(*state->acquire_ctx), =
GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state->acquire_ctx);
+ 	KUNIT_ASSERT_NOT_NULL(test, state->acquire_ctx);
  	state->planes =3D kunit_kzalloc(test, sizeof(*state->planes), GFP_KERNEL=
);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state->planes);
+ 	KUNIT_ASSERT_NOT_NULL(test, state->planes);
  	primary_plane_state =3D kunit_kzalloc(test, sizeof(*primary_plane_state)=
, GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, primary_plane_state);
+ 	KUNIT_ASSERT_NOT_NULL(test, primary_plane_state);
  	state->planes[0].new_state =3D primary_plane_state;
 =20
  	ret =3D amdgpu_dm_crtc_helper_atomic_check(crtc, state);
@@@ -2514,18 -2512,18 +2517,18 @@@ static void dm_test_crtc_atomic_check_v
 =20
  	dc =3D dm_kunit_alloc_dc_with_ctx(test);
  	res_pool =3D kunit_kzalloc(test, sizeof(*res_pool), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, res_pool);
+ 	KUNIT_ASSERT_NOT_NULL(test, res_pool);
  	tg =3D kunit_kzalloc(test, sizeof(*tg), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, tg);
+ 	KUNIT_ASSERT_NOT_NULL(test, tg);
  	tg_funcs =3D kunit_kzalloc(test, sizeof(*tg_funcs), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, tg_funcs);
+ 	KUNIT_ASSERT_NOT_NULL(test, tg_funcs);
  	tg_funcs->validate_timing =3D dm_test_atomic_check_validate_timing_ok;
  	tg->funcs =3D tg_funcs;
  	res_pool->timing_generators[0] =3D tg;
  	dc->res_pool =3D res_pool;
 =20
  	link_srv =3D kunit_kzalloc(test, sizeof(*link_srv), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, link_srv);
+ 	KUNIT_ASSERT_NOT_NULL(test, link_srv);
  	link_srv->validate_mode_timing =3D dm_test_atomic_check_validate_mode_ti=
ming_ok;
  	dc->link_srv =3D link_srv;
  	adev->dm.dc =3D dc;
@@@ -2535,19 -2533,19 +2538,19 @@@
  	stream =3D dm_kunit_alloc_stream(test, link);
 =20
  	crtc =3D kunit_kzalloc(test, sizeof(*crtc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, crtc);
  	crtc->dev =3D &adev->ddev;
 =20
  	dm_crtc_state =3D kunit_kzalloc(test, sizeof(*dm_crtc_state), GFP_KERNEL=
);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dm_crtc_state);
+ 	KUNIT_ASSERT_NOT_NULL(test, dm_crtc_state);
  	dm_crtc_state->base.crtc =3D crtc;
  	dm_crtc_state->stream =3D stream;
 =20
  	state =3D kunit_kzalloc(test, sizeof(*state), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+ 	KUNIT_ASSERT_NOT_NULL(test, state);
  	state->dev =3D &adev->ddev;
  	state->crtcs =3D kunit_kzalloc(test, sizeof(*state->crtcs), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state->crtcs);
+ 	KUNIT_ASSERT_NOT_NULL(test, state->crtcs);
  	state->crtcs[0].new_state =3D &dm_crtc_state->base;
  	dm_crtc_state->base.state =3D state;
 =20
@@@ -2582,11 -2580,11 +2585,11 @@@ static void dm_test_crtc_atomic_check_i
 =20
  	dc =3D dm_kunit_alloc_dc_with_ctx(test);
  	res_pool =3D kunit_kzalloc(test, sizeof(*res_pool), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, res_pool);
+ 	KUNIT_ASSERT_NOT_NULL(test, res_pool);
  	tg =3D kunit_kzalloc(test, sizeof(*tg), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, tg);
+ 	KUNIT_ASSERT_NOT_NULL(test, tg);
  	tg_funcs =3D kunit_kzalloc(test, sizeof(*tg_funcs), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, tg_funcs);
+ 	KUNIT_ASSERT_NOT_NULL(test, tg_funcs);
  	tg_funcs->validate_timing =3D dm_test_atomic_check_validate_timing_fail;
  	tg->funcs =3D tg_funcs;
  	res_pool->timing_generators[0] =3D tg;
@@@ -2597,19 -2595,19 +2600,19 @@@
  	stream =3D dm_kunit_alloc_stream(test, link);
 =20
  	crtc =3D kunit_kzalloc(test, sizeof(*crtc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, crtc);
  	crtc->dev =3D &adev->ddev;
 =20
  	dm_crtc_state =3D kunit_kzalloc(test, sizeof(*dm_crtc_state), GFP_KERNEL=
);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dm_crtc_state);
+ 	KUNIT_ASSERT_NOT_NULL(test, dm_crtc_state);
  	dm_crtc_state->base.crtc =3D crtc;
  	dm_crtc_state->stream =3D stream;
 =20
  	state =3D kunit_kzalloc(test, sizeof(*state), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+ 	KUNIT_ASSERT_NOT_NULL(test, state);
  	state->dev =3D &adev->ddev;
  	state->crtcs =3D kunit_kzalloc(test, sizeof(*state->crtcs), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state->crtcs);
+ 	KUNIT_ASSERT_NOT_NULL(test, state->crtcs);
  	state->crtcs[0].new_state =3D &dm_crtc_state->base;
  	dm_crtc_state->base.state =3D state;
 =20
diff --combined drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_irq_t=
est.c
index cc6318518ead0,8c112bda46c89..0000000000000
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_irq_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_irq_test.c
@@@ -428,17 -428,16 +428,16 @@@ static struct dc *dm_test_alloc_dc_with
 =20
  	dc =3D dm_kunit_alloc_dc_with_ctx(test);
  	res_pool =3D kunit_kzalloc(test, sizeof(*res_pool), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, res_pool);
+ 	KUNIT_ASSERT_NOT_NULL(test, res_pool);
  	irqs =3D kunit_kzalloc(test, sizeof(*irqs), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, irqs);
+ 	KUNIT_ASSERT_NOT_NULL(test, irqs);
 =20
  	/*
  	 * Populate the per-source info table so amdgpu_dm_irq_set()/_ack()
  	 * succeed without touching hardware registers.
  	 */
- 	info =3D kunit_kzalloc(test, sizeof(*info) * DAL_IRQ_SOURCES_NUMBER,
- 			     GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, info);
+ 	info =3D kunit_kcalloc(test, DAL_IRQ_SOURCES_NUMBER, sizeof(*info), GFP_=
KERNEL);
+ 	KUNIT_ASSERT_NOT_NULL(test, info);
  	for (i =3D 0; i < DAL_IRQ_SOURCES_NUMBER; i++)
  		info[i].funcs =3D &dm_test_irq_src_funcs;
 =20
@@@ -504,7 -503,7 +503,7 @@@ static struct amdgpu_crtc *dm_test_add_
  	struct amdgpu_crtc *acrtc;
 =20
  	acrtc =3D kunit_kzalloc(test, sizeof(*acrtc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, acrtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, acrtc);
 =20
  	INIT_LIST_HEAD(&acrtc->base.head);
  	acrtc->base.dev =3D &adev->ddev;
@@@ -535,7 -534,7 +534,7 @@@ static void dm_test_destroy_hpd_rx_wq(v
  }
 =20
  static const struct drm_connector_funcs dm_test_connector_funcs =3D {
 -	.reset =3D drm_atomic_helper_connector_reset,
 +	.atomic_create_state =3D drm_atomic_helper_connector_create_state,
  	.atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate_state,
  	.atomic_destroy_state =3D drm_atomic_helper_connector_destroy_state,
  	.fill_modes =3D drm_helper_probe_single_connector_modes,
@@@ -577,7 -576,7 +576,7 @@@ static struct hdcp_workqueue *dm_test_a
  	struct hdcp_workqueue *hdcp_work;
 =20
  	hdcp_work =3D kunit_kzalloc(test, sizeof(*hdcp_work), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hdcp_work);
+ 	KUNIT_ASSERT_NOT_NULL(test, hdcp_work);
 =20
  	mutex_init(&hdcp_work->mutex);
  	INIT_WORK(&hdcp_work->cpirq_work, dm_test_hdcp_dummy_work);
@@@ -679,7 -678,7 +678,7 @@@ static void dm_test_are_sinks_equal_fir
  	struct dc_sink *sink2;
 =20
  	sink2 =3D kunit_kzalloc(test, sizeof(*sink2), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sink2);
+ 	KUNIT_ASSERT_NOT_NULL(test, sink2);
 =20
  	KUNIT_EXPECT_FALSE(test, are_sinks_equal(NULL, sink2));
  }
@@@ -693,7 -692,7 +692,7 @@@ static void dm_test_are_sinks_equal_sec
  	struct dc_sink *sink1;
 =20
  	sink1 =3D kunit_kzalloc(test, sizeof(*sink1), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sink1);
+ 	KUNIT_ASSERT_NOT_NULL(test, sink1);
 =20
  	KUNIT_EXPECT_FALSE(test, are_sinks_equal(sink1, NULL));
  }
@@@ -707,9 -706,9 +706,9 @@@ static void dm_test_are_sinks_equal_dif
  	struct dc_sink *sink1, *sink2;
 =20
  	sink1 =3D kunit_kzalloc(test, sizeof(*sink1), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sink1);
+ 	KUNIT_ASSERT_NOT_NULL(test, sink1);
  	sink2 =3D kunit_kzalloc(test, sizeof(*sink2), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sink2);
+ 	KUNIT_ASSERT_NOT_NULL(test, sink2);
 =20
  	sink1->sink_signal =3D SIGNAL_TYPE_HDMI_TYPE_A;
  	sink2->sink_signal =3D SIGNAL_TYPE_DISPLAY_PORT;
@@@ -726,9 -725,9 +725,9 @@@ static void dm_test_are_sinks_equal_dif
  	struct dc_sink *sink1, *sink2;
 =20
  	sink1 =3D kunit_kzalloc(test, sizeof(*sink1), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sink1);
+ 	KUNIT_ASSERT_NOT_NULL(test, sink1);
  	sink2 =3D kunit_kzalloc(test, sizeof(*sink2), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sink2);
+ 	KUNIT_ASSERT_NOT_NULL(test, sink2);
 =20
  	sink1->sink_signal =3D SIGNAL_TYPE_HDMI_TYPE_A;
  	sink2->sink_signal =3D SIGNAL_TYPE_HDMI_TYPE_A;
@@@ -747,9 -746,9 +746,9 @@@ static void dm_test_are_sinks_equal_dif
  	struct dc_sink *sink1, *sink2;
 =20
  	sink1 =3D kunit_kzalloc(test, sizeof(*sink1), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sink1);
+ 	KUNIT_ASSERT_NOT_NULL(test, sink1);
  	sink2 =3D kunit_kzalloc(test, sizeof(*sink2), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sink2);
+ 	KUNIT_ASSERT_NOT_NULL(test, sink2);
 =20
  	sink1->sink_signal =3D SIGNAL_TYPE_HDMI_TYPE_A;
  	sink2->sink_signal =3D SIGNAL_TYPE_HDMI_TYPE_A;
@@@ -770,9 -769,9 +769,9 @@@ static void dm_test_are_sinks_equal_zer
  	struct dc_sink *sink1, *sink2;
 =20
  	sink1 =3D kunit_kzalloc(test, sizeof(*sink1), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sink1);
+ 	KUNIT_ASSERT_NOT_NULL(test, sink1);
  	sink2 =3D kunit_kzalloc(test, sizeof(*sink2), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sink2);
+ 	KUNIT_ASSERT_NOT_NULL(test, sink2);
 =20
  	sink1->sink_signal =3D SIGNAL_TYPE_DISPLAY_PORT;
  	sink2->sink_signal =3D SIGNAL_TYPE_DISPLAY_PORT;
@@@ -791,9 -790,9 +790,9 @@@ static void dm_test_are_sinks_equal_ful
  	struct dc_sink *sink1, *sink2;
 =20
  	sink1 =3D kunit_kzalloc(test, sizeof(*sink1), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sink1);
+ 	KUNIT_ASSERT_NOT_NULL(test, sink1);
  	sink2 =3D kunit_kzalloc(test, sizeof(*sink2), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sink2);
+ 	KUNIT_ASSERT_NOT_NULL(test, sink2);
 =20
  	sink1->sink_signal =3D SIGNAL_TYPE_HDMI_TYPE_A;
  	sink2->sink_signal =3D SIGNAL_TYPE_HDMI_TYPE_A;
@@@ -814,9 -813,9 +813,9 @@@ static void dm_test_are_sinks_equal_ful
  	struct dc_sink *sink1, *sink2;
 =20
  	sink1 =3D kunit_kzalloc(test, sizeof(*sink1), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sink1);
+ 	KUNIT_ASSERT_NOT_NULL(test, sink1);
  	sink2 =3D kunit_kzalloc(test, sizeof(*sink2), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sink2);
+ 	KUNIT_ASSERT_NOT_NULL(test, sink2);
 =20
  	sink1->sink_signal =3D SIGNAL_TYPE_HDMI_TYPE_A;
  	sink2->sink_signal =3D SIGNAL_TYPE_HDMI_TYPE_A;
@@@ -928,7 -927,7 +927,7 @@@ static void dm_test_irq_init_initialize
  	int src;
 =20
  	adev =3D kunit_kzalloc(test, sizeof(*adev), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev);
 =20
  	KUNIT_EXPECT_EQ(test, amdgpu_dm_irq_init(adev), 0);
 =20
@@@ -952,7 -951,7 +951,7 @@@ static void dm_test_irq_register_reject
  	struct dc_interrupt_params int_params =3D { 0 };
 =20
  	adev =3D kunit_kzalloc(test, sizeof(*adev), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev);
 =20
  	int_params.int_context =3D INTERRUPT_LOW_IRQ_CONTEXT;
  	int_params.irq_source =3D DC_IRQ_SOURCE_HPD1;
@@@ -974,7 -973,7 +973,7 @@@ static void dm_test_irq_register_reject
  	struct dc_interrupt_params int_params =3D { 0 };
 =20
  	adev =3D kunit_kzalloc(test, sizeof(*adev), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev);
 =20
  	int_params.int_context =3D INTERRUPT_CONTEXT_NUMBER;
  	int_params.irq_source =3D DC_IRQ_SOURCE_HPD1;
@@@ -994,7 -993,7 +993,7 @@@ static void dm_test_irq_register_reject
  	struct dc_interrupt_params int_params =3D { 0 };
 =20
  	adev =3D kunit_kzalloc(test, sizeof(*adev), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev);
 =20
  	int_params.int_context =3D INTERRUPT_LOW_IRQ_CONTEXT;
  	int_params.irq_source =3D DC_IRQ_SOURCE_INVALID;
@@@ -1015,7 -1014,7 +1014,7 @@@ static void dm_test_irq_register_separa
  	void *handler;
 =20
  	adev =3D kunit_kzalloc(test, sizeof(*adev), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev);
  	KUNIT_ASSERT_EQ(test, amdgpu_dm_irq_init(adev), 0);
 =20
  	int_params.irq_source =3D DC_IRQ_SOURCE_HPD5;
@@@ -1066,7 -1065,7 +1065,7 @@@ static void dm_test_irq_unregister_reje
  	struct amdgpu_device *adev;
 =20
  	adev =3D kunit_kzalloc(test, sizeof(*adev), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev);
  	KUNIT_ASSERT_EQ(test, amdgpu_dm_irq_init(adev), 0);
 =20
  	amdgpu_dm_irq_unregister_interrupt(adev, DC_IRQ_SOURCE_INVALID,
@@@ -1087,7 -1086,7 +1086,7 @@@ static void dm_test_irq_unregister_reje
  	struct amdgpu_device *adev;
 =20
  	adev =3D kunit_kzalloc(test, sizeof(*adev), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev);
  	KUNIT_ASSERT_EQ(test, amdgpu_dm_irq_init(adev), 0);
 =20
  	amdgpu_dm_irq_unregister_interrupt(adev, DC_IRQ_SOURCE_HPD1,
@@@ -1110,7 -1109,7 +1109,7 @@@ static void dm_test_irq_unregister_hand
  	void *handler;
 =20
  	adev =3D kunit_kzalloc(test, sizeof(*adev), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev);
  	KUNIT_ASSERT_EQ(test, amdgpu_dm_irq_init(adev), 0);
 =20
  	int_params.int_context =3D INTERRUPT_LOW_IRQ_CONTEXT;
@@@ -1146,7 -1145,7 +1145,7 @@@ static void dm_test_irq_fini_removes_re
  	void *handler;
 =20
  	adev =3D kunit_kzalloc(test, sizeof(*adev), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev);
  	KUNIT_ASSERT_EQ(test, amdgpu_dm_irq_init(adev), 0);
 =20
  	int_params.int_context =3D INTERRUPT_LOW_IRQ_CONTEXT;
@@@ -1179,7 -1178,7 +1178,7 @@@ static void dm_test_irq_fini_on_empty_t
  	int src;
 =20
  	adev =3D kunit_kzalloc(test, sizeof(*adev), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev);
  	KUNIT_ASSERT_EQ(test, amdgpu_dm_irq_init(adev), 0);
 =20
  	amdgpu_dm_irq_fini(adev);
@@@ -1208,9 -1207,9 +1207,9 @@@ static void dm_test_get_crtc_by_otg_ins
  	drm =3D &adev->ddev;
 =20
  	acrtc_a =3D kunit_kzalloc(test, sizeof(*acrtc_a), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, acrtc_a);
+ 	KUNIT_ASSERT_NOT_NULL(test, acrtc_a);
  	acrtc_b =3D kunit_kzalloc(test, sizeof(*acrtc_b), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, acrtc_b);
+ 	KUNIT_ASSERT_NOT_NULL(test, acrtc_b);
 =20
  	INIT_LIST_HEAD(&acrtc_a->base.head);
  	INIT_LIST_HEAD(&acrtc_b->base.head);
@@@ -1239,7 -1238,7 +1238,7 @@@ static void dm_test_get_crtc_by_otg_ins
  	drm =3D &adev->ddev;
 =20
  	acrtc =3D kunit_kzalloc(test, sizeof(*acrtc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, acrtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, acrtc);
 =20
  	INIT_LIST_HEAD(&acrtc->base.head);
  	acrtc->otg_inst =3D 2;
@@@ -1279,7 -1278,7 +1278,7 @@@ static void dm_test_get_crtc_by_otg_ins
  	adev =3D dm_kunit_alloc_adev(test);
 =20
  	acrtc =3D kunit_kzalloc(test, sizeof(*acrtc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, acrtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, acrtc);
  	adev->mode_info.crtcs[0] =3D acrtc;
 =20
  	KUNIT_EXPECT_PTR_EQ(test, amdgpu_dm_get_crtc_by_otg_inst(adev, -1), acrt=
c);
@@@ -1296,7 -1295,7 +1295,7 @@@ static void dm_test_set_irq_funcs(struc
  	struct amdgpu_device *adev;
 =20
  	adev =3D kunit_kzalloc(test, sizeof(*adev), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev);
 =20
  	adev->mode_info.num_crtc =3D 6;
  	adev->mode_info.num_hpd =3D 4;
@@@ -1534,12 -1533,12 +1533,12 @@@ static void dm_test_hpd_rx_irq_create_w
  	adev =3D dm_kunit_alloc_adev(test);
 =20
  	dc =3D kunit_kzalloc(test, sizeof(*dc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dc);
+ 	KUNIT_ASSERT_NOT_NULL(test, dc);
  	dc->caps.max_links =3D 4;
  	adev->dm.dc =3D dc;
 =20
  	ctx =3D kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+ 	KUNIT_ASSERT_NOT_NULL(test, ctx);
 =20
  	ctx->wq =3D amdgpu_dm_hpd_rx_irq_create_workqueue(adev);
  	KUNIT_ASSERT_NOT_NULL(test, ctx->wq);
@@@ -1561,7 -1560,7 +1560,7 @@@ static void dm_test_hpd_rx_irq_work_sus
  	struct amdgpu_display_manager *dm;
 =20
  	dm =3D kunit_kzalloc(test, sizeof(*dm), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dm);
+ 	KUNIT_ASSERT_NOT_NULL(test, dm);
 =20
  	/* A NULL hpd_rx_offload_wq must be a safe no-op (DC untouched). */
  	amdgpu_dm_hpd_rx_irq_work_suspend(dm);
@@@ -1580,12 -1579,12 +1579,12 @@@ static void dm_test_hpd_rx_irq_work_sus
  	adev =3D dm_kunit_alloc_adev(test);
 =20
  	dc =3D kunit_kzalloc(test, sizeof(*dc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dc);
+ 	KUNIT_ASSERT_NOT_NULL(test, dc);
  	dc->caps.max_links =3D 2;
  	adev->dm.dc =3D dc;
 =20
  	ctx =3D kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+ 	KUNIT_ASSERT_NOT_NULL(test, ctx);
 =20
  	ctx->wq =3D amdgpu_dm_hpd_rx_irq_create_workqueue(adev);
  	KUNIT_ASSERT_NOT_NULL(test, ctx->wq);
@@@ -1608,7 -1607,7 +1607,7 @@@ static void dm_test_set_crtc_irq_state_
  	struct amdgpu_device *adev;
 =20
  	adev =3D kunit_kzalloc(test, sizeof(*adev), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev);
 =20
  	/* mode_info.crtcs[0] is NULL -> returns 0 without dereferencing DC. */
  	KUNIT_EXPECT_EQ(test,
@@@ -1624,7 -1623,7 +1623,7 @@@ static void dm_test_set_pflip_irq_state
  	struct amdgpu_device *adev;
 =20
  	adev =3D kunit_kzalloc(test, sizeof(*adev), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev);
 =20
  	KUNIT_EXPECT_EQ(test,
  			amdgpu_dm_set_pflip_irq_state(adev, NULL, 0, AMDGPU_IRQ_STATE_DISABLE)=
, 0);
@@@ -1639,7 -1638,7 +1638,7 @@@ static void dm_test_set_vline0_irq_stat
  	struct amdgpu_device *adev;
 =20
  	adev =3D kunit_kzalloc(test, sizeof(*adev), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev);
 =20
  	KUNIT_EXPECT_EQ(test,
  			amdgpu_dm_set_vline0_irq_state(adev, NULL, 0, AMDGPU_IRQ_STATE_ENABLE)=
, 0);
@@@ -1654,7 -1653,7 +1653,7 @@@ static void dm_test_set_vupdate_irq_sta
  	struct amdgpu_device *adev;
 =20
  	adev =3D kunit_kzalloc(test, sizeof(*adev), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev);
 =20
  	KUNIT_EXPECT_EQ(test,
  			amdgpu_dm_set_vupdate_irq_state(adev, NULL, 0, AMDGPU_IRQ_STATE_ENABLE=
), 0);
@@@ -1672,9 -1671,9 +1671,9 @@@ static void dm_test_set_crtc_irq_state_
  	struct amdgpu_crtc *acrtc;
 =20
  	adev =3D kunit_kzalloc(test, sizeof(*adev), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev);
  	acrtc =3D kunit_kzalloc(test, sizeof(*acrtc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, acrtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, acrtc);
 =20
  	/* otg_inst =3D=3D -1 short-circuits before computing the irq source. */
  	acrtc->otg_inst =3D -1;
@@@ -1694,9 -1693,9 +1693,9 @@@ static void dm_test_set_crtc_irq_state_
  	struct amdgpu_crtc *acrtc;
 =20
  	adev =3D kunit_kzalloc(test, sizeof(*adev), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev);
  	acrtc =3D kunit_kzalloc(test, sizeof(*acrtc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, acrtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, acrtc);
 =20
  	/*
  	 * otg_inst >=3D 0 computes the irq source and reaches the NULL-safe
@@@ -1719,9 -1718,9 +1718,9 @@@ static void dm_test_set_pflip_irq_state
  	struct amdgpu_crtc *acrtc;
 =20
  	adev =3D kunit_kzalloc(test, sizeof(*adev), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev);
  	acrtc =3D kunit_kzalloc(test, sizeof(*acrtc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, acrtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, acrtc);
 =20
  	/* The disable state exercises the st =3D=3D false path. */
  	acrtc->otg_inst =3D 1;
@@@ -1749,13 -1748,13 +1748,13 @@@ static void dm_test_set_crtc_irq_state_
 =20
  	adev =3D dm_kunit_alloc_adev(test);
  	acrtc =3D kunit_kzalloc(test, sizeof(*acrtc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, acrtc);
+ 	KUNIT_ASSERT_NOT_NULL(test, acrtc);
 =20
  	dc =3D dm_test_alloc_dc_with_irq_service(test, &dm_test_irq_service_func=
s_dcn10);
 =20
  	/* DC_LOG_* dereferences ctx->logger->dev, so wire a real drm device. */
  	logger =3D kunit_kzalloc(test, sizeof(*logger), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, logger);
+ 	KUNIT_ASSERT_NOT_NULL(test, logger);
  	logger->dev =3D &adev->ddev;
  	dc->ctx->logger =3D logger;
 =20
@@@ -1783,7 -1782,7 +1782,7 @@@ static void dm_test_irq_immediate_work_
  	struct amdgpu_device *adev;
 =20
  	adev =3D kunit_kzalloc(test, sizeof(*adev), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev);
  	KUNIT_ASSERT_EQ(test, amdgpu_dm_irq_init(adev), 0);
 =20
  	/* No registered high-context handlers: must be a safe no-op. */
@@@ -1802,7 -1801,7 +1801,7 @@@ static void dm_test_irq_immediate_work_
  	void *handler;
 =20
  	adev =3D kunit_kzalloc(test, sizeof(*adev), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev);
  	KUNIT_ASSERT_EQ(test, amdgpu_dm_irq_init(adev), 0);
 =20
  	int_params.int_context =3D INTERRUPT_HIGH_IRQ_CONTEXT;
@@@ -1833,7 -1832,7 +1832,7 @@@ static void dm_test_irq_schedule_work_e
  	struct amdgpu_device *adev;
 =20
  	adev =3D kunit_kzalloc(test, sizeof(*adev), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev);
  	KUNIT_ASSERT_EQ(test, amdgpu_dm_irq_init(adev), 0);
 =20
  	/* Empty handler list: schedule_work returns immediately. */
@@@ -1852,7 -1851,7 +1851,7 @@@ static void dm_test_irq_schedule_work_q
  	void *handler;
 =20
  	adev =3D kunit_kzalloc(test, sizeof(*adev), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev);
  	KUNIT_ASSERT_EQ(test, amdgpu_dm_irq_init(adev), 0);
 =20
  	int_params.int_context =3D INTERRUPT_LOW_IRQ_CONTEXT;
@@@ -1893,7 -1892,7 +1892,7 @@@ static void dm_test_irq_schedule_work_r
  	void *handler;
 =20
  	adev =3D kunit_kzalloc(test, sizeof(*adev), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev);
  	KUNIT_ASSERT_EQ(test, amdgpu_dm_irq_init(adev), 0);
 =20
  	int_params.int_context =3D INTERRUPT_LOW_IRQ_CONTEXT;
@@@ -1931,7 -1930,7 +1930,7 @@@ static void dm_test_irq_schedule_work_n
  	void *handler;
 =20
  	adev =3D kunit_kzalloc(test, sizeof(*adev), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev);
  	KUNIT_ASSERT_EQ(test, amdgpu_dm_irq_init(adev), 0);
 =20
  	int_params.int_context =3D INTERRUPT_LOW_IRQ_CONTEXT;
@@@ -1960,7 -1959,7 +1959,7 @@@ static void dm_test_set_hpd_irq_state_n
  	struct amdgpu_device *adev;
 =20
  	adev =3D kunit_kzalloc(test, sizeof(*adev), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev);
 =20
  	/* amdgpu_dm_irq_set() is a no-op when dc is NULL, so both states
  	 * return 0 without dereferencing the (absent) DC.
@@@ -1982,7 -1981,7 +1981,7 @@@ static void dm_test_set_dmub_outbox_irq
  	struct amdgpu_device *adev;
 =20
  	adev =3D kunit_kzalloc(test, sizeof(*adev), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev);
 =20
  	KUNIT_EXPECT_EQ(test, amdgpu_dm_set_dmub_outbox_irq_state(adev, NULL, 0,
  								  AMDGPU_IRQ_STATE_ENABLE), 0);
@@@ -2001,7 -2000,7 +2000,7 @@@ static void dm_test_set_dmub_trace_irq_
  	struct amdgpu_device *adev;
 =20
  	adev =3D kunit_kzalloc(test, sizeof(*adev), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev);
 =20
  	KUNIT_EXPECT_EQ(test, amdgpu_dm_set_dmub_trace_irq_state(adev, NULL, 0,
  								 AMDGPU_IRQ_STATE_ENABLE), 0);
@@@ -2020,7 -2019,7 +2019,7 @@@ static void dm_test_outbox_init_null_dc
  	struct amdgpu_device *adev;
 =20
  	adev =3D kunit_kzalloc(test, sizeof(*adev), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev);
 =20
  	/* Single amdgpu_dm_irq_set() call must be skipped when dc is NULL. */
  	amdgpu_dm_outbox_init(adev);
@@@ -2035,14 -2034,27 +2034,27 @@@
  static void dm_test_hpd_init_empty_connectors(struct kunit *test)
  {
  	struct amdgpu_device *adev;
+ 	struct dc_link *link;
+ 	struct dc *dc;
 =20
  	adev =3D dm_kunit_alloc_adev(test);
 =20
  	/*
- 	 * With an empty connector list the per-connector loop is skipped and
- 	 * the initial clear loop relies on amdgpu_dm_irq_set() being a no-op
- 	 * for a NULL dc, so init must complete without touching the DC.
+ 	 * The initial clear loop walks adev->dm.dc->links, so a DC with a
+ 	 * populated irq service is required. With an empty connector list the
+ 	 * per-connector loop is skipped, so init must complete after only the
+ 	 * clear loop runs.
  	 */
+ 	dc =3D dm_test_alloc_dc_with_irq_service(test, &dm_test_irq_service_func=
s_dcn10);
+ 	adev->dm.dc =3D dc;
+=20
+ 	link =3D kunit_kzalloc(test, sizeof(*link), GFP_KERNEL);
+ 	KUNIT_ASSERT_NOT_NULL(test, link);
+ 	link->irq_source_hpd =3D DC_IRQ_SOURCE_HPD1;
+ 	link->irq_source_hpd_rx =3D DC_IRQ_SOURCE_HPD1RX;
+ 	dc->links[0] =3D link;
+ 	dc->link_count =3D 1;
+=20
  	amdgpu_dm_hpd_init(adev);
  }
 =20
@@@ -2070,19 -2082,23 +2082,23 @@@ static void dm_test_hpd_init_fini_with_
  	struct drm_connector *wbconn;
  	struct amdgpu_device *adev;
  	struct dc_link *link;
+ 	struct dc *dc;
 =20
  	adev =3D dm_kunit_alloc_adev(test);
 =20
+ 	/* The clear loop walks dc->links, so set up a DC with an irq service. */
+ 	dc =3D dm_test_alloc_dc_with_irq_service(test, &dm_test_irq_service_func=
s_dcn10);
+ 	adev->dm.dc =3D dc;
+=20
  	/*
  	 * num_hpd =3D 0 forces irq_type >=3D num_hpd so the loop takes the HW
- 	 * fallback (amdgpu_dm_irq_set()) instead of amdgpu_irq_get(); with a
- 	 * NULL dc that fallback is a safe no-op.
+ 	 * fallback (amdgpu_dm_irq_set()) instead of amdgpu_irq_get().
  	 */
  	adev->mode_info.num_hpd =3D 0;
 =20
  	/* A writeback connector must be skipped by the per-connector loop. */
  	wbconn =3D kunit_kzalloc(test, sizeof(*wbconn), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, wbconn);
+ 	KUNIT_ASSERT_NOT_NULL(test, wbconn);
  	KUNIT_ASSERT_EQ(test, drm_connector_init(&adev->ddev, wbconn, &dm_test_c=
onnector_funcs,
  						 DRM_MODE_CONNECTOR_WRITEBACK), 0);
  	KUNIT_ASSERT_EQ(test,
@@@ -2090,7 -2106,7 +2106,7 @@@
 =20
  	/* A DisplayPort connector with a dc_link exercises the loop body. */
  	aconn =3D kunit_kzalloc(test, sizeof(*aconn), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, aconn);
+ 	KUNIT_ASSERT_NOT_NULL(test, aconn);
  	KUNIT_ASSERT_EQ(test, drm_connector_init(&adev->ddev, &aconn->base,
  						 &dm_test_connector_funcs,
  						 DRM_MODE_CONNECTOR_DisplayPort), 0);
@@@ -2098,12 -2114,14 +2114,14 @@@
  			kunit_add_action_or_reset(test, dm_test_connector_cleanup, &aconn->bas=
e), 0);
 =20
  	link =3D kunit_kzalloc(test, sizeof(*link), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, link);
+ 	KUNIT_ASSERT_NOT_NULL(test, link);
  	link->irq_source_hpd =3D DC_IRQ_SOURCE_HPD1;
  	link->irq_source_hpd_rx =3D DC_IRQ_SOURCE_HPD1RX;
  	aconn->dc_link =3D link;
+ 	dc->links[0] =3D link;
+ 	dc->link_count =3D 1;
 =20
- 	/* DC is absent (NULL), so the HW writes are NULL-safe no-ops. */
+ 	/* The irq service stubs accept the HW writes without register access. */
  	amdgpu_dm_hpd_init(adev);
  	amdgpu_dm_hpd_fini(adev);
  }
@@@ -2117,12 -2135,17 +2135,17 @@@ static void dm_test_hpd_init_fini_analo
  	struct amdgpu_dm_connector *aconn;
  	struct amdgpu_device *adev;
  	struct dc_link *link;
+ 	struct dc *dc;
 =20
  	adev =3D dm_kunit_alloc_adev(test);
  	adev->mode_info.num_hpd =3D 0;
 =20
+ 	/* The clear loop walks dc->links, so set up a DC with an irq service. */
+ 	dc =3D dm_test_alloc_dc_with_irq_service(test, &dm_test_irq_service_func=
s_dcn10);
+ 	adev->dm.dc =3D dc;
+=20
  	aconn =3D kunit_kzalloc(test, sizeof(*aconn), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, aconn);
+ 	KUNIT_ASSERT_NOT_NULL(test, aconn);
  	KUNIT_ASSERT_EQ(test, drm_connector_init(&adev->ddev, &aconn->base,
  						 &dm_test_connector_funcs,
  						 DRM_MODE_CONNECTOR_VGA), 0);
@@@ -2130,12 -2153,14 +2153,14 @@@
  			kunit_add_action_or_reset(test, dm_test_connector_cleanup, &aconn->bas=
e), 0);
 =20
  	link =3D kunit_kzalloc(test, sizeof(*link), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, link);
+ 	KUNIT_ASSERT_NOT_NULL(test, link);
  	link->irq_source_hpd =3D DC_IRQ_SOURCE_HPD1;
  	link->irq_source_hpd_rx =3D DC_IRQ_SOURCE_HPD1RX;
  	/* An analog connector id makes the loop request polling. */
  	link->link_id.id =3D CONNECTOR_ID_VGA;
  	aconn->dc_link =3D link;
+ 	dc->links[0] =3D link;
+ 	dc->link_count =3D 1;
 =20
  	/* use_polling becomes true, so init must enable KMS polling. */
  	amdgpu_dm_hpd_init(adev);
@@@ -2155,9 -2180,14 +2180,14 @@@ static void dm_test_hpd_init_fini_irq_r
  	struct amdgpu_dm_connector *aconn;
  	struct amdgpu_device *adev;
  	struct dc_link *link;
+ 	struct dc *dc;
 =20
  	adev =3D dm_kunit_alloc_adev(test);
 =20
+ 	/* The clear loop walks dc->links, so set up a DC with an irq service. */
+ 	dc =3D dm_test_alloc_dc_with_irq_service(test, &dm_test_irq_service_func=
s_dcn10);
+ 	adev->dm.dc =3D dc;
+=20
  	/*
  	 * num_hpd >=3D 1 makes irq_type (0) < num_hpd, so the loop takes the
  	 * amdgpu_irq_get()/amdgpu_irq_put() branch instead of the
@@@ -2168,7 -2198,7 +2198,7 @@@
  	adev->mode_info.num_hpd =3D 1;
 =20
  	aconn =3D kunit_kzalloc(test, sizeof(*aconn), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, aconn);
+ 	KUNIT_ASSERT_NOT_NULL(test, aconn);
  	KUNIT_ASSERT_EQ(test, drm_connector_init(&adev->ddev, &aconn->base,
  						 &dm_test_connector_funcs,
  						 DRM_MODE_CONNECTOR_DisplayPort), 0);
@@@ -2176,10 -2206,12 +2206,12 @@@
  			kunit_add_action_or_reset(test, dm_test_connector_cleanup, &aconn->bas=
e), 0);
 =20
  	link =3D kunit_kzalloc(test, sizeof(*link), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, link);
+ 	KUNIT_ASSERT_NOT_NULL(test, link);
  	link->irq_source_hpd =3D DC_IRQ_SOURCE_HPD1;
  	link->irq_source_hpd_rx =3D DC_IRQ_SOURCE_INVALID;
  	aconn->dc_link =3D link;
+ 	dc->links[0] =3D link;
+ 	dc->link_count =3D 1;
 =20
  	amdgpu_dm_hpd_init(adev);
  	amdgpu_dm_hpd_fini(adev);
@@@ -2200,8 -2232,11 +2232,11 @@@ static void dm_test_hpd_init_skips_conn
  	adev =3D dm_kunit_alloc_adev(test);
  	adev->mode_info.num_hpd =3D 0;
 =20
+ 	/* The clear loop walks dc->links, so set up a DC with an irq service. */
+ 	adev->dm.dc =3D dm_test_alloc_dc_with_irq_service(test, &dm_test_irq_ser=
vice_funcs_dcn10);
+=20
  	aconn =3D kunit_kzalloc(test, sizeof(*aconn), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, aconn);
+ 	KUNIT_ASSERT_NOT_NULL(test, aconn);
  	KUNIT_ASSERT_EQ(test, drm_connector_init(&adev->ddev, &aconn->base,
  						 &dm_test_connector_funcs,
  						 DRM_MODE_CONNECTOR_DisplayPort), 0);
@@@ -2229,10 -2264,10 +2264,10 @@@ static void dm_test_hpd_rx_offload_work
  	adev =3D dm_kunit_alloc_adev(test);
 =20
  	offload_wq =3D kunit_kzalloc(test, sizeof(*offload_wq), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, offload_wq);
+ 	KUNIT_ASSERT_NOT_NULL(test, offload_wq);
 =20
  	offload_work =3D kzalloc_obj(*offload_work);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, offload_work);
+ 	KUNIT_ASSERT_NOT_NULL(test, offload_work);
  	offload_work->offload_wq =3D offload_wq;
  	offload_work->adev =3D adev;
  	INIT_WORK(&offload_work->work, dm_handle_hpd_rx_offload_work);
@@@ -2265,10 -2300,10 +2300,10 @@@ dm_test_setup_hpd_rx_offload_work(struc
  	mutex_init(&adev->dm.dc_lock);
  	adev->reset_domain =3D kunit_kzalloc(test, sizeof(*adev->reset_domain),
  					   GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev->reset_domain);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev->reset_domain);
 =20
  	offload_wq =3D kunit_kzalloc(test, sizeof(*offload_wq), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, offload_wq);
+ 	KUNIT_ASSERT_NOT_NULL(test, offload_wq);
  	spin_lock_init(&offload_wq->offload_lock);
 =20
  	aconn =3D dm_kunit_alloc_connector(test, adev, NULL);
@@@ -2276,13 -2311,13 +2311,13 @@@
  	offload_wq->aconnector =3D aconn;
 =20
  	dc =3D kunit_kzalloc(test, sizeof(*dc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dc);
+ 	KUNIT_ASSERT_NOT_NULL(test, dc);
  	ctx =3D kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+ 	KUNIT_ASSERT_NOT_NULL(test, ctx);
  	link_srv =3D kunit_kzalloc(test, sizeof(*link_srv), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, link_srv);
+ 	KUNIT_ASSERT_NOT_NULL(test, link_srv);
  	link =3D kunit_kzalloc(test, sizeof(*link), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, link);
+ 	KUNIT_ASSERT_NOT_NULL(test, link);
 =20
  	link_srv->detect_connection_type =3D dm_test_detect_connection_single;
  	dc->link_srv =3D link_srv;
@@@ -2293,8 -2328,8 +2328,8 @@@
  	link->connector_signal =3D SIGNAL_TYPE_DISPLAY_PORT;
  	aconn->dc_link =3D link;
 =20
 -	offload_work =3D kzalloc_obj(*offload_work, GFP_KERNEL);
 +	offload_work =3D kzalloc_obj(*offload_work);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, offload_work);
+ 	KUNIT_ASSERT_NOT_NULL(test, offload_work);
  	offload_work->offload_wq =3D offload_wq;
  	offload_work->adev =3D adev;
  	INIT_WORK(&offload_work->work, dm_handle_hpd_rx_offload_work);
@@@ -2363,6 -2398,7 +2398,7 @@@ static void dm_test_hpd_rx_offload_work
   */
  static void dm_test_hpd_rx_offload_work_msg_rdy(struct kunit *test)
  {
+ 	struct hpd_rx_irq_offload_work_queue *offload_wq;
  	struct hpd_rx_irq_offload_work *offload_work;
  	struct amdgpu_dm_connector *aconn;
  	struct link_service *link_srv;
@@@ -2384,9 -2420,15 +2420,15 @@@
  	offload_work->offload_wq->is_handling_mst_msg_rdy_event =3D true;
  	offload_work->data.bytes.device_service_irq.bits.UP_REQ_MSG_RDY =3D 1;
 =20
+ 	/* NB: offload_work is freed by dm_handle_hpd_rx_offload_work so need to
+ 	 * save a pointer to the wq to do the final KUNIT_EXPECT. This is safe
+ 	 * because the wq is actually a kunit_alloc and is not freed along with
+ 	 * the offload_work object.
+ 	 */
+ 	offload_wq =3D offload_work->offload_wq;
  	dm_handle_hpd_rx_offload_work(&offload_work->work);
 =20
- 	KUNIT_EXPECT_FALSE(test, offload_work->offload_wq->is_handling_mst_msg_r=
dy_event);
+ 	KUNIT_EXPECT_FALSE(test, offload_wq->is_handling_mst_msg_rdy_event);
  }
 =20
  /**
@@@ -2501,13 -2543,13 +2543,13 @@@ static struct amdgpu_dm_connector *dm_t
  			  amdgpu_dm_hdmi_hpd_debounce_work);
 =20
  	dc =3D kunit_kzalloc(test, sizeof(*dc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dc);
+ 	KUNIT_ASSERT_NOT_NULL(test, dc);
  	ctx =3D kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+ 	KUNIT_ASSERT_NOT_NULL(test, ctx);
  	link_srv =3D kunit_kzalloc(test, sizeof(*link_srv), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, link_srv);
+ 	KUNIT_ASSERT_NOT_NULL(test, link_srv);
  	link =3D kunit_kzalloc(test, sizeof(*link), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, link);
+ 	KUNIT_ASSERT_NOT_NULL(test, link);
 =20
  	link_srv->detect_link =3D dm_test_detect_link_false;
  	dc->ctx =3D ctx;
@@@ -2559,9 -2601,9 +2601,9 @@@ static void dm_test_hdmi_hpd_debounce_r
  	dc =3D aconn->dc_link->ctx->dc;
 =20
  	logger =3D kunit_kzalloc(test, sizeof(*logger), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, logger);
+ 	KUNIT_ASSERT_NOT_NULL(test, logger);
  	dmub_srv =3D kunit_kzalloc(test, sizeof(*dmub_srv), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dmub_srv);
+ 	KUNIT_ASSERT_NOT_NULL(test, dmub_srv);
 =20
  	/* DC_LOG_* dereferences ctx->logger->dev, so wire a real drm device. */
  	logger->dev =3D aconn->base.dev;
@@@ -2662,15 -2704,15 +2704,15 @@@ static void dm_test_handle_hpd_irq_disa
 =20
  	aconn =3D dm_kunit_alloc_connector(test, adev, NULL);
  	state =3D kunit_kzalloc(test, sizeof(*state), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+ 	KUNIT_ASSERT_NOT_NULL(test, state);
  	aconn->base.state =3D &state->base;
 =20
  	dc =3D kunit_kzalloc(test, sizeof(*dc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dc);
+ 	KUNIT_ASSERT_NOT_NULL(test, dc);
  	ctx =3D kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+ 	KUNIT_ASSERT_NOT_NULL(test, ctx);
  	link =3D kunit_kzalloc(test, sizeof(*link), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, link);
+ 	KUNIT_ASSERT_NOT_NULL(test, link);
 =20
  	dc->ctx =3D ctx;
  	ctx->dc =3D dc;
@@@ -2711,17 -2753,17 +2753,17 @@@ static struct amdgpu_dm_connector *dm_t
  			  amdgpu_dm_hdmi_hpd_debounce_work);
 =20
  	state =3D kunit_kzalloc(test, sizeof(*state), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+ 	KUNIT_ASSERT_NOT_NULL(test, state);
  	aconn->base.state =3D &state->base;
 =20
  	dc =3D kunit_kzalloc(test, sizeof(*dc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dc);
+ 	KUNIT_ASSERT_NOT_NULL(test, dc);
  	ctx =3D kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+ 	KUNIT_ASSERT_NOT_NULL(test, ctx);
  	link_srv =3D kunit_kzalloc(test, sizeof(*link_srv), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, link_srv);
+ 	KUNIT_ASSERT_NOT_NULL(test, link_srv);
  	link =3D kunit_kzalloc(test, sizeof(*link), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, link);
+ 	KUNIT_ASSERT_NOT_NULL(test, link);
 =20
  	link_srv->detect_connection_type =3D dm_test_detect_connection_none;
  	dc->ctx =3D ctx;
@@@ -2970,19 -3012,19 +3012,19 @@@ static void dm_test_handle_hpd_rx_irq_d
  	adev->dm.disable_hpd_irq =3D true;
 =20
  	offload_wq =3D kunit_kzalloc(test, sizeof(*offload_wq), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, offload_wq);
+ 	KUNIT_ASSERT_NOT_NULL(test, offload_wq);
  	adev->dm.hpd_rx_offload_wq =3D offload_wq;
 =20
  	aconn =3D dm_kunit_alloc_connector(test, adev, NULL);
 =20
  	dc =3D kunit_kzalloc(test, sizeof(*dc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dc);
+ 	KUNIT_ASSERT_NOT_NULL(test, dc);
  	ctx =3D kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+ 	KUNIT_ASSERT_NOT_NULL(test, ctx);
  	link_srv =3D kunit_kzalloc(test, sizeof(*link_srv), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, link_srv);
+ 	KUNIT_ASSERT_NOT_NULL(test, link_srv);
  	link =3D kunit_kzalloc(test, sizeof(*link), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, link);
+ 	KUNIT_ASSERT_NOT_NULL(test, link);
 =20
  	link_srv->dp_handle_hpd_rx_irq =3D dm_test_handle_hpd_rx_no_work;
  	dc->ctx =3D ctx;
@@@ -3009,7 -3051,7 +3051,7 @@@ static void dm_test_schedule_hpd_rx_off
  	adev =3D dm_kunit_alloc_adev(test);
 =20
  	offload_wq =3D kunit_kzalloc(test, sizeof(*offload_wq), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, offload_wq);
+ 	KUNIT_ASSERT_NOT_NULL(test, offload_wq);
  	offload_wq->wq =3D create_singlethread_workqueue("dm_irq_test_hpd_rx");
  	KUNIT_ASSERT_NOT_NULL(test, offload_wq->wq);
 =20
@@@ -3047,7 -3089,7 +3089,7 @@@ static struct amdgpu_dm_connector *dm_t
  	mutex_init(&adev->dm.dc_lock);
 =20
  	offload_wq =3D kunit_kzalloc(test, sizeof(*offload_wq), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, offload_wq);
+ 	KUNIT_ASSERT_NOT_NULL(test, offload_wq);
  	spin_lock_init(&offload_wq->offload_lock);
  	offload_wq->wq =3D create_singlethread_workqueue("dm_irq_test_hpd_rx");
  	KUNIT_ASSERT_NOT_NULL(test, offload_wq->wq);
@@@ -3060,13 -3102,13 +3102,13 @@@
  	aconn->mst_mgr.mst_state =3D true;
 =20
  	dc =3D kunit_kzalloc(test, sizeof(*dc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dc);
+ 	KUNIT_ASSERT_NOT_NULL(test, dc);
  	ctx =3D kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+ 	KUNIT_ASSERT_NOT_NULL(test, ctx);
  	link_srv =3D kunit_kzalloc(test, sizeof(*link_srv), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, link_srv);
+ 	KUNIT_ASSERT_NOT_NULL(test, link_srv);
  	link =3D kunit_kzalloc(test, sizeof(*link), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, link);
+ 	KUNIT_ASSERT_NOT_NULL(test, link);
 =20
  	dc->ctx =3D ctx;
  	dc->link_srv =3D link_srv;
@@@ -3291,7 -3333,7 +3333,7 @@@ static void dm_test_dmub_hpd_callback_i
 =20
  	adev =3D dm_kunit_alloc_adev(test);
  	dc =3D kunit_kzalloc(test, sizeof(*dc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dc);
+ 	KUNIT_ASSERT_NOT_NULL(test, dc);
  	adev->dm.dc =3D dc;
  	notify.link_index =3D 1;
 =20
@@@ -3310,7 -3352,7 +3352,7 @@@ static void dm_test_dmub_hpd_callback_e
 =20
  	adev =3D dm_kunit_alloc_adev(test);
  	dc =3D kunit_kzalloc(test, sizeof(*dc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dc);
+ 	KUNIT_ASSERT_NOT_NULL(test, dc);
  	adev->dm.dc =3D dc;
  	adev->dm.ddev =3D &adev->ddev;
  	dc->link_count =3D 1;
@@@ -3335,7 -3377,7 +3377,7 @@@ static void dm_test_dmub_hpd_callback_s
 =20
  	adev =3D dm_kunit_alloc_adev(test);
  	dc =3D kunit_kzalloc(test, sizeof(*dc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dc);
+ 	KUNIT_ASSERT_NOT_NULL(test, dc);
  	adev->dm.dc =3D dc;
  	adev->in_suspend =3D true;
  	dc->link_count =3D 1;
@@@ -3367,25 -3409,25 +3409,25 @@@ static void dm_test_dmub_hpd_callback_u
 =20
  	adev =3D dm_kunit_alloc_adev(test);
  	dc =3D kunit_kzalloc(test, sizeof(*dc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dc);
+ 	KUNIT_ASSERT_NOT_NULL(test, dc);
  	adev->dm.dc =3D dc;
  	adev->dm.ddev =3D &adev->ddev;
  	dc->link_count =3D 1;
 =20
  	link =3D kunit_kzalloc(test, sizeof(*link), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, link);
+ 	KUNIT_ASSERT_NOT_NULL(test, link);
  	dc->links[0] =3D link;
 =20
  	/* A writeback connector must be skipped by the loop. */
  	wbconn =3D kunit_kzalloc(test, sizeof(*wbconn), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, wbconn);
+ 	KUNIT_ASSERT_NOT_NULL(test, wbconn);
  	KUNIT_ASSERT_EQ(test, drm_connector_init(&adev->ddev, wbconn, &dm_test_c=
onnector_funcs,
  						 DRM_MODE_CONNECTOR_WRITEBACK), 0);
  	KUNIT_ASSERT_EQ(test, kunit_add_action_or_reset(test, dm_test_connector_=
cleanup, wbconn), 0);
 =20
  	/* A DisplayPort connector whose dc_link matches drives the match branch=
=2E */
  	aconn =3D kunit_kzalloc(test, sizeof(*aconn), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, aconn);
+ 	KUNIT_ASSERT_NOT_NULL(test, aconn);
  	KUNIT_ASSERT_EQ(test, drm_connector_init(&adev->ddev, &aconn->base,
  						 &dm_test_connector_funcs,
  						 DRM_MODE_CONNECTOR_DisplayPort), 0);
@@@ -3422,13 -3464,13 +3464,13 @@@ static void dm_test_dmub_hpd_callback_h
  	mutex_init(&adev->dm.dc_lock);
 =20
  	dc =3D kunit_kzalloc(test, sizeof(*dc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dc);
+ 	KUNIT_ASSERT_NOT_NULL(test, dc);
  	ctx =3D kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+ 	KUNIT_ASSERT_NOT_NULL(test, ctx);
  	link_srv =3D kunit_kzalloc(test, sizeof(*link_srv), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, link_srv);
+ 	KUNIT_ASSERT_NOT_NULL(test, link_srv);
  	link =3D kunit_kzalloc(test, sizeof(*link), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, link);
+ 	KUNIT_ASSERT_NOT_NULL(test, link);
 =20
  	link_srv->detect_connection_type =3D dm_test_detect_connection_none;
  	link_srv->detect_link =3D dm_test_detect_link_false;
@@@ -3444,7 -3486,7 +3486,7 @@@
  	dc->links[0] =3D link;
 =20
  	aconn =3D kunit_kzalloc(test, sizeof(*aconn), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, aconn);
+ 	KUNIT_ASSERT_NOT_NULL(test, aconn);
  	KUNIT_ASSERT_EQ(test, drm_connector_init(&adev->ddev, &aconn->base,
  						 &dm_test_connector_funcs,
  						 DRM_MODE_CONNECTOR_DisplayPort), 0);
@@@ -3486,18 -3528,18 +3528,18 @@@ static void dm_test_dmub_hpd_callback_h
  	mutex_init(&adev->dm.dc_lock);
 =20
  	offload_wq =3D kunit_kzalloc(test, sizeof(*offload_wq), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, offload_wq);
+ 	KUNIT_ASSERT_NOT_NULL(test, offload_wq);
  	spin_lock_init(&offload_wq->offload_lock);
  	adev->dm.hpd_rx_offload_wq =3D offload_wq;
 =20
  	dc =3D kunit_kzalloc(test, sizeof(*dc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dc);
+ 	KUNIT_ASSERT_NOT_NULL(test, dc);
  	ctx =3D kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+ 	KUNIT_ASSERT_NOT_NULL(test, ctx);
  	link_srv =3D kunit_kzalloc(test, sizeof(*link_srv), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, link_srv);
+ 	KUNIT_ASSERT_NOT_NULL(test, link_srv);
  	link =3D kunit_kzalloc(test, sizeof(*link), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, link);
+ 	KUNIT_ASSERT_NOT_NULL(test, link);
 =20
  	link_srv->dp_handle_hpd_rx_irq =3D dm_test_handle_hpd_rx_no_work;
  	dc->ctx =3D ctx;
@@@ -3514,7 -3556,7 +3556,7 @@@
  	dc->links[0] =3D link;
 =20
  	aconn =3D kunit_kzalloc(test, sizeof(*aconn), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, aconn);
+ 	KUNIT_ASSERT_NOT_NULL(test, aconn);
  	KUNIT_ASSERT_EQ(test, drm_connector_init(&adev->ddev, &aconn->base,
  						 &dm_test_connector_funcs,
  						 DRM_MODE_CONNECTOR_DisplayPort), 0);
@@@ -3543,7 -3585,7 +3585,7 @@@ static void dm_test_register_hpd_handle
 =20
  	adev =3D dm_kunit_alloc_adev(test);
  	dc =3D kunit_kzalloc(test, sizeof(*dc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dc);
+ 	KUNIT_ASSERT_NOT_NULL(test, dc);
  	adev->dm.dc =3D dc;
 =20
  	KUNIT_EXPECT_EQ(test, amdgpu_dm_register_hpd_handlers(adev), 0);
@@@ -3568,18 -3610,18 +3610,18 @@@ static void dm_test_register_hpd_handle
  	adev =3D dm_kunit_alloc_adev(test);
  	KUNIT_ASSERT_EQ(test, amdgpu_dm_irq_init(adev), 0);
  	dc =3D kunit_kzalloc(test, sizeof(*dc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dc);
+ 	KUNIT_ASSERT_NOT_NULL(test, dc);
  	adev->dm.dc =3D dc;
 =20
  	wbconn =3D kunit_kzalloc(test, sizeof(*wbconn), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, wbconn);
+ 	KUNIT_ASSERT_NOT_NULL(test, wbconn);
  	KUNIT_ASSERT_EQ(test, drm_connector_init(&adev->ddev, wbconn, &dm_test_c=
onnector_funcs,
  						 DRM_MODE_CONNECTOR_WRITEBACK), 0);
  	KUNIT_ASSERT_EQ(test,
  			kunit_add_action_or_reset(test, dm_test_connector_cleanup, wbconn), 0);
 =20
  	aconn =3D kunit_kzalloc(test, sizeof(*aconn), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, aconn);
+ 	KUNIT_ASSERT_NOT_NULL(test, aconn);
  	KUNIT_ASSERT_EQ(test, drm_connector_init(&adev->ddev, &aconn->base,
  						 &dm_test_connector_funcs,
  						 DRM_MODE_CONNECTOR_DisplayPort), 0);
@@@ -3587,7 -3629,7 +3629,7 @@@
  			kunit_add_action_or_reset(test, dm_test_connector_cleanup, &aconn->bas=
e), 0);
 =20
  	link =3D kunit_kzalloc(test, sizeof(*link), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, link);
+ 	KUNIT_ASSERT_NOT_NULL(test, link);
  	link->irq_source_hpd =3D DC_IRQ_SOURCE_HPD1;
  	link->irq_source_hpd_rx =3D DC_IRQ_SOURCE_HPD1RX;
  	aconn->dc_link =3D link;
@@@ -3615,11 -3657,11 +3657,11 @@@ static void dm_test_register_hpd_handle
  	adev =3D dm_kunit_alloc_adev(test);
  	KUNIT_ASSERT_EQ(test, amdgpu_dm_irq_init(adev), 0);
  	dc =3D kunit_kzalloc(test, sizeof(*dc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dc);
+ 	KUNIT_ASSERT_NOT_NULL(test, dc);
  	adev->dm.dc =3D dc;
 =20
  	aconn =3D kunit_kzalloc(test, sizeof(*aconn), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, aconn);
+ 	KUNIT_ASSERT_NOT_NULL(test, aconn);
  	KUNIT_ASSERT_EQ(test, drm_connector_init(&adev->ddev, &aconn->base,
  						 &dm_test_connector_funcs,
  						 DRM_MODE_CONNECTOR_DisplayPort), 0);
@@@ -3627,7 -3669,7 +3669,7 @@@
  			kunit_add_action_or_reset(test, dm_test_connector_cleanup, &aconn->bas=
e), 0);
 =20
  	link =3D kunit_kzalloc(test, sizeof(*link), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, link);
+ 	KUNIT_ASSERT_NOT_NULL(test, link);
  	link->irq_source_hpd =3D DC_IRQ_SOURCE_HPD1RX;
  	link->irq_source_hpd_rx =3D DC_IRQ_SOURCE_INVALID;
  	aconn->dc_link =3D link;
@@@ -3650,11 -3692,11 +3692,11 @@@ static void dm_test_register_hpd_handle
  	adev =3D dm_kunit_alloc_adev(test);
  	KUNIT_ASSERT_EQ(test, amdgpu_dm_irq_init(adev), 0);
  	dc =3D kunit_kzalloc(test, sizeof(*dc), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dc);
+ 	KUNIT_ASSERT_NOT_NULL(test, dc);
  	adev->dm.dc =3D dc;
 =20
  	aconn =3D kunit_kzalloc(test, sizeof(*aconn), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, aconn);
+ 	KUNIT_ASSERT_NOT_NULL(test, aconn);
  	KUNIT_ASSERT_EQ(test, drm_connector_init(&adev->ddev, &aconn->base,
  						 &dm_test_connector_funcs,
  						 DRM_MODE_CONNECTOR_DisplayPort), 0);
@@@ -3662,7 -3704,7 +3704,7 @@@
  			kunit_add_action_or_reset(test, dm_test_connector_cleanup, &aconn->bas=
e), 0);
 =20
  	link =3D kunit_kzalloc(test, sizeof(*link), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, link);
+ 	KUNIT_ASSERT_NOT_NULL(test, link);
  	link->irq_source_hpd =3D DC_IRQ_SOURCE_INVALID;
  	link->irq_source_hpd_rx =3D DC_IRQ_SOURCE_HPD1;
  	aconn->dc_link =3D link;
@@@ -3766,8 -3808,8 +3808,8 @@@ static void dm_test_pflip_high_irq_comp
  	acrtc->pflip_status =3D AMDGPU_FLIP_SUBMITTED;
 =20
  	/* drm_crtc_send_vblank_event() consumes (kfree()s) the event. */
 -	event =3D kzalloc_obj(*event, GFP_KERNEL);
 +	event =3D kzalloc_obj(*event);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, event);
+ 	KUNIT_ASSERT_NOT_NULL(test, event);
  	acrtc->event =3D event;
 =20
  	/* Balance the handler's drm_crtc_vblank_put(). */
@@@ -3803,7 -3845,7 +3845,7 @@@ static struct amdgpu_crtc *dm_test_setu
  	dc =3D dm_kunit_alloc_dc_with_ctx(test);
  	dc->current_state =3D kunit_kzalloc(test, sizeof(*dc->current_state),
  					  GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dc->current_state);
+ 	KUNIT_ASSERT_NOT_NULL(test, dc->current_state);
  	adev->dm.dc =3D dc;
 =20
  	link =3D dm_kunit_alloc_link(test);
@@@ -3842,8 -3884,8 +3884,8 @@@ static void dm_test_pflip_high_irq_vrr_
  	adev =3D drm_to_adev(acrtc->base.dev);
 =20
  	/* drm_crtc_send_vblank_event() consumes (kfree()s) the event. */
 -	event =3D kzalloc_obj(*event, GFP_KERNEL);
 +	event =3D kzalloc_obj(*event);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, event);
+ 	KUNIT_ASSERT_NOT_NULL(test, event);
  	acrtc->event =3D event;
 =20
  	/* Balance the handler's drm_crtc_vblank_put(). */
@@@ -3876,14 -3918,14 +3918,14 @@@ static void dm_test_pflip_high_irq_vrr_
  	struct amdgpu_crtc *acrtc;
 =20
  	tg =3D kunit_kzalloc(test, sizeof(*tg), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, tg);
+ 	KUNIT_ASSERT_NOT_NULL(test, tg);
  	tg->funcs =3D &dm_test_tg_funcs;
 =20
  	acrtc =3D dm_test_setup_vrr_pflip_crtc(test, tg);
  	adev =3D drm_to_adev(acrtc->base.dev);
 =20
 -	event =3D kzalloc_obj(*event, GFP_KERNEL);
 +	event =3D kzalloc_obj(*event);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, event);
+ 	KUNIT_ASSERT_NOT_NULL(test, event);
  	acrtc->event =3D event;
 =20
  	params.adev =3D adev;
@@@ -3943,8 -3985,8 +3985,8 @@@ static void dm_test_vupdate_high_irq_dc
  	acrtc =3D dm_test_add_crtc(test, adev);
  	acrtc->pflip_status =3D AMDGPU_FLIP_SUBMITTED;
 =20
 -	event =3D kzalloc_obj(*event, GFP_KERNEL);
 +	event =3D kzalloc_obj(*event);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, event);
+ 	KUNIT_ASSERT_NOT_NULL(test, event);
  	acrtc->event =3D event;
 =20
  	adev->ddev.vblank[0].time =3D ktime_get();
@@@ -4016,7 -4058,7 +4058,7 @@@ static struct amdgpu_crtc *dm_test_setu
  	dc =3D dm_kunit_alloc_dc_with_ctx(test);
  	dc->current_state =3D kunit_kzalloc(test, sizeof(*dc->current_state),
  					  GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dc->current_state);
+ 	KUNIT_ASSERT_NOT_NULL(test, dc->current_state);
  	adev->dm.dc =3D dc;
 =20
  	link =3D dm_kunit_alloc_link(test);
@@@ -4173,7 -4215,7 +4215,7 @@@ static void dm_test_crtc_high_irq_write
  	acrtc =3D dm_test_add_crtc(test, adev);
 =20
  	wb_conn =3D kunit_kzalloc(test, sizeof(*wb_conn), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, wb_conn);
+ 	KUNIT_ASSERT_NOT_NULL(test, wb_conn);
  	acrtc->wb_conn =3D wb_conn;
  	acrtc->wb_pending =3D true;
 =20
@@@ -4209,7 -4251,7 +4251,7 @@@ static void dm_test_crtc_high_irq_write
  	acrtc =3D dm_test_add_crtc(test, adev);
 =20
  	wb_conn =3D kunit_kzalloc(test, sizeof(*wb_conn), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, wb_conn);
+ 	KUNIT_ASSERT_NOT_NULL(test, wb_conn);
  	spin_lock_init(&wb_conn->job_lock);
  	INIT_LIST_HEAD(&wb_conn->job_queue);
 =20
@@@ -4217,8 -4259,8 +4259,8 @@@
  	 * The job carries no framebuffer or fence, so the deferred DRM cleanup
  	 * work only kfree()s it; it needs nothing from this test.
  	 */
 -	job =3D kzalloc_obj(*job, GFP_KERNEL);
 +	job =3D kzalloc_obj(*job);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, job);
+ 	KUNIT_ASSERT_NOT_NULL(test, job);
  	list_add_tail(&job->list_entry, &wb_conn->job_queue);
 =20
  	acrtc->wb_conn =3D wb_conn;
@@@ -4286,9 -4328,9 +4328,9 @@@ static void dm_test_handle_hpd_work_out
 =20
  	adev =3D dm_kunit_alloc_adev(test);
  	hpd_work =3D kzalloc_obj(*hpd_work);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hpd_work);
+ 	KUNIT_ASSERT_NOT_NULL(test, hpd_work);
  	hpd_work->dmub_notify =3D kzalloc_obj(*hpd_work->dmub_notify);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hpd_work->dmub_notify);
+ 	KUNIT_ASSERT_NOT_NULL(test, hpd_work->dmub_notify);
  	hpd_work->dmub_notify->type =3D
  		(enum dmub_notification_type)ARRAY_SIZE(adev->dm.dmub_callback);
  	hpd_work->adev =3D adev;
@@@ -4309,8 -4351,8 +4351,8 @@@ static void dm_test_handle_hpd_work_nul
  	struct amdgpu_device *adev;
 =20
  	adev =3D dm_kunit_alloc_adev(test);
 -	hpd_work =3D kzalloc_obj(*hpd_work, GFP_KERNEL);
 +	hpd_work =3D kzalloc_obj(*hpd_work);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hpd_work);
+ 	KUNIT_ASSERT_NOT_NULL(test, hpd_work);
  	hpd_work->adev =3D adev;
  	INIT_WORK(&hpd_work->handle_hpd_work, dm_handle_hpd_work);
 =20
@@@ -4336,9 -4378,9 +4378,9 @@@ static void dm_test_dmub_outbox1_low_ir
  	adev =3D dm_kunit_alloc_adev(test);
  	dc =3D dm_kunit_alloc_dc_with_ctx(test);
  	dc_dmub_srv =3D kunit_kzalloc(test, sizeof(*dc_dmub_srv), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dc_dmub_srv);
+ 	KUNIT_ASSERT_NOT_NULL(test, dc_dmub_srv);
  	dmub =3D kunit_kzalloc(test, sizeof(*dmub), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dmub);
+ 	KUNIT_ASSERT_NOT_NULL(test, dmub);
 =20
  	dmub->hw_funcs.get_outbox0_wptr =3D dm_test_dmub_get_outbox0_wptr;
  	dc_dmub_srv->dmub =3D dmub;
@@@ -4370,11 -4412,11 +4412,11 @@@ static void dm_test_dmub_outbox1_low_ir
  	adev =3D dm_kunit_alloc_adev(test);
  	dc =3D dm_kunit_alloc_dc_with_ctx(test);
  	dc_dmub_srv =3D kunit_kzalloc(test, sizeof(*dc_dmub_srv), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dc_dmub_srv);
+ 	KUNIT_ASSERT_NOT_NULL(test, dc_dmub_srv);
  	dmub =3D kunit_kzalloc(test, sizeof(*dmub), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dmub);
+ 	KUNIT_ASSERT_NOT_NULL(test, dmub);
  	rb =3D kunit_kzalloc(test, DM_TEST_OUTBOX0_RB_SIZE, GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rb);
+ 	KUNIT_ASSERT_NOT_NULL(test, rb);
 =20
  	dmub->outbox0_rb.base_address =3D rb;
  	dmub->outbox0_rb.capacity =3D DM_TEST_OUTBOX0_RB_SIZE;
@@@ -4410,9 -4452,9 +4452,9 @@@ static struct amdgpu_device *dm_test_al
  	adev =3D dm_kunit_alloc_adev(test);
  	dc =3D dm_kunit_alloc_dc_with_ctx(test);
  	dc_dmub_srv =3D kunit_kzalloc(test, sizeof(*dc_dmub_srv), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dc_dmub_srv);
+ 	KUNIT_ASSERT_NOT_NULL(test, dc_dmub_srv);
  	dmub =3D kunit_kzalloc(test, sizeof(*dmub), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dmub);
+ 	KUNIT_ASSERT_NOT_NULL(test, dmub);
 =20
  	dmub->hw_init =3D true;
  	dmub->hw_funcs.get_outbox0_wptr =3D dm_test_dmub_get_outbox0_wptr;
@@@ -4890,7 -4932,7 +4932,7 @@@ static void dm_test_register_outbox_irq
  							 adev), 0);
  	dc =3D dm_test_alloc_dc_with_irq_service(test, &dm_test_irq_service_func=
s_dcn10);
  	dc_dmub_srv =3D kunit_kzalloc(test, sizeof(*dc_dmub_srv), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dc_dmub_srv);
+ 	KUNIT_ASSERT_NOT_NULL(test, dc_dmub_srv);
  	dc->ctx->dmub_srv =3D dc_dmub_srv;
  	adev->dm.dc =3D dc;
  	amdgpu_dm_set_irq_funcs(adev);
@@@ -4933,7 -4975,7 +4975,7 @@@ static void dm_test_irq_handler_dispatc
  	struct dc *dc;
 =20
  	adev =3D kunit_kzalloc(test, sizeof(*adev), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev);
  	KUNIT_ASSERT_EQ(test, amdgpu_dm_irq_init(adev), 0);
 =20
  	dc =3D dm_test_alloc_dc_with_irq_service(test,
@@@ -4993,7 -5035,7 +5035,7 @@@ static void dm_test_irq_handler_invalid
  	int low_count =3D 0;
 =20
  	adev =3D kunit_kzalloc(test, sizeof(*adev), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev);
  	KUNIT_ASSERT_EQ(test, amdgpu_dm_irq_init(adev), 0);
 =20
  	/* This stub maps every src_id to DC_IRQ_SOURCE_INVALID. */
@@@ -5040,17 -5082,17 +5082,17 @@@ static void dm_test_handle_vmin_vmax_up
  	struct dc *dc;
 =20
  	adev =3D kunit_kzalloc(test, sizeof(*adev), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adev);
+ 	KUNIT_ASSERT_NOT_NULL(test, adev);
  	mutex_init(&adev->dm.dc_lock);
 =20
  	dc =3D dm_kunit_alloc_dc_with_ctx(test);
  	dc->current_state =3D kunit_kzalloc(test, sizeof(*dc->current_state),
  					  GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dc->current_state);
+ 	KUNIT_ASSERT_NOT_NULL(test, dc->current_state);
  	adev->dm.dc =3D dc;
 =20
  	stream =3D kunit_kzalloc(test, sizeof(*stream), GFP_KERNEL);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, stream);
+ 	KUNIT_ASSERT_NOT_NULL(test, stream);
  	/*
  	 * Start at two references: the worker's dc_stream_release() drops one,
  	 * leaving the kunit-managed allocation intact (no kfree).
@@@ -5060,9 -5102,9 +5102,9 @@@
 =20
  	/* The worker kfree()s both, so they must come from the slab. */
  	work =3D kzalloc_obj(*work);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, work);
+ 	KUNIT_ASSERT_NOT_NULL(test, work);
  	adjust =3D kzalloc_obj(*adjust);
- 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, adjust);
+ 	KUNIT_ASSERT_NOT_NULL(test, adjust);
 =20
  	work->adev =3D adev;
  	work->stream =3D stream;
diff --combined drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
index 9d47d2ab1b49b,2a0cdc6e80596..0000000000000
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
@@@ -434,6 -434,8 +434,6 @@@ struct smu_table_context=20
  	void				*user_overdrive_table;
 =20
  	uint32_t			user_od_feature_mask;
 -	/* Set when an OD commit/restore changed the UCLK levels */
 -	bool				od_uclk_changed;
 =20
  	struct smu_driver_table driver_tables[SMU_DRIVER_TABLE_COUNT];
  };
@@@ -1948,6 -1950,7 +1948,7 @@@ int smu_get_ppt_limit(void *handle
  		      enum pp_power_type pp_power_type);
 =20
  bool smu_mode1_reset_is_support(struct smu_context *smu);
+ bool smu_od_uclk_changed(struct smu_context *smu);
  bool smu_link_reset_is_support(struct smu_context *smu);
  int smu_mode1_reset(struct smu_context *smu);
  int smu_link_reset(struct smu_context *smu);
diff --combined drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
index e80087e35e199,1a02ba70d3000..0000000000000
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
@@@ -1288,6 -1288,28 +1288,28 @@@ static int smu_v13_0_0_upload_overdrive
  	return ret;
  }
 =20
+ /*
+  * PMFW rebuilds the UCLK DPM levels from UclkFmin/UclkFmax. Re-read them=
, so
+  * that pp_dpm_mclk and the soft limits match, and flag the change for DC.
+  */
+ static void smu_v13_0_0_od_refresh_uclk_table(struct smu_context *smu)
+ {
+ 	struct smu_13_0_dpm_context *dpm_context =3D smu->smu_dpm.dpm_context;
+ 	int ret;
+=20
+ 	if (!smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_UCLK_BIT))
+ 		return;
+=20
+ 	ret =3D smu_v13_0_set_single_dpm_table(smu, SMU_UCLK,
+ 					     &dpm_context->dpm_tables.uclk_table);
+ 	if (ret) {
+ 		dev_err(smu->adev->dev, "Failed to refresh UCLK dpm table!\n");
+ 		return;
+ 	}
+=20
+ 	smu->smu_table.od_uclk_changed =3D true;
+ }
+=20
  static int smu_v13_0_0_emit_clk_levels(struct smu_context *smu,
  				       enum smu_clk_type clk_type, char *buf,
  				       int *offset)
@@@ -1653,6 -1675,7 +1675,7 @@@ static int smu_v13_0_0_od_edit_dpm_tabl
  	OverDriveTable_t *od =3D &od_table->OverDriveTable;
  	OverDriveTable_t *boot =3D &boot_od_table->OverDriveTable;
  	struct amdgpu_device *adev =3D smu->adev;
+ 	u32 prev_od_feature_mask =3D table_context->user_od_feature_mask;
  	uint32_t offset_of_voltageoffset;
  	int32_t minimum, maximum;
  	u32 next_mask;
@@@ -2007,6 -2030,11 +2030,11 @@@
 =20
  			table_context->user_od_feature_mask =3D next_mask;
  			od_table->OverDriveTable.FeatureCtrlMask =3D 0;
+=20
+ 			/* UCLK was customized before (restore) or is now (commit) */
+ 			if ((prev_od_feature_mask | next_mask) & BIT(PP_OD_FEATURE_UCLK_BIT))
+ 				smu_v13_0_0_od_refresh_uclk_table(smu);
+=20
  			memcpy((u8 *)user_od_table + offset_of_voltageoffset,
  			       (u8 *)od_table + offset_of_voltageoffset,
  			       sizeof(OverDriveTableExternal_t) - offset_of_voltageoffset);
@@@ -2178,9 -2206,11 +2206,11 @@@ static ssize_t smu_v13_0_0_get_gpu_metr
  	gpu_metrics->average_socket_power =3D metrics->AverageSocketPower;
 =20
  	if ((mp1_ver =3D=3D IP_VERSION(13, 0, 0) &&
- 	     (smu->smc_fw_version <=3D 0x004e1e00 || smu->smc_fw_version >=3D 0x=
004e8600)) ||
+ 	     (smu->smc_fw_version <=3D 0x004e1e00 ||
+ 	      smu->smc_fw_version >=3D 0x004e8600)) ||
  	    (mp1_ver =3D=3D IP_VERSION(13, 0, 10) &&
- 	     smu->smc_fw_version <=3D 0x00500800))
+ 	     (smu->smc_fw_version <=3D 0x00500800 ||
+ 	      smu->smc_fw_version >=3D 0x00505d00)))
  		gpu_metrics->energy_accumulator =3D metrics->EnergyAccumulator;
 =20
  	if (metrics->AverageGfxActivity <=3D SMU_13_0_0_BUSY_THRESHOLD)
@@@ -2360,6 -2390,8 +2390,8 @@@ static int smu_v13_0_0_restore_user_od_
  			!!(next_mask & ~BIT(PP_OD_FEATURE_PPT_BIT));
  		memcpy(od_table, user_od_table, sizeof(OverDriveTableExternal_t));
  		od_table->OverDriveTable.FeatureCtrlMask =3D 0;
+ 		if (next_mask & BIT(PP_OD_FEATURE_UCLK_BIT))
+ 			smu_v13_0_0_od_refresh_uclk_table(smu);
  	}
 =20
  	return res;
diff --combined drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_8_ppt.h
index dff601bc0f9a4,538fb103ed8f8..0000000000000
--- a/drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_8_ppt.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_8_ppt.h
@@@ -35,6 -35,10 +35,10 @@@
  #define SMU_15_0_8_CAP_NPM			1
  #define SMU_15_0_8_CAP_NODE_UNLOAD		2
  #define SMU_15_0_8_NODE_UNLOAD_MIN_FW_VERSION	0x027d0c00u /* 2.125.12.0 */
+ #define SMU_15_0_8_GPU_METRICS_REVISION			1
+ #define SMU_15_0_8_GPUBOARD_TEMP_METRICS_REVISION	1
+ #define SMU_15_0_8_BASEBOARD_TEMP_METRICS_REVISION	1
+ #define SMU_15_0_8_PARTITION_METRICS_REVISION		1
  extern void smu_v15_0_8_set_ppt_funcs(struct smu_context *smu);
 =20
  typedef struct {
@@@ -143,10 -147,10 +147,10 @@@
  	SMU_ARRAY(SMU_MATTR(XGMI_LINK_STATUS), SMU_MUNIT(NONE),                \
  		  SMU_MTYPE(U16), xgmi_link_status,                            \
  		  SMU_15_0_8_NUM_XGMI_LINKS);                                  \
- 	SMU_SCALAR(SMU_MATTR(XGMI_READ_DATA_ACC), SMU_MUNIT(DATA_1),           \
- 		   SMU_MTYPE(U64), xgmi_read_data_acc);                        \
- 	SMU_SCALAR(SMU_MATTR(XGMI_WRITE_DATA_ACC), SMU_MUNIT(DATA_1),          \
- 		   SMU_MTYPE(U64), xgmi_write_data_acc);                               =
   \
+ 	SMU_SCALAR(SMU_MATTR(XGMI_READ_BANDWIDTH_ACC), SMU_MUNIT(BW_1),        \
+ 		   SMU_MTYPE(U64), xgmi_read_bandwidth_acc);                   \
+ 	SMU_SCALAR(SMU_MATTR(XGMI_WRITE_BANDWIDTH_ACC), SMU_MUNIT(BW_1),       \
+ 		   SMU_MTYPE(U64), xgmi_write_bandwidth_acc);                  \
  	SMU_SCALAR(SMU_MATTR(FIRMWARE_TIMESTAMP), SMU_MUNIT(TIME_2),           \
  		   SMU_MTYPE(U64), firmware_timestamp);                        \
  	SMU_ARRAY(SMU_MATTR(CURRENT_GFXCLK), SMU_MUNIT(CLOCK_1),               \
@@@ -181,7 -185,9 +185,9 @@@
  		  SMU_15_0_8_MAX_XCC);                                         \
  	SMU_ARRAY(SMU_MATTR(GFX_BELOW_HOST_LIMIT_TOTAL_ACC), SMU_MUNIT(NONE),  \
  		  SMU_MTYPE(U64), gfx_below_host_limit_total_acc,              \
- 		  SMU_15_0_8_MAX_XCC);
+ 		  SMU_15_0_8_MAX_XCC);                                         \
+ 	SMU_SCALAR(SMU_MATTR(REVISION), SMU_MUNIT(NONE),                       \
+ 		   SMU_MTYPE(U16), revision);
 =20
  DECLARE_SMU_METRICS_CLASS(smu_v15_0_8_gpu_metrics, SMU_15_0_8_METRICS_FIE=
LDS);
 =20
@@@ -251,7 -257,9 +257,9 @@@
  	SMU_SCALAR(SMU_MATTR(VR_TEMP_VDDIO_065_UCIEAM_C), SMU_MUNIT(TEMP_1),   \
  		   SMU_MTYPE(S16), vr_temp_vddio_065_ucieam_c);                \
  	SMU_SCALAR(SMU_MATTR(VR_TEMP_VDDAN_075), SMU_MUNIT(TEMP_1),            \
- 		   SMU_MTYPE(S16), vr_temp_vddan_075);
+ 		   SMU_MTYPE(S16), vr_temp_vddan_075);                          \
+ 	SMU_SCALAR(SMU_MATTR(REVISION), SMU_MUNIT(NONE),                       \
+ 		   SMU_MTYPE(U16), revision);
 =20
  DECLARE_SMU_METRICS_CLASS(smu_v15_0_8_gpuboard_temp_metrics,
  			  SMU_15_0_8_GPUBOARD_TEMP_METRICS_FIELDS);
@@@ -309,7 -317,9 +317,9 @@@
  	SMU_SCALAR(SMU_MATTR(SYSTEM_TEMP_IBC_HSC), SMU_MUNIT(TEMP_1),          \
  		   SMU_MTYPE(S16), system_temp_ibc_hsc);                       \
  	SMU_SCALAR(SMU_MATTR(SYSTEM_TEMP_IBC), SMU_MUNIT(TEMP_1),              \
- 		   SMU_MTYPE(S16), system_temp_ibc);
+ 		   SMU_MTYPE(S16), system_temp_ibc);                            \
+ 	SMU_SCALAR(SMU_MATTR(REVISION), SMU_MUNIT(NONE),                       \
+ 		   SMU_MTYPE(U16), revision);
 =20
  DECLARE_SMU_METRICS_CLASS(smu_v15_0_8_baseboard_temp_metrics,
  			  SMU_15_0_8_BASEBOARD_TEMP_METRICS_FIELDS);
@@@ -343,7 -353,9 +353,9 @@@
  	SMU_SCALAR(SMU_MATTR(ACCUMULATION_COUNTER), SMU_MUNIT(NONE),           \
  		   SMU_MTYPE(U64), accumulation_counter);                      \
  	SMU_SCALAR(SMU_MATTR(FIRMWARE_TIMESTAMP), SMU_MUNIT(TIME_2),           \
- 		   SMU_MTYPE(U64), firmware_timestamp);
+ 		   SMU_MTYPE(U64), firmware_timestamp);                         \
+ 	SMU_SCALAR(SMU_MATTR(REVISION), SMU_MUNIT(NONE),                       \
+ 		   SMU_MTYPE(U16), revision);
 =20
  DECLARE_SMU_METRICS_CLASS(smu_v15_0_8_partition_metrics,
  			  SMU_15_0_8_PARTITION_METRICS_FIELDS);

--XIUw+ZzEVHJD1wTf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrzccQACgkQJNaLcl1U
h9BqPQf/bAHZWcXq3ySWHLCfDKPCzj+UA549MWFUFLfnec6TdEakX540AwEF9kSv
cb4OknXdKXiBJrgLounBF9sa+GkCiflqeBlKmKA7sjmkldRJPDUfwGL0/i5uavtl
cz88NO6YhXGeLxZB+TfThlCzBvWTYueIboOdZZs8KasciCMIh+/PRo0lz39jIG9l
KrI8pPV8q7juOKd08WWY4+bbfl/6KFeOMeN+UkvHjYlxqryH8E/WljqAqQQX2kUZ
aznbArYHNtr1O++2kjGHCdMwKTzqRWWAlR732twiUY44eUld8OwYSmumSNx40y7V
84x+/8pCKRUo+FrO9XQPaNirTAnn4w==
=6WJQ
-----END PGP SIGNATURE-----

--XIUw+ZzEVHJD1wTf--
