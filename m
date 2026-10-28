Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793169098;
	b=03uj7L/RlJ9aesiEykOFgkPL8SZaApF2x1vAK+l00jbwgh30XGOesPWiHbHr6xPVacQn
	 bNWyuAyQ/n5s2bRguuALH8LwQekY/KhRdKfsw2E+J9rPQjwjSBq6pnU7nu9vl0ljmb/+8
	 plbiw2TWNNVpHrZzAi/Ms9IxFsmwIQrRUXMGO6WgadE5Bf4z+ghNU43EaqybyDks8+4ci
	 4mqUaIOvFXHR22JRQO10TghN0/xiqWlYlKG61zDAT60EIwHBHiRu4LEaUJI8cccSHJGvD
	 9OYef/poOsoh+SsrFoSKxNeZtGydxMAcZo4EesnQ82xl9miJ22yy1jzst45+O+zrhCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793169098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=q3gM5Luu6vI28PjmhPAEQ6TEdK5ARDl4ei6yQBf8kDA=;
	b=Ed7IuNc2le2DS7/JN1z8TnlKSqm3jEalp/uR13YtlwiUkmPSNiPd03ksMZLlBxH4clDJ
	 GH2kRKcYZPQ95M+g/nSOovULLPfgNKw189k4qnVyk43KZn8A3r6HviNb389BYKhSofozP
	 3XJjVqjaornv9b4ktbsE/uD/miCPytuSl1JVRGDH4GuFNzcLCOnJXdCIEKQiRFUIWKRWf
	 xwJ78jl5LcJRxeKFX9H6eKUnI/CVKTVwXvlCZLG5tLkjX9GFTV3PbqsiRB1g/Hngnsjrj
	 UgSBIQwinq+4xGGsMfpDqKSS/Bi+EiKzsfJ0Bwacs58/HhzCknemBcSUyk1SxHjdOZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B09Y7vdV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362EB606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 362EB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B09Y7vdV
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a0673d9bd2so379334b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:31:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793169097; cv=none;
        d=google.com; s=arc-20260327;
        b=kNC8Y/OMmL37FKce9HZmL2riyb6sXuuTe7Z2QZWyAn3ohlhtWC7YyhxcRkMionXSS1
         WIsrEMxfmJJbfUjLDlRSbnPzUfxHmIxqcayadj5se1QWiyycKLIyyKwzMKCuePICcO73
         RTPB3GlwTEM5w0oNikWVzGAjwoaO6g0ldo1faBCCt5WW31nZHwkfAyN6MM/pTLQjczDY
         38uNFyk3MPnel/4Gg5vXhVkPKkJHcRkLLK0W/4BDbbxM1f+lWPkfgrKP94eVEfg6W3h/
         jrPh6+OkviF5UEzyE4yWcvO9K+8fsw6Ylb/JYaFBIuJplk8GnzUj/J7R1w41n2SBC9JM
         8EkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q3gM5Luu6vI28PjmhPAEQ6TEdK5ARDl4ei6yQBf8kDA=;
        fh=/hj99M61p5sNdShg9lOeISd1RcFfeQshg9qel/Mbsss=;
        b=IdUOSSDJVwv3Z7u+Mj1SQQXZqqz/lQc6zxkY3R62b6Ei7PkGB3J3eKVYjukRNCNzr/
         tejJdjs+94U0w7POPGr7CzHR0fiywNZhWF528hDvfwlwUaMHIUbxJ8Fbrdb53t3Wh86v
         akFCgIDC7q4Ru+soWOt6Bq2wqOClZUAehbJtz8/vnQhcYAKj72PiORao+RdmgYtXZfHE
         9zjRhoGPxxnNyAWDlj8szTxxRONo6JLw2/YYk74xorYuDJz25b8RqqARfzwdRYv16V6P
         EDFxy6LyQywnlJqSr2nV2KGK6g101G2qfslLqPfcT3P6o9oPJiX7zfIbfGHxBU03Zjzz
         ywmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793169097; x=1793773897; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q3gM5Luu6vI28PjmhPAEQ6TEdK5ARDl4ei6yQBf8kDA=;
        b=B09Y7vdVJYZw60Pwnixl/wIPa2quHhCWMivLPFSvp/vsGqTgEAvt/J5eKNOlQEfcjm
         vAHwY7/L8sSlHPGtxmZCquSNwwNCvOdXptqPsxcKJ3TzKKXHX2tyEWARsnlPXx/YcilG
         Z0fxMelygD7uuK/GGJnC4eJwF2xyrZEMQAysn0OqZdwyaMKDSPrQHlzwVWsvvv2YBRIF
         VlM0UwngpulwvtXSbs0j+SDEdN9NDrnoPPEuwdua/ya4ehtMXslYPKgrdqIe7+jZyJWu
         yDMWFZX4s4SJnmt+Ffm39we48eUw0Tgj7td9vyfm/Qtbr9FZvxxnA7koTeYgrMoqtOo+
         hrVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793169097; x=1793773897;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q3gM5Luu6vI28PjmhPAEQ6TEdK5ARDl4ei6yQBf8kDA=;
        b=PhlXF7cN87Q9AD3bAw7Ms4e4B/4uGutRDSNXljdnh7wXDV3ku9QAtSPMwZtDEvvn7J
         njj80shdW8SWzruLWuIEjy9/44u15MuUQUoZPRS4KIUMUQKLmA4GWmJXKDI1Qebqf2U/
         227d/octF3Wid2XQNla44+rUZguhVtYfesYjXbKz/ZeAazoLDJehoN6CU6qF8DHBcp0P
         pren0gCiUkGqPBxYDCF7XCoB4gSQzmwPWgoBJOPmNgsEf2v9NvdVADAFbIvBIdBIVhaE
         yf67+7ExU3qPMt7irIePWW6FLd5F7JSQAcaBE6BzRESCul9NZrIBk6sVwMtLFwr8J/DF
         vU4g==
