Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F8C343D63
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789829164; cv=none; b=HktNwfwX4AdBDmSnV1TBuTTWQ6XgsAnmAcRd+4KlO/iy+WyQI+RN6k/Zn6OnmOUA7LMIJwU6xUEsg4Fyss0ovQ8hwmpSBrh9ZFc/+AjVwp41daGAujLfvP1U1PtC+V0u9kpOPVvzRsz7eUUHAMKwGbYtaIgniYS+radlW+rBvQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789829164; c=relaxed/simple;
	bh=xkgfgdpk+/vsK5QSucIqCE/yvWybMftePUw2mMAbAWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Anz1zP41paGQ7Vii3tO06ikpKJnbpmQ5yN39rEzegr46oxQzzQ4ph3bAnkQSl6hh1i7fCwup+BTSNGoMtVvM1FYuwp4eWX/B06r9FPoUYQza4s2HTjdRHqx3GcdLQWt+BRe/vqEdxzjH/rxLWvB2o0BaEYEy/cvLtE4PTXvegSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=BUCIWhrJ; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="BUCIWhrJ"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d3931so12131855e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 07:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789829160; x=1790433960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1UcMBG13q7TO7qzdipxuscmR1WJ+KOa+mjW/lgeob0U=;
        b=BUCIWhrJ1w1xov/GjTgiuf8w/bpZz0MKFo9Ja/ZFFiKzYhxPwmU7eWfUuI37GLzGPN
         K9otEuOMywtu3JTWiTHrwCH74TmQzNVrhN4VaUJsAcwsMAr6lcAtv7XEw3zx2u2XtnpJ
         x/+BuvzI0a/cVUF4RYde/v9lzIxOcWDtnEePf066pBtvhuUEza50QZvfLHc75x8jiR/V
         mcL7wjZRI5WKDQPO9mxtLKDRhneMWofVoP+IF5a9Smdv53LtbE54+J0QLqM+dKmBai/G
         pM718hLM8P1561jjZVrQNDFofGzJggVFAGZwYAW095EIt0oyLaK4Aq/hQrgOSo3q1f2U
         jJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789829160; x=1790433960;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1UcMBG13q7TO7qzdipxuscmR1WJ+KOa+mjW/lgeob0U=;
        b=xIjLecak4ZR4sYz/5y6zWgPJy/HaHuzFMtSPLTHzY1l8QCZmcx2XpzzVj74sTWmMJ9
         Bx2hbFoo7NjiWE3JJhUPf7/7khfMEUCblu3OWlzRbHGLXi5SN9teNsKnfX0TpeRN/KVW
         PJqA12y2Nk78HvKdQSkrvVauVMekL1Asi7LzO8FsUJF/nXH25dTfw+9wIG/P0UvPQym/
         ajv601qmShVl6cA0hzEmiOSOuzpo209FT/0SNhF92HKWAlQZVA3sDwW9nWkUbzU6zSbG
         g+ZL5+rXuY0W6uwf7Lyl5KasHT7ROZh9kmDdVuNK/Io63t6bdEM5BjE3JTJW8lEhStX3
         cCtA==
X-Forwarded-Encrypted: i=1; AKwUvBzm9u+rcsWoSkyrb9THINJQdbJ/9E2M39Fu0sf0AgJv6vCY0BSkcIQa5Qz2DAr48B9KJ7A0G9SwNsRU9m0=@vger.kernel.org
X-Gm-Message-State: AFuF++nPgTbXkGonqqxAjudE7lX4BhA5GAnLSKCw326e2nFcJivEiP5t
	fFUDnoI38Iw/EG+y+7yr6v6q4/hg2LZrANWH9DKjEHr8GR7McqmcFT37YII65X9rPIo=
X-Gm-Gg: AYBFou1a6vflpcmaY2oucsJaFekwG0xVYAh5KSZy1+jBoej+5y2WpwoeI/YizMbTetG
	Fyua629KWEXMQFW9d6O0FPlU66s8uvzwSKB9c35nFx0cRBaOxAly3/xCIOUpnGsu43GQdkV/bPK
	WE7YzSrQ2dTz3grsuEhtrbeYJGO/a99pwZ4j2M4oIlEHP4eYqCn2iO9d9qVgf0biofxi5M9p87F
	NCsp7V1Q8DsEpxBkcoICcsJ0Kbqt2VF5fytIxdjR2WwbjCfl8Dfnv0Unfcip+Dm8RLlDkzUFI1P
	269OqJo6ePmQMQdEVC8TaIqjTUCp26e6nibmwFqowgUqJNwDVV9ZELVye9niv8ivPDH9ySN8fLZ
	MqjTfXY5i3NLZHU6+NZUSljOe6QfMkBfMbSvvESXFSiN6UQt2FJtykvZB6hrZzJ5xs6563EGsjr
	nEZto6m7B5aF5UqxKVcIVarxCEvzSD+Bo6ksFmppcIZPUMRr1/9YZzlsH2AN0lOw4gw5COBLxAw
	MX65nwJyE/n76VC1zNuhdp/9+VdKyFwBqX9uOalYpmW2IvZv5ppT9VY
X-Received: by 2002:a05:600c:1f8f:b0:49e:8354:26fb with SMTP id 5b1f17b1804b1-49fc574c729mr81926275e9.32.1789829160140;
        Sat, 19 Sep 2026 07:46:00 -0700 (PDT)
Received: from ?IPV6:2a02:2f05:1204:e000:2cf7:c250:64a9:ae77? ([2a02:2f05:1204:e000:2cf7:c250:64a9:ae77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724589c02sm6931200f8f.24.2026.09.19.07.45.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 07:45:58 -0700 (PDT)
Message-ID: <77b1f993-141d-4d85-aaeb-0ff48d379f7e@tuxon.dev>
Date: Sat, 19 Sep 2026 17:45:57 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: at91: Replace __ASSEMBLY__ with __ASSEMBLER__
To: Thomas Huth <thuth@redhat.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260821083645.200344-1-thuth@redhat.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260821083645.200344-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/21/26 11:36, Thomas Huth wrote:
> While the GCC and Clang compilers already define __ASSEMBLER__ auto-
> matically when compiling assembly code, __ASSEMBLY__ is a macro that
> only gets defined by the Makefiles in the kernel. This can be very
> confusing when switching between userspace and kernelspace coding, or
> when dealing with uapi headers that rather should use __ASSEMBLER__
> instead. Let's standardize now on the __ASSEMBLER__ macro to avoid
> this confusion.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
