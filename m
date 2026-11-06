Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794000801;
	b=Xu1NLtKkAgT++iuwFJqUwHUI6DnhPmsV2rka33B6ggSn5bve0K6GB7+4jHRJ0fVJHdtT
	 jgbdDuAnkZdQNwM3eW/7drAKNW7/UJXGeLDvi0kx6Q3IjTdUlofL1erZtH0z5xuxjF5HH
	 3xHfPVfrSw5Xruwd9uOi7YW7hZg8O00Dpo+hrdRuTb9EGDmktUJJEJ5Ds3Rs1Ho1yQu3Y
	 AhlXreFKwcQRBJGJiXQFZxMBAdOtNvln/Bpzc3YZmqWtGrLcfNTHKDb072RZ24Sbv117b
	 I7lNjiF7ScGXnqK6lUc3AE2palNwQ1KGLWOoTNiSCI3byhoXNk5WAUVLoMX3RN7Xk+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794000801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=wIpKQDsh/yOzhOKZHhW/5XtxRKTngpabn3QNYnDjDus=;
	b=0PDlAEPtguOxYcx7RQs9dLWymSVALOn1oEFsqOmr/sVATMpCS660eBWlp1zbywW2sQ8B
	 vBfRVGST4qYY232TV/ayVp/ECQwW9CLBeF+Xn9ka3gAAMckT8MvxvNjy1f93FNU/qpzKt
	 WuLH0Q+ntMdUI63EHw6e/6w9mqunth/iRnCXIOFG8qby9l3cl+VzI1WQ3HutSsqxY/sgo
	 z4CGxdQ9G2yBZx3/NPNBMTQoreyEnuCMUaqCJ1NtbQy8viYJti86hF/FaS3i8G+TZOKhW
	 uUvP3s42jnKo/pbrxgItcdtda2NCpNxqPxLGvFVL1a5zELffQsI+7rxVa8vd6joVmXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T7wwe2pw;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AF3606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 21:33:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0AF3606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T7wwe2pw
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a215e64962so12729235e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 13:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794000799; x=1794605599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wIpKQDsh/yOzhOKZHhW/5XtxRKTngpabn3QNYnDjDus=;
        b=T7wwe2pwM8JaPUx0w3QuWttchC/LyJ97IohB1LI322K1zgLprOGMPddmGK8X/fF+R+
         iq8lHQgSODEac9uoJv5J/Lm9B5x863MxGiBjUQj/Wp1+KRMwsjxjmrpPvYnKOSwyo+j2
         /KW1IH/46KvckHMbwoFBVplgnDjK3zDbU31H/MxxAbK4LGcPyqf7wjRAnm4BjGsls9ng
         vCzlm8V6+NZ+G/EyLgUprWqQeOLW7T5qqOvlnbj6sDrq6vJOROP/2insBBqgCsQxVM5P
         zH08pndcKBHnWMhnbHRG8ufBKaDayPlGYqrZBrRNlPMsNmTKHx1XaRTrL64rG6tVfN3j
         tfyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794000799; x=1794605599;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wIpKQDsh/yOzhOKZHhW/5XtxRKTngpabn3QNYnDjDus=;
        b=QHoeb2vH69sZU6j8bzJON/kQoHwA+ottxOfURtkZGethjCzO652KRIAKfr55fvR+R3
         1yyooVlBu/GXVBbHEQT2BSGURB96RArYPNEQQzTXt1fLM8eWzZda4ytUfpb+xYDMo/QD
         ghzyE+gdjIotC+59y5yksLaxCBpnyMycthj4kn5oIvlQ7PV18+ZaQv9NL9jWmbI8mFn+
         //xMuMCJE71XtTDIkNwoJxLLb+N0NQDv/P/L+YoyheG+WxBgwOO3pyiS1b+Ni5Q8ZwZ+
         0o4r32/koLnv3vqMS7LJaXjJpb0LQhFvqpLQOcDfP0YKp5bah/+PB2JhqBXwgUKxSWiF
         XVyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxiHgSEUQjkDeh7IeP1gLQ3IPmZ95Iozvkrp0dQji3yALSS/ExS0+ige051M1VwTEtLskRUaX+MPYuhNnc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1M26HfFdHrWmqpbOfnHL6XvbuC8VPApoCEaamj8WrfcaAeQsg
	2niFJBpVsT+kMq9/m09ryNV/RSun3vWtmrt6htbZ89hBSfbCtEsB18uM
X-Gm-Gg: AYBFou05eXoWYKr2Lzio/m8y9UIDwUhzX3uwMqlMo1iSf6msVwr9dP9+fVXoGN/0Nw3
	+02qsR0M6ckCDfQBhB1M1sH2CmVhJeCiQZm4COniK8JAm0yM6vcnXrDYr8Ya3X/diM8tiXiTpFA
	lxJ9P7Wa26PQIlWdAPSfEZSP8IkAOnB5EJ8egBeDl971hRkXQvh5QWjUCqpyqBf6cR5zUluJklx
	Sd73qA/ShdzAynJQ/9kxYru83fTWQH82r7n/D4P62l/KYaFjQBmYDcpuKDxJHWPxwN12y0tQT3m
	r1ZPi1T/8vCUPvOzLUFSclHLf3kEv8iSNKgUueI66+0TgMDp+Bkfa1g99Q1UyP+UMxGss86DgdD
	8oyBDfxuUc00TPqKQxB97yvEUbkhSB+yl8ApGInjIHHRMv8mpMhY16gcb8jNkLoN+u63omkYzvJ
	OVgyIXCVpdZ10strLDWHO3YgnPC5gCOkPmtOVfZsaY9S5DGUAZJ8Dv8QJ/BPX3TZOn0brP7XAxd
	E+mB6qnpMtXi/KUDh+ADk0+Yixu9d9tmUQcuATyARo4alSGwsHCVZXg2izxdEdISoT91l3CowQs
	uTvjjkD0sQXYU9oxur1PRYa5ORIhU/NtV2z7E7hAEOvgR6R2aQmJvtongB8KFd/xbRfvKcvFlRF
	CxMsw+wjIOsrkHrQ=
X-Received: by 2002:a05:600c:8b05:b0:4a7:462c:6b9e with SMTP id 5b1f17b1804b1-4b6e0172847mr72592585e9.32.1794000799410;
        Fri, 06 Nov 2026 13:33:19 -0800 (PST)
Received: from figssurface ([176.223.29.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d72333f9sm5758043f8f.29.2026.11.06.13.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 13:33:18 -0800 (PST)
From: Afonso Figuinha <afonso.figuinha@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tianshu Qiu <tian.shu.qiu@intel.com>
Subject: Re: [PATCH 0/4] media: ov9734: Support the Microsoft Surface Laptop 1 front camera
Date: Fri,  6 Nov 2026 21:33:16 +0000
Message-ID: <20261106213316.104672-1-afonso.figuinha@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105230327.10852-1-afonso.figuinha@gmail.com>
References: <20261105230327.10852-1-afonso.figuinha@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

Please disregard this series. I missed that Tin Posavec posted the same
changes on 17 October:
https://lore.kernel.org/linux-media/20261017-ov9734-ipu6-v1-0-86eab22ae258@gmail.com/

Patches 1 to 3 of my series duplicate that series. I will test it on
the Surface Laptop 1 (IPU3) and reply there.

Patch 4 (control event support) is not in Tin's series. I can send it
on its own, on top of Tin's series, later.

Sorry for the noise.

Afonso
