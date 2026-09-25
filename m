Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C317D46D2B1
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 22:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.233
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790375524; cv=pass; b=hyoccXuigy34Ugxvz6twwg1Zbotg5SIytxDJmElBMDbfYwkc0HPV75QvZUpQB3zYBz1Ywf4YUo7Z+fcp4pMK5k9eQ8wm0JDdNaX3e/FNZh7nTKvSH6pzHmxF0TxxDVzpUyKyl5ktav9pwVQytLEPwleLEDdgS8TqPSVG/Rr1W+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790375524; c=relaxed/simple;
	bh=HTT1Bzp/CQH9oc22abnQLAfE/4mMGvQ8FI43GoGKVhg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=kI6GggU20Sk8SSBfY/oNtHYxdWyJZT/ev/GHCw6HmTal8RwoaO0d4NGtev3wflVAd0NgOKizozp9K4smlwdwNHki2AmVfvhoZIN2Xwm9VJhC5emhcBNmhG7kVxEPI1felsqpJY45FcYwa8a/+OfL5YmK/pKBHnXI1Z05VMNb5Rk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XBY7byEQ; arc=pass smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XBY7byEQ"
Received: by mail-qk2-f41.google.com with SMTP id af79cd13be357-93bfa7b2093so156939485a.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:32:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790375519; cv=none;
        d=google.com; s=arc-20260327;
        b=EEeIgkIb0z/moHngbuKED7uTW1jH+FO/R62rCwlSfAvCxEh4S/6eMyMw2KY1/sfvtl
         qbLRH/ye9A5qybnY8Brjvk6UYbACZ5UjFEmcwAs8Jf1zXNJ5b6gbA81AhGUpsmE2/Ybn
         4g54odYk0X1uILE6QZq3RoBtzEXozqVeCU/f+o4f+DX5snv9eET5SjpdcwgO11PlOZdE
         6wTw+vd0LFdh7SVEpswEJgViOFJ1FnGLTNnOhG3eGCqS/ogCxxkYGc6EVvRy3v4WLCGu
         e8voPF0WWFILCHDWiBHvg3ivgP2dbBkDtEBSX78GxcZi6Hq32YZoRc9AfYdBEEa44x47
         orXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=V3vqli2ndsVk/LMBVY4+gekll1+ICzZ8NkL1lheTiPo=;
        fh=yIsu0ior3H0ldFX1byHXwRFpttn7dwN92nz/xQJ67Ec=;
        b=fXGGxhdOmLwzPWQpZs31Bi8Xv090XEvayv8mfJ0S4lWQa7JM3aJzl+utWgCoUgZRAU
         zbcTcZBdVnkTHYeQDpKpeSDbpu37fqgQWxnGjXEiFrxaNSBEeB5VWqVffZtbzslV4MKS
         aAwvmHqhBUqy1W0NaHCWo9QEx96sWheq1Y8VZbdY3vyjIeHJLWtjKmkxjdeMNZkLt5Cl
         P8mlaUQHOzhahtI530JC7HqH2O4pxFZ0H4NBn4TEQPT1SVSezYjsgm5tSq0I61oWf+Dq
         n29tAjgNl6cbxPPp5mhqyhc6DL/vIMaiSm1ybaPdIZyqc/QgCB+nN3qzOe/Eqo5dlp8L
         YPTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790375519; x=1790980319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V3vqli2ndsVk/LMBVY4+gekll1+ICzZ8NkL1lheTiPo=;
        b=XBY7byEQY9PW6Dwo3P5EusCIQULcOREYZ8p9KMqoKKAywf6X1ylLifMz6IH/lqpizD
         kQlM5V6R79i4vZJMy8eMo3BvDoJ4MSc/5cDag6QRnTKmTp0Kq2vf7H3Q0DgOzNHKuUiF
         gc6ze4QbHQ9xDsYGIIrqcWaKWYoRBgFGY4EvF4UHxWgT+KDdvf89wOoKUOwFlzuyKxY0
         pupWFX2mDeVOZpJ+XjcDCIQ+NBIitEWolhDDwZgYpnSHKz0ev2p2IWS91lX2lxZdv8RP
         yko6FpqteG9rYTSkRybSqG1vB+suAyPy8pED685QwsKrz43AQCAc9hdVLS6yvuFHGlu7
         NxUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790375519; x=1790980319;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V3vqli2ndsVk/LMBVY4+gekll1+ICzZ8NkL1lheTiPo=;
        b=MGC37WYTJxvDNoH0Ixjrp8qt0KsIlskG3oT6rlKJZVOmeOrE3/J4G2GTwzS1LFh8oA
         fhMAz03XMckMDHS6N66xxALWrxnf683T5fBtUL3xrhYaoVJnqJ0w6Xb72Jj5OmzKYLBy
         /GL8yk9jnm2p2q3aA2GZvfkFEN4+TXrj4UwleNz16ITz4ITnz18xGopIbk0gq5HLhQLb
         OO/DYQhEkVw3dneEFy8BBLH4Z8myaNAe76aQloCIBt61fiNfEBXIHq7E847Ohbzv5MwZ
         +KJaO0Z9qvbrDrEJylKVjvZ9TPoLcqiK38CZuKpyXtoQcjsd8rnBOGWaQDcqafgTWW4o
         6Fxg==
