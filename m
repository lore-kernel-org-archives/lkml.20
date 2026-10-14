Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB1B51D539
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791996060; cv=none; b=keacP3avsznO/47FhHpZgDdW0pBnu9fTEEnu3y8JwTyfKcQG27WVvzhPFsVlZhv9H325OVzgWlb90jcQSUymXiYwVuuWaLXkBO6sYDaaragyW50b46wGrUC0KyGDsi1u6zxzWhS62pjZjjP9vaQ4CGKwoOWvb9efCOUMsj6kUQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791996060; c=relaxed/simple;
	bh=XfSNuOCiGSFrTrFIJ4lT3my+Lp1JTDESDqQCedNpmtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kzd9lHvH/Qcqx+r7IG135JGI+y1JkUb8lyTT8MoX+pYeYxbaa4MQw5pZXUr0wbX41XDBzBGC8bueiG51vbVst3lGcJGKgF1xUByOP5OCmixpU+5NeLUemD5UKz6/fw2OlXJ1TUUdMfUyZ30hxFBUJzLc35POoY/RXF41Q7ucQ5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cfZ+4BNl; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cfZ+4BNl"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15354aa70e8so3168374c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791996058; x=1792600858; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UgGn+abtiqJOh+LR7c9Lyg9H/TKcLZIpibd1bP5k/sI=;
        b=cfZ+4BNliPTJfJz/rTHdlkbLS8ZEQx/TBdEG7gHRLXVqfKx4VcCufkazsGJZVhvK36
         v+TTMlgK1HvZAfcUgx9Sf6TSdkE1qjZ6DyY6tjSEmVQUez+g1gKobKIk+Xv+FfHXQznW
         1q7NoC6nFjo/4RQL1vrUbJ7GCXC2n3HpSjYqDRaYuKygDpVFhvuMBDbH7Rda+h4+aldE
         vuC2VyT/OpsdRZ9K64UEydQ4c6HPimoJDiAnWMGnA3ROUYyGdE+VtWy1Sro10czFQWV1
         +XT8ob5H7sLfs9vUwWVdNPxMqSa0Wk54+yjax4Py3e2c9SRdAWLPnIXrBsaZR3l+zKx0
         B0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996058; x=1792600858;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UgGn+abtiqJOh+LR7c9Lyg9H/TKcLZIpibd1bP5k/sI=;
        b=eZyxY7HE2fLcj0aUIl5FVFcmABfSAtG6idygYrNs29KothtK9sS8CBBlIDPJEL/5++
         XZTHqf2EA8KYrqBOjIsxGHpAg9ldUDfnRizsmRX3waWIdbEy0lTWanUulQ7d08lRnH0a
         LvgVFbzPVk2zC+2pjP7P7f5C+kEYGr5Befugs+Y6tqFuvC8fSQRdjIhv3oVH9cPRfvaf
         SABPhgMGJHdawRP/8zlCUyqI0aqSiCjQbqcHTvW4dpkjBWbBfsKXX1ViXc4ZkgkR1fwz
         YBSnfuLDKkY7BKQXTPE6KibSLeSz4AGqefuvhIPNb9mybEvxT0XPShzMYnFemZikJ9zI
         DcHQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0eDwo4AGx2q7IQ0my/c6oO4R914tu6QfS1H5Rzs2HCe7u4+jE/FGiVBVxijZOB6iH6CcB0WlSdzhVgkA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdh0PeyTRX2Bl//pH19XHitglzMqVwKsOIgSa/L+VAj2nRBMFj
	O6Tv0j5agTeeaVVH2ZVjyFvqJC8Ed3FNK3Y2Eih43wFPS1vMhXvplAGf
