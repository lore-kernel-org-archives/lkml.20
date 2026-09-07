Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826F431F9BD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 21:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788817065; cv=none; b=qmwirSxRQ2VN0LKkL9Z2sS6nvRXq8xctmQYtV3eaGNrfOqSndVDRb1qluKvGBRD7gdGAFp/BPvtCq2HQwl8JD7NhtFZHUqDMvXTGCiCNuVX+M2vu58f47Nss8S6NohEXzjAzyjUzC6ds2s3Wm1Lyt0l4xMowT6JGktRR9ntpKbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788817065; c=relaxed/simple;
	bh=NYAddQT1zylz0fu0N8qSjao/dzUyNUqVQvfYZNLeK1g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n6ztwrG1p2WTygOkZMqL6wjFXu35cGNjJ4H1zqanQz4ZsIhT7yv2ryeFQZLS2eoZx9PoFkjMnNgw2/ThqT6qnV+zknJgdVgjOEKZEf+r9+obmtNywOoO18+cexaJ+eOePdO09UgmINORhavXbdxFhGsmYWPkU5DjR6ADbccDTos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a6NpMmLS; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a6NpMmLS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788817063; x=1820353063;
  h=date:from:to:cc:subject:message-id;
  bh=NYAddQT1zylz0fu0N8qSjao/dzUyNUqVQvfYZNLeK1g=;
  b=a6NpMmLSfWJVG9OX2Ba643fet9q0InW03YiQH8CM8PACP0NSFh2yOtuu
   ni6HsX1xWiX6jlPHreyaSo753H1M8S7SfJyZultIsdamCjit7lX5DFNQq
   Ix2EuIOrZ200IRiVybu7NW0e41vuYSRFG12SBNc57M5G/NPA/FYwKKW73
   N069sLY8LnP4VyC0Swd2Ut2I+bD+hbb+RIC9IgyUoRqFof1B804gW4e3J
   opeyGLs5VvkYRiFxmHkVd6+w6LLNzjp6b/NY+nnkBwGhzT0hp04gZ5PXg
   jm11/wPRKOZeXjwP/siS1DJw8Rub1fH2u2DBj8FxeGSDdwfRtEnYERlo7
   g==;
X-CSE-ConnectionGUID: Owwl0RgYTOq0KZYbeqgErA==
X-CSE-MsgGUID: v9yAF1AbT3WbNoIrk2RVDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89342029"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="89342029"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 14:37:43 -0700
X-CSE-ConnectionGUID: g9XHYvzXSPiWbzEuum0waQ==
X-CSE-MsgGUID: AL89tHLTS1GUENxGSUiDrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="267122469"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Sep 2026 14:37:40 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3h21-000000001L7-3pw1;
	Mon, 07 Sep 2026 21:37:37 +0000
Date: Tue, 08 Sep 2026 05:36:46 +0800
From: kernel test robot <lkp@intel.com>
To: "GUO Ren (XuanTie)" <guoren@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Anup Patel <anup@brainfault.org>
Subject: [tip:irq/drivers 6/22]
 drivers/media/platform/mediatek/vpu/mtk_vpu.h:63:2: error: redeclaration of
 enumerator 'IPI_MAX'
