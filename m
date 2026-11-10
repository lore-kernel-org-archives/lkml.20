Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794325402;
	b=5eODHhfW3Ffwn5TbRxPvYNPqCohiWfkIUev4o9QkQrjpo67P7jq4SsRwhyFamQwcxbMO
	 uxrDLLjR1VkI7958ipjuFaghgMtM4mqcNueW1al9kRqi2kzYrP/BqsEi9pFiHVB6enSov
	 dQTD/vRuMS8DAz9O57Yc2xjpAgR+XQaaKil4wbdzYXaFCVu5mBbmRM3lxyRcHZnDT+aqV
	 dCqeEJE5/2qdahZfI2wR3LYJGuPwXZGsnvQlTX5mbvcPfHqBzGreHbJjH5S7Cifz8rl2i
	 L7N5m79gcP50wZuQKNggGlYkFFf34XSwnHdbh88ZWVPWDJjC3xhdM9TWkQn6NfStRSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794325402;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=TQtG4o/ML/2sB0MvTtvE7H8moOh6q/FDtaR4iqmNY1g=;
	b=0w8qHwXAJ7vG7M175gNNkC2kmAaysal+4/9jfu+UHCplTNxrat98puFUK+Gum9V4SFAu
	 /eRBjwiUDK7E/QN8AGmcHNIXdcb6Mvzw2Mt230bf9p6zCtLY4L+Pg+84xsAvP7149CzIJ
	 LGbsMP5WIyEfPPCMSrkfdosWt3xk+ieDM+EDlTFFgOqb2WS7xkrOuThTwfT25z0QZ3sOM
	 r9stqwCh2otTCk5tC/SLoyHqeWXl6J01Xp72SerXM5AEg2R5vqw2B5PyoFRqk/FoCrg1g
	 wkIzA6vI9bAjiOhhRwZFcxw9Ijr0fKlrlErhSn/rLc4NstC5Ln17kanBaZ39owJc6SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3537E60A260B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3537E60A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdb9d5c1c8eso1098500a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:43:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794325401; x=1794930201;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TQtG4o/ML/2sB0MvTtvE7H8moOh6q/FDtaR4iqmNY1g=;
        b=pXi2SH6dqAj3FcxwKX6ieq2YYVQGj6SEDZ2+XZNwzhaW+mplQMT6eIvSGhpPoTFRyc
         V61jxWOfEBDCCkqY2qWYZeVOP4g8Zbx+/udcj758IR+W6Cmt3uj8tBF4qrpxofWCCUET
         66VP6J/LNt7Typt7/isRYM/33Lie69k/iVfVsstn7G1V3kuwAj5uEm1pxTuiRnpuUF35
         b3NaTJakq+rTw5flyakJd9/bca0HnxEICP4S7Ndi7seNPwO2nAVV24A4LNV9+oE5HSCb
         d/7+ACpTp0e0awwHognw0HrO7yNdRUcLqdlGpmIlbrcKz8OzKBVa5M7KYFH9AZyaYwkQ
         3fcw==
X-Forwarded-Encrypted: i=1; AL+hErEjHPkpNuxtdppwd0BmRc38KAUddoILqGG4OfYlBjITC60bLZCW5NJyNaQoUD3flc3hxlR2VPUwvTdpzmo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/4rITRot57M8dJAjKrCavgnzYQlYtI5P4YUfMVpOyn3EzQlUa
	eS2es4jZ1OGeONPLQS13Dp4QpuVixzSJSsr05kC/jp7GGohvPzmu9b95
X-Gm-Gg: AYBFou1v6kQgDlsrFE7QEezqBtJOfI+/Qct1ZuO4bwPFyF8gQ6m74tvA5AcG/U27Jmd
	1XpYL3rP6a40kmE5piPbpKjre33q0eU/0YaBddpQRzcwHfUSWylR7AqqRpz3OhOUAzc/8NGE4m5
	VAM7ZVWxjDlWK8ezJVHif4unt5NDNkGMxk24ZqiF0X40EXpg0FehCeRNXkTegoSs4stUvsb5NS5
	9wU/mdwG7q4BYegKMTzSFEgwgVwMKYV3mO9r+GbTd4zLh8Ev5kfugtSwlXBF2GkZxZEkeoYjYdm
	rld5bl4//RaQJGxeq6b9BLAMmDuKkLvdh+StVGou8FB9iDlA0ygj1Cu+r6uYiyzUp9tsJnmcwih
	m9PREAUCOfOrY6B05k8aWKp5TQLLib6iKO+/VEC6hkAgIrPyiQ30NyWq6jviEp10CVLCtFOoZPD
	lzOPvcTnFj/ORJ4mdk9Smno9ajwNg5AHKjS3vbHz7a03NnMM1p232toxDckATM94xAOn/Opw9kZ
	u8EdjDTKcB/yUel/ZjRmH4Qz9ha9C7Yu/UJ3KD/gBKYk4UjFcr8kBYB0KSqxefUHBlJGBLt0u6f
	1+5HfDAsU6RN+FSw+kB+X9TEvgyFJeKUXBUTAxjBGWir5+cTLmKCdfItQCeHTJVZXDrSi2cw
X-Received: by 2002:a17:90b:288a:b0:3b0:a9de:9886 with SMTP id 98e67ed59e1d1-3b166cc035emr3111438a91.12.1794325401459;
        Tue, 10 Nov 2026 07:43:21 -0800 (PST)
Received: from ?IPV6:2800:a4:890:2c00:14b6:ffbd:f8b2:d9f2? ([2800:a4:890:2c00:14b6:ffbd:f8b2:d9f2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d5e830dsm891469a12.4.2026.11.10.07.43.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:43:20 -0800 (PST)
Message-ID: <987c1008-d0ab-4508-82a2-1a26104a47c8@andrewgigena.dev>
Date: Tue, 10 Nov 2026 15:43:13 +0000
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
Subject: Re: [PATCH v3 2/7] dt-bindings: media: qcom,sm8150-camss: Add SM8150
 CAMSS
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v3-2-0103e8a0bbcd@andrewgigena.dev>
 <20261109-slick-transparent-ostrich-28ddad@quoll>
Content-Language: en-US
From: Andrew Gigena <mail@andrewgigena.dev>
In-Reply-To: <20261109-slick-transparent-ostrich-28ddad@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

First of all, apologies for the late reply and for not following your review
advice earlier - that was my mistake, and I should have responded to your v2
comments individually instead of letting them carry over.

I have now gone through your v2 and v3 comments again and addressed most of
them locally in a v4:
- reg/reg-names moved to the top, redundant minItems dropped, property order
  aligned with writing-schema.rst, example cleaned up, ports use
  patternProperties, bus-type dropped from the CAMSS binding, etc.

Regarding your v3 question about the order of reg/reg-names/interrupt-names
(vfe0, csid0, vfe1, csid1, ...): I took it from qcom,sc8280xp-camss.yaml,
which uses the same paired VFE/CSID layout and is the closest reference for
SM8150. The entries are also in ascending register-address order in the SoC DTS.

If you would prefer a different grouping (e.g. all CSIDs then all VFEs, as in
sm8250), I can reorder the binding, DTS and driver resource table. Please let me
know which ordering you prefer. I would like to hear your feedback first so I
can adjust anything needed before sending v4.

Best regards,
Andrew
