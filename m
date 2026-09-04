Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751094A440B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788538593; cv=none; b=h8wnqmVRsC1Y6faqDhGxCZi4uXYS7xW70rdMFSFSs+gzAMZQ4cqCW94WJV6sHmVSoBO8koaEsJlJr2vBcufoxUVj2UUhn7onywSDg/pL17spM2WgWHYvDld3vi0mSIB1OSzk5mbWi+yVtbkncDoSq+HzEv1snYMl7OD+MKtswHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788538593; c=relaxed/simple;
	bh=S3ktW0mgvYiUuy41pETr8cIXqy6mtnT30IxPC+xLG+0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=me+hNbDGxiXIEZ7FGFb4TsJ7ZT+B+0AclUQKYRkCLhWcIhljvCgkCiysEGoXPXbSOqa8N3qxJ+jkLVDute8bULzcBF4+b+rtk6SLFl/W2NVCIFRcBSce/w1RhqKJEaZoH6pSXN4hdPCl3rLl3sao8gkbcszKbHuVUrKNhqDQ8K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q5LIOVc2; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q5LIOVc2"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-786aca87296so978507137.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788538591; x=1789143391; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S3ktW0mgvYiUuy41pETr8cIXqy6mtnT30IxPC+xLG+0=;
        b=Q5LIOVc2jydu3NQfKcT4lyGyOMiNWV2OoAgdGHXlHq35NzwAYSfwepheqYbQhZK7dS
         kQefbZAhXLuNLnVQTkwcb2DkK2G53gHl0EGJq/MiDaFyJ1qGupDaWxxbpv/kwG9e71QG
         J5KH5NBxa6ngviZBotoOFJceD4CQZdzEjCnE7EAWzlwbffBE5YeC7MTMj9vJhAuDMkX2
         M34YBHZrj3PhD5dtgdJwZnkChRcAUlXDbP5Q8q/vQexjGYODJaT5oZYBVQ4pAXR3idWi
         BWov1SJIFPc5emxphanmC5umsA3G0mzMWaUQgRDM9MNVY4XPDR7A3OtxjfiSZNxS6YKT
         D4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788538591; x=1789143391;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S3ktW0mgvYiUuy41pETr8cIXqy6mtnT30IxPC+xLG+0=;
        b=TfyN70DTJlrXI0a4RMj+y6Ts1eHjVgULuXOVc3iJrKyxvZmmrmfFJbv2fW6+PB0Nuq
         4AZ+Im/LVvM2NchUnslwBDb6yXt9PjvfPN8XRc3pzQxF3y9a+THQz4slvhVd+oB2c6sD
         1b9jBARZPRvV6Ws2aKPiw9E6ptIPdWQQM9Fs+Hh4sBG2KJnLbicKqNpm9Og9U6An9Tx1
         t8DbJOqoxiVbDS1w+An/pzixYrm0v0rENuSa2RqIqXv1tBrnFzBkjai0Lr6sPzLGAF8H
         J26kKjoWn8FOu5ysYtCUKepcu/Ec4jgig8iUYolqFv6G9+EEkO473bh0v3TMSjobAqHP
         3ujw==
X-Forwarded-Encrypted: i=1; AKwUvBw5MoG5NxjslBUorQDuSMQRJlpMg9PzArp9Zw4m6lyj67x3Ru+AGJWuCCCZxmZEB5t2AI274cw/m9evxIo=@vger.kernel.org
X-Gm-Message-State: AFuF++nGYs5+msrgUrybDzPWj3upZMP090/5LR8RycEzzOZa9PvtdmiQ
	Us1EtA80+xv0Kpng5d5/K6d8KiZgKLiZJ2tudvAT/9JC8FGKtIFp23YQ
