Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166EE5208B1
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789756751; cv=pass; b=Wpi1OGZfFo8I08yyUIpR/565StHlMGbfpN/59IeFXVK80PAtGQnsCmL+SNofdjsZKHj7+/qrYQEduZclXNdbYY/ZtIcftMrg3YYf1jM61CpMOIv76eciBGhnjScPKW1EJWtpiDeLSm/RrMIbK7PFhlmaIwNZfmTR4Qm+5Dg8UoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789756751; c=relaxed/simple;
	bh=5/PB84d/lutaFknFbosSYBSWvR23ySHWTldZ0AWxcbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T/imKIrYkghak3HRd/6++1NzG0ZOYxHGdZir8r6PJ+mVaO/0tdLP7O1kZVcX8fRNtYjxwcKUP0FMIX2zUM56NKFy7nP4/r1p7enzONuFhITI8Xz/DHPupEwauUHc9h80mIIYiZxAm+hDPu0+IkRBbkY6gjnKa04hJr5dnCGGzIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=obNnlZLY; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="obNnlZLY"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3920so7586375e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:39:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789756742; cv=none;
        d=google.com; s=arc-20260327;
        b=EA2tpRkPEioqO5/UIyxMdNcuboaMvyVAaDEHldEMWd1MqgPHR7k4A5Vc17cl2zQ1v2
         pQfy3y+QXjR5fmEHW9J0jM7HckCjiDbFFOjEvYKwkk66uc80ATuF+cq/rsj+CJcZc87h
         jnXlX89SJXBTN2s9ltIHNfqv4AHHe10cRJTtNLW+K2ZtalsYxB7q7HMrxLJrYk7l/4Bi
         wB1rTBqZcmY1V0pIZ7i9Qi0QSwt3ZHCvmRsaiYSWwsgepHdIU5T2+aEyTkB8hvp3W8Av
         Wwjo7sr1XnJF4H0SUaNWaVluh6q2ceoLudIMo2mHLYkEYYTxjBdy+YI6oQjIvHo0CY9+
         S0+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5/PB84d/lutaFknFbosSYBSWvR23ySHWTldZ0AWxcbo=;
        fh=61cMDKd1v4ekHxeHUp7rGatxYzziGjBOCnI14fQ0Vlg=;
        b=QXxj0gP6iyrnLaekFNT2N6jyYa0Q5N7KANTxxSmSOv44iA+Ah7HKWJ1dJTPpIOpLJA
         4tGdRdN+o7n1JIgWCwOoeAkQkMUH63tHEqt7Zgs9XGx6GX3//mLOIGBa4NKvBo10yqZr
         yHnRGb83h+Kl8aO0YFDjE3AzrzevtMS3/VQuSm+2Yg3ywU+FuDjuPG9CeKNag14RTgqK
         M33slJSoW2urIc5/04xkG3Mto7EsEg3EGQyFr4Aw8SvAD2z8A3FtdSvNdEjDqQlFWKLv
         JCuVPHJ7r5/yhyw8WZvsIsFJPvxdTYCMIKj84pJfgF4ejsc0O+8E2fgtJGAH5nOBxobv
         V31A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789756742; x=1790361542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5/PB84d/lutaFknFbosSYBSWvR23ySHWTldZ0AWxcbo=;
        b=obNnlZLYFJzew1YQyEBNBo+9UTNHWK5MkuSuP2SqOmDg+26iuoZGFb3EykwWF5tdu4
         0pClMybpon2TygWZD8dORAxN9WaHCYsehi9QZkV0Btnw4QQIMoeqyHX+jCuLOq5lYppq
         LI+Dwlzw+zhoakhNUFHqaSjIlv99xjSbre3bBvnCrcjUW3mrAvxaJ9xEpaRantOaj2Ic
         QNoi7t1PHOKesq7p6xit6jlISLxbLSU1iRCaTXAj80G4Mf3noff87p8eKaTrx6WjFebo
         tAnGA3SOv0ZnnA8KXQ3uYfeO9EqvplfbHqxDwi8bZ96TDck0KfYnC649OwJOQEmGgQie
         8obA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789756742; x=1790361542;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5/PB84d/lutaFknFbosSYBSWvR23ySHWTldZ0AWxcbo=;
        b=pbjmDLfCuR9Fg+sOAN+kn5B9nWCgKIV40UVR78MDR5sUGj/PiS20HBTe0ff7L1pxeI
         34/WUkdByFvq22YEv4BMilZ2wa7BqrGv6HWwGGe8c66NbUI1arw1J7JTQPcM+3hrfESm
         pjoBUlf+gRlD+BqFVNBV0l+kGmy3ED/S/WFbgATkFSyOjes1dpJqXc9931AUM1XwxOJN
         wh+sZw2QZ9Y9D8WcymZ+YO8HTPLz8/Qh35cEkHBEpJBJyV17D+niAcsmRVsgDtywydse
         RonWQ8ZfNiTZV5VEe18+JMfH4d6HK6tOjs5+DycEx4iD4MgV+DPhjV2N6MPHlmxsQ/jR
         Umyg==
