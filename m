Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793396288;
	b=5T7aSH0781+HKyoeAKs9xnbtLJqj/dGyicY6KfrDc0lWj46FdmbYsNny3aHaGnJTF8Nl
	 Xnw2GTbtlPkFdvTTcgWCc+mwemF1FtTPTtVCiQwyHprAbSaVnM38ZmejG5orb+k8MGetU
	 Pdb4e5+IWmXyP0RIbP2Odz0KKQDvkAfOtYFKcVU9LIQmttFinqVKC8IqjPov8yMYRxtWR
	 Hky6lx+n74Kp/SpOHscRnfJ9O6HeepEdRIbKkhotuxBnvqBeGJm/rZBbn5mNtKK1mlXib
	 g8Q0xChfhkD1ar6Siq09hr3Qkl5spwhCiFw3JpN0mKrIy1jmRsGaG+b5dNHg/JidHzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793396288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=VWIvYVNrTi7O7BpAsxKjHom4qcgseHjxHJ3UUC8R2UQ=;
	b=ay+friMU1g1OeNV6ATwGOYxg/RJlMhMlKY0j1LvpfIPqowgUIHCvXpJtx5LqIxxBKPuK
	 7Cm6+LtksTcfeoPY5m3/MSs7FSSZEUZEPYV4Or6nNSbZzkvkUXdMWhq0RO+HE43QaNP93
	 aqUaxyLjgBdUpJLB7BHatbtV3OnP5UPUQmr0nwfqBlPap6DwlPTREjhZKVenqnJ7c+ewZ
	 aKgqSJVeQJpNecIXuJ41z4eWMd9BFXMBB3BQdQtxb533NIypB+WNzHhzEtxCCz2w/ItYV
	 a/5rNar+CPsEZe+x0BeQqyg1mHryhtAZyagtTxKI/rhFkr+/O2znihspyDNLU+YOBrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EB3cOgor;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D666E606A320
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D666E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EB3cOgor
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-917bab38b14so13926866d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:38:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793396287; cv=none;
        d=google.com; s=arc-20260327;
        b=Wb9OHVKYcRowhKoPUkfRjRkyehKnEay/pypzcVznLcSYdliMIS0oluGgLNtQggJR+q
         ifuf3vL1cH9eEgT8qV/Nve3Vjqa97wgDW4aauu60mX41leyHEEJtgMCMAhCZHAcQO+9t
         gbdPPJhv1YhOCo2m9qE4l0F2L7fqsnUovWRErkNAhS3c6rE9KBDkwMIqdOCQ9DVmZYfX
         KnjN3Y+TFXX77qROVS5ToOxfK9bEz6DPJVNhyU4iGJWsCOdM/82J9SN/oPKGdNQ5ex7t
         Kc+Huwzk0Asoaon5yI0EACCnR5p3axmKrMEOPeTQKJpE4OCS/yDmyPMSlRuaoDGacyuS
         rL1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=VWIvYVNrTi7O7BpAsxKjHom4qcgseHjxHJ3UUC8R2UQ=;
        fh=wNSKoUWDk/0f036ygBXks2800StrXLPLem3Ww4g7QYU=;
        b=cYUfTaj5mOSVqbjo+utXPH2N+oFq+WD8sE+0RrNyFoXyu8UZT3qP7zB6Ha8dffO6YZ
         5EGSnV+0Wk2XhyVOYnEp8IQKlwcGU6Aifx6g4/plz0I3Mha4uUmUWuaovgVV9+VfXgUw
         AEf1PV8EmAZKniuUrY5jDnwKbhigreN2xiuK4fnrEaXWUTkGXeAtlNvNcgUMYVm1YxEp
         Yvit4ZtsVfkIAdDEMJpeEpLPMU8gTL1bhwwDOAHPoirskneRDV7E20Cc6dVJhHHt/0so
         mJbhJRaADzv3Qf5qfpCh5c2vxr/gydBQb5I1pOg4v6WFrVDvfZUuwEXiWuEUK8VPuDi+
         w8SA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793396287; x=1794001087; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VWIvYVNrTi7O7BpAsxKjHom4qcgseHjxHJ3UUC8R2UQ=;
        b=EB3cOgoresVz/CvfV7wpDMZ2m77bddRLS2GAvorWYL9d6tRVvfKzdoZPGyL2D1QbbP
         tKeJ1zlAuU1VEhF0qGmpO3uJoPcY0v4Yzq3ZIAy07NMP6Y/L99p2VBcjBvELNHNm1m3T
         z3dlMgYTCjHDBaBD0RAyNbUGTWStwW6pRXEvYUO4Qzyo1VihlTEWUJdAe9iUWKF1Ctpo
         +PRK2dfi504WXfD/LDfLErsjfd8FxoxLIxCEPuRb48X1qK23kf66naX0moeZLTOuNGnX
         JMOQBmyBYEmqtd0QwhyuGGYt+lAGksj+uPUw+B4SnUzpap74mqaMhQe17AFO13k9Bb6M
         LLXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793396287; x=1794001087;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VWIvYVNrTi7O7BpAsxKjHom4qcgseHjxHJ3UUC8R2UQ=;
        b=CWRx7eW9RAtPBO4wLii52Bva9U7M471VWLyJ0Q7xLjt6nHr0Via5ZBbybll4LBA0x5
         ODLRk7LlUzk6VPs+v3LJJo5bLgQi1r6nh4JAi3qZykowf5B+W7JH/CODN+c/lODtHLyW
         qSZP//A9g2H4vcCjMBpww88LdALDqg9/Co4kPJ+yau3vnrRuybMXBcfgYA3VYb+ka2KN
         fFV1wOUatf7u/lMYXO1QQ6E35VQa7/CqWAqTO5Ef5xW48fEd7os6DmDLswFZaIny2jbl
         G8S1IJI7mXwVbXGesxmKbev2NY/dDyJL4dLpScW/lVXiQixJqStG6ftKmEq+GMCQNzAB
         MN6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwOXoN3DK5OIYLi84elUBNCCQI8SO00+4MayWpO0vlxXNUBQ3Kl1Raeyu9umqRcAAN5rUdK+QAxO/6Ol4I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJic/wVWPw2bzpPczb5ebGr9AZYIikZIyLAdQz19mfI29Vkr+fB
	XpA3iYOd0TLmbrIcf+/ULZhoZB/rDIvHWLoYrkO0h8s6tBgpBGlDqbOC2tuJJfPAPVmJRDgwbQL
	1AhiWy6HYqk3GE1QsA1YOa/7QeouG7AlBOVop
