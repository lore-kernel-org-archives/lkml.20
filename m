Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792994548;
	b=rv50M8K4Of1az2OIkRtXQP/PKZcasDNrMTLBbfXJM2x21E0X1Nml92IoFtQeQFifkn9j
	 Bb/e8PtdgVVP34Oyn8dQBYlao04e9MwNw1bdljnWII1nqXki/h2UyUd4aY55eZopoiiyJ
	 dPWE1pI8pHQgy1nOWOEzDih2eoqGhOFBNXDO5SlYcXAC+KoCkYCEuVJdfb4MYULGOXdoI
	 sV28ds0B0McsJQQxMyQ2nyBH0MVyciqLL/Muecv1yneEqz12Jiq3o+3s/kPThyGyxqL/n
	 AbaVwsBDm3Z0i8Dn9FhZrS08gh4e1K2N/q0w1K2NwXoZTitqfdbam+3SDDU9mZGn8sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792994548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3yaOxFuIZbizNooBA1VEmbpRjVSQUGZB/XbbboKN0bg=;
	b=q15112vR69zgZk4JJE9PoWRvloF1NPAJQLnF5FAq0KaBqzpZdjRCR3vBPH+XMap35MpC
	 YItVvu2b8TAVTqStYAbSs+Hd5B8Kz9lGdh/wPWEyZ2uvSmd5f0wRp4C6rlqQ7K7DG1+ZH
	 +DYTecaOQVaW3Rls6D3GMIYAPWsi2MOxuTZLJUTWvLAmEP4sBbdIPEtFsZeIf2iqHOdH5
	 5UM+szSL37uVWyM/4QYOtf0VduwNmoHM7lIA3ja7y7YSqyi3Lvw2Susnmpby0TcwLRV2L
	 2Fiz9i/hnas1jKvii7Ei+24TH633ACk3VbLjhiLIG7DYS3ZpRE07lzzUg9gLewe6HUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="ei/iLWIL";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5B1606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C5B1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ei/iLWIL
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so6662735e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 23:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792994546; x=1793599346; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3yaOxFuIZbizNooBA1VEmbpRjVSQUGZB/XbbboKN0bg=;
        b=ei/iLWIL/PrmmLeI4AIopw+UGzJlXl2GkCswSr7yE1+sdiV54f7cirKsZ0wqwONmMd
         uIWd6QxYO8q4/rZC1RSQIFx9fSQtabC2IaLbx5fnZTFR6tZCED3eiulwX0M0JytW9dm2
         Gr6IP8B90nNHmXqBM64QC1czF4sZ8NDBsJNMw7Jwm+8W3MVOwRHeV1mJ7HdxVN4l5oVJ
         6yIDwK9INWCTEfOFakAWyzJf6SWFXhjnet2AAdN0EuhUw7s/9NaD8/Zdv7B/yiWaU1TM
         HOFQCWPXI92Tu0a/43IEkPgwf3ZU1vHLq6diLy9+BdM3VEz+z2/ni8NK6/M20HgAjL47
         sRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792994546; x=1793599346;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3yaOxFuIZbizNooBA1VEmbpRjVSQUGZB/XbbboKN0bg=;
        b=FlzzpHSaByaGb+9S27s0uNXxJcy1XbwbZnj9Nszc1MsLFJ+dYVM9DZQlOM4pbA7MSq
         5EfqXbCX5hntAj820yod8D5z0A/leZl6Gn4YVPDRR4Y/peCxUpZ0p/pQRfNsc1PE5zFo
         CY1/ri8/pyk2ilnS6r6izYSzfz+k1iRnQn1p7hsnHThd5k503H2A5O610GtKNJXA2Li6
         jx29ifvYS7oQoM5lqiCvcb2ucrIBif1CGHNBqI3uVgngbaUkmCSTnZsdiwpEvz1CCh1H
         zFXqIt/Te+EbAo6P1ded+YETot2RupOzH/RABaDTMbxv2ZKWZSX5TMWmrkOZTdDkkAe0
         Nv5g==
X-Forwarded-Encrypted: i=1; AKwUvBz/dWA1jRnrg6QU8GXZXqWyl0avuZBGFVCBpAuBG9x2Z3zv/Yxng2JIkZ1uCynwzzZSKKywHYv2ROEvBtw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6vHP2psOBGcC0y+tOnsOuN7zmFJPn7kocyvjGibC5Hiz5RkX6
	nPB+IvwWUyEpT6C2fdksQ89+mlHjhVjHQgg02gB4L3eW2BeCusLP1TcD
X-Gm-Gg: AYBFou1V0cqm0oA1U4OejmZbx2dpbD5FmcYyKop+mNIlqJRc/9dFAcRHnmagvz8MgZY
	kYc7hHUTeOijhZG80O0lfRbEscW1KoJZaRAeaXwf4IaClT5U3cepDum+yhtxaF6UxKUD6wY3NbC
	x4pQgDh1PZIk1qCFWdwxRehv1Yr/cSis+Tk0FHnqZtyPPIQvWTQaY37xXgavowx895K1v2WVbGr
	ZAEXzpOxTagS0vh8nx3curKuTk1b4kXlOb8USIVgxR0brMGCOBV5l4JXqCW248fMPmy5rA775Js
	l2zDsRZGGFycyotCq4nPW1D4ZHNXX3hC/4XIlaJOc64E69LTxPcvKsEeVNAEg0ZkgySfr/riWY8
	5fcG5N5o5XlM1hK0IBABTiPhMExYbkc3ptZYIiimmvWyVx6U4tC+TJKtIpiwo6eYWosDqBVp4u8
	o7g2q8c6vt6EJHhynaQMXaU50Ya63pVhIZFo9px+9O+kjzAfC77Borl8LBgYZeniHgVDrxvDxaH
	1n/PBG+hmPbISw3tiGpr3YWiAfFX9LFKl1OMMDjB6F3vyFdoBfa
X-Received: by 2002:a05:600c:4e8b:b0:4a2:180a:3417 with SMTP id 5b1f17b1804b1-4a35ad01256mr111335215e9.1.1792994545819;
        Sun, 25 Oct 2026 23:02:25 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm454920995e9.1.2026.10.25.23.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 23:02:25 -0700 (PDT)
Date: Mon, 26 Oct 2026 09:02:21 +0300
From: Dan Carpenter <error27@gmail.com>
To: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: fbtft: Fix line length warning
Message-ID: <at7s7We7bxdmmmSM@stanley.mountain>
References: <20261025164003.143864-1-himanshu.bakshi478@gmail.com>
 <at7pu4hldDTgZtXy@stanley.mountain>
 <CAGLmz9JaXM8s4BHQ2Cn5QQdBZpzDXmHyb-GQ_jXtj4Rz6SJOJQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGLmz9JaXM8s4BHQ2Cn5QQdBZpzDXmHyb-GQ_jXtj4Rz6SJOJQ@mail.gmail.com>

On Mon, Oct 26, 2026 at 11:23:21AM +0530, Himanshu Bakshi wrote:
> Hi Dan and Andy,
> 
> I have sent over the comment on the v1 message chain and
> also sent over the revised patch separately as v2, I will be glad
> if you will go through it.

The subject here says we are already discussing v2 so I'm confused.
You can go through my response and decide what still applies I guess...

regards,
dan carpenter

