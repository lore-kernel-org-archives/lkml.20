Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793202048;
	b=YjaeLVlTC1oMekRxZTnEjmcF9yrFh7qDvnF3yHtMEESUC8euk4KPM/R9lY921n19KMzI
	 2cqJGL74QDKAAqCisLUBWYt4tjlFKJFThzL7CiLRiA1cEjss0BMGW3sOFcJDr52KG6rgg
	 5JX1trvJLYd+UtG2pDqLuYtF4Y1/dxrmsX7XWPBwrP4GrV8tVafx+5cUUGrmJryQgCgr1
	 0UhgYWqUlfZV/T2/f8/q03IMWXvp8OOWp19c4M1a0nzhjUcTc8b1koEPU2avSeMG/Suhf
	 RIFmiCxHA59+oU+zHfI0vyojHDaH64uZXlz4P/yTSgWLdVOAsScK8Ycfowdamvjjenw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VvqihW4kC4LqjjOksCpSTYN8rpLOhj25iPkPggjLihg=;
	b=KvsSpw0VlJn7KCEuQdfYow/xwDzxn28mIBEJuTppC1/+VIql/zPu3+VPRPOmPK09EDJ4
	 mniWwPG4aBH9ITxyGeexIqz/r5lmcEpilDTn5LQSAZAjoFIamD3HZV92GFfAOl9i6NoiH
	 cssHaZzjROG06ZhFbppf2zVPsaENirFmVrse/9BJ2XnOaLrSD8f/T1xuuiz75k+Uo+B+c
	 wDfqhjfvfHwrg/JiPyV/I05aIJVC/yW9xWZZkYXdSWfo0jSzv2r3DJNhBmLIKg2v1hX8g
	 RWAR7lbjmXRO1afu7/zM9pwoyH79LfbCK4F/EkMmEeAjv59kTaBDYXka8OQtIXfAkdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x3q7OCPN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161E5606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:40:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 161E5606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x3q7OCPN
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be4c78e8caso1205440e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:40:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793202046; cv=none;
        d=google.com; s=arc-20260327;
        b=GmA7x3uvrPDN0Mx9hFeMngGIg1+ErZnITsFJMtkFarP0nikqa1RdftvrB8l2ZSm2fh
         AWEQvGgljFiodSPig4XvXByhjcSsDzC4g5au3DW8yRzUzXf87Zol7p7BUGrMlqxG8h5Q
         5HgCalN5QOfSoIdkcbhzSZn4ZIrC8LCgllDwOkyW7C9smfVSkOTXdXFoOTwvG9q5kpfr
         ReYcR6/l4seNaSQWdG375knGrRh6fAGTiL6WbWcSHwlTNUIJTozfEzB5Jjn5b1bJZW30
         w5r/n5H4bU/1eHl6z85zHvPF16Tptnpw8P3jgKb0desZNNcrQPtknb0IWtX/5r+r4iKI
         CL8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VvqihW4kC4LqjjOksCpSTYN8rpLOhj25iPkPggjLihg=;
        fh=mu+/HmCpv53lhJAmkrQ+fwJwkXqE8Epkfwwi66XNYXs=;
        b=F3BwIkRd2k7kOXctuSKKFr53sJteNs5nFnHtlBvHFbWf0mFLr8FzXqgEGbJIFGCKry
         KwRd9RzxGRcbSqr0f+ulgBe0AGaOb5zC3ERSs0G7L0YCgaSxvh8BceJfoVxZWIF2ZLOi
         WzFLmYViLvO0KOKeqym95T96gaKYwtILVAZBb65K+tiiAZJrnqpWAa4XfiIKFXdYuMOV
         Teu9WWnNF52EUHsxGKwEsUvXlI9WRAzAcl6Boi5xitYJqk/cPbm05KiOe8QzOKVtOTMA
         p48xylsIP+9rD04kg4I/vFiRFqyADeunOtrpPXD2oZOsyz2z+G03pM4PXP3DZu6HeWzj
         w8sw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202046; x=1793806846; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VvqihW4kC4LqjjOksCpSTYN8rpLOhj25iPkPggjLihg=;
        b=x3q7OCPNcUCc34NkqUOqBdRCsfVvc2F+hVUDgLJ8nUF3QaI/dgkMA7pW6vxHoj+c3D
         S3fjF10Jo4KLhEhMxAiy9CCOU1tKTa+IBhCTU1TcXjiOpyIrM+hm8q0vUTD+ih/S1dsi
         BOn5syXmLcFRVOBBfFRkLV+eEP2LmizvNE84ylIMJE61ckJJbQ8ZkVEz6djHm/f9EbAt
         SkEnMdwNKrzjBoWTM1mjEDLL9TJPFmK95vNd2tRQH/hTo/Vu4+1gNjqnccRxc1+aWFRp
         PNmCvUQg0DfEsn1P8mg+evC5l+jociDlIkDKVXlOSsbDYhp5z3dVZIe6gQoxt8QamOTe
         2/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202046; x=1793806846;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VvqihW4kC4LqjjOksCpSTYN8rpLOhj25iPkPggjLihg=;
        b=2YTkchbHt4IQRUNSReBKvOIyV05KZ+xkg5GSP1ngq6kE1ypcXf1RaNlO2pB4qTUjXL
         yKfno1eidjB6VCryxwX7GsxdUXxpfcVS78SvBeimXvUbNty4QB/LO6Eyir5SRyaIN4M2
         9vG2Owag8UP8ke4DKg09uCw5kr/TPycJMxEbzNdtpzF3RpPYgAx6JA/QInbXR76zeARa
         puIrGk7R7fNAHFsiz3fPz81lSIOgQij/aL+XQWbp21VdkVXJuz5ezZoXWAEMrI5vkJof
         hEeF4FAcUc/rRXiFzcAphNcMADQHso0Plqv1XtSN0yE7Ds8nox6MbSjx35bYUH2whRIO
         8qhA==
