Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793152268;
	b=xrKSttOlUdaeawf7pAHYbliU02bcKES23CFGbDOzf1ZBUojJgaNPfOJwTfhcXdTPVMzr
	 9bEgO8kuJkqp4ttvWrE+M3w9/N1ePYallQhOqns68z7si7n2YeuQ77wr6HUtqsnfvAwlB
	 B+nepubPbe0/fSID9+K5TKfs9hJgue2ir+UfD+uzNdjPPxlatB747zm7WmJ9pme2GzXlA
	 GJtLqnjuKkCwuCN05p1gz012/3DAqeteJhxG8AOXUsbwrjXGLCPGUL/iN4OunAHr8d6Cz
	 UrEZUrhZsK8u/QMn6MRBwf+2VwXQwiHnQ+Wbv8g5uQ5xtnpaHwW/AW8OfD0nX59V31Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793152268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MeEhGL9p74hRILnxnbLIZTyexKrQv0qHFAgQnNnxF4A=;
	b=2ajirq8boWK5UVhqzkZhS+IJrnfg4zJo7LnOV/OLzhjxYX7IXz1STUgpMrVxD/o/osqv
	 EpuJqevy6lROdLr38x4/sk1mPzoKi026MVAcdfQJSpoEC0Ji4GjZkocC86cJxb9Ou/yqd
	 gfaz43g2Ta/ohuC2TeoAaYqI31DHowU41C33jPi5cl+f4rDiJxMlixDbh6MqnXUx5/j0z
	 kG/852xDJzQq6SueLhT/QyisH/1zXZFHByN1Z4Ey5jb9tuspUxN8dZYLDQeMb9Ok/XsVv
	 /BxHr08pa9TyqIv7CHlXJC5A/6CR1Z8yp80/8BdRsesIOjJjuQPH0+phlUVBWVBUCOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KIkZ6QDg;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1AD606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C1AD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KIkZ6QDg
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e83d2cc8a2so962015ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793152267; x=1793757067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MeEhGL9p74hRILnxnbLIZTyexKrQv0qHFAgQnNnxF4A=;
        b=KIkZ6QDgTd6NH2lqP1JBAh3452j+DV5AwhPbY3rKyqVYzWa1umSaipZOSA0M2AKUNV
         k1tmP3VG3Df2MZh95aRyoIUB/8L7mlJGPIY8fkpdKwN6UYptV3ndWJoPJwVpN22NjKHr
         2t1pJY2SJhnlbOVvpFMp1TEyrSxhPDYcnFjjBu/lk7TWwUO/5JydBh6SXeOEc25bACts
         DXCsZOYuqOBv5SOQDVZl6amZLlbATwsTCHz/kqZJlFqkCO7oAuM6scumTXGXQqIXUNwH
         yWUo0BwRW3baT4NmRmKL+KbHx5FdbvFvjHzcM4TqpZdC0qe8GI4pP9EAP+Gpx32+2Dh4
         cweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793152267; x=1793757067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MeEhGL9p74hRILnxnbLIZTyexKrQv0qHFAgQnNnxF4A=;
        b=jgW8NF5/KJuB1WqluyHfb2G6WrfDzFEeU8ps4dfu9nsxUPn9JBc3+Dmv0+KCSDaRXv
         QwLasbRvmyfUwbUULH/b35Z1+1GBVcc0PgHrWHOfD5U8djh0+1GkBpu9qEFUabnYqEjt
         H6fwjD0IwdxYTysk5npgjH5mhYB46s+6ZXJsUaKMHGm//tv2vb8fCbQHjgd8iU7fcO3V
         BiFrQCCSeYYVteZbiFKriSvFXh7RGa8dLs8GNhMMoZZR/3XLZMbPYXfloxgWzuO4j7x/
         z51lOwsf5xJZ4a7wkjSHSf/G2m3MZeJ98/0ZE4g+OIe7FlbwlcE5MrYlTYNnflcsEvLw
         MZxA==
X-Forwarded-Encrypted: i=1; AKwUvBzLG55QnyiPNk0W9x3EM1+Uvlxhl8HOzEYPilFjE6DMzNxv163BjytBKCUJ+PdXDvD7GVFPM/D32qQ5NpM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLw/s9DDMwW0hqB2lp0b1lww2gDR4zR8AQQXTWsCjW+wvjvQ2e+
	ugKcwunx78agjL5J8oud79d4+E8ir+rts6/SBa2fqy45XmCZAmyXQ73r
