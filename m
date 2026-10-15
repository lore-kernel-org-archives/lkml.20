Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDD14A5EA7
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792065919; cv=none; b=N1HFpczfXflgCf/8TQoe5GLaYA46uQTqIdBNRduyKhN2btF7NfTRWEiwCELVQQ2C5bpoPNuVGR0khXUEwwd1ywsD+S6k5hbw/O0MdBufphl9GnbZCw0rTp3rsgfVhi5/S/+jWoLo33GEU6rMgmU3KgcLYhkvl2l6wtkBmUDUydc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792065919; c=relaxed/simple;
	bh=H2PLSFQjwTK6cDxYMFkulS32m+tM1cjh2fVPobJzdYo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=a5HIWf3kmTJvWDcMMDsl73FiEwHDl6BuooKjnaZ37pczW6fO89X/azsgerk/DqcVW2m9hKQtD6d4K/OYIJ9Mvw8YjUXk8f/bvkM5SyCz8GaWdJYdV1bP7eiy6uX2d2T3UADxtjhB5bSh+c1NdJZKEtyH3+lnx/PoQ/A9jGBqQ/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DhyrwDwA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=EPR6fZAn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DhyrwDwA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="EPR6fZAn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792065917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1OUeBBOBtMAwfX1IUkR14M+uBjul6NAIBoL8NzgLm+A=;
	b=DhyrwDwA9BZSt13gsiArOWH2nZXw2RiD4NHKHJXGke2vM7lk84Wn6GMNH6hAx2cyWim7Qc
	WlnRl9sfkUOgHzOXMcpyjqyGBJ5Wu1E+wNXCe1m8BfQ7eBRkzKW7x+JMgUXbvhoFqJRZno
	Y6K5vD+WcYkLLUC5cPAjlL95vRkGV1w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-K-4169BzMDK0dIa4RQvslw-1; Thu, 15 Oct 2026 12:05:15 +0000
X-MC-Unique: K-4169BzMDK0dIa4RQvslw-1
X-Mimecast-MFC-AGG-ID: K-4169BzMDK0dIa4RQvslw_1792065914
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48afcecb035so1716802f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792065914; x=1792670714; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1OUeBBOBtMAwfX1IUkR14M+uBjul6NAIBoL8NzgLm+A=;
        b=EPR6fZAneOCF2yGXBVQ1enNkT590RjDzick01N/NI8FQWrdDTZXQhHATEja4msYrHM
         HVD0UJBTcj8NUu1f7x5wuOmSh9ud+rXk/uah+pC3nbRrVUYxrkghxbv9WdqTnLuvqvui
         uWxto7gqHm+kqMK7FTd10eHoXHM0jbBWXRQNMEfNN80qc3edDhr2MrpGlbVjKyEG0FW7
         1dy07HqX88OPQAz8hUQOZ2RbgXHLJkurIB23bP4m2ujO/GaatMhfHrM5lGz0Nv1n+jOa
         oso2Mq6kxxLFcayEmg/twSvAUS5BjyR9Q1A7Sez/WO16mUdXdQWgecgNN85/UI41L49d
         hCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792065914; x=1792670714;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1OUeBBOBtMAwfX1IUkR14M+uBjul6NAIBoL8NzgLm+A=;
        b=X0QYMNqZvtoal3tP7duKoxPu33S6odoWvRJd5BbDL8oi2fajyQMHxPeuT1V1Ig59u+
         f0kXumNAJs2rzyNEQ4mGNY/CTcfR4ub36FguJPcsjg5PV6mi8nmYaKD4EiaigrE9y2bN
         xkSKnlh7gfiTKKTRaf6aCw3RfoJOghTIjWwY7A0ZS3U4Jy/526nGY05YWMowPCiTY0J4
         4X8rTIqT8qVfSG74fU0ESXJG+jGLTfO8UvDoq+mIEDNahTqvi61eG0v8wCd/sT5DlgPQ
         fimsTdK27+YV29aBd5CP50v0j9Fh8I7amOylgw8x92QjQAavW3RZesRc5Ak8AxyimPuw
         A0Cg==
