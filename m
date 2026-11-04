Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793786187;
	b=x7Kk/ls8yZqYRmQ9wbqLRtPSDz4Q/hrSn6mF34Y5AlJyJUvlCExLd9u1crwrmrGrvLAq
	 tJXA/rs3pxHZuDipVHljWz92OEyyCN2o/4NWT5/b798gnmIwsU7+Cmut0t5mTf02aszKo
	 X5oNKg8jbx068A3CRq91yhxwBOoqR0vxqSfN1849KpFJw2rxF7Povc1pgO/LzCkm09faZ
	 iR6pNDic5Jw92kSh+E7VhmCVOnN1xGpgK6N+YUVYXJhFK5+q0Mh4oJczLfRPTIW0p3Rsw
	 WYNMlH4FQpMc66oxddxQD407oBvDrvvCbSDIb0jXVfUIXgFiwT4bIx5dEiqtWr3YZrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vRF2IRPDKW7IU9GzlHV0/GWISRE9+PInmvf0t89mBAY=;
	b=z7MREw5ta8gugnnzkYcxqqiVESGSPVYs2G49jzfrsbLuWZhbReKBHKO7WihgG9gJuzmb
	 9oAAf2ZVUz3exieiuQJ664eGtWn1KEVCREJc1lqlFSUr78PekaoQzurmSSt/B7g9VI25+
	 /eqL0RUY0D29j/dgLRfZVgNnke0RMpevCkUHueKFO64qjPmseMuIPyD8vIc539XuYsr2i
	 6QOkBks+/7lxERwGQOzrxc6+LSETmI/XGhTxzLMjkW2sMxHkscchoLxwdeiFHIfKV1b3e
	 NN2LazqMUAGWk6ExFt5FEZaM9HnCrCnuVMl9vhnVJtzoeXZqO5ynhUVyyVkirVO5eCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gWZhAgg9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916BF606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 916BF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gWZhAgg9
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so574066a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:56:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793786185; cv=none;
        d=google.com; s=arc-20260327;
        b=TVzRqyqMaRGDsEcgnUFJCVNvv8W2MA84IuYmXTZsU/2kZkTXstgQzn63BDjRqxAuoo
         X9YGJFw0SQiP0roqYZCTcII1DuUHFS4/XgA+4Rs6+MoyFfTKa2/dGOldJc0UMf3Oim7q
         acimTOCxKuudmZATKuTR4yxYfMC5Phxwru8mIFxHdOxfQds7WFLBLanB7625gFN0UKo9
         4ZNp8Wl66r5sI0r6UDPzQN3Vi3V9J+sou3ar/9FdM7+ro4bbZzpt3/mtfL+6GHVsmj1O
         pAnrSUlFjoMBYN6ERNOh6VCnKLqUlmq15KsnBgeLti+Rf+ZWwvZgRofgmRKcjLYv+f9m
         +YzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vRF2IRPDKW7IU9GzlHV0/GWISRE9+PInmvf0t89mBAY=;
        fh=11mwesPaEGy79902bFS/9IBm9GXjPYYdcZ3Ge/bKgi8=;
        b=b3OsHyYbITMU+cMIzeK3h8OTSx0NmwEUs4oUYKmH8P6MIAU2Em2hI9005R9q1wGrR1
         yZDlc08mDKJvqn6tPhUVH7C/HYMz/R8EIFOiFapU7ZgfD9QKxupRCI2z0H4T+xy9/Eqk
         igF/vbhJ37/g4Y8hiUx6RRQDpxLcOK5TqmNsBvutKJh+GS+FK26cb+fWwx+9y78tng+0
         t4rAYlAwiZU3SAabz5DJTgPZTwJtyt/SqRudoTNXuIfPsHdJ8dKjbz0w752fg1T6xk1c
         Kj/SF2zQbQP57flO58PmM/MLpRdJsby5qdMsGnoEYAOCfMQeV3wlA//0N2YRWX9yLYyu
         7JOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793786185; x=1794390985; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vRF2IRPDKW7IU9GzlHV0/GWISRE9+PInmvf0t89mBAY=;
        b=gWZhAgg9YIDgZnOonSXVa2tZ1hGN+OASVp+1ONCoXUnNkQs077OHpb4z4VM4LYwFKP
         R6Csqs5BBmw9gKruR6j8qPg3ia8pm20lKLdlQMfNK/q9v9dPXdbR1x+WckoqPpsyklvt
         AyEOFpqNSzuN1tp3aEy9YT959YykKjrJv8WoA4Ig91YIVE/qkURqodbAsz+nLaLEeIvU
         h6Xl3NcsHXmI/Y4YHK6zXc1gopt77iJnCN05JO5IHdbDnrsvlpIrA52KWgy+d7bklzGF
         iCydvnDdwy/UG1QT4uLsUZdCkJcojYep8jGV1S0P2LuV2/D/u82cTzgQifTjhtqhJzbw
         YroA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793786185; x=1794390985;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vRF2IRPDKW7IU9GzlHV0/GWISRE9+PInmvf0t89mBAY=;
        b=a+uNJZEMjD3JL1IaN6uEiGCjuKHSZsmBXyy6GbMxtQ55zB+QbHvdt28LHEwb4u93Kk
         hQ9gU4UVNz7zTkRLPMdgHwxtKQ+/SDZYtUYmeiPZuPgfwycwrCmizEjU9mZG0K57sGb/
         ahqGd8SQ7qUZjvTw0kTPqJfJr+zdWmeJzipnE4KOCdiJLfcbKrbn66RIUX7OCDF1OdEO
         j+YbU7F+ZacWF5OG3o6zugTr7ytL1dSSGd8XqhCQ5Da8lcjz8rrWOIdwYJX0FhD9FWAJ
         CzW0mSYNJFC8R4i04SlYKe+ACRUa1VM8nlFovJ4oChvFmhYr+grrQSAUSXs1m2wZt/Xu
         sG2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzAPdiNYwQ2vePmMC/PxlwaAQO5EURz56CzgMpETXHAMNesji5pcBvKkPRMc7XErDRL3lyiC5eY3cS0yfA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QBFZ+oGn54va2rMfm4pQ88HJQKAX8SnesHar1mJCa/8HGv23k
	zARKld3mtROF4fbbgFvgtwSyC966fBQsvWs8CUcv/AsblZxU0d1JxYloXv3Sw4iWehHI7ATK+zI
	L6tcbu0X0Dk9264vqk2RAmE7subQUhzZ+8e4u6jjn4V4x9qh19LKa3MoR
