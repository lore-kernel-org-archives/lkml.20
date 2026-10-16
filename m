Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00561D432D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792130366; cv=pass; b=T9nrUPU7MF75+t7kFtfdvAlrKdh3vAiBfsdisLuvyq0FYN1kTaswMz1xIONbGqE3Ee/x8x4JH+zIJGKd/djxEuXBkUrcGHnDJylqFXVVWi/j8DKXhj/bdduCnND5oYThVSLHa2rwKGBn2lI+JmpOc4bnsYAZp+DOegUm/8J06DI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792130366; c=relaxed/simple;
	bh=cv8qgKln0Fe40yOvGUR02GyLpJU1kekbzM2OmTGYAko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jVdSfpWprTKc8bDLPjVFWyw6+ZxxiTTNMXDvoz50On3k7U0CXhhOUSh9PW6dfvcDafPnqakHbZ+A/8Vik10MopUq/wpTfm+CLRO765+SaynroI+JznrkdxxKTSwoARmAYlLdMDd/YtiKFd8nmaLGYQUwGgIaB/E+RoLAWZiyc3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i4947tpT; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i4947tpT"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5361e313e63so14366061cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:59:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792130364; cv=none;
        d=google.com; s=arc-20260327;
        b=desd2NNI4zz1v1sZwlvlhDKkhXRwwdOCWZ2PxhPcWS9BN9CyZXNDE3D0c9l/QQI0Zk
         y5Y6KPF7g2IlFXCMb4aMZCFdV3iOVqVXQf7lzUbfFW34fKeneBwfm0fu8QL9uc7iElGi
         0t+HzQeteZFdqj9vIc0uMPN5lRyVOl7/3m4lEtipZmdXp0gwDKUauKIdAVUnIYLw5buY
         SH+aMKLV7UVsae9ZXpk4wzbtajenSRZBdXEh95ZeQOkOJKyyurd+YqOtdjsH40mWj+LO
         WNh8nGTuhK+tH3QslZfEVJ8o7cTlGHD7SUPQxsF40CGn0nKoy9hqJ8Ij2mUNvIRNvq+t
         nL6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cv8qgKln0Fe40yOvGUR02GyLpJU1kekbzM2OmTGYAko=;
        fh=ePXfPKN9YFUqKYX9LSKR1230CxIw/Hlh0mIq87EhWpQ=;
        b=HoAvYf8qS+pxADDX7wmiS/2dPAHnsGaGLK/w6m8FnWs+cVbNIcdaFdQtidFz7a17WC
         8a/9/FrU3DvgiKl9aYfKgMi1kakww0ZYJXqSdOadOrZvh8eNLi9oZlEAPHHiBO71U7hM
         Lzttz7HJS12U3AXHvgMPfsp4cp/pM4TM684zBrwexWvH95iHUHSG8cCGTQKgIB4EusvM
         /3HSRJSDocaq+C9U/LrMz6cHKemiV1m6jTftHx9DN8ZcxvS7+GvI2mhFqzvyusrBUb2k
         dzRGqr5KeLig/n3mHdp5KvukY1k8cAGEY++9hpUwUkDFq7znHafRt/MApSEavp58zUnt
         NyNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792130364; x=1792735164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cv8qgKln0Fe40yOvGUR02GyLpJU1kekbzM2OmTGYAko=;
        b=i4947tpTCE/fCfSEzwMsdTU5RQ2BYj4BUf/ZEYWuvdzVYE/fuSMr1ujNBYx9JUz8YK
         ykIP5lCMGB12IV6Ak5Tz+svLaCLs2+o5VE5iRdU9npbGij6rOK2lKHW7tOZAdv8Corhl
         zUCjqWEEWsLeHdCic0oavfaHjaCS5C2dJK/K2XIPTtJRkC8NTOvWSpfc2mAqDW7K5RdM
         042VNZ4ZoKYY9YIFqu4pnLrqAdtFlkyMWT1EQ3i3yzvXGS4D5HKUvXacHAmYxmgWTmjt
         qX1ClZ4ibrsHhuShrjiwLgEEJ4qbkwq1uB+Uwlr0zFGocuy9rDp94cE49B+u7nHP6eZk
         fntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792130364; x=1792735164;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cv8qgKln0Fe40yOvGUR02GyLpJU1kekbzM2OmTGYAko=;
        b=hx0QVA9vcyToGH8G7iCDYyZc5s55RV/BW/aON9jw2WYvUr6FUQ0xD8WSRaYQF7EBcf
         QT+dtEEi+YGwzsXxiIgU9JN9PPGQhnXHtMJIDUbele/fT5XrIG0Sws9Ww+gaL2m4fTAn
         M+Gy/L2heEA3nYp01+Cv+e3gVOezEzIQ9utMIaevze2jL1z08qWztgbKFPeSXzcoNwX6
         y7WoBPaldxPkzdKtbxn0CSYkwsGNDqyomA1UBSX8v3UixL1UKHk1gKEI+pnnzwETxFze
         XdWYg0ob6aykd9UT4DRDWVtpXrjMzSnagsDPkIHx9sOb5pxtEIMwY1+NmBRluUAVH0bm
         FmAg==
