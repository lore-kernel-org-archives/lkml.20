Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794486812;
	b=NQbGdfnK382MIdxbWADcy/TOu89Lsz6VAeoJ5Uz8pw9rliURIPatiCaXh12lynXS8UV+
	 1Sk4Ar+DtbyhqiMMbuSI5iOMakGbeDsnIfwnOUvobIaFhdzkXmjFhVo+ja2xheEh2ZIrK
	 QMcPM/wrMSdHSt6H+TkFN4xX7w+E+pMqu3KF4j4evoUM8SzjwueNH9aWPUY6uvPWhEaiG
	 8+lLT2qOpQjJR6lMJlzEoVBuCJEdn3GhkzWIOHMOtiMVkJaWikH4l5ehfjVF6+xxmnR+6
	 kEt7yFKlL925Z3Z7Mq67fjQt31EeP4fAGWQvm+zi6poi517ZFwB+sRNZOPbKf6GssbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=J3TZhCQIYhGC4591WyZya/dZFHVv+pLRhRtDYsixm+Y=;
	b=C1ZH4sc/O5mi9Mqf+EhRBcnI8SiN6Vt3Z1HL4YqWcW+tacJ+3IuJBWnGzjdw1jH+lFAE
	 H7gkdO9SBwnrRRku+cckbh0Bf224KqtJYKHDgwGeX2xFhyvSPXoxXjcf6zrSImZapahsc
	 ziircVC+IlfdQPnls//StdnVwD9IhijLioB9AIIeOtmU/k+IZmZvqGZALfVHXQe8+z0GV
	 pDKMdi8yQO10SQAsv5YcTcgwIA/FLxeir/STxYveWSfKwjN+632d4FIJTPzQHQWy0tQxr
	 l9AAPAwKTJrh1q3ssh7+qWxXLOsPgetI+aMFDbRluUdnY/sZr6BpJHEDEnpIxEXBdpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LX8QNRU5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BD4606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2BD4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LX8QNRU5
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b633ddfad6so5607593a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:33:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794486810; cv=none;
        d=google.com; s=arc-20260327;
        b=kuTl3Vt1Ib0I+bQQUi/Yazjylkj1zRzyp3opo3VQaZbByFTQjq6k2EPe2OKHvrjFBj
         nqafk7BkYuFsv2oSWGP3abnhHBfHOK7FlDis8KPKaYPI7z/OoF+EZ3JQqMe9b8GqtOJ3
         JALbtwhV4Jd6IkmTtzSK+cWogzDW384ptrDr73fEs0/WE5dTQ/OL24uP/sR33dHVP7nw
         SLF2g35kaU3GKyjwQW2vAx10TTTWiTGNLder/Zqudarpd+VjjfWJIZ6gBLRIueUdUS9N
         wYdmDwSDnPeB7HvNZA11QJcpNdzQgqLZGuS27bu26EaTFO0zza4Mz4KXwo8H1B9SQbSg
         Nfsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J3TZhCQIYhGC4591WyZya/dZFHVv+pLRhRtDYsixm+Y=;
        fh=vLXztacBSP/QUnVKVUErpxcp5zxO3FN3/iFYS1WtTyE=;
        b=QC5QgQ+QJ7SyI6L0zQ1z8H2U4p62XrvvKCecxYwIc5kVg95ZkLt/E4YrxeMDzi+4HX
         AWnPTc6Vs2pt1g75ChWaBnQan4n/tyoM/H/ke4WcGHAr55d1xEXKbz6FROgHLlzdPyAU
         VoVNdh/+A2W7ybEqPltBuJpxqB981JsgGuzbu7uHSlcuH4t9LmB1mtTcxtg+2c5amLsE
         q5mnhDnQtmvDHAS0toPGShqtEoL/s92uk2z7umOR3yZBHryxiNTWtqAa/lbWrzj6x7Qn
         Chqh4LHHAriKeGfAEK+UI/Pd5nnWvzKSurInlAPjDB6q2RQVdoqB+7qiNCw6WcqVI0nU
         Xiag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794486810; x=1795091610; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J3TZhCQIYhGC4591WyZya/dZFHVv+pLRhRtDYsixm+Y=;
        b=LX8QNRU5+EkJy1xN1BfxESRUZRxdYrEvHOhIj5oXwLpwbbV2NLiEpbHrgRAHHatU9h
         vbTDE33CEfzhAAHQLURfE9xIZ1aHLFIkFqayDylE5bi0lNePtPK7Nq/D4HPvYUzK5sqJ
         n9jolYH3kUXedRfo49UVYL8ZvbGm4ZxtSe50657sU77/k8ODpdlcCgK3sX5SLReJXBd5
         Ea70/uDLW151WDITECef7p7aa30Fw+J9PXOBp/PuatsU1UlSpgIJj3c6NopawuDwr7cY
         S22BO/HIyT4Qbvln6nBnfOQULoK2mge7hhPwcZ3pkeFuP409ajnKW31dcJnpEBO8SFNS
         EwOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794486810; x=1795091610;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J3TZhCQIYhGC4591WyZya/dZFHVv+pLRhRtDYsixm+Y=;
        b=Xgm1WaNGp/KAB98er3JKu/TtX6GlHiX7l5713AAZekC2Lul3dj7xg8HXSg8z9NdhqV
         Nuj8NhDl5uSAoxn30GvE8Ar9YdkrGAUGsXl08923sKA1cb5sdamCvDBHqFaJ/xymEnt+
         m4RgL2Hn4rdNcSQ4/8f7bdexv34vVgRZ1gL5VzF5thFE9W5gezzg5lK3ZMgIUCZ9OfrX
         PtqGyi+wIdRUPlMvn1b0mQi9T3J96LkdDYq8l688aibmvb9tJ1ZGQ02YVXZpl2eHSgdI
         mxDkP9xbIU8BchXakqus9w9yiWC0CpYSuFD5L6nBMe6YBchgjHRUXqO6SNH8xlHkN9bB
         /4Fg==
