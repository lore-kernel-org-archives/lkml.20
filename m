Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EB9439327
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494731; cv=pass; b=kmMwK2gM1e4TVMFJGjx6/4syalaEl6UrQ06zgmTK3zhz0Y6nplkPW4Xp2FSZTPJQNaWPzvIMpM77AJimjbidcnU/WmsyJeIISnEpfSFfeOeo0XWh/n75ruZMvsUJaLaGWE0amt4kvxX5iFInSQYhhrZodGdxuLlSV2h/URrbvso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494731; c=relaxed/simple;
	bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fQjsuqpLuh89DLGq0UIMVPqGWaFF7rDlCTyx+a0nDGp7IqOWW2qfh3YyQ83QxS3k9IvJ3cTdARVbHTU8OOdLNI5Ybjk0JFhGNkFzKC6DSd2iVE/X5F3WLjqsGHnjR4PplrrS6HCXX8jNj9nNST/1Wo426slVDHB+ySEqGQIQXZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WPgx9Wh6; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WPgx9Wh6"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db425c9050so12145ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:52:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789494727; cv=none;
        d=google.com; s=arc-20260327;
        b=cIfC7qUXTGqWMNdVG6ReVZn+nhTCtLQ36b04tiKxHabhd63CWesWmDchYnGWdG1Kzj
         U4IM/HqcEXySy1DYQrIaHEjVjFTow7GNqv+ETQ781oGV5XhEhKe8odLWn6U0J41zsULK
         RgKJjo7c4Aq7ZoSVHe3rTM1oCZwiBipS0UuHyKBRNbuPMOVzCPXbnucD9PRd4+2MkOCA
         mkEWqErdcPHrEQwVm/MWyrj5JgKOCCnTA01dR64HMnagG7XBKROO3LCXkMIEJCtdvo0x
         6kaaVgLDExtjm6/SvhXInqX1kF8WRLS0axEOvMVrHeYe8uGLNEGt4LgrkVXewglq6/Zx
         KROw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
        fh=JTAm/Hf2JIjDtPtXLzPf3NlHh8b16HrcJx682eG53sM=;
        b=LUE9jKqwKvjlt9AfbWQv84NOe87lBa6BAv54KOjVaBAoVWb5UNNxA3oWtAVFn41YIW
         H/Av7qqI2EIy6PQA1zFxPxrA/LCFvc47073xKlL83zkInh1GKthRHVGFb4q7vu1FyWpR
         s0UwS7S2rcBIpLDHUx/ce1B9TwOES6oWZlTe36btwOSVnwuTk1FnQWhbk8e0fd4rFl1y
         rE4C8XSI/PxFTn27IcRK1lnz6n8clOVxQW3OdINM1VU81nSDTjYMdYN9e99X5GnESANC
         9WvODtr91H02dZ7kv2gpoFjGcI1Bk0S194wPYsq+nNsx1r9ZqLFn00jkdms5/IOKb1dY
         Cciw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789494727; x=1790099527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
        b=WPgx9Wh6g8ehXMOaZf8ZSNtevHb9fzr3lXk5INKsJirqC99dpiARLSwTsIwHA4pbMW
         JbWx8MvBxDUFu6opqA60njTwuSet+XjH0Wga4OKXeEmVhOXoy61UWc3rqiL6EU8/l428
         EjMY1UqvowxmFEZiD+cpXVE0I3gM0Ssco82ZH8FSIs0h6jzSdSLoGG2b/9Ga+W+7Aup7
         R3Y2jKX2VRyqaVjVjF8po02JGQLWYioBTM31SQGX//CGOHsZjgwuKy0KaaC3tSzQflwo
         ISJi8sLOMT0xayOGlmIx3TnuUJAs8/tTEps0xY78QDJPw7a+XDrg4k1OSruo0M4Rr9uE
         eRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789494727; x=1790099527;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4G5uXJmB7HF3o1L37WqbjganRxVa3Gn0saA7lTxNiM=;
        b=D0XoWmpu0XiMc+w2iKSuJfx2gX4+WAaz59o28kEoovG1xNj9Uw7RqQ+Af9NJ+go+qs
         j6DTkkzvavQQLCq+rzUe5NpXMW4dAK6QZFy2r9FjIeIRpfWO0AZOVrpLATwz4zF22hZv
         F0/PNMcvsrvkX/jwNnvPcck0lrlqmq6GtMTfrTq7l6ZOYLbxrzAL+ctsvvDEuhmOCjJX
         qGKakP6tFYjqsd8E3AfjTeoVET74WG7S+FuO7hC125W0chZ0SG1WYOIaicvnBUEXQlJS
         g4f0o5lcpL2sCX3C+oDfGNIBKlFquK4+jQtr8UXPmRquEw5qS05MAIueXEZYxioAMmM0
         ZnFA==
