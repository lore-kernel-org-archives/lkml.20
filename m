Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792458134;
	b=PRG4WLuvKKHekAp+HNKTxq87fPCDuoWv7hNk+9bApYF5Gi8QerABD5Nb0Gu+a9kcW2Mi
	 zJu1Glb7w1od8lRZiqbOgvEtJEajSxfsFJTU/zMVV+iYg3aavIRF/l+Z09zSzpLxyrb+G
	 yujwDJSGWtCiVWyIpx5eMWgbiexRhIo1e/0f8iFJVcSNq8UE4l0O5bBLkil3x6NKmVQLu
	 OnulbErmIvTlv4YcmdJPFmvnP6e26FkBQiuK+PzPgsOqrSQXReWCuFeVcOWx8sF0CHSeK
	 hjbIEQSxINqrqh0MjcohMkec6CUlq2zIP66nNNGUP14FNTXrPoxbZWo+e03G72OgZHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792458134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=B/WVBOtkMP6M1xXLJUzfcGRzgTR4eIpAO+QQLGvxAdw=;
	b=CDZI8kApruTbDyfVwOVG/LM+kyFH4CkgYiwajp6LKf1AJ1JnZJtOMjqv0162xBvzda0Q
	 hgkNiNsRvsOBHxiJ61MZ4ml2/QySSZIxWJR+b1Xazh9TkbsCaW5IhRkxKW8kNFAF938bn
	 RNN02NN6mGqUBgEAG7N2CswFpGDgJwSiPOmf6DCVfewOdhKzvtH0sW1phwAReNdsoFXzN
	 pIT4dbqIfJOe45SyH4yTeWBRtru2tx4y65xIp2Lek116C2aY5RJsxKQ7ojmtieSOl6xD8
	 c3oQsh/dOfDYs+DCRpvyPbpxKPR/R8hO4ghznA9tqEblChv+Phl8OlwP3n+fDwuXtRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gH25syzu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C31C606A323
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C31C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gH25syzu
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8565d77c277so19777347b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:02:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792458133; cv=none;
        d=google.com; s=arc-20260327;
        b=a3uEZKaQq4EDj1+kB96qQTr9GS6NXEgXn512hfpcDeg5cjn2IGqq87o+lxbEeWAD2n
         Z7CnS5erA/AbYCJbCTlS4drvvG7Cqv/dAXlKC6qzminnR1RBrVLNvP3DqCPk7WvT0qKt
         5Qot1XuOZCDw9Lh4k5uy0tkj9mRjp0s2qrOkOGtAmGNKsJC+2/kDxU0HWQ/4ygeOnmUi
         dDzTZjdAQQbbrq+yvRCeiVKI8IzDZ97hCYmudzM1aPIfpwHRKHKZPEsT2iMzGhl4VxUG
         cpSICmh8Avo33kSpXwTDVfylX31vqw837EXzcGdlfijk2CiTV3b1QDyO9ABXUVZnV5pw
         kI+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B/WVBOtkMP6M1xXLJUzfcGRzgTR4eIpAO+QQLGvxAdw=;
        fh=0QWy+Vz854869r+RwfXvN0jf/x+xoI6ow/2a9vS4Bq0=;
        b=g0+M2MG/3pUtKIUViVC8eFEAENblilkmOzZfc9trRUyUrWKCohE2G0MRFFMXf+X9Jl
         XIQrkOwiSfC2aXbTbNnfLLbVszkF6CWClRcFn7ctqy4xMu3vfjdbyqgCkSAgKcvm9cHJ
         zMJROoZGHWC2deq4eXvYApJgmMBMAqs37OonONCdwUFN8X/bOJWQAMXyKQmeAq4d85Bt
         eSaEYR56SivlxeJK1KzUz6eT1I+8h43SsCWkaMBnBoJwBipBNhDyHBSkUgIikazROOqT
         +shn8jC4UyRr2Cx2g0Zhs1UWOEjia7N/lD+BCa/DPz06m1Gq1APzw7yTN+BalWU1fR/X
         BNVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792458133; x=1793062933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B/WVBOtkMP6M1xXLJUzfcGRzgTR4eIpAO+QQLGvxAdw=;
        b=gH25syzuggQs+bSMqDvkNi4lUdbQvCsLZqS3Zt1blZ4gsOSKiufEvf7ZH2GOmNlNqo
         C640sWZH5g5eZQxh2WkCLOYKmhU3CqVCmcmag7pWq+1B27e+D2CNKNEFNyGKMHFC4mVQ
         49xc81Shu2hPVHepsK7tEwY+VgX3RjSkJHmd8v19785v41ajyHlU4pgRR0DJXIAYEijK
         LlzRUdYo3lYcmwIslSDVbG1E6v1lLzPLdXsQuW+giA3sq5hOZxx/8ukkHAVSrFRL/ZlN
         GsSATJrvNaG6PDWzEeEa2UZUhAfWMtV8Oce5Yeem0cGChfxRyn7ULEeCa3wflSus/46q
         9hag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792458133; x=1793062933;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B/WVBOtkMP6M1xXLJUzfcGRzgTR4eIpAO+QQLGvxAdw=;
        b=UBuEODiUgMAXiHeBufXHQZDvZLjC8YDjF248eTo4ocvofTY7oQgscG1lZjZHx/sUCZ
         FJg9Isb3fJ/u70fi4uYamYPVG6PDJYoLJy6VbgbngWXbacCYX6+Z3KYmIWf85+qODR2E
         didO4Zj6fl2kd58dJ3iWZVPx2YZuncvu9OFWNYCyWJzcWHAvZYc7gVhALR8ek2rR47As
         ey7tTRav44OoWhdSPwX+WC6kRMTL1AlfznTUGmylZjpgs32Q5kaEqKKM9c1JJNuV3LvQ
         w3KEd4GGFkvFniqi/iYp/uEuEJf6DmXZG5q07r/RuOjgrvt72LadVTGgdiv8C3zY2NVg
         /LeQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5/HJayXEUM9I7XntWV6sHiV/So/06snJ0EipLo+7Kb7Q8rS1xRRABweXMzopCB9uGs5sdHhOnezmiwpc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIGTjGUrANS/tCx16K1a6cSqIHaym2WCZBVtakB8Mf+q+SFV43
	W5Y+y+x3jmkyf2tnClBHcUhPOxFfBsSWNA9clJ9Ssm2jBU1bUVVn9GT0tcwJH4x3cEaG47tuXce
	QpZqD2JQVszURtugC46ISgxb1j/l1nJg=
