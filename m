Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D0A346766
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 10:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788863714; cv=none; b=aLyQX1D86YLt8eDWFkGzxLh35XpHP6El6mB3bSGz+o3IJpWvWpY2C/twQfo0p2ug6XzHKDjUcw136DmGRB42yOjnVvZiScJZT1Y0ZR+dUE64LOwzF/mJeNkatA+ATZ5OS3wmB10HU57bCDQ6phRCqFKaMPrZNY1GamhjPgwO+90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788863714; c=relaxed/simple;
	bh=7Cog2nkDO+lKZqVVRGnvxVjru8LcS09xNUgvu87wQA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oOLSaYHrRaBcjoLcjhSUk2NAsyBWLJOmfX2VPbiVyxZstKey60gidc8FSdlOr8yfDTjaPtBsB3AZ1E5hDicceQzuHLzdEaMtl/MyrEc+lGNZnPWZxzD20n9GElAZNdqfWPui9m2ewS343TLhSkD3GalC/rSENamD71dtjLMhSkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xw0JsCwG; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xw0JsCwG"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso48331745e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 03:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788863710; x=1789468510; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UPBRY5QywHVL60y+J3dACmXSkYJynfKQaq7TX1tS5GU=;
        b=Xw0JsCwGgTJBJUOdgJQ0/PV5QtezEwGc0jNutB1Gw1zv8reNebQGdiefiaHa8KRr7U
         1hMyJ3apnPINs0U3xivR0HvBeRSGdr4veM9pY9lS2KYFV2jS1Oh96h8RfW/hvmKqmW4t
         0ZT+THY/QnLX+luO1Bw7BwROOdexDWheEZguw2Akhrhz4CylHupCIPu1I3iOowkRZ275
         fD+wAN+sjY3BCTr1l60LconWYoTD1M5bqD3KpLk2cZU42HqFhsfscDxaXEq3TbRxR4kD
         p+/D4o+k5TOHI+AyPknq9gcaaWMNWMcKYlfoH1ZcR1Xsn/rzTcZgyP7HHU6qebFfva2r
         sjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788863710; x=1789468510;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UPBRY5QywHVL60y+J3dACmXSkYJynfKQaq7TX1tS5GU=;
        b=MGeLfdsOff0p0OoqCBsOLd2u4JyVxTNOnrqEjTYuoRJrY246NQETFgp6BNs0m0ZnYV
         tUaBeacf/Fbg8i010dVOOyy51AoLFu7UbNpOK25rIEHGCIqPgTHChC/Rk2mGDW9s/7i7
         5sPgW3r25OPMUBPkIkTiei5pyQeRfd0UGR1GbrIMKVmezBHwJVxo6gFQcw9U6C14v2Vx
         hgtMAG0QYc4OJM4YgQH5TH989Kw6GjwuiBdsXdG+IIZDJY5Uey0MJVtV/a/KrkbBcbw8
         yOSUMv3sLOO47i4yAPDwwTjBUqk06TyC1RN8yvNzYEYxT+r6Rs7kOc6UpObetlzvqHFb
         QNTw==
X-Forwarded-Encrypted: i=1; AKwUvBz+pqXhNHpv08S3UBhN+MKFGagl2gdxwrOXUPPUmJPp1iHtQ25EkJ1FxNYR8PQoMGzFhCgHpt2jhh9a0zs=@vger.kernel.org
X-Gm-Message-State: AFuF++kM+SD1AIxHx1UanET38xYbLgqysPfSKYn9J9F6hHgk5iN4HoeM
	593bVO0Pf8NLsKlrcOLZmnwAf2KISrpLYQmuZwhdSDBW0WSOfuTDQrUytnvv6wtxu9I0EA==
