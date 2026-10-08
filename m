Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E73638F932
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 05:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439028; cv=pass; b=W2iuCNKeRYcVmqEkljhtGO6nQcHs7R9lklf09k1RxLwFzs9hGLnEOt9we0+a+ms6xXfo5jiwr4ZdON96DT3NMt+WkxAvb9MpUKIzHyOXBoQ00fEhiw+kz2O+nelPyxBnt0h0bS8uerCrLPU7uwTTqoYNFjS6uFYMD5+EwvCHD5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439028; c=relaxed/simple;
	bh=ERFfEbPmweH1yhwx1o9jFMHg4vWGfaK55qTf8oHXD5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jXiJsZZe9rw2FxNKKQ79BV/ihNeAkSabmaMWreOS+rS+GNQu8ydhGuFahGi0TzOonPvEE8lb2vjAmSCbtd8K36jGsFalB5EDnX4COHAfegQAGTTNapqiEgSMubY4kxZEAHwGhHpqaj79k0RzWTaBFkeBNVC9oCcdM7+NrekDNik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O7jWfO2w; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O7jWfO2w"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so48653885e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 22:57:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791439025; cv=none;
        d=google.com; s=arc-20260327;
        b=OF3jgoaMd9HtzUonKYc4U/i8n+8fI1wVKqKz2BCPqaL3FAOoK4tj2LIuESm38CuZDr
         PaPlkG1znT8YrAJSKxkqovnUaHrHfoUwluL2lc8evJjsJ2sTpTec2wcZ5mYtIrLgQSS2
         WEmCQbcEvIrDSNjqwzNhcCpYFaBDMcHdolBbUZiQHY3pcCdyXr/0Gnr/Q0HWWYoVJWOw
         mW/iXX7iYac1QB+gdzqMVYaa7Y/ykUY07zQH4PmpF94NpATxL7UNCoY1j6RHyioPmuy3
         yDROE0mHaDOIjC4AW0v43YmhFqr4qFbKhXKhZQupUw9xGEJE5hzMP92s0cQgdR9CrDwn
         DT/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ERFfEbPmweH1yhwx1o9jFMHg4vWGfaK55qTf8oHXD5c=;
        fh=aiyakZJr5mwI6mtsJSTXvCOvFHeTr64wbzPa+hwCiL4=;
        b=dTbvqCyp97Zea78qmPibTHuA5vchXwH0KDcVENPDa4lWmVzfzRRsx5a+KepH95cRDk
         Fb+BEokMbFbJOEasGNe0p86XX1tEyZkKZzyJFHE1TjNzBVvrXXR+Q7JKhtExsPWSQF9G
         ztqzMGf5DPL5VQfoCMoSpv4bH14nDbsw12V32tFwXrocvKqW7tryGRM/Waw2+0NryKqb
         1nIdrAm5DvAFjTinJKb9pgU+cufTuJF7H913KYZ7+QMPv1v9iSmSReDp7BFt3uNZLKor
         EwInqJtQGo64zJBxS7iVoFQvca5Ae0L+ezrePw4Y/waxdihNrUQW+r6tNwOwa4kwVk/p
         H8yg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791439025; x=1792043825; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ERFfEbPmweH1yhwx1o9jFMHg4vWGfaK55qTf8oHXD5c=;
        b=O7jWfO2wQ2Z7PQKVTg99P/xL2e3XNZui+kUjW9f+5XC5YmjWcE+Tywkr9Wof9pyOie
         iFQYJiHtCq9ZtU1LEq9Rid/9CIbeLK+B5gMxy3tSeWH4x1JX02jsTl8Mukj/KLgNGI9K
         V5reynBN4+InU23lD6VbcY109EWQmZtGfsgrgsLUPjtbsLlL0RdYg+gIRbAHaanTPXoK
         CSCBtrVobLe5ykdM2vv40IRNamVADdMOG6oB/De6+QUy5mSysQklLV2WhG/mUh51eOeA
         lNVS2yeC1etk9cG0SgnMFzdtRlWepmKuG/HMtKt/c3+j+9E1R9iu77N5IMHkQ8wAc0k/
         gOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439025; x=1792043825;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ERFfEbPmweH1yhwx1o9jFMHg4vWGfaK55qTf8oHXD5c=;
        b=omY0BosPkCrGqMbOwnCasndH91+t+CPbkLBYxER38o7e53UgeIF6vl0Kx+GtnrFg1t
         wNChbIHI3SVLPmN/WTpkerTaqhT/Xb+PH0SKwrhAIWrcpRLvsmaCqTtg/5tvsHPvR2p/
         1w+68WwjtNxiePGX6gDVPDSRs3eYEgyOvPS0trYCtnXxPM7OVYOEKzSfb/pkAPI3kIIS
         BMAtJoygxHJgaAkJv7mg+cAKDISN+JrmVoPv9+SxP63+VEWrxNP2ayDZYq+nkZ1O54Sf
         FUWM7a9M57MCjqtkxH87Rj7Hd2plVSFYQCxYmxVrvhGCPBoby97vN/VixbP3085rT6xD
         Axbg==
