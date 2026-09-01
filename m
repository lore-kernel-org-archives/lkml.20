Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AD925B092
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788291341; cv=none; b=TF9dRUrfkjAStSxAWmqxArf4QluxVmttC1ZkPwY2IwSXTgqfiH9omH1OtyQP4nbNOZuf5bv11EdWYeCv2zBL70TV1l32byOqmg2P5m0EShXEaVEMJ4Yx/5ex/Nj8tKkO7MRVKW32DcXrA+sOdFaqESYbkaGYY+6Zhjaxo4w64IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788291341; c=relaxed/simple;
	bh=J32nMN/QwrepL4sWsEoif8DuURtLZGiyOr7RSLQ4DCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F02rBas8m9rj15O97AzurN86DvcbfcQU+UeMnbDUaWuZ9t9uQSjmsF3KzULVQQ8SuICpWOYueapY7syFIAP0qfK9mGwh+i5aV1cuz0mcjTwBz3JCPzTaC31MnOj6WTT896iSnbAYaNU7p2CwbIPx9freJvdZ9L0xLoeFvxYPgSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=MxMYHWnX; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="MxMYHWnX"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2544ff970dso20472866b.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788291336; x=1788896136; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AETTaEq1T3Xs19/mdy6ZVJDHY8UC6CXvW2WpS0LSv0g=;
        b=MxMYHWnXxlDY6YzDLBZZTTDUnmGklSU1nCJJXSbKvzAZ4eRjLoBsgVZ17z7OztzZnK
         zs/xaCPHbAlwwt2qR86MgMv1i9GlzBuUi/OKDJ5qRzm980ISyb/ToSeT9eyooe+k5Lee
         E9O9nHCmjjQ90dk3wmS9Eqqq50VQsMdFFvb2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788291336; x=1788896136;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AETTaEq1T3Xs19/mdy6ZVJDHY8UC6CXvW2WpS0LSv0g=;
        b=kkPZ4CX8eHqYwZZNDNvk3/+z8qRLwQhqOp506E/8YWSfkvm6Z81YV2CxYxJUwUrS3Z
         gH1z2/yEAsyA6A//KXkD2Vu+3sfry5Px38si6L5/FGMMxNViaRfRYpkhg+UsDSQdbY4q
         Qyw6lE8rPW6ZdN73EvrIjafCcCoMDEUlEbzxXUHDQCchuOnKham3R13tK1t1hc3BycVH
         STvksTtCwc0SCQ2rHjc79eZ8/yIdPSMa8dEshpfOmH7DwI8C8GZM7LGzdGyEHVSa4/oh
         zoLMhL52khBFh50T1pqAtvrHtTj573fkI0hJneS1Kn/dh1ZEL58Grzwt9tS+SrjQOAVB
         qk5Q==
X-Forwarded-Encrypted: i=1; AHgh+RoVxEn9bljFo9Uj9+WxDWHNCGiGOqvwU5qlxLt7KK2va8B7a5ArLesC8t4HK0mFgF7GVFOAUn8dAXbGBAs=@vger.kernel.org
X-Gm-Message-State: AFuF++lJCnpCuLjPCGA1MEXSkcNM9ZeRzE4iHZ5ts0bLAyC4mr297Fk4
	D4yukor8/GkjTm3bcgkJT0p0gdT6L/fIO/Ed7mvGjKEoXBXeovW2iO/fgIwnkaLx7ZE2QmfFUYX
	yZWcduuc=
X-Gm-Gg: AR+sD13pxl1mhtA8Q/crQtifc53eDBPvvIYdTJ4uCHP/rTfTPOXJNJC9DIpVcZQmCRq
	/l5xn7hWED9CXWT6ebO/ZQcTf7ar7TyItmaJWfv60LvIXVjy0wRb3JqA0sbSJq1HDL9PtBwLVLY
	yllDeLpEj6vi81sW+MP1WvZWcFs8cZ3D53dftchGUA0/YYQciGa3GwdskJf4PJhqr8O5m3ZjjUO
	VYKwoERekhViZ9h4Or66iuxjrw8z/qlibbyHdci2a2Z34hHYDC2Mlo+vk/UhhhliBRQGyQLi7eG
	VpiY/j66ejuEA5S/lClFVTauMcQslvmk4Fg7rvXBWyYgFlOhPd/C0fFuiRNUGSl0wLY9w5eoPcQ
	RIaDY7GWsaO7JQcQu4G2mZz9KadKW1IV04egpT045dHR97QdF8jd9i8VQ9ylneNr3FpomDyjHz3
	cAJIMsG/jM4V12aJgvayX0bQVMJeFUh7ZeU0AVcG/6Fkc9BTOe5Bcc2RDbgl45QZZ1btWHsrFYX
	NmmBqUs8O9hsz8joxtuHLz65L7t0WxmQYQvNQ==
