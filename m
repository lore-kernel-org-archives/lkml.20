Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792810943;
	b=RL3nE++LETxOs9gAFBJgWPj74pQNIfIFH718ULJxUKensSxNl3Dd/y3OayI2Qrn18S6b
	 K3ybDomsG8WuHWhFWPNjdvX4WbwP3cXItNi1fXNyFpghwHkLDKcMS6+zjB7HxnW2Wr+Bg
	 hjks5eVpep35kNwV/qUKEIicFuMD7c7lIAd+/uqG+0wa2lW1CCxaD4C11DhtksLlHMWOB
	 1xkevr+hPWVe+3s6kkuh/eMcgA7VWR8mRDKm9Oq8qyAUtMwYHfqdZhpLjoPZ5UeID03Kp
	 p3+dsQ4Lo1oRMK5DZgp4lg/+Y8NgKzOQyWZFRyW+DSCIk9gjrrVPFE9LlYiWmQYnXYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792810943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+PRxhLQToLWcXUyw+NCY3cvWXklRjDfoU9EniOYyU58=;
	b=TbTv9DkDIPAeWPxmspb7V+O1OMIlG5vzvB1ujvxi4maatO5TZPaDRWegpElPN1XrWoAz
	 EkVlH8coLLBItg4qDuriZK6h06PkhIIopYAqxhntYX9HdY2ICFSq9zJH4efRkZR+Rb8qg
	 8n0XIT13gaTALflokyK1a6eKqiMFlX79kbhUx7EPRCoq2I97+kPKJ3jxw0nq2MBfAdJsl
	 IRFc6wbZaS0FcXbWdEHUR+JRN9cPzbyuDw0SGad5z9c814T4Bn2vGx+un62I1NfHZcbmo
	 5ET9nTtHJAtAS9tbDjZ73PCVn6okKcEEdQaOXCTwelT8OC0YSQdN+p+z7XpfwrbAskA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rIzRbcbP;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7AF60A2605
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE7AF60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rIzRbcbP
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-702dedeb70dso917575eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792810942; x=1793415742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+PRxhLQToLWcXUyw+NCY3cvWXklRjDfoU9EniOYyU58=;
        b=rIzRbcbPbMwiqGsxcV+MXq9/lITpUyK6c/AJIS4l6eeMNDRT7EJ5s0uou0LSarwDEN
         EyNCuOqc7fLBgYOq0+27E0OWByLrsYp2Fka7Sjemf6EzVJKtVI6BCoq7X0MEIJqG+s47
         gSFivwPIEeNlrDMzXEbsFsY/FfYpvZmwf8H4SGEEr44ZKfDjDEL3U33UzkIkIEDac9s0
         4OqgLOYMhbdlxxAdqJLEVGbgW3pLK9U8Ywg5rMxa5m9Q6QdcWK5Zt+2+3j/j/Oyj0o1F
         2zflNonJsuJPHOmOM6MDKpYY3CJIF/hlZusEz33GmRJnA+ym2RAfd13FQpkxznQspbtS
         OYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792810942; x=1793415742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+PRxhLQToLWcXUyw+NCY3cvWXklRjDfoU9EniOYyU58=;
        b=VI2nKnRYSoXfjA0oANImcmZJXdgvOxdaiZfbltDB1vIHPf1HBGJT2kzVO/i87Y+Yy4
         wegfWlMjUnqHXYeYWUS71j/AeBwjykq+eBa0A8zEAmegSf8sSidFfpBIj4zvRP0ZQvxt
         r1pwVxDf2ywR9AHFODabPcxsNWT+PUQjT6mZv4fzvDGMj6zZ0begH3icOnUUFsTJD2E7
         9o9i0bvgv8KF/Nd0R/6J2bJhMkTiAF9+YzG8j2Mo6n4NnNPAqN18FaEpi2Ckz2L9kMTF
         TwsSTy6etfRYMVA+00fE7ARnlBE+wRPC28PkOSAVQrzzqURPlgEbc3mZGhzZ/95By4Hx
         05yQ==
X-Forwarded-Encrypted: i=1; AKwUvBygwZvLKwy1iPVW3U4qg8EAdGh025N2F6frYZTLaipEgHGXa1eakOzH6xRq1ibltRlidaBJC9FyVfaUlR4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJI8YvFrcKb0EsrE6kqxQkeNZ9x5XHCrutT7DS+AAPwshO3kVi
	BZFPaVkmeTV8ktenNasyC8wVny2qc1MMEcb8iflzFwMI0S89jDAHbmoY
X-Gm-Gg: AYBFou3Xna1dKI7UPA6zom7KjfBmgNQpLhylT3bbsFsLDyQGzLWPO76tvVX6YtrU/X7
	RfY/gsr4qWISH5yaKHZ6taOPEFu6tUMcNO3h0ZfP91Zu3AS5Z3rivyO2JDy4dm+t89WglTe01f0
	rnRpSvCBBbX7abyDrcRvYgaUo8yIHSEzKmJ8UAQKlAkWB7QxzkWvzZAL4aEv91dmMWz8GVdmxeV
	rEjxjZwk1nCc6ygjFYIknkC39tDv+oKqJ7MRx4C+UAWSimQXdwS9BPiSLtnFAGx+5LWTyGW1mQl
	kaTc0ukbXw00pB/+UrfxXMIeQhK95PqmpVDW7JYYwvh6HMT1eUIGka8m2y1wYn8Cot0kgVOtu6F
	RgSJ5GMiN3HSZNzWOl/hvr9nv6VjY523y1dgFSpdCf8fAb73V9qOX6+PCabt7SrThxlAnESEwfJ
	RkII3Lm8CVpm1w+GBs49/p8vu0MdKHqLjq6J5+PKxz5LNtIcLdro32xgtMSUpXLUelV1uZFMdS6
	WDiyOf7+Ow879Jb2Y/MSqrusQcMWQK6rMkY/phPUy5CRayrK5CYscqAvbx3l8NCjCl683S3dkWU
	t+y+9A+L+8TPowtpjtRUmG9OCQ==
X-Received: by 2002:a05:6820:c2d1:10b0:6e0:8fc2:84a9 with SMTP id 006d021491bc7-70ba0dc8642mr260129eaf.15.1792810941870;
        Fri, 23 Oct 2026 20:02:21 -0700 (PDT)
Received: from jeffmr (63-152-17-145.cdrr.qwest.net. [63.152.17.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e1fa334sm824552eaf.9.2026.10.23.20.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:02:21 -0700 (PDT)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
	Mahadevan P <mahadevan.p@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v5 01/11] phy: qualcomm: qmp-combo: Add DP COM v8 header and fix register layout
Date: Fri, 23 Oct 2026 22:01:26 -0500
Message-ID: <20261024030142.13643-3-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001-glymur-phy-v3-v5-1-3848c2615d5a@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-1-3848c2615d5a@oss.qualcomm.com>
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

On Thu, 01 Oct 2026 15:04:18 +0530, Nabige Aala wrote:
> Add the new DP-specific QSERDES COM v8 header file and update the
> register layout to use DP-specific status register offsets for
> C_READY_STATUS and CMN_STATUS registers.
> [...]

With the whole series applied on top of 7.3, DisplayPort over USB-C now
works at HBR2 on both ports of the HP OmniBook X 16 (X2 Elite, Mahua).
Without it, the stream ran at half rate and the monitor showed no picture.

Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