X-Forwarded-Encrypted: i=1; AKwUvBxelwV3hopj4ChCMAHqsTFxH9dHXiFFLTDchh8g9znfPXbkSzwY6sOG87RZhPEWNBItOL4SgakNq/0sAvk=@vger.kernel.org
X-Gm-Message-State: AFuF++lVvJ71MSmmzaFdGCkOyVILUsvENuIx/jCUd58GTT+C0SJppAYG
	+xLKOmvqPvRurmn5IOv5AT04tRdp8IgIIy0Pz8fWzLLDvNkf0lWfbOIhtZ6bQYnA8TjdvPjDPUZ
	XU+ZB56IM09cIs3u+vnTpSm0UtW0vClLzdTCu
X-Gm-Gg: AYBFou1AmnrTVAQF8CDTbr3Dif5fy6t34izVJqqmh+Kov6nNJiR5gfCib4xtaqbxzj8
	0AqhslyvjGgVqKGook89EdCJZ1TRKHAYptfrpTTWmp/8F3K+9M9aCh0hU3Fxw+/V4GOFMulpfYq
	haatI2Tdx2Ex6tBzFA4Ybq3T4/5P2e1i+dPGQvb+DpxXBdu2duXLPxNwGUDLQSIjpbWGDkppQwO
	OihA1PdqZXRyoQL66uPMtzS4QkzvpDQa1GHVuzjxOXdbzs4DdS4o6g5rKUQBjroNzPpvs2YeiwF
	CIPhHzjn4/3SlDI0YwapsFeHCWOZU/+Bzz24B+fJACgEO0E0oI+RpPpTBNUvZDCTLCpB6Jpj9fa
	nTNEMc5e1t++Rn5i1ZUZc6HI96noX1isFHk33PkYjEpK97cSRQSY=
X-Received: by 2002:a05:620a:17ab:b0:93b:ebd8:9147 with SMTP id
 af79cd13be357-93c43c6a2e5mr670361385a.18.1790375518609; Fri, 25 Sep 2026
 15:31:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 26 Sep 2026 08:31:46 +1000
X-Gm-Features: AclHuK_bGNRuLRk5uKXZri1-wOBwJzbT64I-eOof3Ma0y1UaO6cjSrpVM4lGbag
Message-ID: <CAPM=9twjOfCE5-LzepSB58uaQtn4kS2yF2sOu52kiJp2xkJXkQ@mail.gmail.com>
Subject: [git pull] drm fixes for 7.3-rc5
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

While most of this is AI inspired fixes for error handling paths,
leaks and use after frees, there are some normal things. nouveau has
probably the biggest changes with some fixes to stabilise runtime
suspend/resume on 570 firmware which regressed after we moved from
535, there are some fixes to stackframe issues seen with amdgpu, and
otherwise the usual bunch of i915/xe/amdgpu fixes, and some virtio-gpu
fixes.

Hopefully it will start to quiten down a bit from here.

Dave.

drm-fixes-2026-09-26:
drm fixes for 7.3-rc5

client:
- fix restore of partially initialized client

i915:
- Fix incorrect RCU teardown order leading to endless loop
- Fix DP MST TU and FEC handling for disconnected streams
- Fix selective fetch disable, again
- Fix export namespace for kunit helpers
- Workaround eDP flicker on a specific laptop model

xe:
- CRI throttle reasons report
- TLB invalidation at wedge
- SVM eviction and VM close
- Display corruption on LNL on Xen PV
- W/a fix and addition

