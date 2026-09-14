Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CBD378838
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789361781; cv=none; b=ewLTtgyTc3pVme93mdtGin2joOIVgodM0Gfi9GC9trGSW+Rlxc4lbba/YIJMTLcqtYIrPI8lu9ILAB3DU8DICHmBNpf88OHTy8nT2i7Fj8Qh1oReJz6kBXzgLZYC5FMwFFJBMIxS2yHluVbZJ63G5cbZS92lWg7rcVdxhI0TGwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789361781; c=relaxed/simple;
	bh=O5WelON0JzWT56tRHoEHUuYtivqLrByhNTcT26MlpDk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=NySQQtyd7/q61VRtAW3sYgCJCi+OO4Od/D5/zySOTvFE1wgUyFiycGiBKXt8nRCjxTUo8WcEDZzH0+Hvpa4urJrzvCl68uY3dwDU4FVKGhc+5cfDhwjEn2sNrbS61wqKSKaliI2DMes4xqHb0f0Ym1xjw/wzaJEr+YpLZr4swSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CNQ4ZFxL; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CNQ4ZFxL"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbedf433a99so3168289a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789361779; x=1789966579; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=km/TqSCTfzLqarwQbGGqhjbHOtRBeDdNGNhH+O/Vwc0=;
        b=CNQ4ZFxLdP9hDT8u7BCKpojmpNl+iDowxHI1hKhVxGETPo+EKls12jIZ+ZB2SAF2z5
         zGvGH/5ZAjMwYmsSyYDi1jXLdbnqDjMRUJKJ7nrhhFW1UwV4mFbWDTraOmJgDElQMziW
         hmQRQnGECfte5DmDf5iamQsJfhAKcbjY7piKXiRXRJ+zQLMNs1/GA2lLLoP+B1kGVBdk
         643DLCDeC48PxcT9RTf3HOCEQwiR/NhnF7WUmFlSqqWgcX/ygE/U0xgzlD8fBdljYRk6
         msJ9w3SKpeP3u4kevKuoyBDbdBMaDxp+BSWFOD7PRTbXJC3RAX70H/cyjIghL3ePbPJy
         glMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789361779; x=1789966579;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=km/TqSCTfzLqarwQbGGqhjbHOtRBeDdNGNhH+O/Vwc0=;
        b=IDP0F1XChkXDWMdmRwwLDeSyg8vbJqnwUG47ZCSScbo4vyUk6Lr5Mi5oFypX98vhM+
         mWtaWc/dWQZ8/iD3FU8xGsjMyBv8s9sbnHF4MzDf+5VHYa5YXfDxt1eKyh4MhACZD6x1
         KXe/iIYtbQFt6F8hMWgcjqEkwbW5jbkbENttupIh2BCMomx7v7AUXqNCNG/CFzeCqDm2
         vv8+oGLb5GV+dqmX8rdVvLn34SfW0wGbF3b1yl7raexb4W4/QEXZyOv9X+HSLZSFYHK8
         Pob2yB9f/UuRnsIvL9eo8md/JWVHRVtgX79QfTnrp9TKhys+bPy2Ji0p0BG0tY1cwOgH
         sP/w==
X-Forwarded-Encrypted: i=1; AKwUvBxx1UCjh8mN2sufBODHMRonRj5lR8LE5htR5GSWrv2Gb4Zi84cYyxDf0Dpu6ggdNP2K+b6e/ywSlHz2764=@vger.kernel.org
X-Gm-Message-State: AFuF++ltXMrw5TWVUF3yAwKQUCqkJiZ61k0K1AtkVh8xsegkMOx4V1PX
	m71kRc4mdKsV2WG2E9et4lMdi3TdGZOsofYONrffbooijycFqhqdxEP/
