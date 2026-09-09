Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470404B04B2
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788948544; cv=none; b=Qf4JiVJQrJNVwBTbL575R5w/SGigTJNYv4lt3bplFQW5XaV72rfoSu+9mVzMwkJcosyEyZjY5fxkMHt+umwcrHnkbLAytOwxXZYcyJ+fDVyL0cLk0HEEx0Ca3pHh+Q/i+cE7Uc3m+gFVGnvXjEZpew5AnuU2N8W1o3xILNu8gxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788948544; c=relaxed/simple;
	bh=YnBXD+T/yH9/YjPEUD5GRTVBzz7NWd4Ym7TZDeqX61U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F9mfFvgdjQBNXpp6GxG6sJ6BDUbtbGoKM2bRIliX7pPiQKTLjHjk1nT1zii6vqFDBSiemVlwClKIR4qQ8VBHw2dEb5c//p0BN/ZQZE7X3RhUGwZawskFVlhRLQRPT/MM4uXqjhfzogbqvFUU1UBbBtaMXgzKic63RYkWoYFASHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R/SUNCzs; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R/SUNCzs"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8541875f596so2843763b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788948542; x=1789553342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cspt3kRXGk/I1h0yuaYP6XGwO6IhBwUrx4BknaruqsY=;
        b=R/SUNCzszlFv5XUqxaiMH3dJMUblEO0yMxrAfJMeDIFERg37B3JqYwRya+3iApSSIi
         /BDr9ups+L3xtZONBWROMDdDphY9AtVtd4aW//CqdzeFH4a8jK7AyFhGk2D3iL/EVL1S
         yj7f1wIUyR4tf5wXtqfrRimf9vyYtqJ7sVivGj4zzOyghHrEWHAAjLCTojCZF6D4rd7l
         xF0ufs2hUynjbk93bnCFjVKwn/ADUG7TlNrK3SOV5DOB1WwSrxgcsYAeYR8OjhhkKdr9
         JYhxGoVauyKfMjMMg0gFNX84ao2CcZxVp8Hgmy5UQkLZTQGXa0vEWHG2Dwd3PaA6divy
         puwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788948542; x=1789553342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cspt3kRXGk/I1h0yuaYP6XGwO6IhBwUrx4BknaruqsY=;
        b=WdxG2MreWirNgezMMcJu/zfLA4SMMo5q6eJPb+XhrjlEv4zA76C66oZ1hSvebeuejB
         K0cAk1QgK1RM8GGca9r2PgMqGlaEwPw3UQV2pGd5rtCOtlPIrRUqC+Mbx/FmQYQArjyl
         lzGWyI1inYrZCxXRnxn8cqp42b+w+NNhSQVlQbdQRWVGYv6+vhGXziprx/cuwF4PmHvw
         WHJFMAGaKKDQ8AxqdxZ7Y0H8augKupWU6aFe29SkgqOGouQHm4Vyw3fajFafh8GPB9zn
         06o4U63imvCs/wBvcN5Usqxgi+3AhV750KfGifB4qbsD3oiMaq+Xtd2/Mj6ZTIFMsJxG
         mfBQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2wneItXc+CbXSvGAWyxzjXD7CQDiWP9i/F4+L/KmalgdjrHo1ati/98aUMwhnk95Z9TbAIBoaG2LgZS4=@vger.kernel.org
X-Gm-Message-State: AFuF++lVg32i+kT/LS9uDt+AI8zTTJpdvnFtcg3QWnFreM5SagCmTRjG
	XcGlyTAKk0haSd6P9Z3rYuT/ATNVUEZGzAnkME5y47OFAzjyKisqqs26OlJQcw==
X-Gm-Gg: AYBFou3uEGPW0VBhUkmWk0NEotM2/qtwWhFpYcy2Ufxl4zsCXDJNYRo693Ul4LsWmUq
	qyTnhYUkPecEg0nsJduiWAhMFct1O4eyjQnar4U+GYNmB0hhzHRJEsPM2bUedoFV4PUXY9qRVoe
	Qa/EUjXc/gRhHHaQ+nvwLdtMPuQvW2+C/sSqXT0Cow3rYHW+H2thQzG1CN7GYW+Ff0Pmq6U9kaB
	m+EeXG6J5wJ/zBpFaIdNMRsBaM5FAI6Nq/aJPQGkDuN8sKbPQu7L5jsfUQhkvYhZhtVZbBEX976
	MPvOosPWkWk9SRbqbYcxt97wJGf2urWEeL5nc/VRDZ/HkXPtlU/lhzOW+t1vCFsBgDEWDjrXrC1
	egSAMO3EWiheMxKrZijPbo5uS0Q/shFGKxNF3gGqaOc4fHLxl5PRIRCooRNh6JWYt1+g3j85jnh
	rhTOvfNDJN778iDllTFvtliT6fJDLnB90u31bp0Qo4c9rFNSFi6aVRO5d8VjLdWA/RevH5SNTYx
	0WfxoB1n8KW7CA=
X-Received: by 2002:a05:6a00:2d91:b0:846:8b22:4933 with SMTP id d2e1a72fcca58-8616bd5c57amr45991902b3a.17.1788948542332;
        Wed, 09 Sep 2026 03:09:02 -0700 (PDT)
