Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AE34ACC68
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 17:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788368715; cv=none; b=HA4POnQQcVY0E8tn5FaBB4q/n15TD1l3TDEBBMJJlhmlcYcoLW0NgXT+NMnGBBX1fAgjsBfgilJO04gZCEHgqunr08UcAjL7BmVD8rGcX1Y4J+7NGGwmrXR97rEjxe++Ddc5FGEHxlyleFIvTkSq4R+paE9BwMLYAw9zgBrg8nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788368715; c=relaxed/simple;
	bh=zeJimL1IbKt7qBpGG0fknVIgJbJjrFpbdpdzBPhIkts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=edW3cmzTZADda0DzgEr9cbShRWkibCIoytAINN5JWXqrJFr7YCbjwXAgNKhcfiJzrPmpE+CE0vPAk6TXOqLc5wUGGC1D2IO18FsR5sFvc5ZtMNJkilzsMlrj0IdS0/OhN3inYcwbmbjQk4qyGc/UkpFRXERhM46MMdt9t7cYQiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=b20/4iqa; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="b20/4iqa"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a082b3671fso2141692a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 10:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788368711; x=1788973511; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tjScoN6zoa4oBIxArgONbEap6sPReDqdmV2tr8YPHxc=;
        b=b20/4iqaOwgCEmaT3nIs6ElKWGfui6Xl2yHTLKyKYuIOVJ4OfGmgEkd+PgoPPKTOt/
         R8t1uoLPDS0stqnBHB5niKP19n8l6geJwpTBj3udz0MhMN3t9SPrMrhT60oVTMYOjBxO
         nsd128GFJKwYlQ/pajwPHT4DRM1msJq4JtCo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788368711; x=1788973511;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tjScoN6zoa4oBIxArgONbEap6sPReDqdmV2tr8YPHxc=;
        b=NpGXUzU17+y/e2jG2MbY1vV99eHy+vWu+W8/c8Pndb3vJ+N0iEwg/l15wwSq+h2BJR
         e59Vz6BLhZMmhKmoVaI6w0Kx42FhKVTl9hVqQRq9RpGnEMQ0Qn3n8Wh9rwyAYeJFN1dY
         cU5UMf0IJTvd2tyVs4NzPcg27sEFfbx39gxdf9vNlJvyh+NiGJOb8oZNpAlMSbo/limO
         uDASZnI6Hk/lVh86bqsCQwYmnnDnjSRtACaH+ro+PE1Sg4SZo0Va+qLHx0psAn56/Vg3
         iG/NompbI6iez0LtzIVuk584HPWH3sDHT7nN8q7TKSn0g9sU6+n8Th1GGF7ChiALXWiJ
         3QpA==
X-Forwarded-Encrypted: i=1; AKwUvBz4Qnwmvkbkds6M7rz5D15PA7hzkhib5RWFAgDnECWscx9bCUGWOHL0Pj/O2WdIWoh8Zbw8Vc7t5y3ReMs=@vger.kernel.org
X-Gm-Message-State: AFuF++njyXvc2bjfwzFjfUYUdXrrYwApFAq5hCxi/HJai87/Fka8K+uL
	+DSRdnyGzGVwDCByqvRQ9lVVnoM2jQEsD+H2kVeWz9EjD0Jta9Q6GZm/3n81PXVFP3SeU2WmwOs
	RywD7TJc=
X-Gm-Gg: AYBFou3GpVP0l9JO7NX7weECrM8fgjKBwxgqRaI9K4fQ2QBuDClBXB5Unm8eaNS95/X
	jRYDonQpDlyBnrkmTWidYNCfkSevpfC/e9R/h5XpSaR6u3GLiSgiWc78WU2f6uXczs+Tj174YL9
	09dooz3UleJLfhZLuWD+wN9cTXWMCGzosZ6LS7EiIqa3EJph+AlKHRWIAsiGXu9mxHRBqSR4S9S
	NMmSh9WcdyBg0k/FaMQg15k3kiQPUcwC6QJIq32QNpapHjM7bQObTZYEZGKZVoKm0ao4ZGdccuR
	QBwstmGb2bYspO8SPCgbu2KRzUKx8BlzktKFwvEpwtGZXRqob5I9Wc8EfouP6gN/RWYVAnQNT0V
	M8B7j/dOj0SzfDLOqMPv2QiBjYJY0S8Qzdk5hPLk7u1/+gZxMh+gRQ9aLXDX114D7tKd7NqmB36
	wFBQ6dYCwyuFolvbaLfQlmHOlYH4VVObQKj4sQvWOGtYKTlb8AzTWeuETqMIVuDkomBoyEcQMqR
	RSWxAzSL8xMKfSNBUUhRJJQN3KTzVc/NLQJrFM788zbMGEMbw==
