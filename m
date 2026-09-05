Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BE632AAA3
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 05:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788585444; cv=none; b=oVDyrislEF5B6SfkT6/Wy4tnqH9OAI86vTc02xDFgTKiIzPDRa9QQ7LD4xNaNUOR3GdnVvIx2ryg2tfGIItCD6u/rtdwa3AhsDacvbMkA53t01jUVKPaSQwszVVEvWG/c17i62T/VNgglGTcw7PkNrl1JnFX39+D9jA+SliKa08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788585444; c=relaxed/simple;
	bh=2N7N3DFQuE+aWAvgayOoeK9Kdsr9ItgNWqqp2QW4O6Q=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=tiSpNnk4T7wvwOcClJqkcDtQm7LwQHNbPYIyDx9kVi+ctOFkPdA0VpY6bPDj/4W537AYE5IFQmUcob7El/hSsi8f3bo8ESLbu/zxcnZTjLPeh5YaHSJmahdYvdJ60Zp7cR6pFUdkeRkUfZqkhzKWqdVkWIEQY2RJ53gIrS/ZN5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dtP+tjFh; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z7PWnl6u; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dtP+tjFh";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z7PWnl6u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788585441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2N7N3DFQuE+aWAvgayOoeK9Kdsr9ItgNWqqp2QW4O6Q=;
	b=dtP+tjFhacUNqcdixG/xn+g0pbsUjPnHor5m1RciC9L44JDmTKSP5F3u/YX0aJ3zTxaGAP
	MDg9NVT4u2nsmwEbISQpM9plji+TfMKHdqxf4LnnVKpoRRXX6ujKLHgih73crAkoNZ9Z9T
	bnDJyV3zMcLLbR51staB5+sZhX2xDII=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-400-JCOfgSn6MQiluRS9nNhuhw-1; Sat, 05 Sep 2026 01:17:16 -0400
X-MC-Unique: JCOfgSn6MQiluRS9nNhuhw-1
X-Mimecast-MFC-AGG-ID: JCOfgSn6MQiluRS9nNhuhw_1788585436
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-482e538ad9fso1480115f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 22:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788585436; x=1789190236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2N7N3DFQuE+aWAvgayOoeK9Kdsr9ItgNWqqp2QW4O6Q=;
        b=Z7PWnl6uG+Mhmavj8Cecyxvq5djpYQi12HDI60SRMxs8wiRwRpCNNTYjh5ll4mL3cj
         6xzatbi1rO+nb8pmrn29gdRtILL9a7aT7nMtDhyeOKbwwwD84TeC0UbTh1SKSQS4zjaE
         ALmrHOKct1IoeqMnjRAy4v3U46l56i2JmSs1bTWteBR+gIs5V8+H6B5NmP8j3OXmoiCx
         pKVVpYhFjTOydXVE1ztneXsduWmFO9HRpy16GfUMt4ju1+/ApxOOShnTb9f0IeU1Y5kL
         kk3Z072+OZXHge9oAU0FqyVgj868kjsGJIPWGoosAT61h39sR0WHUwINi0aNO0pbZfgI
         5rEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788585436; x=1789190236;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2N7N3DFQuE+aWAvgayOoeK9Kdsr9ItgNWqqp2QW4O6Q=;
        b=Hiy99PZfwR9Kh5rsWF3T8x8hHG9UA+jps4PQpfk7rgf3fUIv13hrgSbvr5p17Qsk17
         rg+vZRcgqOUmW2frOWK5YQGM6dBl9xxSFQP60EBhnyrU8TbvY8pu177XLeM45lPkvUfe
         APiow9kk5XUfxZ5EYJlz4ii4g2X/wleV1vBdsZSCx+N9KSsA3/MxQo5nAzXJ9v5co4GB
         Iyj5FuBUjHTh4xN+nEryeZTipAQFI3nzal0xYUbOm6U3pdVRleH+ADC/e51rF64J3gf0
         mAaDfIz90fITAhP34QUsWWSqAJvqCR1OFE8TifLjRuSmDrnFQLGAnpCKUhzK3M7Rsi9P
         MpUQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4/Ztbg/x/fcFMDmc0XMSHSdlTWDtgXuOzV8f0BINq0ely4y2wMFiTNkH8TSvXF2FfjBv8mEAW50JcgY0=@vger.kernel.org
