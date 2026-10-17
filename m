Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DC13C9EF6
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792233758; cv=none; b=ZTwpz/cjx4GOUPQf3WJTc5VGqXBx0Oj/OFjaeJPYMm33/H01Eid1zXmS9FCaVue+oAKOILtKkGhoYfLsn4Xm548BgEydhTyP/km0jxha4AOmPB1ocYB7GIJO3NE1SH7gdJ03qkGFa6Mqi107tgypR97PDiBD7cqvYbKNACx+CYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792233758; c=relaxed/simple;
	bh=luoXeTg/DwvulkFlzn/Qv4L0LOqhemmdtqaKBtyvDd8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=c8Q08pjjo3nGzXLoh+aPafCFDJHgzVUHmYGXQPSELRW+pYp/S0H+1Zp3FWPNrBYMDPz1n0nIGIYFN5QP4F726fBml413wDWReepowR65kjiNIt4wEpJ7N8HXx4Lw2xve2Kx22TP2xrvkxqYpmXGeufY6lmx6Zc3YvKeTi9av+oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VxZYO4b3; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FhYcJmNP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VxZYO4b3";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FhYcJmNP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792233756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=luoXeTg/DwvulkFlzn/Qv4L0LOqhemmdtqaKBtyvDd8=;
	b=VxZYO4b38Z38qrb3EMtakqCESFlHwStGBqvV7M7UrKUVGgccSb9hE6MSwrYBDNB3g6FaXo
	i8yQn2aShcKxvXU6wpx57c37lDgk4h7/BKxY5J7UWS7gb7h2yIdhe/DVT3DsMu+xRfSIq1
	ZF4Ds90/zZcy4LWNqp0jyDMNmvD++O4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-R1_25P7TPuy7C2cWQzN7xQ-1; Sat, 17 Oct 2026 10:42:34 +0000
X-MC-Unique: R1_25P7TPuy7C2cWQzN7xQ-1
X-Mimecast-MFC-AGG-ID: R1_25P7TPuy7C2cWQzN7xQ_1792233753
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4870142f030so384243f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792233753; x=1792838553; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=luoXeTg/DwvulkFlzn/Qv4L0LOqhemmdtqaKBtyvDd8=;
        b=FhYcJmNPzD+Lql2+KVKFNI9Q6fhnA7LxV7sDZSbtiSV/TjDMCNurb2Wn3/n3+P9A4o
         23apgradFnC2PJOu1KDvGcK0pD4cUsWGiU1Wy2pF0wNJPaCT06+LDtHPvEEq205CR1xY
         83OfBvfgfziEXezL4DxjSjGferhzxymOZueHn6TPzTLt89S0pp9h1IFxIhyCbf8zjlcJ
         JiJaDseb9UgZrVNnn+Mgd/8tArc9/oNaeq23AwetjWyDMk5Uf4RJkZ9RsLW3tPFGD8AK
         EIzJBEPhbB75W1qI8NVh5rSIkeNlMuwwicF9cus7mZmoMw3GMu3Gy6EYL7e4/uvzS6zq
         QV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792233753; x=1792838553;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=luoXeTg/DwvulkFlzn/Qv4L0LOqhemmdtqaKBtyvDd8=;
        b=l4z/COk/muqP1tFlwDA8C2WrSxjqRTLvYY4O56tUpC+p83khI20YnIhsRqehsJP4X7
         u7KJaw3m7K+OWgaOGEYDXpOwf/0DqosZK4NLsLe+wHezxyKfOJUVYdGamEZzg8u51Ssg
         OLxWpsRrBB4lSx9t3c8e//zTmjfyKmIes/3MQlF5Hid59a9MlTQxiiYHvNYdPCOZBxHH
         9uOujOK3RWA97p3Cki97s1Fo3zpCvjwr3aKCseCorACaioSUN+tSw0Z6uyiEzNG2Te/V
         MUBnBhSurLPF36q5zlY6weLJH/DStmbKu20o1K3lMuAo0wehGP/ZPAPu6Cf9QbOwmeVA
         lw/w==
X-Forwarded-Encrypted: i=1; AKwUvBwU6vnETbjPXaN+2o0H6JnN4bnq9mBmVgBuhVsZycJ09ayL3pxJGI50vDqGdXpD3eGQ99sc2QHQEY6HYBg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnWoLyOHVjo2iETYKYOBDYil1Jw36pYY4zgVQEH5aYblgTj1+C
	IlSyVOUdetOW95W1NUkesAe3YoQssZlN2fX+U/zM9TrVV9IMIjbFudlZWaT03X6fsIZK8t1+o0o
	cDrPTUBBx1zT9AS+M8JM/vN+ZPVRtl5PO+4RbGBdP9AKmD6x4bdxVV6TMKjsCumm6Tg==
