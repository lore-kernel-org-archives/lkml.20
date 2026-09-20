Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E4046C844
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 21:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789939457; cv=none; b=QR7s9iHm/lXueTHWeE6Osd8VJpIpTHOotgAhLFcU07SXHVg/eAIasyggBqZSjOSyUUCdX9k7PmlL5jII2oEhWXK+UVoeK4GWifHFcnRYn4+VWnJUAK2HJxWoQjg2jq3tRi3fIcvlRqiRmtSSYeJIZlh913lFjERcnitPTXK3pwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789939457; c=relaxed/simple;
	bh=HAe9drQ2Ce/111VV1trP80s5SonnyEnE61XjrLoR3uc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nmuee6PhVeLbnaRRHLYXwfQj49CGUBNLOvrI9Tmyt4EQoX0c2RK9Njoftvjc6aesekCSFa4HFpg3kV3qc8VlhKUZEc0aZHcevaCB6HWdWNNH1ryU5ba7QP3zpkMf0TIIzq5SIna7Iw35AVApl/TPwC204XTupCUfX6XHNv4/F5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nUKtGDAT; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nUKtGDAT"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa663bfso354334666b.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789939454; x=1790544254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IPZKEOuc6OoXrjfYUnhc3ULWdAsyQzK6Afr3Z+Jdqrg=;
        b=nUKtGDAT8f5U9JJObFbWM2DeBIroGKhiACb2Kzu0KV2ctY0c+Mcu3ImH9atjE22uL+
         kH0M9AcgL0XO+65sHr77ezMo6+AEhvxaGTwBJRBC9EcJBqquFJd1am1oNwvFj3O1SzGD
         8+4gOLoG3TE+YvUEMoI4/9AJ9JONf5MEhK3OfwXBpbvFQXDG2MR/tlNRu/P7YEyM9Btw
         ZT5eZ3iNpEEtF2/Af45zzVdau02iBrjZuJiyc/56gsfr2S3meGXvYjFo+/5rPO/zmNaH
         1ihdWPXGlx+aiA5rXxkcywPLDsPyz5q2GrOt5MlUq21euNDD+BcmHmjb7nEX0U7ndoTi
         GLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789939454; x=1790544254;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IPZKEOuc6OoXrjfYUnhc3ULWdAsyQzK6Afr3Z+Jdqrg=;
        b=OUO1zp5gdFvsu3MArxaWPxvqUwU/3QFW9/iy/U1qe/+3tMqIezDvW31wWLtto3hctD
         gkuf4HF/hf1G55Uj8/Vfc3QdLJK5li5YFHIpuEh7DveMqofwkriumA3Qlfx6QZobwA4/
         ht4wzATo3cAILi3GY8uacQEmQyA5Pm/0MCEkC/CmNjN2ZhPr6FtCy6fzWtlYQ7ltwNgl
         c14pySUkZPM0maYqYYVJmMrKgBncnportH2mwGQJ/+rjmNCLKiL1As2Qu6FwR6ntuRmd
         FHB5dz24N/ddXr+j3aUDWLcCfJidasoOAZxvMYosiSkgo5nesbJ4586NF1ckkN5jQmVw
         1k0Q==
X-Forwarded-Encrypted: i=1; AKwUvByNP9/q6ns07464eYxAPTFQPhy2u/q0aIMFBcmfmPznjXFg7ps2rdKL/qfaSanPOBskooYD04gIrmS/USg=@vger.kernel.org
X-Gm-Message-State: AFuF++nikjbLolgN3rxnv8FiW/ZtG1BdJl4gJbozztapCAJZiI8M3KFC
	YFqeGN+hMh5hIIrT3a9dM5s2C+05/+0UtX0kKNOHOJivINg2T2BjLN4q
X-Gm-Gg: AYBFou3JdG0cS74hIWfi4fXc0WeTqDVXV/p0FDwx6d1HyhFjcu9Ghitcyqp327UpSQ5
	rLwCbHxOSCnfExGv8hJR6a/V8w2E9mkYPDL19+ljPKxfmcEoUfAYWn/rt6Au/xVwg6T6NlttKts
	RtcRhmBvlqsVir2ES/4ViQDg6rMXkRq0mGeFXUOXXz4arevrZ4is6cLRScKIzZoWap088whICwz
	mKOglOh9GCdQT+eJ9V3h0cZ4v++ZrHOOVtKDim9p9mbdHwxniL0Dqr0SEeAselmNdf/nNNK1in8
	3r/U06N0Kg1OQPrlPyJxg3kK6N2LqKH5fEK8jmvZGaMhMCvoaq/tVznb/QUe11GFLiTOFE/zmLk
	WWMgCCXaK3XPjME0WE+rwvT5wzhtjyzFfqerEdQEE58y8+3fSe4npuUzXK9HfZQWDo+SBC8W5J7
	u9HfBhMH08vocQVHL51ca4mpOIwnA/RI7PAkeAUlD2VIfBEKFXu5H02cd1nHwqermbCTU/y6RFY
	zW57u4IvO/6y29R+H1RV1O6wI27GolpFKmvXsg3mZk=
X-Received: by 2002:a17:907:a88e:b0:c29:f5d5:5aa2 with SMTP id a640c23a62f3a-c2a159a99e5mr731499966b.44.1789939454246;
        Sun, 20 Sep 2026 14:24:14 -0700 (PDT)
Received: from [192.168.86.89] (81-224-151-184-no600.tbcn.telia.com. [81.224.151.184])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a3590afccsm219473766b.62.2026.09.20.14.24.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 14:24:12 -0700 (PDT)
Message-ID: <9318fed0-31c0-4991-9f57-a1cabeeebcd9@gmail.com>
Date: Sun, 20 Sep 2026 23:24:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION 7.3-rc1] HID: logitech-hidpp: hi-res scroll mode
 forcibly re-enabled on every reconnect for Bolt devices, overriding userspace
To: Roman Stingler <roman.stingler@gmail.com>,
 Lovekesh Solanki <lovekeshsolanki00@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Filipe Lains <lains@riseup.net>, Bastien Nocera <hadess@hadess.net>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
References: <20260920094508.39682-1-roman.stingler@gmail.com>
 <arAe2iRkYh9p98Rf@eggarch> <20260920205058.11958-1-roman.stingler@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Erik_H=C3=A5kansson?= <erikhakan@gmail.com>
In-Reply-To: <20260920205058.11958-1-roman.stingler@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi!

> Possibly related
> ================
> 
> On this same Bolt topology the wheel also scrolls far too far per detent,
> apparently because hid-logitech-dj does not forward the hi-res wheel reports
> to hid-logitech-hidpp, so the multiplier-15 steps reach userspace unscaled.
> There is an out-of-tree DKMS workaround for exactly this WPID:
> 
>   https://github.com/Magnetar-OS/logitech-bolt-hidpp-dkms
> 
> I am reporting only the mode-reset problem here, but the two look like
> neighbouring consequences of the same commit and may be worth considering
> together.

There are two different patches that aim to solve this, but it looks like the
dkms fix is a bit more robust.
https://lore.kernel.org/linux-input/20260901-bolt-scroll-fix-v1-1-58bca7ae487f@protonmail.com/
https://lore.kernel.org/linux-input/20260904034843.1340846-1-rafael@rcpassos.me/

I think the best approach would probably be to apply Rafael's patch and see
if there's anything from the dkms patches that's worth including too.

Regards,
Erik

