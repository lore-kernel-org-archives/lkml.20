Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794238056;
	b=vRcOAfvkenegAwFeSYDm2exT50dyCt6er9h4AurwxsEmtsctbiX7pKWN6pSsiCn0CKJ2
	 OkBpmM566F3Euz30SAX7puVT3D+K3Pa2hCn/ZmsAwZIqa8xaaxZOnH4SRC7KxZCnE+kou
	 1Cij3k3QWSSH5e7ME6TF5TnABX3KtKVD69jpplmHidaz5xfwhYMBx2hnAX8QwUnsgonI9
	 NBhNdbEshbD0oRyaXZOqJTQq2C0cNJLbxbw6IxXL6wHVdk9ZRuVOuTqWbxrnB/XR0Pxp/
	 NwdLWCloXYEgsICm+C7z1NJMaF1qSYIj69sFINoBIybxyYsSigOWBRZWfzz2WsFHf+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=CkHUCom+pnwRgKBsSTRZm1uBXmondET4nnHsAW2LsKU=;
	b=rL+bw5xEWgnepLgpAWbdysND9ObtS2oibsVVWjiwNbOgX4o/zPm568m7b7Y92Ot/UNIA
	 5qTANEshZNtanR2B+3zJtKPGlnqSrOn/BpFPMR3OG+NlIDvGIlxRQvbImgvqaTmJPQfyB
	 eEgCGTwj+60AUTAuXD3bFj4b5RuPUMu1FyQe03aow/5chIVZXZx6H+JMZWgF9nCoQgTCX
	 GGHaQ1Xx6UHtYE83MKlFisWCwqBYYfXdj469L889ugR4l587CGurWYv0ULoTTL4+1DdjZ
	 rxpk05Q5XvS1KRUxf7aVk5ueJ6bHyumX/XeBVF7L4P6CGedd7zmAjJW1rhfPFvoaL+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="iCNvQNn/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D77606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70D77606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iCNvQNn/
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b3b4944abeso193942c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:27:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794238055; cv=none;
        d=google.com; s=arc-20260327;
        b=hU2kLlUAiW+TDjn7AlAoy2qVJby4HDSPjViAi0AmDY0vuGrFUWIwDIfBeTP0eWZU+p
         Z1hkcfY8SQuTDpORJyPhcB8LLp9MaCNQipvbAynfiE/BQvbBAJ5HyeiK6i4MJgotOT3c
         S3SFDIkTmrficFsoamRA9fyWlZbdsvfSzssaUs/hYcM/iEP0kqay/cAwSAjNUavTn0ih
         oA9ANM2G7eic2i6uC0XNAeWmJeu3ZtwtMaIc4ZS7wuvStMpb6wjtsXjbjlTB+rDOzuZ5
         azCf1fhDwZ00xtVV5+JQid6k/igT4PEgSrryShVGDLEvakneeiCJ0aCblejFJZjoME9B
         jRTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CkHUCom+pnwRgKBsSTRZm1uBXmondET4nnHsAW2LsKU=;
        fh=ET+mMGTlPfORlHKc1++qVh55nlrHunmdiOPce0nTfwg=;
        b=Pj8HVrQvxP43hkP4fXCU1pq6CtJTI60oAhbd3J42CYg1FNN957tSwb6kjB4IZSxuPy
         8v3Bb8uZtlr5sWoRY3CXX651/8XSIckg2x0++9DcfpHvuni8nXHi8R0ITINc6TMCxIj5
         hCl1YjXdbEa07P3iTSOMM7whcwIwed8KOIUr/8AZ1ZWAtvCN2UKItPkzgddKUpmAxchV
         yah2pJktliuwTIwGLKdohFmmupdmc6NsKXkTwCqyGwMwsLKm7IX2u6DjyaJ48uOpVoFs
         J3w4wyM61HpO3JtRkW3ac8onSR4qA/5bLpMHVB94fycskn9ezlpOq0EQT/Nrmethkr3V
         VQ5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794238055; x=1794842855; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CkHUCom+pnwRgKBsSTRZm1uBXmondET4nnHsAW2LsKU=;
        b=iCNvQNn/0UJ/59YGohB3G99zDX081O2aENAo9nH81WKcbVOa1rncgjeC42J6PLa1Fu
         yUqRtILJr3oTjHVHihXpAcrQOFb/uFOun6JbGwvrZTu/fahKGXAwtH2mAv7RO5dDLYqE
         S99Z5kUega0CsW/GuB8MCGg2CoXe1zEyqyrfclga7JnB8kuCwjIDhWKu7H/VppaOiELK
         IIFIOi2Bm7dd2dJ6GH0QVtqFcC41XPoR9QdCZRLtwmYAvfXFUcpgOd/jtmdkzYpVVPiw
         SD6dKwgQkMRhR2Ykieh5k6DlnUifKD8w53qipUspy6v9vSq3mgf60C80E1Ep50MY+WW4
         iLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238055; x=1794842855;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CkHUCom+pnwRgKBsSTRZm1uBXmondET4nnHsAW2LsKU=;
        b=JnsvfBxFssxZKniDWbXmtPGyukjjvtrTmtSrwKkJXBJpEnpDlPtXMBa/DDBIuSlU7K
         jzPk5yJhRiZ/Tr+xrcr44zAd/a1EZuqqF9cQfC7WKkuJqHZBXCFRs1NrQjIRRigPStx9
         4Ac3j+tWb3BIxb+2DbKRu6sOhTkGUQMHqOma76pKqI0eg0MzvT8eo9enMMWOH1GCwXe2
         nKJq4DoUs/iVvz0jRu4d4rNAZRRMN/gWzc/z2rhexUhzJ0fdNVYlusEgjMc1xD+1M4rS
         LQa5tnLMD4AutO22Zh5Xc9Z1ZSgQpDRy6NL3+S4vvwqf7Qobp2lUis50IrbtQJ/swGbI
         SiuA==
