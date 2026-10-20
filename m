Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.195
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792484941;
	b=c/z/l8zvB4tECKpWjOLQjLjYuFj5gnasKPJ+A3oRkYs6lEowsywsQopkai841Uz6pupS
	 n5iOBso0OFd2+MQWdyGsKQvdE7xmtyZTHCUFtBsRKNPR5M0a9vSxz5F+GV5Y/5TR+FwLo
	 O3VPjb0+25jkAnDuK9Va5q/H5VLTrsrDjf74n2o8rcuXiL2FgHUWWDNoJ2Y91tfwgKj6y
	 mcnXY4SS5zMlyo9I1778fQIQJ+bTqipo+Z5C/ALj0HuHV7XaYpxmC3J/UUCWkgAIVqXlk
	 yg13Hr/uMFKSb+mVfhGMS9fCFYbPz54KQCLUm0YMcjV3iapGoVCrCVhyyPajBOPzK+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=NavY/ytNnLmh66Ul0qyAE6INpifpVSZOXQao+qNu7CA=;
	b=1htzussAY8W1IAPwuZeEYqywGGvKmmXCOUDTVOkYs/4bToDkmCg5/wc/YVUipKbGWCe5
	 lagP++hxM5UZXbdkMUZ7vS68ITMTnV4NjG2EjVoeruDJKO4gw72AI66ZzzrBUh9A7AjPL
	 5DKtfxDoUWjFkFX7haKo1d/Fd6n4IGPm/IrT4uM7sfErXQZ2A/YAei3QhXUjTOO0p2RQ5
	 VpipcoGL+r/TKnTb+Eg+Tatgo1+R2LDaY5DyHwJluDS6C57+uy61vRhqjt+Tt/w1ZWqej
	 4j8hJnGCqgpYD2237sh6JeYgCk24LHbtKfWrfXAsGanlR1D2EewUnCjj/q7itamjn+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VpvxBWjl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.195
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657F4606A323
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:29:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 657F4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VpvxBWjl
Received: by mail-oi1-f195.google.com with SMTP id 5614622812f47-51f2e9e6987so269409b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:29:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792484940; cv=none;
        d=google.com; s=arc-20260327;
        b=daOVvknlGLRg2TMSYg7KGnVjyXgAA/BOEX75xkIbdzMGML0RYbvrW67N27IVdO1pAj
         oAoAZCuPar/r+1uAmuswBAPDTBZQ5MgZqI24JgnQa8xE8Y6Wj2+oY4Lx2tYYmgQFtBLf
         CjxVxRn4hUdYHrot3VIz3Xrh0rxcQy2hjURFQi0TCh93ox4CczrfOmuWX5bQAgAJcbG2
         FSSdHha+CoVefre47lvk8cG6SIYjGI8Moxd7KDFHrzJgCKKAU4b8m9HoJkt7G1ajG59T
         TZNLeqzKIOdEIGehwD49ULpOriw5cEvAeNuyT8JS5ICtUAR8g+3eU224KbMwBz5EMdv8
         cV0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NavY/ytNnLmh66Ul0qyAE6INpifpVSZOXQao+qNu7CA=;
        fh=RgJKiGM/4ESRVNv8ZugeZUndxOgPb7eMfgbb/lMoGKo=;
        b=q2yX0SAHfjhYfoVFO6eQT1UhYAL7oFvJ2W1uvqVOfr+gde6l2ptpOgiVmQ9j8/bTpp
         rov6gag+ydeQYIaL68w7zgXYOzxC5pwg3mXUIPKwvDV0caH/cS+1u3dtAHiSzozod3xD
         qfa/rKG/W4olJztju+QAXHD7g3Ks0DR1Hf4pwSaAwdL91zKtbv88ivQlWy9gSQfpCLGr
         mKW0avJnr+U6vArczPhuFJ+ZDgrgJ2vF2Yy13WOK/uTeSu8bymHC1lFzBvoE74tZcB9B
         ubkazPSX7rFrCkcd/sb0KVpKCrRzsHTPJXkLAlysOkN3XHVm4GmFixtqVRGdoQL+3S7v
         Oxvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792484940; x=1793089740; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NavY/ytNnLmh66Ul0qyAE6INpifpVSZOXQao+qNu7CA=;
        b=VpvxBWjlgA+Bqt9L3rUE0lDmeWk7FGC2H7K6V0coJLcF/UaUitpHzPnIr7hKPrqjnw
         obGlwrDmQ5jVNRoz42j3jIT5r6AwPcOg2goyD5sDbn4gacl0tCefS4FH6p3yUdEO/qbJ
         oJMQ78LnplMUCNP2HkqyZYmEmHct8uZso2S+nsFFQIJ6lifAUybX77IOwpd4GSaFybLf
         g8u0s6OhIHGzgnyCsV3uStL4XjQhPRfY6ivGFApt1yAH0K8xW6qSZbjOG8XoyMqFh29B
         YKwNr6PW3T+dzwG2P46Ole+iDypawco0RgoKqe7+UY/jB0aLnupgcVwQBaECOJjP38zK
         0TFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792484940; x=1793089740;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NavY/ytNnLmh66Ul0qyAE6INpifpVSZOXQao+qNu7CA=;
        b=AVUlf78jOpTuBuXV9AiubJiswfeZfnrV8nyHlGpnXVUqtOFPPluPH5ZQIqjiNM9va9
         3zhaMk2NqKP5evgdPyJodFta7vaui4DODckIpHMnhhsNgvA90rUMahGkkGHfLThsQj4r
         h80BLJ25TiGvp/u20SnAb7hqXkCOQ55hXv1hEH9Spi4yxRHueLHjYlwUKZB7bfycOP3G
         prNI+mexIjeWZBFaSecvojbh3Cm8zf1JimcCId/0vyo2ooI6H0sP8gSXSqi5JdMQrQ5c
         FAvLlzjqM8MU700xoXf8RY1CuPTCH3JRdu1c0HRJKflMeRqDtD5CRQN9p83rJk5fE0Bt
         JXig==
