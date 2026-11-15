Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794713108;
	b=DtAZVsWp4Ws4YiYTWKDZDegxB4gWnRtnYYhN4xY/wJdHm31t7fOSKgdF1mqWwxZPuPGQ
	 YUxbZa2G5kjX+smHt/v9TTuTfP37Qs+bbpzM+xkzrYw4i5YX+m46ybzjAQZDu9rdstUKw
	 0BBGga9D/iO2Qtjgl7dp9ORMcna3YiE9YkvQuyJ9w0j5oQ9Mmysj6twF1b/ZWHffl/sSF
	 6jtYCyQ39bn4fsJcEanoUPjuQo/c/7RtoOtEXKCMxdxjs0Ue+YcfrgIvwVhuJ3GJGfKrh
	 Zr34sSAK3ZeZu+9VXIRPE0E9td+yS1KaMXnDYJuOQv+VxiTcxzML/Iac0XBRC2M9NXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794713108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=+jVTqA8bBEUloDFP/osFHIzevEsOMQXn438BieV9inY=;
	b=bKPy1jqaBh0Sq7ISdnxfoZQEfNSsWS+mNnmzUn9tqMMHR1AWQfPmO6iyXBvK9I9w8r50
	 YODutM6Eof/fZ8GoosA/vam75W/IItpdHR4Vx9IhpwASW9qZbTNGVHwt3BRlQ1AOm5Dbv
	 F1uofokoLiZHQ2m1/DHoott4mc8WdKua//6YIdJvjpl7NjgAB6Ge9DbHwq+HB8zwA51LT
	 ec9UGrIL9NSXhexPW1ORvTNfbi6ps8S/viotTfpiU9gST1huarNtIQNWt5QGYv5zOt+P0
	 nbYOIOLSuEqSjEgk/7+b1VHn9OwRp1O0EqtmGTwbKtvBoT2/OGH+htSxKPFsI+I9sdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MhbsYhlf;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5B4606A32E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 03:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE5B4606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MhbsYhlf
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-55d30c054dfso3100971cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794713106; x=1795317906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+jVTqA8bBEUloDFP/osFHIzevEsOMQXn438BieV9inY=;
        b=MhbsYhlfIboDlJO0nr8sWHoWk4QYWrxgr1DjannNHaSkkSgGBBcYSs3djiqkqFC1/6
         m0ZUne9cIuREQdr+58Uva+zsdg7kB5jgVKFXT6YY5hMIQlk7C9QTgBmy54+Hsr1PeRq2
         2XOw+re1SXRO4deRkyfpCKCg9/tFNYIwb1FHKXZIa8tBcGgxkRV+CABQxMzK11Ij9vXa
         SJMpOs4QIBCCiBaHDKjfNDYhy9HIsKamrxfvjAbVPx35B15vgPxKu6Gx0VOqpzzktnT5
         3CYJZ8VOssDKKYsXLUo5CP3y6tt+shDW+HAXFmMdCBoh8/v5nTcNrF2sm8DK9wyREbNj
         MrpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794713106; x=1795317906;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+jVTqA8bBEUloDFP/osFHIzevEsOMQXn438BieV9inY=;
        b=dSNxnb8mVSEADogQIcXV0cs1LK7WH2VWoM0tygm976ngQBPt/fZaWr+MdcRV8PWxZ5
         ebNKszf1ggWIQIKeWPfkHY630189OVCHtedJ1+EvPbMpLYXpg7uQ0ipGZBjj0tZ8cV44
         4m2aQ21Ny++h1+CjiSNyXEnYHVrydISj58ZhaMSZfLkTZuFL37Ieju3uireTbyVFXcwQ
         N9ANYKUPMsmBbP75C9jaS/yKdFmY+h/jcDyfILN0h1VRBq/uXeJXDFHDBQ7rGOpbeJvw
         cCdhwig1UxASNg3Njk45bW8d4ngVKqf5tvTU3Zvh4opA70xUVIsOEwMTfGq/Jl42rLA2
         a8/Q==
