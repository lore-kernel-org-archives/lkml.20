Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B0A7262E
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 02:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791254285; cv=none; b=eENNsITJeEY2tOTCwZrxyDWLyAlXlOYozTbJKuZNAWUX22ydgRATL+xKHrf0xWogQMZtGWvGKtvdQ18FBZerZklXUgs6cN/OUVdSxpBWCSTD1UOfH+bZqrUKg0ugSGKykZLEe9eBPVPvIJeBGqf7SlOrlUUIgmvL07pYydBfGFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791254285; c=relaxed/simple;
	bh=D0UxWkrGDJEjJknTZwzjCJ31q1+uUyqqvfVL7rYvYbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KKwAn5nUM6pZk5YxwJbSm5rXG4EB9me1OL8UizMb9jyaQ9xUimuCbchWCaQRztSFb8XL2ShRB5XfYWB+kTtmLzPEo8pYBg0MJGYLn6utdR4d+Nm0c4VQRZ9a0QZO7bT+Xvr87tAxVngoSiBh6zfsjj4dS98IQiou5vSujmreLvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lnm6l3av; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jIvPOPvv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lnm6l3av";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jIvPOPvv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791254283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Di6epxlZpoHDGpBk057UhpR75wL2RoTA8HU7YmJFqJk=;
	b=Lnm6l3av5+fB7j47sNy48pyMAywTlleTPaCR5L2mUVYTfC2Efj3atyClZ9comRlwCNUzTZ
	sD2r6fzDyBGHIN5nDs+EqqdfpPQxOQmwdNLDZaXH0IDDzovjylf9woZVV8tBJCqEaztqTw
	EpavJe/W/UqEUWNRwyVYABFq46K1r4s=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-Bf7rO-DkOCSXLetZX6a78Q-1; Mon, 05 Oct 2026 22:38:01 -0400
X-MC-Unique: Bf7rO-DkOCSXLetZX6a78Q-1
X-Mimecast-MFC-AGG-ID: Bf7rO-DkOCSXLetZX6a78Q_1791254281
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a6d95d6e08so1885074a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 19:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791254280; x=1791859080; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Di6epxlZpoHDGpBk057UhpR75wL2RoTA8HU7YmJFqJk=;
        b=jIvPOPvv+546w9cDZwufBKMsOb5vqEqnoPwT3/xtabR4dnTuRFrSpDuZsD13l0xYbZ
         UKsihoDEAZ/CgOdlt22M6kZtlilbvHgruQDmb518lJm5eSD45h5iKT1KeL5Ez8FtF57K
         orXKreI8f6nBCwyRI5zqo3M0ykeyYIXuPeDg91ySBUyTakMyqbjVCI7AdqspPjDaSetG
         yqEcAIAnlU5/fI2Jo2tUh3OLHgktjmHvBHBeG3dAMNuydDmvYQxovAfkuua5jkn+W/sd
         /i2GMWZGFRNCJxSRtGWrXyNDGXlWCu2MqBFjeUnsmw5A43V2ZQxxCvQ6iBJy3LFy3//0
         ZRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791254280; x=1791859080;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Di6epxlZpoHDGpBk057UhpR75wL2RoTA8HU7YmJFqJk=;
        b=uwcgD0XBKM2FcLvhYJGUMEbwqdWyJiVv7SsGj6obCZ/48xUOKqb7J2DSpPDEZnPENw
         jcspgb96flILiw5QovXHuuzVrsNcdknZ3s2LGgqBTFW+f1EdL3oHhK+2pl4rMzFffeQ6
         FZvEzgNftJOltoA3TexPDcmy3NcXHK66RF9hhjrg9KGCB4WOFjJuPKmoTu0P8dpMfgJP
         eNLT2WV9GYrmYtKSUMJuH5Ms7K1NP9b7aIiIwQWOTkgQqDEaCcqUkrF21OUjtDVJ4IuO
         6GYZQgHKArfHi9l4dXYhubWO4NsVJGzRifqKPFsGvgemX4Rk7ydSbLH8DIAd9g1jlGFy
         1E5w==
