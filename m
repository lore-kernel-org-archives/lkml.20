Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793174579;
	b=d3NY94ZAUJ9J46F2aIDagR5el8MJzUqP5Kn7O8Zfvm9TrxSaelfEW/lA7/fA0pplBuSY
	 wBbL01KXRZAgkMMe3tHpj3ouiDfBahcHzvmms/zn1PoKjTTmrv7nV2wC9MRvQxoPdECh3
	 9YjyR97Fieyu3yvJYcJLya7HyQJPb7Fj10c0epYEcf5XEZpxbYxJD/K2PFwW6xDQJH/e8
	 mlqKU9Jt4WfhvOh02N0I0Xs8T1vdBEo9BsoBYvqjD/JKfxX2bUr3pNDozSsOOEfrBYRVe
	 oqXQ7HSyakNUC4k4IbT6H6/DW0rMenvTK+ukUmUDc/LCSrx00f3tqLpDZuNrG6w8n8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793174579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=zFnsy/mob24c8UepWExGPAPqtimxDOCEXDMN+XTK9/U=;
	b=qNAXRW7oqjE3jwDZe911xUyIX/FIJ8UfCLzNWb4JJSx+dcKyGyuIqdrKfjHmLCQ22SaL
	 4b+59Mzb5RuKXwv3tQ4vQqk8tf4QZXMYWoIyaR03VN8auPy+HedGmEeTTIvBEwj+9BT1P
	 QcIS8ir95QpmwKnUJNP/PKJUUQNdVLsinT0t2I3qRxd3v54BbTokcmzTToR1rjXaC3sC6
	 XQbXsc31BObOluia8UMLqoW/zoBKEl3dqB6gClzNVGpfXWlzwu55scf+sQ37rZ1JheBbG
	 CWxIGse5N4jXrBnDnK19IORJjP91EnqZaiNxYQ/QIH5XD1p0e/uhgtEugRPjKXAqnvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HkIpKz9F;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299B7606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 299B7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HkIpKz9F
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4326803b54so37133366b.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793174576; x=1793779376; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zFnsy/mob24c8UepWExGPAPqtimxDOCEXDMN+XTK9/U=;
        b=HkIpKz9FFc2HqnYDCDCYayicH0JEBPhH9MRCAWZZLmXfr2J4FX/dgFIxfgh/k01LV1
         rEFSChRE9gSl3NihbzHC4nid1ZEXg9Q0bH8TuX48yTby3aTOwQtjaZE3ac0nDx/ETo8o
         0QfalhoP2ScsJKxKBOucKvhowRpfNtAxS3dbgBAm4McR3XKRtpP/KH8MQWs2biLjZipH
         cDpn019yZePDBwVjvgZREq3MEcR96Y0iseeTLv6PWO37v0HJJg5E8LAX6bSaWiFBzV5y
         GDQt8HfQMFwhBm8EEN3Is76vA1jpuNSl9Zv28WBtEqKAbuxEuJ57eXCVgRi0x1wFJwwk
         GfDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793174576; x=1793779376;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zFnsy/mob24c8UepWExGPAPqtimxDOCEXDMN+XTK9/U=;
        b=F44RNPF3fZl7AkUDqedP5Kaalu8zp0pR90DDsTtKu7YZXZGWJl8M9n57Ix5++fWJIX
         zsDHOs6r+8fqfJ2QfvjLbX4UbgMY0aAsiVVm2e7B1PzY6oeTXb8pb53YHMZ854ZNz9UQ
         yJl7lt6re1u3fyUHNjDJHXkcXzYFx7XciIeOgRsHBicXgfmWqxPoFVknIQ1qa/97+hMc
         9o7lx8UEg5wWss3TqUPFqkd7FWkry/39BieQIJWA2W8uVu9EER4ipwJqaksmh2Rqn1iI
         sMjT7kjHnVA4Hbd/3mzPJqXQpIXLVtXcXNy2h1Ozy0r3maSYiPhMOwJhtJeYmwb6Uqnj
         rW7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzsuoJP1amDteVkClTMy1OWK/0m3orlCMo4GI/YB8a3KCWq8l0Fdqa6KZGt44dmXyORMQaD4nRmQTJ/5Xc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBt5dyUEPZfn0ObSLp72dAyt/9+3KQLUTMzlYsHeVG/p5T9Zo/
	d6Tw7m0LMVs+tTAfYvzjgyezQsRcXErp941dWHYNgsBKAd45YZOZaXF1
X-Gm-Gg: AYBFou1snIYouzkLh6PgCjZorC3CSF2sLGYnpaI88yfXxz8IGK+xd5jBAZjO0c21tfo
	wlD779zSHdm6mULAsxW2KZ3GwGqmvB201mj0rfWrnqUPzK6WijewlrGO+v5mpGasGKJ4wvrklhn
	VLIhDn4o404q1ZdKCtV3lnj2CJUzhAVPlag/MjSHitE2jEZcLWGtMKe4+nf9obSKsFR1A4rbA8y
	PmPoXsMZ1ycFkGOorg9T2jXXADS9GhXe1/lPjdFClok72sJBzQzz5yjvdIoS3UgUlWSgymoi2zs
	nZSi6E/zPiffQcGkIVLvj/FDtIcbIcHVFFXoyvCEwYfOOONLc/vHKYTKH5YjiQdh3lN4/dDpfAc
	p9BptJrelp8G2tSrB1kQ0AjFm46XW3MidO6fMq3poHTuBnIZecwZ+qJIVQktyO++wnSDecRogiM
	mk0blq6b3ABeD0rtKwDJt102y6JGy76nXXVg7ldJ7+FTlmlp8/KZWt3U95yKosR9B9aRI2E/PEe
	WRf16dbgoAPdQ9NJBYqO2zGCfUmE1vNwOcIyKzPHbcI5wJexg0JxxGgbjF2QpKXHkObwCgQm10w
	AIVD3fhNuloCKJFbJ24TL+lXPlA/GCIHVmAv9ofs3MSfZQ==
X-Received: by 2002:a17:906:7312:b0:c41:4964:90b6 with SMTP id a640c23a62f3a-c49bdf7af57mr116720166b.36.1793174576323;
        Wed, 28 Oct 2026 01:02:56 -0700 (PDT)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecde7c3sm28580793f8f.51.2026.10.28.01.02.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 01:02:55 -0700 (PDT)
Message-ID: <21031961-def4-4244-b5c4-0ed0830beadf@gmail.com>
Date: Wed, 28 Oct 2026 09:02:54 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] selftests/mm: track the modules run_vmtests.sh
 loads
To: Qiliang Yuan <odys.yuan@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261017-bug-selftests-mm-run-vmtests-xfs-modprobe-v2-0-cbb36b014322@gmail.com>
 <20261017-bug-selftests-mm-run-vmtests-xfs-modprobe-v2-1-cbb36b014322@gmail.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261017-bug-selftests-mm-run-vmtests-xfs-modprobe-v2-1-cbb36b014322@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/17/26 5:07 PM, Qiliang Yuan wrote:

[snip]

> +# Usage: load_module [module]
> +load_module() {
> +	if [ -d "/sys/module/$1" ]; then
> +		return 0
> +	fi


nice, this also stops it from unloading a hwpoison_inject it didn't load.

tested it on x86_64 in qemu with lockdep and DEBUG_VM, with
hwpoison_inject as a module. LGTM so:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
Tested-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