X-Forwarded-Encrypted: i=1; AL+hErGKDFHPSi6mbOLzWQfp7rx2D1vk4xAGkqOQ2ddvasPdNjWplWWtfWOjfOwWPmJBLR8aCghSuZMnaKMZtTI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9o4PFQoEYH0ZDtu/bsBsNR9NHN8nwWyzEQI4GJTnyvBNS9yCiU
	jf+ugc/XOmo7v/LQjTJfAz+VoXaJFh3uiNMm2oL0UDciT3UP8iynXJXX
X-Gm-Gg: AYBFou02BI56Xu0Urd5s9ts88HdmY1s813UIsedw5IrMyRVBEFqLn7AeWPsBSw2Thdi
	1z6/bSIPCY3UrdE/VE7zrD5layzZctvOetZaBKUsc36cSfd29HyniLwqTkVH8ZujX5mvSi2M0wt
	bUiDZOlGpgDXTc4ua3CHd/qMF4Q1MuVSwZaLpA6tKZejSytb13j48mjoBNfIqWOuFuNPNvc2bZC
	CtK8oQ904UJohJdOnBnyx3pq/mOjohj0I5HPUvqjf7Lv6e/hRgI2gIODJHCj38bzgg2WQeOgxxq
	U1cboSchN/kTxoPnBUhCPGwlE3DCNVbODqWcMbXWbPGt0ougRhWAni9FPoxJhu+Sye0nQaBFQk8
	YPAd8zxW0sg/wKl9qQIvi+JqA66lZ3uEIidg+sDYXcjUz4cEpt4W6CwsHRjjrWXblDK3Z6/8qD9
	VsqUhAAEWDcFOSo16Xi+m4AGxzeOIr5v3/bDKuTo+/q0QIKN8OJUQk2+9PW8si/3krEXTE70uSJ
	17Q06GnzySTKkqXEP8BXEYE/y3pBvV3iVVhYV8SORHaEi4hrC9w6P//uyh/2/sJN+1TJ0eeVAOP
	F2JMTeUnFjG4n6nq7RMbIbGfxS827eW6tCEgQ4mxhkWkNZPBWQ26QxkreGKQchWSOdOMbrMMifu
	muKHRDKlWGpkUHYEpWUbbe49FpWB2VlCZFmoZvZZBwkKgtC7eRPeZ
X-Received: by 2002:a05:622a:228a:b0:54a:6b3:488d with SMTP id d75a77b69052e-55ac7172abamr111430891cf.21.1794713106562;
        Sat, 14 Nov 2026 19:25:06 -0800 (PST)
Received: from ?IPV6:2600:4040:5abf:f200::9dd? ([2600:4040:5abf:f200::9dd])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d6193esm55747396d6.19.2026.11.14.19.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 19:25:06 -0800 (PST)
Message-ID: <81ac592f-18a2-4715-a34a-1f639ff7a454@gmail.com>
Date: Sat, 14 Nov 2026 22:25:04 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: arm: qcom: Document Microsoft Surface
 Pro X
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20261104070441.74127-1-val@packett.cool>
 <20261104070441.74127-2-val@packett.cool>
Content-Language: en-US
From: Haipeng Lin <jimmie.lin@gmail.com>
In-Reply-To: <20261104070441.74127-2-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 2:04 AM, Val Packett wrote:
> The Surface Pro X tablet was listed as a single generic compatible in
> dt-bindings, but a device tree using it has not landed upstream.
> 
> Replace it with three model-specific compatibles:
> * microsoft,cambria for the orginal SQ1 model (with cellular)
Nit: "orginal" -> "original"

> * microsoft,carina for the Wi-Fi-only (SQ1) model[...]
Nit: ,carina -> ,caspar

Wi-Fi-only has both SQ1 and SQ2, please see reply to 2/2 in series.

Thanks,
Haipeng
