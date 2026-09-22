Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9198330AD05
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790099694; cv=pass; b=Rg5e5So7Ig2x4Zq9PIQuBpiqJRZMFXAaT4R+ZL4gsGFIdwyPF7x3dcN+feIoXIo1IwAcTy6leSgSz9lEHtAdna6qaHqPSHwM1S4ZqIPlvU5tF7dEUx++buEJXCx8fRg6PiFvMS3pOaJXM27yfiwmTd4HlQPgpdjwQurFG2hmtbY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790099694; c=relaxed/simple;
	bh=vCKS13b9L1ieft7U9s9r3sFPnYyRl2ROpAv1bNkHIlg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kouSGlox+/1GXuDLZE9UimmjRPSWrYrdH3ZPWTWANKPVgiHB/tre2Bt33sucJmC1J36hZ/kn25EW3781a5/S2dAWteePSrUuTgy2vEKVDoprPOin3Vy07ZAPsN6ef/OBAiWoSrkeP44qYa/jKmF199xesF+mKahd4Xxh/39MiLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WvOsGxFs; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WvOsGxFs"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843cedd129so147177f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:54:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790099691; cv=none;
        d=google.com; s=arc-20260327;
        b=rCtJzLVusy8YwxZsqGrlStZaiD4orx4RKA7tuLuk0CkJ6ey6obvIb9WZFIDJifLTWP
         5mss8nO238JNom94n5+4v8qqlVOuJCgnUC6TkOTdm3OaXOe3pgdD020w8z0v4RrS+mww
         gZN86qursookEgXJMqr+DWf1BJbrW/FMW/77/7hie2M1/PmxGTU9K8wKFcGnImx4AHgz
         KHzib/5CEPLQ57o5RSlD4ZbcwBhCoGgLFNhw6bNifSc+c7QVWTKJ9/DQlag3KSuwJmQ+
         YllMUqTLhFadTPmdQBHHNoWDbm8Nn/pEPgckcNYP6b1vVOghtqi+L6hdUtli3ygIKDbS
         BbIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vCKS13b9L1ieft7U9s9r3sFPnYyRl2ROpAv1bNkHIlg=;
        fh=SHtpoGxOCXcZfZte4qdJH5zzMs4DIwUfwN8ZOxLjeDI=;
        b=K7Dj0qkMvSAyt/7NM1m72j2thfOXMfuXqNk88nxM5qRwPsXi/so105tUfxUPF3Puav
         u6/Neapj9CYD7x5xwXDXFpcS6N3jozMgZaXoRxrXwnj9IzciKYvxr9rXvrPnIp8ol6Z8
         iNMy7S/yuvhuXzfn+vXAGXwJeNAEZwRPWZ7BHttmrKOaldbjrehUS9mB5ohn0XJpqxJb
         vP0HGve/1eOJt82Ngm9VCpyP8bbB4tfdZtr8yKWQq4pjtDe7SUA9mSe7py1gyC0BSQoB
         SAb6GZRtlQEGS/uNqc2m3LZv4TqkzaqL8YbqeLzSUxr9U1dlxD2/Y3y9UStgfs+fMJv6
         pskA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790099691; x=1790704491; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vCKS13b9L1ieft7U9s9r3sFPnYyRl2ROpAv1bNkHIlg=;
        b=WvOsGxFsgJVCXhWCniB1+1/fUPjCCoob1j2KIT5KSLgafnkGlqAumAOIkqNN5K0Oje
         4WChBV7Ygz0z0SlMQrwUQcZkKC6LwqgRgpKEUJ7KUFA3dPCKOo7sOesofTM3mNDW/8In
         OkyX6f+EIY08ieRYBsAr+bCIjfRK9rwM1FwAg5Zwkmf/4QZqoMVxhYRHGxnZbwjFf7IF
         A0DU621cRSLkt3Dunu5Fk7VoJFbiUcPMetHIIq5zkiBBKgWNp+WSHt8PPPtwe1fcKT7a
         AjgsJ/febG9jVdkg4MB/ZGYyoNBQ64yuqYX2B9izEYj9Za4Qfqeih2cLp13s9rlNI2/K
         dbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790099691; x=1790704491;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vCKS13b9L1ieft7U9s9r3sFPnYyRl2ROpAv1bNkHIlg=;
        b=KmQxOt5XRQVRhiGIHhAJz8MKXQmbVh+YjCQeVqjmav3n4zwAzQ50NZZgFVcYZYN2rV
         rU7qzRa6/UR29i0kcpgcXoLUXMmcY4+o86Nb/eJMih29YNz5laY8pFwHsvRvEARU2ZCi
         bO/NvsdQd6Eeg8s9j/0jKbvzfufTiZpGNSsfNavK3aWtgO8UrhmxtwjuRaByiWzmX9Jh
         8mRKiJgaEQZhPXTon0JwHSVAr39/R+yXOcNl/0vYfz15VRWJ1H3mxztYZ6anM2nMMOVG
         2CUnJ5fnGAeBl8GDekP383r9ta4qsezeMAl+CiI6s7OOeZtwwOqnNVlSb3SMSd4nNlEz
         IwyA==
