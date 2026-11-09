Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794203358;
	b=CWvSNGLThMComeP3Ld9LFZbtLlX9v76ri6xl3csMa6p5iVR6UAKXiXOmmd5hm+O9ixx+
	 wkuK5qmy9ZBXicVzEk7X1liNL4En01DfjiDiV1xVemzPaYChzM3RQRG9Pjw2IDq49mR+2
	 B+42iKyPWlINALIpSf1zN+mQrgw0OyGzRniV/3uYctiGHZRUgvgX5i/76UMWr++ZNqcsm
	 b8orZypRqRq4+F8mCTcHWt8vs7UC2vn3mSAWQ4QBdGuVf3bW+F9sLtE1VWwRxf81So7Lp
	 o0r8hPLvgimnp4jAUKA6AtgGOMQteKMQ2OL3Szabx+K63fUL1Jk/zx426lGlJ+dz/ew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KffYBetHs8Ajm29Uu5eM47VHa8AaiRvO1sJNqwagpnE=;
	b=mjUao0ycyjAcfbox7uHeOc3hkBjCLdXkefHQXF+xgXUrflLACjt6K1buTDwVg/leNeos
	 ZZNuH6QHnu3glM+CgGz4mQfj/Ab1wzVUmGN/3CAA5QQXCfI6MV/Gc8S4Qexj4UsKw0Ynn
	 LbhhVb8zJOdzMAbnSB9VzZ/ZPME4Lf4dNrVKbT33cHNo8EPLh56GkRQA6Df+3OMiCf46L
	 PkFy1aSnXCNlMmYEFy7OE2wmFANMhLfw7Y3P6pGS5ljykzs8r/uPuigkJaamudlD5sZBs
	 giApHfrv3kjZwjl6SiPjWBuODmS/znq4KUG5HjjxJcDjt4TWCHRSI6rK5/83dmo/0Sw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Rjb06pN7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E3B606A334
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03E3B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Rjb06pN7
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6deb848ddd7so306212eaf.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:49:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794203357; cv=none;
        d=google.com; s=arc-20260327;
        b=C7vmNPXOVS7bJhYZRahMon7/07bGrIK4iGsTAMyELz4ojLYlUaI+0Y374ZYwH5XD+a
         pEJssZrqd+fyQxloe/vcgc7y/yjQaDjNBSc0AoIsCHNNdpZWpguU3rAeOOxSAbw3g6d/
         /QeRpwyqWXGsYoqkFai5oUIjjP1eUhKgoIwCjoHq23SEpHN+sJyvccKBjS/QRlCEgQV0
         eJ0uf7jw5/gpcpfAZHvqrR0U3j5Q/axIHMBqq09bU8OaR3wH3GdE8ljku3sw7dbKXWBx
         IJk2D6ZLzWSPIuiIduzFKqAtyyP4O1M676f6nJfn/MQcpx71vZko+UteuTE22Kjo8yhJ
         LyeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KffYBetHs8Ajm29Uu5eM47VHa8AaiRvO1sJNqwagpnE=;
        fh=4FobbIpBn/dWbsIYRHfjD0gpDkD+7jXjsr9d1kwd8Jo=;
        b=bmKNW7q9OEISuhFDJZxo7Tn4w9j1f7GqweMxnzq9nXtvCGyaKLmw9xypcXTLpIKgar
         HeSPoOWb/khYqUTw/k8cNaYNyyOzd6Kpc65cZD9+1jPnE/wuBepVJd8+wvGD4qVTr05K
         PUWP/JYcSZ43Sn8lkR7yBeiCDHbwL/rI9qfpk0QJdhaM1G1JaD6a8OZ0u6hl9B0xH7k/
         XNWWxRv9GL66Bz1//oLoNH7XOq7bK6jM9dzO0g6JGEEDzmD6BIO/dJaGAfLHZQyFPdV2
         0jphLBjwTlCLQVSlwZYcjD0/u+s6ourIBHibg/tZ+gPNd7O8D9he1KDrzyH9yJmnvEv7
         uHCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794203357; x=1794808157; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KffYBetHs8Ajm29Uu5eM47VHa8AaiRvO1sJNqwagpnE=;
        b=Rjb06pN7tkLtuxfanMFZD9AD+eeWrYx6u0gYZZKGAt+gHGjpHDzqqY9Hk5f/gUyvhG
         iFMbGnLWPE8t51PF7zKyhy5E6SD4YPngK/qrL9lo7bYUDivK0RaqD2HFsmEDhXLNvPyu
         FC4HcZftjwlG8NyRos8CyoCZG3h27tk6DSnJC8XH/bfL4O1ceJqAYT94EL4wAU3SL68o
         bKpHDFXNdhx4CiWxKm2UbDfM8N8Zr3GT36VkzZuFHTi+kR5eiMFCC65Vr+Cb2NwmJYtC
         MOo1skP4gTONR174efquuLLRTp/cXyE94lHEh15qzFyO5JarLkNNsBBgeFSnGiy6GW87
         JJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794203357; x=1794808157;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KffYBetHs8Ajm29Uu5eM47VHa8AaiRvO1sJNqwagpnE=;
        b=wZkJjrzJr+12UnKUcWtHVe8krE2u02mNK9Sx0Bi6cvkEwOOFOFGCminYo0gk+BL59g
         riYRpLIt+ECa8CTcfaInVIMfF9UrAP/NOzsxzWg3MdZ1Me8ytG1bC6PEbRWfFzLuUAfZ
         DXfO1UH+lupQ0G567m+cvRUMawjYqUwAv4DmzSmT/eEDLkRTBqvGAtbtZrjsBjZDWRdR
         Rn8opthzg5ag4RYKr0pE2iv+CTjP6gCi5gzvjL0IAYUcov4TRai0N+IkAlzy8vSEUMrc
         j30mLTiIuGAz7kktZGghOkKIvW6ICPgNYBv0O/o1FEFQMoaiYYVLOCcNck7Z4HW9Vc93
         Ub4g==
