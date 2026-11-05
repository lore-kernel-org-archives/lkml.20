Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887280;
	b=UMQ0RLo0OMVeKGudfZdXmrxnNHdYn7sQcxil2ee/sKPjS5lphW/cN5+w3EGsyde+Gt7B
	 GFngi66fPsPCLn4JYiKtXXkAHaVe4bKCzKj2F/ooRqGlfebAJrbG+x5OeWhoLqP+WcE5H
	 ggU0dGWANk1bCaeEUYek4NQblr5IfJoyGBx7eM08Kbo7fiq7vl3URwNj1nJpnR5IIA/Fk
	 C3wpVjYjAVPLPqPRmkvK6Rg2QDFMoPmzzAoMnKcoXfreflgLMig9TMtlkh2BZzIYcXb/3
	 uVQht9NQeLq8zo6IGW2z+VDW3BkQVffAUWh40I/cD99ID9vZqng/n33kEaMvG60kTZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=m3SlBj9C3fFyi2mB1vPCHBkBvVGhRO2V4RCAtxMQktY=;
	b=2KFNOBRMmDExWjh4n3AaU7yr0oYlsG2CJ1Z6GCc8SS0AOwM2SJQrbW64j/7Yb5uh9EvD
	 MSaCo66tqtxqbA4C4Cxj4Vg1Snh5/ECOJVVVICR+kbSsGIKcLvLJJntBzlY39XUh12pAn
	 VwZyzd5+BkvQWGc7mbqyqPFHbEvxOZtQgkQU9244t5mi5Dx1Hkb2b/KR4F4n0V8EePkwM
	 qWQjP48GeNwOn6is23M9XcKHqyxqEdq3HYEg+aNvyjd687Ra0RNwbNGDuNZ2pgbcd/ATf
	 wJYZqK1905IDiuanzQGTfpwjNV7cP3Q//0npTT4D6lGrEQ6D/OCYATXoHrNfsPzZpaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aZmNibtv;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1362606A33D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:01:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1362606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aZmNibtv
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b0d63f60bcso27434647b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793887279; x=1794492079; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m3SlBj9C3fFyi2mB1vPCHBkBvVGhRO2V4RCAtxMQktY=;
        b=aZmNibtvLQCEM32b/zt5WhJQTtoH7O2Fwt3NwpEzwWk8Dw0keSlFx4cWE/8/7ToiLo
         ucpFUJ8rBVqgxx3UxS0rekV2RXJq64WC8ar6vyM8LWuUJJhLzFpB7RyB9D1uDwkmPexn
         0qlpkxO17m92xV93/T5C7qyM29GFaGjV3E5OSPVE71cAOwgnhwOrEPXkMhbR0QZupgQr
         Bi2tAVWD4quOTMIy3kF9w479vVx3PnzWV2eAnlZq1yax4DNEhpiu6yrRJM+nOIbhCPmN
         YGk9m/HedXdhK6fevC7rg09WCeGi2hTQAzS1PP2+FixKq4UBj0WreFEkhbS2KhVZEkW/
         mk/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887279; x=1794492079;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=m3SlBj9C3fFyi2mB1vPCHBkBvVGhRO2V4RCAtxMQktY=;
        b=FwA7gVUChLPEVJO1lEYKAxGKQVLOXBj2EYACoBiPeKVdt/WfWhlUNmaYY0fYs1623x
         RiM1n2I85lJEVHyP2iuotihsL5yQD7qAGogkXSdb2yqGMyG/QBzJ7P93D1EKN/YPs1Cu
         A7gV/A01GwfUgqyZFocSWQgQJeyrfFD3yCafbD6Ry82ihTYtQIuDF/Q0KhwdmYwsY4+S
         Cmt4ks9JvelJaGJ5koxuUBszveZO4erPA2nuRhS2g4V6WDOkjFQ2TDVxqbVZiwpu7icS
         PMSkMfJlMPQHyU2ScmAKylqcp5okyEQBkOnx7zmm0nj7tmLDPtRYUfB2k62kf4IIj3sG
         TXmw==
X-Forwarded-Encrypted: i=1; AKwUvBwo5NMSd4Bqz+2pMN78peGCHBbD4wzC3rgcXUODUdSzHXKFDM9Gl6vCUbqeLopXZeWX0HXN9JOD//oq8oo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9shmiEVkmV/089zsPSM60b4qn7hXHgHKC3fPDR1gdjQF/X/M3D
	rW09vXQzpUm7zZWLlhp2da5mOczF1iXNpVmCVsGedH1sZ3ReuNVv/kVb3fbWKjxK