X-Gm-Gg: AYBFou0WyapYpkY9ARdpiansBNEZHfpj6uAQWPoVOvl6Ig+6i/EnZ9h+117iglVXQt8
	ldSxpwIVFlEe2LppFqzcikH4I8S3PCVogcIdrgh6yZTGylRei699caECks3RtN2J+Bcsw/nhcpj
	JEKNgBeBkmMnhvrSFaQ+u4Io5oq5gIqszUhFa1TTJvayOPJs03QocdwryidXbU2XoYFlrRA0ku/
	WioGgF6atpGRfhrIjr1NfX+ZKmQHI/SNbJkeF0+bpvpsxF4p0rd6iDY/3fzgYFmeF+D3ZWwoLX2
	oUskpM367ADgFrP3zXxbATQmtIgzLKGDKKWpcLVz/SX2ORXoymz9WhT62pxAq0cwVgL/3b4UTcX
	qht7+aTCmzms2DKeR1s6AiVhHaTaHdMBbivuxu2sFV+y2+ymGfZqkElHrG2Qeo7OIGhzxAemZG1
	x926DPOWdkSgfMukPAtayL37s=
X-Received: by 2002:a05:6214:4586:b0:91c:617a:16d1 with SMTP id
 6a1803df08f44-91ca4b4709amr57040926d6.33.1793396286556; Fri, 30 Oct 2026
 14:38:06 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 31 Oct 2026 07:37:55 +1000
X-Gm-Features: AclHuK9ybmELFwq_U08T2CsIgoOYjcy1Jz6f1yIFGxlfnvZsJDgvyERSVKXAdCA
Message-ID: <CAPM=9txuHS0rd7POC2gReGGnD0gmA-NrPzh1Gy4QC9824Qc4sA@mail.gmail.com>
Subject: [git pull] drm fixes for 7.4-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

The final set of merge window fixes, from AMD mostly. with one set of
panthor mmu fixes.

Regards,
Dave.

drm-next-2026-10-31:
drm fixes for 7.4-rc1