Message-ID: <202609080548.LJVHAwpC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi GUO,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/drivers
head:   0c65a1331928d0207c385f03fb5eba0cfecce0e6
commit: 1ae91dc397eb1dbc0f4fc6b96f2481cbc02fe0f9 [6/22] riscv: smp: Move enum ipi_message_type to asm/smp.h
config: riscv-randconfig-r111-20260908 (https://download.01.org/0day-ci/archive/20260908/202609080548.LJVHAwpC-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609080548.LJVHAwpC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609080548.LJVHAwpC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/platform/mediatek/mdp/mtk_mdp_core.c:23:
>> drivers/media/platform/mediatek/vpu/mtk_vpu.h:63:2: error: redeclaration of enumerator 'IPI_MAX'
     IPI_MAX,
     ^~~~~~~
   In file included from include/linux/smp.h:119,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/notifier.h:14,
                    from include/linux/clk.h:14,
                    from drivers/media/platform/mediatek/mdp/mtk_mdp_core.c:8:
   arch/riscv/include/asm/smp.h:27:2: note: previous definition of 'IPI_MAX' was here
     IPI_MAX
     ^~~~~~~
--
   In file included from drivers/media/platform/mediatek/vcodec/common/../decoder/../common/mtk_vcodec_fw.h:9,
                    from drivers/media/platform/mediatek/vcodec/common/../decoder/../common/mtk_vcodec_fw_priv.h:6,
                    from drivers/media/platform/mediatek/vcodec/common/../decoder/mtk_vcodec_dec_drv.h:14,
                    from drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_intr.c:10:
>> drivers/media/platform/mediatek/vcodec/common/../decoder/../common/../../vpu/mtk_vpu.h:63:2: error: redeclaration of enumerator 'IPI_MAX'
     IPI_MAX,
     ^~~~~~~
   In file included from include/linux/smp.h:119,
                    from include/linux/interrupt_rc.h:17,
                    from include/linux/spinlock.h:60,
                    from include/linux/wait.h:9,
                    from drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_intr.c:8:
   arch/riscv/include/asm/smp.h:27:2: note: previous definition of 'IPI_MAX' was here
     IPI_MAX
     ^~~~~~~
--
   In file included from drivers/media/platform/mediatek/vcodec/encoder/venc/../../common/mtk_vcodec_fw.h:9,
                    from drivers/media/platform/mediatek/vcodec/encoder/venc/../../common/mtk_vcodec_fw_priv.h:6,
                    from drivers/media/platform/mediatek/vcodec/encoder/venc/../mtk_vcodec_enc_drv.h:12,
                    from drivers/media/platform/mediatek/vcodec/encoder/venc/venc_vp8_if.c:12:
>> drivers/media/platform/mediatek/vcodec/encoder/venc/../../common/../../vpu/mtk_vpu.h:63:2: error: redeclaration of enumerator 'IPI_MAX'
     IPI_MAX,
     ^~~~~~~
   In file included from include/linux/smp.h:119,
                    from include/linux/alloc_tag.h:14,
                    from include/linux/percpu.h:5,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/interrupt.h:11,
                    from drivers/media/platform/mediatek/vcodec/encoder/venc/venc_vp8_if.c:8:
   arch/riscv/include/asm/smp.h:27:2: note: previous definition of 'IPI_MAX' was here
     IPI_MAX
     ^~~~~~~
--
   In file included from drivers/media/platform/mediatek/vcodec/encoder/../common/mtk_vcodec_fw.h:9,
                    from drivers/media/platform/mediatek/vcodec/encoder/../common/mtk_vcodec_fw_priv.h:6,
                    from drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h:12,
                    from drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.h:14,
                    from drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c:13:
>> drivers/media/platform/mediatek/vcodec/encoder/../common/../../vpu/mtk_vpu.h:63:2: error: redeclaration of enumerator 'IPI_MAX'
     IPI_MAX,
     ^~~~~~~
   In file included from include/linux/smp.h:119,
                    from arch/riscv/include/asm/mmiowb.h:12,
                    from arch/riscv/include/asm/mmio.h:16,
                    from arch/riscv/include/asm/clint.h:10,
                    from arch/riscv/include/asm/timex.h:15,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/videodev2.h:59,
                    from include/media/v4l2-event.h:16,
                    from drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c:8:
   arch/riscv/include/asm/smp.h:27:2: note: previous definition of 'IPI_MAX' was here
     IPI_MAX
     ^~~~~~~
--
   In file included from drivers/media/platform/mediatek/vcodec/decoder/vdec/../../common/mtk_vcodec_fw.h:9,
                    from drivers/media/platform/mediatek/vcodec/decoder/vdec/../../common/mtk_vcodec_fw_priv.h:6,
                    from drivers/media/platform/mediatek/vcodec/decoder/vdec/../mtk_vcodec_dec_drv.h:14,
                    from drivers/media/platform/mediatek/vcodec/decoder/vdec/../mtk_vcodec_dec.h:14,
                    from drivers/media/platform/mediatek/vcodec/decoder/vdec/../vdec_drv_if.h:11,
                    from drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_if.c:10:
>> drivers/media/platform/mediatek/vcodec/decoder/vdec/../../common/../../vpu/mtk_vpu.h:63:2: error: redeclaration of enumerator 'IPI_MAX'
     IPI_MAX,
     ^~~~~~~
   In file included from include/linux/smp.h:119,
                    from arch/riscv/include/asm/mmiowb.h:12,
                    from arch/riscv/include/asm/mmio.h:16,
                    from arch/riscv/include/asm/clint.h:10,
                    from arch/riscv/include/asm/timex.h:15,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_if.c:7:
   arch/riscv/include/asm/smp.h:27:2: note: previous definition of 'IPI_MAX' was here
     IPI_MAX
     ^~~~~~~
--
   In file included from drivers/media/platform/mediatek/vcodec/decoder/../common/mtk_vcodec_fw.h:9,
                    from drivers/media/platform/mediatek/vcodec/decoder/../common/mtk_vcodec_fw_priv.h:6,
                    from drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h:14,
                    from drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h:14,
                    from drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c:24:
>> drivers/media/platform/mediatek/vcodec/decoder/../common/../../vpu/mtk_vpu.h:63:2: error: redeclaration of enumerator 'IPI_MAX'
     IPI_MAX,
     ^~~~~~~
   In file included from include/linux/smp.h:119,
                    from include/linux/interrupt_rc.h:17,
                    from include/linux/spinlock.h:60,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:17,
                    from drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c:9:
   arch/riscv/include/asm/smp.h:27:2: note: previous definition of 'IPI_MAX' was here
     IPI_MAX
     ^~~~~~~


vim +/IPI_MAX +63 drivers/media/platform/mediatek/vpu/mtk_vpu.h

3003a180ef6b946 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  11  
3003a180ef6b946 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  12  /**
0f02beec61875e9 drivers/media/platform/mtk-vpu/mtk_vpu.h      Hans Verkuil   2021-03-11  13   * DOC: VPU
0f02beec61875e9 drivers/media/platform/mtk-vpu/mtk_vpu.h      Hans Verkuil   2021-03-11  14   *
3003a180ef6b946 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  15   * VPU (video processor unit) is a tiny processor controlling video hardware
3003a180ef6b946 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  16   * related to video codec, scaling and color format converting.
3003a180ef6b946 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  17   * VPU interfaces with other blocks by share memory and interrupt.
0f02beec61875e9 drivers/media/platform/mtk-vpu/mtk_vpu.h      Hans Verkuil   2021-03-11  18   */
3003a180ef6b946 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  19  
bfb1b99802ef160 drivers/media/platform/mediatek/vpu/mtk_vpu.h Arnd Bergmann  2024-02-24  20  typedef void (*ipi_handler_t) (void *data,
3003a180ef6b946 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  21  			       unsigned int len,
3003a180ef6b946 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  22  			       void *priv);
3003a180ef6b946 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  23  
3003a180ef6b946 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  24  /**
3003a180ef6b946 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  25   * enum ipi_id - the id of inter-processor interrupt
3003a180ef6b946 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  26   *
3003a180ef6b946 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  27   * @IPI_VPU_INIT:	 The interrupt from vpu is to notfiy kernel
e2818a59f7ca42e drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  28   *			 VPU initialization completed.
e2818a59f7ca42e drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  29   *			 IPI_VPU_INIT is sent from VPU when firmware is
e2818a59f7ca42e drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  30   *			 loaded. AP doesn't need to send IPI_VPU_INIT
e2818a59f7ca42e drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  31   *			 command to VPU.
e2818a59f7ca42e drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  32   *			 For other IPI below, AP should send the request
e2818a59f7ca42e drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  33   *			 to VPU to trigger the interrupt.
e2818a59f7ca42e drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  34   * @IPI_VDEC_H264:	 The interrupt from vpu is to notify kernel to
e2818a59f7ca42e drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  35   *			 handle H264 vidoe decoder job, and vice versa.
e2818a59f7ca42e drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  36   *			 Decode output format is always MT21 no matter what
e2818a59f7ca42e drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  37   *			 the input format is.
e2818a59f7ca42e drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  38   * @IPI_VDEC_VP8:	 The interrupt from is to notify kernel to
e2818a59f7ca42e drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  39   *			 handle VP8 video decoder job, and vice versa.
e2818a59f7ca42e drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  40   *			 Decode output format is always MT21 no matter what
e2818a59f7ca42e drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  41   *			 the input format is.
e2818a59f7ca42e drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  42   * @IPI_VDEC_VP9:	 The interrupt from vpu is to notify kernel to
e2818a59f7ca42e drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  43   *			 handle VP9 video decoder job, and vice versa.
e2818a59f7ca42e drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  44   *			 Decode output format is always MT21 no matter what
e2818a59f7ca42e drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  45   *			 the input format is.
3003a180ef6b946 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  46   * @IPI_VENC_H264:	 The interrupt from vpu is to notify kernel to
e2818a59f7ca42e drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  47   *			 handle H264 video encoder job, and vice versa.
3003a180ef6b946 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  48   * @IPI_VENC_VP8:	 The interrupt fro vpu is to notify kernel to
e2818a59f7ca42e drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  49   *			 handle VP8 video encoder job,, and vice versa.
737ea6cfd226312 drivers/media/platform/mtk-vpu/mtk_vpu.h      Minghsiu Tsai  2016-09-08  50   * @IPI_MDP:		 The interrupt from vpu is to notify kernel to
737ea6cfd226312 drivers/media/platform/mtk-vpu/mtk_vpu.h      Minghsiu Tsai  2016-09-08  51   *			 handle MDP (Media Data Path) job, and vice versa.
3003a180ef6b946 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  52   * @IPI_MAX:		 The maximum IPI number
3003a180ef6b946 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  53   */
3003a180ef6b946 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  54  
3003a180ef6b946 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  55  enum ipi_id {
3003a180ef6b946 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  56  	IPI_VPU_INIT = 0,
e2818a59f7ca42e drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  57  	IPI_VDEC_H264,
e2818a59f7ca42e drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  58  	IPI_VDEC_VP8,
e2818a59f7ca42e drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-09-02  59  	IPI_VDEC_VP9,
3003a180ef6b946 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  60  	IPI_VENC_H264,
3003a180ef6b946 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  61  	IPI_VENC_VP8,
737ea6cfd226312 drivers/media/platform/mtk-vpu/mtk_vpu.h      Minghsiu Tsai  2016-09-08  62  	IPI_MDP,
3003a180ef6b946 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03 @63  	IPI_MAX,
3003a180ef6b946 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  64  };
3003a180ef6b946 drivers/media/platform/mtk-vpu/mtk_vpu.h      Andrew-CT Chen 2016-05-03  65  

:::::: The code at line 63 was first introduced by commit
:::::: 3003a180ef6b9462f3cccc2a89884ef2332d2a1c [media] VPU: mediatek: support Mediatek VPU

:::::: TO: Andrew-CT Chen <andrew-ct.chen@mediatek.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@s-opensource.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
