Received: from mail-oa2-f35.google.com (mail-oa2-f35.google.com [74.125.231.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12823451C1
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 15:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790438140; cv=none; b=R9MMaQSHBHiNN9xmweTvzjORehZ87jfAW6eswa03VZvabfKfBo/S+AUFQ80EIlWIOGXbwNf8nuVxvOgA6iEnsf3Soz23jZyV1+pDhFwGGp3xXhDpZCgM+QWBFhINNuflVaE7c4dbceHV4Xoe7honFTwYcgO2Vil/A0VTUtaG8Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790438140; c=relaxed/simple;
	bh=40ncbIPfZcOQVHEvCf1H+7OnCzR/I+tgBMpE0Od/Aco=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fC/KfaHWe0RW2bpoPSYFL0vmZp8x4IOHPI7aVI0wFZfpV+uiT5V47iGAeFCshy5uwJ5+O8kRGnUiWR37FbZRDyGw/GVm4B+QPaQxM8wcaEQlDjFITYW3Iuve8kSaGBufti2awa556HSuIw9HauuwOLNOYAmImcvcQtrFIbPa1rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4tpVfPB; arc=none smtp.client-ip=74.125.231.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4tpVfPB"
Received: by mail-oa2-f35.google.com with SMTP id 586e51a60fabf-49386210e98so1012221fac.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 08:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790438138; x=1791042938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FL/IwT1Hb4lximhhDXismKRaoV2j4LIwOh7vqKvTOc0=;
        b=b4tpVfPBN7BEPSjowbhGjJZg+0+DCtjWDNma6cMyU521MpofOhrQ3syoy5D33K0s8R
         2jWW7sy23oQ106asLk79jpn1PrxRU96uneBdMPhcvB2VFrUuBCUSKPUGe9YoUMAevaC9
         zWz2LyZ9UZul4ObNF0BnECUOK0VToLKvT9JaMSqC0nczqlvD6l0RPNkQVUDrNqkkiJFr
         bieVcnWNXnwE2hpadvFbjR22Xj3OlKJr1lWp/6b0Szt16csG6vdEAGMmOOvzIUEjOFV5
         20WuwReByLYZ328meWomuH60Oc4B0qWaWmVSJ4hm11baEaBiaKH89AclTH3Dl/76aZSW
         UfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790438138; x=1791042938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FL/IwT1Hb4lximhhDXismKRaoV2j4LIwOh7vqKvTOc0=;
        b=yw01BZ9d9GAFVxL8rzersxxj295x40iP0PCx8a3LmRNWHyUhuyWRrRhRDvka98+CY0
         8Bw5A+FNqgkylMgVKwmXzhX3C0tm+CE/xTbAV8ctMDxiW/oJZM51sGjE1A4OTrkDf2Oe
         vSYKVFwQkp2jTddT8adqIGMW/M38RIkZmjs7mmwSNnvjLryWAgu9USJ4yV74p79QzEL0
         gqiYqcEGPcG7uheMwoM+azeCi2hJsuKotv3H7kcCQoBjFs1PY7qLD/OVtvtNOKOBsc7d
         sd8sq+kTvS3xZuA5JuKCZrMvO+SgNGF8llZp546faSB3SOECiyWlfHXnHMLS8jo+ohpf
         nwjA==
X-Forwarded-Encrypted: i=1; AKwUvByXRpbvbcSQyP7PNlPTPurDZXtYcEnubXsuW5RfATvvvvMzNIHyNDzEE2HJugQ1NfZpy3DaXpWow/r6d4g=@vger.kernel.org
X-Gm-Message-State: AFuF++m/9Dqau+ieP81rxpSVQC8H2v0Yzg1tjmaOx3mocPjmcaYtbfJZ
	EwpNJpydkyt3uwUYBrkeGglRl8aD4iwVzOzO6Xhn/DEO9QfIrOSo98fg
X-Gm-Gg: AYBFou3l9iDhfu3qdz5u15T7s+4SRfSd5Wcd7YFm/xZsS0tO6et93untmVq8a7fgk1i
	vIMIVsTnonVz2VOyYHe29xo1hhmKrRRkYs9pvYVRsKd6fpPynVrRaal0ESAKe3Er5ZICtE1MZpP
	9Jgr8OL9YbnuxJBJcsHNk4/Rmh+N/K6y+MM3QGiXa2fR2E90Pjlllst99lfatRXUtAoqr5s4247
	gAoHTuVF8X1hBqPlCVRvw4NOmIZhVjlyaA1mqJaV+HBWxbNENFQDvjD0K6DoWOcX108VwP7i6k0
	XCtfZUeZmbIBupLoH71Y9IVWla5+ciGdskQe38DMff/lM4OYGMTI+FoodnazNyhqlH/LXYmiCjM
	An6f5WGJUeXVhEg3GzYGiYUwfCSySQ2Hr4QgwIpNfvpX1nrkp+AGR7Q9+tmhqOgk/WYFLDMGQ+9
	F1xWtskGRWkleq00jNIgnaOR31rXzGQJpkobAwyJkWGlrJUU5VZqmxSUnmFhxPP5MAQVcPVNfgu
	mLhTMwHXAemehB2kallSwu6XIVWC23rhnSdyTkI
X-Received: by 2002:a05:6808:1185:b0:4c3:b6cb:da37 with SMTP id 5614622812f47-4d72df6ccdamr9178567b6e.35.1790438137587;
        Sat, 26 Sep 2026 08:55:37 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4dbf3d74e99sm4577446b6e.4.2026.09.26.08.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 08:55:36 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Shuah Khan <shuah@kernel.org>,
	Andy Chiu <andybnac@gmail.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH 0/2] selftests: riscv: vector: Fix the checks of the child's exit status
Date: Sat, 26 Sep 2026 10:55:33 -0500
Message-ID: <20260926155535.306111-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two fixes for vstate_exec_nolibc, found through a kernel test robot
warning [1]. Patch 1 checks the return value of waitpid(), which GCC
warns about. Patch 2 fixes a check which never matches, so that a child
reporting a failure no longer lets the tests pass.

Tested in QEMU (virt, rv64 with and without V) on a v7.3-rc1 defconfig
kernel, running vstate_prctl as init:

- vstate_prctl passes 13/13 with and without the series.
- With the child's vstate_ctrl check forced to fail, it still passes
  13/13 without patch 2, and fails the 6 affected tests with it.
- The warning is gone with GCC 14.2 and 16.2.

[1] https://lore.kernel.org/r/202609250003.hvssJlRZ-lkp@intel.com/

Danish Khateeb (2):
  selftests: riscv: vstate_exec_nolibc: Check the return value of
    waitpid()
  selftests: riscv: vector: Fix the check for children exiting with -1

 tools/testing/selftests/riscv/vector/v_helpers.c          | 2 +-
 tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)


base-commit: a06776565b9e73512e880a95b66c198ae8e7e24a
-- 
2.55.0

