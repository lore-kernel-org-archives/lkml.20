Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA21475328
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791364957; cv=none; b=j4VSCj/SsOGEKaughaOy/oioQ8mfK08SG89JJg0i+QJXI+tW01/ySdcuHVVuzH2eXweEN50rlOT9zMtcI0KOynhu4WjOKXeZafhkrR7qEHhN+MdG6yWiYMe+HZz+bT7xcfD3XjiJd2oMwHqBXydEjZz+b+yAdfIxwcJoE5fVQ4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791364957; c=relaxed/simple;
	bh=EizNpAOA0z0oOakydmi6M3VKGaQMN3nPt9Kez7uY3kg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ae91dIlUWCsZk86/+JoRsjH17wxSzjzIdSjiO5AwANMy83zlCMwRc52Wi04rZ6Jcub/sFZHNBbBQ/0f4V62tPs7szBjAfkdd8EfVYTcF/TWAIohQyi25od6fcayKmpR6fH/OUh7MVE3aLrHs+225zYP/tsQbltd5ifIMkr8FIrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CbbEiJoJ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CbbEiJoJ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so13085385e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791364655; x=1791969455; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=78aUfhbl1SJJ8BuhCrrP97/yP9QOmP2X7T+XDMCGdOw=;
        b=CbbEiJoJj8zsafvAC175ssM1hFSsZIRPgECrqEBTL4ufGP3Q8pOGOtHRLSgoLQXXt7
         iEkRmOgYbQczUKn/Qbsfv6NIptPfDjRvsC2RavcOgQIS7RoHGp792O0ci3hMCeAX1lhu
         PM+/BANa6kQx9i3jUE0byutrgDe7gX6NP8FSeY53vWCeYz+43eBHHMrDSQ4en7D/zwa6
         gr8Y5MpOCnFc5O8FaxQaxEg+uFgzmp6L2l1k7J9BoIKwAKLmfXtmhOls5YnKxYmcKk45
         /V9tOF17stMHgV0sM6+ZYVuH8KpCmBLObPIdiea25RzNrKtNAh8kW35Sl/3z9x6DN5OF
         cO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791364655; x=1791969455;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=78aUfhbl1SJJ8BuhCrrP97/yP9QOmP2X7T+XDMCGdOw=;
        b=zcDojKVFprViLglYp6x6AYX+Rj8RbHpn9AMeZLn0LK/SBeYaP0fa8Lqi14x5anMh3m
         iUsfjfwz0NADra/Iplkx9R//lPuFYUh5w/Pnemgk6RCalRZAx3RfSf+j3YaCmb1CsbZq
         0TAVghdurDcTf4uv3AjpKjMfntRekRUK0MeheAh7ubwNcww1O3MsRQOnku0sYbICrgUN
         m+sQfQ69kykMsgGFOXjr1g0BPMcqH1Fj3gsuEtgwJ+3ZTlhkaNwim6R2d7HyziTiRs2z
         Xv8/THvc91KqlrDdki3DsVQSQ9RHXxDLHZXoJmTsJmo4fb/N762n7yGaQmHogb+Einie
         xKHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSePHm8fSqzDlosBV70oamuzqzGuCv0m9YxxWvWpxEUYM3oP0Lcl/uXUP51+p8YuTL3k0361a37rbqgZ0=@vger.kernel.org
X-Gm-Message-State: AFuF++ntDagbAJesb2ocGhWX4DRJvcm2JI5DqHneFLh1L5uBDm+VEG5Q
	nw1SMWyAsXwML3q1TXXjnbNQI44L+jwpVhUtgFaKyo/htrI8D6o/eLp9mpCeEhZ0quE=
X-Gm-Gg: AYBFou25cJACZbON+ZhR3KvBkCnNd9LIElaWTyvkVtkIPKyoUnVAsKpailddr0yFgD4
	vWxIwkKE94x0YD8AJsz932hTqsfkTiZU6n+9833hUVQOl4k0ZANZFBrmdjU/6/icYcyEOkehIWZ
	mV2QKa0i/thjqwCmfdpR2lwdl+NgQVHqicTgA6CPOVO/SooSvrkqR5bJJzU5LJbeAqACmC2D5Jc
	12P0vuINkU38TvLbeB3RRfs+c72GxQEIv37yRwSBvGMFiYZT4Q2HwnhxJ6WZ//pqYFbC4WO/kYP
	FF6GerqK+eUqBh2vdUPLu8HTJGD+rJ2NfBC8/pzFVgozV8wo29leHdxbaR5rC7IkiuMHy7YJUUB
	M3xBJJPATPnleKi5lciHBYC+AqwzQ7zMXKoRqIO7UReubzE857Tk5LzgSNQjDGEfKNpiUvfdknM
	5CHm5R319jw7f9QTmuoavPntAs+0e315hWHsGLGctq+Rm0EtpyggUs7guDiMI67NI=