X-Gm-Message-State: AFuF++kDgrj/5rW18ZjfcD6WnLW+zw6sWdKHneSRgALIUf+1d4S+Nudm
	haBrAJjkHMflmi1Y6P9cvtxx7c4pBLab/xnb6jpoE1l+7Und+eainqsRMML9KlCDBoGUFLm0hj5
	CQnIIvxVt2+92ZKYtPi6oQXG5M1VHyKbnbAXAibhSfD7UESRe8tvKLaKNJKXz9tKRlA==
X-Gm-Gg: AYBFou2g4DnKOM/OJ7qq1bQgsmObLyOxzLjNtItYQYACmDh8R/HoxtDbTqZWdqCz65z
	eKh+fraZjDBJQrD0MdxcOn0Luc0PezCN3al9FPqX/SNIqxcMazLZo7fS2htFwTPqsDurMSNApT5
	eOSp9RPOix+4qOa0FmumRjhXSunDPy2TdlSLnj9Gt5zZA5y/dZQ+Epx438FHYVtIug5rxMMu19z
	mle0OCc1dM1poCHIPusoSU4ZP14qZtUBmPETW0jpJCsQtF+be9SMaEZ4hIXBjz3xG+gJNGAMTmW
	mj2ZjAu4TreT+1dtemceDry5lFMTHV6UhwFS871GcTxeBirj3OMx55kOlCWrEOuYQVE9w39wgh9
	fnLL920J+ww==
X-Received: by 2002:a05:600c:4585:b0:49c:fc6c:be16 with SMTP id 5b1f17b1804b1-49cfea09f08mr58738615e9.28.1788585435729;
        Fri, 04 Sep 2026 22:17:15 -0700 (PDT)
X-Received: by 2002:a05:600c:4585:b0:49c:fc6c:be16 with SMTP id 5b1f17b1804b1-49cfea09f08mr58738395e9.28.1788585435425;
        Fri, 04 Sep 2026 22:17:15 -0700 (PDT)