X-Received: by 2002:a05:6402:2552:b0:6a5:defb:c9dd with SMTP id 4fb4d7f45d1cf-6a6829af632mr3985168a12.11.1788368710814;
        Wed, 02 Sep 2026 10:05:10 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f8becc5sm1496606a12.12.2026.09.02.10.05.06
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 10:05:07 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a63c610b8dso2074369a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 10:05:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx3XSz6FkTK9xOw1hsX3kPK1GEbORvxbeIVUQfQpZf9xEXEC9fpviuvxR1iOq9XChHz95d9r0MOzkCQROk=@vger.kernel.org
X-Received: by 2002:a05:6402:43c7:b0:6a5:f4eb:df3 with SMTP id
 4fb4d7f45d1cf-6a682566dc7mr4946213a12.2.1788368706159; Wed, 02 Sep 2026
 10:05:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bde573c1a758505339239f08be28788a34dfcb73.1786121949.git.bvanassche@acm.org>
 <20260831214437.15d6ad34@pumpkin> <a771af57-40ee-433a-be84-9b7c3e6965c5@acm.org>
 <20260901092043.7feaf5d7@pumpkin> <dca931ff-5995-444c-9f89-6d6cca4e71f3@acm.org>
 <20260901222909.05d6239f@pumpkin> <1b86ccbf-4e41-4a26-9d22-8bd93bacb043@acm.org>
 <CAHk-=wi_3xdtBrDgUxw5xtq8a=CdyRJnceo7YJg59wqqdXwiMQ@mail.gmail.com>
 <20260901192523.0e989b10@robin> <20260902092437.00dfaa25@pumpkin>
 <20260902093644.5b0e8a64@gandalf.local.home> <a5aea1c4-3e29-4bba-8cd2-d4ccbeda008c@acm.org>
 <20260902123933.5c3c8fa3@gandalf.local.home> <e75964e2-6b46-4594-8bfb-ce0c0ed620a7@acm.org>
 <20260902125408.1e86282a@gandalf.local.home>
In-Reply-To: <20260902125408.1e86282a@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 2 Sep 2026 10:04:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjLqvhj6TkjPHq2WFsHa1s9MVjEZyoHiWOwgHY97Ls7kg@mail.gmail.com>
X-Gm-Features: AcwNN1Vy44u-3SmFJICDkckfL1CQuy0YdVwvNDjGvYnWUpSCL_w41eaC9jOwemQ
Message-ID: <CAHk-=wjLqvhj6TkjPHq2WFsHa1s9MVjEZyoHiWOwgHY97Ls7kg@mail.gmail.com>
Subject: Re: [PATCH v2] tracing: Make is_signed_type() compatible with sparse
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Bart Van Assche <bvanassche@acm.org>, David Laight <david.laight.linux@gmail.com>, 
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Chris Li <sparse@chrisli.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Sept 2026 at 09:53, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> If anything, using __bitwise in the field makes things much worse, as you
> are finding out now.

Stop it. __bitwise makes absolutely nothing worse. It's the right
type. If you are recording a value with any type at all, the type
should either match the original, or the original type shouldn't
matter AT ALL.

The whole __field() macro very much ON PURPOSE takes a type. Christ -
it's literally the *point* of that macro. You want to assign a value
that comes from that type from the kernel - so it needs to match the
type you are tracing. Including __bitwise. Exactly like it needs to
match in sign and in size.

Are you suggesting throwing away the size of the type too? Or the sign?

If you are not suggesting that, then stop the idiocy of suiggesting
throwing out __bitwise. Because dammit, that is part of the type,
exactly like the size is, and exactly like the signedness.

And NONE of the issues have anything to do with the kernel.

I already NAK'ed the whole idiotic _Generic() macro garbage.

WE DO NOT MAKE THE KERNEL WORSE BECAUSE OF TOOLING BUGS, WHEN THE
TOOLING CAN BE FIXED.

Why are you people not getting it?

                   Linus