X-Forwarded-Encrypted: i=1; AL+hErH0XmI0Jc/+pwBlfcNOQH1jWFcjVWKwOGm397kFyBrhXfm/UJG09O7FoFHkyTtnnUIaJ24GJ1e8iT+krJU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tnkeJtooG9O67h1IJ7XN9TBI4kHXt+wNE8jb/vpbJ4S9l41DN
	WVzSbTop5agA/Fvtrkf+xQg94XXTFNUct/hFi1L557ajjWmKvH0ngsUdDYbY7T+K+NQDNJ9h04X
	nnoEoHRo9KTHAEEqWLfrzyqjUlwPTPmH+7OYHa9mIXg==
X-Gm-Gg: AYBFou2uDcoG5skKlT9LWmp7/zEsE2DCO+aNV9GZnyo8sD7lEDoFDPZhtmDHw5G+d/B
	ttRxk3VJVUDVUDWD/udK7iQwuIYzQy3UOAwlv/bN1zDTDPNWu51SgmngerhSaz1+lDEfFwowqTv
	G5QtsHA76N9PahUW5Z+HWRU2rzsUsc7F+gNiOjKLRbUST7XR60v+cm7lq/wascQwrCZTfbqFVzT
	BmhRSwL1pKDDWVUPuZ3MwFdjdZmAqI2t08rlO01dM4Tea4BS05wCixKwTUYJ1xBRRyH2Ote9CR8
	Ez+ZikkVLVVWKjcfAl4ncrueGV/91d1oKyasPdD7IV7KbWdbU/p5trGqxJxAENhTiZIHP55DV6x
	oVGUegSF1JA7jU+AvlNnPOKvhT5/YtGTjoO7X1kLUmVs=
X-Received: by 2002:a05:6820:160b:b0:6d8:bba5:6589 with SMTP id
 006d021491bc7-7170f303df1mr1702563eaf.48.1794203356632; Sun, 08 Nov 2026
 21:49:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108110406.97495-1-cuiyunhui@bytedance.com>
 <20261108110406.97495-2-cuiyunhui@bytedance.com> <20261108213254.67805ef0@pumpkin>
 <CAEEQ3w=5QwwvMJFJkpS51APoBjhed6oriCkvcieRdUFWrKtmSg@mail.gmail.com> <avFN7LbSK0q1gsB6@xhacker>