X-Received: by 2002:a05:600c:4688:b0:4a0:8b1:f5c with SMTP id 5b1f17b1804b1-4a18042a422mr24290685e9.22.1791364654837;
        Wed, 07 Oct 2026 02:17:34 -0700 (PDT)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a851630206sm9158867a91.0.2026.10.07.02.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 02:17:33 -0700 (PDT)
Message-ID: <4851139b-6cd0-4b1a-9a6e-1af947d49098@suse.com>
Date: Wed, 7 Oct 2026 19:47:27 +1030
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] btrfs: fix use-after-free on quota enable allocation
 failure
To: pavankumaryalagada@gmail.com, dsterba@suse.com
Cc: mason@kernel.org, fdmanana@suse.com, shuah@kernel.org,
 linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+947286c775f432b073a8@syzkaller.appspotmail.com
References: <20261007090656.20609-1-pavankumaryalagada@gmail.com>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJqqw0NBQkUl/JeAAoJEMI9kfOh
 Jf6o/xYH/3AaWnGSq58XnY/T3/YYjr6g+TUZxa7MPyiYTELNpNlvmNlbtbAL0nW0LNvkeiqf
 SmYA+xkwY4RbxnZYQK0H5iv2w1eqa9qqFZb4bIBRmTapu26GEEkpad0W0ZhoSPMO8bV2Bwkf
 YdtPZQLaeUKvHZqNqBKnmtRLQj2Cgy3kuXX3bEGvWjzUOxPUSCj/S++JWBewMdMBPT62vZM0
 3156gfn5mHA94s2p+NFJoWkERY+JPTMu9NISkpD7yuGhXN88qd/aqD0RrlhxvKsrQogdPwn9
 vP18FGG3CRlHtOvOLVoY5NKSOWTDc+o+8t2XEETFTGbKYTcqeTzi4SxhvBLtTinOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXWBBQkQ/lrSAAoJEMI9kfOhJf6o
 cakH+QHwDszsoYvmrNq36MFGgvAHRjdlrHRBa4A1V1kzd4kOUokongcrOOgHY9yfglcvZqlJ
 qfa4l+1oxs1BvCi29psteQTtw+memmcGruKi+YHD7793zNCMtAtYidDmQ2pWaLfqSaryjlzR
 /3tBWMyvIeWZKURnZbBzWRREB7iWxEbZ014B3gICqZPDRwwitHpH8Om3eZr7ygZck6bBa4MU
 o1XgbZcspyCGqu1xF/bMAY2iCDcq6ULKQceuKkbeQ8qxvt9hVxJC2W3lHq8dlK1pkHPDg9wO
 JoAXek8MF37R8gpLoGWl41FIUb3hFiu3zhDDvslYM4BmzI18QgQTQnotJH8=
In-Reply-To: <20261007090656.20609-1-pavankumaryalagada@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/10/7 19:36, pavankumaryalagada@gmail.com 写道:
> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> 
> The quota root remains on the transaction's dirty root list when
> kzalloc_obj() fails and btrfs_quota_enable() releases it without
> aborting the transaction. Later add_root_to_dirty_list() then accesses
> the freed dirty_list, causing a slab-use-after-free.
> 
> Abort the transaction on allocation failure to clean up the dirty
> root before releasing the quota root.
> 
> Reported-by: syzbot+947286c775f432b073a8@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=947286c775f432b073a8
> Fixes: 8d54518b5e52 ("btrfs: qgroup: pre-allocate btrfs_qgroup to reduce GFP_ATOMIC usage")
> Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

Reviewed-by: Qu Wenruo <wqu@suse.com>

> ---
>   fs/btrfs/qgroup.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/fs/btrfs/qgroup.c b/fs/btrfs/qgroup.c
> index f68b696b4bf7..42be06675c90 100644
> --- a/fs/btrfs/qgroup.c
> +++ b/fs/btrfs/qgroup.c
> @@ -1204,6 +1204,7 @@ int btrfs_quota_enable(struct btrfs_fs_info *fs_info,
>   	prealloc = kzalloc_obj(*prealloc, GFP_NOFS);
>   	if (!prealloc) {
>   		ret = -ENOMEM;
> +		btrfs_abort_transaction(trans, ret);
>   		goto out_free_path;
>   	}
>   	qgroup = add_qgroup_rb(fs_info, prealloc, BTRFS_FS_TREE_OBJECTID);