X-Forwarded-Encrypted: i=1; AKwUvBxE8Sm7wP5byZqrOCe//YRvvrPDNvxaQc7qswE5LjNADIINwjUTmLznPqlhvKlASYqEO7TlqOq1ynfCMto=@vger.kernel.org
X-Gm-Message-State: AFuF++mfRsiSSPPE2w2kSILS2rq0HTfoS2xgPLNrW5eHl5GpOlILGVLT
	ibeCyHwyJ+IAfCFzdwZOv7mfRByIULr8iGylqVo/X6c+3sp0QQ17Zr9dn+AVLmCtH9GAWdyy/IX
	KOr4yT6Ugjes6XYS5QoUr7lDsYN6j2Q4=
X-Gm-Gg: AYBFou1T02wjiNvIYTsFa5KCHxWtzxJRB348M/8Q+PnS7fVe8qEDbpzlwlciaeBckgk
	DDS+kkjdBrZdgF1h/jhKQjspyw2/y/aYgsO/wY6M4TuR3ZropF5dCzHDYcA5WxedEzxJPHkHj2V
	+YNn/bwgdNhVvNGNwRICWjJgmFRhgsAeQxZ0COXAKlr+MLzFKA4QT81c15+m6mV2MlGZDbFlgjs
	K/xwXcg4JqBo7Q8x+8hdQADZdJ/Yw/lzWCEfpG+ueh+JzjQlw5NnHAEKoCL5BJtdNF9Sw81aPGt
	neahbLHtmTKs6AsUaMNVFZNDDeoRgSb4Zb9iWkCnhJ02mELEmNQL/aV8
X-Received: by 2002:a05:600c:4fcb:b0:4a1:7b53:c8c4 with SMTP id
 5b1f17b1804b1-4a180455cb9mr75121655e9.27.1791439024920; Wed, 07 Oct 2026
 22:57:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007022859.60101-1-kunwu.chan@gmail.com> <20261007022859.60101-2-kunwu.chan@gmail.com>
 <66d8d340-ff50-4fcb-bf19-05fa68c27238@app.fastmail.com>
In-Reply-To: <66d8d340-ff50-4fcb-bf19-05fa68c27238@app.fastmail.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Thu, 8 Oct 2026 13:56:53 +0800
X-Gm-Features: AclHuK_vneNVObOeVywJe48WggHU4Sw7QcVGazKvBlLRarryICjDBJz7-XGqNn0
Message-ID: <CAN_Opa_7iaGj0_=POskHU_KXqfDUbJiar0sPj8dhKLf9Cv2riA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rwonce: Add READ_ONCE_THIS_CPU() and WRITE_ONCE_THIS_CPU()
To: Arnd Bergmann <arnd@arndb.de>
Cc: Anna-Maria Gleixner <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Linux-Arch <linux-arch@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	"Paul E. McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 6:50=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Oct 7, 2026, at 04:28, Kunwu Chan wrote:
> > Per-CPU variables are sometimes accessed from different execution
> > contexts on the same CPU, typically task context and an interrupt or
> > NMI handler.
> >
> > A plain READ_ONCE() or WRITE_ONCE() marks such an access as an
> > intentional race but does not express where the racing accesses are
> > expected to come from. This distinction allows concurrency tools such
> > as KCSAN to tell an intentional same-CPU context race apart from an
> > access that may race across CPUs.
> >
> > Add READ_ONCE_THIS_CPU() and WRITE_ONCE_THIS_CPU() to identify accesses
> > to a per-CPU variable which are intended to race only with accesses
> > from other execution contexts on the same CPU. For now, they are
> > simple wrappers around READ_ONCE() and WRITE_ONCE(), so generated code
> > and tool behaviour are unchanged.
> >
> > Suggested-by: Thomas Gleixner <tglx@kernel.org>
> > Suggested-by: Paul E. McKenney <paulmck@kernel.org>
> > Reviewed-by: Paul E. McKenney <paulmck@kernel.org>
> > Acked-by: Frederic Weisbecker <frederic@kernel.org>
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
>
> No objections here, but since I missed the background, I don't
> see what a future implementation of the new macros might do
> that is different from the existing macros, maybe you can still
> clarify that.
>
Hi Arnd,

Thanks for the Ack!

The background was discussed in the v1 thread:
https://lore.kernel.org/all/87qzici6yb.ffs@fw13/

The idea is that the *_THIS_CPU() variants make the intended
access scope explicit: a race between different execution contexts
on the same CPU, rather than a race that may occur across CPUs.

For now, they are just wrappers around READ_ONCE() and
WRITE_ONCE(), as Thomas suggested. A future KCSAN implementation
could use the annotation to distinguish these same-CPU races from
cross-CPU races.

Thanks,
Kunwu

> For taking this through something other than my asm-generic tree:
>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
