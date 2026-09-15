Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A1F3C2B95
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789479670; cv=none; b=dhCf05K9JAKngmqRW0By/Py5x7QGtJfsOfeoGybl02mmBqW2yI9+v1d24xZz9X2yXib/cBvSICGGZNDhuwIM3b0peczo+KQV8A61zVn5WGoX1qlqjj24KteiDjhJaJQ/ftkvFtlCVRj4qtSNpAHH5U+0ueci6QR5g9TEISSKa+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789479670; c=relaxed/simple;
	bh=B5rz/HvywjwIe0LUBJ1IJyXaj9n79ASijN34ANZfpEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRezKH27TKud+N1+x/+kqpN4PDngY7ABh4btNgbKRG+qNInHtb7k+y9lFyploLDvZQ7GtnSdh08OAJJBAJvK12gjIqcTCmPTmTgBALXGDRH9uZTTLgjagvZIS75iYC38tNZDble5DkWpSZbc/CZMK2ZQTW/4Wf04Jvu4UQRA2/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rPIdmwnb; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rPIdmwnb"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff2b84fdso2935975ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789479667; x=1790084467; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s2vjAIuglDzNtvLvUN1SnWxls+9kNR302LnOw/HxEJQ=;
        b=rPIdmwnbS/JISWDC99dOEGKcKTbgboHy8Nop+C2aqxiH4N0PQXyJkpIq173379jvFj
         8zDXsglYUIb93lcYgM+GpK7RbQl1nneLQiz1rGeEtJJRbsYCExVCRK8aLoYy1peKxzHb
         sCybGoYw6AYQXjPbLPl/HUrWYdVRmH2hYhkD2Y4ldqI6IbSLW/FdenD8N1I5yshrMkmp
         ZgIemKMXJYqE8+uTlqJMlqyOncAJsBRA2JProfPLyYn5MHgYM5BaJvBAKNcctfTmYgM3
         HQaqhsgWYiNvxohlc9dToBtyOtRccziAvdR2U4Glo6WNCbmjwBe3XfBeNwR9kl6NQsIX
         hgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789479667; x=1790084467;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s2vjAIuglDzNtvLvUN1SnWxls+9kNR302LnOw/HxEJQ=;
        b=PmU/An0eFaXYOiNebOde1RPiRoTtU18FfCkoTWv/rnuBAAG23wrIK54rP7dYQL+wa5
         xzQ/E/5FnIQUHW8kfk6QC1h6JUyJBl8yQLf9P5uu7QAk9h3KVkh52GZnGsd/Tn0tuKax
         TKKMRfZirV7gsvwh2aP4sO6Ix4ylz0SXSbDEqqQKAt7PEYHNufgio4i+i/KKsT0yKk+9
         V3q0yVb/nCEqjOhVk13t7NfVkTeKSfXQTjSzsNGsd+33ixV17N0T/rk+M7Hu2Za7j+N6
         CqR4JlKBchAfOVfzIIbidaOzrkRy1BUsi7D0aSTK7gEVEQbm0V4dz5iQSziryXZiqoui
         GwUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzytMUKiV16YAsBOaqDk5VNlqpUutzFvXd+XX4JFpay74YsgaIfm5XL0ascvbmqYMlEvYRw30O58aw0Sxo=@vger.kernel.org
X-Gm-Message-State: AFuF++ncPu/otg70DEpSV7SyE+yCTMIlqcEmBMJJ+8vW78novABEmZwz
	oIEf6QIXagvMOk707xHy7X5CwV5i8j8fgQ+x8gjVZCDJuBqjVitLxbUA
X-Gm-Gg: AYBFou2ijo+vUXQdz8Ao86ZMYN6bRvQNcQcZRJ7Wn7ff0werPRAPpZ9uXe2NjW5FkT5
	kCVRIZh/1HsyjYPh80tyQ2zs9U++BieN9m8OhLeZrraLjkrWto8onKYzyWlnO2Mq8B7Fh5SdyN5
	hjHhwo9zzsMlgLpBiwYLvZFShMBOacggp4FvWh18ckgs5gEVJcvd7pY3sA+TTyDwEvgZqe7Uyrz
	xpAGpkZ99eoqBa97bSSmG99khPpEQQVscYK23JNOCN5jNdSyGBEYbtY7rxtFslAHbF8Kfl5LbsJ
	Rto6+tmpmrX3lcWHGwgdkLXwGzcPA7H8dT0HZzqSgJWVzJm0XgyWu311luuHrl6ZayAoZIGfgEx
	vorpilcekuRZKAB8dy3y4RT+9lLXg//OLc/bpbcD44Gw+KLTzXUjBlTuukbaINAL+VVoW9NNZyA
	7eK017gs+IE2jREHLQF4qmlmnIZWsCaRSps7EEICe7LlzlJWztlrpGs1s5ygGB6HKru4MX3A==
X-Received: by 2002:a17:902:8642:b0:2dd:7671:3101 with SMTP id d9443c01a7336-2dd76713155mr39390835ad.3.1789479667073;
        Tue, 15 Sep 2026 06:41:07 -0700 (PDT)
Received: from elitemini ([2400:4050:d860:9700:75bf:9e2e:8ac9:3001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfce707sm68398605ad.55.2026.09.15.06.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:41:06 -0700 (PDT)
Date: Tue, 15 Sep 2026 22:41:01 +0900
From: Masaharu Noguchi <nogunix@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Chen Miao <chenmiao.ku@gmail.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2] docs: sphinx-pre-install: warn about unsupported
 Docutils versions
Message-ID: <aqlKnXHFVqO6baEW@elitemini>
References: <20260914-docs-sphinx-pre-install-docutils-v2-1-6a2a6deedd19@gmail.com>
 <b5df5eee-661e-4f46-9abf-1bd9cec8069d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5df5eee-661e-4f46-9abf-1bd9cec8069d@gmail.com>

Hi Akira,

On Tue, 15 Sep 2026 16:52:03 +0900, Akira Yokosawa wrote:
> I think this can annoy people who only care HTML docs.
>
> Why not do this check after the PDF doc builds have actually failed.
>
> That is what sphinx-build-wrapper is doing with LatexFontChecker().check()
> (see line 557 of tools/docs/sphinx-build-wrapper)

You are right, and that is a better place for it.  v3 follows it: the
check moves into tools/lib/python/kdoc/docutils_version.py, shaped like
latex_fonts.py, and sphinx-build-wrapper calls it from the same two
build_failed branches, next to LatexFontChecker.  sphinx-pre-install is
left untouched.

Measured on a broken pair: htmldocs now prints nothing new and still
exits 0, and the message appears only when pdfdocs has actually failed,
just above the error.  A working pair stays quiet in both.

Thank you for pointing at Ubuntu 26.04 LTS; that turned out to be the
strongest case for having this at all, so I checked it.  It has Sphinx
8.2.3 with Docutils 0.22.4, and its python3-sphinx depends on
"python3-docutils (>= 0.20)" with no upper bound at all, where Fedora 44
arrives at the same pair by patching the "<0.22" that Sphinx declares.
Both fail the same way here:

	              core-api            admin-guide
	---------------------------------------------------------
	Ubuntu 26.04  FAILS 26x Dim       FAILS capacity, 13 p
	Fedora 44     FAILS 26x Dim       FAILS capacity, 13 p

An LTS makes this a good deal less transient than Fedora 44 alone.

v3 follows shortly.

Thanks,
Masaharu
