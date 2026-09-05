Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F52285058
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 00:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788567734; cv=pass; b=NOzogv/VGT4lD/FHuARNXAONmmuaRCfe2TTd6aUaTfjeGW00ex8lr7MG2/hZj+u/II+RoIkZfx4hn10muaOjc+54bHIRgZseld/uEb+C69rkBgGcjJsxHgiGr03qcBFD3n8T6bHTXY97rSnoezEaBdoXzh86goJLjo+hF5N0stQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788567734; c=relaxed/simple;
	bh=5onHwot6PankN+uVkGS5JVOApEBlu2xFYDhZufrfQes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qv3WzzjIV/SmqMje5NtHT70NxTrt2Krge9ciIrExTXBYa5JqGJ0Ee+HiLV3mPeYRmsz7bU7eMGWfzT0VRnann/k/8um72M1i+YoPONuVfoIZD3MUOnheJM2mguc586jb5AedgfTjc3QgM2c+ZEMzCAEnG9KLptBWxcXssolNf9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9KOmB57; arc=pass smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9KOmB57"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-862815e2683so712236b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 17:22:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788567733; cv=none;
        d=google.com; s=arc-20260327;
        b=i63JFqFJP37nSwCBUSau0PBUyRZU/OMiuYDeBbxrOn29HbjwAAqNZAYnYI/D4qseIS
         HkoCQHufnFgm9ZZGT0pPC91emAXF4HswVRihEh2EiPFyAKn8R4wGGD4vzs6Di/wX/FMH
         yQ0PH1sGX+fhorkbHEuw0D53USmvAn209v5AW4cSAMQD3f6H6684qtm0tK9aLOQveGq4
         hzsGSOdvsMQBufAm0tLiFzd5cbQDgxOrMX7cQnhDpZofyteJQDk9504y8y7IU/gsp8cj
         sT9WfPz99FBtW4MNW515avuCDZpqNflDOfwqThsRwyhuT5ey4ms6GyCG+0eJtfSrWxRn
         vqIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5onHwot6PankN+uVkGS5JVOApEBlu2xFYDhZufrfQes=;
        fh=oGiM4mT1j1OMaz/CsjarUFaLCYmgyD+weeMF5VpySM4=;
        b=fuaojlzEFPF3qcgo8trOll9S5J1595zx1i3mQXj5IPMrnaKbRLd6wIy6Uh1hsXUbW3
         ziY+920w+o2moKls2UnjpDNOT9xiSekWvlpFHG9dvQNW/xGSz7OCIvmp43+a4FAtBrED
         0PjvXwSj3f/8EwEpH0TENeO7FivQs7LnsYfcc3fWe4vqHqVG2MGkUM8uG6iF4tz317K5
         4br7v/szjZdAn1z7wFSirsiSju3wDWYuZcw9nauae1MmMI0mJp4SYQPEykfdJoDRwEcF
         P/d8HkOJcRAbdreF6ltWm77PTMkZ44Z4ME3ToD2iV15ksNNFBf33OVZtqBHbr3/23HWR
         SAOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788567733; x=1789172533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5onHwot6PankN+uVkGS5JVOApEBlu2xFYDhZufrfQes=;
        b=d9KOmB57cXDp23+e/Mms8T5ixxs3rsAGpJzBPhHAL51p9cBPw1nc2Uk+hI6ktVgL9R
         poL6fi0p5cXySrdDklp8CMD56OFk6baOPZJrvMAI2Mk70C/iIrK40MQOvffGOzJ9ZXFS
         VzoK/tmWcrsBXr2ThUHm2jnY0r8JNqFRZcmp8NCk1+xTF65DGCDKNKtjsWyH8o4ZjrZe
         /SDqa7p3r55rnX1Ve9QOym1ZOjb1+MmzSQwxXjw6O2midzOJ+sCLWiSZUXBNyMGw1mEf
         TZy1ch63F6WkbM0yyq/6/7LTniyvLirSHFJ9osUClYkjNCwLjS7p/zo9SM/PLHa/wJ27
         GcHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788567733; x=1789172533;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5onHwot6PankN+uVkGS5JVOApEBlu2xFYDhZufrfQes=;
        b=Icn953JfAzzDC7vTtFWv4b2FiqJRev/POv51MGFV3f1mooiEHTnNGEFQ3x4t+LPr1c
         Cf+Og/wyXR2wlsvx1jwL6U+HkCUvLnD13qJjXgvlnIrM7WIqUdYhB6WWV5k3GFDpdVmQ
         idZPuqk0yIgtIzNUioDmI3K5BtMgxmkqnB0e/IuHo/oahgvOI5IHXMCOdGsAPB4ouFHb
         XFlrr6Fledl8pxCGALYbYyvezHOUASRXNBkjNdHDxg+qIaTxg0x7Qgu6ogvtUshUIcsZ
         KVakUwI5q2PD64p7U5rMbu5RnEBzMzyNC6n43PMf2S7UaX2cJ3JGkPzvEK5znnulRtJy
         O1MQ==