amdgpu:
- UALink fixes
- Runtime PM fixes
- GPUVM fixes
- Mac fixes
- HDMI fixes
- DP MST fix
- Userptr fix
- SMU fixes
- DSC fix
- VCE/UVD sched teardown fix
- Display runpm reference fix
- Display TD-LUT fix
- SMU 13.x fixes
- SMU 14.x fixes
- Gang submit fix
- Passive DVI sink fix
- USB4 tunnel fix
- Freesync fix

amdkfd:
- SVM fixes
- Fix doorbell allocation race
- GC 12.1 fix
- GPU reset fix
- Buffer accounting fixes
- Bounds checking fixes
- Hotplug fixes
- SVM fixes
- CRIU fixes
- GFX12 fix

panthor:
- Fix bugs in MMU handling
The following changes since commit fad06cfaf385787b9ffa2f73f049d42dbe1de57f:

  Merge tag 'drm-misc-next-2026-10-16' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
(2026-10-21 11:03:26 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2026-10-31

for you to fetch changes up to f94ed3d7cba3c83eef50b1a96d630d63cf54f69c:

  Merge tag 'amd-drm-next-fixes-7.4-2026-10-28' of
https://gitlab.freedesktop.org/drm/amdgpu/kernel into drm-next
(2026-10-29 16:01:40 +1000)

----------------------------------------------------------------
drm fixes for 7.4-rc1

amdgpu:
- UALink fixes
- Runtime PM fixes
- GPUVM fixes
- Mac fixes
- HDMI fixes
- DP MST fix
- Userptr fix
- SMU fixes
- DSC fix
- VCE/UVD sched teardown fix
- Display runpm reference fix
- Display TD-LUT fix
- SMU 13.x fixes
- SMU 14.x fixes
- Gang submit fix
- Passive DVI sink fix
- USB4 tunnel fix
- Freesync fix

amdkfd:
- SVM fixes
- Fix doorbell allocation race
- GC 12.1 fix
- GPU reset fix
- Buffer accounting fixes
- Bounds checking fixes
- Hotplug fixes
- SVM fixes
- CRIU fixes
- GFX12 fix

panthor:
- Fix bugs in MMU handling

----------------------------------------------------------------
Asad Kamal (5):
      drm/amd/pm: Update smu_v15_0_8 PMFW headers
      drm/amd/pm: Add set_npm_limit function
      drm/amd/pm: Add NPM metrics reads and SetNpmLimit
      drm/amd/pm: Add store npm limit function
      drm/amd/pm: Notify node unload during driver unload

Avi Weiss (1):
      drm/amd/display: Initialize missing TD-LUT programming inputs

Boris Brezillon (3):
      drm/panthor: Don't invalidate OTHER caches
      drm/panthor: Fully disable the AS even if it's going to be re-assigned
      drm/panthor: Move cache-flush after UPDATE(UNMAPPED)

Daniel Phillips (1):
      amdkfd: Fix memory availability double accounting of kfd pinned objects

Dave Airlie (3):
      Merge tag 'amd-drm-next-fixes-7.4-2026-10-21' of
https://gitlab.freedesktop.org/drm/amdgpu/kernel into drm-next
      Merge tag 'drm-misc-next-fixes-2026-10-23' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'amd-drm-next-fixes-7.4-2026-10-28' of
https://gitlab.freedesktop.org/drm/amdgpu/kernel into drm-next

Elena Sakhnovitch (1):
      drm/amdgpu/gmc9: add extra type-2 TLB flush for gfx942/gfx950

Fangzhi Zuo (3):
      drm/amd/display: Poll passive DVI sinks for EDID readiness
      drm/amd/display: Cap DSC bpp for USB4 DP tunnels
      drm/amd/display: refresh cached HDMI FreeSync state

Harish Kasiviswanathan (1):
      drm/amdkfd: fix NULL deref in SDMA HQD debugfs dump on GC 12.1

Harkirat Gill (1):
      drm/amdgpu: re-enable GFXOFF for compute on GFX12

Henry Martin (1):
      drm/amdkfd: fix doorbell allocation race creating duplicate allocations

Horatio Zhang (1):
      drm/amdgpu: skip the PASID TLB fence for the UALink NPA VM

Ilya Bakoulin (2):
      drm/amd/display: Fix HDMI FRL FFE compliance test
      drm/amd/display: Adjust HDMI FRL LT timeout

Jesse Zhang (9):
      drm/amdgpu: wake the GPU for INFO queries that access the hardware
      drm/amdgpu: fix the error path in amdgpu_vm_pt_alloc()
      drm/amdgpu: reject ANONONLY userptrs that span multiple VMAs
      drm/amdkfd: don't drop an SVM CWSR reference that was never taken
      drm/amdgpu: reject CS chunks too large for kvmalloc()
      drm/amdkfd: split vram_pages of SVM ranges prefetched without a
GPU mapping
      drm/amdkfd: send SMI process and VM fault events only to allowed clients
      drm/amdgpu: drop the gang leader reference when freeing gang jobs
      drm/amdkfd: evict the queues only once for CRIU PROCESS_INFO

Jiale Yao (1):
      drm/amdkfd: validate SRAT subtables before parsing

John Fisher (1):
      drm/amdgpu: wait for pending page table updates before switching
a VM to CPU updates

Keita Morisaki (1):
      drm/amd/display: Fix swap in median3() for DSC rate control

Kenneth Feng (2):
      drm/amd/pm:restate all customized OD features on every table
upload for smu 13.0.0/smu 14.0.2
      drm/amd/pm: add zero fan stop temperature support on smu 14.0.2

Kevin Wang (3):
      drm/amd/pm: reapply umd profile state after recovery
      drm/amd/pm: preserve committed OD features for SMU 13.0.0/13.0.7
      drm/amd/pm: preserve committed OD features for SMU 14.0.2

Luigi Lauro (2):
      drm/amdgpu: require _PR3 for BOCO
      drm/amd/display: take a runtime PM reference only when a CRTC turns on

Maciej Kucharek (3):
      drm/amdgpu: reset SI ASIC on MacBookPros with VRAM at 0
      drm/amdgpu: reset CIK ASIC on Apple boards with VRAM at 0
      drm/amdgpu: reset VI ASIC on Apple boards with VRAM at 0

Mario Limonciello (1):
      drm/amd/display: don't WARN when removing an unallocated MST payload

Olivier Kaloudoff (3):
      drm/amdkfd: tear down KFD processes before early fini_sw on disconnect
      drm/amdkfd: stop restore retries on device unplug
      drm/amdgpu: guard VCE/UVD sched entity teardown on failed probe

Philip Yang (3):
      drm/amdkfd: Fix svm_bo use after free in svm_range_clone
      drm/amdgpu: Reject UALink source-identification address mode
      drm/amdgpu: Enable remote TLB shootdown

William Palacek (2):
      drm/amdkfd: wait for a GPU reset before freeing a BO
      drm/amdkfd: Validate the control stack of a restored queue

Zhen Han (1):
      drm/amdkfd: correct vram_available calculation

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |  19 ++
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12_1.c   |  44 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   | 105 +++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  14 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |  24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  28 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  33 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c         |  21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |  12 +-
 drivers/gpu/drm/amd/amdgpu/cik.c                   |  10 +
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  18 +-
 drivers/gpu/drm/amd/amdgpu/si.c                    |  10 +
 drivers/gpu/drm/amd/amdgpu/vi.c                    |  10 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |  48 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |  35 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   9 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   9 +
 drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c          |  23 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h       |   9 +
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c   |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12.c   |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12_1.c |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c    |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   4 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   4 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |  30 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_queue.c             |  23 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c        |  60 +++--
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  36 ++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  15 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_connector.c    |   9 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  24 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  17 +-
 drivers/gpu/drm/amd/display/dc/dc_hdmi_types.h     |   4 +-
 .../gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c   |   2 +-
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |   2 +
 .../amd/display/dc/link/hwss/link_hwss_hpo_frl.c   |   3 +
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |   2 +
 .../amd/display/dc/link/protocols/link_hdmi_frl.c  | 129 +++++++---
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |   3 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                | 103 ++++++++
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  33 ++-
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |   2 +
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |  33 ++-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          | 101 +++++++-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   8 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v15_0_8_pmfw.h    |  12 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v15_0_8_ppsmc.h   |   5 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |   4 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v15_0.h       |   1 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   | 200 +++++++++++----
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   | 199 +++++++++++----
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   | 279 +++++++++++++++++----
 .../gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_8_ppt.c   | 157 +++++++++++-
 .../gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_8_ppt.h   |   4 +
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |  26 ++
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |   2 +
 drivers/gpu/drm/panthor/panthor_mmu.c              |  45 ++--
 68 files changed, 1660 insertions(+), 468 deletions(-)
