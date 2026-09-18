Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09363B71A5
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789715479; cv=pass; b=nj7giD3wgGprzPLL4wZy/RT6o16lgcQyxrRHZ4Pg7Ke3QAUY8r+3O5+qWAjXGy9P5APOisWeajoXkjIM+BfZeVbLpweqo2nwILvXQ33NNFSHA/u8Xe1EJ8K0MMLW4ngOakVHt969BmnuIvHOVvwQJzkRanwxV02hbSylLxk0FUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789715479; c=relaxed/simple;
	bh=QBwLzpHWTMKf5yZQ1T3fX02BgcMKTtg2n1ZC65I8N/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VCcnYpQepxn2BIeoj6UG9RvApb+Niu+aBIvmI8hQpC90DNez0CZZls62Z8uIpOSEHhiUeBs59wPuQhQ7EVS3xaoLrMS3h6ZILbepSwP4oreMGfBSWvxV4byca7ufv6qDKg4bNme3D6x3vemcvTC4h8k4yvIuA0esSNtHqTofieI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Jd8uYPJj; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Jd8uYPJj"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb766bfd8so3209761cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:11:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789715476; cv=none;
        d=google.com; s=arc-20260327;
        b=pzW5PYzBcXrtAtPgToQ9mFJAvJVtwxvSbXdPDKGWfUUSPv1SdcpWz+TA/e0ECYYuUa
         rQxALer9yAbbSyPw9UthxAzHQUy3+vglnrutrTcReHyvytMKRG4opATs1YmwzxNxysL2
         e5XAzv9WFbOS2vhcJm2BhOkONcg9p2fiXvaI2nKJAYihfNiRhC7sBvz/R7VFgzSfKNeL
         TsXAjEzdINCYVp3hIHR1h/rok0wiwT6ErnKQ9RTMZ9gX/CiR9dTXFcuarwKZl2t1Rtdd
         w+mIg+XUO3dpdII/Ps1kUtwDjZuAHGFHyxApnnw6N/R81T0GkCxq0UDKMcP5DzECk0Jo
         Np+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QBwLzpHWTMKf5yZQ1T3fX02BgcMKTtg2n1ZC65I8N/o=;
        fh=EgoauIVxGNgbwh7F0O0d1YoVmsE3R3f6XcJAdkbrOn0=;
        b=Pju0YGgNc++7/4XYNxWaM9aw6SYl9VphtjGo/hxR1TqA5us/y8zewq03UvcWUeWF3l
         IXyk94cYBmgBZEcoPYbiRiknM72eMHRxFjMKfu6KlnNoIBwD1YEvHcl+ScZUk+i4t7dd
         tKlHHYUXYC+04CJTWTvtOxsk1dYofqt0hKlHT8ppkHABIVRTKxL9pFeXL2A6vtm677jK
         cDL+6JQs1N4aLKyDuNaEVys29dILqHOUm9A6qiu2fHYrTF5WHt8oFHHJ8WVH96tdUuRj
         ftoXCYe+RWkzGn8BLLJdgRJVBuGuyke9ZZEwHNIZBMLAUm7ALraa5bMse5dy1sNHzaFm
         V16w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789715476; x=1790320276; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QBwLzpHWTMKf5yZQ1T3fX02BgcMKTtg2n1ZC65I8N/o=;
        b=Jd8uYPJjH50GXfQu5VC5ITvlp/qBTLg+gNVGuMSUts8mPMSIdLI9k2nYwzDb+6zkLk
         lU1u109AhDCNTlz/AY0nwnhwEDigVM1DWNqX6OfzRhz77tfC2hVYkDt/GcuAC2MEuZt+
         8nEltzo0OYhAOHlEan1V3QUgRce4q38ZUhpwbA10CnN/Lkv9F1Ih1sVJpVAIe1hkaaoF
         a6eG0+oOMDb8XZiRBVmNKF6VB6sS7LKdgd1pkLc+jExtfDAkcSTpYDOjEci2J2P2GHiT
         1aQsQcGZJ4t0XntItI12VUW97dDmclSEMxJIH5jcmr6KDIVaPBjCxg/bIPf0wiedgoRp
         xJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789715476; x=1790320276;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QBwLzpHWTMKf5yZQ1T3fX02BgcMKTtg2n1ZC65I8N/o=;
        b=stZXcPdg37mgDzCYI1ejeimkAeKbAC07NFuI2pvmjGyS9aDiwUlCXofhI5Q1sQ8API
         Eg5eSkbi1xN7TSJMoSBwlEktT47zo+p7NOL5KU0DDokrVcjyXshxphqLDjTJHeJWcEXi
         CSf/gMTZKdYzFzAYITtUQxyHBfv/3VWiSYVXumTLDLPEVs+T1dnHGiDDNUl6gEljD6Lm
         jAKsv2uo1TAlPb5Ejiv0EmwtumrV5gmll+8tlj8owdZKYDe4+6ZOj9cKwU4xby8G6RI5
         uCIVydl9PKDnfZv0mG+Fp4hFpCAB2rUfngAP/zhDpYwGYCcroKAWVToiYA6GDHRLN+Br
         WRxA==