X-Gm-Gg: AYBFou2ZlRX0fFXTO/nvpKM0pMD4PI1681miGmkxIlGdcuRLoEihssl6X2tvUvOTbMu
	KybhkrqDYELpXitv1nYqdl2mKEbGkP4cKzHQ+m9P6wVDZ/rywb7fKS1qk1Emdz0kImSzpQsTz+L
	lG8QoRerT7ptEKazWBgChsNAV4zKBMeUZHDhOm9UkF7TddKZv6v9b3b5a0HOYQE6tfk7d+mji3U
	DNluOVSedlU724hn3tJCEhWeQtVb/0ri4WS/+7WnABpU7agro9R/XI28+I26gT+y0bqDuGhfbpN
	yCQolxzB43iJN112as1CqP7ekNX//0TKF3D8jQYkLBH7FEPy2jRR62sNIPMS7b/iWKx/MD3jTTl
	Y7qLeTIWm4NDX46NOlu0N9wqSh7yDvFDdjEL05xJYM37YokeBm5ijh6gv+ENpL07CMcHOP/xmtM
	vmCTqh3J6+iCKIlpkL3UhwZohuTTQ0sFZHY1vkU+K97shTfOcFJ/JUj3soaEhSyEHjYLU9ZXHIb
	cfxErtNwd64CSspXxfL0NcVafD/EnV5RYcnmEKfjaEr
X-Received: by 2002:a05:6a21:6f09:b0:3c4:1916:9d40 with SMTP id adf61e73a8af0-3db4051cbbemr1627993637.12.1789361779594;
        Sun, 13 Sep 2026 21:56:19 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c65a8120sm4371704a12.30.2026.09.13.21.56.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 21:56:19 -0700 (PDT)
Message-ID: <53fbb5e6-70c3-49cd-96a3-3477f048eebc@gmail.com>
Date: Mon, 14 Sep 2026 13:56:16 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH] docs: sphinx-pre-install: warn about unsupported Docutils
 versions
To: Masaharu Noguchi <nogunix@gmail.com>
Cc: Chen Miao <chenmiao.ku@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>
References: <20260913-docs-sphinx-pre-install-docutils-v1-1-d923c769af91@gmail.com>
Content-Language: en-US
In-Reply-To: <20260913-docs-sphinx-pre-install-docutils-v1-1-d923c769af91@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On Sun, 13 Sep 2026 12:13:23 +0900, Masaharu Noguchi wrote:
> Sphinx declares the range of Docutils versions it supports, but a
> distribution can relax that upper bound when it wants to ship a newer
> Docutils.  The pair then installs happily, and htmldocs builds without
> a complaint, so nothing looks wrong until pdfdocs is run.
> 
> Fedora 44 ships such a pair: Sphinx 8.2.3 (which declares
> "docutils>=0.20,<0.22") is patched to accept "<0.23" and is installed
> alongside Docutils 0.22.4.  make pdfdocs then fails to produce four of
> its books.

It sounds to me like a packaging issue in Fedora side.

I'd rather ask Fedora's Sphinx maintainer to backport the fix applied
in Sphinx 9.1.0 to their Sphinx 8.2.3.

>            admin-guide runs out of TeX main memory 13 pages in:
> 
>   ! TeX capacity exceeded, sorry [main memory size=6000000].
>   \sphinxafterbreak ->\copy \sphinxcontinuationbox
> 
> while arch, core-api and translations stop on
> 
>   ! Dimension too large.
>   \fb@put@frame ...p \ifdim \dimen@ >\ht \@tempboxa
>   \end{sphinxVerbatim}
> 
> Both come from the large literal blocks those books include whole --
> memory-barriers.txt, devices.txt, kernel-parameters.txt and
> arch/sparc/oradax/dax-hv-api.txt.  Keeping everything else fixed and
> varying only the two versions shows that neither component is at fault
> on its own:
> 
>   sphinx   docutils   core-api   admin-guide
>   ------------------------------------------
>   8.1.3    0.21.2     ok         ok
>   8.2.3    0.21.2     ok         ok
>   8.2.3    0.22.4     FAILS      FAILS
>   9.1.0    0.22.4     ok         ok
> 
> Sphinx gained Docutils 0.22 support in 9.0.0

This is not the case.  It was done in Sphinx 9.1.0.

>                                                and upstream decided not
> to backport it to 8.2.x [1], so this pair will stay broken rather than
> be fixed in a later 8.2 point release.
> 

As this is an transient issue, I don't see much point in bothering it
in a kernel documentation script.  Fedora 45 will come with Sphinx 9.1.0.

Regards, Akira

PS:

I was involved in testing the upstream fix.
  (https://github.com/sphinx-doc/sphinx/issues/3099)

[...]
