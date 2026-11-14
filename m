Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794645608;
	b=APcnLB0Q7/br8lzD7yi2ghF5EbPUtMjyOQo8168g3qujgCrSFOcsbQa7I5EQtL1ufo3C
	 pNJ2XcK6C6INm4Ftf1Xj4+woZ4j0eFZAR1OzrwUyNdy1JgmkXe/nLSI1T0z/GYFU29wFM
	 jX2Llfq4lQIYtzJnx1yc1wmj8Ek3tylUxVSVVuDWVCRp+zMrvfsr5QExDq31bhamW7WOL
	 sqnexkG+L0WzydPvoEd4xysiGjT5Qvkh0V+5QisXYVI8UPS3Ou5gVoR3/HyMBYCzwoP7o
	 YcNW83XOFAMRaVNXi6qiJ/VKdtxfh0iDrZgJTK9bDeSleaosX2M0AkM22seyunZZxGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794645608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=DiDcxP5ac6YkeYjA21NF5sNzCAmKzyT92ze3FWnxVUo=;
	b=3bHnnPsxtK94Wb08Ul9/UIuIL3Q/QmTyExN6nezTwTm41BRqwAiLLKskH+LP6637zLuG
	 jD/i7WtSeIObOhTbmWMuxiBvwOCW+66OATkYMG/NsDKrFPzIezqnzYCKrE5Okdy3k5rSi
	 H5fJmjHBIYvDFlvI+GaE6tj25AVV9P/MhplA/O5tVfOwL6bTwOuk5eVYVq1eWze+Wosxd
	 l55DVfmoddEbsTaijLKc5uG8wLeSzMV7qWgyBMVSlDE5kSYXf9tEn3dmO6jDoZ9G5D2OQ
	 0IvXohonb62a/B7j1GiMIwHbcgIVSYHLl/Z62iWQaPoSMDMWzKiCaaacvShQnrzqVqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HON4X7Lm;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADC9606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:40:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ADC9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HON4X7Lm
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb5f49a61bso2968455e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794645606; x=1795250406; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DiDcxP5ac6YkeYjA21NF5sNzCAmKzyT92ze3FWnxVUo=;
        b=HON4X7LmrXH38CzdiBoJ2lTpbzqOpC0U4BKORyRuY2je5615HHLNd5IKrIxzgC6m2R
         YdNYvB2NCVULFsvx9xVtFyaJWfLsNTJqE1OVU8xJIoSbFal60Wo+rS2R/ABszMsXtBb5
         cPL5pUJNT0SUQ615S9I+/Dm172P/Dp5u61K/vA02MoXYda1UakLquJy/iPgGr9CjYeLK
         R97vdOIt7wyQFcEa7tfivKFxfPcXVIa2e8RByUTxz6PCRLyT7hBdZ5mbpXkYaltIdaES
         4QGQsVHZSWAzPqgf3Vi3cdQGj7oBjXqJrGbZ+C+C198GfDByp3BflUKznGS666i2ia3+
         wd/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794645606; x=1795250406;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DiDcxP5ac6YkeYjA21NF5sNzCAmKzyT92ze3FWnxVUo=;
        b=Yu2VB1KX6uhjnLtGAKW/pqqFAdVCfqW8LtwLbjX2LScMwkhRIO3l2LgIdiEFl/qISa
         shGiemZwUBexcaaUeu4quQxUbg0z3JG/+Cf8hSMCZkFUXPitI4RV7FWoXJiHKrlkgBGy
         ZoZKTp8VrZbC4oVdhJSaUB7RblVyFH4YVypLfJHuWcrhfhQkSX1kmII9hzLldIbj3QjO
         VRNc3WYIpfgkiOIY9tZXQq2zQevsu28zdrctlb7FpXOTZGLbdIw9wtmOlm58PYdLVoZV
         2wN+7SE8kYL++NQyghoiJ5eZSqnWsN0cfKDX9meFfjmsaqo7A87gmXKgyQgyHblwOxnp
         wOMA==
X-Forwarded-Encrypted: i=1; AL+hErH/hGjJC6dE44jAzZNVf0q+8gle8NWod+RX2qIfowlz5E/evkOg7PNBNMoi0eYPDgXvv9Qe/oWVOSHipYo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9g5npqHS8jibsJi1yPX4V3h1DeV1gp5LAsl9cNyXHuuXi0GxMn
	UN3efLBXspWX3ORGhtvW1O58nQm8N0C+EqZYbeuDdfiihzlIpouY3bNS
X-Gm-Gg: AYBFou1Dw/hexKRCf833UzqGwJpxN09l7iKxCMpjBWFd3A9xEAYKk9uAkHte5PJTmiu
	ZFdW6YuKqEtEmkXrYKkwSB8nXBMLw4Kn+sI0DkWtA7QRH0NhP91WTbH26FhuquPaC+4tMV63B++
	7PP/WI2RzqbDD9nntYwpUNSdO4rZ+E0kDKZgHuT+45Q6ya6yVEz20rQwXC1XC8Oog7/IAiRA9TG
	H5VnbkpFSAtd18QDiNpUA/cYYfr1WaTVyYj495qcnMAqQt9CVyg9w3VZtoImX8w5sdGZto8qdnX
	BpOLF02qO9etZqmKAnw2iP68QPpU7rNZ1djJjBc5xo/AaRiefGEmb/B3GpAeyKcqW7PV/1UHP38
	UevzMGEgQmZkLmUE9+ADL4NmGXE4/LKw808dO5EkZ/QbdQOlYq8/ALaopOHOUocKhXro6hP6aBS
	ypFFaTpGThssLOZD+7aQwkuEmb3Q/Am99q/AVlHiPCoB9p8EF6aVa4c0DtlDBobHJw+uHL+9CxW
	6NhhOTDAt0/bwT34NF6OeMIwbKftrENBCMQ4lD8QRK+MaUtErQAkSlzcgk3YKmEAxs6b3a5NQuU
	caWV67nhxf4OeG/YdnFD7JHV5iPCXVrrSi4EJY72sQ==
X-Received: by 2002:a05:600c:8b8a:b0:4a1:9078:911 with SMTP id 5b1f17b1804b1-4bb55abbadamr104311415e9.31.1794645605614;
        Sat, 14 Nov 2026 00:40:05 -0800 (PST)
Received: from [192.168.1.44] ([156.208.106.196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571cfa2esm114312485e9.2.2026.11.14.00.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:40:05 -0800 (PST)
Message-ID: <8b360042593f7efa4f7891ba81c3735b4aabb329.camel@gmail.com>
Subject: Re: [PATCH 0/2] drm/nouveau: fix GK107 VDPAU regressions
From: Youssef Mahmoud <youssefma255681@gmail.com>
To: or.pajula@gmail.com
Cc: dakr@kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, lyude@redhat.com,
 nouveau@lists.freedesktop.org
Date: Sat, 14 Nov 2026 10:40:04 +0200
In-Reply-To: <20260913201225.5975-1-or.pajula@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

I have tested the patch series on NVIDIA GK104 (Kepler) using a Linux
7.2 based
drm-misc tree:
  drm/nouveau/fifo/gk104: fix legacy video engine context mappings
  drm/nouveau/fifo: use global nonstall event on legacy FIFO

 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c | 14 ++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c | 3 ++-
 2 files changed, 16 insertions(+), 1 deletion(-)

Tested with Mesa (including patches from
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/45340), mpv
(with
VA-API), and Clapper.

With both patches applied:
- H.264 1920x1080: PASS

Tested-by: Youssef Mahmoud <youssefma255681@gmail.com>

Thanks,
Youssef
