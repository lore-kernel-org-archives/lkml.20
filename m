Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C57A3B3BF2
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521019; cv=pass; b=SH0KOksikrVYN0+0Kob0qEj/8+QLg7aJtRkOYpZu/RHjO8g6sxQFEQzCZHbg4x79HpTyGqb/f/FokCMd1OQaQzVpCzp53jTWLzAuTD53ZNr5HvzUOwIW78fXjP9t5gY3WR8RXc6u7YJA6OfuXlYxfQabG72folbEnJ547H2eYsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521019; c=relaxed/simple;
	bh=2lecvDZ/BSD8c+InIe90+zaCIL0CBuMX3DDlyXPCoFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W0ZV1+jUnyNRKmMhyIOEJYk1bER4K3T7+cViKbT83tSDIGAaNWh4rIDm3O7dWvQtwAVBxuxh5Dgtuc0s+RSfK0iEVwPxsDT6RMBz9hPZLB8jmAZb/H437vqZJtztswHiAwOAQyNe0ts18N4mtVQ9YxEf20cPbKrWhAhkpqdwsKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d8ccX7Ff; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=XedHL495; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d8ccX7Ff";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="XedHL495"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788521016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2lecvDZ/BSD8c+InIe90+zaCIL0CBuMX3DDlyXPCoFw=;
	b=d8ccX7FfZ4v5ZfSR7Us27ydzBJx1AEKMHDVWngpWtBgbNQ35anoi25t/r4OJeMUfBzzlcy
	YZCApsIIDdaqaMIbfWRUOu3KBqFeHMU/PUY3xfJTBD471dGWpp9uJu+bYavxqmUM0owtsF
	vecxdOoGtARWJAnOn4iXOw8dLlRZoAc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-iu9QrAgfMjmDQPa0wAgd8g-1; Fri, 04 Sep 2026 07:23:35 -0400
X-MC-Unique: iu9QrAgfMjmDQPa0wAgd8g-1
X-Mimecast-MFC-AGG-ID: iu9QrAgfMjmDQPa0wAgd8g_1788521014
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c21946c03e5so210932366b.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:23:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788521014; cv=none;
        d=google.com; s=arc-20260327;
        b=pLOs3wyz6hSaJwYM4SZdY4d5ENs3SiGTZEig1vdDvkES8auZLDNKxgeefVOtGAl//S
         ngwfbuNXoNfY3NA8fezmXcopoBNbloB0X0AvgaFI1ygt/M5+xZzWHDSew4D4q7mbxPFT
         YSwEDy4aFTog77wD4qkSnlz9cPwOeafwKIqAU1eT0z83Ne6t6K0n8482cLovfwiUukLJ
         2Rzb11bxTHxcqb/DL8Tlk6KtGM1loBNtVfv+ptYm2x8mu0f7Yx5binYKq+XWPnvuqPcU
         qAFhfqLJVTQpjy9LHmpkkpkZZzcI9LwldN3FdC/y+BTwhy44rtMeHQqL62+YiRBCRutO
         0wtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2lecvDZ/BSD8c+InIe90+zaCIL0CBuMX3DDlyXPCoFw=;
        fh=kLlAJLmGBaUKxE55+TG9rAzsaKp2LoQ4JR9yUw6ghFc=;
        b=pe0bEpqbPCJVmMPc2ZlIz/RMuRFEjrfSnfq3UYFX6oa0vAsKk9lbgE3OQn//FzX4XM
         GkyvAAzhfU2c0En1R1WCTLBOUYWynA3jPA2FLeKQJZmXN3wzxEN+ZqHo9AvSFIs9d9+w
         tmiRmNn5PSLeXHmCa71IOvOGzhbxktOLAbmzpIqRgVXSDJZ7g4CIF86qzktbICZ0yQY8
         oTMrE3CyluemRSA4jhLs8DLvl5dJZarfez4JOiAurulLYeNCDQz4T9o1877hV+Cjudxd
         H9tzVDh6WQUdgrNH2RVH97Wu68lFe7KbWmGJUEHnPZthnWCqaEJvoBaEv59Vu1yZi3sB
         o84Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788521014; x=1789125814; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2lecvDZ/BSD8c+InIe90+zaCIL0CBuMX3DDlyXPCoFw=;
        b=XedHL495aN1euvtg/tQbZR1o0yTOVFgVa0MHTkz68PbUZMmtVmb8RAlebWhsj12cUp
         KJcA+sxNGORfZwlicbqQ1aMnr1Knv4bgcHTl6wO7g09Gest1ZVq8XopTR8PDvCGNAmRC
         81g+2WnkgkzewYG3EmCiZsQyqNSKEdoWDUiiOqt0vctHcDXzZNTBbHu+iiQPUu7q8t8P
         07Cln05gns421lQm+To/SH4XCqRA1PJWvtFrCZ9SYxRMHUO4KIElsE+LPejKABnfG9R5
         08CHjg0qzSox1Z8g4wJwl9llwvnAJskWBGtPN8E3jUJ/a0x7pQXiMrB2EbrOkIyJpJOS
         3jmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521014; x=1789125814;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2lecvDZ/BSD8c+InIe90+zaCIL0CBuMX3DDlyXPCoFw=;
        b=PdWp2wRQI0eImWSi2L/sPOyjbElHUEACLUBdlILarJQwjjnVsdTC38k36ZD2TagnCm
         0QYCVULctX+ExYwK//hu2DwwhRu6+lPC/ZyVDy9LVSXYxP1tKKLYy5Xjd7u8r7SEAXpF
         R/+Vl1qgARRVFdrQ4UBIKDIGwJPs3G3C76WDYVibwMwhXQM1E5ewysQZiOeo1nEHcetd
         i3+dwjkgmXenw5eUKVskDxmpSbIr+28+2Dcsp/0s+dutbI9eGUWsTVGzyWid8JALebcr
         MnzeO5o1l4p5jbw85D/InnRx58ccdWiO9luS24vzuY0gBSu4AUNGGTszR2/JE3loAwxz
         apRw==
