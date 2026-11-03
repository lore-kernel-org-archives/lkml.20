Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793727224;
	b=PnPAImTizHqB5phI8swk4Q0f/8KyjnSzrTkF0+oLnfqLauzoCl6gSCa+QSlMSF7Y41gI
	 zp2+gjbvZCW+nGrWRnfmdsAkqEWQtNUUh1OC+f+u8t0W7Mho+5Di/MTHYsCIDVHcBGdvp
	 1YKMrHykORQk89cXNalEq37xqCgPCU8zH75scZ6keH18ZAaBbdJs7kvlWZQaBOfEp3y7q
	 ibasO5Kf/HF7BMXnRCXpSYymZYFPM958PyOAgDppAMIZEcbgFExsoTn97dSDpKfy0J2Fk
	 /UOm7d5iipFUxy/2CzuT/aVnRJIhtfQc2lUPeasPVJModgyWymlpo2YB/fdGJxLCsSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793727224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7kvZc0WwzYck+poOQJ20Zoq10UgCXsTI0hx1dF0SoGQ=;
	b=qESnH6vnEmNb8oDO4dgIXRj9A9FNIpMq+wwfp+Sp5ArmssWaXC7fErA9zAlvevvWhT2V
	 5xMgTExRM3sOBNcZnI9CmdArlr5Fiat1y63jbZ0znCUroUJh+faG2JSEAtjwZW5+3ZZ/E
	 zetBqlKwlBEkcBgi0ql20x9Mj36yPNNATZaqI5WP9pvLliKXLJKLbDhcVVBoqJyuDmovV
	 qcEWaneA1mvlWuy4PlJwx268Yn2vqCF+uv81pnF4hZ6ZQ/0J9PXqQujo/fPtQlK00s4v5
	 lDOc/tRzoisMDT0gJeZ2+Ks2AVFtV9HssS1eXEiauvNiZore8z6ic+QNrAArGKjQnRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nuro.ai;
	spf=pass smtp.mailfrom=nuro.ai;
	dkim=pass header.d=nuro.ai header.i=@nuro.ai header.a=rsa-sha256 header.s=google header.b=TFRBLPbh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDA4606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:33:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFDA4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuro.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nuro.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nuro.ai header.i=@nuro.ai header.a=rsa-sha256 header.s=google header.b=TFRBLPbh
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36661f953e4so6695852eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:33:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793727221; cv=none;
        d=google.com; s=arc-20260327;
        b=Cz2QnRNsMPRHMloX9RXRIokytNJ4K6oLnririvENzmorrgXVMjjME0u8ODhMWvEcIR
         DXECKBqdiut+tshKgdTDy2tyNtW7ukY03YNAfZPgxKOngh5C3v749eB8ZpJmNYn8R9JN
         wnTBMFJxa2M2BehqdRB2pvN3t92aVMJNe/ddWnzcQ6xjnSO/xoFlYzPRYg2zQTLRcSxJ
         +NWPdfha1oDy2mZSx++HkV51rmFuKzQdGRph+pw1yeFiFvgIKR+bVMQQe2Idt6J44j1O
         wdlwnHqmSAQcwHF45z6HMNBTg/ukoodD7gJXXZDN7ZjBcC5flXiISCb+C29Ga7LfnJbW
         zxTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7kvZc0WwzYck+poOQJ20Zoq10UgCXsTI0hx1dF0SoGQ=;
        fh=HI4qdzCYveNIahtan6Rtbcmly7ZOCkwvmYrFtRC/ZnU=;
        b=IjVQuZ8/bq7hJxST6hqUj8dL5ItNv4HSuSmo2jIueqf30AAR1B57aDyNF2ht2P1Fv9
         gvVDxSr24KECQat5rA/QR58R28TZ27u0a2JJT38BB7/bcARk4EAwkdxxGCpkYMpia3J4
         HcAqWY8/SsHnkTTJUiWruxKAf4ertqnr5v6dOmnWGZfNIeECR+0vTnsDKqx5eySqpilp
         BadejEKnkq1I9q6k8NDJMRZsFjZO9/I296lbCu0gRb69awFq2NHOEsYFWjPi0eiu31v2
         G8ZiiJbvcO1ga13FuJtALmDiIPtmcOyVb9thGf1rvPP6u+6WPIOSctyL82sG/jrPjcX+
         gB2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nuro.ai; s=google; t=1793727221; x=1794332021; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7kvZc0WwzYck+poOQJ20Zoq10UgCXsTI0hx1dF0SoGQ=;
        b=TFRBLPbhchxEjVic4OjH2G6TlzzzBV6v5GpaZQ4uYVPNG0kcoMKN7kt+p6Jbnbd1/a
         kgiOYnLwfmbMm8v835wlejip6icnD9TlGNpoqTW3NHEUjwkFHJwTqWF+3PxRKxvJFeFN
         qkK46HVPevdP1pD3nFt89lP+7SGf/tC1eS4BzLQj6UOC+akMgDFV/XKbO8eK9NlovlS5
         D49H+w6ot8+kcl4pQvm0uW2n3OmsrfyV3Ooh7iFlbllHQrLeTqWzgzCUy8k7FxOQvlmt
         OReAu8HbDKY33eez0l3l/naoXWGuJavhKDrR1tKj1oXXaDGRMXy4rG1BNP+F7seHMOZT
         jnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793727221; x=1794332021;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7kvZc0WwzYck+poOQJ20Zoq10UgCXsTI0hx1dF0SoGQ=;
        b=Y3U7GAJ9Xp67DOYT8lQwbR28y0Gv8zeI2dKnY6E9EENmfNNBXuh3JeDqVCTWto2Kb3
         4+iT5VH5/8D07WxMCCnE51KFHkM6I80PTr6uMY3cP0r9z2wxlO3eGzgCgA1q+CreZ8aD
         N0jH108UjUYNjmJhU/2kLpOKscTxDW4lvqtN3jPcdQryNfOo5JHfmAMV9YLJmTRk6Opo
         3RYizGKin0Zfia768yXdCr1L4G/vcd+XyoNOgAQ/71GiHhnIpHiHtCMMUHf8dP/BNHXn
         oXw0dPLNWnu1Fulp/QOOl16bEOx9TOr1Bf0/8MwOPoy+KNsH18/BkY9p1RQzcNCtuOuO
         cFmA==
