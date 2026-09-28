Received: from mail-wr2-f22.google.com (mail-wr2-f22.google.com [74.125.225.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6C84E80BF
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790610856; cv=none; b=bn8Zt00gtnYXm04KCaiAOju3p+H8I74Hsus0H9yrsPBFNPkkx2g93tpONAJ02KMln6G0aukD5F+T83igdnI4u3qXGAKIGMdDjW8HsJBNFKsb7Rb/NfE4EjiFOU/yZSh+G1S6FzZWEr+xhhOu4kz1j/vfbUw6iHC/ZZXf+HfKOEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790610856; c=relaxed/simple;
	bh=btGCnFhlcQ9Tjp2kCrPOIBm9c9H5F/PoS4B9XE+7z0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PXISDQ3rum1zX//JPL8d0r0F11KirUhu9nxd58aV+TrfdEAykb9f+Fsdxqa3qHdPF0EXnylOIKaBAKuttm0W9hWi1TSBNrSGe3lhQNyQjPPE16So+hBi7xSoCR53kkbMace/lDAH/BNUwzZ9GNhrVTTtlAQC73EFB5SaOJQ6zps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SXEIvKXy; arc=none smtp.client-ip=74.125.225.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SXEIvKXy"
Received: by mail-wr2-f22.google.com with SMTP id ffacd0b85a97d-4887d06c669so2481804f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790610850; x=1791215650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NZXqqboH9bZP57KAcRjQkDCBUvfiHeVgKVSx3nYEKBI=;
        b=SXEIvKXyIXNyFGjC9wAfQ0wy7KpcoEEft6qj2cHLHzkCiGslmRG/3MdJuJAd4Cq9FR
         MR6kMsItepCIZ2L5cZwnwFJgaV7Y7mEdsqQqfm9bFETjH5tE0Rvym9wtjWuJwxKMKA0R
         Ics/VBsilEY3UVL8fhPLv7ao9FTAQt5fVmpE0FSIoW7LYDRgdf2vp8fwuA8f1QkZRmIE
         OKDsGnEFRR+5bFfat3vOBfeLWQ+WumxqfImwIH41Ma4PWOOQfGSCTz/hghhCh/mo4b9K
         vrcZ9L++fhIGc0KcglADhiqx/8qkPL/lgvDuZ6fZXQRbNntavrUqMoW4yHhVdqDKXces
         gNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790610850; x=1791215650;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NZXqqboH9bZP57KAcRjQkDCBUvfiHeVgKVSx3nYEKBI=;
        b=BVGbnvy5jZf1T2I3MHH80vKB59Fx8Ku3SvmEF7huNV2bnl9izpkKE7O2nWe2+X5weE
         LIHx5WYEObTlnJ0wFmauMPzVcdq1WLuWbOv5XjLIra1ZnVulJ+4rb379PYj+dDjKXPUv
         V9Tk0ocEVRJFsxcZQ+eBl1BxBFpdezfVPOEzkjjLMlI2ZN8pbNspIXc98nqZMA8KuM0c
         DD1pvvctOolUWPXebDEH1EJqAEI66sTee4Dp3c2fQPIotLOL30rswQQc9N7jj9XmsHEz
         c+SYt0gs6/wFUpVZhtePnmZFbgUgYA8LJThxmlu1js17aOTveBCkN8zVNQdQ2vbfHoXC
         aXXg==
X-Forwarded-Encrypted: i=1; AKwUvBx9cQQdIox+UCiSrDHDniyAqam9oiYT4zz+jnAvKvYiqSYqbtKIjhAhM+2i89I0x5OIJ25g2vyb285xmQ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIt3m1SRrOzzHMOYZ9YJNZQtLb7O7Gye9QvPzXZPAAbaoY7rWWv
	LRAnPLbYXwEOsH06NGjwXqO2CpqGpzmBnWY8A9CwqDHsSnw1nRzsIrSaBPIUuKm9E00=
X-Gm-Gg: AYBFou3sSZxfOBE44pcb0OPtR6Bjodhl+xPO+4pNOAK5OmaOLwuOhvWYOKy2/R3LZ9x
	TtGt/ej/bd4n6bqBlRhJwNR6vZZZ/Nv6RG9ev2D/kIMzQpK8SbeiWLo8xTCGm6EbbQESFBWNY4z
	ZiwnVdD4wrCRVIb2QC9oPh7yNCd3Nen/q8wBZOorPL/UzrraV4WvPhYRpIws0WAHxoDlpkrjG3A
	QikeYVBTYNwaFjB04VVgNYw8Tr23hDcNLY9tf4vP3qfoH1ND7nlI9bJrpM/jVoL1LKB5vTQ91TR
	PBY5Cb0+PPtiZE62Ij1vvbhBESTSoPJ6DX0lrBfXIFY2NJz7nmnTcqcw9XmTOPrx77jFtImbvE3
	EJtrIrAWS4GxDv4dHaWGD0HkHurm68uaR46ZZwe26s6V/RhuFxGSVFmCNLzs1E+AH3XbrV26xi6
	n3oZb6ILbbneCqVmeglj5WoXXl+1U0AwtRwD/a8aaifyV6PucEE4bAZ+LvnbUFxex50vL2wxlGn
	wkJZORVw7lc549YDRG8UmQ=
X-Received: by 2002:a05:6000:2608:b0:488:84ba:ae2e with SMTP id ffacd0b85a97d-48884baaf4emr13756148f8f.0.1790610850114;
        Mon, 28 Sep 2026 08:54:10 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.243.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-489bd7b1df0sm7993153f8f.31.2026.09.28.08.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 08:54:09 -0700 (PDT)
Message-ID: <5c41ef43-a065-46e3-9522-faaf3884b487@linaro.org>
Date: Mon, 28 Sep 2026 16:54:08 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/12] Qualcomm Type-C support for 1st generation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 David Heidelberg <david@ixit.cz>
Cc: Alexey Minnekhanov <alexeymin@minlexx.ru>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 phone-devel@vger.kernel.org, mfd@lists.linux.dev
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <voc4ie6fcegr3thk5n6dib4pkdxmracch4hhgjdih6pxrq2bfm@lq7mx4flowqk>
 <f85cdfb7-b797-4b4b-9937-670c6dfe52c3@ixit.cz>
 <zb3s4fmwx7vu3kcqigensacbgdqoaqnipfn4ntx4dh7ahrfr42@hvdw36dqb3qn>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <zb3s4fmwx7vu3kcqigensacbgdqoaqnipfn4ntx4dh7ahrfr42@hvdw36dqb3qn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/09/2026 17:33, Dmitry Baryshkov wrote:
>>> One major comment. As we see, on SMB2 PMICs parts of the Type-C
>>> functionality are provided by the charger / FG device. I guess that on
>>> SMB5 PMICs we will get the same problem once somebody tries to implement
>>> additional charger features. Would it make sense to rework the PMIC TCPM
>>> driver to be a composite driver, taking several components via the
>>> existing Linux interface?
>> As this gets decided from the QCOM side, I'm fine with whatever suits the
>> hardware best.
> Bryan, as you are a maintainer of the PMIC-TCPM? Would the use of
> components be fine?

I mean maybe. Would it not make more sense to land the TCPM 
functionality and then look into adding charging moving then ?

i.e. finish off adding this piece first

---
bod