X-Forwarded-Encrypted: i=1; AKwUvBxGtT6yx0gtPvOZdEoNBZH64mwwbbrbkgde4iQNmU6FSkfblLzy9FhNKk83n/GXZ44ezXzxxMyWBabggqY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPz4HD0Gkl+01/PUDCaUPLaq8kawkeeMhifdG9zVwf+MLOGiZW
	hmXhRPjdI2jthAKRVChRa1k7pnTajLRJxWs+RMF+WEYOPUt3wtVqwIyApYnb541u0CoNdE7dbta
	oNHIECY/dlhKehdPeRd0g23GGP7LaxHfUbFT1mkwUsHPTSFEAHYKrzlTXugkA8zpAwzYzr/VyuA
	==
X-Gm-Gg: AYBFou3ANs8uoGpYGv9J70TdJ6Yf86Al7qq+NDRD7Y2nyFdxs5gytJknKiStcmG4e9O
	PesiG2x9AuNvb/glb4gKRxpbPoecUEPehobRq5VVdWqa3i8NGFpijltxCfhCVOEJbpg6q74LXxA
	LequgVP7slHldig2J54DslZ/c7lBaQrumqF8c5/5rJ+oOFfDyP79hz0o5dd7ylvmalwl2998KDH
	d4CFs43LGhszovdOSVA0N3IUX5IQBudjGKVBTdOApeGUhN/Ibu93PQuBD0gIMEZ7J86aZSxsntN
	KZyMTTCsvkJjkjP1aslFLCUh0Dq/nT01dLaHnTYw2S6Hhr9Eiqr0iyjsSdd6+QUtJgffXVwKwKP
	qlJD9e3IFqT+RxLawyCxgXLjItVBQD4gB9Aw/bMqQ8w==
X-Received: by 2002:a17:90b:4d09:b0:3a7:9413:cfa3 with SMTP id 98e67ed59e1d1-3a79413ddc3mr6299023a91.55.1791254280380;
        Mon, 05 Oct 2026 19:38:00 -0700 (PDT)
X-Received: by 2002:a17:90b:4d09:b0:3a7:9413:cfa3 with SMTP id 98e67ed59e1d1-3a79413ddc3mr6299010a91.55.1791254279897;
        Mon, 05 Oct 2026 19:37:59 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d2406b1sm1679514a12.8.2026.10.05.19.37.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 19:37:58 -0700 (PDT)
Message-ID: <c8930670-32b1-4f20-af0b-a13d17b45044@redhat.com>
Date: Tue, 6 Oct 2026 12:37:49 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 10/23] KVM: arm64: Consolidate stage2 unmap range into
 kvm_stage2_unmap_range
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-11-suzuki.poulose@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-11-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> In preparation for adding VM specific backends for stage2 operations,
> nuke __unmap_stage2_range() and fold the logic into
> kvm_stage2_unmap_range(). Also, make kvm_unmap_gfn_range(), the only other
> user of the __unmap_stage2_range() call the kvm_stage2_unmap_range(). Also,
> while at it fix the comment to make it clear that mmu_lock must always be
> held while unmapping. The code already mandates that and the two call paths
> do have the write mmu_lock held.
> 
> Later we would replace the logic in kvm_stage2_unmap_range() with VM
> specific backends.
> 
> No functional changes intended.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Change since v21:
>   - Nuke __unmap_stage2_range and consolidate the stage2_unmap_range logic
>     into kvm_stage2_unmap_range(), in preparation for removing the KVM_PGT_FN()
>     for stage2_unmap
> ---
>   arch/arm64/kvm/mmu.c | 38 ++++++++++++++++----------------------
>   1 file changed, 16 insertions(+), 22 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

