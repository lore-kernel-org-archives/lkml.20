Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B90A4F0538
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535000; cv=none; b=cerLn41SkH7y1q74u9BH5qCbKjZ2/XZidDmellgok1DN9XBl/SdCrTltJfvOYQn7rB1CypLg+VJi5vl+9w9q3OB3A1aehJVeNLsnzxeN5NobtxaKNmuiHpq3ofUnV+4qFYO+YsbBjyz6oJf2mWJW498jZK4rCDf5gunrflMsJc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535000; c=relaxed/simple;
	bh=ZWEIsbI9KZLDLVu9cSa+ThnujLmk0eJtPeCxKZrzU/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=amJWTsEd1MhNA9gN9Z2vX+Z4mmBg42cGOHgC2TB5IqQYpGyDCdyHcswfJ19BGBQhOC6Fc71HyOJchpuidW88U3R7vmeMssB5sVq4nU8TToCY7eZE0/HiKAcLALEw2xzJWnctz9usNC35zZMoBwpUOrw+JL3OCHRT/RqAdK7s59w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QWizNOhy; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QWizNOhy"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84f38f3b36eso782760b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788534996; x=1789139796; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F390YWGxt3MyNi5QnjZve9MAhJDS5eT5sE6d9ed6jRE=;
        b=QWizNOhy3Vl/J+MIpyYqSNd2YUNj3vNLNKVeKPQffLTimZWpX2tAD3YOUtcy8RBlqm
         eAi65eB/0ubhVatgtZCq/iZX4audXmZBXoy7rxdc55YbHr7wfzQJbf0oWk9QprgCBlhk
         w6eQPbMDKobI4Go+Lj3Eqd+ItvqBprfJaGvL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534996; x=1789139796;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F390YWGxt3MyNi5QnjZve9MAhJDS5eT5sE6d9ed6jRE=;
        b=AcaHsi8RVT+J50ftAlBfWJYzDKoCA/RIU7qqMFjgGV6p2s61tI7wlRt3azBgs4q2Ws
         JqCKGKl5K+Pj8bUlraSZCzzkAuTrz44KPV5Z2Bf/ndq5Gc0i7wV2WIYz0ZeM8X6UxwNJ
         0oub70gDmoySHNu7FQ0g9c8N+WtInmeiIw5KGvDE70yTPhBIIge5YdcOTT54LD5JI4pi
         8CXP47bxQvV5wkAnegkIlgdlyZgWARuWp+8hMIF6nOl0EmAUrDXgy0A2xc/b0kYaPNGQ
         mqBJQzIEGllj8UXVk1iyWIymc/zXIbi18gszzsDznIE40HI0LOHN1Ja9aBYMCNli2BBC
         HVbw==
X-Forwarded-Encrypted: i=1; AKwUvBy36WW+O/1LrWI7aSbtG0G+2OM4MgFuiHtVTHNrV88QrLkC7SUPRDYKx0QoSOQgd8By2NBBE8p8li34Eps=@vger.kernel.org
X-Gm-Message-State: AFuF++n6h0+IW+NErNoE+PwTrutbrCdM/CCm658nfbLeL/MrBHmVjWoD
	YMTwZTvunhudYm1DRxO4XctcPNO7ObP4ZZmqVXrjBfYtNPyObs+uiCks5Jutz4g0AUKk3x2ajI3
	OcB847aw=
X-Gm-Gg: AYBFou2pY9uybGfBgQXrk9k1MY6LX6Y4YNtjqoHEeqQ0Ff4CdK5rYnx7cdYCWyzRMYT
	2lEFvwQ3Wz1qpQSXT0iOpBF3HjbgpvygAeAHsL3qivTO/vI7FZ2l/mrCPodINtgiPbLOnNsjSxj
	vO4T1tXqbBuoZ+GqESgwVWMZRpolD0BceBvqP2SKKOeUmDCKDGcT0+aextEBchtwrP30UcFcYyT
	8dtI1CrjDseficRXeWqbsvgBOD4mTJ94tu7O6GyN3iVJHVrJYnuadgZCmpNvxyL+gG4764CK784
	tBfl/EKz+wF+eGVRSy5DJ/2RCJbiGaGEcEvhGQ2nQ7jB/371Jzsmpd/+CCqxn/vU2Qs7R2m4z4W
	BtQmVWUjga7HI730f4ON5gwRAGDxI6aBuW0DmnGOSCK+axFCuoS73iiGSBk+2dzn0Ojs/4KBPEp
	5/TgkJ9F693Pmo3jtz5yeBsvgnYqxi1crooOv9qHFZ0a5M7yBTlSi7YSETQ+Bihjv+C81jVOSlt
	o9nlg8TaVKihvFBXT5wTQoZ9pXOqSL5EN0dXYLE2uIcV2tBF3aG
X-Received: by 2002:a05:6a00:2d1d:b0:857:7317:cff8 with SMTP id d2e1a72fcca58-8616b2718f4mr8595070b3a.25.1788534987750;
        Fri, 04 Sep 2026 08:16:27 -0700 (PDT)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com. [209.85.210.181])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-862507fd1d2sm448295b3a.3.2026.09.04.08.16.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:16:26 -0700 (PDT)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84f38f3b36eso782650b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:16:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzPWsFIaHRWlrCvbqFanfV1p/cVcxWRXtBjXQDISHPkyF1cAbz0GUKj3mThesLBxukRqF/DJcYfbND35pY=@vger.kernel.org
X-Received: by 2002:a05:6a00:6ca2:b0:85a:bc69:bfc4 with SMTP id
 d2e1a72fcca58-861634ceea9mr9235854b3a.0.1788534985599; Fri, 04 Sep 2026
 08:16:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904082741.578048-1-ubizjak@gmail.com> <20260904082741.578048-3-ubizjak@gmail.com>
In-Reply-To: <20260904082741.578048-3-ubizjak@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 4 Sep 2026 08:16:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiKvgXTJAXveUoWq0+Wn=E5255-Uc5ZzhXDgk31iXEZgw@mail.gmail.com>
X-Gm-Features: AcwNN1VtJhTWzXR0gquZ26NDoBBrzv0qogfNXlOvV8FMlEF1jYs5ipARN8J7JK8
Message-ID: <CAHk-=wiKvgXTJAXveUoWq0+Wn=E5255-Uc5ZzhXDgk31iXEZgw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] compiler-gcc: Remove obsolete RELOC_HIDE() macro
To: Uros Bizjak <ubizjak@gmail.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 01:28, Uros Bizjak <ubizjak@gmail.com> wrote:
>
> The GCC specific macro was historically used to workaround very
> old compiler bugs (including pre-4.1 ppc64 GCC). These compilers
> are now long obsolete.

The gcc-4.1 bug in that comment was about how the use of "=g" caused
ppc code generation issues.

It's not entirely clear to me that the original reason for this macro
is actually gone. The cast to 'long' has not always hidden the
provenance of the address.

The use of inline asm in RELOC_HIDE() actually goes back much much further.

I do agree that it probably is no longer relevant, but that commit
message is actively misleading. RELOC_HIDE() itself has nothing to do
with the ppc64-specific gcc bug, that was literally just a small
indepdendent change to the implementation.

              Linus
