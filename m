Received: from mail-oo2-f5.google.com (mail-oo2-f5.google.com [74.125.231.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050943D969E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789538111; cv=none; b=AEESLtOdfIcYb3k7HbtafJYsHVD7oYnCfMMTxY47WFG50I/hUNyLYhM2YaP1mbdhiSlDVZo2ODCQQkYZPmEcEAvKKEuyLUyjgsf4YmAzDIqPYsO4zLSa/K8/HwuMrxJjqWF4nuL8M57pTKKNCuzo6V//iPSpAqCmqJrPSoigk3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789538111; c=relaxed/simple;
	bh=JWWAPKswe9q6Q9rRu4uHaMyOLQMOHOHGC34gBz7wUMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wz+mrFefrWOm/C5IC40JQh8C0cevxtp9FFuZifNVYje/G1D5+3w0Up/aIkFQYeePqMR2bs6oB/tzomxZLf/+hD35WD8cGiRfeYm3EKxvWhgTC5S+cHYc0a2hQkhOMSbbebhZLRNup6jXaGAKGU4xNCkIC3V+SFF9MJsUVD6cyZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WT5s+uWQ; arc=none smtp.client-ip=74.125.231.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WT5s+uWQ"
Received: by mail-oo2-f5.google.com with SMTP id 46e09a7af769-7f748fe2947so2254714a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789538109; x=1790142909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MqFU5BpLPG1Ad79y0zq7m4k9RGfhTKwi6mVEHKHgkMk=;
        b=WT5s+uWQ8yhFW4GKyGzc1gE+2OW6sK12rALqMj9Iohnm/qdXfxUNGmV1+34zi9sf9N
         kK8c9dmxNwGpZbZ1rH7UoHLjz8rkzs/UwABII3XT5xc8/ylxqrN82kmAooKKYjVYyo/U
         8fhP5WuGK72jbLLG21o8dirPzUfaqAN/pmA3mCaNL1+ZUgr9Ho41gtrFIQMpIhmsJw68
         DchcETbQNl+w+KZ2kmYmJEnWSOl26DJLDJaehHcqtPjh+9/QKvuIAKQzLm/mLlEHipQy
         6w7Nd3DmWvAu5pcqScm7IHm7ZNMo+ZecALQVZHM+ntOuD+/iXLBN8NPRIHEAeCh9c9to
         mBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789538109; x=1790142909;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MqFU5BpLPG1Ad79y0zq7m4k9RGfhTKwi6mVEHKHgkMk=;
        b=nZT5nRgk0YjmClBp2N8trAFdGg4WPp+iiHgWRIbZdGR/IMZCrw2aTSiO3B+6LFf5YO
         gajf+LOE6N4Z8voOWULG3YABk+Hk78rL2/I5KH8RW/o1GQsyHFloo0pd51YaJIFZYA9N
         AkFGy/7bkfyXpXe6P0rMqyLaFiNIY/TKDJIuKDDVlAXhsvWLyrj9nvI55E9uSu8vMUim
         HFBwtCkyYZI7qLGwHHz17l3Xib3JzeShCstwN86zLv+LXV2CFKX5kdy52tD8dRY+2HqB
         GocC54XuE/ugyppaotZLoM1xQns7HMThgileirJxchwxqZXiODWYh+22wdoW0289g1z1
         SHmQ==
X-Forwarded-Encrypted: i=1; AKwUvBylXlVRW808ukWD2b4MOrHCEi3fOz+JL4nrBey3fd8F4x5FbwCBsItiCX7tc/7XOBDiUjM4Ox6Bji30itI=@vger.kernel.org
X-Gm-Message-State: AFuF++kN+plodiEBEK6QQ1C68GqbPJUcqLJqFKfgFdH8q5l5ez27hoo2
	nR4slE9yed/Vmai7TLIe7pNHZNNKPkboCu3hJPXAVUoOZ5Iu27qH6X81
X-Gm-Gg: AYBFou33W+bGK161jhkrtXoa0ZWYq345MkojaYgKRNHdNyGOFfs3uiDdvrXgOny6kJN
	xM8tBzFID12TFQ9TF5SXlfHkjiHKenTfLtxctAavYDPxgYOsQezx+PQaiog/USg29RTVLEbFXR6
	rKiZBfw8O9Zd+SJvwbO4LhToKlNgKBfLQ0+XhhPboYkxCvnmTN+7jVxBHIxiKdV40QefW6W94uH
	uKQ70fyer9kNqeH3LURq+Iu9StifCsa1klYp5mbB6+FQAcyy73Jrv0n4JJ7htOJ3XbPjRN9HDDQ
	EcQbpOBb2eTIGwUmxcq2sfHyuI13UvNK2DVzvqsDg1d+ju0BJjOoBIVOOYIskH61o+u0oakmZ+O
	Yve+0+KmuAmN5cCHsn6mF4E0KuezkL/eG9ESIL+EOI5/lfI+iGLd4+F2a9GxKVEOjgrdnABCLdz
	57F1FcB2W5l/DrUI+AyYVC+9VfLyPYWEe4keXQR+9+Rwbbb0BqBBgKEd27Hvx5toypQ5wuMBszv
	2YcI/93ojqrkcw3
X-Received: by 2002:a05:6820:188e:b0:6b3:f4b8:bb86 with SMTP id 006d021491bc7-6c7d1bc852cmr1410414eaf.22.1789538108821;
        Tue, 15 Sep 2026 22:55:08 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::b712? ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c7a78ac1c6sm1949699eaf.13.2026.09.15.22.55.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 22:55:07 -0700 (PDT)
Message-ID: <b9a58aac-4a49-43ed-93f9-32c295609312@gmail.com>
Date: Wed, 16 Sep 2026 00:55:05 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] drivers: gpu: drm: panel: Add BOE NT51021 driver
To: Nickolay Goppen <setotau@mainlining.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexey Minnekhanov <alexeymin@minlexx.ru>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260913-qcom-novatek-nt51021-panels-v3-0-266bc5d7e8c9@mainlining.org>
 <20260913-qcom-novatek-nt51021-panels-v3-2-266bc5d7e8c9@mainlining.org>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20260913-qcom-novatek-nt51021-panels-v3-2-266bc5d7e8c9@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Not sure if I was supposed to reply with the trailer again, but to the 
individual patch, or if I should leave it since I already messed it up 
in the thread, so I hope I'm not doing this wrong:

Tested-by: Ryan Brue <ryanbrue.dev@gmail.com> # Amazon Fire HD 10 
(2017), boe,tv101wum-nm0

Best regards,
Ryan
