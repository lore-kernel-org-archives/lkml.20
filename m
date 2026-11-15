Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739096;
	b=BQfOT+XDt5/quWrseQZkOG5qT/uw0CufxpPxN4L4Nk8/RgaRqKhD1HohIK6xAxYEnV/y
	 GJv9B5L8xcoiJwVPbpkCeDkl54iFoORW9nHJ0/8wzSkAK10bC5yGiRYwXPHev17dhmV1L
	 K6+jvRi04bbGBWVAMBaaUIJBFSatrRJMlqgzD3q6JWTjGjMPyCz8/hNBSNE3C+XjyEwfn
	 j1+ViO5V4Zeui2CGqDMYA2G35akBh0I+D4bwdxD5TbF7HKajIFChRYF49QasjJA/+Vfod
	 3N545R+HYFGV9g7x513V5fdjfb+YvJ8/Zocj4pP043TmKU7NSw4gayTDuSPhujk4D2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739096;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZusoNZU6khAnOUs3v8FJNDHnjuAcXmNrVLcHMCyz7ms=;
	b=S1mclaD6qN4OREjPLyo7a6cEgkBLA1yd/oUl3YD+eVuR5cEKuH1r6L+FIy570UlMQWIi
	 ekNfS3bXTmShkiSxCgsEKN7C3de+EJH9nNQ6BJGeeUpwWQANqINvbDydtXDS9kCXbJ2Vn
	 UgAGfe1S6CR0KsJbmA5z9DeA27fQnpd49uOJ9kinh6h6yVG47pogjiAqpedDKKJMWzqjJ
	 YCVuBojGSwh+efpQtUiY8zKSh1c0WQkIH53ShnafMV4KUNRYsNyZBF4f8f7VOsfjjC7Yk
	 EE+HOPipwHY5cePevS926iSS+EKZT/cxqrxTzg9ilKJKYVUqj7VD1ZRBkHVkCU5uCyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cOrh6nLT;
	arc=none smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9151A606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:38:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9151A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cOrh6nLT
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ab3b29a1d4so26038141fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794739094; x=1795343894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZusoNZU6khAnOUs3v8FJNDHnjuAcXmNrVLcHMCyz7ms=;
        b=cOrh6nLTyvSrvI/8qt1U7g6cHJ/cqqpt8hhN+S3kOLMbwJVkfu89LuJj75df0azoHg
         NGbeyKkHyLep3fbsxp9pswcfO8TAIlnUm/ExDWzEFAseXYfjwY+RfQEEc2w3WpfNI1Ik
         fPgW/1Gk+XU2TABTNohyZjCp5O9fxoYAxPjfzlysC8uKDqFNrATzthvvk9+VLmtrHJM7
         4AO/rK6jTfPdly7A8e7y3yX5FPJk2OBAi05oUm5K2DZiLUwA0zaKvsxN6zMQqFWzaNvO
         pO92o6CvtHXeVApLCpUNJKvOMKggRnPqjUsIqzcm7uumvQziNPPGoYBXnohsUc/7s5Zb
         B1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794739094; x=1795343894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZusoNZU6khAnOUs3v8FJNDHnjuAcXmNrVLcHMCyz7ms=;
        b=Dt91iVVGSoKKbTwv4PB+XR8wEtWCBRdBAo8+SzyuX9rJngC9TbHKh9NC1XOWv3H+WB
         yNcW2s+ozPQB6oZ0u7Y28nhoIG9EEK1L+Ej89Y9P/zR2dE/3VwZgHp3QSzX5LyzcBpiI
         RGw/S8NYJ7Mn9EBAA8tEv+DeaMAWl2lvnAHotfMB89y9vrj7Iby+KqCosPIC6iJRzvMv
         tfBj4pzYDodFmKSiaQvnukw41BEEnTfnJVxvcE3AS1mzEGsyBYA0Q/fpjnfL9ou2NV7A
         YQ0FJKB709GJ4fFVrpI4O4CEwR1VkNK22MVF7b68BDsFhFxn3ZBbSuILOGtt0NCq1q/z
         G9hg==
