Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793392034;
	b=rT+QE0l+rnd1cRfCmYjhXgPT4YhSHFnaAyfnBNdRNZBShcU4Vv123KIhCU6nCSjXIpAd
	 /uTLob69MhOLaTzyISgZU/6Cs3YtzQD3IkzcgpdWpStUg8+apobRlo6ZQANbIk7/oIKwU
	 BO8fGZEcoxuArhHfWz2q/Cp58BywCqOwMwEoCBZzPxcsVGCNlis24GxvsC2Hcp7QnxTsW
	 3lWoq+Ayj4Yadas+NsGt3DzypgmYnsc0aWdAnXYLUsK7MjPEhFYyUTzoAFDPVuFrols0g
	 5AbP2w6y5a3U9P46ZGtn392VEO5JY/SmeiDlPGbM7CfCkaKTHQR/LMo/oOPZ9gXtwNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793392034;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=pqXtFs5AG3LRq9IHK1NyNxo49Fa15UvJPSBSbnkjgGM=;
	b=2J2kD9vPfXxagKmAkCmEO9Pwkl5ezRZnawgYhWGqIkowXFPXHjDRZs8d58z3xulEPWZQ
	 w8L2nl14UstIMJq2mnx8dUBi8zeSEAn+Lj1XVsnRYl1xOi05GN+EIppNcE1pYXD+XhmgX
	 tsZqLbhbBA9EJHFehs48r68NDPCgx2HhYz5+Xog2FxqtKj3nIINxIxH1FHaza1SjCxq5+
	 xezrKyJT2oqumq7u+yUgQx7qmskrIsFYFDAnhGwYitzgUV1bq/k6EDiBIsISHM1e9Ofsz
	 Mr2udUua2OWzJKeBQ0plqQ/ZX9ri1naZeeiV3PQrD3iXgojAkJTrUws/s4gotL3zy6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nWL1UzBb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8D1606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nWL1UzBb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58A271F000C1
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793392034;
	bh=pqXtFs5AG3LRq9IHK1NyNxo49Fa15UvJPSBSbnkjgGM=;
	h=From:Date:Subject:To:Cc;
	b=nWL1UzBbxtJpdLv9+0CU0zRqqOH5mG5Kt1H15HVsF6FkknucbdKB2Z3mpRftM9AtZ
	 RMPIzo8AHlYvwiLJjURF3FrLAn4mjeeC/Di13tpuZEPMebPuABOOMG/HvqFuLAYN4C
	 Gdm7MVQ8pwfk2YLVTjViUmkpXMolXZRG5uxaQ7afjyYGfyvMtdZVKOsbx/8hp8Higd
	 prziwV3Dp5cYYcCpAapeKKAb5bs7K9TGrsCKIZ1Srl50yFbx0x7PacMrAjO5qVpTm/
	 E+5ElLp4E0/w+uneSIVwa8HbCMRzs2er1XpteuIx01C0aip2m92WzkNCcwjvf2HF2x
	 3skClmysaT81w==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bcb0f245e0so1099767e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:27:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxYFHIYPRVRAMRHGItteYG1oT2rHQJNmFCj6+JFLKYCuy7PtUrsHqlMyXVl5LozyEiGvXa7mUTPDw8wbBk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5uQXzqRdpRVeyBNHFz/6NSEBXIoFDsPCwRai2xmez6pVfxM/p
	54M7v+uTJY71rkLUyoW35nL+px0VQKJ3StvOyuAHNOEkNzeHVYOTW+4C3gmu9yFDaUK0JfDiGIU
	jQh5FlxHkxA0grAGWos1ybVdYD9r0xy8=
X-Received: by 2002:a05:6512:3f01:b0:5bf:9f5e:fe0d with SMTP id
 2adb3069b0e04-5bfd95605d9mr1305709e87.23.1793392032873; Fri, 30 Oct 2026
 13:27:12 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 30 Oct 2026 21:27:01 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0iNLS=-XW+LeJTa5ttDJGs6AcQdMOxaFTCxhXu78jnsjQ@mail.gmail.com>
X-Gm-Features: AclHuK8SSOaqftR9NTiZdUwfLGjA_LieVokjUgZaaB5F0Z1De1XQKPUmop8daEM
Message-ID: <CAJZ5v0iNLS=-XW+LeJTa5ttDJGs6AcQdMOxaFTCxhXu78jnsjQ@mail.gmail.com>
Subject: [GIT PULL] Thermal control fixes for 7.4-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux PM <linux-pm@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lukasz Luba <lukasz.luba@arm.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

Please pull from the tag

 git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
 thermal-7.4-rc1-2

with top-most commit 4358090906b01806ee483229e8d7163b806bd116

 Merge branch 'thermal-intel'

on top of commit 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614

 Merge tag 'driver-core-7.4-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core

to receive thermal control fixes for 7.4-rc1.

These fix three issues related to thermal control:

 - Fix CPU mask truncation in power limit trace event used by the power
   allocator thermal governor (Hungyu Lin)

 - Fix code indentation in create_s32_tzp_attr() and rearrange it to
   use early return when applicable (Thorsten Blum)

 - Allow cross builds of the Intel thermal tests (Sasha Levin)

Thanks!


---------------

Hungyu Lin (1):
      thermal: Fix CPU mask truncation in power limit trace event

Sasha Levin (1):
      selftests/thermal: allow cross builds of the Intel tests

Thorsten Blum (1):
      thermal: sysfs: Fix indentation in create_s32_tzp_attr()

---------------

 drivers/thermal/thermal_sysfs.c                              |  8 ++++----
 drivers/thermal/thermal_trace.h                              |  4 ++--
 tools/testing/selftests/thermal/intel/power_floor/Makefile   | 12 +++++-------
 tools/testing/selftests/thermal/intel/workload_hint/Makefile | 12 +++++-------
 4 files changed, 16 insertions(+), 20 deletions(-)