X-Forwarded-Encrypted: i=1; AKwUvBzQusgMfnha77vWm8exAAa283gxEd3uTsj+k+BQPV7JE+uDW/ktI7xoOaRU86jjrImkHVXVqRLXNeBi5Gw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKa4d+OCGlcZRzNyzXH6HdKXB9yEb4JJUZuhUvRfjKfVN4Kco9y
	A/FgcD/I5xY6OjLV1TGMdcloc5BSv4yjvGpEriqpWUoCg64gfP1f+ETX1aZLwMtDkfk04+5mPCp
	rQdKTjL7ifnPAb6eOjvuRz+DGPthlBWCEj09KY84LTH8wIIpEiAfKLltk
X-Gm-Gg: AYBFou3CjCnUhDuPOjOkFmtSjMp0BoZFx4dMLBTaDPwyuPZHiblMf62aqHBLZmAnvcJ
	3dT45EqVOr129/Hz/F7p3XnAkjWGe2VrJvBX0Wo5QvWJKYkkwWSYd9nikJj9HPkF+hPSZHdHVUq
	H25FoVp7kCioL1WqEbkKvehc8csgRHDlefnBms3dQcdXNphYZT3fnaOtr2KIFKbxk9JsWFLN8Ri
	Y8+R/Wo/JBfTQN8VsAaokwc7yDeYcZj9rN6RVwWPZPEINuASDooYoVL2S6Dy/rseXevWh35fa6f
	Q1EaS8GauvwCx3PwNnfxQWknvFWWbCspQqaLRIxFdjJPfHlQfFvZ3p3LSIrNo4xDsfPB/Ziown3
	KGjtXlU2c
X-Received: by 2002:ac8:5d41:0:b0:535:a5fb:6446 with SMTP id
 d75a77b69052e-535a5fb693dmr360322771cf.64.1792130363037; Thu, 15 Oct 2026
 22:59:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917043339.2093426-1-suleiman@google.com> <20260917043339.2093426-3-suleiman@google.com>
 <20260917153831.GL4121339@noisy.programming.kicks-ass.net>
 <CABCjUKD60kEn0BZo0r3zie6QE8wFh-0V=V6OG3nfa3b1evjVKQ@mail.gmail.com> <644b5845-4a3c-4f49-abfa-edb4fa6ed89c@amd.com>
In-Reply-To: <644b5845-4a3c-4f49-abfa-edb4fa6ed89c@amd.com>
From: Suleiman Souhlal <suleiman@google.com>
Date: Fri, 16 Oct 2026 14:59:11 +0900
X-Gm-Features: AclHuK-q-8Umw-Fhc1OUyPpFNao_hfE_h1fJ3qFfpd-RUURu2C5sR-Hzuh5vUiU
Message-ID: <CABCjUKB9ntxrEzJQcd45j8dUde+91i--MCSW49RWR2Zr40QTCg@mail.gmail.com>
Subject: Re: [RFC PATCH 02/12] futex: Switch PI futex to use p->pi_futex_lock
 instead of p->pi_lock.
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, zhidao su <soolaugust@gmail.com>, 
	John Stultz <jstultz@google.com>, Qais Yousef <qyousef@google.com>, ssouhlal@freebsd.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Sep 18, 2026 at 7:07=E2=80=AFPM K Prateek Nayak <kprateek.nayak@amd=
.com> wrote:
>
> Hello Suleiman,
>
> On 9/18/2026 12:41 PM, Suleiman Souhlal wrote:
> > On Fri, Sep 18, 2026 at 12:38=E2=80=AFAM Peter Zijlstra <peterz@infrade=
ad.org> wrote:
> >>
> >> On Thu, Sep 17, 2026 at 04:33:26AM +0000, Suleiman Souhlal wrote:
> >>> Switch PI futexes to use p->pi_futex_lock instead of p->pi_lock.
> >>>
> >>> When augmenting PING futexes with proxy execution, we get lock order
> >>> inversions, due to the lock order being p->pi_lock -> mutex->wait_loc=
k
> >>> in the scheduler, but wait_lock -> p->pi_lock in futex code.
> >>>
> >>> So move the futex code to use a new lock, p->pi_futex_lock, to
> >>> protect p->pi_state_list and pi_state->owner.
> >>
> >> This is of course horrible. Lets not do this.
> >
> > I suppose the alternatives would be to either figure out how to
> > un-nest pi_lock from wait_lock in futex code or un-nesting the
> > blocked_on lock from pi_lock in the scheduler.
>
> So the only time we try to grab pi_lock + blocked_lock is during
> wakeup so I think doing that should be (theoretically) possible.
>
> The ttwu_runnable() handling is extremely painful unless we block
> the delayed task fully. Since we have he new p->is_blocked state,
> we can safely retain the p->blocked_on while running the task -
> it is either cleared during unlock by previosu owner or will be
> same as the lock on which the task blocked on.
>
>
> Based on John's tree at commit 06ac43db4d8e ("[ANNOTATION] =3D=3D=3D
> Needs confirmation of functionality past this point =3D=3D=3D") on
> proxy-exec-v31-7.2-rc4 branch:

Sorry for the slow reply and thanks for the very quick patch.

Unfortunately, it doesn't seem like this approach works in the end,
because there is still a pi_lock -> rq lock -> blocked_lock transitive
relationship, which deadlocks when trying to get the pi_lock while
holding the blocked_lock (when fixing up the pi_state owner in the
futex code). :-(

On the other hand, Peter's suggestion of moving the scheduler's use of
pi_lock to a new lock, p->sched_lock, seems to work in my testing, but
is kind of a scary change to me.

Maybe an acceptable alternative would be for the new futex to use a
new lock (similarly to what the original patch does), but keep regular
PI futexes using pi_lock, at least as long as they are still based on
rtmutexes.

Thanks,
-- Suleiman
