Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793246489;
	b=QxF7znMSVIoH4eNDRxb8eyjklZGsK0RsxBumKAU5L6FSwMIcgB2L5ag60CpZls2CJgn4
	 68CRzQAuXLS1JpS5yDGvcJlmUFWsXYz+sIMVaxJwrOCrX9k3dchSkrAC9EBcgzZ3B+ags
	 XySfYlkbtvXONI+TKGx9B2hly+a3L+BvY6z/EQY2ymfZoZhcFrnPjxoXHfrK8SXdyar4n
	 vwdt1wFHoz4FiB4UABpO48+HxaguJnMgC16bbrnRZ88rJTRj2/Wang9ngrHdi6x9LXEUs
	 Nku5FsQRIobpb2pUoilh1ZP5XgfRZ4t7b5411Nekqj1hUQ9F3MiuDwXcdUU4b7KMWfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793246489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iT3nE6ApyimTzCCmjq7oZisX15Tvs+j3ci2D6D926xs=;
	b=RrH3ic50ya+asQzvRCsw1lukvm33fM9lVq92i3XBEXZgDtyczh9wD+zdwMXLeZEtAen6
	 OUXyAt6WFtYcrePcwxKVSGwI7LfKzLsGQA7g4t/W3YzmdIe3LlZU/kIi51cjreHykpvqb
	 d18oxJLPB8oUoQ9J5mNxyYIRVPkNNW+BPSxa52r1OQs4OzNiqUr3bjGhUn7Gcsrz1p/ke
	 KGA2P7pbimYQxmv5iImCsPWR8xpuiwTsWwrnMy/dZnbQ0HFOPBPahDo9AMMB7UaWVufaW
	 R1RuNVGiInKfQfxsjBmQ9vgIaGsy2Ff6hcrWodILs723O953FP+v4F9lwu6qJaC4emA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=futuring-girl.com;
	spf=pass smtp.mailfrom=futuring-girl.com;
	dkim=pass header.d=futuring-girl.com header.i=@futuring-girl.com header.a=rsa-sha256 header.s=google header.b=iHHA2tXL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F375606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:01:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F375606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=futuring-girl.com header.i=@futuring-girl.com header.a=rsa-sha256 header.s=google header.b=iHHA2tXL
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b203527bceso2621283a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:01:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793246487; cv=none;
        d=google.com; s=arc-20260327;
        b=cjDW111Xd4/oEn6ZqMqeHUuPKLkBKjqJoZKaYaK7yylYaUdLkG6AwZlGhvyiGrxM9c
         5KVkgKIFzXPavmqy8op/5/7HlgT4X/tDA5N0uRoLpmliRoaxTx69w2F08kglgPxVLJ+K
         a2Phld9s6y+1qiqMHFUkc0JxXy7THn/WZZHOrkIil2Exs2lT+HUMCnyIxIdkvvW9cHjV
         UcJKkYSrmrftqN4NTJSplA7hg9Dvz6nhB/K8v+5KckmLp8zjBvwtUtZmJMObua0QIYJT
         +AXD8+Xn7spAUcE6beeHc4l1TdH7BdDM6XGsKhC85B8Qw44fFiDelXRHOGlK3G4pUR7C
         7orw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iT3nE6ApyimTzCCmjq7oZisX15Tvs+j3ci2D6D926xs=;
        fh=9w98a/95+yWB1eA8IDrbT2Jp5HjPg7Jl5ehZKyZ9dmI=;
        b=otpMCanrmaz8+qnz3P+Zb1KdT45RqV4P8c4xos4BijD5lCLWnSNKgdxtLYduMY2aZ6
         h50TX3QqVbjHFMY1yO2/XzoBf7UpIX5b0OO8rp6w63Ew6NZANFQEGASJf8vIs2l9ULdA
         kqQatTk023SRt2TGmR4u7FRlGJbXrsE4db7U4lWRFjf7EjPg2A3Z2AwkbOj3FpeAyPTL
         9cBCMc7lmN5APdUlxYpChGLW1QhmnDMT3b+zpWRoZco6ESqtgis0+dLKLLjRh3Hu+/Mb
         OomHNZSUJTssOEWDIYl/ZTO1lrZewa8vijV3VjCHFiO7oLGjk6FmTnzFRRhJ2vCKBfDq
         7HUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1793246487; x=1793851287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iT3nE6ApyimTzCCmjq7oZisX15Tvs+j3ci2D6D926xs=;
        b=iHHA2tXLlvWeAKSORhaQZ/IzEdimnL3jlQbT1jVvqVpmTNrnJlNQs6yKlKhiMgpEmO
         +DYyAOUElykK32bOUvpuAKhvWYTvGU4HpwztS801LwzIu1YnR3WIdqOqxepy7Vf8gmzq
         9pYwzNM/b2JzKLWXs19ihe8yyJTdRe8qBhugiUMrGJ1IAAL8Yk7B0BedRe31tqM5SIxr
         GpD1DJ7CvwqOaCsDPABslTpz9cn16TEpkyV8sE7USMnHxWe+MluBJ6jUL+Z5BAEp7/Gb
         7HLPuH7BV017UennJ62i+j390PFRS+Sv6NJ6YhKkP6G6PuW8nCJ802sioAV9T6p20Skw
         e2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793246487; x=1793851287;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iT3nE6ApyimTzCCmjq7oZisX15Tvs+j3ci2D6D926xs=;
        b=vk9xB6ikICFjLWBZAAsNPwXAMBP5ifBNEOXkPWiyVyLbHPWBy+m4ZlqevgI4phhVqA
         7R+n2lS1WEEZhNOWp4baNlFEBLCeXuE3MIZ6pftVfkYgNreLkzJQ3qiody1NqJW41CE8
         zSOF1iLTJbR/G1eAP69/ekaRY09tRDcOIZhIYaLL/iw/1sHVtJIH74SKv39fKcw7IBDP
         0ODN6n/U+vy8hgYfwXf1RaqeN8esM6N7/zaWhjmP07RThwyZ4Obz0e6WnZhbJeGr0XDL
         Tb4hQ0ol9EGPuLQqi9j74kZBClVAi6C4/RohqwZ5GzTyze0RIhV5cj8UwaarXvegu23N
         zsig==