X-Gm-Gg: AYBFou0VvuyQMtAWhU33VWaeSD3NauEBwVZk3biGCDxTMnR7I4TvXz6a2Q4LAUXAFF4
	npOuZasQMEEvU5GQg1OA9L+8sipWqoOXSwHRtCgrY9bf8DxNMUgKhgiyRbKRRib1mPK5lBAZrQX
	KqaIIWrvr/b97km0/STpYW9bKnVrZQ/G1IMCAhZajrLiPn4E8ylZw6Sj6pynS5P/QWK0H48H4dh
	9hanat+evEGewI2KK+80/xSjyy/1Zl/WIF34sjfgXy8ZirXHqBZB7Hx593B4XVXf7p0iTEtQQCR
	aSrSaJ4WKUGzQVb4pJJxMt5o7JrNVvGmHPeqYKth0HldKW2+pTs1lLXxohQYxxgHchFc4nEXWtk
	RA92edjlvRshUbNjeGe79DyUwSjHII10u4MW66WKxhv4MogGNyRx5zpLRZ0IRml2yqEoD+yvU0y
	Ly2QGSSZDvjFL4
X-Received: by 2002:a05:6402:c50c:20b0:6b3:f05e:fd79 with SMTP id
 4fb4d7f45d1cf-6b4d497e5f9mr8204762a12.21.1793786184593; Wed, 04 Nov 2026
 01:56:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-evdev_syndropped_fix-v1-0-b5400740e1f7@google.com>
 <20261022-evdev_syndropped_fix-v1-1-b5400740e1f7@google.com> <aulT9-9OU5VE_PpL@google.com>