X-Forwarded-Encrypted: i=1; AL+hErGjDCHaugBjRpHXfzNyXUDVEyOMlyEbHvIJh+Zopnuqs83foJo20ag4N7mcmbi2Ld6t3Lpc884rhxIlLMM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UrYu3qKV9stvOVOGotkjpgXLZLmiZaPu28Ytv2bM1uyMXjacn
	tv2YerDr2n6h5kEjtHy4uSYSdm9WWdHOjWlhhboZ8a/WU90Is7NAiRufbVEjhx4tyhlYVI4q/td
	0kieR+mgxjCkZfSq8FgL0msrzWHeVrlq12qdtvRsPoA==
X-Gm-Gg: AYBFou0cEemy7j0glXB5NQJEzuVIGpPaHvdvVgNwrbwF81EvjGDlYBPBHOjxpQ5ZZK9
	LhIsi+ZcYDhzcnD+pQLqgzBzD2rluwPN85rcoJ7lpkqKW/mCAV8oXBEijvHAifXapMFwNnEs0Vx
	4d3gYqBHrJSY5CiwTlT+oQdnVebA7PTBPcBjPGPHDPYdNQ0IEx3NxgNEtCP1NFOSMnLOHPQm8Jb
	0DI4Ru8fodDV6GxcS6sxUL/wucTgRFEP3FWxjf3rEvkVzKvOX4I+Evz8bLJLmQ1ePK0aSZI7T8i
	xE5Q7JscLuM6xtRtCJUWRKoXSUfwPGC262mLP13gP6TZXZl1KITIkZiaBEqHtGTiE672mdjxrR5
	o5x/qvYymdkTggImzoJbttug0ZQPorMc2HK+Lk6n8RjveYE12WUqaFbtGDr3CeVqXFVUQMulf7Q
	6XO+jbYMJBCdBqKQU=
X-Received: by 2002:a05:7022:28b:10b0:1b0:430d:d81c with SMTP id
 a92af1059eb24-1b39feab6a4mr6840400c88.25.1794238054264; Mon, 09 Nov 2026
 07:27:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106151947.3991524-1-vincent.guittot@linaro.org>
 <20261106151947.3991524-3-vincent.guittot@linaro.org> <au38gSTzmvPKmqWT@scheduler.schedules>
In-Reply-To: <au38gSTzmvPKmqWT@scheduler.schedules>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 9 Nov 2026 16:27:14 +0100
X-Gm-Features: AclHuK9Nrs4TS1OKNzgmtAWPa6RLxFRPHbepbecLp2IzICCD5FnYMRrJefiIp4c
Message-ID: <CAKfTPtDXo8_3tfXt=UH+BKyO1rJCWjRAVXjO5nFVHO1NBd8LyA@mail.gmail.com>
Subject: Re: [PATCH 02/20 v3] sched/eevdf: Reset lag at wakeup when prev CPU
 has been idle
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-kernel@vger.kernel.org, lukasz.luba@arm.com, rafael@kernel.org, 
	linux-pm@vger.kernel.org, tj@kernel.org, void@manifault.com, 
	arighi@nvidia.com, changwoo@igalia.com, sched-ext@lists.linux.dev, 
	qyousef@layalina.io, christian.loehle@arm.com, pierre.gondois@arm.com, 
	sshegde@linux.ibm.com, tim.c.chen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Nov 2026 at 17:22, Kayra Cizmeci <kayracizmeci@gmail.com> wrote:
>
> On Fri, Nov 06, 2026 at 04:19:29PM +0100, Vincent Guittot wrote:
> > @@ -8376,6 +8383,9 @@ static bool __dequeue_task(struct rq *rq, struct task_struct *p, int flags)
> >
> >       dequeue_hierarchy(p, flags);
> >
> > +     if (!(flags & DEQUEUE_SAVE) && !cfs_rq->h_nr_queued)
> > +             cfs_rq->idle_seq++;
>
> This needs WRITE_ONCE, no?  3/20 uses READ_ONCE().

I hesistated to make it WRITE_ONCE but i concluded that it was not
strictly necessary because the READ_ONCE is only used to compare the
value but not use it for any computation or sync so if the compiler
wants to do any kind of optimization what we really care is : is it
equal or not ? so any intermediate value that we would read would be
ok

>
>
> Cheers,
>
> Kayra
>
