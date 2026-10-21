Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792596257;
	b=xOeqIbjzHgc8yAyoP0VwzTRZIsRscpJ7tjt2of7OWDUAsjE7mGR6y+7KQ+T5XB0f26Mw
	 Bzk8YSMO24aS5dtV/qlXC8FEA0U/KYKHo5IAiZdxIQoDAi3no6kb3aNqFD4bbH84/gJ5H
	 g3WBTrBOJJAz+IiWZS2YgfJWClHOidmI4QjvggYbCuGOX6mtYt7oV2VV03re/CFaLi70A
	 ZMS0PBnUY2U19KNO25GNr2HUZyU3Wu8Bk8PESztk+7mDpwpGd94HJrGHUagYfcCfzYQwP
	 SSavGu39qNqEHI+4F0pXctJCUgfyeqIObyBNtYeUS5DSikCbm3embp7HNkwADNjJX3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792596257;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=FOdC1U/zHYhK2Lt5MZ1OH2V/qvZIRZuOE3CFRr+zeO4=;
	b=HUJmoeVaICT8HQCvCIhGxSWFrEsLup+8zAd0lEmgAkZwn8fejAch+2ic5w1xLo21Nx18
	 kb5iTIaHLoiQzLWe2QoEiGANdSQt+3go2g/yebNUImEqhfcQIkx2CrI5poh3Zl2LBEri/
	 hNA9AauoIdM/4SxUavIUvE9HfoVZgXS2Vo6+PglzD8Tl8bJkr9qxiyHlkeTT2Ai4gmTu9
	 9wMAXmMOtqvzMP702KmDUEaZ7pAhzhfsFvmCasIHDTXDBicZNaqAuGDTdt7JsWC+juQBB
	 d+uVY9HW3IckRiHQv1WLfWCkzgtYAngGQNRstymFMEARgy+Jj16n7295cBCg0Cpyl/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="RosBWZf/";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=BSOLag+6;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E545606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:24:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E545606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RosBWZf/;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=BSOLag+6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792596255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=FOdC1U/zHYhK2Lt5MZ1OH2V/qvZIRZuOE3CFRr+zeO4=;
	b=RosBWZf/hNaEb9xKKBe8IZeS8t2d+l7WhHp9IBViALCIW5n0MEeZzU5SuGfgxhJV1Obrfb
	MD+RohaTLXbXuKBo56oHqapuJ6Ek7cWVEGaQwUZQ3haSHMo/NjE/WKEOJcel+uleYgIqJf
	J5g8L5g21bx0Bq15T/V6/bwV+4G8GCo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-454-gdOTBXIkMFmKLrBxx7Rp6Q-1; Wed, 21 Oct 2026 15:24:07 +0000
X-MC-Unique: gdOTBXIkMFmKLrBxx7Rp6Q-1
X-Mimecast-MFC-AGG-ID: gdOTBXIkMFmKLrBxx7Rp6Q_1792596246
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a1f03f2e8aso7976385e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792596246; x=1793201046; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FOdC1U/zHYhK2Lt5MZ1OH2V/qvZIRZuOE3CFRr+zeO4=;
        b=BSOLag+6jpFgEK9MhYfDdaXJ24Rqbo/miYOuwOT9gu9NL3PT1vrf5t9GQTZUS0OBZa
         4xbRTp33LH+rwHHWb6b3cWc/Ooputti3XsmQ4iBSxsrLqTn62p7vL1Qnoo3TUJxwaQfz
         bOqr+b5WposkyJA3iAwBXiR6Hxw1/3FadvXe1CxdavV3nLWuw7tbXCi2XOTcv4KTFpvV
         o3fqOqRyTlSpLvSknNKJbvCtLLBfud8vB6Fo0AMwlmpzDKMQP9+uBvUySC7vmrSV6qSR
         byv4TdA6YO6MseI/cYkWIgHZH7pfnwNwstzv4ycRMRGItUrJWIbEcVfoVSfpfkNsAwKW
         pOtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792596246; x=1793201046;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FOdC1U/zHYhK2Lt5MZ1OH2V/qvZIRZuOE3CFRr+zeO4=;
        b=EuAnKa7nSNLh/XtAlSGnQJsIOo/Rj5lvhhomJHOHPz68+JwFG8fli6DtrIBXhxtwRy
         zS+PekCjTifeUVst5S3bjCXN7fhQBgpdDr+eBqUkX1RsKD8ni44twBSFXa+8tW/57Z0C
         pfUTTWSmD3pEOQVAnWel2ew2mwvuXnUl9KQWUXhFG/nopYtAXb/DJQFrgl+IiVpJwiP4
         vFIDuz3p4MgHkuJ+kMNBNQ1FGOcYF3bHmh5/jAmX0oXfVZHdNgGm6yCfmpTOdMnHFPk1
         zgL+EpwNSuqFfAimyYkc3CuK6UoWHUFVA2zi0AK5C+NAyroEuaHVVK+rbqz3aqoLaB4O
         aq7g==
