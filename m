Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7421B4BEE29
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164596; cv=none; b=VoNudmVWm/IXYoJpcpBC/M7/DpvXgj1JXH93g/G8qigIKOqJyNQfQtZMSY6eYZXCoCyb/iV2AkZoLk+36dylgRZ3qhFrKK2BYkE9zSNN8PuQgQVbB3Hfa/LUGHK1lDSIdcaml3MoPR3RbAFHnbgyrT4wrKl6ibH2yDqM5yc/0OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164596; c=relaxed/simple;
	bh=t+Do4nGFECT6+LKHRKvJVejkOKMJELdYcZO6ItT3PsI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iskugJpvpDRykcWg+6L3ickCqMtheYKjj85STMgmAcOW55G0N7BCMDY1aQuJL6pg9K1GuV2Q8zuq8OvV0ukjC+CKBvn3QEfejfxXr04/2X4dAQiYI5jxkSZRIk1UjBWMIgY+QCCg1eZMKEwndk5iwojtgbHhA98m35A0JJiP8r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UXVKXqDY; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UXVKXqDY"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccff31419so488895e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789164594; x=1789769394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dk8RJ/gWGUzJZL37Z13wVy/RHkm1H9VT60iwGnpNGc4=;
        b=UXVKXqDYkUXMqC1VF7c5oSmOINGOJjIRwB+zt63W1TugeVgGhA+4fA0uWFfdCxMnml
         JY8aOD6UENqwML/LorPb3nBylNitbNjBtkbAOWs3l9pNaLZZ1YeN3Vjkc/EovEZEI+4O
         bpRZFnENG8YuAf7qOlL/zoyFyyIK2Nemdl3BD6iS6HOBUewYeUSkiuaVxKeKt5rjloDk
         okfVGjgHoYrKlWgOoE5s2SczIkCuuahrw1Isgb/zKXwtuSGVEhA8YHDV3A0+QGeM8Eq/
         cuvoxPx6Rgj+7drav+4YNH6hUcoJ3itgi2nFP6n9IECVTDsrlhntZODs2ibr7+isStYY
         v9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164594; x=1789769394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dk8RJ/gWGUzJZL37Z13wVy/RHkm1H9VT60iwGnpNGc4=;
        b=HYAaNABi7V67iO+ThjjBe5C1ZdD+/zZPgch1+Py0MzrUy6VlcsRUOtOXPuApicBv5w
         YLKwizpPRbFbWlNYleh8WMhoFoR9/2vus8d5Kqv2YxrSW3kc8T3kdVlC1DYACX8UnnaN
         8880jmgFxt3P4n2hWHmEQy1xSG7Nyx9wcBdIRTYEGZNX3M/Ld80wMNHJzbJ7GrW20wlT
         etI85oR55UHa7OxOlXu6SnlPLBFWBlpjs6T2bsBLQlq7LBxcsWSP5hSyv/V9XNM8qynd
         HGWPbbEuRvBqLoio0gY+Q37ipsQwmklTi7DKN9PhzIfZI1qOfhMaTuVEHjmN6+EiMMrs
         Dkvw==
X-Forwarded-Encrypted: i=1; AKwUvBxjdeY8a8WY5Rw89C5YvDe1i7uS4mRddKvHSJ4MTXY9b5S1kgskPRZ1K8WIcC8k4MOKvmAOL7BSLqZmkwQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lqsuc270s5hYoYzqWwwA7pKFiLJSsBqTVh9SDDA3D/UksuFgDL
	oRaPwk21wnOheXiMBGDDP0/jokNxQtBkHTyXqx1yWiIdEcKa67flagl8
X-Gm-Gg: AYBFou3YNhL0xfAUs3mHuPxTtDnATWsaCDBarjLpL2TmTxxfaklMjDXnkbKzcd5mMaV
	6cAePtmCjcWKbmieHjb5+TgyaqTaShQ5hSdMgsjR2sztJO3jGOu9/kHqdoEZ2N9WyclmwkHeb4T
	DUuCK9TCFXOR51e3rulLFYkko2tjbETEGVnWNC7gjX04uBqenRGVOOCSXtV2ky0kY2IwVpHCHkN
	JXmEyG37NIkj42g0awn3OgBe7iY5+5hojAiv4GGTAStxRR3McbSq5XY6HAZaWna8l8J97A6Bsqp
	uYSInm0T2U02kkFQLsUM1YKhzICTPSgjTunX+LdEgsTqCiHAZWHsX4r5xLembgxeh04keq6kMvT
	MkWsrXCHDP3rHnaRj/cM3QhbNeGVMTFeAIMNsMuNzU6aIxyrk1qdqLyXOta2lsoNeF2i3yjrp1o
	HFeYj2OI09GKvlRum4Ag4pvcwsl1jmTzUNiCXZAKnB38dyLQIG0bV5gG/t7H4pRtyfEkx9S7vNl
	dKmyzCMNMvnsQaPwKPpBSkzcsKrRyLUkyNu55aS8AOba0kFqev8hXHGo9ITFLABwC2Ad4PhywfD
	rrfhwkKzNgSIAJwtEhV/PbjL5lM/r/ANZS3DHGd/6vmYPcY=
X-Received: by 2002:a05:600c:3f16:b0:49d:25b0:cc60 with SMTP id 5b1f17b1804b1-49e6cc13c99mr904955e9.29.1789164593578;
        Fri, 11 Sep 2026 15:09:53 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e69f02c92sm33383385e9.2.2026.09.11.15.09.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 15:09:53 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Maarten Lankhorst <dev@lankhorst.se>,
	Maxime Ripard <mripard@kernel.org>,
	Natalie Vock <nat@pixelcluster.dev>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	cgroups@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] cgroup/dmem: Fix eviction helper reference in dmem_cgroup_try_charge()
Date: Sat, 12 Sep 2026 00:08:33 +0200
Message-Id: <20260911220833.6958-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel-doc comment of dmem_cgroup_try_charge() refers to
dmem_cgroup_evict_valuable, which does not exist. The name is
dmem_cgroup_state_evict_valuable. Say dmem_cgroup_state_evict_valuable.

Fixes: b168ed458dde ("kernel/cgroup: Add "dmem" memory accounting cgroup")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 kernel/cgroup/dmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/cgroup/dmem.c b/kernel/cgroup/dmem.c
index 4683f3d6802268ddad40bd5d9e10305fc4dfddc5..13dbd083f6dedf83002ee7e7912e1f983e3594f0 100644
--- a/kernel/cgroup/dmem.c
+++ b/kernel/cgroup/dmem.c
@@ -706,7 +706,7 @@ EXPORT_SYMBOL_GPL(dmem_cgroup_uncharge);
  *
  * When this function fails with -EAGAIN and @ret_limit_pool is non-null, it
  * will be set to the pool for which the limit is hit. This can be used for
- * eviction as argument to dmem_cgroup_evict_valuable(). This reference must be freed
+ * eviction as argument to dmem_cgroup_state_evict_valuable(). This reference must be freed
  * with @dmem_cgroup_pool_state_put().
  *
  * Return: 0 on success, -EAGAIN on hitting a limit, or a negative errno on failure.
