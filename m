Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCD754281B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792077809; cv=pass; b=kr3ctTrbk0W6AQUtXUQ6M5MEiTmzn5NxCoYLXnT41w1m4DGfHWOmHM2TscPkR4xGMzuskCXrzlkoVA+Qc8aqS0ChsuTPwuB2ruk8rKdOWyy+7iVLt7wS7Og9HEzOWw6gi0ENY0pAVI1EmmXI0ciHUN8DJ/K9eL7SF+foJ79E4F0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792077809; c=relaxed/simple;
	bh=2EOHoPv3BQDykUH33A3omRl0PnRrEhVuncaHNdWKUGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D0+Owwu1eiguxieRlGIiL9iCxvhkY+JkphM9pzbADm5b2GiF7xa9TXBAwF3immjCLUXGhzrCl5WJepcAePPMvyZ9IeXvD7MjND8aAM+fI0fE0kU6D04OnEEZG5VjFN39GP9PhCPMGwjrDBZoRtw8u1J8YKklmHHKDZU8oh/rqRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kJvOiHM9; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kJvOiHM9"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-677d35fd1d2so1905158d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:23:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792077799; cv=none;
        d=google.com; s=arc-20260327;
        b=bn5m1lsW84Iu6t8qcFl9UzjOyy3PG81aX4TH3xZsQD2ETmrBfOncbdfSAjv44pW7IA
         Ik+/N0u6PvBmEHVedYVvu9PyN+LRX/HeZZkb0mgbU2UrPwWTmrWTmxclAO8ZKjXILfPF
         RswJpoIOLsg2ynGp2JUQzvNUBLb1WLTHKDODgyeN9nhU/DVBaqII+VXk8+XwsJDOQ3jg
         z5wmKidvXlH0xQzNln9dbx608ilIN2yE/KCSSbbtxEiskM3rve1jWg4Q/OeRs52YRV/T
         7c1gZTqlloz+GbIZokvNCeZfWvta3r3tye5V78EgQeT7S5Uj+RVSDaULPqTxcBmEyNQu
         V7Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2EOHoPv3BQDykUH33A3omRl0PnRrEhVuncaHNdWKUGE=;
        fh=BbHliuIJ0X6DGGzXqVq+feGAn2ZPC+sQhEZ6zrtupBE=;
        b=bci7CJp1kPs2TIsVIyXVZsattKhA+r4MLJpIF4HpuqkJy2unofonRrERRjEtz0cecI
         66044e6h9zRL+IRWA7V3VgSR0e8kjvOF1OjYnpDrLa8JUQNjI1TC6Sl7JEvTiqR/N6X0
         M/UxZQAxxxPye6n6kj4M6KJcGUF7ddVJVxMu9HnL00+zsKj1ZeRubV0oxUMWyHzONZ22
         OsEgdVd1nXqi04G155dCWBqAzGoxGq+D507ctstUoZCcfpFsTMPPbeXL6+zl4HTrMjM5
         V6j+1GO5IIjbtBmi4znUjN+1kbH9aFE7dwZcAXyPZvkQ4us2ytQPDzwTNlRpmivrHyH1
         jHLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792077799; x=1792682599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2EOHoPv3BQDykUH33A3omRl0PnRrEhVuncaHNdWKUGE=;
        b=kJvOiHM9M0WnN33nHmHK3r+01pGpxKYp5aY/UMKhQFhOLUSVrDioLgyfEQddwhvQ38
         PSxocSnNo4gQUdIbe4ErVPJiV96p+kqbiIxQcBbi7vbgtMDwRxN5BGIrrEmVjrvwbGhi
         0YCuafuazhtWQFzgBrSCDze23oQAIfATfnChfJJA42QV55tZXBH4DSzlHC4euw7F+JYX
         ieWEFUQcCTMYDeBtXjSe9qtkAAJtz4+p2iCkdX7bjFDQxaCuc8msRNw56cgXEz9EFzHv
         UEuv6DmGT5a0nd7IP8MfwnoWyF+3btMgkyS9YVwMoxdO2oDWtDnoZXek8Em3C42YaF85
         mLMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792077799; x=1792682599;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2EOHoPv3BQDykUH33A3omRl0PnRrEhVuncaHNdWKUGE=;
        b=YaT/NAFUZs1d6BSoBdo5z3p0f8fmTcPnWvi1HeDKCuc+onymoHIzjOHB3laf01ErwB
         S+Gua1gvmj6V4hehvN98MStwyBt3UNdq7OdZgNabiN7V2lZFyBaSjLHKrAuj6zagq95Q
         rgd/JxSDDpiLmZSuzKiI6JKnYVcBLagPh9FHhqjjjpvA6EoupN7R7KRRHTg1Ofo4uThH
         EH5gdaXITdnYW+RHcPlSiz7QM60An4HLpoBEppb+n5SWI1ZZbThM1OOXSnLEole19Sbt
         85T46JpJDVekPjKyp6Q6dLNdQzrSyEbxH/F4ILonAxbC4Wukc04nGhmeumUPH5KcxRKW
         ky4w==