X-Gm-Gg: AYBFou2OIFvP5Lw9IKsJyHNZEaELZ4AmSGJ2oRA6qog1mpPm/MOWYw3R4oLSoa/J3Ou
	C4U/khajlGddImA3TjwiI4pHx1TH4lmMsrtO1NFbNqG//SdM+TsHOdwH6dA2B2+33aFw7ims/JK
	yq7X6cFBwu0HPknV0yaUmm8j/wD6MlHc52FT48bWOVB5ryervp7oNZBwzIdym9bwhdx50JcqWso
	phj+l3tcu4CPIK2r3FLAeEtidiyGNnt9iHtjl4kvLcoJd1AqPiZARWJMbtmSBpOn8JmnpUa6mr7
	HttPo+EpukeiLaM/x3Z3ZnkuWo/yogVHZb+pDg4SoMUuvd9bprkwM13QV+NCr3qlXph0CJKgWnR
	gl3oD0cWxGhHf2K1r6QGeaI+dyhqjrA/all1AomYUC5PuMyxHMDMMi2iuvL+WiLiwoRLhtqRDs6
	9vP+R2ZybN7bCFxYCXxWupk5sZO+R4HMyARw==
X-Received: by 2002:a05:690c:5687:b0:864:6f4d:ef7f with SMTP id
 00721157ae682-8b0f2072b1dmr27038117b3.7.1792458133104; Mon, 19 Oct 2026
 18:02:13 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017050928.128582-1-sidchintamaneni@gmail.com>
 <20261017050928.128582-2-sidchintamaneni@gmail.com> <CAGsJ_4wGq9oc05=-g4aWptLdCbTwUjMjXk4Rd6KjJ6x=tzMm+g@mail.gmail.com>
 <CAE5sdEhGFtGF6LC4xNkMwGj3vTxLOW=GNBXnk3-JmsgjntXx0Q@mail.gmail.com>
 <CAGsJ_4wmvBvEn_vXu8-c6BRAnRewYmTs8iUd8T7KRx7_svZrwg@mail.gmail.com>
 <CAE5sdEiq3bY1kgMUQ6x7RRJCx0JH4sQ9Z_a9_YQSM5FKNwpk8A@mail.gmail.com> <CAGsJ_4yZ3rueVMaRJ_+25Nnab0WH5ZLQeLjporWAFj7xJnJFHA@mail.gmail.com>
In-Reply-To: <CAGsJ_4yZ3rueVMaRJ_+25Nnab0WH5ZLQeLjporWAFj7xJnJFHA@mail.gmail.com>
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Date: Mon, 19 Oct 2026 18:02:01 -0700
X-Gm-Features: AclHuK_oIVGKOtgd9hzF8OI86eJwFkNPW92AAHzmGdzCl9JR3GH39OUDY1L-Ci0
Message-ID: <CAE5sdEjFgVoQbWw12=+AKdCOB9cWm-akxzbX7hJzvyO3vpCtgw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mm: multi-gen LRU: fix NULL lruvec->pgdat deref in get_lruvec()
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, david@kernel.org, 
	mhocko@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev, ljs@kernel.org, 
	kasong@tencent.com, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, 
	yuzhao@google.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	apais@microsoft.com, rlmenge@gmail.com, stable@vger.kernel.org, 
	Hardik Garg <hargar@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 19 Oct 2026 at 17:43, Barry Song <baohua@kernel.org> wrote:
>
> On Tue, Oct 20, 2026 at 8:16=E2=80=AFAM Siddharth Chintamaneni
> <sidchintamaneni@gmail.com> wrote:
> >
> > On Mon, 19 Oct 2026 at 16:36, Barry Song <baohua@kernel.org> wrote:
> > >
> > > On Tue, Oct 20, 2026 at 4:33=E2=80=AFAM Siddharth Chintamaneni
> > > <sidchintamaneni@gmail.com> wrote:
> > > >
> > > > On Sun, 18 Oct 2026 at 14:24, Barry Song <baohua@kernel.org> wrote:
> > > > >
> > > > > On Sat, Oct 17, 2026 at 1:09=E2=80=AFPM Siddharth Chintamaneni
> > > > > <sidchintamaneni@gmail.com> wrote:
> > > > > >
> > > > > > Andrew Morton reported that get_lruvec() has the same problem a=
s
> > > > > > lru_gen_shrink_node(): when memcg is disabled on the command li=
ne
> > > > > > (cgroup_disable=3Dmemory), it returns &pgdat->__lruvec directly=
 and so
> > > > > > bypasses the initialization of lruvec->pgdat. The MGLRU debugfs
> > > > > > interface calls get_lruvec(), then dereferences the pgdat point=
er in
> > > > > > lru_gen_seq_show() and other paths, so these can hit the same N=
ULL
> > > > > > dereference.
> > > > >
> > > > > So userspace must have booted, since otherwise we couldn't read
> > > > > debugfs. The reachable case is therefore a memory node with no
> > > > > LRU folios when debugfs is read? So this could happen on a multi-=
node
> > > > > system where folios are landed on other nodes but not on this nod=
e?
> > > > >
> > > >
> > > > That is my high level understanding. I'll let Andrew to comment if =
I
> > > > am missing something,
> > > >
> > >
> > > I made a silly toy setup by running two numa nodes with one of them h=
as only 4KB
> > > memory, the other one has 1G-4K:
> > >
> > > qemu-system-aarch64 -M virt,gic-version=3D3,mte=3Doff -cpu cortex-a53=
 -nographic \
> > > -smp 4 \
> > > -m 1G \
> > > -object memory-backend-ram,id=3Dram0,size=3D1048572K \
> > > -object memory-backend-ram,id=3Dram1,size=3D4K \
> > > -numa node,nodeid=3D0,memdev=3Dram0,cpus=3D0-1 \
> > > -numa node,nodeid=3D1,memdev=3Dram1,cpus=3D2-3 \
> > >   -kernel arch/arm64/boot/Image \
> > >  -nographic -append "cgroup_disable=3Dmemory
> > > ...
> > >
> > > Then I got a machine where node1 is very difficult to have a page in =
lru.
> > >
> > > then i ran the debugfs for mglru:
> > >
> > > / # cat /sys/kernel/debug/lru_gen
> > > memcg 0
> > >  node     0
> > >           0      14972          0         953
> > >           1      14972          0           1
> > >           2      14972         18        3308
> > >           3      14972          0           0
> > >  node     1
> > >           0      14972          0           0
> > >           1      14972          0           0
> > >           2      14972          0           0
> > >           3      14972          0           0
> > >
> > > now you see node 1 has no page in lru but yet i didn't have any crash=
.
> > >
> > > i think i will need more time to figure out what is the problem and h=
ow to
> > > reproduce it.
> >
> > I've asked AI to repro the issue with the similar setup
> >
> > qemu-system-aarch64 -M virt,gic-version=3D3,mte=3Doff -cpu cortex-a53 -=
nographic \
> >   -smp 4 -m 1G \
> >   -object memory-backend-ram,id=3Dram0,size=3D1048512K \
> >   -object memory-backend-ram,id=3Dram1,size=3D64K \
> >   -numa node,nodeid=3D0,memdev=3Dram0,cpus=3D0-1 \
> >   -numa node,nodeid=3D1,memdev=3Dram1,cpus=3D2-3 \
> >   -kernel "$KERNEL" \
> >   -initrd "$INITRD" \
> >   -no-reboot \
> >   -append "console=3DttyAMA0 cgroup_disable=3Dmemory
> > initcall_blacklist=3Dkswapd_init panic=3D-1"
> >
> > and it was able to repo it. AI identified that kswapd is initializing
> > the pgdat during boot, so blacklisting kswap_init was able to repro
> > the crash when reading /sys/kernel/debug/lru_gen
>
> Thanks!
> I guess you mean the following:
>
> -module_init(kswapd_init)
> +//module_init(kswapd_init)
>
> Yes, I can reproduce it with the above as well.
>
> But kswapd_init() is definitely called before we enter userspace,
> so this doesn't seem to be an issue here?
>

Looking at the callee sites of get_lruvec, all of them happen after
boot. So it should be fine. Anyway code clean up will address the
issue.

> So I feel there is no bug here, but this cleanup is still welcome.

Are you ok with the patch as is, or would you recommend  changing the
callsite of get_lruvec to mem_cgroup_lruvec?

> Am I missing any other scenarios?
>
> Best Regards
> Barry
