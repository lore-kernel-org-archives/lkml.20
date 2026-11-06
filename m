Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.231.200
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793926981;
	b=2Cd2dJWCk6hx5US9sye4xDe74XZ6WP+61QDFqWfxca/esXfYPLqCb1bLoG6pXJ2+eqdP
	 NIj6EV1TN2/B2cxBP7FBooB9u8FTTTjYwgAixs4efiAc7z7AtKMpdGq6D2KbuV0hePgbM
	 /h8xNFkVrMgSP9P22Pk8PQmyng3lzAup++ZURG0UlUy70tjFGWD6njZGCrwJBcZ2wKsr4
	 mc3gcab6m1GGhXmApuYyobi5vWdRp7fHQCXRsDBXTTp0rSLZBlHIIp/SsUtN4kWoptSTg
	 eD5iyJi8Z0ApKYff/r6HmtxaH9K0SLHm7IpcD67ofv+qOHorj2ucHiIrdFS7VzUF0JQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793926981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Y0u4IXihur+VBeVt1te8fOm9nT/EPcQisrR3rXoEPKw=;
	b=nJe5/UzFWr+E+A+06MbXm+Yi6GPcvZw74SXXOfkq4Aoa69uEBaq1Iyew+R5dzvM4LP0o
	 mhs151iThWuvSEwxw8oVmukMU02zHjtTYWGibspI+DfDZMWZNQw/xeY8Xv9JtCoxsUGY8
	 3iNOmkVXNHPujyre7mIOCaIrH+aELaSJWww6O3/NGm4BCjetKabCHc5sJqx9OHZrwthK+
	 of9Yeo4tKIq5O2EesYUDemAvAVF102dSoxs7QzEPhbeawbg920pRhWVgdPUc5dueQhYg+
	 w65lTCmCbSigwPluGh8pjfmPPXDRKshJKtnshMK9P8rdzLqGXJ1+OpVb1LwDW3y/GiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l1yXf6B+;
	arc=fail smtp.remote-ip=74.125.231.200