X-Forwarded-Encrypted: i=1; AKwUvBz9LOs4vENAAwFHx1XwdoFEVpjEEqlauVw38CsQ6Y0DMjtAddKknadL5FhJ2+eUflN/L0ot5tdFDT26Grc=@vger.kernel.org
X-Gm-Message-State: AFuF++kJ4Er1EhH10A12TdJjW9MDMhKp65bGsPW4FIvWeXLzhJ9v1pu8
	rv95UWHKwi+OKQgDRo9L99pO0mknrlKM1ojiM96hUjqi2IhgJJ9wSjo5SdZPBauhDRUg6EmWXKX
	Iq01Sz7PpOJpikE5BXAJMbLr4ldROnhsJIusdEhWGzMpC2qvUXHg0BYNJGsXGimmbFW40rG06ZS
	RxbsYbdTnrgWkIocnwrmWdYuf5yCjYzxIl3RTQe5pF
X-Gm-Gg: AYBFou1Xoa6yn8pjn0no85nJ4iod9GaIs1aucBuHZfo6bqJcDgwoe30Wkpd1xzS5mg7
	ONM5KESNVhUaj4xcAT5k8H+Of2hi7mPBS4omfJ5zWJOvX9fS1grFBg0Xl3r9oY073hAOIOpOSpQ
	YB18bX3WzVkR+lRwRPmNFN5TWNV7Axy66LG1bdZAiLLEPnVRpz2Gf7hrOTWMCzdjbAGawOaIzyJ
	+w5b0Lq5Mgv6OA=
X-Received: by 2002:a17:907:c50a:b0:c25:8b1e:3750 with SMTP id a640c23a62f3a-c2610474a62mr161182766b.12.1788521014272;
        Fri, 04 Sep 2026 04:23:34 -0700 (PDT)
X-Received: by 2002:a17:907:c50a:b0:c25:8b1e:3750 with SMTP id
 a640c23a62f3a-c2610474a62mr161180766b.12.1788521013862; Fri, 04 Sep 2026
 04:23:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831090524.106845-1-gmonaco@redhat.com> <87se3sakgi.fsf@yellow.woof>
 <df6e9168cb06c35e21db7f9d17cfbca6bd87005b.camel@redhat.com> <DL5B40CU17WD.3KD75URQZ6RRR@gmail.com>
In-Reply-To: <DL5B40CU17WD.3KD75URQZ6RRR@gmail.com>
From: Tomas Glozar <tglozar@redhat.com>
Date: Fri, 4 Sep 2026 13:23:21 +0200
X-Gm-Features: AcwNN1VYWiS12e-wX0_oY-0KV9RCS33pApbGhM3jUchKS91T2uscR3QBMlp3mw4
Message-ID: <CAP4=nvSCxbFTLBSvXVFnv-smMyFd9fNFXjodJGEqah=_GEuXkA@mail.gmail.com>
Subject: Re: [RFC PATCH 00/20] rv: Add support for BPF monitors
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Gabriele Monaco <gmonaco@redhat.com>, Nam Cao <namcao@linutronix.de>, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Wen Yang <wen.yang@linux.dev>, 
	Tobias Schaffner <tobias.schaffner@siemens.com>, Viktor Malik <vmalik@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 4:03=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> I don't think bpf fits here. I haven't seen active use of RV and even les=
s
> so of any request from people who want this kind of programmability.
>
> So Nack for now. Sorry.
>

A major application of RV is monitoring the combined behavior of the
kernel and an external application, see [1] [2]. Adopting RV for these
use cases is difficult because the monitors are currently built into
the kernel. Blocking BPF adoption because it is not widely used risks
a deadlock: RV not getting enough users, because it cannot use BPF,
and BPF rejecting RV because it lacks sufficient use.

Of course, I might be entirely wrong: RV may not end up being
interesting enough to users even with the BPF hooks in place, or it
might grow enough with only in-kernel monitors for you to take it
seriously. However, we cannot predict that in advance.

(Note also that the idea to use BPF in RV dates back to 2022 [3].)

[1] https://lore.kernel.org/linux-trace-kernel/20260827072400.45734-1-tobia=
s.schaffner@siemens.com/T/#e8a8b21136a60ad7c8f67b07c66f71de0ec0c1075
[2] https://docs.kernel.org/trace/rv/monitor_rtapp.html
[3] https://gitlab.com/linux-rv-tools/dot2bpf

Tomas

