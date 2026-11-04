Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793830007;
	b=PKC3R97j4b671S/q5ulNzrarQLSRHnOhtpQRNPVczUlv1BCnPkKD7AqLiL2QHZVDiLg7
	 AyzLMuzxpfJp0uHCDeQDBL1fDbJz6J6Gy0JBxRq0aTkCTFWxarXiQR4NH2kbcg7BoH05S
	 f7mIz9Vy7a3hVvY4pOqPCFlumLn8fpv1AmcfdEFyJHr1Mv0abruiLUhZ/4P92MTFsYehc
	 Z6wWu8rDZbtU4wLs7Ho6PB63Co7vWGno9YORILMcypepu2+Nq+DqqOq9y1n0zfCmWcrZ2
	 MWFgyOaQyzzJAcKNzBkg+ZTq73hq4SvCdnvXiDRmQBSt05B3zf3noqhxlndGSrujymw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793830007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ufPIe0MNsaPL8q21bT+XXMgG6he7MqxkIOdgpkrKFhc=;
	b=IY60zS+BbEj0roGHV/3nDUpgYrPymbnhSVS0425kTkbhHpkSO1x8l0SdEi9xKLxHAvAD
	 nTqmEjWuOyRbOvYzoisKQcQ7j339KLb82IpDeDObfptp+UZsb3uY4VHHvuXABK5/McmeQ
	 jHrYBPFEc44EQ2dtSyeFYMf+SniNgrFOyO95w9saQKLfmWAQwf5DT4s+X1B0zUdYotqDo
	 +BaBE0NVLZIqQa27kHQzVuclcQ4YfghoLvBqRhmaChLlZOXPw22YFVy+gbElq95lWUoJU
	 j70h6lXlIu9SJp1MFshBrWYRcY/IxK+EVM/v6Jv+iahxoIHWJwrWqY0sYbp6keTKUbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=U4ZAV9Re;
	arc=none smtp.remote-ip=209.85.221.170
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C31606D823
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8C31606D823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=U4ZAV9Re
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5eac6c5f927so520906e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793830006; x=1794434806; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ufPIe0MNsaPL8q21bT+XXMgG6he7MqxkIOdgpkrKFhc=;
        b=U4ZAV9ReQbDybk4AYqAR3Mxn6N1znNQ7qoSGqJIc6HjUX+U3VjvEfDIlWmdOwK0hfZ
         K2EZdoWItED28pS2OuGFyxFwSA0EKXVCq71UR+3ZR/KqBblKTfSm0EGr3HryPhwa2X5S
         fTwj95oyI5OSyBeRdhj06RZd0jwxyzaalQPH/ZkqX3Z5ZLo12DZvxAAU1JGRdMtqL0cY
         mtZMKWFjlnuMDJTIYJcqHRHa/z2wyFnbb83hMcLH2zk/6Gpyrn/47vBlmXWdbPvl/JbP
         FqX7mW9XuWEhMuS3LJrHsWGZUJgVj3wg2KUYI3zh7JPq05wNvfq8QQ4jwy8fw1fEhOI9
         ub3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793830006; x=1794434806;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ufPIe0MNsaPL8q21bT+XXMgG6he7MqxkIOdgpkrKFhc=;
        b=JkCHNb6WcYFqV4g6HClgo8+F6kp+UQ/1kt+B0sUJVlcysX90NtG9pu2d5PLiB1D6P1
         ZRPh1yyDnw9XnPk3NmYreB3efE/EjIz2tceZDk/ljGZ+btlLZYHXesCM8cudgQN/YmB1
         SzDzdX+/k6qmay+3THVGnt36XKZ9vsnqkBaslB+XyMhKxj0H9mesiFzeaC+Rgqssvbn3
         xHjcJWUTluLIxNMUAZuQMyS/kGQHb1bhJS4NMfDib5qzZuv2p7geu8I0edR7bffSl/My
         G4n0yqFXJI27xrEDQo1ZS28vnwe8TbWWkjHtaZUAlSgPWP7z63hhLittZ6rJ3XCJI/98
         rssQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/CbCDFO9FEb2oSREq4CFO0/EthnEZVcm/0a4OD2sg4YTCIm6s3n9z+Xc/tP6w7O77fOECjVJarZ7LMIQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z90Eu566VVW+PoqqPPVcxBCgZCqs/wqxr0u4nk1NujFDjPlcVnE
	rFywYNYDLIrO7t5Yaz3iHHXa8d2lUKoQlk/fz6z4l+u53V8iPVyJveodX2BOYmd9vVk=