amdgpu:
- Display ref count fix
- Userq fixes
- VCN 4, 5 reset fixes
- Fixes for various error paths
- Stack frame size fixes for various combinations of compilers and configs

amdkfd:
- Possible UAF fix

nouveau:
- runtime suspend/resume fixes for newer firmware
- rcu free the scheduler
- fix VRAM pinning
- fix double free
- fix reference leaks
- fix runtime PM leak
- fix cursor list usage problems
- fix HDMI config rejection without SCDC

virtio:
- fix a bunch of object/memory leaks in failure paths
- add pixel blend mode property to cursor plane
- revert prime buffers import
- sync shmem backing on guest transfers

imagination:
- propogate map failures properly
- fix page count in map interface
- clamp freelist reconstruction requests

ivpu:
- use separate flag for job timeout

bridge:
- samsung-dsim: fix TE GPIO lifetime for host attach
The following changes since commit 93f51579e7df248780214094418f205253383cc5=
:

  Linux 7.3-rc4 (2026-09-20 13:48:15 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-09-26

for you to fetch changes up to a9ed3aa9b87ee41e8ab3ff471b1331c154767e45:

  Merge tag 'drm-misc-fixes-2026-09-24' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
(2026-09-26 07:58:24 +1000)

----------------------------------------------------------------
drm fixes for 7.3-rc5

client:
- fix restore of partially initialized client

i915:
- Fix incorrect RCU teardown order leading to endless loop
- Fix DP MST TU and FEC handling for disconnected streams
- Fix selective fetch disable, again
- Fix export namespace for kunit helpers
- Workaround eDP flicker on a specific laptop model

xe:
- CRI throttle reasons report
- TLB invalidation at wedge
- SVM eviction and VM close
- Display corruption on LNL on Xen PV
- W/a fix and addition

amdgpu:
- Display ref count fix
- Userq fixes
- VCN 4, 5 reset fixes
- Fixes for various error paths
- Stack frame size fixes for various combinations of compilers and configs

amdkfd:
- Possible UAF fix

nouveau:
- runtime suspend/resume fixes for newer firmware
- rcu free the scheduler
- fix VRAM pinning
- fix double free
- fix reference leaks
- fix runtime PM leak
- fix cursor list usage problems
- fix HDMI config rejection without SCDC

virtio:
- fix a bunch of object/memory leaks in failure paths
- add pixel blend mode property to cursor plane
- revert prime buffers import
- sync shmem backing on guest transfers

imagination:
- propogate map failures properly
- fix page count in map interface
- clamp freelist reconstruction requests

ivpu:
- use separate flag for job timeout

bridge:
- samsung-dsim: fix TE GPIO lifetime for host attach

----------------------------------------------------------------
Alex Deucher (1):
      drm/amd/display: Bump frame warning limit for all builds of dml

Alex Hung (1):
      drm/amd/display: Relax DML frame limit with UBSAN

Ankit Nautiyal (1):
      drm/i915/quirks: Limit eDP rate to HBR2 on HP Pavilion Plus 14-ew1

Asad Kamal (1):
      drm/amdkfd: fix use-after-free and multi-container gap in kfd_dev_map=
ping

Benjamin Leggett (1):
      drm/virtio: sync shmem backing on guest-bound transfers

Brajesh Gupta (2):
      drm/imagination: Propagate map failures correctly from pvr_mmu_map_sg=
l()
      drm/imagination: Fix page count for page table for map() interface

Christian K=C3=B6nig (1):
      drm/i915: fix incorrect RCU teardown order

Dan Carpenter (1):
      drm/nouveau/clk: fix list cursor use after loop in nvkm_clk_ustate_up=
date

Dave Airlie (4):
      Merge tag 'drm-intel-fixes-2026-09-24' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2026-09-24' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-7.3-2026-09-24' of
https://gitlab.freedesktop.org/drm/amdgpu/kernel into drm-fixes
      Merge tag 'drm-misc-fixes-2026-09-24' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes

Dmitry Osipenko (1):
      Revert "drm/virtio: Allow importing prime buffers when 3D is enabled"

Francesco Magazzu (3):
      drm/nouveau/clk: don't use the pstate cursor after the loop
      drm/nouveau/device: don't use the pstate cursor after the loop
      drm/nouveau/clk: don't clobber reclock status when restoring volt/fan

Giuseppe Ranieri (1):
      drm/nouveau/disp: don't reject HDMI config on cards without SCDC

Guangshuo Li (1):
      drm/nouveau: fix autosuspend cleanup during teardown

Imre Deak (2):
      drm/i915/dp_mst: Fix configuring FEC for a disconnected stream
      drm/i915/dp_mst: Fix configuring TUs for a disconnected stream

Ivan Lipski (1):
      drm/amd/display: Bump frame warning limit for clang builds of dml

Jakub Pawlak (1):
      accel/ivpu: Use separate flag for job timeout

Jani Nikula (1):
      drm/i915/dp: use EXPORT_SYMBOL_IF_KUNIT() for kunit helpers

Jonghyuk Kim(MalHyuk) (1):
      drm/nouveau: RCU-free the scheduler-containing nouveau_sched

Junrui Luo (5):
      drm/nouveau/dmem: pin VRAM for the whole registered range
      drm/virtio: fix object leak when drm_gem_handle_create() fails
      drm/virtio: fix object leak in virtio_gpu_resource_create_ioctl()
      drm/virtio: fix object leaks in virtio_gpu_resource_create_blob_ioctl=
()
      drm/virtio: release the GEM object on virtio_gpu_vram_create() errors

Li Youhong (1):
      drm/bridge: samsung-dsim: fix TE GPIO lifetime for host attach

Lyude Paul (5):
      drm/nouveau/gsp/r570: Add support for INTERNAL_GCX_ENTRY_PREREQUISITE
      drm/nouveau/gsp/r535: Add support for MEMSYS_GET_STATIC_CONFIG
      drm/nouveau/gsp/r570: Add comp mode workaround from issue #3172217
      drm/nouveau/gsp/r570: Start saving comptag backing stores
      drm/nouveau/gsp/r570: Enable Gcoff in fbsr again

Matthew Auld (1):
      drm/xe/vm: nuke PTs only after unlinking contested VMAs

Matthew Brost (1):
      drm/xe: Keep walking on SVM eviction failure

Nemesa Garg (1):
      drm/i915/psr: Clear stale sel fetch enable bits on sel fetch disable

Peiyang He (5):
      drm/nouveau: fix double-free in nvif_vmm_dtor
      drm/nouveau/uvmm: fix UAF in nouveau_uvmm_sm when BO is in TTM_PL_SYS=
TEM
      drm/nouveau: don't bump pin count on failed re-pin in
nouveau_bo_pin_locked()
      drm/virtio: fix memory leak of fence event on execbuffer failure
      drm/virtio: fix NULL pointer dereference on fence allocation failure

Pengpeng Hou (1):
      drm/imagination: clamp freelist reconstruction requests

Prike Liang (1):
      drm/amdgpu: move userq fence wait out of signalling section

Shixiong Ou (1):
      drm/virtio: Add pixel blend mode property to cursor plane

Shuicheng Lin (1):
      drm/xe/tlb_inval: Treat wedged-device invalidations as complete

Sk Anirban (1):
      drm/xe/gt_throttle: Report power brake as a throttle reason on CRI

Sunil Khatri (3):
      drm/amdgpu/userq: fix double jiffies conversion in hang detect timeou=
t
      drm/amdgpu/vcn5.0.1: fix video_timeout unit mismatch in jpeg reset wa=
it
      drm/amdgpu/vcn4.0.3: fix video_timeout unit mismatch in jpeg reset wa=
it

Szymon Aceda=C5=84ski (1):
      drm/xe: Limit sg segment size to PAGE_SIZE on Xen PV

Tangudu Tilak Tirumalesh (2):
      drm/xe: harden adjust_idledly() against divide-by-zero and overflow
      drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms

Wentao Liang (8):
      drm/nouveau: Fix bridge reference leak in nv1a_ram_new()
      drm/nouveau: Fix gem reference leak in validate_init()
      drm/nouveau: Fix runtime PM leak in nouveau_connector_detect()
      drm/amd/display: Fix dc stream excess put in dm_update_crtc_state()
      drm/amdgpu: Fix vmid_wait fence leak in amdgpu_ring_init()
      drm/amdgpu: Fix acpi device leak in amdgpu_acpi_enumerate_xcc()
      drm/amdgpu: Fix last_update fence leak in amdgpu_vm_init()
      drm/amdgpu: Fix runtime PM leak in amdgpu_debugfs_test_ib_show()

shechenglong (1):
      drm/client: fix restore of partially initialized client

 drivers/accel/ivpu/ivpu_drv.c                      |  3 +-
 drivers/accel/ivpu/ivpu_drv.h                      |  2 +-
 drivers/accel/ivpu/ivpu_job.c                      |  7 +-
 drivers/accel/ivpu/ivpu_mmu.c                      |  1 -
 drivers/accel/ivpu/ivpu_pm.c                       |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c |  3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          | 16 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h          |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |  3 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c            |  3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           | 71 ++++++++++++----
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  4 +-
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |  4 +-
 drivers/gpu/drm/amd/display/dc/dml2_0/Makefile     |  4 +-
 drivers/gpu/drm/bridge/samsung-dsim.c              |  2 +-
 drivers/gpu/drm/clients/drm_fbdev_client.c         |  8 ++
 drivers/gpu/drm/i915/display/intel_cursor.c        |  7 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |  2 +
 drivers/gpu/drm/i915/display/intel_dp_link_caps.c  |  6 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |  4 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        | 24 +++++-
 drivers/gpu/drm/i915/display/intel_dp_mst.h        |  2 +
 drivers/gpu/drm/i915/display/intel_link_bw.c       |  3 +-
 drivers/gpu/drm/i915/display/intel_psr.c           | 15 ++++
 drivers/gpu/drm/i915/display/intel_quirks.c        |  3 +
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  9 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c         |  2 +-
 drivers/gpu/drm/imagination/pvr_free_list.c        | 15 +++-
 drivers/gpu/drm/imagination/pvr_mmu.c              | 19 +++--
 drivers/gpu/drm/imagination/pvr_mmu.h              |  2 +-
 drivers/gpu/drm/imagination/pvr_vm.c               |  4 +-
 drivers/gpu/drm/nouveau/include/nvif/cl0080.h      | 10 +++
 drivers/gpu/drm/nouveau/include/nvif/device.h      |  1 +
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h  |  6 ++
 drivers/gpu/drm/nouveau/nouveau_bo.c               |  3 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c        |  5 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c             |  4 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c              | 18 +++-
 drivers/gpu/drm/nouveau/nouveau_gem.c              |  2 +
 drivers/gpu/drm/nouveau/nouveau_sched.c            |  2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.h            |  1 +
 drivers/gpu/drm/nouveau/nouveau_uvmm.c             | 13 ++-
 drivers/gpu/drm/nouveau/nvif/device.c              | 13 +++
 drivers/gpu/drm/nouveau/nvif/vmm.c                 |  1 +
 drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c  |  8 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/user.c  | 35 ++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c   |  3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c     | 31 ++++---
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv1a.c   |  2 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c     | 10 +++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h     |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c  | 17 ++++
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gsp.h | 45 ++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c | 77 ++++++++++++++++-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c  | 36 ++++++++
 .../nouveau/nvkm/subdev/gsp/rm/r570/nvrm/fbsr.h    | 29 +++++++
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h |  7 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h    |  3 +
 drivers/gpu/drm/virtio/virtgpu_drv.h               |  5 ++
 drivers/gpu/drm/virtio/virtgpu_gem.c               |  2 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             | 49 ++++++++++-
 drivers/gpu/drm/virtio/virtgpu_plane.c             | 13 +++
 drivers/gpu/drm/virtio/virtgpu_prime.c             |  2 +-
 drivers/gpu/drm/virtio/virtgpu_submit.c            | 11 ++-
 drivers/gpu/drm/virtio/virtgpu_vq.c                | 46 +++++++++++
 drivers/gpu/drm/virtio/virtgpu_vram.c              | 17 ++--
 drivers/gpu/drm/xe/regs/xe_gt_regs.h               |  1 +
 drivers/gpu/drm/xe/xe_bo.c                         |  7 ++
 drivers/gpu/drm/xe/xe_bo.h                         | 19 +++++
 drivers/gpu/drm/xe/xe_gt_throttle.c                |  5 +-
 drivers/gpu/drm/xe/xe_guc_ads.c                    |  2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c                  | 96 ++++++++++++++++++=
+---
 drivers/gpu/drm/xe/xe_tlb_inval.c                  |  3 +-
 drivers/gpu/drm/xe/xe_vm.c                         | 21 ++---
 drivers/gpu/drm/xe/xe_wa_oob.rules                 |  2 +
 79 files changed, 810 insertions(+), 135 deletions(-)
