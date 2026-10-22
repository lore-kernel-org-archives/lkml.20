Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792668866;
	b=SCope+q46suIvHCElV+nZ/HHIa5BUd7da5/Ni6VsEFOipagpAy5tCLAOq6fZ5I+DeR7N
	 NtphXcv1zqsq4eUnvukiaXPif4TF/qM/8W6DeeZsL6LG6VCztt9a16RBO1DIO3QaCnhLD
	 lw3Bb90cePrtUggZDi+tuyTV2RmzECLZ5Zi1nvdKO/jiKQWq3LyZi9vH2oSeOdgjiIBzh
	 8tWfQWbEoBK4hvraaET0y9g9TPZqaryllRRxXzGQn1y0W2ZV1KrN0wRMRBzihbJfzvdBq
	 aRIPCpHwRndWgXUK7xE7/Uhes+2uHcE8UjABvkBaiTu0EUxC2+y4fdHDUmUp2+LKUmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792668866;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=lMj2kvVg1lQ863+tJTpQ87BpPz8MFNV5FHGdt2SXwU0=;
	b=xzaooPRmCE0Zid+eJgdf8s8sMrmBfYQr8R4IdQAqNaQgOx6djSStk3eR6LzmvEnsmKga
	 lBh878a1F0cSKxYL4rmIZ0oVg7uK0Eei/z1e8WnYagcqVBtPAAnGwXNdDx1upBebsXtAR
	 luL6qos5/hBntngD6ryoZT6U5ENe3Ce2olkv1bY0U3PdOBVUC90eM8oPdtVcWzeN260VQ
	 X+S3sLYCyY7IJRCza3Y0o5+rawzm3pR/4cbAa7DvJ4Lv/atkpfqIS/CQQYOIgXpH72iAf
	 dNRl01hda/1SqrWDEhy+u3ZwCZN+N4bKVVm0qyOuytUuucTWaDCgR39TW8jFe8NLGrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MEj0CIGg;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=VNCn1lRY;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85758606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85758606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MEj0CIGg;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=VNCn1lRY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792668864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lMj2kvVg1lQ863+tJTpQ87BpPz8MFNV5FHGdt2SXwU0=;
	b=MEj0CIGgepMoxuzGjsRLjFOeRzAzOZ9YW4/0fuWEFdwZgS+TDq55dI7LzXA6OJMHErLYtl
	u1Df5USAeBUctkgqGV5JY0ccU2LIodb4xc7idOwOBfHwOqJAcBF/IEo55Znc2Rre4spKvT
	kFz3otCLSMmNHw0Fj238npj94ue9Qto=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-BZUhFfaHM5S_zuUxEBezyA-1; Thu, 22 Oct 2026 07:34:23 -0400
X-MC-Unique: BZUhFfaHM5S_zuUxEBezyA-1
X-Mimecast-MFC-AGG-ID: BZUhFfaHM5S_zuUxEBezyA_1792668862
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48dfaaea30cso1164989f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792668862; x=1793273662; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lMj2kvVg1lQ863+tJTpQ87BpPz8MFNV5FHGdt2SXwU0=;
        b=VNCn1lRY7rpV/OiJouz+F2pkDLyV+PsgeLgGJMRTPGEI2a0N7zUtxz/mwWqJENDnMa
         ZE7bcaGtpZVs6n+swUKT7VguHdnmCNRVbUM6ico7YQuFuswg1u6Qg/XuzXuqwSXdrgK9
         mEthcSss0sqpMUDm0X+EWhHZythFQLHCOCFITGPYMUPYzzGVkBLj2XpG93gaez2KhEzV
         wYC+qimg3G43g4JbzFIexSMHbnd8xsQtWKR3WVPGBr3w2ySYNc5sz3a3pKcm5Cps6oIg
         C/0Y3I1qutrrq8iLkRWkHBu/DMizS7h7IBgbGax8lcaGElil4UBjG4DG/AulKdkGRnKv
         t71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792668862; x=1793273662;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lMj2kvVg1lQ863+tJTpQ87BpPz8MFNV5FHGdt2SXwU0=;
        b=mtpuh28dePWf1CuE52B0fh1VqklEVRgyOJSau6UHqBH+07GDnCEMN+k6gdjXS+2eVe
         VecFQHbRjKiM5bHFl2TkTlQTD6G+RIwoWOCKA5A1UE79qnhYOXsECwW3KM1SBDf1ojGO
         3UW7JG54Kxq7aH7/Hk5WKdPMEFTin36dTwZ/diRB3PaZmVs0SKzQ/sDnB1UMb9XVwHru
         tb2FDUAMmIcmQs2n4kwqbXOnVNl2DRX83+9LrRIQIoK+bPp0nWCUCClR4mEbMtk7WNlg
         2qs4VOEUYKqymMU/4bLEGg7Oz0rBj9ermbjUB7PbMSJ62caacXdkUGiEXungnReRdhCg
         d27w==
