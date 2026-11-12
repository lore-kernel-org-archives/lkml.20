Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794524823;
	b=CZB9w4/7iaM3FskeJMPl827vhrbJmUtGlv+655caXq9hpNBVre1Lrdmxcfo0YsEUYNCA
	 L+JZc+o/zhaHNMzonArAawrEVm5K/RYFRf9m+My8KG/izHHRcZoGeIvyGdrVxfctDDZDQ
	 B9RTz3oMvgYyn+gFqznRsECGknZ2W+GYw1eT0HFQj0t4LythI6vWJv988d5x7bAdixJN+
	 sZbx95koDdCjPfIDWbKpJfLS9bAwGyEOrrUyXjAeXEUIMNCAvng0evxymgHhepfPNsOPk
	 hzD9UCPF7m+bAeAloccsJrsqIHAUVfuDGwbvQWqTb538hDXxPH569K9PdedKqR2qNXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524823;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iq7zuX4mescGycMYtdVsnHt3n8ea5BUsLeUaRpIODWM=;
	b=iP+p10nUyz7UyLLG5hx7+0EIxCJTgIV4HtHEdtfXuxaHbpRJ3ux9VhMOFPQ2wWNodZe/
	 y7pZ2MrwP/Pv7Pb7/pSPHpTkFKItY/I/rUnmdhHh3WNUJUSjl8Gw+7A9jBoucviMfY2zU
	 PB29oZGWzEJtc0f0tbhBjIcqKhOt7hMfz+hbcvxNDasuKaz7PeMU+hlfnIDvtTqTAisnt
	 UY1FatYhz2isBbKe2/EF35CL5rJ+7Tst77TgB9SB1mVplKqnpO8ux+4ua+ZCF9an6MILH
	 E7bEat0d3wJJenQAy5K+bZlXrQ6TzPtMPtfVlPHvKgD1WRhQz8Db59Bg33aXG9s4IKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=irICtOrg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27A9606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F27A9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=irICtOrg
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-54492d8a988so18311cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:07:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794524822; cv=none;
        d=google.com; s=arc-20260327;
        b=HwxlSgMHhZKPLKqcXdei6w9xF8vT5xI7Zm6xHUU0qHfJEU/HWprU0nc4I4bYU+9oEG
         U2CMp2352VJT3sxIvvkdRiN8lDBFhQcuSH07UWVdhiY61ZqeusnpA9uryFrBozOP86pI
         3eGJL6xjOZRwsCJoLkk4fxYZhG5lzOM6YoW+F654maBlXzT23syYcX2JDnUyKOHxQGXB
         2tEidQAgeaP8XyG0HBKW7Hum363j453kqZUqRZwk9GickwSHtsDPrvxae9iYOOeVXzBK
         TjqxtDpdw815/LPI6TG3KxMUs6DPb0wEtRCdKJbTLWkA+uts1zLUpHwPl7/YeigbszQo
         BvLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iq7zuX4mescGycMYtdVsnHt3n8ea5BUsLeUaRpIODWM=;
        fh=i+Nh5WFQTlyYCY5y5kvCtADmqySeogVqFXv1YzU8POY=;
        b=AMI5PVScU2PRlvOHHQo0/M5oG193H7mp44nY+EQuLHLTWsY6T7V0Mz0Hvnn36NTHst
         3wfhheAU+QRGaDloKFF4VQ+8b00LrizvPvhLru/nISdsMdAQ4AAv49xJgicc0CQHl0xl
         zXEXGiiarGeYgvduytRH/o7ZATsjqPW8Lh4OLnztIxeyPW0ry1uh8cv/ncnO4rDx4rFI
         mvFlU67KLW7D0wP+PD36+p6bYPbdKtCJttJCwlO+Jy+tD3f3IxVguOvRyl7NVRULcpGF
         z8ssgzLF/I4+hVfswdAQ4qxZJNfh5LnVYtcxqpz3zDsBmTbH9ZyE/26+nJpDTfQpD3Bt
         wShg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794524822; x=1795129622; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iq7zuX4mescGycMYtdVsnHt3n8ea5BUsLeUaRpIODWM=;
        b=irICtOrgRGFSY53WuIyzu8TvH4VAFbp2Bm9vZ4Z1Z94hZozwaMXLPxyJx/tlti2mVi
         ctcdxtiTUfyI8LFpkjubrWADm37oXauz/yIIo60ytVeIRG1VBoLNFIiuy0k+6Ju3jFQd
         7REtp4u2l3gQJoyCxJncqUbeCGAoNHXHbZ6REFJqvzb2PcXCrmukCEXpQXNOYn1sLXrs
         ICu8svIF5y41B/8N5MbGb9qnQrAt5rMNJoRqqozkRerVUe62lhc7jCnCfoDqB6sF60RT
         LV5VmLgNaudkTgH3dH1fHWPWHdcavn/h+HTTkV/FsVRJr8IIipcHA5Up6ArQIs0x8H9P
         b6ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524822; x=1795129622;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iq7zuX4mescGycMYtdVsnHt3n8ea5BUsLeUaRpIODWM=;
        b=cbfi+SR0HJA0ychGPUMQLIJdtGLv3PdtkZmL8W3aR7VsvsV5CAwZEps2rD7TUoIskc
         54a0RRq+BWQXhxsr/sVYbDrCtm5+yHCV5qMMAEdAqma1HHwzIKJRD7qk+OCWdHoGeH+5
         mcYwdqVjiv1jE96nhqnNHcCr1W6hIaJjrZV/U8Tl0Gk47ae08b2WwmLkGQ7euqxG7eee
         9ICm09+B5TxPOi4357e+B3KICB3LJ1Jt0y1shJtAZXbVaRcGYUVgGcfjGJWVO57qdg0c
         jT6xrYH66WhtqRapfJXtGOloj8HqhmdxV01PsgrL2fJvBwi9Gr5UKtiUm8bSw+7IK3kd
         zNnA==