X-Forwarded-Encrypted: i=1; AKwUvBwK0VydmKLj75AS247CuBcYOlRVOZIibGu5MgZg2mDnySgATxswBif3Cy5HVmz4wz9NGJCh8zLntlkpifY=@vger.kernel.org
X-Gm-Message-State: AFuF++mi+zqDoFcKRJcEwpDURWCFgDR78bqv/6oyLnIe29fkgvrdqyDX
	IkaRCCd0SKSqY0iE8k+XPBOZ8mITIjgYop3AYj/f95YDnpoABfQaXbkTBUIHJso5fdKkscqRUrN
	xq6Ik5aKC/nmFS/EvHMIrxBHCi+OLoKU=
X-Gm-Gg: AYBFou2WGphjh7E8d7syhoKD+ERf/G/wqN9ZEFTPh2p3s3mY9K3yFjhmv3XfRl9wGzT
	zqMCRlo3Uvkwc75D2P4rhXUzTD8C5tMl5lg+3lUKDhwCuZMUO3ClH/PwS4NKsxaZO4hSLh4ngcd
	8Aav7kaK+7El/Wc0HoBOcSS+y1fNVBvNfbFwhfjztNchPPOSTruqjvE/L90sEN7qSPNEntAP36d
	EyZa4/QWtqLZXZuFsFw+aZpewbUROEQlmawbaI/2UrpV7CwP5HvToRx+AhCon5hCWdSXtp24mxk
	3jkRVdDljhtzA0tTSM8dDlZ7rwxMYMAABNixuA6t2YogzMMAypxw4bsqRxACr20gHRfPsy/4Qa8
	vsFeIR++vRdIp2Nmy8+1zQA==
X-Received: by 2002:a5d:64e8:0:b0:487:40a:5ba8 with SMTP id
 ffacd0b85a97d-4886704c06dmr682814f8f.15.1790099690760; Tue, 22 Sep 2026
 10:54:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <aqJXx2vtbKaRLt3x@fedora> <aqLZ5TVDAqEbIeMN@linux.dev> <aqP81aqNbwAbs2P0@fedora>
 <aqQrPLPXHXiuKup0@linux.dev> <aqjcFb6MFNiA6n4V@fedora> <aqjpYHbZ14A8xRtK@fedora>
 <CACePvbUwTxcMPVK_1GAz5gPDdh0BV9JZSnKXaUFLqDHBzBmPQg@mail.gmail.com>
 <7ee199ddee81bf8026688def82f78ad9db09be9e.camel@surriel.com>
 <CACePvbVA+DnDJprMx3qOrGb98y1ORQ-LfaENy_Btfx3uW=E4eQ@mail.gmail.com>
 <f3ca71f1c561f28a341de0e5a1b3f24bd4da3201.camel@surriel.com> <CACePvbX5Oy98DygLZjC=Z03Lqb0nk50_OEKQCT9svbQOOwwDew@mail.gmail.com>
In-Reply-To: <CACePvbX5Oy98DygLZjC=Z03Lqb0nk50_OEKQCT9svbQOOwwDew@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 22 Sep 2026 10:54:39 -0700
X-Gm-Features: AclHuK8GLbQTZvdEds8LwHBLJi1-Hgl2pSvGmQlVhhpHqGOi40_tcpI9Kqsywu0
Message-ID: <CAKEwX=Mv+tnL8K4rfPuof6mKaLQp=tqR_qjtKrtY0-5L85FLfw@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Chris Li <chrisl@kernel.org>
Cc: Rik van Riel <riel@surriel.com>, Baoquan He <baoquan.he@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Kairui Song <kasong@tencent.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Barry Song <baohua@kernel.org>, 
	YoungJun Park <youngjun.park@lge.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Gregory Price <gourry@gourry.net>, Wenchao Hao <haowenchao22@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Kairui Song <ryncsn@gmail.com>, Joshua Hahn <joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 5:13=E2=80=AFPM Chris Li <chrisl@kernel.org> wrote:
>
> That is not what I have in mind. The example I have in mind is that
> zswap is charged to swap counters. Changing that behavior will break
> our current deployment and that of many other. Kairui give some
> example as well. That behavior should not change.

We already have a knob to select vswap. Users can turn it off
initially, and/or update their software to handle the transition
based on this knob.

Otherwise, you'd never be able to introduce any behavior into the
kernel. Hugetlb accounting/charging is a new behavior, and there were
softwares written before that assumed hugetlb usage is not charged. If
it's not a good argument to block the implementation of hugetlb
accounting then, it's not a good argument now.
