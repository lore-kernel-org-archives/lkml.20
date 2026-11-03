Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793729993;
	b=taOCDnBm+/Ks5LntQDiscTO1wWx7M4SD+iFHRk7KWl0csWjgOXy0EGUhZrWhbgyMmH7c
	 K8AIuQKqi1EvU5wMjz5F0X32ZE1AH68czM82bIaS2u9C4bYLV0uviHoBWJByeSGL02RG+
	 5ZgzfDbCdoy1aIhVfyQPIpkdEoPBR2mJoMfYQJXC2zD1B9yiWX/xHcVRAjnkKpULxU26/
	 j0+Yr4qPrsXAoNXrCI2QUUYjwlmOSABRXfQTG82h22FZVJSXmmqlo+8Wd5C88xPaGJ+Pp
	 5i/mIJ0tWuxc07jXjAWHQEE1rXnaN6ZSLr/baZfAdOqo9W6wTsqqfv4y6RAvQ7idenQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793729993;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:From:
	 To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=CxPmNkrdL66AIfJyn1xViBqXlyUc1HsQv2fthprM7Ng=;
	b=idQ6hqeE0KpnCRyzd7bk8CUpkL27clW5ajEv/fxqTDM2JPeBEW4LVduGQSpgS7RUiKeu
	 zMThgsI/mtCNg0nIzdvJdgfH03IaZZp/Oza4IgR1mC1T5LrDaNgCYwauByvTkEv1YiXX4
	 ZpVb5C0DTZZi19WPKAMoR3NWBS9iJQrCcMg+xa14ELBUTfwzjLbxdGhvMD9AZCuycVOu+
	 AgAv9xDZA4dlBlyJzt4reDHVNwJjOM/K/vQzv4GjEuvxWV3AJQw4yNubqx2/eoFU5rZbX
	 GUBK06aZTNnmcVfxRmmeXiv4R3fS3JIOWcQVxEEYEgHWb7PXYI4f+LWluO2AQGu9+WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2AF606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A2AF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so36584235e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:19:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793729992; x=1794334792;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CxPmNkrdL66AIfJyn1xViBqXlyUc1HsQv2fthprM7Ng=;
        b=f2afSwP4KPSw93d5AItIZ/6ITjLKanFv4QcdWYmKhGQLyMMrcc9QllmxJYmtoa1s9B
         xgLFlV/dH1J5KUiMnMc3rq7b+TrFStogkAx8HqYBn8gD76EYtqXDJJgbGQK9FJby1SM9
         1czaQpc5HqMSW8LgZe6n/205r9IB3VBOhH6ZErtYdpsT2Ek6WNhbgf9YCjGmGA4lWeC/
         rJkcV7QwlY0ZOXtiYYX8D0iwLntlIqlr8AWDmb+9C8zmDMc/W1/zYhmjqtq+Bo3rHjti
         8YRr6S8JRjPjsGTL0MbvtzeRBaO8QEJMZIJ4odOM3FxFj7wNGv3OxldOq84f0ZQUYPae
         3tug==
X-Forwarded-Encrypted: i=1; AKwUvBwW6QkC0csMkMHcVt3xPWZ5+9CblHjj7aUfGvIGjK/1p69eh/8vqvdshUkeAeTiE4oFMuyo4PMhfNwhxpg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7KcdM62gir6rkeedzK+vuMA2vJbbQyOO0eELorpcc2zOFsMgX
	uNJIwwbhlpkwJYVWX3ytbV/7oIqDU+9H7nKFJggYJuF+PbNKFwQ2il8=
X-Gm-Gg: AYBFou12WjCfu/OsEaUNxPdbdmPoODlcVGnrgvK72CjPn5qgbdVC8zS1FGYUpQwdb7K
	2Ao6hFLErGQd4VLA+Il39lDbEB1veGl0CNgd/5QvnR28dLkaY4G2BEvsLvCOa/3iV76aLXiyyeN
	zNadppdFBWuBkmNcZcw4YHtLP5Rcm4f3Wor+jwe4xU4rjfpxoBRUaDuzaGhSS/R5MXUuVAmr1qh
	67xJhqcI68J64pDMOUVAj3DKjFF+YIcV+0F7Tex9NgtEXhp3Kle1zV1VTP92RaE+YqUtnfwIvls
	7z4v3PXyxL2ByUCPAw4Pm2lUqGEv57akSsJqoeIxNTZ7+2P0X0RDm7jpOZ1NeplW+Z/KxA+oIiO
	yPQHCr3rEmWRlL4W32dPbuVMu/tGv4H3l7337bbNztoypO5UHTcOD7Hg/5nr9W6yglcDgrZTTm0
	hB0LPduMpjrEab39eUyp25zGlkOg+KQnmZxkjnBNxMBpLnfd9zxE0+TdnjZnnI79TCYnBQD1qbU
	VDLeXdA/K1v3hhMfmq9fAC4EX/jbYoyC1YHeawfwigGiSyAGNgqvOccvKb3rsb22fkQa7snS2gn
	65SbdDUA/F3s9WLfREbSixSQVo7Urp0TquYvlzoj
X-Received: by 2002:a05:600c:350b:b0:4a3:2f35:38aa with SMTP id 5b1f17b1804b1-4ac1932bac0mr284037035e9.29.1793729991346;
        Tue, 03 Nov 2026 10:19:51 -0800 (PST)
Received: from [127.0.1.1] (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b411de95b4sm777745e9.0.2026.11.03.10.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:19:50 -0800 (PST)
Message-ID: <6aea25c6.9efe04cf.11c115.259a@mx.google.com>
Date: Tue, 03 Nov 2026 10:19:50 -0800 (PST)
From: D. Manresa <dmanresa@gmail.com>
To: brgl@kernel.org, bartosz.golaszewski@oss.qualcomm.com
Cc: gregkh@linuxfoundation.org, rafael@kernel.org,
 andriy.shevchenko@linux.intel.com, sakari.ailus@linux.intel.com,
 driver-core@lists.linux.dev, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] driver core: fix unbalanced reference counting for
 software nodes
In-Reply-To:
 <20261023-swnode-dev-notify-balance-v2-0-948d920a79f6@oss.qualcomm.com>
References:
 <20261023-swnode-dev-notify-balance-v2-0-948d920a79f6@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Tested your v2 on a Surface Pro 7+, where ipu-bridge attaches the IPU's
software node with set_secondary_fwnode() after device_add(), which is
the case the series is about. Reading the node's kobject reference count
directly across a PCI remove of 0000:00:05.0:

  6.19.8, unpatched:  4 bound, 3 while removed, stuck at 3
  7.3 + this series:  4 bound, 4 while removed

The 4 is one registration reference plus three child port nodes. No
refcount_t, KASAN or other splats either way.

How much that covers: the rescan does not re-probe, because mainline
ipu-bridge only unregisters its IPU HID node on the error path of
ipu_bridge_init(), so the next software_node_register() hits -EEXIST.
Separate leak, unrelated to your patch, but it means only the first
cycle really exercises the fixed path.

Tested-by: D. Manresa <dmanresa@gmail.com>
Assisted-by: LLM