X-Forwarded-Encrypted: i=1; AKwUvBzbAGbIYA00npnYyK0hb0CxuNMnPJafOwlLqHB05PslNxERYFeU8t9eVtGPt68gQL4gY3zxKNkoixH3ClY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4LlEqAFC9/lvTCHSsEVFDAnaVkZGvsIHTAVrUS3EXPl3E98pH
	9TJ6ADdZfEP3uX5FHEKSsTbljvXDTDnuIwOBiJZ7e2GH2DqB/CR3pMGQuLdBXMe1KV/aMiDfC3A
	dE7sl5k4j0tbAt1lHHI7+ck8EQNMw55xCmEp29UHyYiHan3fnPNMMePzX4KV01qfMjQ==
X-Gm-Gg: AYBFou0L4mZyWevLYg57TPP1IBVMUqS9wudN9u3AW5WSF2hGewuyIaHPtxf6g3CRLAQ
	zDIMl9Vgxp4MOHxetRaKJgFuYw0GVUrD9x6hC+94E84WrvN5uWGvD+oEq9SdyLnOtxQYzQV4D6s
	0Su2wjLcMzbKLAsrJrGRD5qIbo/MeWRIlfjwBNptQRIm7gPlUG1FNGZjFH3XJAy3fNJdikP0YpG
	F/gA0VDmWxlHapAtuZayrOSDO3QltIuQDqd8fu8wObAoj8WtnQ71XO7Ht/x5FEVSz/OQM2/8Iro
	pjA7UgDtt1iWTVkcQ26wC8LOJ7tWxVBBAFrRYoglBKM+MsTCYrnlFvVMNNmWXJZm4RbQN1yBfaB
	exBzbKbtQDSQj5rJJssE0k56k4yc=
X-Received: by 2002:a05:600c:46d3:b0:4a1:97c6:d2e8 with SMTP id 5b1f17b1804b1-4a1fdd234a6mr52767765e9.32.1792596246445;
        Wed, 21 Oct 2026 08:24:06 -0700 (PDT)
X-Received: by 2002:a05:600c:46d3:b0:4a1:97c6:d2e8 with SMTP id 5b1f17b1804b1-4a1fdd234a6mr52767205e9.32.1792596246041;
        Wed, 21 Oct 2026 08:24:06 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.34.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcdd3856sm7018605e9.1.2026.10.21.08.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:24:05 -0700 (PDT)
Message-ID: <fb5c20f226f723cbb4df5092462dfcf5f2686367.camel@redhat.com>
Subject: Re: [PATCH v2 10/15] tools/rv: Add BPF monitors
From: Gabriele Monaco <gmonaco@redhat.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Nam Cao <namcao@linutronix.de>, John Ogness <john.ogness@linutronix.de>,
  Tomas Glozar <tglozar@redhat.com>, Alexei Starovoitov
 <alexei.starovoitov@gmail.com>, 	linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, 	bpf@vger.kernel.org, Wen Yang
 <wen.yang@linux.dev>, Tobias Schaffner	 <tobias.schaffner@siemens.com>,
 Viktor Malik <vmalik@redhat.com>
