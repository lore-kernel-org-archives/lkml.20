Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792766639;
	b=ZJuoKGO2Ql2aPYOHixSm2uib9Se+UGwgfEzH8F4GS7254pxXeYjq7fkFLVFTp94q/Jo8
	 ng6syuBYRgyala8IDQVdEuBD3senRAVou5Fq93VjGghwBP2EO33Mb/gcBa60z+OaWs7PO
	 jITujVTsqo+XC4ag+qwIXYmtCxD70RBCYNCzDLy7CMxRJ+eij0WVZ2HQS2KLCnIG0vMBm
	 3hkcYqu0pSKSysh0Xg5iNFoMTI48fpRfXQe6z9r+klBfJ+gvF56TfkzkyTQBrefctTPYa
	 nqu278kJP/Vc49ebya65fLgj9PEYFIdCvn4pIzF0UwYngHECxc1MkGidT/2LLMsirVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792766639;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=erFZ2N8drsgFVvCe7mPMYkub3HB7wc9GLfWe++98/JY=;
	b=iyLXfg4JiDJmXTw1JBgs5FrLEAr6x47vjyWg5MHdWx5nlc7SuDPIK/YPXBSpnup5pQWZ
	 CvT9yHfIYwrcVJ++m3WRbOuK+qGe8yBDyGnsngG6V2SyddvCzBVsqjV8wGmkFHgGgB5fG
	 jOUJtbbO9KTLy7XvmxkTMhIDYGEqU4JKiCMfQQPxJUKaSb6rL4Z7do8IwyzG+O2aKFBEH
	 NyXmr3X4TpcFOEeY64qRADKaF9WZ97zecgw46Yz395eg0cr68RAHagbUa8vkzxR1hZ/2d
	 Q3xBIW8ILEq4/e4VAkSBPYGmuLWAVsFCmTjVTIP2EsP3wqYV9842H0SPz5fub90/QIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NJnbcYpK;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=k++OMqo6;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925C5606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:43:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 925C5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NJnbcYpK;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=k++OMqo6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792766637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=erFZ2N8drsgFVvCe7mPMYkub3HB7wc9GLfWe++98/JY=;
	b=NJnbcYpKN2NCsW4I7/dRindoO9uDpKxzi159VtpwhB1z1/15mV0iyTU6Tj9YV/9fNDFn50
	uZ53sqsYfM5K9Y5ebNXOdwhan3/YyWYUd9aF1Yglm4DJ60ARAj18cq1wlTFdKrYBBPnaYl
	jzgV5VhG3HJzlwRgclB771aBkh5B/II=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-UQIjaPQHOZeW8a83bfOUmg-1; Fri, 23 Oct 2026 10:43:56 -0400
X-MC-Unique: UQIjaPQHOZeW8a83bfOUmg-1
X-Mimecast-MFC-AGG-ID: UQIjaPQHOZeW8a83bfOUmg_1792766635
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c4163a5400eso232476466b.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792766635; x=1793371435; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=erFZ2N8drsgFVvCe7mPMYkub3HB7wc9GLfWe++98/JY=;
        b=k++OMqo6eK2SFFh/4BC6jQJV9b97HcJMy38WfOWbVbM6NAAzbKTyO0wrxe9JCvAvMy
         SPquAk88nq6vwzKfOeUNttULQ5kVqMIyhSc56WEMKX1QMP9SrXgGz34108UJDocekKDx
         +XbR+JqHyqtuKxdzaRhpk3oyivxfdKWjEBwYhkaf5RES6vXmh03AYtyE7nBqB9hNHEFO
         v82rg+J9pcFnwe26xl2N7EXCiuzFESw83JfK0J2/ZMDvBkMHZ4ecQxXP5JH7wDyW6CZe
         5f04z6iERiMKiYAWo7mQ4cqNlx6GIIk+Pl9l0KoK1D7j3FZNviaYM9tQ7ryFDxC7RMke
         gyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792766635; x=1793371435;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=erFZ2N8drsgFVvCe7mPMYkub3HB7wc9GLfWe++98/JY=;
        b=zaGjHigEj69JplTIrJzrFeOD17xSyhNtRdKFrQoDjsKa8WlxMUD8iD/OrIPeaJeGxj
         lbJRNmjfpi7w9jRIRDAXxiwqvx5VZxW42pwr2OJ7g5qzLoCjvXN5XtHjOMYJfDbRMemE
         NTFAB8lRusgE7A6eqF/KbIa42R60UBcOgOlcekqryFFL2j7NrDxFr84Njho22rvzeR40
         0fri6ZQWjk0mLa0tO3/g/KLc8eEjmH0pyIr8dx3LV/I28Nx+PU9egCNwTGmEkxwJOxtt
         43drUwObQyISMijCqZaRTSUUt/sNpQRs/wV1clePGFvcus7Kd53qu14Gw6RgaYyWHs5p
         G9OA==