Received: from celestia ([2402:1980:885b:4183:b098:c1b9:7033:be8a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152c2a52asm6745792b3a.30.2026.09.09.03.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:09:01 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: sj@kernel.org
Cc: aethernet65535@gmail.com,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	damon@lists.linux.dev,
	david@kernel.org,
	liam@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	rdunlap@infradead.org,
	rppt@kernel.org,
	skhan@linuxfoundation.org,
	surenb@google.com,
	vbabka@kernel.org
Subject: Re: [RFC PATCH] Docs/mm/damon/design: clarify when qt_exceeds increases
Date: Wed,  9 Sep 2026 18:07:33 +0800
Message-ID: <20260909100913.30568-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909003800.112569-1-sj@kernel.org>
References: <20260909003800.112569-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 08 Sep 2026 17:38:00 -0700 SJ Park <sj@kernel.org> wrote:

> Hi Liew,
> 
> On Wed,  9 Sep 2026 01:50:23 +0800 Liew Rui Yan <aethernet65535@gmail.com> wrote:
> 
> > qt_exceeds counts how many times the quota of a scheme has exceeded.
> > 
> > The value can confuse users when the effective size quota is zero,
> > because a zero effective size quota does not always mean the quotas are
> > unset.
> > 
> > If the quotas are unset, that is, both ms and bytes are zero and no
> > quota goal is set, qt_exceeds never increases.  But if the user uses
> > the temporal auto-tuning algorithm, the effective size quota becomes
> > zero once the goal is [over-]achieved.  In that case the quotas are
> > still set, so qt_exceeds keeps increasing once per quota reset
> > interval while the goal stays achieved.
> > 
> > Clarify this on the design document.
> 
> Thank you for keep working on this with patience.
> 
> > 
> > Signed-off-by: Liew Rui Yan <aethernet65535@gmail.com>
> > ---
> > 
> > By the way, I found a thing in the design document that confused me.
> > 
> >     temporal: More straightforward algorithm. Tries to achieve the goal
> >     as fast as possible, using maximum allowed quota, but only for a
> >     temporal short time. ---> When the quota is under-achieved, this
> >     algorithm keeps tuning quota to a maximum allowed one. Once the
> >     quota is [over]-achieved <---, this sets the quota zero. Useful for
> >     deterministic control required environments.
> > 
> > I'm not sure if "goal" was accidentally written as "quota" here.  Would
> > this be better?
> > 
> >     When the goal is under-achieved, this algorithm keeps tuning quota
> >     to a maximum allowed one. Once the goal is [over-]achieved, [...]
> 
> Good eyes!  Yes, seems it was only mistakenly written in the way.  Please feel
> free to send a separate patch or include it into the next version of this
> patch, whatever better for you.

I will send a separate patch.

> 
> > 
> > ---
> >  Documentation/mm/damon/design.rst | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
> > index d036340dae8a..e083b74d618b 100644
> > --- a/Documentation/mm/damon/design.rst
> > +++ b/Documentation/mm/damon/design.rst
> > @@ -863,6 +863,16 @@ scheme's execution.
> >    completely tried to be applied.
> >  - ``max_nr_snapshots``: Upper limit of ``nr_snapshots``.
> >  
> > +``qt_exceeds`` is increased for schemes with set quotas when the quota is found
> > +full at a quota reset interval boundary.  While the quotas are unset,
> > +``qt_exceeds`` never increased.  However, a zero effective size quota does not
> > +always mean the quotas are unset, if the ``temporal`` :ref:`auto-tuning
> > +algorithm <damon_design_damos_quotas_auto_tuning>` is used, the effective size
> > +quota is set to zero once the goal is [over-]achieved.  Since a set quota of
> > +zero effective size is always considered full, ``qt_exceeds`` keeps being
> > +increased once per quota reset interval in that case, until the goal is
> > +under-achieved again.
> > +
> >  "A scheme is tried to be applied to a region" means DAMOS core logic determined
> >  the region is eligible to apply the scheme's :ref:`action
> >  <damon_design_damos_action>`.  The :ref:`access pattern
> 
> I think the clarification is better to be added to the 'temporal' quota tuner,
> since this happens only when it is used.  Maybe the clarification could also be
> shorter.  For example,
> 
> '''
> --- a/Documentation/mm/damon/design.rst
> +++ b/Documentation/mm/damon/design.rst
> @@ -775,7 +775,9 @@ There are two such tuning algorithms that users can select as they need.
>    fast as possible, using maximum allowed quota, but only for a temporal short
>    time.  When the quota is under-achieved, this algorithm keeps tuning quota to
>    a maximum allowed one.  Once the quota is [over]-achieved, this sets the
> -  quota zero.  Useful for deterministic control required environments.
> +  quota zero.  Useful for deterministic control required environments.  Note
> +  that the zero quota is a valid quota, and therefore ``qt_exceeds`` :ref:`stat
> +  <damon_design_damos_stat>` will keep increasing in the case.
> 
>  The goal can be specified with five parameters, namely ``target_metric``,
>  ``target_value``, ``current_value``, ``nid`` and ``path``.  The auto-tuning
> '''
> 
> What do you think, Liew?

I agree that would be better.  Although users might look up the
definition of qt_exceeds first, they are also likely to navigate
directly to the temporal section.

I will clarify at the temporal section in the next revision.

Best regards,
Rui Yan