X-Forwarded-Encrypted: i=1; AKwUvByuWfNBk3Ats6GqHPKOZ7jMlmF0mjuEkgs8zHJkFMxzeuI2+mrNL3YPoXfIP6dHuT34clJ7LkrNgBLUMbk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjRtpa28yymu2DqJhfmymrF1pDTksMHoD/OAkjRRbQonyKC6dx
	BItTPc5zIwmK1hfVT4qWq8YupeOJ2ZUjX513qlqTmbVO+0HuYVkCuNTRD8f0dP7ktvycxzzRP+n
	8zmiFvAZPjZbXsAo2WQAL4lpoRFqXbzbvY0HKAubhoB28JONAvT/mCkOVZu6ostgqjw==
X-Gm-Gg: AYBFou3RjKxKI4YeD2O8jA4JhjrX4o5z89+I0TfVWrh2HRVth8SW1cZkujyB1OYSskm
	XCjShMAhdjyB8SuVwSJXGM6D/rWm+kX/NRdeZuig1k2v5J/uINRl3J5U7MyGOl0mXX+0Vxluun5
	/CIBZ41/BPlRzd66SWbgvh0fkEpD2zZbkAHrFpZcFg0f9Zd9ZRwsMlnrTbDsf1jHoKLkyebpH4L
	l7LbwrvAvbUKlY7dJz6UMPnGlmu/tHkCqcXnDZMfJKWa3ej8S0BA+1KtkldKAg3zgZwcwiUAZzg
	Xmr6yed/SvVW41LM4G87Tnh7a2nLs0MZH+Sv0e85zY4mquVKCRNt6v7nLIq88XSKmJqNFpPq8fD
	XoM4O1dpGl8koyq6JPsAH1nGehJBI
X-Received: by 2002:a05:6000:1606:b0:48a:f404:6960 with SMTP id ffacd0b85a97d-48e264a38a1mr7689366f8f.9.1792668861883;
        Thu, 22 Oct 2026 04:34:21 -0700 (PDT)
X-Received: by 2002:a05:6000:1606:b0:48a:f404:6960 with SMTP id ffacd0b85a97d-48e264a38a1mr7689341f8f.9.1792668861445;
        Thu, 22 Oct 2026 04:34:21 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.133.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584afe1sm13501902f8f.56.2026.10.22.04.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:34:20 -0700 (PDT)
Message-ID: <382ed6c3bf6ab5f2c31ab9c9becae1b4f53c15de.camel@redhat.com>
Subject: Re: [PATCH v2 10/15] tools/rv: Add BPF monitors
From: Gabriele Monaco <gmonaco@redhat.com>
To: John Ogness <john.ogness@linutronix.de>, Steven Rostedt
	 <rostedt@goodmis.org>
Cc: Nam Cao <namcao@linutronix.de>, Tomas Glozar <tglozar@redhat.com>, 
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, Wen Yang <wen.yang@linux.dev>, Tobias Schaffner	
 <tobias.schaffner@siemens.com>, Viktor Malik <vmalik@redhat.com>
Date: Thu, 22 Oct 2026 13:34:18 +0200
In-Reply-To: <e778bbd7d5e2d2fc07ee365f37db59af04d9a36f.camel@redhat.com>
References: <20261001152042.124445-1-gmonaco@redhat.com>
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
		 <fb5c20f226f723cbb4df5092462dfcf5f2686367.camel@redhat.com>
		 <87h5ifvw3p.fsf@jogness.linutronix.de>
		 <f147fa9dfc553767ce92802b66723a85cf804e46.camel@redhat.com>
		 <874ieetakx.fsf@jogness.linutronix.de>
	 <e778bbd7d5e2d2fc07ee365f37db59af04d9a36f.camel@redhat.com>
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

On Thu, 2026-10-22 at 12:09 +0200, Gabriele Monaco wrote:
> Exporting all handlers functions is probably going to require a significa=
nt
> redesign of the current RV internals.
> Handlers have access to the monitor headers (everything is static/inlined=
),
> kfuncs wouldn't.

I gave it some more thought, while you could generalise the DA monitor
definition structure (imposing size limits and taking up that space anyway =
or
doing some /smart/ things the BPF verifier probably wouldn't enjoy) then pa=
ss
that to the handlers, I cannot think how to have a kfunc call the LTL funct=
ions
defined in BPF. You'd probably need a helper macro that is essentially doin=
g
what the "shared" functions do now.

I could fire up an LLM and get some /original/ ways to work around that, bu=
t all
I can think of is essentially rewriting RV from scratch.

Again, the easiest thing to do is kfunc only what goes out (tracepoints and
eventually reactors) and keep the rest in BPF.

Gabriele

