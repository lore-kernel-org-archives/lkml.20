Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317CB45562E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 22:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788389997; cv=pass; b=SwUSXlbbd5U2D692rnMUU6+LRvJrEsHBlye2v1OfdDP9KLXqFAsNfqktJtB2fRN23K5Sd5FmBhVwRwN/TRTW0cwozkYH8zmVJfGdb3QDA4lI2ZQWBCT06KmxqgZcpo4hn22/zVR+saXgOB8cx9XTeH909sXsDNyOzvsakqeGnYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788389997; c=relaxed/simple;
	bh=rTXpQ+CXf0UAR98GTf9ftMHYKg5bCuE1K9GVgjgylOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i/ce6vPa4cJQYQTMGv9SXkQoCB2WUhtJEIyntQOUclhqcYHadTddOMJf2eMbrZxZtGcjhRec6kGWQZwWpn5icLVx/yk4h5ENC1BuCBG8ZqF3XyhgVABeKTrifR3M+XdVmMCA2A4TSaeWjuwzx8PnrGDk6k+XDDaJxTW7zjni3CI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jKkvv7gP; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jKkvv7gP"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8588583a7c3so22072107b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:59:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788389987; cv=none;
        d=google.com; s=arc-20260327;
        b=dqDSlILO6sGegYbtrKUByDUxUI/3yMWmc2ocwHwxiB+SPiPYZ02L0GR0yUOPjO62uI
         riVsij5P9HzxaYiWfEhZVWHUesgCfadMM0O1CCIj/Pdz3bH0lV3imin2nWPlhubxj5PN
         kNKeS5xeW/gcOThRRIJIYd5a9ggKBr1NDnRUlnSISQu2HtK9xVNL3usu36GzjMRgswoH
         pu/hS49cGIJIRz89lkyO82pmmeF8jM2SUauGlb5dz+edR8QOnBUluoXHfNXzlevF5tPN
         Ew8gJ6U6g0HVt5RDvdZdLYUKc6kwUcRzfZjcYO1nZ3EbXNvG0SY0DXfbsS7Hwvqm/Iua
         ENYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rTXpQ+CXf0UAR98GTf9ftMHYKg5bCuE1K9GVgjgylOY=;
        fh=wGUVqt0wOu1BCa1w9iLR1iq5L837mZcVwerR9SPw71c=;
        b=YaKjqao0NYV/Yidzj+bpae9neI5x5tQKUS0TBw6b2e15Z9/z7HBNr086aKeXELMvRh
         Lv+JvjZts+t4j+0gdY4FLNe6EeTL+cEUj2y7ZUcj/afERXWSx6EOY3KQ2mkmtQg4yHDi
         pHl8N9O8M4xLsmH0Z01TIyM0ekr/LeyryfM1B/z3g+qe8ZjqFZk64tMMYypJjuKSjqZq
         xsmQUENaW5D9rjUi+PKB/bwaaYgjO0Li2qZusMUGS7mTBRoL/y+akbCafxom1FrOm4KK
         5iUFJqoz4vxdx29X6MwwAdjsqM8Ukrdr4xeiUNUs6/hdwrTaU5iHxZWHSJV9LbDvUGJr
         Sl/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788389987; x=1788994787; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rTXpQ+CXf0UAR98GTf9ftMHYKg5bCuE1K9GVgjgylOY=;
        b=jKkvv7gPav8QJXeGGqSsBXoBk7FgXG4TGuPxnkwQSHiJEOLfUiVzcFBapZkU1vzAUY
         mtrB3CQHE1YMUI9lkYDjlXSDjTg9UmCLDga5vdIqPMdoIsLKBVB2gBO/6VaoM3eEImuL
         A+syBtvBSL1SPttC3kiaVPhWm8fk9e30N1RXCVodv32jdsEN3gVOaRCk3ihGFjzI1N+4
         tgGxQE1BT7X8r7n2ARURXaTUX0QJH3twr9bTb9xIDYjKkSnOzhRG+cBi/xQRgdEdkPj9
         VU+QJ1/2n2okw7ya8tsUVwLaD96bPUEGRBlVDb4CzRCXKlx3Jf9sQ4oEbWEw5GBDIH5A
         1mhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788389987; x=1788994787;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rTXpQ+CXf0UAR98GTf9ftMHYKg5bCuE1K9GVgjgylOY=;
        b=b8/0ybCV999SwbreKtJWdL1tvhFRqPmyvDVvTHoMzJ7r0yWfEwy46VE9U2muGZ40rV
         qeek4B80zfvVNcjF2eQni5cLGJPHnGDCC2vvsdqMsl/xpf55kDCiOY6xEIjbbQ5kn1lx
         utjb0TIj8VJBgsPNDnfiRvvW64gsCHu96dzvsY9NOISL9p+DTA7d5h6kEi/g/WQN8adr
         VLen8VBc+feRvctpcmDvcHluoDZTUXxN3/ligdblC4SpxUCSQR5Cl/eIgYHAE3cjwnKZ
         HpmK1texVMLh9kf/Rltx18zA4AM4YhYxSAxfSOAmfmiJhtuvRtYVWDPbMUbfEEIY8Z45
         EY5g==
