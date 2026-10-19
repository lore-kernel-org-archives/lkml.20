Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F09334EF0D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792407918; cv=pass; b=ueGMbRYNMvEjp5g0fsO8QnaZMdw3UKVdt269OvFKnvib2bkVucbKNcpzRz+dbA12wYPF3VLIPFj+/zLa3oDUy+SEHW1xYJV699SH8ArmC4HMns2jlFZAe7sov8z72wpJt1H0xYqag/0ztDzO4QVyVOTxPQAuEOou/aFFrsGWESw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792407918; c=relaxed/simple;
	bh=jUY85gSFYv44ajD0M92QfBXDWEtyEd1ElmdqhoNdS8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OQcXrn1qnURFct5p7++AXrDEZpDPuS1Ow9wClP+dU+/jHL5URg8EK0vcj64pIRMz3YRHc5zEP3BNT+34I3SlUQ9q2CdaZDKva5tif1PuOyDisiA4HWG65wR78bksR/0IkRFCk7kzFwiGTAGjhxZreU4KQYqK8N38RK7flDhKaAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FNjPQxbO; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=geRI3HiD; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FNjPQxbO";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="geRI3HiD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792407916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jUY85gSFYv44ajD0M92QfBXDWEtyEd1ElmdqhoNdS8c=;
	b=FNjPQxbObIEiNNgDb7Fvpowbq5FC7pHoy/zaOCYee0MZle3Gd5/ZK/9qqz4Rt0EK3icg5v
	QcHKeGNnQd2uF2yXFHOiCTuH+y3SSVq+5aCR/OUW0GrR4YgD1cpwSN42UTJgVIaeO18DaR
	3fifRQ/GPrxiTEI4MlpeBvXWhUFOwbA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-438-UZtPHrZNPSud10s8vu2MKA-1; Mon, 19 Oct 2026 11:05:14 +0000