X-Forwarded-Encrypted: i=1; AL+hErFC+TWujUFIlzHX7dPzz5+tIa4l0Xy1c/gQtdB1yqu3hnVnwPPs+GdeJXt9GJa7+PkHA6cBvSKFW9CviLk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/D/CrByuTfpS6fCcc0yAzwE+FP13g8i4Fw5zG1hdV9nmeokclr
	7AMZq6AQML3LzTBGPU9SKzCG7f2NLoQGdvAetTvxy19KY8ua4PGiM9b9I7EmAMARHHuWPQ+QPD+
	nC6e/JrNbfB7sAz00ni0xj4CPYyY4aTo=
X-Gm-Gg: AYBFou2vanNIdZeUeLWw7860uVAYVtY60+f9fsbZSJFxVU7KrYE50XB6nl9POcv9Gil
	KcDbiAV7CTrILS8U23ZQ4MN9cWK7b3FWMBeQsQl8Q1cBNtHgTJLhpN9UajcukDPt2mmLXKEfJAR
	mJ/sm6Z0tNa5RbxBvKKb3f8NMGdRvVQEQf/SIjgqpjYqyQQJnase4vrGmIpiW89snCtGRi4sIEy
	B7PlpnBu+tH6cjBr485uSO9ikK3WRnlKkHUDrROBzGCR4qf8eq0t3bYZs3lUq6EeGnqZi5Zqtvw
	C61A6YlTMWxB9wExHUjzTv+9kpxfF+nWU9LK5IGcbkdJV3Z+1XMM2ANSXtzBgn+p+TqUnfpWWDL
	7Sf+9m/wpEqvaFWArOZsdMK0hdrciKj1bv3oS7g==
X-Received: by 2002:a05:6402:2745:b0:6b7:675e:7a2f with SMTP id
 4fb4d7f45d1cf-6b77733a486mr4265671a12.1.1794486809988; Thu, 12 Nov 2026
 04:33:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109030805.25709-1-mc@raidlab.org> <20261112122127.190285-2-mc@raidlab.org>
In-Reply-To: <20261112122127.190285-2-mc@raidlab.org>
From: Anton Gavriliuk <antosha20xx@gmail.com>
Date: Thu, 12 Nov 2026 14:33:18 +0200
X-Gm-Features: AclHuK_MbQjLj10xCrM2NNFFkxEiEBFEpCNPgaDm5f2N80NILNDb9-2TU7lmKic
Message-ID: <CAAiJnjqrRo-75jg_Jrr0x2r85kY2g6_ZSH+8ukyJJ5UXyMb6pA@mail.gmail.com>
Subject: Re: [PATCH] raid6: use normal stores in the x86 x4 xor_syndrome functions
To: Miroslav Cimerman <mc@raidlab.org>
Cc: song@kernel.org, yukuai@fygo.io, akpm@linux-foundation.org, 
	ardb@kernel.org, ebiggers@kernel.org, linux-kernel@vger.kernel.org, 
	linux-raid@vger.kernel.org, magiclinan@didiglobal.com, xiao@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested-by: Anton Gavriliuk <antosha20xx@gmail.com>

=D1=87=D1=82, 12 =D0=BD=D0=BE=D1=8F=D0=B1. 2026=E2=80=AF=D0=B3. =D0=B2 14:2=
3, Miroslav Cimerman <mc@raidlab.org>:
>
> Anton Gavriliuk tested the patch on Zen 5 (thread "xor_gen() md-raid6
> performance improvement"):
>
> HPE DL345 Gen11, AMD EPYC 9455, 6x PCIe 5.0 NVMe (CM7-V 3.2 TB),
> Fedora 45 config, v7.4-rc2 with and without the patch, both kernels
> select avx512x4. RAID-6 4+2, chunk 512K, no bitmap, rmw_level=3D2,
> fio 4k randwrite, O_DIRECT, io_uring, 60 s, 3 runs per kernel:
>
>   md defaults, 1 job x QD64:
>     without  127k / 122k / 125k IOPS  (mean 124.7k)
>     with     132k / 139k / 137k IOPS  (mean 136.0k)    +9.1%
>     (a repeat run a day later: 127k without, 135k with)
>
>   group_thread_cnt=3D8, stripe_cache_size=3D32768, 16 jobs x QD64:
>     without  467k / 468k / 470k IOPS  (mean 468.3k)
>     with     473k / 471k / 471k IOPS  (mean 471.7k)    +0.7%
>
> With md's defaults one md thread does the stripe work for all writes
> and is busy most of the time (about 80% in top), so a cheaper
> xor_syndrome() shows up in IOPS. With 8 workers per node the limit is
> lock contention in md instead (on my machine most of the time goes to
> spinning on device_lock), so the saving hardly shows.
>
> Miroslav
