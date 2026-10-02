Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F868415F3A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 07:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790924948; cv=none; b=hPvClUprPn3J9GykiUmUlswR4ca9eHfl8uRLJJm6T4StQoS6rWQLaNfdzx4suJfkz6Us46RYLQSJhzfMcg/t1/g830DzlDu2gFLJ/iXbyb513BkkLBetNW2zVs6lsc/9gxPmCG0vXA7PIMz67DORVlwwOIUV/E1Kr7PC8QmVPZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790924948; c=relaxed/simple;
	bh=/nvbCGBY5PKoEyzJ8jEa/LFu254NWvw+9KPlYK+oxWk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KLyoBsnaWxNG+xso3RNaTSRs3xLBELdz81wWwGh/5ezkZ6Pn2HPX87WHJHXsgcCm1MTx4t4+kFddHIKJTK5Hw1hslZTj2hOX254VxSqGJN1N2xF15KB+CosVGlocneaF5eR/eqLfHSJi7Y1CaSOgKC7n3uUqxdtiJkt3cC46szk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QbCC6oMQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ElveSUUE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QbCC6oMQ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ElveSUUE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790924946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/nvbCGBY5PKoEyzJ8jEa/LFu254NWvw+9KPlYK+oxWk=;
	b=QbCC6oMQVbpS8mH7fpiigGsRO3AlWZGpyxQv2QB2XH6SJsbl8lxQINaUNaljOTKTm58mGh
	0byWFTOsG0ED2YLbx9r3f+pQYcccKw5UFWYReSVqzNNiUsWlJ7vULGUDmsW8Z4BX5g6oeO
	VDOimTcslzevqJj2j0qbYG4ly6PutBE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-9REpOOhxOCafwLn68zrnpg-1; Fri, 02 Oct 2026 03:09:05 -0400
X-MC-Unique: 9REpOOhxOCafwLn68zrnpg-1
X-Mimecast-MFC-AGG-ID: 9REpOOhxOCafwLn68zrnpg_1790924944
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48af3e230b9so3069417f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 00:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790924944; x=1791529744; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/nvbCGBY5PKoEyzJ8jEa/LFu254NWvw+9KPlYK+oxWk=;
        b=ElveSUUEpNACIrIhkk4foVHqxuHGLdgzqw2K75CQ/I1dkXwIUO3EE5huCy52i3zxTA
         cp5+DkEOaw8NM70peZla/fVsDGKRNnoHw2wdn/nnZUGugDaDJGTcrDYF48KtjpweCOks
         tDZwl43DVScqahFfZueteLCxWpC9tD6hts+y/2fUCiRMZWhbsL223PxJPQd2GrF1EbiQ
         6etbUEsD0YT9aYfQUWQQvd3HdhHiTP3ik0P6Xg5mUi50GRsHFfuq2zJKyNPJKnVMVdkX
         JLq9Zsy/Oe6PkhsFtkspDuJoVwVAqmkMPZMhANrpsEYMptXYdyiaug1Wg7Ylb9EDiBvd
         A3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790924944; x=1791529744;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/nvbCGBY5PKoEyzJ8jEa/LFu254NWvw+9KPlYK+oxWk=;
        b=G/Zb0r/MgBX4yQn8IHmCdSHWWPmazQiejcwfem8OpRoys+GZPNXbAwbC5FREy5qqmK
         wUPBakzsTIJIgZQRmwUI43miTeKGmT8IrMgOLLbNS9gB9BoIV5R4HKaysUGjdZZFHq/y
         4WLj5ewol8amSei9A49jkNYQWKOfHWL/WvDFI6MdfSPts1tgu9DXJ1LyXBl5ZjcsjHDT
         upHndto/Jon4VfzkCL64C9aES6uCkugi4gOyhUnFf7XotzQZ/PxJKLoYvFV90xpJ1Usm
         Zi39aMNx//2u1CgweXuW72CTgZfD5ROP5ukcy3VtjUwQQ2Q3kvR9Mp8vcIz6+oB6woXq
         baHQ==
X-Gm-Message-State: AFq9FYI/JEKG9lYX6ZmwDVH+vbc1YQnp5YUyrMNVEAmFpCFweHlAmj2W
	vuEVwTkYeoTo7hTtJ6IYMHNU8QjpvDvSMVrTBoacZnwrg+cMkoZmnP/d0ljWJQ219eB6sTP9fSS
	EUPb4XJnJgp1XQc0HM+IFiCTZjxasPRKXyufG1FfSxHALu+nHdrJR8qRMV3GoVC3FSg==