X-Forwarded-Encrypted: i=1; AL+hErErwztvItZrkwzl2/PZfKB9/WHUM/B+tVwvUHnrMNJY7x4Ag5MTudFnkDwCSmJnkYmMMuOYbMft28FnNYk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oGDcgR5wJKe+qyeNu0We4hx/0DiDPCipa/sXof5Mp8oIcj7iH
	EEU6HMdR5QtF/msyqyeCMclAsRnazcLJ8i/EXCoeokAEcfpjRsuPIYZIUxF5uOmySWSfLctukm2
	Nu3k+7gjB6atcOTtUFDAUaW6+soXPUcfsquQLTiPR
X-Gm-Gg: AYBFou39MrphE6U2zpmpC1kMMtexo5Sh2hyr8cxLQgZu/1rdUNuerBrpyrAiGr6sNjv
	rEphYREvCV8W/9QF8ggzX3acu1MSyYclPA6U3svDR1yTalg3rNr9Y/U0aRZxLEAVN4+fohA9yz6
	1UCCIdcNEokxF+tLReHqOA/qF9yAgwHRHxjlsqqUY+rThMUT/UHj6ravWdXkMoqTHo8Z+JPhlyL
	gOgtJ73BRuZeST+o56ApOH6SaWXyytI0woFfl/aLdV2VjM/mMQPrEiZjP7fITsHlMA1DbVm25p7
	12eMdIOXVQ137em2jQEr50tOaexGsbcqdv2avLsUT8xIJYyLEBu08Q2Tx22y0Ksdu6ZA7EymzRb
	kXFKQIGchS5nrnwMINRo9Odg+PYZvr1NbbK1npOhTwieFXSyh2uTMvAymUI7z4c7lmc3BsyQh41
	1ThTk1bVYXC/v8
