Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638091;
	b=f7c++whySNGpOdmZbpODfVuJylDd4C3IdYirlSltlKECZLHkWJGbn2KFxZg6RPH+I0PV
	 V/7nz6cp6K0HIXYsZKQvwvCVHo+l6I8bR/4FuRtDaZsAXIgfJS/vlx2RkMun7S6ywkzGZ
	 eLi5quAwVq6Ptu5m8NPBn5Txf2uI6vcgYZkxlXGzl2vvVy1Eh1MsnekiYSWu5FOmxd3vF
	 FOrw9jxn3jAk37dVCXenWu+mLV8gThIuKRvH9JhU1XgKOMYHuTapzFguKEIVIZ2JiBdhj
	 2PPjyJ/aMTHeq6J6e2rKdKOdKKXNGfAw3HnN0TWYRW9KuhFdaMbq8sLyWt17PExksQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Z7VS6al0JzZMFGXrqJsbyoWOE59PZK4uhHY6gGIKbAw=;
	b=sBck3aEL8kzy9EM7nuKuGf+eFApNsQ1OE9onvoocGfnHwYIPceMigZSFUkBe93+9Spbe
	 8DQbuNcOTtL/Jz/UadzQUz8K8+M8p0I+bzNaAQLxKsmT5l/IjUuCFX7F7yvKTEu5CAn8O
	 4zpER4yapvC7bRQ2XyisLjDjorAA0tazBM7ptDZtNG3t9ecVM0os1jps2e7vhyJENQ15q
	 A20YoA5156GaXkBQGX0enDO7k1KXLkO1+ba/XU6ndQM4VfH8Q0CCuSYSGKcxvm7iqeG42
	 nHoO/jt5JNHSFefOAmsDtggihy9I+lrT5ZOA/tonelZ15b1gRnBwZfpUG91QwfykDzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OIrKkQdH;
	arc=none smtp.remote-ip=74.125.231.139