X-Forwarded-Encrypted: i=1; AKwUvBwmA44BLWfz6vp5Vk/Y/Y62U1qcDuhjh7LKRgusPWQXliB713h+b/ej+9dCLS7CpMraer1kA1TBfPte+iU=@vger.kernel.org
X-Gm-Message-State: AFuF++lzoGI/dfBxEt1SI3kBNaq9zGn/mkHEDVbV6A27BR7NUKhYGbU0
	A2lNWlibSkRTsm2wz9QkMeYSsw+llQUPoV7DuI3dbCwJ0Nb8kyAx2gLEzGwooNngOWkH1c+0q9Z
	0fRtGGCexOLGgs/I3X9Fi+Ygh8hm9qWY=
X-Gm-Gg: AYBFou3Utv7CmlAyt/jd5oNHfZwNEvTk1qEz3vTJ+UKdwqe9jHYfFP3mzlPh7EqKb1o
	ZpMfq3CA0zmmauBUuJGpOJ82HVynm/iU5E324OdZJNSSKSxpCZvfhcAkpeinu3H9zSjHseJOf6Q
	IkzbpghjgxpgXmPEi0wrndw2jn00Om+uPmlsKKAXTlOmn7ZpWAfCeTqSGWFEN841CKt8FBDWvbW
	NIgJnTtlUgJY2vO17rF22QeCSkK6rfrdEsP29OowXpBbzER2+0p2abeDdYruD23CU+a5Hq+cWMp
	MHEN5SpWd7ugfW0VMIbslWlHf4ueXPhiBWLb5cOPjkk9YBaFmFtDJ/ijfK2suWD1aVWfHJf8LUx
	MdmnYJfxrC6Mo8dt3zxZDngF5cPAsoLkKsVGWVNqU3mSeKhy51yQmqs/2tLJopvDjY5/Zjikog3
	ANgfiFopNb0lOXQTssWERDY9k=
X-Received: by 2002:a05:690c:399:b0:85b:946f:129e with SMTP id
 00721157ae682-86c54b1dc48mr34415577b3.33.1788389986727; Wed, 02 Sep 2026
 15:59:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824213158.3755932-2-Jeremy.Jean@oss.cyber.gouv.fr>
 <DKYH3KM93BDY.1MR4WLZSWGEU8@gmail.com> <CAE5sdEiGA+chRkkNGOWL89AFDNXor1RKHMEmouCNoCXVd4fc-g@mail.gmail.com>
 <d4e2ae332a9505cc2cee5a236ff86efb@oss.cyber.gouv.fr> <CAE5sdEg1eMs1Rip2mbCV570p0==2gj7ZtH8CttPfsqcM2CrB0Q@mail.gmail.com>
In-Reply-To: <CAE5sdEg1eMs1Rip2mbCV570p0==2gj7ZtH8CttPfsqcM2CrB0Q@mail.gmail.com>
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Date: Wed, 2 Sep 2026 15:59:36 -0700
X-Gm-Features: AcwNN1VCmzOwcWIZyaonAOUF1fh45Tj69mMYftlMVQbdIt0yPBMMErZSHvWRTbQ
Message-ID: <CAE5sdEhfsv0FgdAjn0h0O74voyZpsKyHrjE56SZ5EeTb30-02w@mail.gmail.com>
Subject: Re: [BUG] bpf: x86 timed may_goto corrupts private-stack JIT state
To: =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <jeremy.jean@oss.cyber.gouv.fr>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, bpf@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, linux-kernel@vger.kernel.org, 
	rlmenge@gmail.com, hargar@microsoft.com, apais@microsoft.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Sept 2026 at 10:42, Siddharth Chintamaneni
<sidchintamaneni@gmail.com> wrote:
>
<SNIP>
> > > Jeremy,
> > >
> > > I just wanted to check whether you're working on a patch for this. if
> > > not, I'd be happy to take a look.
> >
> > Hello,
> >
> > No, not at the moment.
> > Feel free to ask if I can be of some help
> >
>
> Let me playaorund with it. I'll let you know if I have more questions. Thanks!
>

I have a question for the maintainers - the fix involves changes to
all the arch specific trampolines `arch/*/net/bpf_timed_may_goto.S`.

Is it fine if I include all of them in a single patchset?

<SNIP>