Received: from mail-oi2-f8.google.com (mail-oi2-f8.google.com [74.125.231.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08EC606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 01:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D08EC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l1yXf6B+
Received: by mail-oi2-f8.google.com with SMTP id 5614622812f47-53c4858eb76so41525b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 17:03:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793926980; cv=none;
        d=google.com; s=arc-20260327;
        b=W7w/u4Y0yD9gMspB+QaKjsXEM7iUxqqv4WxH620xfSFuoI6BQMvvlSU8e88PFbQoc2
         Gxov6KnQYT9Y6w7TMVr+JuMqC77zPB4qVJ+y19P6CtTNh+GIcDYFUNattotFh4MYQJO8
         Oh5FmUiLKk/vdj9p1htwdNWYSsdQcyMliwrEOUjjSFEcGoJ1dPFyCs09sj15Z8TtBRem
         Bj4A9ao59GoFGUbN4RfRq8KEiWoyJ0jnqkielrgooQMvodwTrLDMwlLZRR83o9a0oQ3c
         NOf3I1LeaoY0x9JfW83gV6fSSjFHhTzezqrHciDKgkmKn0ZbkgxfGEyxUUdcIecNshJy
         noYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Y0u4IXihur+VBeVt1te8fOm9nT/EPcQisrR3rXoEPKw=;
        fh=C9iMNiXmstmUHi8myAiSIiKmQK1VRbxXmcqMq91P884=;
        b=AdRW6ukuvElWBCtaO0NEBFwpzUoqO+8BQNskEesOvSTeuvD9qs3UAnKT9x7AN/5gXm
         wDHifN+m9bh1JRMMz0FB/Lh/WhJk91k/BaZmcVCWd14gDq5GTSL8hT2CvbmmrwK416ii
         AM2qJJHdSeViHrsILwI4xMuFpgtv4UFx0vGUF5d9DPHRkqU8dp5tSCA4nXy4HeAF9aR+
         /2+ZFI5xO9RNIFKzcaTfTXTKupnYPhhgi3u4V+U+sw+/91S0WVU5om+tz5Mc8VHcYRBr
         tor2puBAo3awZxkMUghyzDQd1qqwKpL8wHhHJ4FVvqmIggG4zIotYeRaO26n72DehILw
         NN5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793926980; x=1794531780; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y0u4IXihur+VBeVt1te8fOm9nT/EPcQisrR3rXoEPKw=;
        b=l1yXf6B+BJVkocvHAW+3ubMtTVR1zzGaHTvpopNwPZSww6m6rQb5ZHR5IzxfQE1vwx
         A4GP1blH726DVC1ucFjS9HpRpluTwCpoIKosHMcQlnPwbVlS0IOUB36q0oDR1xTiIbyV
         conH6bULw93qo+4G2TLuNNiHliTfZBdlvS/0v3An/U1gYnd6ieD4pPFrG9OLqbl01e2i
         h89mmK+AgZqxph2sS4OAJ+/oUj2cb3yerLGNZ9wcWMZgvt5J6nDag6yhfYEe1L+7JIe+
         lI9s800eCgaFRewL69/RYqmF2LlQUhl+K8LsagJ8LLUz1ZWzziMJdGxvD2Dw3Ds/7G83
         h5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793926980; x=1794531780;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y0u4IXihur+VBeVt1te8fOm9nT/EPcQisrR3rXoEPKw=;
        b=0HErHb+kIbavU38jqefdY6rzk4iYKjnZFez6ZLO3xU5xulUpnknTd+GvdtZsYRoElK
         3vvNMmxZ79G2GU2WzzEJryrAERmbWjamyT+10AyeITv5Gr8Y2/BJhNzOFi81lD+Vr1W7
         fYYQ6DnZ1GXnCZVGJ7w593HiOYLNrQTR5CFdFmkl4DJ1jBJhTjZXCSOhHkthOe33q2e6
         8sjByVAbSfPTH4BzWDUuicbEqp9TpV/Y88FNwTbYvUJE3TthaOi74d4yhGaZu30jCReH
         HidAEO5psLSb9epnveb3Ajc/uUorgYRvQOc3hvWUeTsavFc2VFdg7AUca9ReGr+Br+kY
         ZdyA==
X-Forwarded-Encrypted: i=1; AKwUvBxTM7spCdRXzngTW1x4WjJhot+BfHPRvrCG/hujAbtMvUGts4lXmYDj8eZ3SYuMq7JYZI7TlnluX19m4vo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cxTZgNlFXRdCsWFCh4Y+NwP2GdxC7taEFKYVsrf38qq4wmnUU
	jankK9FgPI9POTameOjgOYZImlbNrt4uJIt0ubTXLA6Z1JhzLZ8ZF5SQW5fFEtDcQNgeKiBKKPa
	6AK3AvZ0LGmYFZ7/9Z5AJv3Y8/1ZHA1v9THD3WyoNVPHI
X-Gm-Gg: AYBFou3OoVLworekujnHmiExqXfQxIlLvKROQItEGOoiTzptDCA9ff3bb8G5jow7ko/
	nRuqhJLU5ARuNfNYSz4KJMDR11ccyNPla43BvzLOv7Monf9IvvoIc+/+SmWC5hSgQdLwqt70k3u
	D1KWM0SPQZqALGotJulRbSLCNbk8DZ3+baZjgqKP4FHXzJzZYfztYgx6eMFx7yn2eexhVJ7UovR
	bCOFf31xAdQJVpU0iW5j/3/CKVawGzQt1WIO3NKANEwGSaJMjjI4+lmyrZ+7m5rgkuo0rOkigHH
	CkjSMokDFtyOOWAqJAZlhzB8ngjl+1B96MCgBlpgRZz3R397jq/+52QgkrXn8SbgFxQOf0aJVsB
	vqvFVCDIxoeH2bVGHN8RMdTPKHoxmGvDJvzC0ZuN55C54RtJBEalB0wLLA3bc1lEC4rP7FyXDy2
	4Wxow0ifcVnRXMeUwf1ibp5lPxfTrKUF7pwXUGuNGn2QNs2E8iVNXusBztePA84wcLelnVXU7nE
	Q==
X-Received: by 2002:a05:6808:508a:b0:524:867f:641e with SMTP id
 5614622812f47-567e14c90f4mr843803b6e.13.1793926979673; Thu, 05 Nov 2026
 17:02:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101103221.51534-1-dennylin0707@gmail.com>
 <20261101103221.51534-3-dennylin0707@gmail.com> <CAEf4BzaES0KDyhHhk7UguLmRKVWxGoiEXhNvp7QHpeJSZSjbYA@mail.gmail.com>
In-Reply-To: <CAEf4BzaES0KDyhHhk7UguLmRKVWxGoiEXhNvp7QHpeJSZSjbYA@mail.gmail.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Thu, 5 Nov 2026 17:02:48 -0800
X-Gm-Features: AclHuK8tdnhaPwz3Y54kZitME7BnT6URzVYL1boyOfhhSrmlCGq8Mz92SAE1VKY
Message-ID: <CAGEkeHf9d6BuQWsaqiresmbPNWAVZRbzZv03kfJisT6SQD8aAg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 2/3] bpftool: Preserve unsigned enum values in
 data dumps
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: ast@kernel.org, bpf@vger.kernel.org, andrii@kernel.org, qmo@kernel.org, 
	daniel@iogearbox.net, yonghong.song@linux.dev, eddyz87@gmail.com, 
	ihor.solodrai@linux.dev, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> how old by now are those btf produces that do not emit kflag=1 for
> signed enums? should we even care at this point or just assume that
> kflag is set correctly?

LLVM 14 and earlier, and pahole before 1.24, for example. Signed
enum kflag support was added in pahole 1.24 (August 2022) and
LLVM 15 (September 2022), about four years ago.

libbpf still clears enum kflag when loading BTF into kernels without
enum64 support, though. bpftool map dump reads that BTF back from
the kernel, so this also happens with newer compilers.

Dropping the legacy comparison would lose existing negative-enumerator
name matches for 1-, 2- and 8-byte ENUMs in bpftool, and the 8-byte
case in libbpf. In the proposed code, 4-byte ENUMs match through the
helper with or without the legacy comparison.

I'd keep the legacy comparison to preserve those existing name
matches. Would you prefer to drop it and rely on kflag alone?

Thanks,
Hungyu