X-Forwarded-Encrypted: i=1; AKwUvByZMKy+xyKCBF7sPGdOS/dTo7ZMUyA7JTP6WVV8JHPhjWx/1cmb0BpUoM2yBLWaBEvFIuSl3EdrcVXk0tc=@vger.kernel.org
X-Gm-Message-State: AFq9FYImAk0idE87zFAORp6IgBUyXgKfWBs3Ul5wTpbBtF5af9Rv5jzm
	7TIQHDcXtr2TSCKMBf64Jd+O692xv4q8ItaibOhea8cEzhd8k3JFqBBEyezcT4jxjRf3zea/p37
	2cMfdQNm4lDwgmeapMNI8x6PgEZTQuqSmOCiMGkusw04SpcQZs1Y8f7Pu39uPge8ZrQ==
X-Gm-Gg: AYBFou35OHYFRtlhYwSwLNSrczv9lAQDUbLkaLFriANggMlmp9pvd01Jk+XBttbZ7Y1
	cWgV6uhR1tOk2L8drKBh9lEQi5rnRo/7kPvh19Jqp72sHtJs+gJguAo50FmPOXXtbhy9MBdSpfR
	BteDbDNx7BbHZDSuuJPaE3XgwtGiJoVI2Igh7Pci4BPM3Mnr1COjCyPfKjS0fVsZ7Z+YbM9My1C
	TnRK2em8HaMb4rrYEdbU1VTlokxlJuGSCr9UNzavYTEBSGjy7PISYV8is+4cD+ro0ZAetKMFr4A
	+eIhWKfZLJb60A3f66vH4bhAMhidy5amcBVp9Qyr0jc1lbjDWD0awcMnd9x/N83Xs9SFengrGKX
	Rekh01ey5EYdkQ5H5WX579HS1jFEP1+7H0gDE6KyJMy7RdpcCTrSHn0+B90zqoT9Ufw==
X-Received: by 2002:a05:6000:288e:b0:48c:6756:dab3 with SMTP id ffacd0b85a97d-48dbf3d833dmr36030569f8f.3.1792065914359;
        Thu, 15 Oct 2026 05:05:14 -0700 (PDT)
X-Received: by 2002:a05:6000:288e:b0:48c:6756:dab3 with SMTP id ffacd0b85a97d-48dbf3d833dmr36030533f8f.3.1792065913872;
        Thu, 15 Oct 2026 05:05:13 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48df5c3b89csm2881901f8f.23.2026.10.15.05.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:05:13 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Phong LE <ple@baylibre.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Julien
 Chauveau <chauveau.julien@gmail.com>
Cc: Paul Cercueil <paul.cercueil@bootlin.com>, Nishanth Menon <nm@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/bridge: ite-it66121: improve reading IDs and
 log on errors
In-Reply-To: <DM5DTVXB3ONJ.1HC2E6FMC5TX5@bootlin.com>
References: <20261015-drm-ite-it66121-log-probe-errors-v1-0-7fd6994e0be0@bootlin.com>
 <20261015-drm-ite-it66121-log-probe-errors-v1-1-7fd6994e0be0@bootlin.com>
 <xlv1y0bzfdf3.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
 <DM5DTVXB3ONJ.1HC2E6FMC5TX5@bootlin.com>
Date: Thu, 15 Oct 2026 14:05:11 +0200
Message-ID: <xlv1mrsff9u0.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Luca Ceresoli" <luca.ceresoli@bootlin.com> writes:

> Hello Javier,
>
> On Thu Oct 15, 2026 at 12:47 PM CEST, Javier Martinez Canillas wrote:

[...]

>>>
>>> -	regmap_read(ctx->regmap, IT66121_VENDOR_ID0_REG, &vendor_ids[0]);
>>> -	regmap_read(ctx->regmap, IT66121_VENDOR_ID1_REG, &vendor_ids[1]);
>>> -	regmap_read(ctx->regmap, IT66121_DEVICE_ID0_REG, &device_ids[0]);
>>> -	regmap_read(ctx->regmap, IT66121_DEVICE_ID1_REG, &device_ids[1]);
>>
>> You should probably drop these defines if will no longer be used. Instead,
>> maybe you could define a IT66121_CHIP_ID_REGS_START or something like that?
>>
>> Although maybe is good to keep them as documentation? Not sure about this.
>
> I'd rather keep them for documentation if you don't mind.
>

Sure, I'm Ok with that.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

