Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2933FA5E6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788420086; cv=none; b=t0v14Vsta7g+fI6WlkOCNmmDYtK0saO1ChU2qJAumQADg7Y9FUpr45l2uEAFzd0NVFsxs3g9YPonHphyq6IVuu+huZbXjyqdtzxszkD9zxNdNKE3xgbPumyO8xBzpGIdhS2Ymi+FbLNFZR4UMMXsdVHPqIN9HwriHIX8N3SBo4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788420086; c=relaxed/simple;
	bh=ybHCFlCHnPihYn5m+eFTCajuqHWBe7MyBmieJjWE1J8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V5YcstDqJkABpm5vFv/Gwwy4R4gnxALZtprkjYzoJtF7FZM0w+6dyrwy9FJKge/FEH9vMw5a9dMpbCuWm+fEehhxDJ3OA3ZesBjzRGq98TItTgR9WGTT7X5pavYUUVYXYD7czxlppwcqfbuBtVH1A/KXVho5oYFBN1v8x59Gdnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Oowg0Z/v; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=GtoDWtmn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Oowg0Z/v";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="GtoDWtmn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788420084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ybHCFlCHnPihYn5m+eFTCajuqHWBe7MyBmieJjWE1J8=;
	b=Oowg0Z/viWTiL3DJE4qruC6lDwMpg/f9dzAiSlvk27hAgAghNO6WS2MTr1wFXToi+3HmKS
	9xxZVYLZiL60vG/V8cLcaTlZdBvJuneenzsToIRbx4Fc9Z/Q6QqEYECZqWdicq/ZyEEKlA
	OzsTSCkB/YHGCn1jFzRvLdIp7dbqfMY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-XWsu7ZuXMh6Vww7LH2Yw6w-1; Thu, 03 Sep 2026 03:21:22 -0400
X-MC-Unique: XWsu7ZuXMh6Vww7LH2Yw6w-1
X-Mimecast-MFC-AGG-ID: XWsu7ZuXMh6Vww7LH2Yw6w_1788420081
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49cc9f5bee2so16701865e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788420081; x=1789024881; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ybHCFlCHnPihYn5m+eFTCajuqHWBe7MyBmieJjWE1J8=;
        b=GtoDWtmnf0XFjJinLlF1mdQ7l/l+gUH6JOlxe/WKokTzobTArHp8YBaz7M5fNbdVaG
         G7x6fP9ufv1hKqhrItJrhIMEPBDVUhh4NahXXGx8nuSoWEg05oYWfHXKa6/3OLoy/iH/
         srD5ZXv60Av5jKisPbImmDRls+J78IYPchcJsBJhZmKzPI7bM4NoM29qQ9uNR0F2QIpf
         f/jpZdCMLnZQk2WvHGJiq4KVpTjuengwttFD69IxiwEG4dRfEFd31M5DxzvoYF26BGVn
         z7qeS0/6XVWtXm1Mga2iD+woMuAVzDl2yV+/pKNQ5Fwg1ftsjEWRMvG5EV1YChC3BUOg
         JIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788420081; x=1789024881;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ybHCFlCHnPihYn5m+eFTCajuqHWBe7MyBmieJjWE1J8=;
        b=dvbESZ7zycZ+gbSQB+UgnLjNdOJaNyzAaeOdIEpOYEKA+jE35uRvCorGKxldBKXGSH
         E9h+QS+FTf40+QY9xNVWv+mB1CAp8ixYf99e4zFWlURauk3+kPi6T7ZZ22kBJlZgqGKQ
         q55q7SMHIvXcxzD9q17K4WF15TYPOlKCvRS8EhEuiF+s/aUCq00a8o4OtpBZXFOGVCmp
         Vg6UHSWIxmGj+N9u/KhQsQ6pTD3rtpCPeVh6lmJddPH+79oZcK3RC+8uWsoIDGmQ+WFn
         AffozOugnsau30E0sTsozSqpK/ZwEP5urCCdsjK9xZI7zkUBdvHUKkKVGV0bIRqPD4Cg
         RR9w==
X-Forwarded-Encrypted: i=1; AKwUvByk5vlTPVcYxj2Lptw34IlRuGrXJtAWt1T0278BIVzGklP8vv9c0yvfBmTqYrhp2hvmc3HwM36I5F0GM74=@vger.kernel.org
X-Gm-Message-State: AFuF++n/DZtLcrkh0SmhgbVLnAd/7NYk6vOA/HVBwKWFZhGoKgACt8yF
	2swvOLcU6JtyJo3MrVV4+GvSH+Fx5qSxjT9C3V4aqrdcHN3HmqfdbUh7WtftwSuBWkJWyY+g/0K
	m/5/r6h4aGxRf3HSmfnTObyVgcvetIMTVPFNr86i0ozKF7T7qEhcg1X8BVZMgWTcC49/C2fEEuw
	==
