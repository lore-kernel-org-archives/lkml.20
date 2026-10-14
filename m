Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E869D4F68D7
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970688; cv=none; b=F73GCLSYoGf548TM2RhA6RQp1sbHUs39dmfjkYwaxb5A8wD715YjpE5zODfARcrtTB8DWIpdXWdDYJjxVkhcslm982iCvxo4CMEOctnWGmVnJoKofouIQF8kgY9P0aUty3f4a6KkZgeIYUwJw9ox//7Lb0o4FUlMCqqrPAubBLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970688; c=relaxed/simple;
	bh=JAZDEVVWBpCzIsROIvJ7aOp+s0L8O8CrbhuQdamS+9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A844MPYkMsNUg7VEc2EePZOqpBrjyOErm93ARSxgNfKVDA7RipFpwrd1GATJAahO5z+V2+w8Fhg5eFRJKCNQM8kICCTX8VDInPF6Hk7I4P1xmELM9Lbn1aCegLGEn+ubtGSipemt7301/5lxCUiLaVSbIRke3JdMVYvAkZIyo5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D9TLTe3L; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D9TLTe3L"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so23591785e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791970681; x=1792575481; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gnTWC5fZozzSwkHK4q+Oqe31gSO1RQ9RdzCpCj2F8RY=;
        b=D9TLTe3LV0X5U6WrodIJZ4Js9dABg9SPiO5halhg4sMS7y5xRqIJi15y/LSCfW/gff
         3PPz0AbVI8KlZQMI+JMJ0zom3Z184cvYzFHfbRWzVs9fuw3xO47o+Fp/XoJq/BLEWRa8
         GuhozyslteyFWi0slZ1rKsak4hUUaOGJTEdFluoNTO/4Yl+p3OYnm4dkMI/5HKoc+0qY
         El/6gNKTJY3hyOBZIoIiE7jZvHXsvu7fHJVmHWedsjwzyI5M0+WRIVkGmvBDHLuUw78N
         www8t0s04MAsGaGS+3oYPfFZwAZYYVBrW1XTiLUN6m23lwL9Tp+7Zkf6AAPHK1hOBCFK
         BVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970681; x=1792575481;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnTWC5fZozzSwkHK4q+Oqe31gSO1RQ9RdzCpCj2F8RY=;
        b=AMQL1YZROh50BTAsQtBLPYO68LEi+o+mK5lKryVl1izZgusnOuHiTs0japwmzeQasF
         NsybmmtXHC5z8Ukpj+oMg2xYsxBjJnOXfgLPe7g4xKRITD0BEWoUjEcXQu7dmaXCzpDg
         yU4jiKXj8aeoowvfxIgwqac4TavHqLSgAa7SFmrsj9AVU4pLMcS8Vgb8shwGL9Jjc40q
         9YQO2rhG/rIlSLhyTr2MI0tzWhTsxfhZqQOWml2DSsQpUzOFK84LJVavxNPfEJW7djRu
         Uy5ik2Gh34T7MJo10Z5HHd4c+yu7iYeyn0tR0NiwkZHh6HVRjNpHf35/TfXXp+8I3YKr
         evCQ==
X-Forwarded-Encrypted: i=1; AKwUvBza6UUQ/G8pAMU1gxr0hViznlBkGyANZGOxjwiAwgaW15UJsL7SbaU4J/oP4OSj+HfKmLlo8GG+BxE4K7Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBME1kbHJFCWOzwRwk49Ea0Tt2VaEYP0VAaUsscDIbln2kCzNO
	DVhm+uHJUii75yj6XS6M7gl8Hp8pqOb/6nMXekKh5HHltxlYVzG848trkdBgiBFWg4M=
X-Gm-Gg: AYBFou1DTmTeumYhatc+v9aoS0Zmb8OQnyY9y/Bz8abIkaqMNr7voenpPfMK2ZVvORj
	HoFE/y3PhNbAIkeI9pFNfRPkznQuC+aKfnx836RnVDgvIMCd4ne0Hvmug1p65HVqlNXsWW/S0Qz
	2IgDoJjLfeXbcLJlSAWdIEl0SH+dKdUiFF6GYwGuiYi9x000V5PhhpsJFRjn5Fm3Oskr/ycLFtt
	rCqKSmDoXkOswQJISKnBhS+rcyGiuFWbeZQidyzhup+PwbPAOUuR1Fbq0KcI2LgbdqTvJDg0bLl
	Elxl8IHkem5EOFZLxVmrYCon+2SRpN08mxm3fwcN+dMlxPQ/1ZISJ25XRid3FCterHTQ1He3yIp
	Th1Y2KbEjqoQvjs/HPGC8oxHD2Mg3KDBTRkugbBzQz8suY9RzsJ7Dzin6nJysv7BOo1Zuq8rv5D
	CVG5YTYfMEnEX9oh96yOz8kKt5KwWV+hlmYEMtHuTaZI76RzFomltHpGxoN/AefOCQt0eyN2jEj
	4UUYqfsppR/
X-Received: by 2002:a05:600c:3e0f:b0:4a0:1b21:2628 with SMTP id 5b1f17b1804b1-4a18e4b60d8mr299229875e9.23.1791970680941;
        Wed, 14 Oct 2026 02:38:00 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.126.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de7273a0esm6026436f8f.29.2026.10.14.02.37.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 02:38:00 -0700 (PDT)
Message-ID: <db980e07-adf9-464c-9fee-401581986508@linaro.org>
Date: Wed, 14 Oct 2026 10:37:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] dt-bindings: media: Add CAMSS device for Hawi
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org
References: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com>
 <20261013-hawi-maili-camss-v2-3-fc93222da89c@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261013-hawi-maili-camss-v2-3-fc93222da89c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/10/2026 12:02, Nihal Kumar Gupta wrote:
> +
> +  iommus:
> +    maxItems: 1

Just the one iommu entry ?

Please:

- Make sure its just the one
- Include a comment to name the one in this file

---
bod
