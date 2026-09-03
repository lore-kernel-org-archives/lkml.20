Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEFB4A8FC1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440858; cv=pass; b=Vj61sRPqmaA6AMAG7+Ah7PED1n+A0mBt+jOc84TaPqZR2rhof6DCkOydrB6fi0oFMG7ZGBNIvZVCIOXH8TdUyJUiFWbt/svl/BHaGLjObTvrYvfu+tht+1hR8eMpF6hVeYpb/Rdd+KnRsisGwIeIbMaeinOKirWu1G4OTQDathc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440858; c=relaxed/simple;
	bh=Nd8rHpqZkzQnKuba89VN+LJt6o8911mVett5MRHbbrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=shoxhqTSI8uJ7FQd2wk3C1sNMr/Gt5pEzcIsSWwR/aFsNAW2DHGLioHyhUTximnjfu9NC7LdxkEmbDZNDXdk+pEioBnfmmhq+D1cfA05CY9+QdMVZsqIeWdRwDLs6+s/TVe1/s1stCKFjowryn6isQ06reu+0sFDLld6n3InvL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qa/xRcBZ; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qa/xRcBZ"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a68aaf4840so2410752a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:07:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788440846; cv=none;
        d=google.com; s=arc-20260327;
        b=HFoh+6Ayabop+HmbroVtF7OIuUWF0WP/5Q1NqiuOPsnjDJ0fKMeadf4MlTNlFzEyIV
         F6fLfCDktLa8ZQl4nfaedVt9r1OUrYsy274QQIyRP82KSA9n6iBlfD/pAPKapNfR0IqZ
         pDDnTi9h8W9WRKDfi/w8Q5Dh6u2NASmTYdLDeTMNom28Erd6DSpi8svydNpjRb+SEsVs
         sxAnt1ZXnunO15VYHmVvQ1fI+ZtPKA4sHpTy7eb06mxMJkD9Yr8GNCZrK9l2GXI5O1TT
         T9KDba6tyyo5xPuP0RUd7QH/+ZjMcLUOX4sxPDYp7f7fRa5/bTf96O/uoRqLpfEbE0d7
         vLZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EUp+GFf63QjLB7Up5vOnqaAVN0sMzMPtRL1Aa1NBkZU=;
        fh=evm0ztb4zxekd6LYpu46iBPJ3MOAvTB0vHJU+Ww8Ivo=;
        b=GjCWTv9HexoXTs/2QM4UZs9L84N6RIFGy0HbS1ZYWOtgsQzJZpwFGipIb/4ZZW3Awj
         7R10TL3Y/atVTHNZhntci0uvn5T/COq1W6GJXqD5DjDKJbeELnmQJoM+SGmKGJN9sAx6
         G3qWpRJaj9p0MreAMWZWD4T6uCkNoiKvAf7ABjoCYd2I0HatDjEneh7uBaxT7gWQ3W2Q
         t+Vfky3LJ75IcWvZ4pkYQ9Ppf/ORrd8cVeMwX3cEsSthYmX603nPgA4zzcsLiMd70cAP
         oq4jy66szPs+S4v56jXX8QGVmPpXWpZGm287E4RFGXg9Io7y+qa1iiEiHg0xov97tter
         E27w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788440846; x=1789045646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EUp+GFf63QjLB7Up5vOnqaAVN0sMzMPtRL1Aa1NBkZU=;
        b=Qa/xRcBZADon0kzqw3wwVTKLqfbXrgiDedpIXkLzRysLyhW8yjnLh5hGFxPj+fHxkO
         pMOccC/t5RTOzmXJCabUR1HA4ICzuIEONHsMkm3tfcrRoN4IOlLI3u7naIdGcQeICm/9
         H+h4BIyNHc+B9zsQeajNVaVgEtS7EAhGOQJatPF62gJ4OLWXBBtJ5fSlRUXfihE8daiV
         KfC0sYN01gFPqa0plblAIXvkFNREEeWX6y4akPDlMXTpZ2fUKvCWQR+TjY8Qd7i1xLR0
         +NUnaykzc4N3ndqO2qd174aekOiHRMTrz6NkgzEAyuAwQW6UTu2cmlt/3r/3nu+zwkT6
         yIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440846; x=1789045646;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EUp+GFf63QjLB7Up5vOnqaAVN0sMzMPtRL1Aa1NBkZU=;
        b=NIA4t351jVME85Yj8U3Ri8oyoCG+sYgt234RnW2bWFzlb7Q9lPLn4B2zoDOLfnFwHW
         dTc4h/rVwcfYE1/jxgLALnthHkNQ83qqYZNpG9ltbKYskfx+RIe+PAM1ceQVd45ryYp1
         bOoBSLJSxuxq+EwdcBsLW1u9/KAkHeWjk+LWaANndVK+iQ817Hd1pU9uYhDBZvbwZ7PT
         MZDslciPVWO9bPwErAZJogxBGOmdytWQnp3PUbiPyv+Jo8107/G9rJJUD9io/QmDDL+c
         FFsvCbObbkoD8DFuOHY6Q5t4AWVfzHVn7nh8bLKqVg4k+hm3bW1Z/KNPZW4IPrIvHNsu
         RCbg==