X-Forwarded-Encrypted: i=1; AKwUvBy4eokD7WWAt6pm5APFofs9iWN3J3fjhxTQwHB4s+KdO7WHDq7NK2TKBjCgDayr/2h34x0CpCaJ2tYkvmY=@vger.kernel.org
X-Gm-Message-State: AFuF++kzc8bfOk4T9v2z0026Ff/Bk0IJqVr8TKZpIyaBn45wzChspkSI
	SCXiPOnvoEXSdoBJaQoFXiFCmJqtqKn1IeOx6I7a5Jk2Y8Efh13RDO9n4QHBuuhWSKq+65TBmOC
	GoejqRWey5i9+FAQ5v8rMXHvAA9LkR5s=
X-Gm-Gg: AYBFou1b5PARfmiCALyV44bLW5DJMFqmimLkdjYYAgMTYkGjOg9RI1E5Tw0Zd0CqNO1
	OdUPvkE/EVEMqF8ctl4Hb39EJjDH5xK7qV4XWDlfasDsDISwATM8ZLEirNo1656pqN6IKfhzSri
	fJXsc+L+W6lo50dremZBaf8bHIC6Tz4Mvn6kt59qyQHW4GAjVhxz8qXwHnG7aUgmichFhR7qEQu
	Wmym2Wjkpfs9a79AL2S8kKMiQCnf0im8y8VyPEiOsxQKabvRTDiwT3RN/L312IOdwIEbDIvcA+f
	SoJ+Ann5J73vN1GjWD3BgPC3MbxmIrMDZiwhZk076rLiMAndbI5TDlQLXZ/0u/t4RZkH81kO2Od
	vk4urC3ZnC68=
X-Received: by 2002:a05:600c:3f07:b0:49c:ee01:8c53 with SMTP id
 5b1f17b1804b1-49fc56713c5mr46641755e9.2.1789756742167; Fri, 18 Sep 2026
 11:39:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918180241.3424851-1-nphamcs@gmail.com>
In-Reply-To: <20260918180241.3424851-1-nphamcs@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 18 Sep 2026 11:38:50 -0700
X-Gm-Features: AcwNN1Wvf5cok67nfOV01MjLnEAhXsQL9tKGdT3-XrD1J_-pQ2FeWcoNTuL8dyQ
Message-ID: <CAKEwX=MO7JjfTQU4NP_L6Uepk_WL0jYBKEB1woK-8brvQqCT=g@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] Virtual Swap Space (Swap Table Edition)
To: akpm@linux-foundation.org
Cc: chrisl@kernel.org, kasong@tencent.com, hannes@cmpxchg.org, 
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev, 
	yosry@kernel.org, david@kernel.org, muchun.song@linux.dev, 
	shikemeng@huaweicloud.com, baoquan.he@linux.dev, baohua@kernel.org, 
	youngjun.park@lge.com, chengming.zhou@linux.dev, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	qi.zheng@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, riel@surriel.com, gourry@gourry.net, 
	haowenchao22@gmail.com, corbet@lwn.net, hughd@google.com, 
	baolin.wang@linux.alibaba.com, tj@kernel.org, mkoutny@suse.com, 
	skhan@linuxfoundation.org, kunwu.chan@linux.dev, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 11:02=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrot=
e:
>
> Patch 11 is an RFC. It swaps vswap's cluster xarray for the VM_SPARSE
> vmalloc array Baoquan He designed for xswap, to show that the data
> structure and the device model are separable: moving to his is one
> self-contained patch that adds no userspace interface. Note that
> per Baoquan's commentary (see [5]), I have skipped shrink for now, only
> freeing vtable when the cluster becomes free to minimize metadata
> overhead while keeping the skeleton in the free list. I have not done
> performance testing on this patch yet (the number is from the old design)=
,
> but I have run a suite of simple stress tests.
>
> It is adapted almost entirely from Baoquan's code (see [6]), so I have
> kept Baoquan's Co-developed-by and Signed-off-by tag.

To clarify a bit on the motivation of this exercise: Kairui and
Baoquan raised the concerns (for e.g in [1]) that if we were to go
with the xarray as a data structure first, switching it to the
VM_SPARSE vmalloc array would be difficult. I want to check this claim
by prototyping such a conversion. It is fairly straightforward and
simple to me. So it is not a valid concern to block the landing of
vswap.

If we are to actually switch to such a data structure, Baoquan should
be the one driving this, by showing that there are performance wins to
the switch :) It is his proposal, so the onus is on him to drive it to
completion. I'm happy to assist with the reviewing and testing!

[1]: https://lore.kernel.org/all/CAMgjq7AHRzBsbmGOx0s=3DTQFBwcn=3DDEU1naR44=
3sO6x+pJd6hAg@mail.gmail.com/