X-Gm-Gg: AYBFou0qz0xLYdTnJLpLsF5hQ3bUu4eUtUlpI7DxuxXer7v9uKCOHW7r4XG85GEsZG0
	L/yiHYhdc/k9oOr+N5j2LWDAM/4XX9jG8BXw1DVqdwo89acj/pvjjM3hATFp+IQ16rU36TmkFSw
	RGddRYwnEcFVL2TwgWxm42kWfytlM1ENsOKH053LvDpOUwFMjVtKIZ1NoA3HUe7VwvpNQbPfgNp
	ahyfVOG0cHhyUU3lsWHaLSlEuTTZMnqeUPcMb0GXnyb0SkWWZTkO5ujQ6UHHw9ydcDsqTo55kH5
	+1jvk+817uaZjc4QNcKPYU0Gjf6DlR2A5kmJov1jC3+NWfAhKmLYt1nvUaKNQW0XUHn/iNsYL51
	y8y5rM0zJBd2RI0FpG6hWy4ozQHQ=
X-Received: by 2002:a05:6000:491d:b0:48b:123e:2f60 with SMTP id ffacd0b85a97d-48b127616c4mr3419650f8f.39.1790924943709;
        Fri, 02 Oct 2026 00:09:03 -0700 (PDT)
X-Received: by 2002:a05:6000:491d:b0:48b:123e:2f60 with SMTP id ffacd0b85a97d-48b127616c4mr3419612f8f.39.1790924943286;
        Fri, 02 Oct 2026 00:09:03 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38103856sm3849229f8f.25.2026.10.02.00.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:09:02 -0700 (PDT)
Message-ID: <d75888885e2c94c1bc717faa864f609c43db874f.camel@redhat.com>
Subject: Re: [PATCH v2 01/15] sched: Add task enqueue/dequeue trace points
From: Gabriele Monaco <gmonaco@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
	 <mhiramat@kernel.org>, Ingo Molnar <mingo@redhat.com>, Nam Cao	
 <namcao@linutronix.de>, K Prateek Nayak <kprateek.nayak@amd.com>, Alexei
 Starovoitov <alexei.starovoitov@gmail.com>, Wen Yang <wen.yang@linux.dev>,
 Tobias Schaffner	 <tobias.schaffner@siemens.com>, Viktor Malik
 <vmalik@redhat.com>
Date: Fri, 02 Oct 2026 09:09:01 +0200
In-Reply-To: <20261001154934.GT88198@noisy.programming.kicks-ass.net>
References: <20261001152042.124445-1-gmonaco@redhat.com>
	 <20261001152042.124445-2-gmonaco@redhat.com>
	 <20261001154934.GT88198@noisy.programming.kicks-ass.net>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-10-01 at 17:49 +0200, Peter Zijlstra wrote:
> On Thu, Oct 01, 2026 at 05:20:28PM +0200, Gabriele Monaco wrote:
> > From: Nam Cao <namcao@linutronix.de>
> >=20
> > Add trace points into enqueue_task() and dequeue_task().
> >=20
> > Signed-off-by: Nam Cao <namcao@linutronix.de>
> > Suggested-by: Peter Zijlstra <peterz@infradead.org>
>=20
> Obviously I don't remember anything at all. But also, you 'forgot' to
> send me the rest of the patches which might hold a clue. As is I'm
> clueless as to why we want this, since the Changelog also offers none.

Right..

This commit is part of [1], but borrowed from [2], which is actually more
interesting to understand why I need those tracepoints.

[2] contains 3 other RV deadline monitors, I should have at least CC'd you =
in
[3] and [4].. Essentially the enqueue and dequeue tracepoints are used to:

 * model the event from dl_server idle to ready (a new fair task is availab=
le)
 * understand when a task is moved to and from another scheduler runqueue

Thanks,
Gabriele

[1] - https://lore.kernel.org/lkml/20261001152042.124445-1-gmonaco@redhat.c=
om
[2] - https://lore.kernel.org/lkml/20260929124908.177676-1-gmonaco@redhat.c=
om
[3] - https://lore.kernel.org/lkml/20260929124908.177676-8-gmonaco@redhat.c=
om
[4] - https://lore.kernel.org/lkml/20260929124908.177676-9-gmonaco@redhat.c=
om

