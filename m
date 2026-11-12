Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466264;
	b=butdyf+Ea9T73zFg2vRmDTyJ4FIVK/zTc4LHsv6ZdLMLxEtU3P9FGF+5mSm6qK167Bxn
	 ohZTdukO0YBr18PziX6WVVO83b04yigds1dOqLBCrZKRrdiuEG0SWozZD5vysIyh2vLF3
	 nrrB860biqnk0KLbMYtIFOVylUrpZbDc8rSrw+uOAEwGLRHoVMjM+DS8d68V3Ws9WDgYq
	 qW6F9oiupOmEmgrT6ZJmisxbcdjuEYjC4CRv85o0QKDXVA9l8hbnapdeEh4PKsEre28xX
	 +RW85iUQI6JEnVShmZOuOkuxmGUIMnxuswydSNOr4V6rZuAFLjiXQZD659Ii+W1IACg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=o7FuU2kplsxoIIrv2lRaqW8tQ/83lB7XG52hnt4k8OA=;
	b=e+35oV9abjq1AOQb+dQX+z22hYDHmq9S+Y26iLx7DBzULt4MPJsQiJJkWR7YYmh1vnhd
	 pWTZZsmGle70UxqYGCVzKtByz9aAAILPBvtrnfap6g+K3MdULvUGvmmkokgq2ezxgf68u
	 +bwafxz2yGV9bT+VwKEMwHJkuBf9SeaqIYsWP25cvOy2zztKkcUAMHquZG+ihbjSKDz5/
	 X8BClUrAUb+3PEBDBNrsBIbvhbtw3SMddM2H+zrM+ygXb9R8TDln+BTvCVNn9pj/5dw73
	 +d6uULkSl9f4FG7Xwj7c5jMQvVL21Mvy1GpAkod75l4aVJv79hZRCq9FvPgdMGAlkJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="J7/v84aM";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82A0606A882
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:51:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B82A0606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J7/v84aM
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3720addb068so7040581eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466263; x=1795071063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o7FuU2kplsxoIIrv2lRaqW8tQ/83lB7XG52hnt4k8OA=;
        b=J7/v84aM4LAIRiQJCL+hVmWW1vPtK51m1N++Rb8wSEBzgbbwrl11S7D6e6pPHSqKs0
         iQ9bcoS9qOrf52PkTUbdaiPlyHay4TJiCrCT9wOHPaxWgWYuhi3ITMxXwRDfl723hYyp
         91Dvsjal8PJGKBd+JYCNEoSMQy829nNsRIJYePvWNMMIAzOilfEqfStA4MCIUs5706p+
         5+isCDY2fqeQk0uNA0GYJ4KiKK7FsJfr8V6UoTq/VC6NEd/y27C9Bdc5GjJd/JzVtqV8
         qKPFUtOmz1Ap/70uTeS8K818YxaBH74iP2wPgIpXzngsTmkb949k1Orbo7wgvVCLiNpc
         qyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466263; x=1795071063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o7FuU2kplsxoIIrv2lRaqW8tQ/83lB7XG52hnt4k8OA=;
        b=O+nUsVCjDNNZ05L3Pqi6d2HlXFXORj6PCYBRYcuaFzO7my4q33H3QdCBgCC2yDabWe
         fFVc5rEFFm9oxajQ1R8FaEudCXWqri4o6rDD/C3tWCdzcctsUuqQyuXxZIu+4mmHlWcT
         TaJoxL9H6IhW5+AeZBaFJNvpZwCoCJ/ndGl79t7pANTctcOHksoJUtooYjA2xPbVqgls
         CVaN94VkAfu7PyIXqSzkSLoxHQuIGIv5ouFnBgirc5FZM37yu7Se35bPBP81Jx0JLm/8
         N0gm/jVJIznqzbAqlerJjXIvzU1oXU747iZAyJVtd5UHdCAyQkRGIzB24UMHn08ZXjub
         yx0A==
X-Forwarded-Encrypted: i=1; AL+hErEE7Mf7qXiRlCMvSzqC4b77a2muZvv14INp/RjBBZsGSX2eWEzx+pzz/zmuLlki4icGqM+NEd6xy//XzZ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ObpVu68UwVBw2wM74+OfqCJpyeARYEKmBCOAXEjLx5YvEa8r7
	PPkUYJ3GmFNpW3aoODzvLqz9SVuiVzew9tMNZYmplNDWUSL4RLYdB57FuqUjkw==
X-Gm-Gg: AYBFou3glq73vzVyOsxWOkM9B4ZSLyd2Q0NIQe1LcG4/D+Uuep7+qeQzQ3Nd100hB66
	LFRaVS96KJbIAdtvWwvSuU8TNL/iAx/bI/YV17TWjPwh0VXZd7fyXFU9u9vcSXo82ccy6X4qXmp
	pLhO4iuIjGI64agfSYqtoRG/9kKqswS5ePktFJrwAC2EA4DCxvdHn5j8MzaVzVCJRVEtO8ntR6d
	VvKVhX7HUhQ8wrhp3GL+GF4BZoDSE3qCUD46frJMrh8CYeNAjsfnum+Nm2VYsicMJT7nGksXkfs
	o/YlusIOPrYWTLau/RVOdPjaPHCirOu/zpV4yWrauq8HnTxn24G3EnNbQTAQucyzwLl7PZ1i9km
	oZmbiwt/uDZ1xztyNh7yMzpfzxgyHtF/JijU8Z9lavNWyWv53l+mjutx/BIVYbxTho2exVZ2Jr/
	I7Xa7n8TvJ/63IyF/4/Dkmq/zYlgpYZ+gRgfY7StEOurPTM2JE+sA3lFHbJ0ZD4cHUurQFEzOhJ
	jlfcPciqwivWr3DFmuxwW+DJktACBAG8qnEvDPiv2wq+0pKbbiAgpVLV0h8jr2ysyjXLmh9nZMp
	9UPoI9DIP+J46KlYGvY8k76FHhdGcmLKyF3M2owbGZI/3RCGn6NLI5LjqfCcNdSE/IGeSWvnUKx
	/6+msphLE+vWq5o5T
X-Received: by 2002:a05:693c:87c4:10b0:36f:9d8:4a33 with SMTP id 5a478bee46e88-376867551b7mr5264981eec.31.1794466262717;
        Wed, 11 Nov 2026 22:51:02 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:182d:659:ffce:39a4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306casm20788624eec.9.2026.11.11.22.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:51:02 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Kim Kyuwon <q1.kim@samsung.com>,
	Evgeniy Dushistov <dushistov@mail.ru>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Input: max7359_keypad - drop platform data support and style fixes
Date: Wed, 11 Nov 2026 22:50:56 -0800
Message-ID: <20261112065059.1802480-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
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

This short series drops unused platform data support from the
max7359_keypad driver so it relies exclusively on device properties via
matrix_keypad_build_keymap(), and cleans up register bit definitions and
argument alignment.

Thanks.

Dmitry Torokhov (2):
  Input: max7359_keypad - drop platform data support
  Input: max7359_keypad - fix coding style issues

 drivers/input/keyboard/max7359_keypad.c | 27 ++++++++++++-------------
 1 file changed, 13 insertions(+), 14 deletions(-)

-- 
2.56.0.567.gdb80ae8cd5-goog