X-Forwarded-Encrypted: i=1; AKwUvByPNoHfUqWBf9K9BV1MJt6/+/GVFQ+/WNMwjk7QK8vS5dx5mgD2LKz/KQyVLc2x2pIylBl/Ayd/0br1cuw=@vger.kernel.org
X-Gm-Message-State: AFuF++kQhbvnpUo0N2j6q2hj5H+7vjaBtRk9d1e770pFtA+f5tP1x9Je
	zWu3A+bbR3UIUr/AAQdz+ErL0+SSeZlD3dpbSxPQ6KJJ2wQW3szdgCXqw+mDPGx5gDjuVidXlvE
	h4QNoPWGR7ZgGeyC2SCfoitGyT040KhTuEH5wEkIM
X-Gm-Gg: AYBFou20OEbEFZ7Teix8SNpzupLck5slDm9jKS+Yx4j3MXHyYiAN0jESMpr8R2ZDUku
	45CkYShq/SWcKYEw/yL5GP4QCAoDHKIj6d0wX1dYraS4JCf0t8oPQnyhjTl72KwhQ88xenO4D5u
	ZRNfADYxuT5zwdMSfDhP9NCMyVBr0O6U5vVT9/ExwJPcoDraoOVc4g6juu+6xQdK5t5fCaNhu8j
	k9nal1aE/vi72vxQDDDBkBrn1+mvb2OQGE+JhGowX/X7tkO8LtEJxdIphTL6CPwJtlpmXUH4uHF
	eLJiL1F9Sz25aRFQSHbV3FCLpw2O1X580aPKXhnZGC6swRbScT8Snnvr4KkFAIDlKFL3GH8uNot
	XDcxoGPlMwkLgZJfXqw0WpHkbZbd82IQ3AmZdJEjxme76PkjeKjs=
X-Received: by 2002:a17:902:f612:b0:2dd:5363:31ec with SMTP id
 d9443c01a7336-2dd89c0c38amr177395ad.14.1789494726332; Tue, 15 Sep 2026
 10:52:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
In-Reply-To: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
From: Jann Horn <jannh@google.com>
Date: Tue, 15 Sep 2026 19:51:27 +0200
X-Gm-Features: AcwNN1Vhgv53PI2-XyXtJBbVzCNkGiiWjtvOE2b-8zHim7-UybJ3H2xniPj1VUE
Message-ID: <CAG48ez1RsdT=O=-0city3vjgWhDvY424KtTmrCJntWy5ds3HBQ@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Christian Brauner <brauner@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org, 
	netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, bpf@vger.kernel.org, 
	David Airlie <airlied@redhat.com>, virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	kexec@lists.infradead.org, linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 1:31=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
> TL;DR, this lets arch code handle fd install and cleanup. fd_prepare()
> allocates a descriptor like get_unused_fd_flags() does and records it in
> a slot on the task. fd_stage() attaches the file to that slot and
> returns the number.

I'm not really a fan but I feel like if you want to do this, you
should be using task_work so you don't have to touch the entry/exit
paths directly? (And if task_work is too inefficient somehow, you
could tinker with the task_work implementation.)

> When the syscall returns success the exit path installs every staged
> file. When it returns an error it drops the descriptors and the files.

Is this mainly about stuff like "we installed a file descriptor and
then the following put_user() failed"? Because if so, I think a nicer
fix would be to have a policy of "if userspace provides unwritable
memory to a syscall, just keep going and pretend the access worked",
and maybe have a sysctl that kills the process when this happens to
emphasize that userspace should not be doing this.