X-Gm-Gg: AYBFou12SbBGaTSNFGJ0Ix6drVIvB7hDjBJWPQiAhYV4uCtZD/ZF+XeUuXrJR8U5bnP
	zkoVSWdyMPakRFtBr+BQliHFiyN7F+nS1eGMZAxNT6eiztY5u5uytdhysofFrapbMqyT/vkDrlg
	kk7EoMpfn9bZsdid41h93Y2LRiJaJ3xxMJV8GGkclMlVuWNN2sl3nMv+ZFhfdYNbhn3xzfDTfvG
	UUq4o/x4f4rGS41il6c7CMuL9eIrlsNsdWBiuzmZp9nTTbWhVp1dcsYeeeA7TU2EpN6/PxpdQTY
	scSsZIoneUSEhYixDAgqw8w8fNRy4G6b3kKZ28moNlRTYyyW5+uySXLfk/BxwvUOUKarDYIfmdW
	DsJxnaN15QB3jp1VUnBeGx4+/7N5MfGjVy7OKtBIXW8ShE48a5d3pzv2V1eqCzsEujCfLoE1dSy
	+/GJLZ6a1bvhJsX8VmkjYe2mFJr4vW0yY1BX3SV1DO08iYbFsLVHyG+l6U7RtCfO8+4jaHt2ePR
	i+SnsVKRZdjB8qg4HJJo9k6j0w+e4ToAjxgB6pIQo2Vv4SYEf0ZGg7NcoDPLmqxjpmKNUwLAFWV
	IcIRtOKeHmb0aTt7PKlJgstkqmoezJU5mw==
X-Received: by 2002:a17:902:cf10:b0:2e9:65bd:62c7 with SMTP id d9443c01a7336-2eaffb17f6emr16531855ad.0.1793152267434;
        Tue, 27 Oct 2026 18:51:07 -0700 (PDT)
Received: from localhost.localdomain ([240e:36d:b08:2bc0::a60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c33917sm16066835ad.48.2026.10.27.18.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 18:51:06 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: quentin.schulz@cherry.de
Cc: HystericalDragons@proton.me,
	amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	hrushirajg23@gmail.com,
	krzk+dt@kernel.org,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	liujianfeng1994@gmail.com,
	macromorgan@hotmail.com,
	michael.opdenacker@rootcommit.com,
	naoki@radxa.com,
	robh@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: rockchip: Add ArmSoM Sige7s
Date: Wed, 28 Oct 2026 09:50:58 +0800
Message-ID: <20261028015058.11163-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <2a1c33c9-8971-4054-a463-60f3ceddd627@cherry.de>
References: <2a1c33c9-8971-4054-a463-60f3ceddd627@cherry.de>
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

Hi Quentin,

On Tue, 27 Oct 2026 17:03:02 +0100, Quentin Schulz wrote:
> From U-Boot's perspective, I would have preferred there be a simple 
>difference we can detect at runtime and based on that decide which 
>device tree to load between coolpi-4b and armsom-sige7s.

Maybe we can ask ArmSom to write some OEM strings into the OTP of SoC.
So we can use one defconfig for two boards. I will check this method
with ArmSoM and current OTP support in u-boot.

>I don't know Heiko's or Krzysztof's opinion here, but I think it would 
>better reflect the actual context to NOT use a dtsi and simply have 
>arch/arm64/boot/dts/rockchip/rk3588s-armsom-sige7s.dts include 
>arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts and update the model 
>and compatible properties.

Thanks for the suggestion. I checked the existing mainline DTS files and
found similar examples, such as stm32mp157c-ev1.dts including
stm32mp157c-ed1.dts directly, and the ARM Juno SCMI variants including
their base board DTS files.

I agree that directly including rk3588s-coolpi-4b.dts would better reflect
the relationship between the two boards and avoid unnecessary changes to
the existing CoolPi DTS.

I'll use this approach in v2 unless Heiko prefers otherwise.

Best regards,
Jianfeng