X-Forwarded-Encrypted: i=1; AKwUvByfvwFtP5PLxtCgMxVegQW7iAGS7haWeRNa8Hgux60eZCUsrHLtF1JIK6b9mMJmVRcslpIWG6uYOeEFTTg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpRDMLNX1C/ya9dYK0MNoQOnQXGenUpUgzIJuqgmBkoXK/o2ee
	IaYvPjz1Pv+5v+k2VmhjlePYNgqJTDXQVs+PYfsEtkBmbrlHjC7Don6ZpKYGfbOBHcLrtwPWgAg
	40YN4DAb78UskfFz1GWk/jE9IUNBcuos=
X-Gm-Gg: AYBFou12USXWFQbg6bABUkRCAcDZhgQKAaIfqWQ34Xi2ymkA7mnIcQYy7NGc6VuD8YC
	pSqCutIGmBvPf5oKGFnvR1GJhWq9L2pWiigiAsi7RPvNnrNWzLQrBNc7rwehehfhKvPL199Q85c
	qeJhC3dbkvf2y0ymUKnKZBWIVOeKj3MyKfxTNVjVeTXb2MMxunXy5JRzFDA6Ni8sZgQBVnaWJ0A
	j/8Tr0DxKmXCEUfnfD7jS1TcoNx74AQ/EFiAhzTUzHG5pKi/5Cs9GV6p1U10QZZC/4UlEQ62GL+
	KgIeddH7O7a+ZA2ckKgGeezI8BY1tNMuoij9MZdopgmEpFNk9/pMsUFbURSK4eNVZkoBmEecvrK
	AuQaEaIZKbACbWyNxplajDycoDWeyWK2Zl6NayA==
X-Received: by 2002:a05:6a00:bd04:b0:89e:3ccd:b3c7 with SMTP id
 d2e1a72fcca58-8a6e75cf5ecmr1113257b3a.33.1793169097500; Tue, 27 Oct 2026
 23:31:37 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014103241.3847-1-sid9.karanam@gmail.com> <11c794c1-6fb2-4a21-a127-4762c6f45699@ti.com>
