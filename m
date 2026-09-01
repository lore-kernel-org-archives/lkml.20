Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2C536728D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788243685; cv=pass; b=BoJurhNP4W3V86U9gfM4KDsfHVc5tJtWthtncI60+dS6RYfms/IN02uIMGoIeJMq3Jzetl8dKIanmzlJ0rcdT/Yaq8VgB+4XTl9nVCWsl3O7KrbSiakHssCSjDJPGDmgcHGCwsl4k0ywZi8vR5AfPCU/1R7/PU4losdbdLLyV5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788243685; c=relaxed/simple;
	bh=I3lSPzdIKrqVH24xSYTfJkxcALnNqxzrGfeYxDEtYXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HvuXhhsopQWJ15dH9UHwR79FH3Q2dogWFga3D5GjY/8DoPZLGK+lF/i/+df1e43IaBs1t1VlOsyCxWZ9QIzAafTg7ORHkptOdj2vmKSuzG9hS/YlU/dL2i2Zdu5hkM9yZ5a2qjhehE52F2L/Cj2V/ReDT//pPjYKnZvSxgRXt2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m7XwxRAr; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m7XwxRAr"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a611ba5130so6059952a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:21:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788243682; cv=none;
        d=google.com; s=arc-20260327;
        b=EuEY/oUxRT4EiFOYgWpZgnQaz1JGVJvjaDv64TGjBOhj4bKz6getgjtZ7KeXGja6b5
         dbwX+XgwbXQzbTmwDYy1mJLO+r8Z06aKx/Z0Hla8/0PziSs40K3D2vQyVpqp+jAmndA3
         yc+gDZYQSMcRpq2J9kKZakZNzGEqYQ8uB4CRryjpWlpMZuuGIejTdNkAFG74r+9mErxF
         Z22ZmlRy1ADSwPcT0DrU5hHiCCBCLMiVkVa/uyWzAjW17rC4vbLY4eSBNw1olcE1hk9/
         Y5axA9seP7Z2j8+aWrC2fsxh0yGMZfR2bgxLpLXv2r7dycGky7Ap3yFslQ4fpIcvle+C
         lMVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=I3lSPzdIKrqVH24xSYTfJkxcALnNqxzrGfeYxDEtYXM=;
        fh=KUXZUBvUDkW5/duYBmBCfdEmbUHDSXOlKRN/kMo0ViU=;
        b=QTiNHc3+Cu9R2icGkB8STB3U0V5Cz8/sMtqFUXp/PGaR1tppYfphlbXaNxoWcgomBs
         wTmgqgjaW1xS6txgkdpzESvjfCuklkwEt+ofFQpONQZXEHoQYs2Zydl0nEoB6PUeYzEI
         aAPp7USyLYWlpJI33FQQ58OxmnYrM51GXRQXo+AiIv7umtlootxPQ2LVOncvpsJhIpDp
         Db8s20cKhlz+gr9UZicK5KVDFGo+tMY9WVa0rI8LilbKNY99tp4zzBKOYhY8etNS54ge
         1QfssKmD+jWgFHsQP+drW2RcyWSsR8CCVPKQhsrE6BvKjv1X6mB5quSpA0pN2dvBa4Wn
         SUsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788243682; x=1788848482; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I3lSPzdIKrqVH24xSYTfJkxcALnNqxzrGfeYxDEtYXM=;
        b=m7XwxRArAefMxoydkfuig8zdmevCCo4RtmerQMVrjBV9fKihtYIOJaK3l1lGEK3ib5
         gcvlf6ijpgiMdJW+Pbmy+BxA5v6836IIIJ/Z/r1t8lA50Kbwq4U2yby2YRwvZFxmzqrB
         o4Brj5IAuUp13ZuglvhmegFA6aS3DkQzPtfZqRQBrQFeez4fjNkTYQTW0kTgIAcGNKLu
         DzBPyKxtwKs1i7rhvi5kiKVFis47uY6h9eaLGeYZYNIhjq0lCVVfCY6xM4s1SNld5tDz
         mA8cd0lGrt5ZFPi7kJqT3zO+EtWktfaOyzYdILbCtTeUQ28+MsVobQq5Z9ddJC1ZVQhh
         tSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788243682; x=1788848482;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I3lSPzdIKrqVH24xSYTfJkxcALnNqxzrGfeYxDEtYXM=;
        b=f7f2Pm4JXMlra7ABkGtTJMqxlmiMLkZYWm1xjvRCzNzeg8ExZip2xckOP/4kNVej6X
         dMZBRTqXiyw4IOY1TuqzL3qHhgCrjcRKp43eH3Ire4lZn4eo1nuIcVErjGyEljdw0hTt
         JN5BL1GSazrFb+8mDToHsEeiTsNPJEd0mzGFl+956+nL/FjoRuUmWlbnXQuPenw4cOlM
         mG9UD0GsknaYSuCdY5sik9LT1upxc7N25OvgAQ0NLhNvpTuOoQ/kXVz3DjkDSDwLo5yI
         X14w0+dl8Ze6KTLE8URSq5pyskvJfYcORWYAv0mwJkC5U8OoVlxaUchFv89Spvtav/Of
         3NHQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6aVsJonUmJkaOB5NqRGznbgOxuFWpsBRB57tMCZZpiDCtPCkfNPkF0B3u73XecASHMyaNf9v2qJy0mqo=@vger.kernel.org