X-Gm-Gg: AYBFou26nL1D26GVD6OiqhbsAkviOfhhw4Vj+Cwl1+0+p0R0wiEj0jNEOxFx2y8rKkq
	0Q25i3qr6Z7HkWLMBOVUj3stOo9UJIioy4S3G318+fi2VNDDKYGrDIgP11QlEaJYGGpkWRgbVUt
	/TOyldCCUY/BUxNcjI3FriVmclPWfGSfdLzzGEOK1Wxscoghgiv5Bip0zqkZmu3dwcMvm0i1KeM
	zGfLNXu68l2xd207J4jLDovJerErI8dZVQ2cDwOJ+pq+YA4f326yk/oKq3FF6mKXBHdOK5kDekW
	G+GAibVNxrtBKwOX5Ho/A2a4Yf8DhRbUHVBMe+p9JdN6DLqti7VyYNnyKlc/7yzkLpPcssfsRPB
	NN1fwxzvszY1n7AC5cCBmlN8Taso9KXBY3CvD368w7/kmHaw25TDT1mmaUaEY84hLn8H/UhnMUF
	GwK7Z9jd477Xm2fOKsn9H6BJDYycfecKk+RdVFWlzTwEaJuq59oht1GBP/4XXjFrl2A+aLSKHO
X-Received: by 2002:a05:600c:8b05:b0:499:be2d:c290 with SMTP id 5b1f17b1804b1-49cf824e751mr303216285e9.9.1788863709661;
        Tue, 08 Sep 2026 03:35:09 -0700 (PDT)
Received: from [172.31.2.29] ([188.24.0.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cffdb2c40sm236442825e9.1.2026.09.08.03.35.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 03:35:08 -0700 (PDT)
Message-ID: <eff6fe78-cc4b-4192-93ed-53a738fc3c3a@gmail.com>
Date: Tue, 8 Sep 2026 13:35:05 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Sakari Ailus <sakari.ailus@linux.intel.com>, dumitru.ceclan@analog.com
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-gpio@vger.kernel.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Martin Hecht <Martin.Hecht@avnet.eu>, Andrian Suciu
 <Adrian.Suciu@analog.com>, Cosmin Tanislav <demonsingur@gmail.com>,
 Vivekananda Dayananda <vivekana@amd.com>, Cory Keitz <ckeitz@amazon.com>
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
 <apqGlTiybdvQX3Ao@kekkonen.localdomain>
Content-Language: en-US
From: Ceclan Dumitru <mitrutzceclan@gmail.com>
In-Reply-To: <apqGlTiybdvQX3Ao@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/4/26 11:51 AM, Sakari Ailus wrote:
> Hi Dumitru,
> 
> On Mon, Aug 31, 2026 at 04:21:19PM +0300, Dumitru Ceclan via B4 Relay wrote:
>> This series adds new drivers for multiple Maxim GMSL2 and GMSL3 devices,
>> replacing the few GMSL2 drivers already in upstream, and introducing a
>> common framework that can be used to implement such GMSL chips, which
>> avoids code duplication while also adding support for previously
>> unsupported features.
>>
>> While the normally acceptable and polite way would be to extend the
>> current mainline drivers, the choice was made here to add a totally new
>> set of drivers. The current drivers support only a small subset of the
>> possible features, and only a few devices, so the end result after
>> extending them would in any case be essentially fully rewritten, new
>> drivers.
>>
>> This series depends on support for internal pads, for which a patch has
>> been added.
>>
>> The previous version is at:
>> v15: https://lore.kernel.org/r/20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com
>>
>> Since the previous series, Cosmin has left Analog Devices.
>> Because included changes from previous version are trivial, his sign-off
>> and tags were retained.
> 
> Can you check this
> <URL:https://linux-media.pages.freedesktop.org/-/users/sailus/-/jobs/109521830/artifacts/junit/test-smatch.log.txt>
> please? If there's a single patch that needs to be modified, I can squash a
> patch into that, otherwise v17 it is.
> 

These are the same warns reported by Niklas in V13. Dan fixed them in
smatch in devel branch but fix is not in master. Testing with smatch on
that branch yields no warnings.

https://lore.kernel.org/all/ai_txjwLPHsSKsJI@stanley.mountain
https://repo.or.cz/smatch.git/commit/d12183645a31b737d7fb39cbefa589e34615e8f7

v17 is still needed to revert one breaking change introduced in v16 and
fix more findings from Sashiko.

Thanks,
  Dumitru
