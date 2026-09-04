Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E804740B0FE
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523569; cv=none; b=QCdniUZOOhp9iDr9qGmkIjvCDomXQz/ZrVH2GMA+591J/Q5iAd7eqmAJ1UVXvJA8R9OVci5D6ZEADhQKU5BhzrrAGkZcuKfO2s4XBhBopS2K7No4jQS3vbq9s1LjmzvshlT9mciv5UDYLTug3VKPZYmWsVg/XuZtArcz0ATtIks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523569; c=relaxed/simple;
	bh=z1ETKyt1Emqvo7wJ2tx0H33dchfe4g3es1ATU72Ufnc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sj0eZDJUSUKR5BedUyraqieWJ7TkjKhiQyGkiG9jqmyd+zn7nO95abQpLvlNGvF0dt5LRIAJcdwxS6Oz/gLuwtL4spJGSylpJzueEL6x5471CydJThaxNNoGut3rlaXRML7DxM7vx4fAfcjdO17yfiDK8P2JgTbHf6AcmxlIoXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UXAwUsxk; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UXAwUsxk"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6b7b4b08d78so303149eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788523566; x=1789128366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IKUxoStCzIWWKxxqx3mMW2hyTxY4VFGdAma4/UqzvPM=;
        b=UXAwUsxkDovkSa7k2m6tw9OFBiEV0RIVFiuPc7hcanjnfF9uVglhd5Wu/5IkBkdPqJ
         db0g/S/siqetKar9IB2cC6DCmm8QNGlkpBCk/JZdEVxew95K016+LR5JhPvVGOqFcl3/
         E/f3LvPzdyG2t1N/XPtt+TU8W2FxNs2b6SRUKLB/+sWJt5EFpURVPwBluZWN0QPIZ/f7
         CzDL2gvBA5sl2jDOGzG2oXflcat4/faroXnGHsY/8x8MS+xB8Yj7aEISPKDtS6q3tcyN
         BpJBfis6rigDtptuCsPNVLJs7COTjMl0bELOSLo7otk8JMt6gqQ+/DdAzP2GZYVU3HFD
         27rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788523566; x=1789128366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IKUxoStCzIWWKxxqx3mMW2hyTxY4VFGdAma4/UqzvPM=;
        b=QWMu0gARG4qO7mUXCasMIZ0u1+CtnmEc8jC+4SsgBzs5wZqe7iqW9HGVuDUcZur0EP
         Msc5mPmUDkZEIvR85gKr+6Zt08ov2AdZzkH4jsMzDiHKaUjrUqbhrwXzNkmJdp+LVwG9
         solVqCOgny2ir8jwGvVR5KspD2JB96SSt0WDZhhw2awA05Zbi5e0JOTGZEOgHeKhdvxd
         wnOmbcdO+Csys99dJOSRu7ig8u/XclNBsjsW8n3F+i/PwmTSCxNVH+Ywmn2iAXRIyREd
         j22qvwz5+xK/RI+bagwntRr+HPH+l/Th1QN7ZjjJ5xNpzTCVmfVj5wtGUEBytlpiI6Cj
         6EgQ==
X-Gm-Message-State: AFuF++lNOjrJEkubeD4w9+PCpiM5u1grYQIbLIlNSmlCH4H0D4M2+Rc5
	K5QX780ETBCaUfcmQJ4LjyiGOEc5aa8pMvWgmt/2oz6V6e6pA/m9rDBS9OmUpnxzWuk=
X-Gm-Gg: AYBFou1oZlVljHLkDIYrGI/T3Mhui9s2w+2JUwMEYi3Q8SB0kmko04+H42pJmvBQ8AR
	EQ5aUTyGt+JrI4KadTEXTmr5ysIpD5cLjICQmCFI27B0ahL41YMIQNDnciq/gMFfrMjGVxKlYr8
	ejvc3wYtQmIQ623E9AOITC76Ize8AOm1gC7BNtIIUrMBJ5x6vBoJZZEneuq4tpm/kuaP0/U1aah
	ID5Uw3SGqBqQzTORW+BQAy7dmuZnATwAL8YXCUIlfPFIVKyTluWE3bWR72KrBPnaHWAvPzKRuNf
	IgDHEx9tdUeCFPF8frYmja6DN+jeaNk/C2ceAun1GJWHRc5pIqqO4t4jjLsBzrsq1aCeVrvYZzg
	RVLb1R2Ib+14ic9+2OIGmjRP5CMTqGqof6ftV6yCnnKxLGUW3zTeaR+v+Zs+WFTe7bqVqIk7zWt
	P2ueTbbptITlMKmD81pjVJk6TI9W+NVZ2QlofNjThcc3MXrOGyeFXD2X5yU5j+vFmLzlB1miLaR
	A/c9UuQ3hYuKi8=
X-Received: by 2002:a05:6820:179b:b0:6b6:b5c8:7432 with SMTP id 006d021491bc7-6b6fd1cab2amr4577353eaf.33.1788523565489;
        Fri, 04 Sep 2026 05:06:05 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f44d7sm6321674eec.22.2026.09.04.05.06.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:06:05 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm/msm: fix typos and repeated words in comments
Date: Fri,  4 Sep 2026 17:35:55 +0530
Message-ID: <20260904120601.18363-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 2 misspellings and repeated words in comments.  Each is a
separate patch so that any one of them can be dropped without touching
the rest.

Nothing outside comments changes.  Every touched C file was checked by
dropping its comments, replacing each string literal with a placeholder
and collapsing whitespace; what remained was identical before and after,
so the compiled code cannot differ.

The mistakes were found with scripts/checkpatch.pl against the list in
scripts/spelling.txt.  The scanning, the edits and the changelogs were
produced with Cursor running the claude-opus-5 model, from a request to
find and fix spelling mistakes across the tree, and every correction was
then re-checked by the comparison described above.  Words that name an
identifier were left alone deliberately, even when they read as typos,
because correcting the prose would make the comment disagree with the
code it describes.

Tested by building x86_64 defconfig at v7.3-rc1-269-gbc35965f6940, which
is clean.  Nothing else was built, so any patch touching code that
x86_64 defconfig does not compile has been read but not compiled.

Hemanth Selam (2):
  drm/msm: fix typos in comments
  drm: fix repeated words in comments

 drivers/gpu/drm/msm/adreno/a5xx_power.c     | 2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c       | 4 ++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     | 2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c  | 2 +-
 drivers/gpu/drm/msm/dsi/dsi.c               | 2 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c       | 2 +-
 drivers/gpu/drm/msm/msm_gem.c               | 4 ++--
 drivers/gpu/drm/msm/msm_gem.h               | 2 +-
 drivers/gpu/drm/msm/msm_gem_shrinker.c      | 2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h        | 2 +-
 drivers/gpu/drm/msm/registers/gen_header.py | 2 +-
 include/uapi/drm/msm_drm.h                  | 4 ++--
 12 files changed, 15 insertions(+), 15 deletions(-)

-- 
2.48.1