X-Forwarded-Encrypted: i=1; AKwUvBzB+i4072XtCBUodxP5FEBTw+ls0qnbaByReLeFnLFviOSn5aBSznQQwPq9a3HEToKXen0MhGxJheuxkFg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJeLThUP3EYqO8L1FiL+1uVJ108QsqsLIRdN8SyM2lKfSEJFdz+
	8lMbtR1+J/sm0pizGEe3e78SAwmWXKXgsnL8XeYJiUWJTbxeB1CkJwxynJc3CkJgh4XL1+KgtPV
	nWHVUxGly/uxXbxzTmW5f+8MLtBKqdPc=
X-Gm-Gg: AYBFou0UcwEckI7og2cYTatmFDeGnJbw6URExefuI+WSHOoFiIv1loyHoB3aGW5OXFc
	hbnxJVjB6We7i+cp8bMbbtLQvKDDGz+lOkP77jiJdxsllVLtSSNVDNxQS1ylF5RAe9r4C1nfjMn
	4jvIm7uvgsegZ7Q4tnGVL14QfBGJjOgwCAFbO1DORJmY0F0bM0ZO8wuNN61qX38sS4oq1b7Vjsq
	zK7IOlmrxDqi/4kUYa5TLBFuCR1hKVyGF8WWZpWX7KAxMeh5fmQ9dyfA8lIB5PiuKTDdU9MoVL0
	fn6dV5+rGF4/H4cg3a+2Y49doo7BRSytlMGhBDsP6tZ5wGDZURgvz7SoDxCevUNoSNV/AXCScPM
	myL+CZZqnIs46OpaYYcmBcEDZdMOEd68Y0NtqA+iYRUvDp7omg7oIF/IL2jYeINGuSFVPazs=
X-Received: by 2002:a05:6808:d54:b0:4a4:989:bb1f with SMTP id
 5614622812f47-54d90fa2426mr776594b6e.9.1792484940372; Tue, 20 Oct 2026
 01:29:00 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019165103.5990-1-dennylin0707@gmail.com> <9bde49a2e7794e4fb6bc3ae104eef87e@realtek.com>
 <334c6e785a5d242c6f168d57d042d63b777a242a@linux.dev> <4f48c50cab1145fd9dbd6df6d424c877@realtek.com>
In-Reply-To: <4f48c50cab1145fd9dbd6df6d424c877@realtek.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Tue, 20 Oct 2026 01:28:49 -0700
X-Gm-Features: AclHuK9c9F__jzyrGsDM3XhJ0P84vKewaRrJS_W-Dm5zp-eUXPubOxCKHdiOFkk
Message-ID: <CAGEkeHevidTtTNj-qfy6kE_O0wRvqT=F=sG+Hy83BOkRjCUqeA@mail.gmail.com>
Subject: Re: [PATCH] wifi: rtw88: allow key removal when the CAM table is full
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"reza1234khan1234@gmail.com" <reza1234khan1234@gmail.com>
Content-Type: text/plain; charset="UTF-8"

> I knew. I just want to know if people encountered the problem, or
> found and fixed this by reviewing.

Found by code inspection. I don't have rtw88 hardware.

Thanks,
Hungyu
