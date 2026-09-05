Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBC635DA64
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 05:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788585070; cv=pass; b=LHfv4I4zqLAZxnjbtE/f3jBk9VjY4l1rlIl5lWLTmofz/tYPPQN9AMjRoUbHkP2hIjgrf1tu/Tp0QdVdKpB0EZpdmfopYiAiEuZpiOj8AxpL9iSlEk5UE0UZMSYHSsB3UOiIMkdylWn3vIzpoMfegOc+PWUKAUxJFcPzya3GQRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788585070; c=relaxed/simple;
	bh=fhG4nXFbkT+J9F0H9mpjkaytKCMY/uVxDVHhPpBelN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fvV/PNOvbcWXBjSQo6zt+bv7gukpV59iTLy2m2vugAAY5GAqEhXClcGUsHfMmrKZmNvbAQPk0flWxCCC1Q/yLk3YTHaicUlNXSVOs6xzRlSd3oqjo55UamtJh2LtIRd5yMLIWolb0n5zC7Qhcz1zOziEcWYV7Y7k0q9bmr+z7z8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RRiJ67W7; arc=pass smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RRiJ67W7"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc1cbb64a1fso1745402a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 22:11:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788585066; cv=none;
        d=google.com; s=arc-20260327;
        b=bT3B1QST7rz1X/+3VUGXARjWWlLVVe/QdtJXVMtu/nd9EHkYt9/5pefFNV2jZOb2pS
         GZGgkM6U8n1YzX9Jb3CB03rM5Br5FE+2o+N5XVPhQGs1YkH8TKoG8+sZb/7STNdK6KL5
         /9xIxkyG8vzazd83gKLxkpjBtOceDLcPia3gdXJCGEM3MlezgQAm57GljNniWPf0tJHa
         BVANG51rM4kbNBblWv0UAWiJdg9BYl7fWB0365FSHOWT9RFwSjEthdusUb7peJdsrH9a
         eC2MG998+BqPTIKPkLUdiqWrkxfVN3sJmpwIkbh8UXB1+oNHFraY/pr7hgW1Ws/ClRf3
         CF4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fhG4nXFbkT+J9F0H9mpjkaytKCMY/uVxDVHhPpBelN4=;
        fh=yxNWnSdux0TwELYqfPWJ+Vm2nEkz100oDyyTqH+z0D8=;
        b=nVjwg+VlHKET6DqysZLs3oWuIkavx8+s6g8ZrTBjHmaNLoHKskbOVmsDODvRWzfPDc
         xNMtTFh6B0Elw0DtXnybhVCdswTZA9tA9PPUjRZo+u0aldYVZCeDI6w4LwTVHaBsKZAE
         C/rAWc2BR6zFGEKVDEXXGyMGLrBPSNIPY5+hEb73hKSIeASiWEhG2shXrImXwyzUX4Bz
         xYlqAPfs6R9ZWQqK6pcsFl4ksUOi5efxvzT+atSorKkxt87ik9unPXI79zk56fIi1Fz4
         5RdY4MBmpl1dl7U157kGEWOVXWuYBIOzWjsPgG9gl353IxEhoNGy+PzSb1/QhnhiHvAu
         djLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788585066; x=1789189866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fhG4nXFbkT+J9F0H9mpjkaytKCMY/uVxDVHhPpBelN4=;
        b=RRiJ67W7REQTt//CZU78ne+RG9IbU0wh/ihLavLbVe2n7ZZ9DMcCY6gHSUn7ieWTZt
         crmGmsCMnw1ZN46N+2QR395CQqQioyzJ4ZQxnkEyLME5DnnviR3YYn+CxZwHOcCLFlnD
         9acK3IpPqEaj/uTJMTnD/tt2EAzfEmCOy1DCx5kb2dj0QAy/ClOZeFobhHLLB9lUEfqa
         x9t46G97ptzUIWW4Ge6K02q+tw7NF7uqR6ArkE12FsKTLdUJUZIU61ukgFiuF/NI1tQn
         yKvegQY8rz2pRnZ/M9PjAxYG+xlSMwBjbDjYcKeZpMK4kQcepNTaUGCY+qUkv3dotmrb
         9lZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788585066; x=1789189866;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fhG4nXFbkT+J9F0H9mpjkaytKCMY/uVxDVHhPpBelN4=;
        b=LtfD1shGHEMc0lWEtVjmjYRDFHamk/Yz1TfqF+IJdXYS57cE/QyNckzaq5ZVKmz27E
         4nc0MlCKG8j+MySprlit/2w+K0Ocst602Z+MOcSK6ekYYguqlPgPK0MGdd7JhkVssWzJ
         0VrEjro8e79UAH3x3u2ZSYMTuxAcew8WCuoVAglZPYUKNDXgvjRwKCddtexjvTKSNNe0
         dIYOPD+ciBbFxQWabe2h2oTsckLV9SSFX2WqmXk5LP61CHmFnMU08+pD30N0Yyd+nfhM
         dQEmklOIvsByaVl/jhYBswWynQP9BL6UodcgEOaXRHdPd1G+Mb6w5bffMqHhLl1i0VIM
         7H7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwazB0puXbQWmL1i31tb2gdo4k+Yv16PV19B/3VFLh09yLijoyLGsmQg1HAKDUuYbz0M21ZI7G6K3aFM/k=@vger.kernel.org
