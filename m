Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C908230BBBF
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073146; cv=pass; b=FnV1nhhHjMzRJzZSdi7i4epcr9YVS4iryx6DO3aX1yatqdbo910QVXh1meZH9SAzXDjGBHcMYhtezEgxrbEG5HmaFC0rB8a0mA6kGtStlrNf0YLBJpNWCP+j5MbHWel2jGxUDocuurVsY58sVIHuEqmfU4re42LmG20TbdQtG5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073146; c=relaxed/simple;
	bh=ImFQPFwV3lGIcko16rv/96HN28D3qygOuzUAjJEAilI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VODeCB78x1IVQk2mgTRjkORQTcdpPOp6SFLoGAm4YXnxzQfbBGcXiXwdwrms57slYeXRiPPy1dfavN0uw00MUdfxtpza6H85x6ThWO5ESbzJ26S8+Uarv4ZL+7Gb0KsgIU8XSoLkYQm1N+5bgvLnumFbMir9kWN4KlKMQ6pjQDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=S686sx+1; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="S686sx+1"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e5d0ee1951so33717255ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:05:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792073143; cv=none;
        d=google.com; s=arc-20260327;
        b=NqyIdSs0Y/44JjPrft0FGSbQ5z8q3iQGhj1/iAlwnwSj3jN8XZy6tvn1ArKaHsdAT3
         RA3u4OiZG/uidxTzv2YfdEZ0Jzm6GhlQhdn52FIsMmtG1ERz7zGNYnXUpWrMMt1r97VM
         Gh0DMDs5WLOor/ciFzMU8j/vYxGryyNkYeyc1I4CPqrQvauFx/J93YFhssIyxKnWYsII
         fbl0vzPPEpDUOliyjkw2jDAMd6G0bfyCeCMTlKsu5YkJbWbzeZPPk/cCjHkCQqWcbBus
         19ppZdWmPG0j187IiuYCg4TJ1jyCZ2J3H7IheA62dbiHWJNkMaCjZLba02mZ1dwYtvp5
         JZTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ImFQPFwV3lGIcko16rv/96HN28D3qygOuzUAjJEAilI=;
        fh=ZSmaJUyIwLPahNoE1ahBjlO/netXD7PouY0OixXgpP8=;
        b=grdcu8zk5FExWx6V5hBsLmEOMFWkbGujjDUqC9gKh0PoIaJdkCfgP9X+EqpBarhAOd
         u150lmkK7dP0pXZriM8d2J78UGLU3iV6zrNf4kDhSdEKde2/EjIi3lDas46brTWxcYZV
         785IXoGFxmPYhye3Yxf+WqLpaQNq3tcR7Japwx4Hv7N89yo6BRXtkrfwU04CPeGRWfK2
         gNMu/X5GN4lN/1eiLFmPVgPS9nzWJN5udTUsKR0HsuXiP1wh4dgfWQHMDXMN5KPh/nwR
         rqr5f9qjEQUzt0wnxDaAkSh0frWq6zpzUFW6kK/e8m1e6q1uD1MDu5+BQQ78bOWYJnIa
         FOaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1792073143; x=1792677943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ImFQPFwV3lGIcko16rv/96HN28D3qygOuzUAjJEAilI=;
        b=S686sx+11bTbY5GbVwhlJsHfWY5sjoIxWw97zHJ32ADkIpGQ+E/kI/0CbCy02LQqSu
         a2w+o+pIA+Sjk2qEkzSN8+GArMEI17Tt/UxvBc7VqNGePKrybrHo9443G+zYqLrcoTdt
         VWRMDBNiJ1uzj6IRIIzfBKQlzBClzph3xDhb/w+VKAdBE1eAInXua+Dl6eQ10cdWIO1l
         cNxRGga9qCGxSDpOwj3ZB2ulKqvVOrPW5pakK0tbEeZK9ci0xp0NiOFmXwpSrU2gHY8Y
         ylAbSY6uNmiVyNfutK5PigPxOzfmwQGHQ0FpnAenkq8RQhp/JCxMUrUWJ/o6K+o0s3bD
         NAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792073143; x=1792677943;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ImFQPFwV3lGIcko16rv/96HN28D3qygOuzUAjJEAilI=;
        b=JrVPKgUoM1JSCpOOAblSHgFIZjzwoW89zTbbV/FU1nBDMelFfa0PCgix+b0ylcfIKP
         zAGBJRWXKVvmx9a/O/VGSoQdB5HZEFhtUrzleArTHetFLh4evOBTfF57nilMlNUqUyaZ
         5xOxrxxDQ2ZurDUr3Ghd0acR3phTPIFfQL1rdIGKxoqK5MW9xYPJhv2mcwW6S8cCT0Fx
         Y0tPtHKWC2q++zoKm7JGKbbpQj5HIeOaNYyw2tRt6lwSyPOwenSkddM4pVD8pNVpdhJz
         r3U1iwHBJmJ5BiqU3gCr4CEErisdEQRiMHjdK1rDk5Psjkd/QekrW1OqsTwvcCZpFtNf
         GZoQ==
