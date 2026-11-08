Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794115003;
	b=eHtnegXoZC9098B4I/Nrl795dK/QqRyO2MVXR+A56pWca/YzN3xwnhbMSTfF3nkhnd3N
	 a2PUziVFj5WxI46dGaq42AS0HKMqc9ktpEdm53j+YTFd8BFHqY4o5wikDj/dm7uDGTbQ8
	 Bjevebh2XVuCQU4pbpPxQuyW4BJgJ7Sg2Rt6csMLTpuf0lzR8Wu8400BQ2qBsypI1ABgP
	 rCYaQ+N6PmMTVJVIQV5jcpzoG6ifJHvtAENWrppvruALbZztebgjjpUXUFBGoZ1vg/TnM
	 cnwdsm+kD+yt8c81SOSAviziX7R+kvgjc8pwaruoCNw3HUiHnivx2PUeEL2VjMLArng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794115003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=gT62dXId+eAb8ukDUrV+GLnTEFym+aAlD/IHLPxFdUE=;
	b=zvBhc72BzpVa0PBnnVnQmp5lMhvFB3cub1cCbBEwy+5noc6UeMDFTiD2ZmwndEb+h3z+
	 FhRUKCeM14D10vm3HHVHdcOP9acEknk6Wa9t0BPG49pvv7xXr/hjYn12MphLO/KfjzqWh
	 gaOSCYpx/6a6w/WQ7lR5cusPcmsjk12HJHOJHcLxhJBJOW3RT3sUIC+HcZ2Gt4hjpZGsh
	 TNFPUX1qlRXr3VmHJXFmLKMEkkAzqIzUdV0ynXkWDb9EHwj/Bhg+/SSHhKSxCK/pKx96G
	 4YjsGe+5JGl5kw+eKYNiYVQgKkJTHhKeNhqa4ba8KZerkVir5m/E8Z6RLEB44OYJbyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=engqbeXt;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7D5606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 05:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE7D5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=engqbeXt
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36a315ed211so236084eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 21:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794115002; x=1794719802; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gT62dXId+eAb8ukDUrV+GLnTEFym+aAlD/IHLPxFdUE=;
        b=engqbeXtR+rWOhiZBYTkPKjjtnb2puay/ycsWiBLGX8+NMoejL9uT3B+p63imdwMRz
         wKi0k8S44NdnihDJ2kDYDN1RokTA2Wf1Lxx77jziVHZ1dN1WriHv7ckibVukhHSKENSJ
         /aygp1AW5ijJgeqZI7W5ZezrV2ZUEx/s1wDrNgwZB832MumiRNE2ZD1sq6eG84g1wPYG
         SMXDSD/w6pIrWZ+WYYQUs73M+Dvt61ebj26ZOf5h7VH9GmBwEkEpnrGjpysdLkPcOmO6
         kgCIx92MRkIB6cX0E/aUQbLWAeg8UKbxvzlkV9Is137WLbceMfybIgQWsLUpC3X+RF4s
         SVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794115002; x=1794719802;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gT62dXId+eAb8ukDUrV+GLnTEFym+aAlD/IHLPxFdUE=;
        b=UJhgkkVDwL4xzTc6MgvHD7CbWTmvPp+dKcNodZskcnJuLkn8r1+cYkAX5xDxYaB5S0
         VhprG4/FKHb7KNTN6rzl9GRI7LOgs/nhIt8bzJyJDQzeW1hXq1SpkyLOgbnbSOeOkXx5
         lsIZ++nJg3L2ryuo2dwAMCBGE5S9tgBzT1f5fEtPc9lel5kKHeFcjIz8jJqviYn4ZTmR
         IhATMP4hrpKtbgTTezQRhdbZwsipUoetFlPv0ARvBPtLTTccV6yOeSF2mzoWLawvuRFe
         o4FaVbEcx0l3QDvKamzz9P6wDZHOLG7/Bol0Df5Gln6RUXQ21pWmpFikWhbhJtoAx8p7
         /LRg==
X-Forwarded-Encrypted: i=1; AKwUvBwO0QBLvUlsenmBHEaOGzHXg95Q8mmykJGAqJYpgUtPRuqYz7y9NYguNEla3sdAQbnwnfi2hua1fndV8b4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GL7A3EekhI6SUMWXp7FwZ+T06wyotWPtPCgGEFnGqmx4c2+jr
	ZYsTUxreGITfKJqrKioxI8fkQjZb7qfAJvA65WhxoiyL2vLO6+OXQfxORboMiw==
X-Gm-Gg: AYBFou2VmWBpKf37x6Zb0Dk4QgTKPk+DKxqKSmtkDB8qBGp51WBn1m6I1q7waAHyWE9
	Cu7hZmDFvN/rMayvAI9H5uUDtYhZoZIohX9RgV+I+B+KyvSuEpCn3gBhIuucrtvMOa/SU7T0Pcr
	D/sJsUxvad/2rEf6aKLT5BWpESbzJ2bAHFcFA4cdmLvgIb8TpUaSPCLdChg++BAxszm16/jUZsn
	BrcJAnzYuju2OnqWAYfadWVZTdjsJCkmYBM5z3y9OBmlgUfqSR+Lks3kMgJ4yIPynSGOeqOwaEQ
	HNCMhu77OoIcQTmexUcwCIwDNoCJdgh0C5SGfXrQ2rzCVOddDme+wOiUYuqY+mSrmVZ7I0F2zHq
	cGy1mNe2Rs6omrZ+rim5OiwQ7Ao52CDvNXkODo+b+8qWFWms4VM9gfG7bBVmDE68N6A5Ot9Q9q8
	IpwD+9RFHYSVK47TtywPPKov+LdnRurYMqQ6B2Nra72r9e1JQAUH/r+FiaH8gwQx3WSWKiZK9nh
	/mtsBJTvWIr+BOjuuc/WrV/SlbHuHNSp2pE9WgBucjIuRNs+SqSClo+sN2PRx8CT0hOsKwUpEkV
	sBDDaMSAoKYMSWoxr/iqJ3SFGw==