X-Forwarded-Encrypted: i=1; AKwUvByI8CEYBdvL3aQdNvFwmktOGqoXSuPxV8kTKJgcjwXhTEzgS9xewG+tUcI77lUCpRIgDUPOVJviox7Oj4I=@vger.kernel.org
X-Gm-Message-State: AFuF++kmqD6GVhkNyKBX7/JIz9hfOwnBkgo8/53vZRcIPYHZ7J1SBY2d
	MSWd8wMb70jCppy0FS5TPFzojls8v1YUbOxIWeYH6zqJzDaxZDMremUqFDlmAqIQfqE2FpcG/ib
	GrgDmp8S4AdU+Lcw7uBLnteBpEtS6SVw=
X-Gm-Gg: AYBFou1Ize+190wnU9Orymx7iWj/3a3fIk9pX5EpOhB7Rzwouqy1KHSAl13vO4NA73q
	sFAQnSuTgI5pNQmcgQks7AYML8HMrpwKX7/wQdKuuTVRD18bpUYlpk2DKPX+lZgBtfOEXNwMSP9
	GaEFJB8El6CJriI6z8CvMCGplDBwvsFC8LmhbI9urUOGs7nMNN+I8GJ2Ftonk9C94B042vHaMLr
	eQ6GhRZRUvNfKIdS2vYG0jrlsQOZA30ZBqi+HVJ0KDRh6ttMGm0HH8Sl/jDxJZFCDO2wOPB9W4T
	D2NFwxwZZjEzhK4bnPwIykiYXVvXGddbRLKhlWB+N1q1iH4aHaPfiDYQkg==
X-Received: by 2002:a05:6402:a246:20b0:69e:2ca5:53bb with SMTP id
 4fb4d7f45d1cf-6a6b343441bmr992277a12.0.1788440846228; Thu, 03 Sep 2026
 06:07:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827045007.3831259-1-4ncienth@gmail.com> <yjfqzckumtd32dgqidi5sndvth2t67mjwah4kt4jiahlx2a5uf@if55sinfv5o7>
 <20260828042421.964822-1-4ncienth@gmail.com> <ptco7s5x7tjzp42dzlsitibdigpwucl2whwrq37tknjpo7x2lc@b7q27ldlorak>
 <CAOQ4uxgB9anyJcWem04w65VCJdxbbb2cQDZ_u8qMusw3xpB9Gw@mail.gmail.com>
 <63aj7jbfaoamdmcurlge2c2kqpliaifgq4vbythrrxpfyr5vtm@z64myom426zd>
 <CAOQ4uxh-NZ76hEFoNNGjyhodr9U=dvZuGVmYHVPGZ_=jRxCAsA@mail.gmail.com>
 <67hq7zqnvp6onwwjp24axucgxbzsko2dphielupdfzmfyk6x57@bdeef7fjkqfa>
 <CAOQ4uxiQF4M_YSBMW3h8VCKR15GV6g_K5nf=2odtYetEwKHm9A@mail.gmail.com>
 <6n6r5zvcu5ojihyb52rhejlky7xrn2a2p4l2cgfut5lsscunek@bcnpy7bifjrs>
 <CAOQ4uxjbEY12XMmfCXTPTpASmECCXcGBQR+bS93k=4vgqzFDZA@mail.gmail.com>
 <20260902070359.4163607-1-4ncienth@gmail.com> <CAOQ4uxjwGdKhX423KoFxW+T5hc9uzCWSsGwn0-QX=CJipPSaYQ@mail.gmail.com>
 <20260902215046.1149198-1-4ncienth@gmail.com>
In-Reply-To: <20260902215046.1149198-1-4ncienth@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 3 Sep 2026 15:07:11 +0200
X-Gm-Features: AcwNN1WUjp1-QCHEtsLKZkQ5zIRcFzgXuNi7fdLVVvXP37pnci0cT-0jS81qlNg
Message-ID: <CAOQ4uxhuOSyMHnj9JZk6LU9=wpE=BRFXJ3fSEOGGV+6tC_5hfg@mail.gmail.com>
Subject: Re: [BUG] fanotify: destroy/add race leaves a mark on a detached connector
To: Daehyeon Ko <4ncienth@gmail.com>
Cc: Jan Kara <jack@suse.cz>, Miklos Szeredi <mszeredi@redhat.com>, 
	Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 11:51=E2=80=AFPM Daehyeon Ko <4ncienth@gmail.com> wr=
ote:
>
> Hi Amir,
>
> I was able to make the handle-reopen sequence reliable on ext4 and drafte=
d
> an LTP test for it.
>
> The test keeps 120 auxiliary inode marks on the victim to widen the inter=
val
> after the first FAN_DELETE_SELF, pins the unlink and handle-reopen worker=
s to
> different CPUs, and has the reopen worker read the event queue nonblockin=
g
> before calling open_by_handle_at().
>
> I ran the exact final test for 100 iterations in each of two fresh 2-vCPU
> KASAN boots per kernel:
>
>   - unmodified v7.2: 200/200 iterations reopened the unlinked inode, and
>     closing the reopened fd generated a second FAN_DELETE_SELF;
>   - v7.2 with your patch: 200/200 iterations returned ESTALE from
>     open_by_handle_at(), with no duplicate FAN_DELETE_SELF.
>
> The test is based on LTP master commit
> 12724413534a6d4160ff9694ba6f09daa4ccb6bd. The attached patch adds
> fanotify26 and the corresponding build and runtest entries.

Very nice!

I think we should wait for Christian to pick up the fix or suggest an
alternative, but after that please post this test to LTP.

Thanks for following up on this!
Amir.
