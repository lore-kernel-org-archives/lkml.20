Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759D9531AFA
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788950754; cv=none; b=U2XCtG6ZaUSrDNYgMuMN4883CttoPqUV8RUryxOeyqx/Gfq8KB49N6FZ0+CTJ/AoEdtreduXd3hWeLtsvmAUAxgq14/zsGkunhArvL6wO3iBS7RwWwHKn7zL4PtCMqWfWSnAebk/hkGHH4mF3Saf0V9Gajqe4MKG6EYlwTleml0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788950754; c=relaxed/simple;
	bh=tfrLqcGsEUuzNpqwHNUq3Kj0poSsyq9DZH41qa+NCYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H1rI1GGkA8tWkl8IJMelYhZ4+302LqRgGtL4XFWGjY3MHpI2Q4aMEElOJA38zxFtycJzZuvSnSocVI9kWuhgxKvEsH0jXFOewivpD48UlsE8fK3P8RP3m0eC1PvGpFJyXfcaAU92B1N2d+QNrn15Xe1gahgnkxvvQxbzCY1NPi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FuC7/YxM; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FuC7/YxM"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6063d7dc4so18417a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788950751; x=1789555551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5MH6BpfVCqGiCGTmNR3nzVfS3qVLZltUsj1CqM88T+M=;
        b=FuC7/YxM0IWorvVEMRW88CTSyc+nScDh3Dod5/LuIjNq1SGR48ljmYMu4IQQxA6W50
         uIDo/0GyYLzcigr28UyTrLwqVlJgs2LxCQoTEdlsPmsF/tFcKQ/Zo9tP2iqhL6GxYqf3
         EH5REa3ORVqW7JsRYgPZ5O0TFNr5bJE+oi3RdMWG2tahoc4LAhDAm52p5PRNKvmt04Jv
         9pp8oNAWQTGyd1DSRw8gc3y6Htf0bMryLokUr24Fm2IV9Le7I32Ii0PX+tEHcESPTIRG
         9w2V7LYYEIHcD7DqhMmFmDPFOpKgGhEiZCL0YVeLZ+pVdJa5Y6o/QC9rjBqsaZyYBsu3
         Ah8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788950751; x=1789555551;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5MH6BpfVCqGiCGTmNR3nzVfS3qVLZltUsj1CqM88T+M=;
        b=hwJQ+bv4nCJnhywuXp0WBgNNUFwSNpyZDVrupknWqsQn8RyBUYpokWRoo8gJzo36cq
         OobABFdMRgyT/2RO2Z2KMmJJcgvbsfrlKSQFUbUG8YZvsHELmuJx7h0mIn6sYHIjHYYF
         1X+wNMAd2gpRAN2Y2YWON7wRa2bNhnJXXpiDJ4kHA022nUOTz83uGg95i6AOglJJcJ86
         NEe5doQKTND2nKzDM5/tm92HpwZvSsdsXi47pXljt9ymR//JryFUAqV5+Bw38Tcu2ykC
         CHA4z+X8SWMBuXgns7nLheGGeMygx6HjiRLlp59h5Ua4GhK5fUnJaWlv09C8P/5CGOtG
         qbRw==
X-Forwarded-Encrypted: i=1; AKwUvBxhM73Tr1hIM5/4f5ivJZfdALH8WYMZGuFXle/se207sVchCl4KqBBYsWshC4xMqFpdZRv7GKEEYfGcfQU=@vger.kernel.org
X-Gm-Message-State: AFuF++kcs0zdD8SQ8HNxM+HQkjwI5zSi/CiCyB1WQJqpXAl6ZKpAtWrt
	9AGNjpzMsCsJlKMQZzLOLYX4cGHCVQC3G71zpVKRsvk1PSepA3LGyXli/I5RVX7D53Y=
X-Gm-Gg: AYBFou30A9S5PGInhKdGdrSE7kRgwvif2hGrsr4KmgxXXQGwsHDvEEf4T0bV4N7wZHh
	qMsyOJT256btA+yLmLw68VT73Jh/JtAGUQYZ09w1AKfeemNFt6iAExcYFP4MReWoT3eN0tMRIdN
	WtjsG9hgIzXUi33NF5uxe5mmdYO8AeBqB0GwX4oU7QQBTZ6YdzuVU2268MhkMBfFBuptNeLFCJ3
	sXcLDjiib8Ug9wBiPAsgytsM4CUer1izN+yHNgCK6YUQPhvHcKyjVL/fQICwANTpvUMxrYNhKHK
	/O2SYMsz98VqJNHazgUtxxPF2tD6HUthzAy1bkPRQ3YLSyc7tNwmNpG9XC5ygwZIPeiv6/MM1dd
	yNsBePFEh6f/A+xBKawCg+mBlBepPJ2cQx/3oLJtm1Op7qZyiVBH9GPRJbi2xzmvcbqJPGeB/in
	WtTaWsmyC64oOu84k1xZJeCl94fp0kDjp4Hawn8b18PObR+Wq6qzSma0CLCGuyyficiRtvn3lhV
	BDWdwxI
X-Received: by 2002:a05:6402:3253:b0:6a7:f5b1:2726 with SMTP id 4fb4d7f45d1cf-6a99ccc2f32mr65130a12.8.1788950750705;
        Wed, 09 Sep 2026 03:45:50 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.32.60])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e6c20c0fsm6886762a12.30.2026.09.09.03.45.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 03:45:49 -0700 (PDT)
Message-ID: <eab4c6be-e3dc-458d-8011-304a98f2354b@linaro.org>
Date: Wed, 9 Sep 2026 11:45:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] dt-bindings: media: qcom,glymur-camss: Add Glymur
 CAMSS
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>,
 Guru Das Srinagesh <linux@gurudas.dev>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
 Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
 <0wqEOKsKQUG-cPJyVkrWjcUUrp4POMvOxwKLbIaM_HQ9goiCr0D4llW4AHLrRfqjnLWyFVvpWNGbwqu6DNBM7w==@protonmail.internalid>
 <20260907-glymur_camss-v2-2-75f7982dc983@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260907-glymur_camss-v2-2-75f7982dc983@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/09/2026 09:13, Nihal Kumar Gupta wrote:
> X1E80100 supports both the legacy CSIPHY resources and the new PHY API;
> Glymur uses only the new PHY API via standalone phy@ child nodes,
> so per-CSIPHY clocks, interrupts and supplies are absent here.
> 
> X1E80100 has four CSIPHY instances while Glymur has three
> (CSIPHY0, CSIPHY1, CSIPHY4), expressed entirely in DT.
> 
> Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