X-Gm-Message-State: AFuF++lu+386RkuRePTjYzzJm7WXkVsTXKlfUY4flKn2NDNOB1tq01eX
	LEM4E2RQl7HeI3Cmdik4JWX8sRdFQA27Gg+pU005Qc/Nx5iR8GRWvq/BvKY0lWIGKcfmUpYtW7w
	hnrQ6Mhg44lelmcZSTGow97vVi8Ogih5sKeYRZr41rQ==
X-Gm-Gg: AYBFou10N9Uhj/IJDLRznoGHw0Emi4gWnb5+9Go+ErcBypTFYLorrjsda+T/0loSPFe
	XHY4y/7ros30Vcnr6/B0RBw9WtJYKFM8cASyWAnDGcF+bU7D0hg8O12fqRl1MmYV8uqtNHXtkfw
	8SNX0/ak6jl9Qc1/4AVHzd9FaBDljy8XkBhqf6bEOTSkCf/+A4dzwUa1U99CvhJRBM99eJ2sI0G
	T76eJv5hymyrlkr8DWe1lT1cxBMUTrlJiEpYNPNhYV9Yu+wiEvud/etq+wYIjynazIQgavtZCy7
	+5JDkyvMHR42NOSv7lGo89bIWKBxlWlQv4NC2tzT0dL8E9YpnI8N7kEcCNuROWszq53eQU19wMq
	blppfA6z/s+gC
X-Received: by 2002:a05:6402:42c4:b0:698:be4d:ca2a with SMTP id
 4fb4d7f45d1cf-6a663ac4091mr3714223a12.15.1788243681562; Mon, 31 Aug 2026
 23:21:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825103855.721013-1-sshegde@linux.ibm.com>
 <20260825103855.721013-6-sshegde@linux.ibm.com> <8262d2f9-9f2f-4821-8497-991d7c8448a3@arm.com>
 <apMziCV_8y0xeIBT@yury> <53035ba4-53ec-4907-93b8-c8b957d1fa61@linux.ibm.com>
 <CAKfTPtA5Bdw89hezn1wi_p0m0dJgJJ1GYg8H93PsvsMC4bVJxA@mail.gmail.com> <apWxmL_brfi4fa4z@yury>
In-Reply-To: <apWxmL_brfi4fa4z@yury>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 1 Sep 2026 08:21:09 +0200
X-Gm-Features: AcwNN1Utuah9bS1-hCxKZcQtbUk5R5Z8_GlRW8ZBL4bnKRqxoMfIHUQt_k9sfL0
Message-ID: <CAKfTPtA4zmD=0Es2cXSHAodTZGLJPvv88s0_4QScp745PxFVMw@mail.gmail.com>
Subject: Re: [PATCH v11 05/12] sched/core: Try to use a preferred CPU in is_cpu_allowed
To: Yury Norov <ynorov@nvidia.com>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org, 
	juri.lelli@redhat.com, yury.norov@gmail.com, kprateek.nayak@amd.com, 
	iii@linux.ibm.com, corbet@lwn.net, meted@linux.ibm.com, tglx@kernel.org, 
	gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com, 
	vschneid@redhat.com, huschle@linux.ibm.com, rostedt@goodmis.org, 
	maddy@linux.ibm.com, srikar@linux.ibm.com, hdanton@sina.com, 
	chleroy@kernel.org, vineeth@bitbyteword.org, frederic@kernel.org, 
	arighi@nvidia.com, pauld@redhat.com, christian.loehle@arm.com, tj@kernel.org, 
	tommaso.cucinotta@gmail.com, maz@kernel.org, rafael@kernel.org, 
	rdunlap@infradead.org, kernellwp@gmail.com, linux-doc@vger.kernel.org, 
	jgross@suse.com, virtualization@lists.linux.dev, sunlightlinux@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Aug 2026 at 18:54, Yury Norov <ynorov@nvidia.com> wrote:
>
> On Mon, Aug 31, 2026 at 05:09:41PM +0200, Vincent Guittot wrote:
>
> > > Dietmar/Vincent,
> > > Do you think it makes sense to enable the driver on ARM64 now?
> > > Or you think it is better to delay it and once the feature is stable
> > > ARM ecosystem can enable it?
> >
> > It's always better to support all arch by default, unless something is
> > missing which is not the case here.
>
> ARM64 testing is obviously missed.

But the cpumask is already available not like if you need to create a new one
