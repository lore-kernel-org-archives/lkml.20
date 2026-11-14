Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794632542;
	b=XejQcUN3q6jQXkHedtHYfDk8UW/4FAD/yyDmtbJqr8hSG+iacivC0/z2cceO72J73hJx
	 5njCCHjNNDRY+mc4+aE+KVDyFumFlk86jBRk9wUs8/bFAJYkFs00u/CrNaOUa11osXoO9
	 J7SZgtweoGJ2CkSiq/CoqUqHVtVZYp9NQ6fkUyQT0e8QeZEgqaqtA5ZQXal8JZd+mS9hB
	 rEe6fP276NxoMWaiZwlt7Ur6f9HAjS3p7hVuq+sNnr2gHt2qj+KU77/Mxn0j9dsynaqqk
	 arHKMJf3VP/ywQrNlsMTIQLsQnI6Sb9fMcewbxDStKDW291jSdVfVq1hRVgmlZhPI4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794632542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=lwHO5y1yVOzdcwLx30M+MdDMtIY8PDavuYBpBXrs2UA=;
	b=JtUzFwi9ViKbm+sv8xxfeGQIzlr1yWrmY49KwPY/cwq/6645MlLlbbGlYk5j7RPUS1hj
	 u1JBFX/TCH1W+ITF0QSI7DC0Zfcy18N5xMfDTX6e5rCtZnK8vL8qw8weOIFgFBiMWlKdS
	 uX5KJ+xturm5mj0uWd8dpmGoBYeppAyJyLz9c3vU5z8MFQidVGxwFqbzUoK8W6CgNwhhE
	 FuWHUPmslTuEFePTq3F2uEVtnGrY5Kpa2BRxAgOtXck0Lknkm3myr3YhrD/Jv5NsKQJWw
	 wQKnXtnfMWXVOaA+cnCo3B7cCBzZnsADHMDu0HAEeh6fYjVD/RVH6nffniZIjQp+9dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SIL0kjed;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BDC606A33E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7BDC606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SIL0kjed
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so17222105e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794632540; x=1795237340; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lwHO5y1yVOzdcwLx30M+MdDMtIY8PDavuYBpBXrs2UA=;
        b=SIL0kjedRyOhwfPj0E1KHIlC4MOYA0Dsr51SB0032DPNZkwGA4uZ/IP6I3l2LJmI2j
         vtQblBdFm6iFZVTvaMrtUcHdz1Ng4mCjg4DED7lwIgGaZyKEU0YbXt09SUlT+cjQVv8e
         Yw686nkiCrHiyTJhB8FkkuOmI5hx3RJMvGZapzr8n6KRoDdI4IUKjz5AWxC6FotvzMyH
         205vtJJ8Cl0Rm5FDr/DqH/NOyAL0Onhsy2zsGrQNXKOvRnFfZMIghXH32VPjgc6/yF1U
         +Lgl5x6ZngdPxh7nij3AsBS40LXowLjQuN1XNf9SM0DGicoRDyEnjVMpfrUVklDkyJ5S
         ibgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794632540; x=1795237340;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lwHO5y1yVOzdcwLx30M+MdDMtIY8PDavuYBpBXrs2UA=;
        b=ntvXFXB4XmG7RdJ7vv2LWRuI2XKjkC7NiTvmYgCsN5F7FUUyOV5sWpeiWJ+LyIim+O
         hRZvjhgYMxA0KoamWooyvEtDVG3gTt4M1g6Xf8k8qNfuLOj1kpTWSwqKV5915mkqjhls
         JsTx6JZVKKhNWPGaaJSofBm0k5+xlWYEIYaqkdBnmy3CCb6bWYl2sL8ouhfa+rTeW4pU
         vDYTD0dE8rFr/d6ePyxNaihb/OoOuaKeswEnbAN9/0AEMYhF31/QIM3BB6Y6lscpoZwB
         teCENJObwY67ZY7HQvzrgoRPnEdwCwY4ZKe8jjd1b0Z8gfU+VdaDi/wMUx+SVMwjM+vs
         ovAA==