X-Received: by 2002:a05:693c:8819:20b0:36c:dbfc:ee6f with SMTP id 5a478bee46e88-370f6ec412cmr5291748eec.14.1794115001952;
        Sat, 07 Nov 2026 21:16:41 -0800 (PST)
Received: from [127.0.1.1] ([121.125.115.175])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372667d60absm2750989eec.26.2026.11.07.21.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 21:16:41 -0800 (PST)
From: Gyeyoung Baek <gye976@gmail.com>
Subject: [PATCH v2 0/6] drm/imagination: Add async VM_BIND with sparse
 mappings
Date: Sun, 08 Nov 2026 14:16:22 +0900
Message-Id: <20261108-pvr-vm-bind-v2-0-730103d2cc9a@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAKgF8GoC/22QzU5DIRBGX6VhLYbhAheaxvgeposBhpbk/gntj
 abpu0uvGjcuz2JOzjc3Vqlkqmy/u7FCa655nhrIpx0LZ5xOxHNszKSQRljo+bIWvo7c5ylyCKS
 ScAh9r1i7WAql/LHZ3o6NPVbivuAUzpsjCNkRhdQpFY2K2AdrhfYGlZagQ0gyUhL6R1Xo/dp6L
 t8+NlKtuPXsd4dHDgjQW851GnHhOAx8mOeFr8CBaxVMb6ICadzracQ8PId5fGG/VQ3GfGlDo0b
 bQRddSM46b5PuUBvr0BmyDnxyLnkZ2GPPOdfLXD63Z62wVf37l1YguECRJHjqY2f/Ctjxfr9/A
 Wnul1h2AQAA
X-Change-ID: 20260817-pvr-vm-bind-1ce4f09a1774
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Philipp Stanner <phasta@kernel.org>, 
 Donald Robson <donald.robson@imgtec.com>, 
 Sarah Walker <sarah.walker@imgtec.com>, 
 Matt Coster <opensource@mtcoster.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
 Gyeyoung Baek <gye976@gmail.com>
X-Mailer: b4 0.15.1

Userspace MR:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/43794

This series is for Vulkan sparse binding.

- Patches 1-2 switch the GPUVM to immediate mode.
- Patch 3 moves the existing map and unmap paths onto a single bind
  entry point.
- Patch 4 adds the VM_BIND ioctl.
- Patch 5 adds asynchronous requests.
- Patch 6 adds sparse mappings.

Patches 1-2 were sent separately [1]. They conflict with drm-misc-next,
so they are rebased and included here.

Testing:
Tested on BeagleY-AI.
- The existing IGT pvr_vm_map passes without regressions.
- dEQP-VK.sparse_resources passes for the sparse features the Mesa MR
  above exposes.

[1] https://lore.kernel.org/r/20261011-pvr-gpuvm-immediate-v2-0-744ddc6644c3@gmail.com

Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
---
Changes in v2:
- New patch 3, "Route map and unmap through pvr_vm_bind()".
- Split v1 3/4 into the ioctl (4) and the asynchronous mode (5).
- Bump the driver interface version to 1.2, as 1.1 is already taken by
  another patch.
- Link to v1: https://lore.kernel.org/r/20260817-pvr-vm-bind-v1-0-0a0f21be7d38@gmail.com

---
Gyeyoung Baek (6):
      drm/imagination: Switch the GPUVM to immediate mode
      drm/imagination: Stop locking reservations around map and unmap
      drm/imagination: Route map and unmap through pvr_vm_bind()
      drm/imagination: Add VM_BIND ioctl
      drm/imagination: Add asynchronous VM_BIND
      drm/imagination: Add MAP_SPARSE to VM_BIND

 Documentation/gpu/imagination/uapi.rst     |  15 +
 drivers/gpu/drm/imagination/pvr_device.h   |  10 +
 drivers/gpu/drm/imagination/pvr_drv.c      | 331 ++++++++++++
 drivers/gpu/drm/imagination/pvr_drv.h      |   4 +-
 drivers/gpu/drm/imagination/pvr_fw_meta.c  |   6 +-
 drivers/gpu/drm/imagination/pvr_fw_riscv.c |   6 +-
 drivers/gpu/drm/imagination/pvr_job.c      |   6 +
 drivers/gpu/drm/imagination/pvr_mmu.c      |   2 +-
 drivers/gpu/drm/imagination/pvr_mmu.h      |   1 +
 drivers/gpu/drm/imagination/pvr_queue.c    |   3 +
 drivers/gpu/drm/imagination/pvr_sync.c     | 146 +++++-
 drivers/gpu/drm/imagination/pvr_sync.h     |  13 +
 drivers/gpu/drm/imagination/pvr_vm.c       | 781 ++++++++++++++++++++++-------
 drivers/gpu/drm/imagination/pvr_vm.h       |  63 ++-
 include/uapi/drm/pvr_drm.h                 | 129 +++++
 15 files changed, 1303 insertions(+), 213 deletions(-)
---
base-commit: 2d5a8313d9cf989b8f53a5689a96e891bf99fb2c
change-id: 20260817-pvr-vm-bind-1ce4f09a1774
prerequisite-message-id: <20261015-pvr-unmap-all-loop-v1-1-54c676d41269@gmail.com>
prerequisite-patch-id: 5188d944e90112e4cf2678e75255c7a91434ad09

Best regards,
--  
Gyeyoung Baek <gye976@gmail.com>