Received: from mail-oo2-f11.google.com (mail-oo2-f11.google.com [74.125.231.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C240606B1E0
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:48:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C240606B1E0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OIrKkQdH
Received: by mail-oo2-f11.google.com with SMTP id 46e09a7af769-853d57a81easo654119a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793638090; x=1794242890; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z7VS6al0JzZMFGXrqJsbyoWOE59PZK4uhHY6gGIKbAw=;
        b=OIrKkQdHg8imsBqMl/+qEQYyMtw/THLGUi75tT52k+NWmj7srcUIaq9Y24tajRC/KZ
         fnM20P+QtC4Y06hDbFvcLxAxVIYB+WTUfuHPVdYumkwqlGk572TrzlYpRmmkypyaq+tt
         cxPzHUpY6Kn6yb788Qz2H+fh1vjYxgDdXsk6sTktX60X0m26/kMdA0Xmd6vGopDdMRis
         jGsl+/cHPuZovGvek1+SdnEH8HVLDgqq57x1Igk7fdgnYSZ8mTV/dOEcKk9rISGOEkBV
         awtYuMMd9x4dx6FqvBOVMNynTcgnyYOwldGDPFv5Dofz3EqzKFuDq26EgAxHCeScaUEg
         oCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638090; x=1794242890;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z7VS6al0JzZMFGXrqJsbyoWOE59PZK4uhHY6gGIKbAw=;
        b=Nmo0IpS0bnAQllPlqMKgG13up/K0ybX380xRocYitWKJCgpaLczJT3Ksif88nQwwNf
         vm/YxRVkVKDoWyVpR+VSqV02IYZ++g/Ri0ypEsJjQou52KcdmbaEXmw3gpPS9ALX6x5U
         JFnk3yNDjFBOZsDAN9CTm6CSx7vd1gb3Db7fPyX1YXD/3Pp47lv+REvEoXXdIhvyUdEC
         GqDiTVceZGJhRQMC8aPI9K320WGdeFff0v3b3N1Re2dI+jDlFqdKmLvNDuziRA3nn0MH
         CYDbpmKtLYaPyWq1uwZKPrZ/77cXliFqb8rt4WB6SJOxwHY12etbhkla9MqHJcruJgTY
         tRQw==
X-Forwarded-Encrypted: i=1; AKwUvBwIjzcObOnflbw8BaH/uGdwR3i3iunAHG63yaGT9n+FaV2cga1axZjikae024BXHZZbpYQ8UlNwExQv28U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsw2jyXSAXiVqy0z9fMESgvEyW4UshMBJ+GsbM7AQElVeC6sWd
	wHiPq8O9ABp1bk3yIGZbU4Siw8Sh+D2w+eRiJtoMclFt4RXHd26QIjBC
X-Gm-Gg: AYBFou0T5q4zhBQeX+yoQ8XoHLcDmf58FD2Ue4orMoL5UfxPeBwzP7wTIsF+sXEf338
	/fJxma3kJ+om26ACqC3I09lvj6QLwJEcwHa04LmrY6OwOxJJw4/rvjCZgyekkTTRj1la2p4e1Js
	O3mF7EEVAR8fu5wq7ouc2y+w6uA3gM1u0RDUfie0+U66uzCWApJvCvAPRORRtTtnMGYmgkP5Som
	tCaB+Wy5YG/v6k7sk5A4bfet/8UFPL6MoLxyBfaerVaNNbfNGuzZGSnjpACIKVa7GnyvAs2MpX0
	z2uzhE5PEGrWxrLanPuBC7OI9bBdJtSeVaOxp/3g2iqvX3PHxnk/DTBTQeT0VrcYPgOF6wqIN36
	N9ScIpyhFFtuWq1yyAKjsbT27CQ1F7igikbCpzxNsg8vGR/kDWYE9+Wr82lbtJkPNpWmm4HvCu+
	OKC3g+L7IN4oWC9rXlR4efhqFzrvr7cTAd2qdRWyPk/mAWZ2lNVuiADx6qVrmtyIdPoQlBYupL3
	gT+OUFWAqYZ66R8n6rdZjkAAPKAQX5GH0DuwJNQ7lfyYfK4yPD0wFYiQojf+hzTnYa9eo5+99bf
	v5Py73bHuwvFlwxbh0JbcoSjPt5DgGpKRXyz99lHAGh5d801qLjW+ZRRl8JUzUqg0yXHckO3TPP
	+qxHl+LxZMwIbR7YiTZFa
X-Received: by 2002:a05:6808:c232:b0:4cb:ae51:5971 with SMTP id 5614622812f47-5640ddade81mr7293574b6e.32.1793638090243;
        Mon, 02 Nov 2026 08:48:10 -0800 (PST)
Received: from [10.10.121.179] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167b03csm6972479fac.2.2026.11.02.08.48.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 08:48:09 -0800 (PST)
Message-ID: <74880003-29c9-4f8e-a7b8-b5ecce9d4230@gmail.com>
Date: Mon, 2 Nov 2026 10:48:08 -0600
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
Subject: Re: [PATCH v3 1/4] drm/imagination: don't gate the runtime PM
 callbacks on drm_dev_enter()
To: Gyeyoung Baek <gye976@gmail.com>
Cc: Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260913-rbrue-suez-upstreaming-pvr-suspend-gpu-system-sleep-v3-0-674b907d0652@gmail.com>
 <20260913-rbrue-suez-upstreaming-pvr-suspend-gpu-system-sleep-v3-1-674b907d0652@gmail.com>
 <CAKbEznugM-HxPxHwZ7RxC2iLC0TDH0qi9649hWATiPYXF+urfw@mail.gmail.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <CAKbEznugM-HxPxHwZ7RxC2iLC0TDH0qi9649hWATiPYXF+urfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Gyeyoung,

On 10/12/26 10:43 PM, Gyeyoung Baek wrote:
> 'lost' looks protected by reset_sem, but it's read here without the
> lock. Shouldn't this at least be READ_ONCE()?
Thanks for looking, you're right. Lost isn't fully covered by reset_sem 
anyway, as pvr_mmu_flush_exec() marks the device lost without it, and 
the watchdog worker already reads it unlocked. I'll make it a 
READ_ONCE(), with a matching WRITE_ONCE() in pvr_device_lost() in the 
next revision.

Thanks again,
Ryan Brue