X-Gm-Message-State: AFuF++k4nw9Q3GDyAqFxPX/7I5abxdNNR1GRsPnAx8VUa+/gzlbcQIri
	zOp9ifoJD29HfJOW9t1nAvfAnNGym8L9r/QkIpuSBi6uMLue15uBaF2mfxt13uXa6lxD4I51hJw
	CmKFxMK7YRXH9Ftz61jzUXolMNmHKxAWnc9pvZ/Vo
X-Gm-Gg: AYBFou2z174/4RA5kRioDDgUzgqoj9dp1P3ZvEsycDNtmYUEVoW1Fe03CNmHjLqvEo3
	Itygq9tqMr39FSatUDt7n70PkNuGYasbiQ9bCw0sPXI0mWYWCvNERlBNZUEZURGPNR7+ZqhKAOL
	xgsNnuZ94wDPm4TAoTrVnA5SqlGtoAZVdtfgGA/sS5mnWXM9NBZNMp3bpJogzadwQoWlVXRMdhR
	Hpa7/DgamOyVBzjfP4fMSYvs0pv/GfZh26PiFatlr70Lhuarc6qQuVnLXiMB/HXxxmjrEpZxhrS
	nU0Jfjn/DY2HDE4/ZaV2+spXT9SWwNLyhUDwASpL2rSevfgoQzDE0pdyS0sK+SZq3cZeliAqA0F
	J6hRudyewIc80SpsGe7NX4d3GIciPm3B+RDBU0XZI3gX9N4xLuMCgPZQaTLQ2xrsGxjCV4SaHgH
	yzLXqvDYENsyB/VMur/H5l5JQ=
X-Received: by 2002:a17:90b:4c41:b0:398:9bd5:490e with SMTP id
 98e67ed59e1d1-39b2623ac0fmr14663530a91.21.1788585065754; Fri, 04 Sep 2026
 22:11:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902073334.397685-1-ruanjinjie@huawei.com> <20260902073334.397685-3-ruanjinjie@huawei.com>
In-Reply-To: <20260902073334.397685-3-ruanjinjie@huawei.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Fri, 4 Sep 2026 22:10:54 -0700
X-Gm-Features: AcwNN1U1mXJm-r99X5J4Z_vJiviQxDJYtqkupNfbLgXgGVTAVmVPzGaxcB3pd14
Message-ID: <CAAVpQUA_75Gj_=EwGp4-ENU0wHLjBEn+OCPg6OEUqy2TTXBnPA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/2] 8021q: publish vlan_devices_arrays
 entries with acquire/release
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, nb@tipi-net.de, sdf@fomichev.me, 
	liuhangbin@gmail.com, da-x@monatomic.org, jeff@garzik.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 12:32=E2=80=AFAM Jinjie Ruan <ruanjinjie@huawei.com>=
 wrote:
>
> Replace the smp_wmb()/smp_rmb() barrier pair with
> smp_store_release()/smp_load_acquire() on
> vg->vlan_devices_arrays[pidx][vidx].
>
> vlan_group_prealloc_vid() publishes the array pointer via release;
> __vlan_group_get_device() acquires it before accessing the array,
> ensuring the allocated entries are visible.
>
> No functional change intended.
>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Simon Horman <horms@kernel.org>
> Cc: Nicolai Buchwitz <nb@tipi-net.de>
> Cc: Stanislav Fomichev <sdf@fomichev.me>
> Cc: Hangbin Liu <liuhangbin@gmail.com>
> Cc: Kuniyuki Iwashima <kuniyu@google.com>
> Assisted-by: DeepSeek:DeepSeek-V3
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