X-Forwarded-Encrypted: i=1; AKwUvBwly5GOYTZKMxBWirV6cYx2LFMr0VV3OTuezG9lotB+VfKyZ0L5rvB+hUOBpQV0Bdb+m39SpKVe4W0PcJk=@vger.kernel.org
X-Gm-Message-State: AFuF++n4cDytFIiNdddBEN2t5pMdrDTYwBEYH38IdfG6zd2UmhDf9pfW
	NxrSQp4anLq3fcNJm+9zTwfqAjS7FdZC7xEVaCIafe9QXqJ/j9+u9ZgD0IiC4DtKRGiFt/a09Y4
	DXZKVBibbwyP9QE+ty3Z8sStiIxnNLzs=
X-Gm-Gg: AYBFou0L14LAd4L5+fMB9FCU6jAt51MFZ7IubzWNZdOw3VJkMiPopaLuEzpx4wRktbt
	AvFgBVi4uMtmtfVz7fbPYKzHmmM8x06ltGQujpyOWfQTSRyxLM9xg0EeuC3njlxaAEQx1ubJD6H
	T4dm54qKGp38qEXhqmTVvwaoE8WcTi3tMFWAAahLA/qC2Fyxk9KqtsWFlLfxKCRA5T0g4VG7tvJ
	ZeX4ON1hFDeOu56ShsP1jxBR2J4UK/O40yTbLD6q6K5/VLQeX07hYSz46nWNyUzNd7hvO6pSVGA
	lPANHCAayCZAuV35jbSKwEWO0oIsK06St/tquiilKY64PHPyWd7uHMKUEkoVNkDdHIiXbFfTuqu
	TnvUcHKtTQh/2RfLBgwXPVFB9v+uD
X-Received: by 2002:a05:6a00:2183:b0:857:7384:b5f9 with SMTP id
 d2e1a72fcca58-86169974910mr12096926b3a.21.1788567732659; Fri, 04 Sep 2026
 17:22:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831090524.106845-1-gmonaco@redhat.com> <87se3sakgi.fsf@yellow.woof>
 <df6e9168cb06c35e21db7f9d17cfbca6bd87005b.camel@redhat.com>
 <DL5B40CU17WD.3KD75URQZ6RRR@gmail.com> <eb3dd8158942d663ec8ad4c529eacd666c5f96d9.camel@redhat.com>
 <20260903090211.50d15220@gandalf.local.home> <CAADnVQK8e1Qp9rf1zThZxb3vr4Gc_bpo0nqpEO2LdnEwHdKokA@mail.gmail.com>
 <20260904074317.01b2c0e1@robin> <DL6O0KLPXLTA.2HJJUXQUVCP5@gmail.com>
 <20260904123108.1fa1d815@gandalf.local.home> <20260904132421.111c0279@gandalf.local.home>
 <DL6XBKITK7ZT.3RXK9YGGUYZZE@gmail.com> <20260904194620.0c7a8363@gandalf.local.home>
 <CAADnVQJH1SYR_GN6gewF3w_z_Sex9HFE1T1oXkQe6+v18bDTWA@mail.gmail.com> <20260904201741.2986efca@gandalf.local.home>
