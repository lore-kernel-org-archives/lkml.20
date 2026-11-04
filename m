Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793770175;
	b=Awuh43pQZitYPQ35TE4jmlnirA1Xo3O3jamRlLlizSX4TNa3LXnf5+1bouErNpDZXgi2
	 yF9jOhenLT/vV7kG0mI5yS09BiePNQJolgGTmdaPLwl7HGHd6oMewI2Ir5iJr64RLCaDi
	 Fg7XKD3DEj41/WJ1K61yfu1MsTibNSlsPiOYHjfvFhuVRAZXzwJBVPx82a0zqc1hpzuta
	 nWuQ10o65U79wgUZXeFbDyToSfpFn9L3w3Z7ap2//iwyDcEbKIhwjL2PKEWWla8mxNb3O
	 QxHrh1GNCXG1mQJIbGwBiIGeC/MeA0EAHTO+/FFsHWoWzVHS5N19AwybY7wq7STJDPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793770175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cZhQHFa3fDIYYUFeduNwTqrhejieaNOw9vQ/LVe4bqc=;
	b=oDpef0o29MmD/SfJT5VRLe9CqNKsaPKYL6QfsrzVaRw1YXFEoi8+/kCMjITHOdwdkU/F
	 XgXkzWeY+WYSzgAU1Leh4ok/UMKpoag9vaVTn8saHLd6aRYNbB8Dd6hjvCz0eoidRDbsA
	 dUgaRo+W8mnS3Pz22uCGJRNrvK4G757ua7Vylo2R1xU2PTgokSFi4kGJmtXSGzycrlWe1
	 m4oqKWm40e4/CiFlm7OfOmusHyr5uIRvqe0U3BvKmDuKtrFUfS9yUOFdLM9K8T67PZY+b
	 srxXY2slOpJBPfgNTAhAFnI79J6c4l1CSAOnMndY47YE6yc6CG9v06RWzUeM0UBiUqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=DM0AV0nR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477B9606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 05:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 477B9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=DM0AV0nR
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4395d31228so45352466b.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 21:29:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793770173; cv=none;
        d=google.com; s=arc-20260327;
        b=FgxV51qAePv5tAcwxTurxBKqVGQj5/2TAHdOG9VLk6Bjgw1q4/jcy4vZjLHmOXUjcX
         DYzChuNWZj/NL2AOREQjCCnacI69WfFmagYtY/CyJ0sTIhrgzYiODjYdrufVlE0K9j2/
         0j/RIkFlUBfDDl9cMmd+5ZCCrx2tvRSfw19q2+tUFBED7mVAKPdoJNib2jvFdjDjTY9x
         wIu9JODx1KplAod7titHuXu5yZVcMIQZ+k0KJ2018gmIIulpSbVwSrDOYBK+xucnPi/a
         zOJA5iLWsBwNiK3EiIFJY49tOYV3DZLwuzM41253piMzV/F4/AE9CAIgVR2HX4o6jW3S
         eZuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cZhQHFa3fDIYYUFeduNwTqrhejieaNOw9vQ/LVe4bqc=;
        fh=WNlXumUSoZ5vhOlx5EjPUSQwPZmUhu+9pSys4Vbq5co=;
        b=CncgpmRX0/u9tQKmJg14uir9fj1MY0ZyZ+fgaJIRcU14TqvI9XpxAyZQA+ZP7gcDup
         OgheAyAa34aqepy0Jo/NL3SOm0CEJjXNovmS7gHpBNUeZW4ZHTKymHVFIEYtPvTr+gkX
         Jj8iM3Jqj10+eYFZM8vPAtfC5VjtbC5qBNw8a4c7FE7++viSubP5OBV7pkVgj7v70+mk
         agVLd8fVMYuhNU9IslafmxWNYILhDTL0oF5jrIUc9MLillo8cNdpXxd7rzbXLcXlAwgY
         iq4JxTrxDJhVFIDiBcOs1i5qW2J7PXkWk7uayfF6mlTM5PSEq6ovkSugQvphI7DSJYPA
         EiIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1793770173; x=1794374973; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cZhQHFa3fDIYYUFeduNwTqrhejieaNOw9vQ/LVe4bqc=;
        b=DM0AV0nR1BQA1P628Ldhvee2oaahZdOYA41MY0kthaIFX8ItSKnuUbPYPordN7Rhhv
         7RavjYmkHbKJaolJWCWy7JCck5RN83uyUWRBVB+jtOYrAEWR48gWoe9nryCfs7ljeT9i
         U64lUH24PFncHMDevpMzEOBp+yFm7h/NWItiD/hZxHQXf3Y70OWU4d/w2RQnJKF5adYT
         c/iPdVD8t6Zhy5tC39vz6u6n/I1oRkqXC+C5ExcKoohZbonOUaFw024ucQYIgLT365Nz
         OYjBuBtU15rlAkJbNY+tlc3hylia9xY8rfYGTK7WEtclpdQN/gov7OwFIsqeXW8pHOrE
         3fKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793770173; x=1794374973;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cZhQHFa3fDIYYUFeduNwTqrhejieaNOw9vQ/LVe4bqc=;
        b=KiXXnJZB3VRaCwouRtizfF28XiITeiJzCtt5su0gvm+9H7vP3Rn1heIffHU/z2G/xa
         nj8EGx+14OVGk2AHDaskj0DDaY7HmrFKYhoSbq//87Zj055CV3+Tilg8+fckQvPnmWVU
         d6D0tkPsGtMAkApkoED1toEYxoA14d+RAxYpdptx9xvzI8Wpje/DmJysay3bOToGZqRM
         1iwQcc4rhozgJuKXf6NlPAorwrrtMotrlBJgTugmFdj4VmCZrR/A4EdHErdZSpvCHEF/
         6uKBMsDdWnt5cjBmUU240FQ+gE38mQFkgAzLAZ0KX8zwGv1yTLg6uqlmdo23HekQeBCV
         sRyg==
