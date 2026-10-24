Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792810940;
	b=EbOjUyrWuyKY6oLGMGauYRgBzSeGQTvzzjz5SBjkPJClTEmNv+oZ9f7l7TudJjJ3IEQd
	 uCr7KbjLGVCpae1ItmspXyLFnr3ayEgKJhmaq99ewiJaYf920RMc6eufhaHeCkKnJM5WA
	 8RKLVFpZKdGiBbi4m5tOGdgVQKBuFobN0GmtjSkU4dsQKFj8Qb8NNbBoFqkn7Ckf5yqwv
	 toPFB3iY76E369EgmOHmOJXs0d6qXFFG/RKjOpO95hZKdmeW6uffJQa9TcDot9tx8jzYZ
	 2UdfT+rKxqQhfp9E1yMMpQdqblWIzd9v5jIfkLeBQWrhh796a0WBOTlVG9vb1bQJBOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792810940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=d42c0lsKAH/3dqQCFaUwqRJoKAQ44ktKOlAIQMH1hCY=;
	b=4IhBTEBwoxqv1yGAPnOT3np7HmKkYTUwxXyYHK+n12mleiHTBDCpwryy39yDLbwGDwkp
	 FIgTU8ItEGQVGaBN0tEzpeuO/5MPtDtUzcVWV2TsUBdN3mThjMvBXI8XwqEG7eqXOQrjz
	 /zbtecgWB33V6ieUMo5htDJeugm5XTBSDrzjuKuq5jshyocHzhow3emiUPJ5WeBYwz/Jt
	 3/rzL/LWAl8yvNC+kI+tsoLfq7tSlwYPcwxucMUwwIc+5qLifHd+TowerzcEKRCQ5mcOy
	 VWCkFwIPkKbcC/GdB+4oW5Ao2w2yvS6Ik1AHXJb0KYOctQJ7SrzGRUZeMOl8wM95AnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OzxlIDvH;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0A9606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE0A9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OzxlIDvH
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6dd059478dcso959675eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792810939; x=1793415739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d42c0lsKAH/3dqQCFaUwqRJoKAQ44ktKOlAIQMH1hCY=;
        b=OzxlIDvHsBuVBGUMT+8hhDmDm2eraWK4nTBCUKtlXeqdjCWhOVVKs0LEyTlgA4CakO
         hOKTMvk2s5xQ2y7oiVo8Ei/AL/PfDavAKCBaVNpItzfDKRkzgUD7Twkq0cvqIviMydD7
         zuC25cLkocAPUh0ikOsEUtnfkVBmqgPb2+l28VMJp92uiWHwteFwFEGY6TWTRc4tgHWB
         FeJVCGiXbSScFv9BuFW6Vip5MK4mRbIjVaqDILDiX1HgF3TS/xxaB8AMt6j7NAK9PPcK
         NQW5rwFHVWiVdtnAoDsBwWw72WsW23ZWXTl87S5F71ZAwgGLyBQ9+5K9O9Q/2gfvolMj
         2Iog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792810939; x=1793415739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d42c0lsKAH/3dqQCFaUwqRJoKAQ44ktKOlAIQMH1hCY=;
        b=RYEyuYlfwkbXwnuJ+q9VG4KlFWCVVQliPDikOccA+Nwo+zAeZ2UhHV8arv0F8pGrQ5
         XKkrEEoiIPbP7CdC0wkB+/rXO8i6k7TntjTgGgB7hJC859s9+Mif+41rB0eccujEfSMw
         4CmLBCwEC2ZEfjXU8AyisN9VCDvrLolxX3Rc0LRhyV4Hw8GwtjGvstj+6UZjsogJM9Rg
         5hRXJhbdfp7wTMvulT1AUHDTGJMUnh9tnSvzYRCuqh9NEbbPh7K1bNzrWo03NudqHoGX
         0NBo5ulS82xrIGrTGTR/nFE1NWojvRXn/qFmdXSIjB64WRSXxA8v4jR5nLTw/A5scuQX
         2KOg==
X-Forwarded-Encrypted: i=1; AKwUvBxcSHTF4fiX+g1MbH8wI5slkvKPqHDHxgXd9GM5GrIHs5BtJ/eflbrZjjyHqODHqTCb4FlGBN85L+6b1vk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKX+zyc/AyTlgHT5CQPkQGm0ngf9Vo3f8+vAepVJ6hu+BsYnQuy
	1ZDRf2BYqw6JxwMT5KLQzylYpBxFBpVCW8EA1HuMXr5HZuCawjJwvREb
X-Gm-Gg: AYBFou2x1od5lnFW3zd53mo2dCj4aXom7YvFxMmRRDZNyDCR6Q0xo2SoX1YNUGD7gCp
	pVbsbJrWiNRR9tyidC4qCsvFqUhRKDu7j/BWlw6dnKIXbDoyIO1rijyb9An+Xd4mo81L4+tIFgD
	XBUkJ710bHoeLyE03vNRzydXKUVqs4He4mfHHvt43+elxiwtA725mskQhWy16VY7DJv+DnC1dPD
	FIijWiQMYcFxdbj3F+T8Vl4JbSdxacGUyYdamW9gwKAINHJqP8BVOPXG+HVwSXhr0M8/J9sYEOW
	L6ErHzID6N6ZP6Bs1b8rt39awip5K2vMqsM8L3hNx1a3RJRQ57QM2be0pmN8fFqJz1+ffDGBSjg
	Qyl7wJreHmlgvWXohWiosTSJbwwfusPqDDNundyQpfUfvUFd2jvdBXjmJjaw1D2vfsF2GAXZyLJ
	W9gQT1XCQfyMtiMX1LPy4XNI++TuO0IfGdBpzxVsuFb6o81Cmo2Ae8JZCu4e0EYhCVW3mSFG0rM
	pxa5F9AtFTk4l8yFYd0pU/eOcjI+MZJvckX8aiDggTw6HJRu81ZRy/WHWuQGpRAYaq8P39DAbKt
	dvdw
X-Received: by 2002:a05:6820:a514:10b0:708:c97f:5542 with SMTP id 006d021491bc7-70ba0f72e95mr238732eaf.76.1792810938704;
        Fri, 23 Oct 2026 20:02:18 -0700 (PDT)
Received: from jeffmr (63-152-17-145.cdrr.qwest.net. [63.152.17.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e1fa334sm824552eaf.9.2026.10.23.20.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:02:18 -0700 (PDT)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH 3/5] drm/msm/a8xx: Add Mahua GPU support
Date: Fri, 23 Oct 2026 22:01:24 -0500
Message-ID: <20261024030142.13643-1-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925-mahua-gpu-v1-3-0fa0bfd8d315@oss.qualcomm.com>
References: <20260925-mahua-gpu-v1-3-0fa0bfd8d315@oss.qualcomm.com>
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

On Fri, 25 Sep 2026 02:44:34 +0530, Akhil P Oommen wrote:
> Add support for Adreno X2-85 GPU present in Mahua SoC. This GPU is a
> smaller version of Glymur GPU with fewer slices and smaller internal
> memories, but shares the same register layout. Also, the GMU chipid is
> different when compared to Glymur's GPU. Add a new catalog entry to
> support this GPU.
> [...]

This fixes the rendering corruption on the HP OmniBook X 16 (X2 Elite,
Mahua): GMEM is now reported as 15.75 MiB, and GL, Vulkan and WebKit
render cleanly without the sysmem workaround.

Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