X-Gm-Gg: AYBFou1z0LbG0dolUl4eXVgpy8fHHBDbkWqIVQWleoqieWHxhtncsyu3BHGv1/siDny
	s5znYJWMGM159U0nu9LbSl+62UZULITfP41/0tsu7lnRfgNDZKTD4kX287qr6GvYMqyURbTH4To
	c3nDTh7SBTk9nGEjtgpTjlTzNpCDBeYXA3T8toLJE16lluMw+kGEzB2H3stK19HUpVnoPWuw2cZ
	XXr696rhan9WT5mz5FuB5F3csvAzdHujt8UzRrpOfyiXMqvqSfn+X0ZsCXPx/1ieAnggLgbt3Pa
	4XHEL5BpfWaIbx7sm78YvKXgx4ltoxio2TpkEYYeqUpF9jSVV//NNiikj7VZWRomFfSQ7nxBMUY
	jBNiLP5YxqVwA4eheedEQMUhvNKD2KfvZHY3BcnL7NWq8fCFrSBgcTthR36vXGs41roqjFKzpuL
	oQHJepHkB2RVQay17Gmlx6oSGZEzjrGR6GmdIkJGaMrQshR79pGjgzns/kfLrRyJ0BFOUnylf4U
	I3KgdQbkELKVNT/wqJkKT0GpV194TzDYg1F7pgngPn7KvxghB/QXkkGZKrLVqorIwmUNjut5eD9
	ccp88R2cLvEQ6hXNNuzRRa5u6swoSwG6Gq2N4ryH+FankoU8IiamlWqknA6ji3ex/HCw2ruVyCq
	P/8WkAUBVCw6iACJ43PqckT1oo3/BGxqSYvhKc6wJ9yitBVy0CJUToQ4quhP521HjaGxidRSW+9
	Htx9KucSY=
X-Received: by 2002:a05:690c:a013:b0:8b0:ce77:8dcd with SMTP id 00721157ae682-8b2b67a446fmr105553857b3.62.1793887278349;
        Thu, 05 Nov 2026 06:01:18 -0800 (PST)
Received: from lab01.myowncloud.network ([2601:cb:4000:1c5:5396:7ba1:d08a:ebca])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309959603sm41104577b3.24.2026.11.05.06.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:01:14 -0800 (PST)
From: Amit Patole <amit.patole@gmail.com>
Date: Thu, 05 Nov 2026 09:01:01 -0500
Subject: [PATCH] gpu: host1x: document the remaining host1x_bo_ops
 callbacks
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
Message-Id: <20261105-kdoc-host1x-bo-ops-v1-1-cc171c9e36a0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAByM7GoC/yXMQQqDQAxA0atI1gaMOhV6leJiZow1LRiZ2CKId
 3dql2/x/w7GSdjgXuyQ+CsmOmdQWUCc/PxklCEb6qq+EVUO34NGnNRW2jAo6mLYee5841w7BoI
 cLolH2a7po//bPuHFcf2d4DhOU1EOy3YAAAA=
X-Change-ID: 20261105-kdoc-host1x-bo-ops-7ae7a3554fb1
To: Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <treding@nvidia.com>, dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Amit Patole <amit.patole@gmail.com>
X-Mailer: b4 0.15.2

Commit 3cbf5e3c46e6 ("gpu: host1x: Allow entries in BO caches to be
freed") added a kernel-doc comment for struct host1x_bo_ops that only
describes the .pin and .unpin callbacks. Since include/linux/host1x.h
is pulled into Documentation/gpu/tegra.rst, this produces four
kernel-doc warnings during the htmldocs build:

  include/linux/host1x.h:159 struct member 'get' not described in 'host1x_bo_ops'
  include/linux/host1x.h:159 struct member 'put' not described in 'host1x_bo_ops'
  include/linux/host1x.h:159 struct member 'mmap' not described in 'host1x_bo_ops'
  include/linux/host1x.h:159 struct member 'munmap' not described in 'host1x_bo_ops'

Describe .get, .put, .mmap and .munmap, based on how they are used by
host1x_bo_get(), host1x_bo_put(), host1x_bo_mmap() and
host1x_bo_munmap(), and on the Tegra DRM implementations in
drivers/gpu/drm/tegra/gem.c.

The warnings were found by running scripts/kernel-doc over the headers
pulled into the htmldocs build. An AI coding assistant (Claude Opus
5.5) was used to locate the warnings and draft this change; it was
verified with scripts/kernel-doc (no warnings left) and checkpatch.

Fixes: 3cbf5e3c46e6 ("gpu: host1x: Allow entries in BO caches to be freed")
Signed-off-by: Amit Patole <amit.patole@gmail.com>
---
Comment-only change. Built with W=1 on x86_64 (drivers/gpu/host1x/,
COMPILE_TEST) with no new warnings.
---
 include/linux/host1x.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index e7ba601b2afb..7027adb9bff5 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -146,8 +146,12 @@ static inline struct host1x_bo_mapping *to_host1x_bo_mapping(struct kref *ref)
 /**
  * struct host1x_bo_ops - operations implemented by a host1x_bo provider
  *
+ * @get: take a reference to the bo and return it.
+ * @put: drop a reference to the bo.
  * @pin: create a DMA mapping. Implementation must not touch the bo's refcount.
  * @unpin: destroy a DMA mapping. Implementation must not touch the bo's refcount.
+ * @mmap: map the bo into the kernel's address space and return the address.
+ * @munmap: unmap a kernel mapping previously returned by @mmap.
  */
 struct host1x_bo_ops {
 	struct host1x_bo *(*get)(struct host1x_bo *bo);

---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261105-kdoc-host1x-bo-ops-7ae7a3554fb1

Best regards,
--  
Amit Patole <amit.patole@gmail.com>