Date: Wed, 21 Oct 2026 17:24:03 +0200
In-Reply-To: <20261021094853.29b9f7be@gandalf.local.home>
References: <20261001152042.124445-1-gmonaco@redhat.com>
		<20261001152042.124445-11-gmonaco@redhat.com>
		<DLXSI4BSRE5F.1TLKCBUAGNDFQ@gmail.com>
		<b1fb01e1c58893795dd4be346f233d39fe653aaa.camel@redhat.com>
		<DM6H7SK4YZ7A.F0MM6C0I77OR@gmail.com>
		<878q3xtptq.fsf@jogness.linutronix.de>
		<8B3FF026-6159-48CF-8FEA-AF2FACD2E4EB@redhat.com>
		<87bj8s8ih9.fsf@jogness.linutronix.de>
		<DM78SVMBI2XW.2XHVC67VON48A@gmail.com>
		<87v770uuyr.fsf@jogness.linutronix.de>
		<DM7I2PYHNKXE.3AYY3N1HATXLW@gmail.com>
		<87ik2zryzo.fsf@jogness.linutronix.de>
		<0055967d4571e7c8549dfa476fa6b15b93013701.camel@redhat.com>
		<CAP4=nvR2i092924zszA8Qh0UUYnwXfAsa+7KjPe-NpwC+bbLXw@mail.gmail.com>
		<8580176d216258e9008c344e0529509117dcc18b.camel@redhat.com>
		<CAP4=nvTc297yQHz8aumZFAQ3+JK=5Z_=416WdosT0S6nHEeNfQ@mail.gmail.com>
		<87pkx5q1w4.fsf@jogness.linutronix.de>
		<0d4f11b1999588ddba9d855db43fc492eda32de1.camel@redhat.com>
		<87h5ifqy6w.fsf@yellow.woof>
		<a8d8b080f403eed617242a3276717706b4081ed1.camel@redhat.com>
	 <20261021094853.29b9f7be@gandalf.local.home>
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
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, 2026-10-21 at 09:48 -0400, Steven Rostedt wrote:
> BTW, I'm curious if it isn't possible to keep both in-kernel and BPF
> monitors? That is, for those cases that do not change often and has a wel=
l
> known model, to simply keep those as modules and hard coded.

In my opinion it is possible and I'm designing every change with that
coexistence in mind.

I would say we could only drop in-kernel if BPF does such a great job to co=
ver
every single technical and non-technical requirement or use-case, AND if it
makes maintaining the whole thing easier.

But I'd like both to be fully ready upstream before taking that decision, t=
hough
I'm getting more and more sceptical.

> But this entire thread started with people that wanted BPF type of
> monitors for more flexibility. I would argue that is an entirely separate
> use case. For them, it should be a fully BPF solution, with a few hooks
> into the RV infrastructure.
>=20
> It currently is a big unknown if the BPF solution can handle all the use
> cases of the current module method. My suggestion is to not try to do so.
> Keep the module method for the more static use cases that do not need
> dynamic changes. And create a purely BPF method for those that need BPF.
>=20
> This thread is sounding like there's different requirements between the B=
PF
> and module methods. If that's the case, let's keep them separate.
>=20
> I agree with Alexei's first comment about not adding BPF to the module
> method. But that doesn't mean we need to eliminate the module method
> completely in order to use BPF. Instead, just create a new BPF pure metho=
d.
>=20
> Perhaps in the future the BPF method may make the module method obsolete,
> but I don't want users of the module method having to do all these
> workarounds just to satisfy the BPF method while it is in development.

Agree, from the initial survey I had it seems some folks still prefer in-ke=
rnel
monitors with current infrastructure and cannot migrate (e.g. cannot build =
BPF
in their kernels).

Right now we're trying to understand what are the non-negotiables also BPF =
must
have and it seems we need some sort of tracepoints (via bpf_printk or somet=
hing
more convoluted).
That makes it converge even closer to the in-kernel monitors usage, althoug=
h it
still isn't a drop in replacement.

Reactors will stay, just probably not in BPF for now.

But thanks for chipping in, I fully agree.

Gabriele

