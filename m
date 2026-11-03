Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793727608;
	b=NCDrtQAud9dxpi5QhDQPPBEio6rU747RRSB8eBeZZkoe+hQ/laR8tSbfUY9mVzFyxkfX
	 Sz4oWFL6r0D80L8Exm4BeiIAYtoSeg8k+e3dH4ST3Q08HyZkATB+EBh4ue74Rp+Wmrmkd
	 tZvuKo7nG2mty6kEppJZa36ZNFiq/7Oe7xV7E5D3Y8OOP9vSj9rDnQVYp8vy/Nw0sK84t
	 N6GarQW65tBL6v2QDsGne0IlmskGiEqHJnvhjW/22F8G/aF+JsrsVXBeys4MBI6zuaj85
	 3zV4b/ahlZ0JOerj2KSYZywwSyOc7PUiFSr3EKU2jAI6iybIMwdXTcKVtUsqoJFt3XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793727608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=z0GygfKxw4B27PwG3wjW8LBVwALAwJtEQDPEKGZVDSU=;
	b=QQHAhJr/FCo4+F/MZPMJCPcpFBuiHHVeQNw/+H8ZdB3ZH1UZ0bMHQtzsrHNbrMVneYgu
	 zS7urg0/YoazAds9FCAnqpFYQYN6M+UUmhDySURvRtjmIF+1rvhiK7fmRQexv1kpv5hh8
	 dMOIey/DN89UaFeGM8icAzSNfN61hstJo8sCwVWPze5JIo8A+W6l0oIRc1Gmgrl3SlsOY
	 x/6OcUjJM36JJpjKDiZmZXDGX6JMnYLbFDOWnMDVs9NEYcdD6qgY6bOalYuokrYzLB1Aw
	 3KBYghk/RV1rm9uq/24iPItkPO8Vy/45XMebPgvY962PDahHBYeL+481MXOuteXEcGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Egji2Ggt;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C8E606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:40:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85C8E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Egji2Ggt
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a06c60065fso3128115b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793727608; x=1794332408; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z0GygfKxw4B27PwG3wjW8LBVwALAwJtEQDPEKGZVDSU=;
        b=Egji2GgtKG8VkxnFY8MI7OhQDJQOYjTtc03HGW9e0YX04Mm9lrjtPi0Gp7a2LT/NcQ
         dNQ9qbVR7aj38zHNtO/eHIFry0UrPZ5p/4o8cG3V7LjI5J+fW/2ZlSImoNIQ91tjRwJb
         kR91N1plurobXIQ4JEDgVMf9l507Y7VOVSYKf4q2hV4F7jQ7SRYI+plm1i/JHfZ/5eJ/
         4iJeHBhFKyG8IG7zOr/OjF3j+HdKg8aZLqCK/rbVITTktDpYOgF/HvUZbQQ5jUCY34nN
         wVpw3RDmIRgiUArIOooIzABR6UBAJYJHbY/WK6GoZyK2v63CRpboh723SaF1/ZuiITtN
         o27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793727608; x=1794332408;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z0GygfKxw4B27PwG3wjW8LBVwALAwJtEQDPEKGZVDSU=;
        b=tLvwhAiNPyrFyKdj58pqmuOAT3udZaLypjJubpQV4d4pLx4FOPQMAimXXHEt2iOE6k
         1FVI4p7oppHTfk9UU+lB6cL4Rmnewq3FVNXuDRhrZoN/sCUTy/P4XuiAvi8xF+1Lmkab
         J6GnLCMQ8id1vcU7/Q1/6QxwQV530wIzciABuc7obN1Yh3k397KO0TG+AUo4IrpJw+Lj
         N5YbjDj2Q9z8Yw/0wg6XooHma9PixTLTH/qY6pHKb74imjpCh1Ooja3z1ohPSBRScUO/
         F47zfwKJPgrTA5+J2/4i88I8qnrEjgudn7dWPgH11hLzIkvVitMeXrDPIg+xvW8ddUPt
         ow2A==
X-Gm-Message-State: APuU4Z99VyhOnpvHuC9J2Jrbxo5BVPjUjFt4fa2TGGlMhqzWofY1tniQ
	mcrTCMwdMaupBei3lYSqyYoXPKHkKGeLdcVGodFCRoUTIGnuPX9IREV8