X-Gm-Gg: AYBFou1wC3rs605mRUlN4NbOVuE/Xk6W09o9IfVRAMYZFQBbb/9Vheq0sECtmwwSY0+
	UKA0UgNbNEgE5OoGNzv8nPDKTXxrutWV3oEqd2JsymgxVyeYw06OY7LEffekuL8NBYJBM8WKSVe
	jyDU0EB8KLipv7yTp0s6ny296qj2HkGuNkOw+Xha+j7y/+1vmBxWNBn+AcehIu2b7Di/dRv42p5
	GwljXuFxEnVthVm+w8wZ54NiYRMzgdiX06NkD93l+6EURAA0TReqEWbZj/csP1BiUmEO8irFFfy
	wOjLDhFgR9/sY79XUyFpL8El0PHjPzniOX2Y31CGJJqQ4wyXFEF5WVpmPtAG5BYgDQko9WI8Blx
	utx/BB/Bke6Rk6VYBjWRtQbdOLroz0iJsuMdWL7TZbDrFDrp014fL5TMNXmmqsAtFRVWhNQJsJ5
	50HuEmZcLKFyuqN/gAHz4TckkdfMCbfihmakYKb15Uexpk2DO+ULCvQ66jTAN80ErvXl1LVV8zE
	ybLhCQqbjjfm1dlgF2+Zg1MDacOIoqnqNaapiVMXJOq/bMRSFwUGAAWnr4P5rsU/CEel5byvMjf
	vjHOH0zQcHUd88duHD07L0X3+IXnLPbZjzwSjeC4wjtsScFHnlD+jGq4LXus7BMYJB0+GfJJoJg
	6HE27WMAMSTPdGOtA+aju0xjCvzR1RxTY5CtHpxfBjIbk
X-Received: by 2002:a05:6122:310b:b0:5ea:cd4f:8494 with SMTP id 71dfb90a1353d-5ec6897bcc7mr7448416e0c.16.1793830005585;
        Wed, 04 Nov 2026 14:06:45 -0800 (PST)
Received: from soleen.c.googlers.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8d774dcsm2714498e0c.5.2026.11.04.14.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 14:06:44 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, 
 Alexander Graf <graf@amazon.com>, Arnd Bergmann <arnd@arndb.de>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Changyuan Lyu <changyuanl@google.com>, Thorsten Blum <blum@kernel.org>
Cc: kexec@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261104162352.140836-3-blum@kernel.org>
References: <20261104162352.140836-3-blum@kernel.org>
Subject: Re: [PATCH v2] kho: Remove redundant 0x prefixes
Message-Id: <179382998668.2089669.366825701461081981.b4-ty@b4>
Date: Wed, 04 Nov 2026 17:06:26 -0500
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=328;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=bxNUDneQzMXPopJ3U7vhIU7tZ6OZ2ltQlUaSDgbGkI4=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq66xzJBj4jQ6s4ffhsZHum0EOCVZkmEy4vpG9A
 nhdhvRi5laJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCauuscwAKCRC7dyhM23N6
 3rRdEACF+wDzWW99SGiwMwtuFbYT4Xc8ZvesuZt8wZB/qXnZR9gyJwdjXVibGieISJj+fl6WUDX
 UkzUEhuFemIAteJft5JUXzw5Jhe3JgGpnAFYg0SU8H0T4dPbInWmAilKZelqYn7D9BVgYBSG7GA
 aQvPIffpelgiK7WaCG4gGC0xpfVgmXtRU9RaflFlCkz5aEI12rB0FvrBr7gvroAMK+ubgFt0iEO
 pGIdUFoo7xToZiowASNJVpJ/KswWmLvCUVQ2XGnZWcxnh7K9dFerjGsHUFUs26hTErZkHs1QXFj
 zEFKgGKkpNzboYk3Tw5iU4ZglLYChRoinFSHoW/bWDPRBGaoHQCy+aATI0bCZI+YxHprqo2bBO7
 z/KwoFQkgLKzRangEXnpWYPbbKiEmgt2zCBymSqriEKoDo2QTGLQKtal4UgAaxzigcB86bXF2sz
 qVBocvbZh2yO2ZEGxVtinU78W8oDexbm2Qfsg7/xyEmsdJZtg+6ngxT4nOApFfDxFe3SM4P5F42
 Weyraqc+tx3+G1m+sE87IjwSdxaaFy4H7+lRgvydBx08IeYpmySIeBSZ/LhUniQK4a5EDN+B8Y9
 DBVRDKSi47qHOkrchgjFCQfrs4o0kHLVu5NzS1dXnv74ycFcrz0ru53V5iM9nJsd/HVLzr/hfYX
 A+FxXGiWAnGQceQ==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On Wed, 04 Nov 2026 17:23:53 +0100, Thorsten Blum wrote:
> kho: Remove redundant 0x prefixes

Applied, thanks!

https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git/log/?h=fixes

[1/1] kho: Remove redundant 0x prefixes
      commit: 3cf66b39f560257e77f422d9fc73525ee2c29275

Best regards,
-- 
Pasha