X-Forwarded-Encrypted: i=1; AKwUvBw9qt4xsFly8BmmDuJtACNXG5W8xihrBIoGstibAn8mVZynYP5eTNCziq1B7af935JaolvZhdJHzxFC+TQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ98JbdcLo8296Mq/X58fCQWAhT5zcM8MKIILgRXbZ26JvZXhns
	yzwISiL+8j8OEE8obIgJtyeuhEhJNOGkJKXJ10CwnONTgvE5KF4Ku0SEfMqbdMkvHLMzGBNIxvz
	uv8cO1kE4TiUqp1soKAELrW+swP2ZSuY=
X-Gm-Gg: AYBFou2AqzZQFT5yLyhhQpTOi5lhbsE1KPwVWe17po8pAmhZqSvK8moyphKiyqU9Ay3
	pipN2VHHtVA2ZdOrvksE8hMlum6PkeBpYGGXdc1001aXBT1RFqvF8BwAHm8fXWAqcSDNzA8MV/Y
	vQJbvsjtjc9nt0kQxOjG9rT/EdgD4alk5PJHIGgrqz6YvNWvqZMWR/5GblDVDsOsAOQaJmvcTcd
	JtrzwRw9t9teM7hWyDqxQ84WEGwXJwWsBPMKPR6nC+6sS6vonhPeipY99U0nNSUiguERsTnQQ/Z
	0hO9jcsY7x/Vh7vSetmDnNad48LOI/ZXILSvZZwExCqRIBrLkfYdcIU=
X-Received: by 2002:a05:690e:1286:b0:66f:94c4:51ea with SMTP id
 956f58d0204a3-6793603db52mr5927090d50.47.1792077799474; Thu, 15 Oct 2026
 08:23:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015093854.2082600-1-huangsj@hygon.cn> <20261015093854.2082600-2-huangsj@hygon.cn>
In-Reply-To: <20261015093854.2082600-2-huangsj@hygon.cn>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Thu, 15 Oct 2026 11:23:07 -0400
X-Gm-Features: AclHuK8xZfXzISQM_5AP4aKpkZUrwKcxhhqslcqF8aMXobo6HxWE2h1pVZC0fso
Message-ID: <CAEjxPJ7xgpYOQVRSoBMK-_w4kmrPu_v37iS+q3Oj5TvtKUvJqA@mail.gmail.com>
Subject: Re: [PATCH 1/3] vfs: add inode iteration method super_iter_inodes
To: Huang Shijie <huangsj@hygon.cn>
Cc: axboe@kernel.dk, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	zhongyuan@hygon.cn, fangbaoshun@hygon.cn, yingzhiwei@hygon.cn, jack@suse.cz, 
	agruenba@redhat.com, mic@digikod.net, gnoack@google.com, paul@paul-moore.com, 
	jmorris@namei.org, serge@hallyn.com, aleksa@amutable.com, legion@kernel.org, 
	david@kernel.org, sandeen@redhat.com, ebiggers@kernel.org, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, gfs2@lists.linux.dev, 
	linux-security-module@vger.kernel.org, sunjunchao@bytedance.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 5:44=E2=80=AFAM Huang Shijie <huangsj@hygon.cn> wro=
te:
>
> This will be used to replace the explicit sb->s_inodes iteration,
> with the caller supplying a callback function and a private data
> pointer that is passed to the callback along with each inode that is
> iterated.
>
> A single iteration function, super_iter_inodes(), is provided, with
> the iteration mode selected by the INO_ITER_F_UNSAFE flag. The
> INO_ITER_F_REFERENCED flag can additionally restrict the iteration to
> inodes that still have a reference.
>
> Without INO_ITER_F_UNSAFE, the callback is called with a valid,
> unlocked and referenced inode, so any inode operation, including
> blocking operations, is allowed. The iterator is responsible for
> inode lifecycle management, so the callback only needs to implement
> the operation it wants to perform on all inodes.
>
> With INO_ITER_F_UNSAFE set, the inodes are iterated without taking a
> reference and the callback is run in an atomic context that must not
> block. This mode is for internal VFS use only and runs under a RCU
> read lock so that the VFS inode is not freed from under the callback.
> It is needed for operations that require tight control over the state
> of the inodes they operate on.
>
> This mechanism allows the existing sb->s_inodes iteration models to
> be maintained, providing a generic implementation for iterating all
> cached inodes on the superblock.
>
> Signed-off-by: Huang Shijie <huangsj@hygon.cn>

Perhaps SELinux could also use this to replace its own inode walking
logic at the tail of security/selinux/hooks.c:sb_finish_set_opts()?