X-Forwarded-Encrypted: i=1; AL+hErFVkJIiq9thZv34LJfNG60R9Z6/WwX+zDEn3m7QnLYkG2SBKKQhBlq01pRFPuWEBHiiLv60SSrUlehX/Lg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8zizLm3YGYY2PKzlJoZosb/xNEsmD4btwfTFJuUf0dXYznamS
	wlMuQyit7jxzgVcdAWptsXMt32wr/q+MJpcpYm0ZHTc+CagtHKlewg8/
X-Gm-Gg: AYBFou0l1vUagjS/G12DKh33gHyX4BfsNgmQ9rXuo49DfZNybJwdmrWsAXQ8dNby/oN
	ZcaxCSAJQWK0IuE7nomwC72cMOqNk9YVXXtv+CTfC7xHrTV7OOP8GndIPzpqa0oye6tjJgvIp1Q
	sRKrPMF7Y7vJ/d4qqYjGCeqLZ+p6euZwgBBTqo40S3SQ1fYLHL9O10r3g41IdugGv4EbPUgdBE0
	fpxmPfEFJKP3DtuCHxgcSd/ASdrqXGu4L5BEyak/4FlxhEASCtdJqxjxNP6AmgeaYcg2o6rAqQf
	28bkP6Dno96cST5uNqLNC1Ve4YaIXD+Waq4XZY/2J7b8Cmeubq4489PAY8stKtAwhjEpdfQIk1z
	ckn2/W64/ddfS+6fJLHA6/NWtKFfltMYs71r/nCLAqjcqy0jAh0LV9C4FkPS+VJsLvjuAYeMhLa
	qtSdby94F/NJhS5GjCfjtrEGNPQ+8T4xK+/TYa8ANQoALT6VPNDxKP4vgpEd04pCak1S6Q1RwMg
	MPEHF1cIdSgYv9wj/EjCWFZUbk9LnOR2dpdufd4EoH62hcHNOjxirTID9orpWHXxBUjPj6HjROE
	K0wegEOFL12sHfW0fL87qW5a2OTOarzlczOkpNUasqO16WGHC4tyvFE/BaNwn14G3M7vKCs0HPr
	oseUkx0ob6HQvcA5lDbrbEZPB/SwtCArTfR6q9+xpJbYhmiiReDM0fr6d3BNDTqsDb+k=
X-Received: by 2002:a05:600c:8903:b0:4a2:1104:7ca7 with SMTP id 5b1f17b1804b1-4bb4e2e9c80mr157513265e9.11.1794632540081;
        Fri, 13 Nov 2026 21:02:20 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d22394esm9298512f8f.3.2026.11.13.21.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 21:02:19 -0800 (PST)
Date: Sat, 14 Nov 2026 08:02:15 +0300
From: Dan Carpenter <error27@gmail.com>
To: Rishiraj Rajgor <rishirajrajgor@gmail.com>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio_manager: add newline to
 sysfs_emit formats
Message-ID: <avfrV0bQO3nvDkbH@stanley.mountain>
References: <20261113130324.34353-1-rishirajrajgor@gmail.com>
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
In-Reply-To: <20261113130324.34353-1-rishirajrajgor@gmail.com>

On Fri, Nov 13, 2026 at 06:33:24PM +0530, Rishiraj Rajgor wrote:
> According to sysfs guidelines and checkpatch SYSFS_EMIT rule, sysfs
> show functions should terminate outputs with a newline. The show
> functions in audio_manager_module.c omit the newline character from
> their sysfs_emit() format strings.
> 
> Add a terminating newline to all sysfs_emit() format strings in
> gb_audio_module_*_show() functions.
> 
> Signed-off-by: Rishiraj Rajgor <rishirajrajgor@gmail.com>
> ---

No, see the mail archives for why.

regards,
dan carpenter