X-Gm-Gg: AYBFou2UfGrGDzEjCoHz/3DggW7ojWeOOVEWXkyRTmQLwFtfUojsKzuh8gtzov2Izw3
	6CXTE3Lso1zuJzJ7wSyJ3EXfbewGKPf3R1TVkQAPSlG7spCeYluVqecChmk4asiM45GqHgROiQg
	23zvqeKW8k1LFBGMnpWZv5mc7HZv6dD/kXLaSGPRXTbz9zJz7TwCBjxoqpQFaf/UVKD4sSCmbIi
	MNInhefzTh/2ROvM1ZnXa8Uny/Qgovs71UG16EE4YlqqqHd9n2QUX2h7aSXIuVJqpubVorAnB5K
	2Stl3M9rJcUYxUFp4zhyiJ6w3xgSYSy83plH5RLDPwZsnL1TsdS2gexTA02Gh50GIlsTfnROh4X
	MQERk67xt
X-Received: by 2002:a05:600c:4e11:b0:4a1:acaa:c355 with SMTP id 5b1f17b1804b1-4a1d75f252fmr47251905e9.10.1792233752737;
        Sat, 17 Oct 2026 03:42:32 -0700 (PDT)
X-Received: by 2002:a05:600c:4e11:b0:4a1:acaa:c355 with SMTP id 5b1f17b1804b1-4a1d75f252fmr47251675e9.10.1792233752336;
        Sat, 17 Oct 2026 03:42:32 -0700 (PDT)
Received: from ehlo.thunderbird.net ([195.174.135.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503862sm10597809f8f.46.2026.10.17.03.42.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 03:42:31 -0700 (PDT)
Date: Sat, 17 Oct 2026 10:42:30 +0000
From: Gabriele Monaco <gmonaco@redhat.com>
To: John Ogness <john.ogness@linutronix.de>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 bpf@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>
CC: Nam Cao <namcao@linutronix.de>, Wen Yang <wen.yang@linux.dev>,
 Tobias Schaffner <tobias.schaffner@siemens.com>,
 Viktor Malik <vmalik@redhat.com>
Subject: Re: [PATCH v2 10/15] tools/rv: Add BPF monitors
In-Reply-To: <878q3xtptq.fsf@jogness.linutronix.de>
References: <20261001152042.124445-1-gmonaco@redhat.com> <20261001152042.124445-11-gmonaco@redhat.com> <DLXSI4BSRE5F.1TLKCBUAGNDFQ@gmail.com> <b1fb01e1c58893795dd4be346f233d39fe653aaa.camel@redhat.com> <DM6H7SK4YZ7A.F0MM6C0I77OR@gmail.com> <878q3xtptq.fsf@jogness.linutronix.de>
Message-ID: <8B3FF026-6159-48CF-8FEA-AF2FACD2E4EB@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Il 16 ottobre 2026 19:20:33 UTC, John Ogness <john=2Eogness@linutronix=2Ed=
e> ha scritto:
>
>I am still not clear how the rv tool will replace the existing in-kernel
>implementation=2E Right now violations call printk(), which conveniently
>show up in kernel logs and consoles=2E More importantly, there are the
>rtapp violation events, which makes it very easy to use ftrace and perf
>features to record traces, take actions, generate statistics, and dump
>backtraces on violations=2E

The plan is to keep everything you'd now do with perf/ftrace as plain stdo=
ut of the RV tool=2E Right now you can see the same ftrace output using rv =
mon <monitor> -t for in-kernel monitors (only deterministic automata)=2E

We are missing stack traces (which I'd optionally add only on errors) and =
perhaps other events (e=2Eg=2E the -e in either tool if you aren't only int=
erested in errors/events of the monitor)=2E

Anything else you may want to do passes through reactors (e=2Eg=2E printk/=
panic or others)=2E See more later=2E

>Is it planned to pull all this out of the kernel but then somehow the rv
>tool allows ftrace, perf, and console to continue to work with
>violations? (For example, by somehow defining kprobes for violations and
>writing violation information to /dev/kmsg?) Or is the rv tool supposed
>to provide its own DIY variant of these features?

My plan isn't particularly strict right now=2E I'm aiming to allow BPF mon=
itors in the user space tool as an exploratory effort=2E
I don't think you would easily interact with ftrace/perf from those though=
=2E

If that's a requirement, you could probably call a kfunc from BPF and atta=
ch a kprobe there=2E I would implement that from a reactor (violations only=
)=2E

For a pure printk reactor, I drafted an implementation that calls directly=
 printk_deferred(), Alexei is suggesting to write to /dev/kmsg from user sp=
ace what BPF passes=2E
Since you were the one suggesting having a real printk, would your use-cas=
e favour either solution? I'd expect some different latency if the log pass=
es from BPF to /dev/kmsg , but I'm not sure that's an issue for you=2E

Gabriele