X-Gm-Gg: AYBFou14wtivogRNg13dzy18h3TdJk0hueeR2nE5E5wrPk2yVq5ZdXE4vGqaHeTWats
	HFGqO2ZWIAb2meHyZwAWoRsqAKtYnWi614QjrpFOonuWIz3BrAOSLSh2/0ZBI06g2iz/dtb7SHZ
	VkhBykeRNTbCESwkUnvdrOfhQezL8BqlvhhyOdJ73nisi64iWyNmrbWJJX1ErV7TUaI1VeLK92i
	KDct6mbETax3hps1MA+UmtsRB8+JqsrQ0bLVvb5YjRtTqmpBiDK5tvOltsYNdsD/jB4BjU/pbk/
	XCSwOBAe7s/SA0fRQnCPA53nK99kPrqQA4OZzAlf3ir3KtcJbAFVkkLtdSR0qYNJtdIy2qXlqg3
	3s3QMbqbAS7XdC+dmSNtwLcshzJKUvA==
X-Received: by 2002:a05:600c:6296:b0:499:621a:2ec2 with SMTP id 5b1f17b1804b1-49ce581635bmr196789695e9.3.1788420081334;
        Thu, 03 Sep 2026 00:21:21 -0700 (PDT)
X-Received: by 2002:a05:600c:6296:b0:499:621a:2ec2 with SMTP id 5b1f17b1804b1-49ce581635bmr196788945e9.3.1788420080986;
        Thu, 03 Sep 2026 00:21:20 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.135.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee60d9c6sm49952545e9.11.2026.09.03.00.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:21:20 -0700 (PDT)
Message-ID: <eb3dd8158942d663ec8ad4c529eacd666c5f96d9.camel@redhat.com>
Subject: Re: [RFC PATCH 00/20] rv: Add support for BPF monitors
From: Gabriele Monaco <gmonaco@redhat.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Nam Cao
	 <namcao@linutronix.de>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org
Cc: Steven Rostedt <rostedt@goodmis.org>, Wen Yang <wen.yang@linux.dev>, 
 Tobias Schaffner <tobias.schaffner@siemens.com>, Viktor Malik
 <vmalik@redhat.com>
Date: Thu, 03 Sep 2026 09:21:18 +0200
In-Reply-To: <DL5B40CU17WD.3KD75URQZ6RRR@gmail.com>
References: <20260831090524.106845-1-gmonaco@redhat.com>
	 <87se3sakgi.fsf@yellow.woof>
	 <df6e9168cb06c35e21db7f9d17cfbca6bd87005b.camel@redhat.com>
	 <DL5B40CU17WD.3KD75URQZ6RRR@gmail.com>
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
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-09-02 at 18:57 -0700, Alexei Starovoitov wrote:
> I don't think bpf fits here. I haven't seen active use of RV and even les=
s
> so of any request from people who want this kind of programmability.
>=20
> So Nack for now. Sorry.

Thanks for your opinion, however it sounds a bit harsh to me.

RV is clearly not a popular tool, but I wouldn't say it doesn't have active=
 use:
we're actively using it to validate the deadline scheduler/server changes a=
nd it
already found a number of issues (e.g. [1], [2]).
The RTapp monitors are used to validate if userspace real-time applications
interact with the kernel in the best way for predictability, as far as I'm =
aware
that's regularly used [3].

In my eyes, the missing piece of RV is in fact this programmability. Adding=
 a
monitor now requires to write in-tree built-in kernel code.

There are strong use cases for domain-specific rules that aren't general en=
ough
to belong in the kernel tree:
* stricter RTapp rules that may not apply to all use-cases
* verify some exotic system within Linux (e.g. a co-kernel [4])
* modelling for functional safety certification process (used for in-vehicl=
e
OSes like RHIVOS)

BPF seems the natural tool for the job to me. Mind that RV monitors would b=
e
simple users of BPF, requiring only modifications in the RV subsystem but u=
sing
standard BPF facilities.

I'm totally open to discuss on this though.

Thanks,
Gabriele

[1] - https://lore.kernel.org/lkml/20260522125833.264145-1-gmonaco@redhat.c=
om
[2] - https://lore.kernel.org/lkml/20260113085159.114226-3-gmonaco@redhat.c=
om
[3] -
https://lore.kernel.org/linux-rt-users/20260826132153.2476006-1-bigeasy@lin=
utronix.de/T/#t
[4] -
https://lore.kernel.org/lkml/20260827072400.45734-1-tobias.schaffner@siemen=
s.com

