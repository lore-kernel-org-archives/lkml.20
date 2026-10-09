Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9563A5445
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 05:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791522470; cv=pass; b=hSvCgff+/qfNKK2g0jF1C7jHGcyfuMYnXrxsGUTnf7Fgbgr4uRPq3AyDleT9LUf9BHb+GW464GFeOXhfKCShIL18UjJ6L7zzM+mPy/oM9bA/pTDfJqVY7k94HFy30TcBDdkOYonZ7e0mDusC79Wh4R6q6afzA4XbHwq2C6ZTGas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791522470; c=relaxed/simple;
	bh=UCPNgs7T7S7vSxo0RpkwEmW84kuw7TMAkPdpCW+Ocws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qiIiNULzyGkmfjQNWkJPJEdixbMU0uE7tsTQtnPnOmnXB2u0N63ex9aQupjGjfBvyWr54ah1w9QmF6NJqH1oYEbCk0yJXJR1869NgeRZcSm42DMBWuGPa5+ycgXS3cQUC9cs9KVqY6w4PwjvUYwP6zccJPCLtnEe89kk8kfPUZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lYgM4cQ7; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lYgM4cQ7"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8565d77c277so39749127b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 22:07:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791522468; cv=none;
        d=google.com; s=arc-20260327;
        b=B2rUa9VfPzBQWwOw29tIsLT3USmApuwZV88EiCutIS7kZZUewIulNpFckZaMJmjfV8
         PnNXD5nS/so6Wvd0b1G85SieyarhFiStVHEeac3NQKFI3Vr0hS7vGLHbcGxkDz1d9yxe
         mfGEcrgTqXd+o2iuxRl09Bm6zB8f9FtGJKkQXpvImhVW903uE8lLWmGZCNDC8Hrg1EQV
         Lu66PA2nnpXIwb9BVNvKKieYm+UhCqcGmMG5I0wef4XDKFvPvdM8jKEX9ysr0CQxt7dW
         x1Fx63B0KZLl98iAn0pJ/MqE2o3xM0uMYsOoDCZ+u2C9g6L6X5XOpwhi4kh3WNff9O6f
         o8fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7dtIf3z0dvmVlA//c0wg2QPe+8angNo6UaOAKikdDOs=;
        fh=YzJoxnU5y2p5L4nBWV/xhz/Zdrp026VIi2f7QP1GPr4=;
        b=OEY7mNGyynk0g6wEG6C9YzAOca6SgEsr+TaIb+L15Z3FVgini6/DYWaxa7G1LlZntC
         xPJs6V50tdbClSdQZvMOtB3/6PkwjoI08PE4JqlECBFJ+wTXwy0YhBOaw3rabH7a6pO1
         ZfqGbQM1EXxbjxc3hgARlCaLkjLFK+AgMJDRZPOKxMycRAXA8SwXJQeTMnKLWQc/mn9G
         ugCLChVyXg2DKCxBOYVJ1H6L7M0G18zuV4zcCk++O8z348K6MgDKFho153r6SjH17J3Q
         i8wwpPy5AsuoBTarn2H6bkmu/UjDT4XIjgQib47wJaCeuuRmedPQVV8U7NiuaUSFOxyz
         shqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791522468; x=1792127268; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7dtIf3z0dvmVlA//c0wg2QPe+8angNo6UaOAKikdDOs=;
        b=lYgM4cQ7CxEgMrskLr36CaxFfeibwioXt8yCoC0CfS6Zo2NcA8Q4rwqfuofTFI1Vrw
         F4w7RNTfmiax16hPrlL0IF8osvzHM4+KW6KaxJv56YoJO5hralzumaLW0CksjvWK1q0z
         mZh4p51AisS8wem2TYap8nCy4nP/tsjtgDn8110DobsSajHAYWXmJsAsr6hPsGjVJO+y
         58CeuY3GNlrmP4Lo4aAlN5He+Mg9IxzF9YcvpZxieW+/NN5gGYbVLGGWb8GsId6INjhx
         djC6q3kWqixOhZXElqFBSyTxrlI2yESqnrS3B+bhGVYkYJ9g/1cIJV3gQpAvcVne5zK6
         f+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791522468; x=1792127268;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7dtIf3z0dvmVlA//c0wg2QPe+8angNo6UaOAKikdDOs=;
        b=aUbVn5qQXkkRfy3uuxYj4fsBfyDxhjuQppYIqs875LKxahWZwc20cWGb5ziyq89ZUM
         qLD0r5zoeiJikgqC62EcIzq7WsL0BlCxx4fM9vqnhCdYWMAzUr+CVA4uzUphZBaHMyMd
         KnmhEwEkizUwoHfH0iqbUZRCDF2Rvpy0J8buAi9rJNS2ebGhRfkEYiUXvGliiDAMRGK5
         b05riq/k8cYM+ai+Ma+2qwEahEA/W80xpaemFyv7sFwrKBTn5yGSwij3aCU4JKSySHt/
         d5WwdkLmomv8wBNt6Jq7/F/aWyWzT3qK56UIWRnOuN+9q5NRHXIe4Fmgoh9wCWgE7Mps
         EIWw==