X-Forwarded-Encrypted: i=1; AL+hErHBM1EVdekjDSWP1UdvI2NfePKo13uJVeCY/wHaUvlKz+WxtSRTcoOh1eMCV5A6xYQsjt0qN5FOeBrhtow=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FoYnY0hRZC6qrc6ck61WXuqdS6Dg76l24nixc866w9NSHDh0B
	r2oU6vVr16HfLG2f3oBynNp0z25elhtpZeAee23SdEHDyOXoa0NS+gtZ
X-Gm-Gg: AYBFou2dYE/EVBw7G5qXNIG4d30xPIpEsCPB5UqYYRNWJr4i6H1ZA2Oh3p3Y1vyx/RZ
	hslRTQdNiGONVvSV++qYndnicW5SWH9kzFnmiU93DRYerpwhtA6HtumeqpQ+E+F5StlgCw0mNGh
	lZdwuyB4L3qKU4kBa4scu/GH/gnn8dqVFP9kcKmPkofGGGFMpM7hVeOqzZZiU4ZxaqsQx0aSCpA
	+N7KgWo226koZ4cmCncC5mQbxUPRjk1s0i8BiWtkg4GHPAGink7MbsdaG79ai79zb1GJUra1c+a
	8X6YY7Bu8sMumaSig1cz6uAfRfkV95btJrMhg8TxpS8woM+Lqqlc3Wkf01MSg9TIIuN3OjK8Dao
	r5Nsy7eiCkQL98GPSOs2+hnbGsJuZclF7iJMxhNsx8hfOSWB/qoJzG29Ebd01T6u6UGCogBiBxR
	i6GRRMCA9RL7UiWWUVKk9LcJtOGYxt11+8+xhTsZ0NhVfThEOTpYoUeqSFVM5LYbuZDv+ACxnEA
	Y0yYuo1qiZrNz7gDZXmnM8V6ZDyAoF7qSsc7eRDlXE0TSuLt6u5+03GIWc/kQwYJd5ofRFoVrbF
	AfXMqC8BO0gGOysMNfvBnwD5yXcP40PzUeyY+mFgJmzjhuxV5O9Ry4mfeheWcW96ZU0NdrOi
X-Received: by 2002:a05:651c:1b0e:b0:3aa:fcfc:aa9b with SMTP id 38308e7fff4ca-3ae2b536dafmr23039231fa.27.1794739093624;
        Sun, 15 Nov 2026 02:38:13 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17135649asm2304491e87.77.2026.11.15.02.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 02:38:13 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v3 0/2] alpha: enable DMA CMA support
Date: Sun, 15 Nov 2026 11:37:41 +0100
Message-ID: <20261115103809.1288167-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v2, following Matt Turner's review:

- Initialize jump labels before parsing early parameters, so handlers
  can safely change static keys. Carry Matt's Reviewed-by on patch 1.
- Page-align sizes in both coherent allocation and free. The CMA helper
  assumes a page-aligned size; truncating an unaligned request can cause
  an undersized allocation, an overwrite, and release of unowned pages.
- Change the failure message to "allocation failed".

V2 was boot-tested on a three-CPU AlphaServer ES40 with cma=64M,
including 32 MiB, 24 KiB and 8 KiB allocation tests and GFP_ATOMIC
bypass checks. All of those sizes were page multiples, so they did
not exercise the alignment bug. Those results are not validation
of v3; build and runtime validation of this revision remain pending.

Planned regression cases include 12 KiB and 20 KiB requests, checking
zeroing, mapped size, and allocation/release accounting against the
page-rounded size on each CPU. Repeat the existing static-key tests
on a combined kernel with jump-label v3.

Reservation policy is unchanged: prefer top-down placement below the
direct-map and usable RAM limits, with generic cma= range overrides.
Other reservation-size boots and no-IOMMU testing remain outstanding.

Magnus Lindholm (2):
  alpha: parse early parameters before reserving contiguous memory
  alpha: enable contiguous memory allocation for coherent DMA

 .../io/dma-contiguous/arch-support.txt        |  2 +-
 arch/alpha/Kconfig                            |  1 +
 arch/alpha/kernel/pci_iommu.c                 | 19 ++++++++++++------
 arch/alpha/kernel/setup.c                     | 20 +++++++++++++++++++
 4 files changed, 35 insertions(+), 7 deletions(-)


base-commit: 0b4cadbe7c39d830dec35c4a2655483de0dae568
-- 
2.43.0

