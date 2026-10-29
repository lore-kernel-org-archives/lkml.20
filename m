Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793296655;
	b=WMFZTl1CEv3/M3ovoUWb4EPucV9si2nEsIEld8tnlZTDd6utg342/I9l3YcWCPT8vG9G
	 O5p80qw+uC1Kb2zmiyTbby/gY0mh7gspLGLxz+Sv11pfgUBeAdPGvNjLUeepmRLOFqfxZ
	 VpJBVRyMrRGevN9nlQtAP8Jp8quggedhdcPMwz+F1R/xfjBo6tr89fCbaN9uRrzs9SJGg
	 vtq8w6WFJjTi2PdEaWUOAUJ3cQX+C1zyhld4Jb72DtuGLH9nKjrDlIcX9YmwR4987dfxQ
	 wO7fcZtnecl2/zh6UTV9l04WJ1gYWQnJECI0JuVu3tcAk35FCoHy/EG5cpypUfVF1Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793296655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=Yump55UT8Ef9TPXNhm//TKPNZT3QytAalelOGbFgvJ4=;
	b=EfjbkcRODRFxR4pFGR1zOTQTLt60+FwUNJ2n76NUFpP5e2Ie5EHMfFPb448NuuEq2KXV
	 V0gzaMGqOtecugkqYsopwD3m8cLa0WbqbM/gD97x1kOD73WCPohE4vLGpbakuMi9LOOoj
	 ojEGT9PPsdSYYlR5V84ZmHvQXehQ383Q5cgAexd0rSXUXsPOdoiTfybV4tKrRcXy+NQrd
	 13t5wPyv2ddX03OuX6p3spAhiSN3BJ8ErtUZzgFkil+MnwELER8qbZE4TgA4/lOTQhg9Y
	 nSmsxHHSwJrZpVNVGaR6/B/5CqmPB4Kjz82zu2Lg2TyYwRU7dSEMPyBGeo/PnIjoN/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=OXPBsCfw;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A91606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:57:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37A91606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=OXPBsCfw
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c423b145922so356445066b.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793296652; x=1793901452; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yump55UT8Ef9TPXNhm//TKPNZT3QytAalelOGbFgvJ4=;
        b=OXPBsCfwokRJ5QP7rWdDQngDwrqoTR5ktM4xOtJlgTv087JbJ6vcPjTOvgfXRL9xWf
         jw0KjTj3L00tXJGDf1f4bFL++ZCoPHpJForuMs2oNJbHvL/LDlsGfjZEtN6YmQl7NstG
         MPMPFXm0DhaCgxlTigQu5Dm6TzrCiaADZWSjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793296652; x=1793901452;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Yump55UT8Ef9TPXNhm//TKPNZT3QytAalelOGbFgvJ4=;
        b=vIFTswypT7OjiuYUJ5i4K3qJSIEHnTwLtXGNw4PsFMcdpO2NCUHV0JX3C/ASXelrq2
         71jF/fyYer4hUZQWrIL+fcxMaDmFbULMoPnMq0vONfTQhTm232j93KV292JbSCK3UCde
         XAe0E63l4lbUogqD5c6Rrf2BjZfYW1a7Jr9QHKe89zypsF8mqdyDpAgb9eK1yyFb7Il7
         S1tjRidHkVgyMZulMCJzOgQ5faL+l3mPgvD6PYdgKepUJEmOT85W/wZ/qRaairgIrQ2s
         iNgdPWcABJxNZ1MaaIJupvEtwyocXps5HVUAjdTyujdQB+OLCKzDPhbredsLr9Ma4ChH
         2j3A==
X-Gm-Message-State: AFq9FYKEKKUMRYq1d1m0VeCWTKNpddCfTD1NEinu3Wnh0iDHKXOagBg4
	kfqgDCwMzNfEi5cQ4kNpEzHBrNNzXedBd499Jt6fw4D4Sa0z579ppbJr5Vi4VvZXoKID1N5NUtf
	2sTwmRiM=
X-Gm-Gg: AYBFou3odMyLB1VbkXvZANrtAdeSxSSOxWzGY9R5YdjUy5Q5AzJl3AJa+2AFyNkjGpz
	sJNhmsLhQMSKkXZ0KkiwCwQ2fbv2iMPNctaKZE+D9uADksYEVqk05i6vRFPZwQtDAmPC23V7Mfz
	wFS60HEI0Emy0RBRF/jUegbGcoSO0Hl7HxPxwMNqHmBdfk5t1BmzUmmbdRPLm5cXcTq3cK8anYl
	BXPaT/ASfEE+KELkHGe2ywpA/Q+cjZZ5XjZzZbMLGAUhWU9yXfovhkC8XgMvZwR5KgKEyIrsF+I
	qNl8+gI/Gu/8OSUr/kjV65Zb2QdAzv70GyilYKDowP0d+n+GBOAJNzbdSzWbPweDRlQNpxbgc3F
	gU38KRhDNcXk3NxvVAWjw4QKW6Z/X/eGojbDyVreAsvpsTIke+BKFwGnSMgHFpbuh+DLR2RyAg8
	ESRvlUIxqVhFqQLjlGUQy+6Wsz8w+5wEmqw7F8wKcDd3b5NgjzSihAyT4lT9V89jsyOrX2/JYyc
	jl9ZoErk3uUlrodpr4mrkZyxOPWoLWCFlcV4t1MuY+241cz3zLW/Me1Nktbzi14VKBBmFec5g3H
	sq/+33KdQu4s0WN9syaSuvYMXGRZvIjnI52sueVieaCjrdcQy5tHObR/2h+Z7NBcIawDf6WV965
	bFqk=
X-Received: by 2002:a17:907:3e06:b0:c42:73df:933b with SMTP id a640c23a62f3a-c49bdeaacd0mr553160266b.12.1793296652480;
        Thu, 29 Oct 2026 10:57:32 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4ca3003df4sm7797266b.20.2026.10.29.10.57.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 10:57:32 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c418e215671so327708666b.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:57:32 -0700 (PDT)
X-Received: by 2002:a17:907:3e06:b0:c42:73df:933b with SMTP id
 a640c23a62f3a-c49bdeaacd0mr553159166b.12.1793296651934; Thu, 29 Oct 2026
 10:57:31 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <auNlZtFskpC1ijA-@localhost.localdomain>
In-Reply-To: <auNlZtFskpC1ijA-@localhost.localdomain>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 29 Oct 2026 07:57:15 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgfoG5arG+zJXAXERTPcsgx5Uvxb6+9DbB4RYJB-8txzg@mail.gmail.com>
X-Gm-Features: AclHuK8v_IcCzzPZ-0ig0cwiczQmRqtm8fdRNJioHYIt5BG1iGdVCXSsaf1_p-I
Message-ID: <CAHk-=wgfoG5arG+zJXAXERTPcsgx5Uvxb6+9DbB4RYJB-8txzg@mail.gmail.com>
Subject: Re: [GIT PULL] kthread fix
To: Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Oct 2026 at 05:25, Frederic Weisbecker <frederic@kernel.org> wrote:
>
> For example in a system with 3 CPUs:

That example made no sense what-so-ever. You say "3 CPUs", but the
example had four CPU numbers (0..3) and the numbers in the example
also never made sense.

I cut out the example from the merge message because it just made
things clear as mud.  Please be more careful.

               Linus
