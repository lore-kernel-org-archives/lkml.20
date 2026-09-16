Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0DB4E2F2C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789593200; cv=none; b=sudtr9kRF8uu6U30DyhZI8y5mhCtbx8O8S/sekf8lNJlj07fV8D5ddzUg1tdA4bDUugNs8KG2OsP0JIJdRkQBR+ns4qpzxl9/KVdH0K1bRDuxSwfg+MRH+xMDJUEvXtTjVhkbMtZYmGAUyrMb2VJgXFP9h4W0jplxtwWzKelhSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789593200; c=relaxed/simple;
	bh=g2VZBiIhAndeip+NGRI8TveTvXF5sUhhIo3CK7DVi2o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k8beQvyXoMHE4jABAwB6uNuTXT1UEoB8dtfWm6b/aBdSC5LpjyEynKrYDQzgK6Fsti40Xsagh8W0ALOKPgXlYE5PjLsWfnK87p3Tk/prb7qSKVH3u1Ni0Kvq/Am1dDUbc+KcLHyxXtwAY4kmMubQvcroUZ97iQnz+oWp9JyWcOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iToG4YI4; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=sk73WvRl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iToG4YI4";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="sk73WvRl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789593188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g2VZBiIhAndeip+NGRI8TveTvXF5sUhhIo3CK7DVi2o=;
	b=iToG4YI40GqedsdTJ2KLusN5zyTZrqAdtHLhcBD0AwDbMje7hKJVOyx9lAalGdBaUumUlS
	NqbeugwRSX7p6JeSUB3wFgCUZIf4IUL1uBQ08yF/ATVp6Yh37Q6Aq8XWw5RhBQCKUFzqZJ
	4DF9F0xUtw/ptg1kJ1pEn8uiuyzxPd8=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-t756ZopPPSSQ8dqKjfiTDQ-1; Wed, 16 Sep 2026 17:13:04 -0400
X-MC-Unique: t756ZopPPSSQ8dqKjfiTDQ-1
X-Mimecast-MFC-AGG-ID: t756ZopPPSSQ8dqKjfiTDQ_1789593184
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c82c79466cso89891e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789593184; x=1790197984; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=g2VZBiIhAndeip+NGRI8TveTvXF5sUhhIo3CK7DVi2o=;
        b=sk73WvRllNPbamEDuLZM8v0kkOEcE6OAGguEpN514hQNIUWGJb1tpZ7knPvCo+5G9Y
         GT2OcsQUPcP78z5VW8ThWK23nEFj22uESl+A9Loe/LeRLhWzFKDmJ+W9GWJkmnbBpSxs
         KRNtdFIC6XbGd/QPwwZ1IYJALuQiRGRFvgew5T/ww2pcfA6GGEL+9X1CVbl+RohvLgmd
         371oQqUStAzJpAjVCQAubFpBUVspS4B0ZvKNG2koHEY8otDnic5r9rCpyyhcCvGmUZQw
         neyXzph41hmTkfp8vnoacDz3yCtio7cGx9IdzrCYhzHDFk4d1AphzMxbolQ7hFiMGCJ+
         y2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789593184; x=1790197984;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g2VZBiIhAndeip+NGRI8TveTvXF5sUhhIo3CK7DVi2o=;
        b=PyyLqRmpLDwHa7CI4Hr/a5s8dQPsGTz30GY6L4uuvp3QwU3ARDgjdACU7iFUhZtCJm
         CDuhYvH0+rYvDnnuxjiZwzu80ZJduK07VDGbKWn6YH9HgFVBrNQEi2hy4XYS2rGuR0To
         Hq2tdl0VnOVpD7Baf9LbDAkJ+NzbgOKKNCXdSQrFki8S0SXCLKJ5DRetJRley5YOCnaF
         m/cIUaChtr7AC2zCGFiLe34hxe/z8mh/xwmoH4Vf+liXyjCGcvXu4BN0HEho2njJfN4b
         QFbvXygEd+m/KaiBGV4kumA4FWuvCrlmJOXWLAj/8KsYP5algYl2tZmYXPwRmWpC29vP
         cB7A==
