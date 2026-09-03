Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B67049F130
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788437223; cv=pass; b=T8Ugy5XkYQz5ch6zVw5jx68zmmGpDJngjf8E/xiQO5/jwDRJNq/I89BS+97K2rcSfhcaDIBd6CyrwlDq/V+DopC/HeUwyr0vZ4OrR1VjtAumbCPMGNMZkwLA7vXWA/9ZCauBGpuxDYslDui+ef6Of2uabtAxCKa0enLVYkgDbco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788437223; c=relaxed/simple;
	bh=N9hcHMJS/8lnE6uQtyDcuSOjyISuIsi+YVlWMBbwn9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uKsdd2LKUWzTOebbZnzTXI4Bv6fwXctcvTiTTn+5j9HxF+BZgWf+9guzGRA66cEB24aFaj66rmohfoiYuLhmC+luQUGcNYd2OX+5i+Uja6ZrRPAPH7AGr6NkxvlI1CdBPlUqV/49ZqLnbv6z+z6odifHQZTxJcY9iaRt/bV70PE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l5nR44zl; arc=pass smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l5nR44zl"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-85590c5aeabso1938943b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:07:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788437221; cv=none;
        d=google.com; s=arc-20260327;
        b=A0OO/lboDaX/UWuRDLe2Hpnd4Y0vIJ3czwVCW4IUFlWVHEm7UHAgd5E54O231Q2nWi
         vntNCDogb1JWcY5yhaAQf2qnpCCpaL9eJXc/r1Wq+QrC0z/4SMrQ9XaPLx8eZ0txJat8
         6EcEOuyceQG50xjB7qqwRVkOc5Wv5Mbgj33qIgCcPdGu4N1C0rgPPX9mu///m09R9oqC
         HzamIYJ9h6e0JYNzbWYd3Ul/wXXy/LQJkWzgcNc5OIh5YMzanOsuQcIaXMzpo9zpGlyZ
         WRTMWnf4x67FitAVCJZKovWU5mDV5xaW8OqhS0hXSDv9v88w4mSc7zZxkASq+DDHiMOz
         PPCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=T7mRs8f62kLAbWPgFDhouIuEptLLIIkw44oKaw49xlg=;
        fh=4gVxY+qsDaxxNtGae0tS4Kw1G2PQpscssj4tsBaSmFE=;
        b=WpPWjJiur0Yxejiv1CQ4H3BbA+EjZpHK/GT5BmQ/PW1gwZniAzYrMFMa6JYNIQn00T
         IrbwrkJY5EWeO680vFnWYZ9QdQ24ITCArWldyFHkL/A/p4eb7iAd82XBDd0Rymw+5aO9
         bcH7qmFiJVCbfw6mIBSyEVUyhCnVhoyCKHBCZhKJOZdxyU6+VvrsL/cxu+LYlFrz3AgC
         NQ9krBqPPIp+tX2QCL9QmcS0O6uL6io4VmB7bInddor9hFVHupO7OG3WEvPJLU0TqeVK
         pFJlgonkLd7frxEuQsSHXz6Bmqsfz3ao82TwiyKVsfMEPWY5+05aQuUQxNA5Ajot5ZbM
         asEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788437221; x=1789042021; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T7mRs8f62kLAbWPgFDhouIuEptLLIIkw44oKaw49xlg=;
        b=l5nR44zl3xNW0KOvLvjUE8EY1mXbPtRD/yYqBlmVsGcr6n25HyQADIdD3tdCORtHgY
         P75Lwdzg3MI4MQyWBHggbiynQ6VxDBuFfft6N6tAEGlLePLoq++xZHFcTVs5HdgNg2jc
         tfAHIao66uK+n73EyyUw6jy3J9bL/G6uAmFaUXO7nmXm9O3eNKhlB4LJo2Ko3zOYu9FT
         UPGyexTbuUFP1hyGYYnZjMbz09jTwsm61Ry5HZkCLKK5egzpO8FNq5Vv/npodJ8P3Rc9
         /S8MuvabAa6g9UfS7Hy4/KAl4iku4NQkjRDEp+Ojb4LqeXoedJq07S7PSeb1VkV6IrDw
         06/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788437221; x=1789042021;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T7mRs8f62kLAbWPgFDhouIuEptLLIIkw44oKaw49xlg=;
        b=pHqqWbg3U3vXe45ZokQ69WcNmmDmwQ2tQY+O1Of6kYWr3o3jRm8piGyndmDnwdYl0S
         NUZzALEJtJyo8kKsbSXY61fDmw3nEYuwBlQMVuXfR8p6KWBzA+CeVgYedDOH8askZX+q
         P+yHvKUq4pCOdvKQheT0cPfd1zpStaMxTwLVUsbYGN1BS74USXvbm2x5g3gMSWWxsw4J
         pvrLbYCcFQ2L1uh2Zw4wGksJ1IJriV1RGR24baJ6s38dczJ22c5M4wG1uGSWuOzb860I
         GgvFYtMYYwG8xQXjnKrz/gxoVjzXcz3BMQTYuFFz4LJSdWxCpuwVkxMuwcICrwr0T8hm
         K8QQ==