X-Received: by 2002:a05:622a:4885:b0:536:3ee4:81cd with SMTP id
 d75a77b69052e-55adb2a6457mr5607171cf.4.1794524821197; Thu, 12 Nov 2026
 15:07:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260730-rfc-nt-demote-v2-0-452dbe3b5073@zptcorp.com>
 <20261103223025.2482227-1-nhuhuan@google.com> <7CF5AD15-B833-44E1-A9FE-C8E12F8C9E82@nvidia.com>
In-Reply-To: <7CF5AD15-B833-44E1-A9FE-C8E12F8C9E82@nvidia.com>
From: Huan Nguyen <nhuhuan@google.com>
Date: Thu, 12 Nov 2026 15:06:23 -0800
X-Gm-Features: AclHuK8R0WzJXR4yHYxHSMICSWxLr-x7bnN-BX27nSJiTtbJXgPCv-FYzS8TYcg
Message-ID: <CALwWd5vAtSSuFoex37AzDBcK0RaBP3fbbst_fy9BGBQ5jr-K1g@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/3] mm: use non-temporal stores for demotion
To: Zi Yan <ziy@nvidia.com>
Cc: tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, trondmy@kernel.org, anna@kernel.org, 
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, 
	byungchul@sk.com, gourry@gourry.net, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, jackmanb@google.com, hannes@cmpxchg.org, 
	shivankg@amd.com, rientjes@google.com, dave@stgolabs.net, nifan.cxl@gmail.com, 
	fvdl@google.com, jic23@kernel.org, rkodsara@amd.com, bharata@amd.com, 
	sj@kernel.org, weixugc@google.com, xuezhengchu@huawei.com, 
	yiannis@zptcorp.com, yiannis.nikolakop@gmail.com, 
	dimitrios.palyvos@zptcorp.com, alirad.malek@zptcorp.com, ryan.roberts@arm.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-nfs@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 4:09=E2=80=AFPM Zi Yan <ziy@nvidia.com> wrote:
>
> On 3 Nov 2026, at 17:30, Huan Nguyen wrote:
>
> > This series continues the non-temporal demotion work originally posted
> > by Yiannis Nikolakopoulos [1].
> >
> > Motivation
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > Memory tier demotion moves cold folios from local DRAM to slower memory
> > tiers, such as CXL or remote NUMA nodes. Standard store instructions
> > force the CPU to allocate cache lines for cold data that is unlikely to
> > be referenced in the near term.
> >
> > Using non-temporal stores and prefetching on x86 bypasses CPU cache
> > allocation, protecting active workload working sets and improving
> > demotion throughput.
> >
> > Changes in v3
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > - Unified MCE-safe NT copy (addressing v2 Open #1):
> >   Implement copy_mc_page_nt() in x86 assembly to provide machine-check
> >   safe copying using non-temporal stores (movnti) and prefetchnta.
> >
> > - Architecture abstraction (addressing v2 Open #2):
> >   v2 relied on memcpy_flushcache(), which lacks non-temporal stores on
> >   architectures like arm64. RFC v3 replaces this with a dedicated
> >   __HAVE_ARCH_COPY_PAGE_NT interface and generic fallback, enabling
> >   architectures to plug in native non-temporal routines independently.
> >
> > - Memory ordering:
> >   Add a wmb() barrier at the end of folio_mc_copy_nt() to ensure weakly
> >   ordered non-temporal stores are drained before page tables are update=
d.
> >
> > Discussions
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > 1. Migration mode vs. migration control refactoring:
> >    Currently, this series introduces MIGRATE_ASYNC_NONTEMPORAL into
> >    enum migrate_mode. In parallel, Shivank Garg's migration refactoring
> >    series [2] consolidates migration arguments into migrate_control.
> >    Once that lands, demotion can simply rely on the migration reason
> >    instead of adding a dedicated migration mode and helper.
>
> If that is the ultimate goal, why not do it in this series to avoid
> code churn? You probably can coordinate with Shivank on how to move
> the migration control refactoring code to this series.

Thanks for the suggestion. I reached out to Shivank and we are
coordinating on this.

Best,
Huan