Received: from ehlo.thunderbird.net ([195.174.135.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm200070045e9.15.2026.09.04.22.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 22:17:15 -0700 (PDT)
Date: Sat, 05 Sep 2026 04:53:35 +0000
From: Gabriele Monaco <gmonaco@redhat.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>
CC: Nam Cao <namcao@linutronix.de>, LKML <linux-kernel@vger.kernel.org>,
 linux-trace-kernel <linux-trace-kernel@vger.kernel.org>,
 bpf <bpf@vger.kernel.org>, Wen Yang <wen.yang@linux.dev>,
 Tobias Schaffner <tobias.schaffner@siemens.com>,
 Viktor Malik <vmalik@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [RFC PATCH 00/20] rv: Add support for BPF monitors
In-Reply-To: <CAADnVQ+x4iRNXOg69nUmuJ53pB3-JtroePcyoReATy9+V1aRPg@mail.gmail.com>
References: <20260831090524.106845-1-gmonaco@redhat.com> <87se3sakgi.fsf@yellow.woof> <df6e9168cb06c35e21db7f9d17cfbca6bd87005b.camel@redhat.com> <DL5B40CU17WD.3KD75URQZ6RRR@gmail.com> <eb3dd8158942d663ec8ad4c529eacd666c5f96d9.camel@redhat.com> <20260903090211.50d15220@gandalf.local.home> <CAADnVQK8e1Qp9rf1zThZxb3vr4Gc_bpo0nqpEO2LdnEwHdKokA@mail.gmail.com> <20260904074317.01b2c0e1@robin> <DL6O0KLPXLTA.2HJJUXQUVCP5@gmail.com> <20260904123108.1fa1d815@gandalf.local.home> <20260904132421.111c0279@gandalf.local.home> <DL6XBKITK7ZT.3RXK9YGGUYZZE@gmail.com> <20260904194620.0c7a8363@gandalf.local.home> <CAADnVQJH1SYR_GN6gewF3w_z_Sex9HFE1T1oXkQe6+v18bDTWA@mail.gmail.com> <20260904201741.2986efca@gandalf.local.home> <CAADnVQ+x4iRNXOg69nUmuJ53pB3-JtroePcyoReATy9+V1aRPg@mail.gmail.com>
Message-ID: <228FE969-EBFF-4B60-B0E7-C1E4FD82FB8B@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Il 5 settembre 2026 00:22:01 UTC, Alexei Starovoitov <alexei=2Estarovoitov=
@gmail=2Ecom> ha scritto:
>On Fri, Sep 4, 2026 at 5:16=E2=80=AFPM Steven Rostedt <rostedt@goodmis=2E=
org> wrote:
>>
>> On Fri, 4 Sep 2026 16:48:55 -0700
>> Alexei Starovoitov <alexei=2Estarovoitov@gmail=2Ecom> wrote:
>>
>> > On Fri, Sep 4, 2026 at 4:45=E2=80=AFPM Steven Rostedt <rostedt@goodmi=
s=2Eorg> wrote:
>> > >
>> > > On Fri, 04 Sep 2026 16:34:00 -0700
>> > > "Alexei Starovoitov" <alexei=2Estarovoitov@gmail=2Ecom> wrote:
>> > >
>> > > > bpf in 2022 was surely less capable then it is today=2E
>> > > > It took us 2 years of bpf core development to statisfy sched-ext =
demands
>> > > > and we're still adding new features for sched-ext needs=2E
>> > > > If you're trully willing to remove 90% of kernel/trace/rv/ and re=
factor
>> > > > it into tiny shim where all of the core pieces are bpf driven we =
can
>> > > > certainly work together (like we did with sched-ext) and add what=
ever
>> > > > is missing on bpf side=2E Then all existing monitors will become =
bpf programs=2E
>> > > > But adding bpf as another 'monitor', sorry but hard NO=2E
>> > > > If hardcoded monitors was a mistake then admit it and fix it by d=
eleting it,
>> > > > if it's not a mistake then keep adding hardcoded monitors=2E

Alexei, what I read from your opinion is: if you really want to do this RV=
 thing, then you should just implement it all in BPF=2E

Please correct me if I'm wrong, but I don't see how this series isn't a st=
ep towards it=2E I am obviously open to all sorts of criticism on /how/ I'm=
 doing it=2E
We are adding the possibility to write (existing or new) monitors in BPF, =
not adding another fat "bpf monitor"=2E

And if you believe my attempt to have in-kernel and BPF monitors coexist i=
s a waste of time, I get that too and I'm open to discuss=2E

As you mentioned, when the project started, BPF was just not ready=2E My i=
ntention with this series is to reassess this today=2E

RV was initially built with the functional safety use-case in mind=2E For =
various technical reasons this didn't take off, but that scenario drove tow=
ards implementing RV reactors like the panic() one=2E Something BPF just sh=
ouldn't do, as I get it=2E

The interoperability with other tools (via RV-generated tracepoints) was a=
lso a driving factor, together with Daniel probably being more proficient w=
ith those back then=2E

That's just from the top of my head: there are historical and technical re=
asons for why RV looks like it is today, whether those are valid or just "m=
istakes" is simply not for us to say=2E

I'd rather discuss on what is the best approach /today/=2E And that's prec=
isely why I submitted the talk for LPC=2E

Gabriele