X-MC-Unique: UZtPHrZNPSud10s8vu2MKA-1
X-Mimecast-MFC-AGG-ID: UZtPHrZNPSud10s8vu2MKA_1792407914
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c2942fa0995so201649766b.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:05:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792407913; cv=none;
        d=google.com; s=arc-20260327;
        b=sPythCqJHrwQU7MCLabNIPCitmt2DxtlpNakv9oAIv2PHOp79yJY1U0f6DNVL6PtLz
         WdWNcYxQIB1SX5OvFqgy75G9er7SuP/W66o1w3gvlHmOIO4bPeRMZf5y95ZEBDvZbDLu
         8ibly+GulLr3U/o4n3p8hx9p57gg1iWUx1VgeWMuZKgqC5nABY9Mkcp/ENVd0vhRPdYZ
         gV/wpUTU9XOm6qiiTldaN3Jk36/Lg7uwPAsbv4upTBHVLryFsIH/bW6xASq6chjPns4b
         PnQvw4pD0u/k0lAmzfO/rQyOupCznjgBqpAXOoRJknNw6gjAztFSrdnFiuVY0hRnIUhO
         jf+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jUY85gSFYv44ajD0M92QfBXDWEtyEd1ElmdqhoNdS8c=;
        fh=ppQqlwkeQpuO/HzxpSGYZyFJQWc6DQYr6fgCMvGWYaQ=;
        b=NUzmu6+a4+RDmXHX3yMX4606LFuDx+9D8NSM6ATIzdvNPccq1ypc2hSwynsiuuZxCN
         Civ7DyQtz5kapJbMMWM6oDP1ywwblXyO7ulHPn+X4ILeEKmbi13zg/i10GymMOAvYf/R
         4rXBFQgyyq+gDbSrQjKHUtun3sVsRILktmK726S7Iiu1ts+L/LjKfEblRIUWx0clSol9
         iySO+Qx16DsIvyHG8u00iWS3QqDuOKwToyvyrHj2PDO1TbQVQ3Tw3dD7ocQza19TuZpN
         6xr7x0exDKj5pIjf3sx9MFrr4Pguw9fgqC6DEsONaDb6tr+MvJCqJXhhfDYtQ3LXi/qw
         Fjnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792407913; x=1793012713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jUY85gSFYv44ajD0M92QfBXDWEtyEd1ElmdqhoNdS8c=;
        b=geRI3HiDu8eTv4KC5DstoODWBQ49w+VMd4t/i3oQgixi/IYesvGY3BPCMw7N2NeLYL
         RILSQvce52d5fvzD560ObcbnvARiW4O4UOvUpTos+ya2NwxcnIOGh061WypWWMDHKFbC
         s02mpac0xvPaIIL6FMFAe2KLYEcvfGKUHIUER1JnxTyxG0iX52pkFku+weTLH3xBBe2m
         tGRaNIjmfMpklxofrvAKXx92VuJRDRx7DkpDgaFiYF20t2Py0cIOQmwZLqfhKEKZQNgs
         CVMYgBew3kpig1MBBDNXAlI9VIgDo5AXgM+wszv5t17nnLFWD60FfpU++ZeJezw8+3Y0
         sJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792407913; x=1793012713;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jUY85gSFYv44ajD0M92QfBXDWEtyEd1ElmdqhoNdS8c=;
        b=UnZbitntd+MOfOZpYG5gNqbI40DNOHjTHK87ozkDxsficn7JnhhgNLFRq6f3sp859Q
         uHYjbZgO8HZcjHSiXJAH2P/aIsLzqrAkO6aaNcZ41rjHqrG9uAaCUeVok64wgvtDtz9j
         1droU5TlvVP8jWg+GpuGbfEFTdHAj/sAJEyJJITD1yZOqY46kKvZBkZViAlgVrEwe3SY
         latOzyXPQZLnP0MPJYnn/kcqyUe4kfQyI4eYo0KdcaBdMghWyITpkJLn415MzDRdwJZp
         Bxdy6f8jw/BKcTtlObRsoFN5HazinIjpskr4iDBah7235pNZOnPnj0TzYz9iJogalgu5
         6qZw==
X-Forwarded-Encrypted: i=1; AKwUvBwe5zsyASRbHFLEy1faDMBqUgrZyfOuMxGHmPd/OJcsg4EbPkwzT1CssA1ReDEjKIv5J9MrSPO5wz6H0cU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIx1y2psiI4JUuaQWtr2DTxbSSqN5vJyTdzBmfZnEKX0Glsriw5
	FZ5IfmaIekihzEz/eEugUdXIp5eVyx3TN87X3S4Ttbh5y4IcZOsAR/cjAnBxC8OVPyltqgvBVIw
	G4gWZSYdChncVzkNraMovakOi8m/Rwj9awbefiPAl/h0b8zy3uXFgpQs03UwlLEgJ78BPH8i5v+
	zb9ftFo9nkoK7BNxES23oasLMw3CKbgNKBbqyPOAtF
X-Gm-Gg: AYBFou08icj/IsJzyoC6yigZsnhBH0wZGjrafndX5DHf3g48Fk0dIRuem61mbMJ04Ks
	fevHSAXYRI8fNOjqvTpv5ndYZj0r9W0DiHNE8mk+EqLVySb8OKq4wc1BT4sImq+uRM1Unq/ZOyQ
	j6dRWGvq08DPW1tmG92RMiM5sEnp6dDXGCM3xzfoe536jTQqBZiiG3HjtQAxzCZ0qAMoay+dLNK
	6NlyQMnMW2oqIg=
X-Received: by 2002:a17:906:9f86:b0:c19:45e3:2f57 with SMTP id a640c23a62f3a-c419d83af46mr514031266b.9.1792407913530;
        Mon, 19 Oct 2026 04:05:13 -0700 (PDT)