X-Forwarded-Encrypted: i=1; AKwUvBxu99SXRsz75vZVKbohjaZ8/9EwV8Bpi+wnPT4DrvkqlOnvvr/jPOvgnUQVkkgK4AsbxhZJSZWIBIMIa1c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdpdRrulGua/peCWJ9Igyg3oBkcHWxjKwC4vScdGB+LsY5SeFo
	Rm+BbyqNrdUL1oZg2KsUcQ+54M4sA8LcgUNjD5wpAb6K2F1jCPq8mJYZs06Ktce82zLpGAc1i1b
	tR05eHoKs/8z3rqz3639xSslFoFAy0hE=
X-Gm-Gg: AYBFou3WTnjQyVk3GjkUAnryWlFf7EfZ39Nnp+vEQslarROomxgaL461E4aDryQDwbP
	qS2wYfJteHBwfHP5XlQ8DicDeivfU9XrhUiqNBAfOKUHdZLQSiv9mmI4o7wrNEiuw+a11lfDPj5
	C8EYbm7jvd+GeFErxUeT1XnaJ4VNMMm0i+isRIJjj4dJP+Tv5ld4K1Ds02RRAaRigqzX180n6rB
	ZwADAd6MYr0DpKjlZi4KU4nDYZiGUjigLPic2NvKNZg8DhAQ/wLxKq7c8Bl41lDo3BcRhWmYpi1
	S8eKnOg6r0qUZyxYS+uP812UxNVy5dvvvEgYZMOHyeEoZavtu19LU6GB/g==
X-Received: by 2002:a05:690c:a588:b0:8b0:7900:144b with SMTP id
 00721157ae682-8b07eea68fcmr1801207b3.68.1791522467787; Thu, 08 Oct 2026
 22:07:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-key-management-objects-candidate-0009-v3-43bbf21d1c452f23d829@gmail.com>
 <asfZMToWNmQDTk4W@kernel.org>
In-Reply-To: <asfZMToWNmQDTk4W@kernel.org>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Fri, 9 Oct 2026 13:07:35 +0800
X-Gm-Features: AclHuK-clEa45iiMBZBHhd7Il41JvNCy-ntPtuIu1Vj_0gM0qBhgbfp7uMK-3Ds
Message-ID: <CAFRLqsWs0BK+dLJ2D+cFptF6TtgqhPSp5BYOz3K60AyN=oWOPw@mail.gmail.com>
Subject: Re: [PATCH] keys: Protect the type name while describing a key
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: dhowells@redhat.com, paul@paul-moore.com, jmorris@namei.org, 
	serge@hallyn.com, keyrings@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jarkko,

Jarkko Sakkinen <jarkko@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=889=E6=
=97=A5=E5=91=A8=E4=BA=94 01:56=E5=86=99=E9=81=93=EF=BC=9A
>
> Just a small nit. Cut just the snippet of the report that is necessary.
> >
> >     BUG: unable to handle page fault for address: fffffbfff8054794
> >     #PF: supervisor read access in kernel mode
> >     #PF: error_code(0x0000) - not-present page
> >     PGD 1a7ff6067 P4D 1a7ff6067 PUD 1a7ff2067 PMD 100b0b067 PTE 0
> >     Oops: Oops: 0000 [#1] SMP KASAN NOPTI
> >     CPU: 0 UID: 0 PID: 500 Comm: key-fixture Tainted: G           O    =
    7.2.0-rc5-pmb-bt-functional-v1+ #1 PREEMPT(lazy)
> >     Tainted: [O]=3DOOT_MODULE
> >     Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fi=
x, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> >     RIP: 0010:string+0x23f/0x470
> >     Code: 48 8b 04 24 48 83 c3 01 41 83 c6 01 48 39 c5 74 34 e8 f5 2e 5=
e fb 48 89 ef 48 83 c5 01 48 89 f8 48 89 fa 48 c1 e8 03 83 e2 07 <42> 0f b6=
 04 38 38 d0 7f 08 84 c0 0f 85 d6 01 00 00 44 0f b6 65 ff
> >     RSP: 0018:ffff888116307b80 EFLAGS: 00010246
> >     RAX: 1ffffffff8054794 RBX: ffff88810a4a52c0 RCX: ffffffff8626be7b
> >     RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffffffffc02a3ca0
> >     RBP: ffffffffc02a3ca1 R08: 0000000000000001 R09: 0000000000000001
> >     R10: ffffffff893cfe57 R11: ffff88811404d700 R12: 00000000ffffffff
> >     R13: ffff88810a4a52d4 R14: 0000000000000000 R15: dffffc0000000000
> >     FS:  00007fad30f2a780(0000) GS:ffff8881fd7d6000(0000) knlGS:0000000=
000000000
> >     CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >     CR2: fffffbfff8054794 CR3: 0000000104fb7004 CR4: 0000000000770ef0
> >     PKRU: 55555554
> >     Call Trace:
> >      <TASK>
> >      ? __pfx_string+0x10/0x10
> >      vsnprintf+0x330/0x1110
>
> I would cut away the rest (what follows).

Thanks for the review. I've trimmed the KASAN report for v2.

Best regards,
Cen Zhang