X-Gm-Gg: AYBFou3lAJuUvsRa8ZDEkhl4mpoSQts7b2lhesxmoWKu99jCRokFiuoZfqILMz7BtJi
	Dh0BsjR2UCznmrCMzzgB4xYXdUg2cAiJLnFI/b8kGUdOntPmthedZYUULZd1JeIvGjmoJz+oW8z
	cP731kZoA7Q7qd7BYnPvp98i6vFp/+E+a2r2Qes/ykn7IuO6MPKIWsU3ZDZqBRbQryH077i386C
	1mq3MFCCpranMMDevJjdsOAH07HdlGA3B5L3OBaeFYNJS2YUJnOJPjFowWtziHc4iZMWl2DxDmr
	KOs/jO83iRWyZvtpasHaS7PYN9woxXkLd2gBFMfsxYOX7OxcFw4jcruCeu4P7AER9rEGH52edR9
	B5IWETmKzGV042MzezuSdXBy8yc9n1lQyp04gGQMUUUQSi0AJy+CTdKmqy9egT9ZfgQaYMbw1jK
	Y6thzQ+m3N4sxjB5CgsIzQdJ799JNfh7RPGACRM+GVd7UNSREizJcTbO4X0JYND2qp3w9CdN1pC
	qM=
X-Received: by 2002:a05:701b:42c9:10b0:15c:705f:b981 with SMTP id a92af1059eb24-16a6043c616mr24016690c88.32.1791996058090;
        Wed, 14 Oct 2026 09:40:58 -0700 (PDT)
Received: from user ([2405:201:c052:b00b:a8d1:172d:7ab0:de86])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb68e56sm49903496eec.29.2026.10.14.09.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:40:57 -0700 (PDT)
Date: Wed, 14 Oct 2026 22:10:32 +0530
From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
To: Alex Elder <elder@ieee.org>
Cc: johan@kernel.org, gregkh@linuxfoundation.org, vireshk@kernel.org,
	elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev, gservice341@gmail.com
Subject: Re: [PATCH v2] staging: greybus: replace PTR_ERR() with %pe in error
 messages
Message-ID: <as-wgGhJAGgYBZ7-@user>
References: <20261013022402.6322-1-pavankumaryalagada@gmail.com>
 <2fd23f9b-7eab-4afd-aa77-93a5b9ff0c75@ieee.org>
 <as6mC7sZnpqIKxN6@user>
 <26a2a4af-5d27-4bd5-b284-3758fa7a67b2@ieee.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26a2a4af-5d27-4bd5-b284-3758fa7a67b2@ieee.org>

On Wed, Oct 14, 2026 at 08:32:54AM -0500, Alex Elder wrote:
> On 10/13/26 4:43 PM, Yalagada Pavan Kumar wrote:
> > > I think your suggested change is a net positive, but
> > > doing it in some spots but not others means it is
> > > adding a bit of inconsistency.
> > I agree that similar cases elsewhere in Greybus are worth
> > checking to keep error reporting consistent. I will look
> > at the other Greybus files for cases where using %pe would
> > be appropriate.
> > 
> > Would you prefer me to extend this change to the other
> > relevant Greybus files, or keep this patch focused on
> > fw-core.c and submit a separate patch for the remaining
> > changes?
> 
> I guess I mainly wanted to understand your intent.  I don't
> really mind your proposed change, but I would really prefer
> to have it be part of an overall plan to upgrade all error
> messages this way.

I checked all Greybus source files to identify other places where
%pe could be used.

> 
> Ideally error (and other) messages are done consistently,
> and so changing them in just one file sort of raises a flag
> for me.

I agree that keeping error messages consistent across Greybus.

> 
> Can you survey the messages elsewhere in the Greybus code
> and get a sense of how much work it will be to do this
> comprehensively?  Your current patch affects four spots in
> one source file; how many others would there be?

I found 12 additional cases in arche-apb-ctrl.c and arche-platform.c
where using %pe would be appropriate. I also found one additional
case in uart.c:954 where the error message could be improved by
printing the error name.

I will keep PTR_ERR() calls that are needed to return error codes
unchanged.

> 
> And if updating everything is a task you're willing to do,
> then I think I would prefer you extend this change.

I am willing to make these additional changes. Since my original patch
is already in staging-next, should i send a v3 of the existing patch
or submit a new patch covering all the relevant cases?

Thanks for your guidance.

Pavan

> 
> 					-Alex