In-Reply-To: <aulT9-9OU5VE_PpL@google.com>
From: =?UTF-8?Q?Kornel_Dul=C4=99ba?= <korneld@google.com>
Date: Wed, 4 Nov 2026 10:56:12 +0100
X-Gm-Features: AclHuK8jBOCIKnQpO3m0aaz7IJblEPHIyIkKJZfCtJmy3_bgKhSECD37vY3wjso
Message-ID: <CACF_fqmxJCQCnDXadU2MgEqkrabwNLkMy_ZQ2pdxb+3bfNsu3Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] input: evdev: Always terminate SYN_DROPPED with SYN_REPORT
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey,

On Tue, Nov 3, 2026 at 4:33=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Kornel,
>
> On Thu, Oct 22, 2026 at 01:39:12PM +0000, Kornel Dul=C4=99ba wrote:
> > Per Documentation/input/event-codes.rst, on SYN_DROPPED:
> > "Client should ignore all events up to and including next SYN_REPORT
> > event and query the device (using EVIOCG* ioctls) to obtain its
> > current state."
> >
> > Currently, __evdev_queue_syn_dropped() queues a standalone SYN_DROPPED
> > event without a terminating SYN_REPORT. This causes two issues:
> >
> > 1. The queued SYN_DROPPED event remains unreadable until the next
> >    hardware event frame arrives and finishes with SYN_REPORT.
> > 2. When the next hardware event frame arrives, SYN_DROPPED is prepended
> >    to it in the same packet. Compliant userspace clients then discard
> >    the entire hardware event frame up to its SYN_REPORT.
> >
> > This was discovered on an Android system with a gpio-keys backed device=
:
> > 1. gpio_keys_open() reports the initial state on open().
> > 2. Android follows open() with EVIOCSCLOCKID.
> > 3. This creates an unterminated SYN_DROPPED, causing the subsequent
> >    event to be discarded by userspace.
> >
> > Fix this by appending SYN_REPORT after SYN_DROPPED in
> > __evdev_queue_syn_dropped() and updating client->packet_head
> > accordingly.
>
> I do not think that injecting synthetic SYN_REPORT is a good idea: we do
> not know at what point the clock change will arrive, it may arrive in a
> middle of transmitting a packet, and if we discard only half of such
> packet it will result in incomplete state being presented as complete
> one.

I don't think it's possible to flush the queue in the middle of
receiving a packet from the input framework. The only callback evdev
implements for parsing incoming packets is "events," which I believe
is called only for full, SYN_REPORT-terminated frames.

The only possible scenario for flushing a partial packet is when
userspace has read a part of a packet from the queue. In such a
situation, userspace will only see a single SYN_REPORT, though:

1. A full packet is written; userspace might have already read a part
of it. Let's say that the remaining part is: [foo, bar, SYN_REPORT].
2. An ioctl to change the clock is received. The queue is flushed and
replaced with: [SYN_DROPPED, SYN_REPORT].
3. Userspace now sees the part of the packet it managed to read, plus
the [SYN_DROPPED, SYN_REPORT].

> Compliant userspace should not only discard events until the next
> SYN_REPORT, but also query state via EVIOCG* to reconstruct full
> picture. Is it not happening?

Heh, good point. In my case, userspace called EVIOCGKEY(0) and
EVIOCGSW(0), but it didn't parse the results correctly. I actually
fixed that too, but for some reason, I didn't realize that it meant
the kernel patches are no longer needed.
I'm not sure if this patch is relevant anymore; sorry for the noise.
BTW, the second patch in this series is only relevant if this one is
applied. Because of that, I didn't respond to your comments there.