X-Received: by 2002:a17:907:d1e:b0:c25:8fb2:5e24 with SMTP id a640c23a62f3a-c25d133f1ebmr29762466b.15.1788291336481;
        Tue, 01 Sep 2026 12:35:36 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25cffc5cc3sm15752266b.7.2026.09.01.12.35.35
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 12:35:36 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a60f0dbeccso367191a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:35:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpydTng0yiv+C96mJysBfB2ORSAbqmuQ5STxYPkijQqkGRho4LHf6YVgC3hY5PJKX8SKS3F4ZStlqvx8I0=@vger.kernel.org
X-Received: by 2002:a17:907:7241:b0:c1c:5aa1:de57 with SMTP id
 a640c23a62f3a-c25d1341557mr28012066b.13.1788291335346; Tue, 01 Sep 2026
 12:35:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bde573c1a758505339239f08be28788a34dfcb73.1786121949.git.bvanassche@acm.org>
 <20260831214437.15d6ad34@pumpkin> <a771af57-40ee-433a-be84-9b7c3e6965c5@acm.org>
 <20260901092043.7feaf5d7@pumpkin> <dca931ff-5995-444c-9f89-6d6cca4e71f3@acm.org>
 <CAHk-=wgFEG7ZVaFAbo=bWWfsSh_weA4cOh6BV-xHWNSn6SwNBQ@mail.gmail.com> <737a4f62-f50a-40bd-a94a-1f42e9f3f54a@acm.org>
In-Reply-To: <737a4f62-f50a-40bd-a94a-1f42e9f3f54a@acm.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 1 Sep 2026 12:35:18 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiZog53-M8--_2m7HRk4XOQ+_jkh1XVuyQXXJgSwooQng@mail.gmail.com>
X-Gm-Features: AcwNN1VR8J21-p_DXjxK-LRBI6NmPNcYJnCsckRfx8fJ7GPnksHwBJ4AwBYu7-c
Message-ID: <CAHk-=wiZog53-M8--_2m7HRk4XOQ+_jkh1XVuyQXXJgSwooQng@mail.gmail.com>
Subject: Re: [PATCH v2] tracing: Make is_signed_type() compatible with sparse
To: Bart Van Assche <bvanassche@acm.org>
Cc: David Laight <david.laight.linux@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Chris Li <sparse@chrisli.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Sept 2026 at 12:22, Bart Van Assche <bvanassche@acm.org> wrote:
>
> Four years ago the following sparse change was proposed:
>
>   static int restricted_value(struct expression *v, struct symbol *type)
>   {
> -       if (v->type == EXPR_CAST)
> +       if (v->type == EXPR_CAST || v->type == EXPR_FORCE_CAST)
>                  v = v->cast_expression;

Oh, that's why I've not seen that issue. Because I still have that
exact thing in my tree, and have had it forever:

commit 32eb1e2c4fa0ae77b72aeaff963d49c309ab867a
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu Oct 20 18:10:07 2022 -0700

    Allow both regular casts and forced casts for restricted values

    We probably should just just a single expression type for the two cases,
    and distinguish forced casts some other way, but that's a separate
    issue.

    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

but I think I stopped pushing out my own tree long ago I started
rebasing things and others maintained sparse better.

> Is that change still considered the best fix for sparse? If so, who can
> apply that change to the sparse code base?

Well, I pushed out my own random branch to my tree, but my sparse tree
really is a horrible mess of rebased code. So it for example has been
rebased on top of Al's __VA_OPT__ code from earlier this year, and
then has my own random old local patches from four years ago on top of
that.

So no, that tree is *not* a good tree, but I pushed it out anyway
since that horribly ugly tree is at least somewhat relevant to this
discussion.

Does that tree at least work for you? Maybe we can convince somebody
who is a better maintainer than I clearly have ever been to make my
messy branch be something actually palatable...

            Linus
