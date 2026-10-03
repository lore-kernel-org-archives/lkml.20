Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C4433ADAC
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 21:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791062137; cv=none; b=AJM5oor4VLZd5j04vwpBR5LD98X0dQrt+P41HyLbZXdq+00bARQune6GJZLgNVSlIKry3o5v/58cDYYL7ysdH15KiU7yxpgVXj5vgParevmPWzmwpOFi+U2UfQU5o5NALGucsJ3q125fjd5qEs820ZQaASrukPT8S52ro65yQJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791062137; c=relaxed/simple;
	bh=0Lvbe0PHv15siHr1sAjoZPt1TQ2XSgsh2kXVNemT7U8=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=sO2U3ktr3Qio/pvmtJU7en6u1hk+yd8T3AtSyKEdv9KuS8+IQmRT9PQaHKbFYUi2t8taEUSfPIwROQL6MljNPzgK+mXgJyVK815p/4klYZSmoNTy1Pp5e7FoHYySHhLjhyGCfF+9/mMpPgw8Y9pADx/fQ02D6dYKWvjvJelQkhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nF8XL0pP; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nF8XL0pP"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bb7848fdf7so431448e87.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 14:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791062134; x=1791666934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sYdrKmlcH/gFo4xN8pAi8w6DeNulYqQ/HX5EWjKFQ5k=;
        b=nF8XL0pPlhJYKWyg5aN8nwjYl8p9kX0kygezC1OdtSrIsMyV5CmYDqi4hwpB50V/LR
         LC0MsCixCh73vA0hfLcCRyc1rw7ZS9WaEZ9Ei9iW8HVUjAPG8OoFhv1g2NP3MOi9PkZQ
         W6RN0/xoeLvJLnYxRlNS6FnZiAvsDcjw0kheywbFAYOLH6EtagAl2ZH5tixj8Djs1WO2
         AvdB6Jy8qr/mvRCqJwBulRSYWIC2tG7w6zeituaHsjh0VljXmK91+P2qnqF6f3tJRWzE
         id03vEWvUtCn892EVLlYw6LGGTvrvTKal6ooeFFN3qu0QT3yaMX5TL3IS/vCs+GPRrUF
         xkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791062134; x=1791666934;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sYdrKmlcH/gFo4xN8pAi8w6DeNulYqQ/HX5EWjKFQ5k=;
        b=zPdeDjGLHaNuk5cxp9HVGFk8CDJDuLezoj1ofAWsvWt6EpCZ1jrYrrO2I+9JKFZVeG
         S/iA9ub9idyHkJYmfLPi1asT0pwBFD0Y62pSe9fNhNYQajFpGTH3/XkWe6b7h6HcNTEH
         FmT6r1Hg8JC51ZMMCypPsj+ktNAD9m9FF3HhHWqxr9+E7NKIIbqgqkA+GKRKENW7FGvz
         7Jy+8NbL3jLhlD124gmR+5q1+w9K2TwmvwIGqxb0U0j+4WfVAK/bG3gkRptHvBqfTvyc
         95tfIuaSJtHxuYS8kLl1B/dovuH4jtQD20BnBNj/OQZytKOZst8Sg9QzWtjIWjdT+Qy7
         ZuVA==
X-Forwarded-Encrypted: i=1; AKwUvBz7d+RLT6nVF6YepKqt4j6uJAvfGSLX2oAENMKeZvX1F5ANzNOOP09JES7TutffbB+FrsmJ8QkaMmL2L5s=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5UL0IFe5FZDzF0zbpjbXi93wPU907VyWwAyunkJTujlSWNJgg
	AGLVPV0Lo11AnGWYAS2xPzRg4Bof/+umnr6OPicT2Ohw+A9JV3V/fcUF
X-Gm-Gg: AYBFou1YPS+QZMA4blp4LFlkO8BSPCdJ4Yjx4BJPMh5aXYDqAcPvy4lLNES8bMiApkM
	U+EkJeB9pwQhWpikXZP9PCtYqDoEoR728o8xggut7NMhcim4SWwn4qQSBysYx/MLoRCHjgJ/Twq
	dlnEVIY27BTIwrOe8Go1Q6l117EQlsqDgGAp/mcRzBDwYfKIYMAE11xJuEntwgMSwHWoy++N4yP
	gBq97JlbkzQpc2/l8LEZMOXTLtRhhxFwmdsn13uZY1b5GaziVSFOD8hc9A8+zsClCaKU2V8YrLc
	N2WqrljXYVYWv0RjH0BHdPusdnpCOGwDgo5RFTWpL6YZ7ecqUMDEahAk/yzBSiSTz8Sp3nqNTOG
	6bzxJZJoD/CUgK62epIgmNvjrAbSQ/C1kurVV0t69tmlQEMJl0bKmrjtvL4Xx8VBX1aXmlnqJtZ
	C7JYuRGgOSQte0DJmQoInM+4JAd5B3b8Umlmk8ljtSVdTfPdkLi8ergHIFuMSBSDyIZzLuilTHR
	cH6rbBRoAcc5rtRarKtm+iBwASGUYuyCXmBrHfxytEOQD4BEAeOOCtMPA==
X-Received: by 2002:a05:6512:61c4:10b0:5b9:6603:d45f with SMTP id 2adb3069b0e04-5bcb546bf56mr840472e87.55.1791062134218;
        Sat, 03 Oct 2026 14:15:34 -0700 (PDT)
Received: from [192.168.1.152] (95-27-153-35.broadband.corbina.ru. [95.27.153.35])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c79dac1sm1820978e87.47.2026.10.03.14.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 14:15:33 -0700 (PDT)
Message-ID: <cee107e7-b747-488a-bc80-e0d99e9238ee@gmail.com>
Date: Sun, 4 Oct 2026 00:15:28 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: dmitry.baryshkov@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev, airlied@gmail.com, akhilpo@oss.qualcomm.com,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 jesszhan0024@gmail.com, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 lumag@kernel.org, marijn.suijten@somainline.org,
 robin.clark@oss.qualcomm.com, sean@poorly.run, simona@ffwll.ch
References: <20260930-adreno-progress-v2-3-3882f0fcd7b4@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] drm/msm/a5xx: Add hangcheck progress detection
Content-Language: ru-RU, en-US
From: Nickolay Goppen <goppennick2004@gmail.com>
In-Reply-To: <20260930-adreno-progress-v2-3-3882f0fcd7b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Didn't solved hangs on sdm660, but I think that it isn't related to 
this. However I've managed to get a command stream from hang_rd. How can 
I share it?

