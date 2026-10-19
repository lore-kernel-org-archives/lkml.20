Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076644E433F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415135; cv=none; b=oNAyir+CSBvQ9EfsJZoYOuSxH62w3bvvgdLikV2VT4zXxyeCo+3o1JpRWxnAGiGuhCXXKBfaAOnivnvU3Dx5RvcEr/DzUw1d5GwsxqJWgvP3BSNzeV6TJYWxHWhJMZO3AfJR864nP6wCnIcXSJi8Fk6UtOld+kIKZeAQm4/Dc/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415135; c=relaxed/simple;
	bh=PA8IT0mW8qyJLl9udMwhuGJy547uTDcbwByYbnkz5eY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AP5o2xm7qnwDl+y/4j8668VcSQkvY9SpKJZAMr7e+raQhRrhqV/0qAdjfHCk1yJCr27yiilDPkmFLSL6OF11CfC7NzApi2afh/BLw/yYKV8e9HMxOZ1uKN5WN6wI4NAjSGPds379rkRUOit7s2sgcaQHUgSAwygWJNaEtNnvVAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JMpfyA8K; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JMpfyA8K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792415129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vUPbdohuI5rYwK6fOugHmkfgJHBc1I0kpq40ADeEBNQ=;
	b=JMpfyA8KhiNKd4ujEIyXJMFkEGla0el34XzCnZuJXI9ZmCrYB0Q8RePm/bJId7Nme8wm2n
	Kg15iHahIz3zXgAORUy7vMX6hsel3q9PwNTQrQdqb5AlpifjnQAZ4Tx1DEIdepQ+vUxDr7
	3sfr3jOr4r0LXTnOgsB8F+XeWGuEehI=
X-MC-Rep: binary re single
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-8LESOgCuP5SUiaunErNseQ-1; Mon, 19 Oct 2026 13:05:28 +0000
X-MC-Unique: 8LESOgCuP5SUiaunErNseQ-1
X-Mimecast-MFC-AGG-ID: 8LESOgCuP5SUiaunErNseQ_1792415127
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c4048584447so182481566b.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:05:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792415127; x=1793019927;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vUPbdohuI5rYwK6fOugHmkfgJHBc1I0kpq40ADeEBNQ=;
        b=GenYXkbwxKixkv+r97NiqhXY/3+3JtY28y5lR+TAfLjRt6oKThvAjiu8FTESZ+O/wC
         tGkN3ZJOKOLsPV7r8t/knC67zY9r91MbKCBpm03a6YsHfA4st5RFKxlPNHXXCrs2Mq5x
         +xpVUcfGaR2H3k2HipB+gWaK6d7cEW+Zcdp/ObhHKCm7sCylUeQ+SLFDuVAhXTsjQk61
         tVUB5aLw3GkIsd0OhLe2wCQYYSP1FtvdcjZMosdmRlFaWMg3MvEa2ekxWyPTJ/zuDwv3
         1sgpoOQ1Axb5ns+GbDQStSFXFiGLpQLvzrvo1PPcCKcpCCxMWp3g+Oobb0mHAa9Mkey9
         fEVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJ2KdQUDOehn2sGgPMxebUrAkD4fRvMtYSCQpFHmEPb6tZYxHJu33vjO5+JreZ8495l1ae8BXjf5GllBQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6K1TSg74Ap+HMPtedJGGekwdC569jUUgzr98XyR/vhLOIDzrk
	0siybun8K+tcoCudDGvomkQHje3bU0KUopoPev+H5if3LC21MFCTX8hj7jYJOEZwEJfzZGtx45u
	Dl84haKwLhQ+zo9Sw12QFlDU3mlevZTHuZSDH+JVNGQwLJRVIvjCLhXkqDTDOsAFkQ7H+EN4omn
	hQXtcVrfTjTHrC00rcv0i1KN8oFGo1TJG9ENKgui0z
X-Gm-Gg: AYBFou3QfAeIvWZdnSQ7+RNEY6lmTuYwWv2dATTGm24KRBxvmRQQoPrL5cZLx6WMjD5
	oDGxQzhHdIyIZ/KI0Xc23nZv3QARBb5utgIJCJF0Yi1fSC1UxVm+/WE6+7prTaAV8UkyES75Wf/
	4nuxtKb7ergS1/ztAlVOwMqXSwTcp0sjKxnmcNrUaVM5yTH6lmwz8JoP6xrfL8tzc+htpg+bG4P
	wnhrHnCnkBiRdY=