X-Forwarded-Encrypted: i=1; AKwUvBwiNkrJGVC8f3+tAC6psBkwzxnwtI5j8qDZu94yZFLxvYXozbqkb1evcvMMcN6fXBZgap1sGYwJ/bPrfU8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nEZcXjAkfjOoB4WXQhc6HyDpvi4kPFOV35XFCvZAhY3hUois3
	0rZ1/rqeZi6ryMyMFw01Q6EWDGe/cD1dVaQlWCxEtekhp4KL8m0bksDiLia98zvyDqZOBS5LnkB
	VVUmAj5XfNGH/zvwC3orkUWgZdz+DPRkMn93FoOgr2g==
X-Gm-Gg: AYBFou0EYXb5Y7JzXlxdir6GgMuQAUHuARoVJDlCFcqwaLLCUUJTje/+IGoOEoTSeKS
	aM25bYBtO1PfBtlg8paOZNkmzQnkxiG5qdIdTpipne+uXv1IIh4ZqaFGAecF9tdbUbkLOh+njj6
	BSwRTZExJja6+nFHfrVCg5mXkNS3G/jDVpD4aFaq9zHuh8p0rMgSsCQflRvnbjl8onXfwWNeuzv
	ZMvF4faCAl9NI7/zpClPb8Fy0WL93tyTuKkybYjvidHaMJfQXRi89+tMl1LGAO/VdiMg7Lmxwe5
	AEpp0tNODswHukDdR33sr5khiAgEGCI1ULt7S11d33+0HbqBX7ZODd6wiSulqf+KVr58/7AKfU4
	nHsuLGdFbbU1grCgTQX600IV4y60qaNH5ckBuKF74G2tgH6p65w3zD14xhZWpBXGbrA==
X-Received: by 2002:a17:906:dc95:b0:c46:2987:2169 with SMTP id
 a640c23a62f3a-c4ca7a4f156mr1344359266b.24.1793770172638; Tue, 03 Nov 2026
 21:29:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103113711.1832834-1-max.kellermann@ionos.com>
 <20261103113711.1832834-3-max.kellermann@ionos.com> <CAGsJ_4wYYiHvDj4Bqbp_hg1H9-WsZvEBJ9h5eNdX-Kuib_f3DQ@mail.gmail.com>
In-Reply-To: <CAGsJ_4wYYiHvDj4Bqbp_hg1H9-WsZvEBJ9h5eNdX-Kuib_f3DQ@mail.gmail.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Wed, 4 Nov 2026 06:29:21 +0100
X-Gm-Features: AclHuK-8AA5Oj5_0e3X9V5IdkisojDeCpVwYIMpIa2E1dyyt14UIk9YqekGGG90
Message-ID: <CAKPOu+-BArn2FDfOWthdJHHbkeEBVAZ9z29XRT88tiXYO9rmHw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] mm/vmscan: move code to lru_gen_{add,del}_memcg()
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, kasong@tencent.com, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, hannes@cmpxchg.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 4:22=E2=80=AFAM Barry Song <baohua@kernel.org> wrote=
:
> Also, MEMCG_LRU_OLD has been removed as I replied to you in v1[2]

Oh, I rebased on linus/master and not mm-text.  I saw MEMCG_LRU_HEAD
was removed there which caused a rebase conflict, and thought your
mention of removing MEMCG_LRU_OLD was a mixup on your side, but it was
really me.  I'll post v3 (as soon as I have figured out the rest of
your reviews).

--=20
Max Kellermann
Principal Architect
Hosting Technology

cm4all | Im Mediapark 6a | 50670 K=C3=B6ln | Germany
General information about the company can be found here:
https://www.cm4all.com/impressum
A member of the IONOS Group