X-Forwarded-Encrypted: i=1; AKwUvByNCz9EYnS9iUTizY6PfC5G/9hBgxZF/7M5xp/4rHvzX3X3Y1hCDxd/DFpPRKibtowmejH09FZdwHjeZKc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZGsAzCLYJU6vk1fCL0i4idwDfW1kRItl/McTMuBKKixbcaPka
	vuABiqZLwUNvxEzBii751Uso+oSL7/mrIkpwZhcMh5lRgc1PNuWOSXD3FhvTGJ6m3NkbVy6tvvn
	26sDQFunrZ2mErdgabHW6+C0sChjnfl8F+HU6QcHsVQ==
X-Gm-Gg: AYBFou10ECV/NrUBDR2qdFMUOC3cDtMRO2AYA3DZhBSHO2qP0lMq2YDuP3rpAcgXpcR
	lKsfAW3txmUFRpxurqeRuP1tNL2KHqCExbFrzBsI3mnSCT71Xl/zrvfMBy1Lq/zP9rCRrHyEbvD
	VNH6fPQrNlKt7P3+p7sSlgGHbgKVLwe4TOyOgabRWX6yPCLW5NgZFbJwNkJ8PPBCYuNupBbDLGa
	kiKT9AXS9J+ZcxlaEqPRUXIDJMDgj0rQ6EsyQFKfweAlv4qTs+QT5MiBD2NRsDweDJy6kZ1jJKQ
	YM60KX8jMeLRGlA+D6Z3B4Rodnt8JsuOAmvTATs2iK8ykM7DTziM9O2PPe7zq9ehlYXMcQ3xOUC
	f9XyYc2+iEP74Lzla2faycf9ezYKSCGzby7RETP/Y+/VcjhU1MDVXJxBOud+NRUjXV/r0fCA7np
	xPYfxa5MfNc3OopRM=
X-Received: by 2002:a17:906:4fd5:b0:c40:d920:747c with SMTP id
 a640c23a62f3a-c49bddae15emr389406866b.7.1793246487395; Wed, 28 Oct 2026
 21:01:27 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028165940.394092994@linuxfoundation.org>
In-Reply-To: <20261028165940.394092994@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Thu, 29 Oct 2026 13:01:10 +0900
X-Gm-Features: AclHuK_TGkwUYP149PAu5-_zJUxgBCxS20qXFuFYQvsPLL8tgUO2MuyiuzkyUOM
Message-ID: <CAKL4bV6ci2U6YcAYniNgZq8FL7QUsSjM7GPJE4BqmK8F-Vmczw@mail.gmail.com>
Subject: Re: [PATCH 7.3 00/38] 7.3.1-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@nabladev.com, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org, 
	achill@achill.org, sr@sladewatkins.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg

On Thu, Oct 29, 2026 at 2:07=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 7.3.1 release.
> There are 38 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 30 Oct 2026 16:59:22 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-=
7.3.1-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-7.3.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h
>

Linux version 7.3.1-rc1 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 7.3.1-rc1rv-g57ad63e19488
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 16.2.1 20260810, GNU ld (GNU
Binutils) 2.47) #1 SMP PREEMPT_DYNAMIC Thu Oct 29 11:59:18 JST 2026

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