X-Received: by 2002:a17:907:c008:b0:c40:f89f:d91d with SMTP id a640c23a62f3a-c419fafad52mr566085866b.28.1792415126871;
        Mon, 19 Oct 2026 06:05:26 -0700 (PDT)
X-Received: by 2002:a17:907:c008:b0:c40:f89f:d91d with SMTP id
 a640c23a62f3a-c419fafad52mr566081966b.28.1792415126452; Mon, 19 Oct 2026
 06:05:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001152042.124445-1-gmonaco@redhat.com> <20261001152042.124445-11-gmonaco@redhat.com>
 <DLXSI4BSRE5F.1TLKCBUAGNDFQ@gmail.com> <b1fb01e1c58893795dd4be346f233d39fe653aaa.camel@redhat.com>
 <DM6H7SK4YZ7A.F0MM6C0I77OR@gmail.com> <878q3xtptq.fsf@jogness.linutronix.de>
 <8B3FF026-6159-48CF-8FEA-AF2FACD2E4EB@redhat.com> <87bj8s8ih9.fsf@jogness.linutronix.de>
 <DM78SVMBI2XW.2XHVC67VON48A@gmail.com> <87v770uuyr.fsf@jogness.linutronix.de>
 <DM7I2PYHNKXE.3AYY3N1HATXLW@gmail.com> <87ik2zryzo.fsf@jogness.linutronix.de>
 <0055967d4571e7c8549dfa476fa6b15b93013701.camel@redhat.com>
 <CAP4=nvR2i092924zszA8Qh0UUYnwXfAsa+7KjPe-NpwC+bbLXw@mail.gmail.com>
 <8580176d216258e9008c344e0529509117dcc18b.camel@redhat.com>
 <CAP4=nvTc297yQHz8aumZFAQ3+JK=5Z_=416WdosT0S6nHEeNfQ@mail.gmail.com> <d2622f5c375ab26514d059b5949dee28f3f9998d.camel@redhat.com>
In-Reply-To: <d2622f5c375ab26514d059b5949dee28f3f9998d.camel@redhat.com>
From: Tomas Glozar <tglozar@redhat.com>
Date: Mon, 19 Oct 2026 15:05:10 +0200
X-Gm-Features: AclHuK-qu9FGzZ1wQlrHPYBUAdZYSh4UcmqBXa3GV9mICyDiafDBWh4-NKWR3no
Message-ID: <CAP4=nvRhd1d+o8O045LB=dcYa2UudH7ZbG388wcwEX+JNBWY=Q@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] tools/rv: Add BPF monitors
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: John Ogness <john.ogness@linutronix.de>, 
	Alexei Starovoitov <alexei.starovoitov@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	Steven Rostedt <rostedt@goodmis.org>, Nam Cao <namcao@linutronix.de>, 
	Wen Yang <wen.yang@linux.dev>, Tobias Schaffner <tobias.schaffner@siemens.com>, 
	Viktor Malik <vmalik@redhat.com>
X-Mimecast-MFC-PROC-ID: JM4COOIdN8xOxqWrxFuSfGjujck1eXOY22VKP9Sr990_1792415127
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 2:48=E2=80=AFPM Gabriele Monaco <gmonaco@redhat.com=
> wrote:
> >
> > Do I understand it correctly that the idea is to modify existing
> > tracefs instances when enabling an RV monitor to filter our RV-related
> > bpf_trace_printk events?
>
> Not quite. The initial issue is that the current iteration of RV BPF moni=
tor
> don't cooperate well with trace-cmd/perf. Alexei suggested we use bpf_pri=
ntk and
> filter out the desired events with plain ftrace glob filters (from trace-
> cmd/perf).
>
> I believe this would be usually equivalent to having a dedicated tracepoi=
nt for
> RV BPF monitors.
>
> E.g. you'd do (roughly):
>
>   trace-cmd -e bpf_prink --filter 'bpf_string ~ "rv: sleep: * violation"
>
> instead of (with a new kfunc)
>
>   trace-cmd -e rv:error_bpf --filter 'monitor =3D "sleep"'
>

I was talking about preventing other (non-RV) consumers of
bpf_trace_printk from seeing the RV prints. Eg. if I create a tracefs
instance and enable bpf_trace_printk, intending to see my own debug
prints, I will also see debug prints for RV, unless I explicitly
filter them out. I get that on the RV side, these are mostly
equivalent.

Tomas