X-Received: by 2002:a17:906:9f86:b0:c19:45e3:2f57 with SMTP id
 a640c23a62f3a-c419d83af46mr514028266b.9.1792407913081; Mon, 19 Oct 2026
 04:05:13 -0700 (PDT)
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
 <CAP4=nvR2i092924zszA8Qh0UUYnwXfAsa+7KjPe-NpwC+bbLXw@mail.gmail.com> <8580176d216258e9008c344e0529509117dcc18b.camel@redhat.com>
In-Reply-To: <8580176d216258e9008c344e0529509117dcc18b.camel@redhat.com>
From: Tomas Glozar <tglozar@redhat.com>
Date: Mon, 19 Oct 2026 13:05:01 +0200
X-Gm-Features: AclHuK-0PstQ9qMVKUz4cfYOyqNQzLRuAx_unL8aytY_f_PVK-zyS2FFzXAzARk
Message-ID: <CAP4=nvTc297yQHz8aumZFAQ3+JK=5Z_=416WdosT0S6nHEeNfQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] tools/rv: Add BPF monitors
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: John Ogness <john.ogness@linutronix.de>, 
	Alexei Starovoitov <alexei.starovoitov@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	Steven Rostedt <rostedt@goodmis.org>, Nam Cao <namcao@linutronix.de>, 
	Wen Yang <wen.yang@linux.dev>, Tobias Schaffner <tobias.schaffner@siemens.com>, 
	Viktor Malik <vmalik@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 12:43=E2=80=AFPM Gabriele Monaco <gmonaco@redhat.co=
m> wrote:
>
> > One disadvantage of using bpf_trace_printk() for RV violation
> > reporting is that the event will be caught by every instance that
> > enables bpf_trace_printk() and does not explicitly filter rv out.
>
> Yes, that should somewhat be mitigated by the glob filter, though events =
are
> still generated.
>

Do I understand it correctly that the idea is to modify existing
tracefs instances when enabling an RV monitor to filter our RV-related
bpf_trace_printk events?

> > I can imagine an RV-specific trace event for that, however, it would
> > require a separate kfunc to generate it, and ideally also distinct
> > labeling of a BPF program eligible to call that kfunc. The "rv"
> > userspace tool could then iterate over these labels so the user knows
> > which violation events can be expected to occur on the system.
>
> That'd work too. It's what I initially envisioned but I'm not sure a kfun=
c
> producing a tracepoint is something BPF folks would really like (and tech=
nically
> any other unrelated BPF program could call that, unless there's some acce=
ss
> control mechanism I'm not aware of).
>
> Not sure how much it matters in practice against the glob filter, it prob=
ably
> really depends on the other bpf_printk users (and a mildly better usabili=
ty).
>

bpf_trace_printk is already a BPF helper producing a tracepoint, this
would be equivalent. Of course, that does not mean we want it, but it
is something we already have in at least one instance. I know of at
least one quirk: you can have a BPF program attached to a tracepoint
that will call bpf_trace_printk(), and a tracefs instance tracing both
bpf_trace_printk() and the original tracepoint. That leads to a new
tracepoint triggering while another tracepoint is already in progress.
I don't know how it is currently handled; from what I recall when
testing RTLA's BPF actions, the bpf_trace_printk() event might get
dropped by the tracefs instance, so I had to use a different way to
signal to userspace in BPF actions test.

As I said, to prevent unrelated BPF programs from calling the new
tracepoint, you'd need to recognize and track RV BPF programs as a
special type of program, similarly to what your original RFC did. I'm
not sure if that's what we want, but I see some advantages. In
addition to better filtering of reactor events, you could separate
reactors from the monitors entirely: you could trigger the tracepoint
unconditionally, and attach reactors as tracepoint triggers to the new
tracepoint.

All of that adds complexity, though, and requires separate discussion,
so it's probably not something relevant for the initial
implementation. I just wanted to mention it so that it doesn't get
lost.

Tomas