X-Forwarded-Encrypted: i=1; AKwUvBwYaelsNu8qhcP7Kr/m0jn0gV+74QzVPEj4HFg+WIosUs6sF+eGIn7+7zRZKhq917WPIQM2WlZq61fAECw=@vger.kernel.org
X-Gm-Message-State: AFuF++mTJxNSISA0zibqXdZm29rw3Ga+Ejf7yuk6Dod02MJkhEehAtfq
	ZaS8npSXOgz0z5Yfv/Qkdc9XwRCq3fjB/ZC4Y/W4v781dPqKdFFxaVs92IKacc2+nsB3BXhD2b7
	9gluFXx1O8gQ8AmYiep6phFxHSO0KbjnMe1L+jYGQKV/tXnK6q6sfPsQ6ek/2aAnoHw==
X-Gm-Gg: AYBFou01NCdb3iN4HsJ6J81xpWAvC6pffR09AOL/lN+G1gDdkxoDY1CFzU42+Q/15Yr
	k0FnxBB0D8+Hltd6YbWoxIGYVi7DEYdLgWdU0YoYmVpNBu/YNg1WQWfOQtle60zH1/BYb8g9LW1
	XuT0SUMTGCfQ/A9JMq8tl5/xJU/h+bhEn5r9l5Pf0y8mf+UnVANmGk8nntry6Y+x+ufB6vAAXyg
	5ZAL5/u54jb8TN6nNBx7rhM/iGbQ5rbeSGYSCebCcH8WgDQWnu1uLm6wSIOmxEgVi3zDp466ojF
	EtYZTR1uTMivh4h3ebJy+xtDxmCyb6uf8QKREFr8+GjJTV9r+wzSC9OIOubwsN08KXi1rNO7
X-Received: by 2002:a05:6102:1628:b0:79b:f57e:ea17 with SMTP id ada2fe7eead31-7a201fa284dmr272262137.3.1789593183961;
        Wed, 16 Sep 2026 14:13:03 -0700 (PDT)
X-Received: by 2002:a05:6102:1628:b0:79b:f57e:ea17 with SMTP id ada2fe7eead31-7a201fa284dmr272241137.3.1789593183541;
        Wed, 16 Sep 2026 14:13:03 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7a1e384dc10sm1123769137.11.2026.09.16.14.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 14:13:02 -0700 (PDT)
Message-ID: <b143ac7a1a911146f3569b934a8da54734610728.camel@redhat.com>
Subject: Re: [PATCH v3 1/5] drm/nouveau/gsp/r535: Add support for
 INTERNAL_GCX_ENTRY_PREREQUISITE
From: lyude@redhat.com
To: David Airlie <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Timur Tabi <ttabi@nvidia.com>, Mohamed Ahmed	
 <mohamedahmedegypt2001@gmail.com>, Andy Shevchenko	
 <andriy.shevchenko@linux.intel.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Kees Cook <kees@kernel.org>, Simona
 Vetter	 <simona@ffwll.ch>, David Airlie <airlied@gmail.com>, Thomas
 Zimmermann	 <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 Hongling Zeng	 <zenghongling@kylinos.cn>, Mel Henning
 <mhenning@darkrefraction.com>, Danilo Krummrich <dakr@kernel.org>
Date: Wed, 16 Sep 2026 17:13:01 -0400
In-Reply-To: <CAMwc25rP6u9=0PxN_OpYUs33cNqoiYYEFpwN4FKPQyHvNb+=Cg@mail.gmail.com>
References: <20260916001603.22394-1-lyude@redhat.com>
	 <20260916001603.22394-2-lyude@redhat.com>
	 <CAMwc25rP6u9=0PxN_OpYUs33cNqoiYYEFpwN4FKPQyHvNb+=Cg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0



On Wed, 2026-09-16 at 10:42 +1000, David Airlie wrote:
> > +typedef struct NV2080_CTRL_INTERNAL_GCX_ENTRY_PREREQUISITE_PARAMS
> > {
> > +=C2=A0=C2=A0=C2=A0 NvBool bIsGC6Satisfied;
> > +=C2=A0=C2=A0=C2=A0 NvBool bIsGCOFFSatisfied;
> > +} NV2080_CTRL_INTERNAL_GCX_ENTRY_PREREQUISITE_PARAMS;
>=20
> Have you confirmed this struct didn't change in r570,
>=20
> Thanks,

It would appear I have made a mistake - this struct isn't even in r535,
which I could have sworn I explicitly checked. Glad I double checked
before responding, thanks for noticing this :)

