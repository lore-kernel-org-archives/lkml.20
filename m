Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404496;
	b=zzIApKSwZ9XjCBFZ1phf6kQibwHbe1moBrkTLTATk18ZjEWNlCKSvMNaeTGimDW400Ny
	 WsmXYK608aqMBLWpJOXHAowFFixFjQpAEvfX87HMIdybreHLDqTC4yLr2QEj8KZ7lxQ50
	 K0Kl+bMJjqdjRFvnWkP+s1fy/lLUIapyvC6zAIpkdsnqyKf/jCYEu5lSpJz24O8rpyUn9
	 oZf+ZaYr7929rUnZhDesEVIFoB7chNV4u4JFfuJX7/atT+Tu+vW/ETiEVR/Y3GogMtm5b
	 YR8L7A+L6ct9b2PPEn2SMCRXSqt5tPW/5QLL4OgJQB5RjM5xPy1pPrtEpsyQmdCo9WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tgcyXRom+DYUOBHj/B31scavrv/8OCK7JtPppDaBX+M=;
	b=5U0pWRrwTz9YJh+UzSWZ76RShPOICssq61Xh24uPn6ixnShQwkUBtrS3BeWOh2eiFJmS
	 YdLAvYgu0TIZhhH9sxaj8PtMPke8wURQsD7x8Xksbod+EZ7pcFc6FqDgppmasNKnrKKyk
	 ergj3LR6W2RmrFeN983NoHIEAmebhO3pTKMzoH8aG0CUTgq8BKEbShqctc6S76nI+0Bcf
	 d+kSqGwAebnnm7S2KOzwzz1WNINxV7wdqoyD4mbbRGVyx37nfvoBQWTQWryg66d1uv1R/
	 WEsLcM4K9I6y75OiWNYQVBFbyXyS2JqwRYkWpxkr3E4vGndKs2rt64gKxDANQi8sBkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F2M43Q5h;
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9852606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9852606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F2M43Q5h
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-4adea5b7a2fso1411235fac.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794404495; x=1795009295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tgcyXRom+DYUOBHj/B31scavrv/8OCK7JtPppDaBX+M=;
        b=F2M43Q5hBJqtm2Z8XTdPEPr3gXFWQKX57WO91E8JYaXNf8lFx6xv482WviotB9saBF
         Fk+pOxkRYsN41HIKHasxbMsR7hGp9UKInskQMg3dj/B5EReUx5meqbv8GAPATba1xkzj
         U2usazsmFAsfu4tkfuq5XgEqVgxmLq0/7SYCvDclv2kJg6nO/F/eAa3nLqJ1z0utVWPR
         vqYVl5i9ccwHZ6kQoiqvCqzLlaywgPJkcKZmF+yudB5MxXUZ0KhcDomdVJJEXcBN1Bri
         LtbtJ1+br4+ExfFu/N41ytzS/8Afdlw5bpVE/1d0zOK1m0wDf6cmPF3mOMF0s/E05sVj
         46/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404495; x=1795009295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tgcyXRom+DYUOBHj/B31scavrv/8OCK7JtPppDaBX+M=;
        b=vXgYlXlZZbbwljLSroOh2+MO31J7+2lUNeWJoQk2DDdbxqiZWF0BVceDnIggO3WRud
         SfO/tsvOG8s3gy+sB3vFMCdFQMzZrPDIJf4dOywZthH7PWpyBlwQTffoZHCoaDMNsq9g
         lB2IeAsCunWxA1LxJsiWXxIO7odoWQgslahQ0Z0qWBR3ETpr3sYhj/5HYfnpCsOfRfPk
         rD0/uJ2JdLqGgpxBpLVHaI/+V3+ceB58qXYGQ1fJXQC9FnHjmvkp9CaJtj3imNlovh1P
         ZZqH2Mi0G14EWMEoPpQ8tbJ4bGxa2P/F+you/I74lrifnsKpaexJ4vHiJXdR/QP13lzl
         lmdg==
X-Forwarded-Encrypted: i=1; AL+hErG+p+KKnB/vRXo8fM84Kk24LpXaL3ZMJeg8oXM3zSSz0x+Kcl5ZJ/CymCLbuY72NNsCaS+8aOJ0oIyADCI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sEd8rSMWIIzXwTNJor/1YcUzRUtxrOe3VACXPT8IKoZjfiMLY
	p8WFNeyLXWhpMSUF4UeNSBZinRyNokaHvpymGNmtwMlqT174c5uY8iBOkYrzOEIK
X-Gm-Gg: AYBFou097r87OsBY6W4qHAnGvbHUhHBZ7+/lt8Bpw0ZmSNFf4xk615oKB7ySfLXe+a+
	uMp9d7815gNAXMS1EDIt45Shijka4hTNs2WgcTxYy9ejEYqzWkY1LnGNoQBaCKoePfRMw5K6AoD
	ClXYceXsTlfmI4wCOdDVGtxr6WAhY6mIAog7/2tj47D+vOfT7VggtvvTxnm/Qmlrpg3c1/ra6gY
	F5Xd6AfpW5LxmmXukLpaVlWnFs0TLEARuc6AAY7qmr10GCCYXvUjrrnf9tVRpscFjN1QB+iLXLh
	pxyDpULNotRajymOsktA5Fa0NMTcp8Pb3MvqfbpgJAvbCix5C90vSMWg8dk1sIyoXGTiqYM5p+u
	5EXsCJJ3rBkF5hFq+MVd9HZTjMJO9kyDmRDv5dEyIaVVxuyeZSDx+3hPTFiN3KZK7vy6T3FBNl2
	DPKAIsTzQQq1TCjBMZ2ZL7f95g+nDj9alNPB3RR5mcOXzsPD+Y1bgIZRn9qbZVS+xeiRQfWS3YM
	ne1FmwjQdYqjnbtCCXuLwoWZxy2X/QdPRkL4c3kEwJhMxtTk1NkQXKIsdUtVfBQI9NZkFQtyP6h
	1AN0rKTHIr7fyzzhhENAxpt0OCbW+U3OO9q8TzPyJRcifjIcDWieDeCVBhsvKc+9mNIlXFv1Y4w
	=
X-Received: by 2002:a05:6870:ab8f:b0:494:7af4:954a with SMTP id 586e51a60fabf-4ae46848ac6mr2154035fac.8.1794404494609;
        Wed, 11 Nov 2026 05:41:34 -0800 (PST)
Received: from jeffmr (63-152-14-173.cdrr.qwest.net. [63.152.14.173])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae22fc1041sm3410611fac.7.2026.11.11.05.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:41:34 -0800 (PST)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	David Collins <david.collins@oss.qualcomm.com>,
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] soc: qcom: pmic_glink: Add GIO pmic_glink instance
Date: Wed, 11 Nov 2026 07:41:01 -0600
Message-ID: <20261111134101.15019-1-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261111131424.51869-1-jeff.roach0@gmail.com>
References: <20261111131424.51869-1-jeff.roach0@gmail.com>
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

One more thing I noticed: after the GIO test, qcom-battmgr-usb stopped
getting uevents on charger plug/unplug (sysfs "online" still changed,
but no USB property notification seemed to arrive), so the desktop
plug/unplug sound was gone. It stayed broken after unloading the GIO
modules and a warm reboot into the stock pmic_glink. A full power-off
fixed it.

Jeff