X-Forwarded-Encrypted: i=1; AKwUvBwUGoOI07Bl91HyVERHpfJyaknSakoF1E9N+j+l0kubsjuUPBJLVyoN+eRgleOXOn+Xpo6Z103u/+KFpbY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KrCqqBBvJU4O+7eY3OEKJKWyrQ0Q3+b7dBaHw6AYFgJZnsl67
	MXUxG1QpWGrU7XRN6wfHWKawRH8pOCRpxh/t32QYwenD1e6tIoEZZoAyck9OLcHZ5o0JN9mp0vm
	X7NivksKov7xxy2dtQmK4cy59nZyB6SmRL4KehT4Vgg==
X-Gm-Gg: AYBFou0OVvhYDFRRRPbLtrnAp2HhlBAhG6B6FINRpGcyC79dG54Kymj9AuV49CMxqS6
	16HjLcBHoDz9+UBfrDvp72gkl6HZWqOHjHxaMZ/A20+ecCOH6UiCB66ZiXMF0WdcG4QjT5mmx4o
	m8G25N/SvC2FwqSEHFv5hb6obn8yzs2AyebNcPmBHorMgVcsOA44KdDHEPw/MNWzJywNFGGSAUZ
	V7MMx0CZOn1mGMYRnSr+dbNfgauJsHT5FkMOsrOC/c1d0+UJF0oTlgUKLMJH5l+SfrM4f1ywVhG
	L458dyIUe9cFVvEdkhIGYccJNnFaHaTiOv4USvcsSA6rhokRRaCXLIAwuyKkGCG9ZHkOvJ+8hzr
	y98eoI9Xc0urbyhyYadqHwa6yYepF68i1Cqb8
X-Received: by 2002:a05:693c:69d2:b0:368:9553:f2da with SMTP id
 5a478bee46e88-36a423f5c39mr22713847eec.31.1793727220500; Tue, 03 Nov 2026
 09:33:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029211101.2089535-1-jkain@nuro.ai> <179365451164.3131.3767942488983292@kernel.org>
In-Reply-To: <179365451164.3131.3767942488983292@kernel.org>
From: Joseph Kain <jkain@nuro.ai>
Date: Tue, 3 Nov 2026 09:33:29 -0800
X-Gm-Features: AclHuK_PDtuEdSbv3VB2Euk4_sVkJ92-U7LaM2mWw4pMO2EN7sk9aMuBs79Bl8w
Message-ID: <CA+Y90PiVR8kdiXFuj-M3pfMgidAM8NdJONiEk0jDBtatRLHj0w@mail.gmail.com>
Subject: Re: [PATCH net v7] net: stop defer_count outliving the deferred-free list
To: netdev-bot+sashiko@kernel.org
Cc: edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	davem@davemloft.net, netdev@vger.kernel.org, horms@kernel.org, 
	kuniyu@google.com, sdf.kernel@gmail.com, kerneljasonxing@gmail.com, 
	willemb@google.com, almasrymina@google.com, mkarsten@uwaterloo.ca, 
	jiayuan.chen@linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 1:21=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wrot=
e:
>
> With the subtraction moved after the napi_consume_skb() loop, does
> deferral stay disabled for the whole drain?

Yes, for a full batch. The detached skbs remain charged until the
freeing loop completes; smaller batches can leave capacity for
further admissions. I should have explained this admission-window
change.

Preliminary non-PREEMPT_RT x86 VM tests recorded no limit rejections
in either variant at skb_defer_max=3D128. Results at 16 and 32 showed
mixed rejection and purge counts. Throughput and CPU cost were not
measured, so these results do not establish a performance advantage
for either ordering.

I propose retaining the current single-pass drain for now. If
another revision is needed, I will explicitly document that the
detached batch remains charged until freeing completes.

> This is a pre-existing issue, but can a runtime change to
> net.core.skb_defer_max still leave a per-(cpu, node) queue at or above
> the new limit with no purge pending?

Agreed, and as you say it is pre-existing: neither the reject path nor
proc_do_skb_defer_max() kicks, before or after this patch. Both of your
examples look right to me. It is out of scope for this patch, which is
about counts outliving the list.