X-Gm-Gg: AYBFou1lbqFNbQ8H2+JLOOX4y+93qkzeUTaLAz5Bpe0pcEXNL1ufVCS4EBEARJbTugL
	JEvDqySbxbQJDfcU/s2xmoUFsHMMHEpcrwqDZO/+1PmlwLIA+OfR4VwmwL2JhnYSi4aqR+lBm4t
	xawT8YpF9D2K/ND0SplNf4ga9zkqoofUQGBFd0NJ3XgSyeq4jop0IZy8wuYWpKUdb3pfZhJxNnQ
	BM1ynflie/2vGV0VPnUYlj2TrCjrmGIyq/2dwGWNR6bBB7kV5ttpvhnj1nKOblWDX9JqkJcZD6C
	HH2HhWoFpnTsGWZd0033EsmKmVO02kjER2+xTR0Gec4ltaTS7rlxr1VB9IwM1HOuc5dXgwCZ47a
	/6ocbaBVKAWXZ3U4x5pnNwqqLsD8L+EI26shlExMHa65SaYXmeVFwiBtc1UtBnhoghUSqFROIMa
	Qjg81h/KWDBi79pIRHNOXtN7lpF6bMYxXN5C/EbGadp71wLWps8AcG3nclVd4RINEWad3m6XLOr
	+BSbpgEL3JGb+QNn6fWGvS23gk/q+eq79SFHNB/pD2Hcy5BxKCZax8=
X-Received: by 2002:a05:6102:3749:b0:785:eb33:87aa with SMTP id ada2fe7eead31-78a4a8b86a5mr2672910137.5.1788538590614;
        Fri, 04 Sep 2026 09:16:30 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:1b::])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a4764e321sm2244966137.0.2026.09.04.09.16.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 09:16:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Sep 2026 09:16:28 -0700
Message-Id: <DL6O0KLPXLTA.2HJJUXQUVCP5@gmail.com>
Cc: "Gabriele Monaco" <gmonaco@redhat.com>, "Nam Cao"
 <namcao@linutronix.de>, "LKML" <linux-kernel@vger.kernel.org>,
 "linux-trace-kernel" <linux-trace-kernel@vger.kernel.org>, "bpf"
 <bpf@vger.kernel.org>, "Wen Yang" <wen.yang@linux.dev>, "Tobias Schaffner"
 <tobias.schaffner@siemens.com>, "Viktor Malik" <vmalik@redhat.com>, "Linus
 Torvalds" <torvalds@linux-foundation.org>
Subject: Re: [RFC PATCH 00/20] rv: Add support for BPF monitors
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Steven Rostedt" <rostedt@goodmis.org>
X-Mailer: aerc
References: <20260831090524.106845-1-gmonaco@redhat.com>
 <87se3sakgi.fsf@yellow.woof>
 <df6e9168cb06c35e21db7f9d17cfbca6bd87005b.camel@redhat.com>
 <DL5B40CU17WD.3KD75URQZ6RRR@gmail.com>
 <eb3dd8158942d663ec8ad4c529eacd666c5f96d9.camel@redhat.com>
 <20260903090211.50d15220@gandalf.local.home>
 <CAADnVQK8e1Qp9rf1zThZxb3vr4Gc_bpo0nqpEO2LdnEwHdKokA@mail.gmail.com>
 <20260904074317.01b2c0e1@robin>
In-Reply-To: <20260904074317.01b2c0e1@robin>

On Fri Sep 4, 2026 at 4:43 AM PDT, Steven Rostedt wrote:
> On Thu, 3 Sep 2026 20:30:19 -0700
> Alexei Starovoitov <alexei.starovoitov@gmail.com> wrote:
>
>> > > On Wed, 2026-09-02 at 18:57 -0700, Alexei Starovoitov wrote: =20
>> > > > I don't think bpf fits here. I haven't seen active use of RV and e=
ven less
>> > > > so of any request from people who want this kind of programmabilit=
y.
>> > > >
>> > > > So Nack for now. Sorry. =20
>> > >
>
>>=20
>> Ok.
>> Please add
>> Nacked-by: Alexei Starovoitov <ast@kernel.org>
>>=20
>> when you submit it to Linus.
>> Let him decide whether bpf maintainers have an authority
>> to say where bpf is used in the kernel.
>
> When this is ready, I'll be happy to inform Linus on the pull request
> that you NACKed it, if you are still against it by then. He's Cc'd on
> this conversation now. But you left out any technical reason for the
> NACK. You basically just said "I don't see how this is useful to me".
> That's not a valid reason for a NACK.

You added a whole bunch of hardcoded "monitors". None of them were
necessary. The whole RV is imo a waste of kernel code.
All of that could have been done via existing bpf tracing functionality.
One can delete kernel/trace/rv and do the same thing with bpf.
So I'm strongly against bolting bpf to RV as yet another "monitor".
It's a wrong design. Keep adding hard coded monitors and don't mess
with bpf.

> Gabriele will be presenting this work at Linux Plumbers[1]. This will

I didn't vote for it. Other bpf maintainers did. Hence it's in schedule.
But my stance is still a nack.