X-Forwarded-Encrypted: i=1; AKwUvBxJmpr8VQhLOufu+QiTc6xJLIWhUnWuhfcxr3PazpqdY+eSKQ3TyfRU2zJFPxnbYld1mdr9wwnMAYaQBT0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0POOCivHAXC6zVnvk5aSfOVAvcubWaqGygKEU79CtnCVV3lLJ
	aHuq3kHao1qWkFWVzRVaWFh8PatFCFspD42lfTwpkYQjuCynw5UHoGMru5PNfjME53G9uHMTmZ4
	peBHjkNg0qk3LT8ZVJAbcM+He1zE8SkEYHH4vw6ugsOuLwO0VbyuR7yA3wwtmjWEuDQ==
X-Gm-Gg: AYBFou2KkzhbmBELHm5JOQ+fEpvqIMDhKDE8YeSnmpum6gxOZa3k+YieCbcIuHArNkt
	Jqs+0BjL1kyjA15WumDT4ZMkkF7Ab5WMqbht6DMcYnnraOz7valfOL/0ce9Q4/RFpKDXrlTK7s7
	QgPsqc7Y1badoaUPBW084dSZHv0TBsV6WUbo+DzP/DgjJyHDW8GEWskjeemIJBU2iluauONV5+2
	Q5uWmpMffL3MoI+Qz7WVX5jde23DVMQJjE5CCTXvhqqFlXU++Da/2L+najzF0jZXEh/A/osIbEv
	Rd9AMYQnZ9y2OXsFAco1ls3ANZr9i1Bt6BlzU1dw2Jv0KTPPCClAR50PoveK6rky5yWHyfXJG0D
	w/qp1cBHMYuFdbqlk5aB3keQqrnth
X-Received: by 2002:a17:907:d22:b0:c26:1cfd:4244 with SMTP id a640c23a62f3a-c468d794de5mr821385866b.11.1792766634921;
        Fri, 23 Oct 2026 07:43:54 -0700 (PDT)
X-Received: by 2002:a17:907:d22:b0:c26:1cfd:4244 with SMTP id a640c23a62f3a-c468d794de5mr821383666b.11.1792766634546;
        Fri, 23 Oct 2026 07:43:54 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.133.173])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b432b4eeb2sm1233445a12.0.2026.10.23.07.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:43:54 -0700 (PDT)
Message-ID: <19beabe52e6d6c6c98e3ce6ae89867356e18b2fb.camel@redhat.com>
Subject: Re: [PATCH v2 10/15] tools/rv: Add BPF monitors
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>, John Ogness <john.ogness@linutronix.de>,
  Steven Rostedt <rostedt@goodmis.org>
Cc: Tomas Glozar <tglozar@redhat.com>, Alexei Starovoitov
	 <alexei.starovoitov@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org, Wen Yang
	 <wen.yang@linux.dev>, Tobias Schaffner <tobias.schaffner@siemens.com>, 
 Viktor Malik <vmalik@redhat.com>
Date: Fri, 23 Oct 2026 16:43:51 +0200
In-Reply-To: <871p9ita52.fsf@yellow.woof>
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
	 <871p9ita52.fsf@yellow.woof>
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

On Thu, 2026-10-22 at 10:25 +0200, Nam Cao wrote:
> What about we refactor the in-kernel monitors' trace events into a
> single one. I am picturing two functions for ALL classes and ALL
> monitors:
>=20
> =C2=A0=C2=A0=C2=A0 void rv_error(const char *monitor_name, const char *me=
ssage);
> =C2=A0=C2=A0=C2=A0 void rv_event(const char *monitor_name, const char *me=
ssage);
>=20
> which trigger the tracepoints. And we make those kfuncs. This allows
> sharing trace events between in-kernel monitors and BPF monitors.
>=20
> Then everything else (kernel reactors, users, perhaps even eBPF reactors
> in the future) hook into those tracepoints.

That could work, though we'd lose some ergonomics around filtering events, =
not
so much in the unified tracepoint thing but in what fields events have. We =
would
need to parse a string (so I wonder if globs can express constraints like
matching whole words or we'd need to arrange the format to accommodate glob
limitations).

On the other hand if we still want to keep fields, we are going to need
event/error pairs for both DA and LTL and a way to match monitors with thei=
r
class (needed if you want to surgically enable the right events for your
monitors).

Both can work and what you propose is clearly simpler to implement, I can h=
ave a
look.

Thanks,
Gabriele