X-Forwarded-Encrypted: i=1; AKwUvByxxgoNRUSuCiHTbE654igWISPQ1VSG5MdSqzw0Ww5K73QK1DgEfQwboL8aiS3NsmUVyyxzhJuFw+xNGSI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0v4nYQGIBRa6CE3iBobc5h/a/v7aVBNKtB8wENReKMyycF3Gc
	qxdIPVQ8v7dtrSKTaswcWFcnimqBpvk5LtBdDHnaxahV0XSwfwq6wUWODoPLPaeaaCF6cobqiRt
	VGTuCbNUiPHJLgl9AysnCJ68dQPoTqnwjlXRvs4Bi
X-Gm-Gg: AYBFou2CEIixRhyg47VO8zwCkmm/5Sni4EX/94KQSJg5Wa5kaW9Hpj2z4wZ3C7J1K2O
	nvcZqCW5qAwnAWX+RKD3MZ7/x9ifd7l5Eqo1US1LJQp6Mfd/wr55Lx77QrmcNBbiFXSSUBZfYIz
	7fjNnKGuClYIMrgizhC/9W8y09XsCYeCx+8p4n2NPWF+EhluklEu0OL7hnYIsPI5UDwY4p8sTcW
	22WzsEGcAoN1GX7RSFadZjzwtoROApTmr3LaH2VAXtVdVD2xWWdIBE8bBot6OU8EbcVnsI42H2L
	Isv+sDehrpn3qIl91jKtMgxsexnaDLTuz+r8NqFYWIIMmFucIQovF19MirZjQWhkSuJe3RoxyY8
	bjLCp4MhbPGE=
X-Received: by 2002:a17:903:2a8b:b0:2e9:4f7b:affd with SMTP id
 d9443c01a7336-2e94f7bb5bdmr36582545ad.6.1792073143026; Thu, 15 Oct 2026
 07:05:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014160741.222219-3-blum@kernel.org> <CAEjxPJ5tbPLOj17dwEDvzVNEJnEgMy7hGgFzEe8MYwzVxU1smA@mail.gmail.com>
In-Reply-To: <CAEjxPJ5tbPLOj17dwEDvzVNEJnEgMy7hGgFzEe8MYwzVxU1smA@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 15 Oct 2026 10:05:30 -0400
X-Gm-Features: AclHuK_2Ieu2G96FqstOihSeQiRTaHucFgcmqqdmYaHDfkKf15sXBreZo4_0rJ4
Message-ID: <CAHC9VhRk3n1fq3914rufiieTLMEVkqJ14wXUgFR7-MZ0=pVgiA@mail.gmail.com>
Subject: Re: [PATCH] selinux: use isdigit() in selinux_genfs_get_sid()
To: Stephen Smalley <stephen.smalley.work@gmail.com>
Cc: Thorsten Blum <blum@kernel.org>, =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>, 
	selinux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 10:01=E2=80=AFAM Stephen Smalley
<stephen.smalley.work@gmail.com> wrote:
> On Wed, Oct 14, 2026 at 12:10=E2=80=AFPM Thorsten Blum <blum@kernel.org> =
wrote:
> >
> > Use isdigit() to replace the open-coded implementation.
> >
> > Signed-off-by: Thorsten Blum <blum@kernel.org>
>
> I seem to recall seeing this same patch possibly from someone else but
> regardless:
> Acked-by: Stephen Smalley <stephen.smalley.work@gmail.com>

https://lore.kernel.org/selinux/20260928174643.2458710-9-cgoettsche@seltend=
oof.de/

--=20
paul-moore.com