X-Forwarded-Encrypted: i=1; AKwUvByqva8x8iC3GxwlfEev56jp16E9/ua1FYgsnkok7OJRpAcKaLoUieXBGq50rZJatFdyoEyBgtNri25y/rY=@vger.kernel.org
X-Gm-Message-State: AFuF++m5MiLjaPwTJSO4nzuGz9wopkj98toWacemJIDn1793aGYJ47VC
	jNsWNRjfJtUA7SuB+EYLVpqnlBccAVCc0fCT48g63pIJIJYyADk8ZNwc5NoT+d8IW9+kNs87D/d
	q4X3/lcNtnmbUEVtxtJXL/qv8qp6+0MkitQxEhoNV
X-Gm-Gg: AYBFou3Wg4RB1jAWTWLgQsTiK+0+PVYY8Ny64pcOXvIfcMzy3WDt0QYvo1k7f9EI3gF
	QP4wIPqQgubXmUv+AYXv+GXw30b9bqISzjrUaS6QpJCcCnxCVm0OHd1ZSD3eTPrC5G394kjYSSd
	/IMSEyyXwjGIDHH1fDyqxj8xp0+g7CnBn1E+E4lnto2yybkw6sK2Axfv2eWm6lQSljzZnDcMuIc
	XOqIQSVFo+WNArUd6g5YokC1KzbKwH5Y34uef8K7zateLAidgAFFIq1mFLF2RciDgt9noXrEPUk
	xJdktCzm4Zf0sNFJt4ZNNnxhTXUkKtXX7oFZFzXpYTmIVVZsZ9g56uyI+hQu2Ekc3vmODcrKyR3
	O
X-Received: by 2002:a17:90b:2b8b:b0:398:ba9e:75ff with SMTP id
 98e67ed59e1d1-39aee12c707mr18887440a91.21.1788437220106; Thu, 03 Sep 2026
 05:07:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811160336.782342-1-timday@thelustrecollective.com>
 <xiymqvu5la6h63umrp6upnzbl3xjjcacuyxg76xp4labnrioyj@xowfpjlhfrzh>
 <20260903072759.GA1750084@ax162> <CANpmjNNWiX51UU064+P823sDX42=O6ChSHrUux1aNqLj60mfUg@mail.gmail.com>
 <hnmqtyjazturtmhrw5xh445q4vrwv2mldhhspl6sf4hj6yzvqn@vzje2tuhtzdq>
In-Reply-To: <hnmqtyjazturtmhrw5xh445q4vrwv2mldhhspl6sf4hj6yzvqn@vzje2tuhtzdq>
From: Marco Elver <elver@google.com>
Date: Thu, 3 Sep 2026 14:06:22 +0200
X-Gm-Features: AcwNN1Xhd1oZ_SfzBigtwT3XXDzSDHD70cYPowTnNLJ8nboEDZfHt_OFrhqa3Vs
Message-ID: <CANpmjNPBxfgbuyK1VWsCukurEzhR5nFg1ydwEP9Gt0sGm9p5GQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] Support Clang context analysis for ext2
To: Jan Kara <jack@suse.cz>
Cc: Nathan Chancellor <nathan@kernel.org>, Timothy Day <timday@thelustrecollective.com>, 
	linux-ext4@vger.kernel.org, Jan Kara <jack@suse.com>, Theodore Tso <tytso@mit.edu>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sept 2026 at 13:06, Jan Kara <jack@suse.cz> wrote:
>
> On Thu 03-09-26 12:34:34, Marco Elver wrote:
> > On Thu, 3 Sept 2026 at 09:28, Nathan Chancellor <nathan@kernel.org> wrote:
> > >   fs/ext2/super.c:1149:3: error: calling function 'ext2_rsv_window_add' requires holding spinlock 'EXT2_SB(sb).s_rsv_window_lock' exclusively [-Werror,-Wthread-safety-precise]
> > >    1149 |                 ext2_rsv_window_add(sb, &sbi->s_rsv_window_head);
> > >         |                 ^
> > >   fs/ext2/super.c:1149:3: note: found near match '_res->s_rsv_window_lock'
> >
> > sbi was just allocated, and EXT2_SB(sb) and sbi are pointing to the
> > same object (unless I misread the code), but the compiler can't tell
> > since aliases can't be tracked through non-local objects. So that
> > scoped_guard could just become:
> >
> >   scoped_guard(spinlock, &EXT2_SB(sb)->s_rsv_window_lock) {
> >   ...
> >
> > But I'll leave that to Jan and Tim.
>
> Yes, at the beginning of ext4_fill_super() we do:
>
>         sbi = kzalloc_obj(*sbi);
>         ...
>         sb->s_fs_info = sbi;
>
> and EXT2_SB(sb) is just sb->s_fs_info. Are you saying that clang is not
> able to infer that sb->s_fs_info and sbi are still pointing to the same
> memory later in the function where we do scoped_guard()?

Yes - alias tracking is only done through local aliases. sb is
non-local, along with additional member indirection; unfortunately,
the C language doesn't give us the guarantees that it wasn't modified
somewhere in between, say after a function call (this rule is applied
also for local aliases if clang sees that they "escape" their local
scope via non-const pointer to pointer).
