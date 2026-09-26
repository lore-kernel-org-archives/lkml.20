Received: from mail-qk2-f35.google.com (mail-qk2-f35.google.com [74.125.230.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D98346FBC
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 12:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790424395; cv=none; b=NgppHtNh0UqjGLs379SPFXEDsl3Tjvp8FEAW4TfnQRTFpvnrpVk2HGrnUCVcomqF4kETuPUMXFTcUpArxsniMVP6aXrE3gtBb7Ze9HFy1NntrYDf8+I8EHhSoLcv6vY0AocWviu+xroQZaoeJ7fgIliBaDrntn9OU4o9TsmGPpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790424395; c=relaxed/simple;
	bh=CH4Prtq0c/7ze11i5Sq86XT/bKlln4TK5tWRhirwDq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eFoSmH8/nhTnIRYzQClITMGBbx0zJOdiFXNwVAfyYqwpnTP5uAb2DQJrrOQctrUFrtvCZnbkaf148iW9NJaFtJksNbuK7PGJ76ISAv1fAekjnibjUTW9+Wyt/PtIAmpW9Sjqda2nTzly1YwRbMD3LqHhr+4FTfmzTJzKVtfnMQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org; spf=none smtp.mailfrom=thinkoid.org; dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b=UfTg07ox; arc=none smtp.client-ip=74.125.230.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b="UfTg07ox"
Received: by mail-qk2-f35.google.com with SMTP id d75a77b69052e-533264052d0so3636261cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 05:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thinkoid-org.20251104.gappssmtp.com; s=20251104; t=1790424393; x=1791029193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CH4Prtq0c/7ze11i5Sq86XT/bKlln4TK5tWRhirwDq4=;
        b=UfTg07oxKs0svAvereKcUHzppvRcGBfglBZYIb/htceKdk/jDDHxHEU555xai4O8cN
         4HWobDy10KJGPUw7lcEaScl372RPTQR17ecwZxl83eNCknvvqeImJE6EI8cFlGyBgBdS
         F79PPOkOWbDWEjJDJnNYV+SVrFvB8GPemQar0vzO+O9zTDovsSOVxuIV6/JoOkGNTVl4
         JaspCDGvAD1G+fxPaDMg/xyEK2ARPskF3qbt3xkOAWr8wyfieD0rW0qRCuaLl91c6GgQ
         v1/s/pbxltOhebcxRiBUeVMXP7J5U9An/cdJKwnirQtCavxkwXEGH7j0YHrsAj+rSYDG
         aOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790424393; x=1791029193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CH4Prtq0c/7ze11i5Sq86XT/bKlln4TK5tWRhirwDq4=;
        b=2YcG2U3glnTpbU5VKKBnjEwsuIM4tJ31O8dE8qDTRG9wjx0k30T9UTyeZ0PAcFNKr5
         tE4eMYBl5MXr5n3M1IN/M2BN0UNL5TViBQtx5CEObD6N9Ipr0kGN543ov/JuPoR5Rcor
         QzyYw88XEfJJZMCCHcbdG1igp9iMmQrjadgArwXwD4RCoBEZZGvwRqFWE8Ibix/3IudT
         RzRcJT4OIvrlVULbCcmDwGHpWlaNjez5ZFcuzmAeyP/aXqV8dvzyr+0KAeEu+0W+EAil
         SzrI9IHknz9fvwylGvEmReBilYzXExm4CTjHEaAYdBPKMFlzWM/x0Xltq8ZYMNKwPQXi
         5FWQ==
X-Forwarded-Encrypted: i=1; AKwUvBysOe6/bvl2ErVGKmwEl4TX1W6Rg6qrWrAOctifIztjumjITktXrcgvCpspRxVHs1EAYW3V5IZKK9zYYx8=@vger.kernel.org
X-Gm-Message-State: AFuF++nHWbQiNWJCZFCUgb8ksjIXKv7iEUQ9uzQ9T5YD8dSh01fneoOu
	9hQHjGQYcSqpF4z7I0qDlmlS1J4PhUfK3PsU0vthWAOV6SYcwwAURzemWIGnwanZjfE=
X-Gm-Gg: AYBFou0g13WG/+fIsyswRycQ7+oUm19zBj2TjNFEo+YmR2Fn+SmqH2Ejoj1lCzCgvu6
	1SwcHQZEFskuudJrGDGACVCo1pKWGIg9FVmXFhOz2HHgjEcbzX5PlSIYvIViTpRL3hEoE4Jz5KG
	kXX3SlaF62CLbFmBq7iDCo2KwyQcXrGkef+nl6V1fg9ikUOtx6ukoVN4lRJMah+MprCT/7n/gdr
	Lbls4GwmvNjCKW+iQAOUou9BAJ0syrEaj+LRZMHYhKH5a1eNCygyeZSFdL78T75dxGawYX2fAbi
	ipF0btAHHnnDpWvTXFW/WyMveRdEZL5n+XJ3v59R4gWJd7BbDqJVqATl0w80hQCjPsSsO8JlwMf
	5fV1rFJtf75xKcbHQEXIIOXmZZ8eG4DMFB4T36AkQfehOzQO2KCTpRqYCGRQcfHCaiYpM/aF1o7
	LVScae0Aqi5NoMAtHA3gM9eCldWe7heTUSBaAPzdtNrbMVae9ablY/vlhNzQ==
X-Received: by 2002:a05:622a:8cd:b0:530:d0c0:3ce1 with SMTP id d75a77b69052e-5330b5cabaemr99774151cf.21.1790424392756;
        Sat, 26 Sep 2026 05:06:32 -0700 (PDT)
Received: from armok ([2605:a601:a61d:7a00::2])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5332225a696sm16438811cf.14.2026.09.26.05.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 05:06:32 -0700 (PDT)
From: Liviu Nicoara <lnicoara@thinkoid.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-dell-xps13-9345: add the front camera
Date: Sat, 26 Sep 2026 08:06:26 -0400
Message-ID: <20260926120626.26514-1-lnicoara@thinkoid.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <qmc4prmummwwwel4zukqh5fy6jy2f6qke3ygdnv6a7ygvsowkq@gtmznsipiyhb>
References: <qmc4prmummwwwel4zukqh5fy6jy2f6qke3ygdnv6a7ygvsowkq@gtmznsipiyhb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 26 Sep 2026 13:17:34 +0300, Abel Vesa wrote:
> On 26-09-25 14:10:24, Liviu Nicoara wrote:
> > Depends on the x1e80100 camera DT series (v7), and on the CAMSS PHY API
> > patches (v20 5/6 and 6/6), which read the CAMSS endpoint's data-lanes
> > as 1-based.
>
> This shouldn't be part of the commit message. Drop it.

Will do in v2; it will stay below the --- line only.

> At some point, there was a patch from Laurentiu Tudor, but I cannot find
> that patch on the mailing list, so I guess you sent it first.

I have not seen it; the wiring here came from the Windows driver
store, as in the message. I could not find it on the list either.

Thanks for the review,
Liviu