In-Reply-To: <20260904201741.2986efca@gandalf.local.home>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 4 Sep 2026 17:22:01 -0700
X-Gm-Features: AcwNN1X-0VTNjdRrTUxdMQ1ugj5hag_YepmKhEpgX0sankiyuCcGLwirKWItB5Q
Message-ID: <CAADnVQ+x4iRNXOg69nUmuJ53pB3-JtroePcyoReATy9+V1aRPg@mail.gmail.com>
Subject: Re: [RFC PATCH 00/20] rv: Add support for BPF monitors
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Gabriele Monaco <gmonaco@redhat.com>, Nam Cao <namcao@linutronix.de>, 
	LKML <linux-kernel@vger.kernel.org>, 
	linux-trace-kernel <linux-trace-kernel@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	Wen Yang <wen.yang@linux.dev>, Tobias Schaffner <tobias.schaffner@siemens.com>, 
	Viktor Malik <vmalik@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 5:16=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org>=
 wrote:
>
> On Fri, 4 Sep 2026 16:48:55 -0700
> Alexei Starovoitov <alexei.starovoitov@gmail.com> wrote:
>
> > On Fri, Sep 4, 2026 at 4:45=E2=80=AFPM Steven Rostedt <rostedt@goodmis.=
org> wrote:
> > >
> > > On Fri, 04 Sep 2026 16:34:00 -0700
> > > "Alexei Starovoitov" <alexei.starovoitov@gmail.com> wrote:
> > >
> > > > bpf in 2022 was surely less capable then it is today.
> > > > It took us 2 years of bpf core development to statisfy sched-ext de=
mands
> > > > and we're still adding new features for sched-ext needs.
> > > > If you're trully willing to remove 90% of kernel/trace/rv/ and refa=
ctor
> > > > it into tiny shim where all of the core pieces are bpf driven we ca=
n
> > > > certainly work together (like we did with sched-ext) and add whatev=
er
> > > > is missing on bpf side. Then all existing monitors will become bpf =
programs.
> > > > But adding bpf as another 'monitor', sorry but hard NO.
> > > > If hardcoded monitors was a mistake then admit it and fix it by del=
eting it,
> > > > if it's not a mistake then keep adding hardcoded monitors.
> > >
> > > Regardless of whether or not BPF can replace "hardcoded monitors" tod=
ay, it
> > > wasn't a mistake back then if BPF wasn't able to do it when they were=
 first
> > > being added. sched_ext wanted to use BPF for scheduling as module plu=
gins
> > > were nack'd by the scheduler maintainers for a long time. BPF program=
s to
> > > handle scheduling was the work-around to that, and basically the only=
 way
> > > forward. And it still required special hooks into the scheduler.
> > >
> > > The rv monitors only needed to use tracepoints for hooks. A module wa=
s the
> > > easiest way to get there, as BPF at the time wasn't an option.
> > >
> > > If you want to use hostile language like "admit you made a mistake" t=
hen it
> > > makes it harder to collaborate.
> >
> > If you're offended by the word "mistake" then ok. There is no path forw=
ard.
> > Keep adding hardcoded stuff.
>
> I'm not offended by the words, I'm offended by your tone. As BPF was
> insufficient when RV started, it obviously wasn't a mistake that we didn'=
t
> use it. If you are just going to say it was a mistake because we didn't
> modify BPF to suite our needs (which I highly doubt you would have wanted
> to help us, as you already stated that you don't care about this project)=
,
> then you are obviously biased against us.
>
> Your response was fine until you through in that last sentence. As making=
 a
> mistake means that the other non-mistake option was viable at the item. I=
t
> wasn't.
>
> Look, if BPF has changed so much that it could be re-evaluated to see if =
it
> suits the needs of RV, then sure. We could look into doing that. Perhaps =
it
> can replace the hard-coded monitors. But what we have been doing has not
> been a mistake. Saying so is a bit disrespectful to the project and a
> direct insult to Daniel.

I respectfully disagree. Let's stop here.