In-Reply-To: <avFN7LbSK0q1gsB6@xhacker>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 9 Nov 2026 13:49:05 +0800
X-Gm-Features: AclHuK-yA93Gg5bVt8kCNssew6sQnM_Z05Rmq56zAts1z3WwIhtyQX6D4YptSkY
Message-ID: <CAEEQ3wmViZNwxXr8q477yHjtABStEJecCHS8=5s_UAk1hYgyfw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v9 1/3] riscv: implement this_cpu operations
To: Jisheng Zhang <jszhang@kernel.org>
Cc: David Laight <david.laight.linux@gmail.com>, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, dennis@kernel.org, tj@kernel.org, 
	cl@gentwo.org, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	martin.lau@linux.dev, eddyz87@gmail.com, memxor@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, bjorn@kernel.org, 
	pulehui@huawei.com, puranjay@kernel.org, thuth@redhat.com, 
	ajones@ventanamicro.com, ben.dooks@codethink.co.uk, rkrcmar@ventanamicro.com, 
	samuel.holland@sifive.com, zong.li@sifive.com, conor.dooley@microchip.com, 
	tglx@kernel.org, debug@rivosinc.com, seanwascoding@gmail.com, 
	andybnac@gmail.com, menglong8.dong@gmail.com, cyrilbur@tenstorrent.com, 
	wangruikang@iscas.ac.cn, atishp@rivosinc.com, apatel@ventanamicro.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, bpf@vger.kernel.org, arnd@arndb.de, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	qingfang.deng@siflower.com.cn, linux-arch@vger.kernel.org, 
	llvm@lists.linux.dev, dave@stgolabs.net, emil@etsalapatis.com, 
	ihor.solodrai@linux.dev, broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jisheng,

On Mon, Nov 9, 2026 at 12:57=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org> =
wrote:
>
> On Mon, Nov 09, 2026 at 11:47:43AM +0800, yunhui cui wrote:
> > Hi David,
> >
> > On Mon, Nov 9, 2026 at 5:33=E2=80=AFAM David Laight
> > <david.laight.linux@gmail.com> wrote:
> > >
> > > On Sun,  8 Nov 2026 19:04:04 +0800
> > > Yunhui Cui <cuiyunhui@bytedance.com> wrote:
> > >
> > > > RISC-V has no asm/percpu.h, so this_cpu_*() read-modify-write
> > > > operations use generic implementations that disable local interrupt=
s.
> > > >
> > > > Implement RISC-V-specific this_cpu operations with preemption disab=
led
> > > > to keep accesses on the current CPU.
> > >
> > > Have you looked at some of the schemes (I think arm64 has the latest,
> > > but also s390) that do most per-cpu ops without disabling preemption.
> > > In particular they save the pre-emption check when pre-emption
> > > is enabled.
> > >
> > > Basically the code tells the scheduler which register contains the
> > > per-cpu data so that it can be 'magically' flipped during a context
> > > switch.
> >
> > Many thanks for pointing this out and suggesting this optimization. Thi=
s
> > is a very useful suggestion. In the common case no preemption or migrat=
ion
> > occurs, so the preemption bookkeeping and reschedule check are unnecess=
ary
> > overhead.
> >
> > Implementing this scheme for RISC-V will require additional changes bey=
ond
> > the current series. If this series is otherwise acceptable, I would lik=
e
> > to land the current this_cpu_* support first and then prepare a follow-=
up
> > series using this approach.
>
> Hi Yunhui and David,
>
> During the merge window but before rc1, I implemented a riscv POC
> following arm64's preemptible this cpu scheme. Each operation records
> its per-cpu pointer, offset and address registers. Exception entry saves
> and clears this state, and a noinstr c helper repairs the saved offset
> and address registers on exception return after any migration.
>
> However, my PoC is based on current percpu offset.
>
> I planed to sent it out last Sunday, but then I found Yunhui sent
> his percpu series(which is up to v9, I didn't know this before) on Sat.
> So I hold on the sending.
>
> Now would it make sense to rebase the PoC on Yunhui's series patch2 and
> patch3, especially the percpu offset optimization? I can post an RFC
> with this rebased implementation.
>

Given the substantial effort already invested in bringing this series
to v9, my original plan was to land the current implementation first
and add the preemptible scheme as a follow-up.

However, if the consensus is to move directly to the preemptible scheme,
I will implement this scheme in the next revision, building on the
cached percpu offset introduced in patch 2.

Thanks,
Yunhui

> Thanks
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