X-Forwarded-Encrypted: i=1; AKwUvBwiOfhJhQOlKIw8B8ijO4I+v9lsCqop6v8Qx151nl2XyjP6j9IipOSqd9liJ+sUlDHzM9nHy0g4ooBsj4k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKys6jOTBSKcIgssMiBj3c7QhGbgTsjQgdkoQF34LDtXLYDjbjX
	5Mx16BdG5ZHMtZIXpPqRdJnk08pA2OpPjFRgeALSlnMY3qwOzxiyVCs2swr38R4yu9GNtyVXOUO
	MgHz/o/aL7wx1eBGoj/UWTfNcfpQGqtE=
X-Gm-Gg: AYBFou3Hq071xCz1ZxfXI5Y0TUuYR136DL5Epyp5CG7H1VBtBqdPdDIGx/hqZWldnMr
	uBMUqrDhskYVXk/bE8LQZZH4wm9X7f8XhRcPJhdJ7H9wrNrEZEkJyJSR/tI3zaURDTZSZgUzSkE
	p6bjh9PneZYEc9Y3HDWd200Q1BLAqGfzP535lnw+32INwkoWHbyiNsPoaXQgVxJRMPM0mkoSuzO
	qNcvA2S0A3potuPQVLw7WUe9ucWc59WIMnmoObfD3ErhY4AQxq4AYaansZAVfUrvGfPVsryhv7O
	Q6zDOzaNfkBohxhQElhJKCAttANjrMcEsa4ygYLojcVlTKEOdRrIwUpXwha9KiYILETPiNGCto6
	5ogHGRMYknQL5685B9y/GznVOzt4EdQ+IlsoiqRKwpRd+sJSgzsrht/8cS4iH0eJpQItchGx5gK
	kUR8yWNmBCQypd1MH6priRUrJEZDs8852tDk/J0RD6hF7ij6GDqhPsXs/mADzTy6GXAxTZ1A==
X-Received: by 2002:a05:6512:3a91:b0:5bf:a47b:ce4 with SMTP id
 2adb3069b0e04-5bfcad9472emr978004e87.39.1793202045880; Wed, 28 Oct 2026
 08:40:45 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028024333.795917-1-ruanjinjie@huawei.com> <20261028024333.795917-2-ruanjinjie@huawei.com>
In-Reply-To: <20261028024333.795917-2-ruanjinjie@huawei.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Wed, 28 Oct 2026 12:40:33 -0300
X-Gm-Features: AclHuK-4RjPCzimHxGTwDAV8hHhfzp_jzOM0geiPB1vFfZ-ILbcZUW9vQG_ge-w
Message-ID: <CAMAsx6erAVzXbHUZNDbyazFQ5c+S=DYZ0YMq-emC8Mn7WVej3A@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs: kernel-parameters: Drop unsupported preempt= modes
To: ruanjinjie@huawei.com
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 27 de out. de 2026 =C3=A0s 23:45, Jinjie Ruan
<ruanjinjie@huawei.com> escreveu:
>
> Since commit d3d16750693b ("sched: dynamic: Make PREEMPT_DYNAMIC depend
> on ARCH_HAS_PREEMPT_LAZY") only "full" and "lazy" are accepted with
> CONFIG_PREEMPT_DYNAMIC: every architecture that supports it selects
> ARCH_HAS_PREEMPT_LAZY, which excludes the none and voluntary models.
> Passing either is rejected with "Dynamic Preempt: unsupported mode".
>
Hi Jinjie,

Thanks for the patch. I checked it against current mainline:
PREEMPT_DYNAMIC now depends on ARCH_HAS_PREEMPT_LAZY (d3d16750693b),
sched_dynamic_mode() only accepts "full" and "lazy", and all six
architectures that select HAVE_PREEMPT_DYNAMIC also select
ARCH_HAS_PREEMPT_LAZY. So dropping "none" and "voluntary" from the
preempt=3D entry matches the code.

checkpatch is clean, and the admin-guide build (SPHINXDIRS=3Dadmin-guide)
renders the preempt=3D entry correctly with only "full" and "lazy".

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Best regards,
Daniel