In-Reply-To: <11c794c1-6fb2-4a21-a127-4762c6f45699@ti.com>
From: Sidd <sid9.karanam@gmail.com>
Date: Wed, 28 Oct 2026 12:01:23 +0530
X-Gm-Features: AclHuK9wwib5U8oGIgouyIs5-olf5nbQKP2hXA6sdZQe95ce4Bc2ClNw_KUuXZw
Message-ID: <CABM86pxVyAc8iSqGJqO+-_+UJbfEkH4c1Q2o2mr2B28OswqXJw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] remoteproc: Merge ti_sci_dev and ti_sci_proc abstraction
To: "Padhi, Beleswar" <b-padhi@ti.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> You might be interested in this:
> https://lore.kernel.org/all/20261027140751.2465743-1-b-padhi@ti.com/

Sounds good, am assuming the RFC will be implemented after this is
merged (provided this patch has no issues) right?

Thanks,
Siddharth

On Tue, Oct 27, 2026 at 7:42=E2=80=AFPM Padhi, Beleswar <b-padhi@ti.com> wr=
ote:
>
>
> On 10/14/2026 4:02 PM, Siddharth Karanam wrote:
> > The previous version of the patch had a new header ti_sci_dev.h,
> > that mirrors ti_sci_proc.h in terms of the struct decl and
> > its helper function structure, with the goal of abstracting
> > all ti_sci_handle's members like ti_sci_dev_ops from being
> > invoked directly in the driver code.
> >
> > Lore link to the v1 patch:
> > https://lore.kernel.org/all/20260922191453.324983-1-sid9.karanam@gmail.=
com/
> >
> > Upon discussing in the original patch thread, it seemed
> > better to combine ti_sci_proc.h and ti_sci_dev.h's structs
> > and merge all their helpers into a single header. That is
> > what ti_sci_ctrl.h aims to do: It has the union of tsd
> > (ti_sci_dev) and tsp (ti_sci_proc) and both their helper
> > functions are prefixed with ti_sci_ctrl_dev and
> > ti_sci_ctrl_proc respectively.
> >
> > The goal of the patch (v2) is to maintain a single source of origin
> > for all ti_sci_dev/proc_ops call sites. Any stray calls
> > to dev_ops/proc_ops function pointer members in driver code should
> > eventually be abstracted through this header (ti_sci_ctrl.h).
> >
> > In the future we can try to abstract tsd's dev_ops even further
> > through pm_runtime, but there are some roadblocks that
> > I am unaware of, so that warranties a different patch.
>
>
> You might be interested in this:
>
> https://lore.kernel.org/all/20261027140751.2465743-1-b-padhi@ti.com/
>
> Thanks,
> Beleswar
>
> >
> > Siddharth Karanam (2):
> >    remoteproc: Add ti_sci_dev_ops abstraction
> >    remoteproc: Merge ti_sci_dev and ti_sci_proc abstraction
> >
> >   drivers/remoteproc/ti_k3_common.c         |  21 +--
> >   drivers/remoteproc/ti_k3_common.h         |   6 +-
> >   drivers/remoteproc/ti_k3_dsp_remoteproc.c |  26 ++--
> >   drivers/remoteproc/ti_k3_m4_remoteproc.c  |  23 ++-
> >   drivers/remoteproc/ti_k3_r5_remoteproc.c  |  66 +++-----
> >   drivers/remoteproc/ti_sci_ctrl.h          | 177 +++++++++++++++++++++=
+
> >   drivers/remoteproc/ti_sci_proc.h          | 130 ----------------
> >   7 files changed, 231 insertions(+), 218 deletions(-)
> >   create mode 100644 drivers/remoteproc/ti_sci_ctrl.h
> >   delete mode 100644 drivers/remoteproc/ti_sci_proc.h
> >