X-Gm-Message-State: AFuF++l48MCq9uQXg42pnBqJ2ZwY9LH47asIO6EGH1914ecuFys00G8r
	hwX1DpRxPVbbSfK2WZ6+s83KY4639v9p4Rynw/e71Tud44j4KfbrsvqYoX0RAXYWSOCG7zv2j8X
	/4EIcTZmzF4gJW6RktjWfxyIWjEPRGTdlgqemoo/u
X-Gm-Gg: AYBFou30eG/NBy0yQY5J4CCaPwYuBYre7fnZSWyqByFwG0POmaBERAzCrU/4j0Vc45C
	HxPTy6B2iEkXhIRcWEyhSMNggbwD4LVkIOhWqNhQ+dXzF95Hvz3SnOShELC6fGlmmgAJL0vjykW
	I16cTJonrozenB96O91mnWbdCIAAbz0grbvNRsC808s88vNw2DSi6DRiIs/2kL7UnzEv6Eauf++
	uon9yXFe9N8UI/bQHeoPJIa5vYRyLszSUV1H2Cto0kcEkvnW6G5iaxPi7xjQ0in7s9Wywrqd9aZ
	noIA+v8nGKZtA5EGHKtD0huvhOkih4cN/2M1ukL1HhgdmJV/gLG/RByRAw==
X-Received: by 2002:a05:622a:292:b0:532:84f8:369c with SMTP id
 d75a77b69052e-5329e3166c7mr26604141cf.5.1789715475923; Fri, 18 Sep 2026
 00:11:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917043339.2093426-1-suleiman@google.com> <20260917043339.2093426-3-suleiman@google.com>
 <20260917153831.GL4121339@noisy.programming.kicks-ass.net>
In-Reply-To: <20260917153831.GL4121339@noisy.programming.kicks-ass.net>
From: Suleiman Souhlal <suleiman@google.com>
Date: Fri, 18 Sep 2026 16:11:03 +0900
X-Gm-Features: AcwNN1XkLtkK3ca1p4UnOTRs8gEML24ATngNkDn9anpdrgDECdZp8DR9XsQY34A
Message-ID: <CABCjUKD60kEn0BZo0r3zie6QE8wFh-0V=V6OG3nfa3b1evjVKQ@mail.gmail.com>
Subject: Re: [RFC PATCH 02/12] futex: Switch PI futex to use p->pi_futex_lock
 instead of p->pi_lock.
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	zhidao su <soolaugust@gmail.com>, John Stultz <jstultz@google.com>, 
	Qais Yousef <qyousef@google.com>, ssouhlal@freebsd.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 12:38=E2=80=AFAM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> On Thu, Sep 17, 2026 at 04:33:26AM +0000, Suleiman Souhlal wrote:
> > Switch PI futexes to use p->pi_futex_lock instead of p->pi_lock.
> >
> > When augmenting PING futexes with proxy execution, we get lock order
> > inversions, due to the lock order being p->pi_lock -> mutex->wait_lock
> > in the scheduler, but wait_lock -> p->pi_lock in futex code.
> >
> > So move the futex code to use a new lock, p->pi_futex_lock, to
> > protect p->pi_state_list and pi_state->owner.
>
> This is of course horrible. Lets not do this.

I suppose the alternatives would be to either figure out how to
un-nest pi_lock from wait_lock in futex code or un-nesting the
blocked_on lock from pi_lock in the scheduler.
Either of them seemed more involved than creating a new lock, but
maybe I was wrong.
I will take another look.

-- Suleiman