X-Gm-Gg: AYBFou2FO8hnTfIIt4MiFhFwbjngdaYV05KX/CusC4M6xh1qbViINdX/T3s2LdkDdgg
	5qwj6hYnNC6SZ7aE5Uf6tLe5DcoPmOI0opolKFIANuVh8KO2o4ULatHhVF9N2qbAmhZW2LIlaOF
	2R93HEoVs2TOaSgMLBCqOqwWGlATjaLuvecwTSGycNfGPxjMoinAJFmZxUNtOxk4WgY4BBGHi/a
	qhuTY/xY5UZtaWguvSAO9jv6K8BQCQGp9V9y9hscL13pD2Kfv3n4kWMj16j0BffXNq2WmWXZZQb
	Xwl5B7Ouz9+AadDevFNE7uYRKA8/5cFVzTSBee3ADT3NkqC07LAEPQOOCdZd+PAmXwkCj0heOW1
	JLh58rC15ii2BeTbm5D756xnPDdnQJD1xORo1QVuBpzVk6UZ/iXkoF/+U04RWdwPsVtAL1pcAvi
	nClfSogHZS4hAeDwC/3m6dxB5shCUECD844hDm8u/N/LkTsJ2aj8Tu20A/HP3fQn6yORRJU+MtX
	QK3g0LT/2lPy/OoG5S/ErD0Ia7DOmvHYEF8MYgzvK80H2RagLNsJyQHX2lP/2fvrHZW/0hFdUiO
	IvvKT0BjxdsMYd1Jg40x4ZzEr02AvoS9dFh1M6125QwBKynhf8894PvX5gTFwORtIV6Uhrf893t
	psI7BLI6qnEDncukU+jsB37ma6Kbbk8k9s9YHXilPAORM1Uhqrb/gJNqN
X-Received: by 2002:a05:6a00:290f:b0:8a3:df84:4c14 with SMTP id d2e1a72fcca58-8a9bee525bbmr10517197b3a.57.1793727606391;
        Tue, 03 Nov 2026 09:40:06 -0800 (PST)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada3d3603sm3435238b3a.37.2026.11.03.09.40.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 09:40:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Nov 2026 17:40:04 +0000
Message-Id: <DMLRD9KZPGMA.17182J5DEZ43B@gmail.com>
Cc: "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, "Linux Next
 Mailing List" <linux-next@vger.kernel.org>, "Qiliang Yuan"
 <odys.yuan@gmail.com>
Subject: Re: linux-next: manual merge of the bpf-next tree with the bpf tree
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Mark Brown" <broonie@kernel.org>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Eduard Zingerman" <eddyz87@gmail.com>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Alexei Starovoitov" <ast@kernel.org>,
 "Andrii Nakryiko" <andrii@kernel.org>, "bpf" <bpf@vger.kernel.org>,
 "Networking" <netdev@vger.kernel.org>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <aunq4v24N-Gzx_n3@sirena.org.uk>
In-Reply-To: <aunq4v24N-Gzx_n3@sirena.org.uk>

On Tue Nov 3, 2026 at 2:08 PM UTC, Mark Brown wrote:
> Hi all,
>
> Today's linux-next merge of the bpf-next tree got a conflict in:
>
>   kernel/bpf/fixups.c
>
> between commits:
>
>   ec274bb4665c2 ("bpf: One may_goto time slice per prog invocation")
>   1ddffb57b3623 ("bpf: Emit timed may_goto for JITed progs only")
>   1ddffb57b3623 ("bpf: Emit timed may_goto for JITed progs only")
>
> from the bpf tree and commit:
>
>   a7a767c66a2e2 ("bpf: Queue the rewrites of bpf_do_misc_fixups()")
>
> and likely others from the bpf-next tree.  Given the nature of the
> conflict and my total lack of familiarity with this code it seems
> vanishingly unlikely that I'd be able to do a sensible merge here,
> instead I will hold the bpf-next tree at the version from next-20261102.
> If someone could help me out with the merge here that would be very much
> appreciated.
>
> The conflict is:

Yep. It wasn't easy.
bpf tree is now ffwded and merged into bpf-next.
Conflict is resolved.

