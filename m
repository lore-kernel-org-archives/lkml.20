Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794313340;
	b=iOcOCIjvDi4wiuLp8KqTTwRMpv6TN6xc3mlqGjPbVcOgYQCWOChQJ3ZMXqss7kqdkp4e
	 agb9U4woQLCo6P4sFbwR93oJBXKpU48lZpuRNE9z1elASWuWE/jQusonpyWwv22BtRGkp
	 xyKdSEJe9Qi8UCh6a4Y1UOdAbnfwDiothBfL6TJWNtc0Y4umG4xXKosFtFDxlp9Y9cYk1
	 IjSKzBhbd9wW3wYGOvKAFe0cPwdXHWxmkaTEMb5IqocSOx8bVKq4PSHkHBiagcAkcc6YI
	 Mq+ADHwyko7bIrDEGWzVgJvMKontaaJn2g1l4mCNs8cd1mGsF161NG8Wc1vLKDHU8gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313340;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:To:Cc:References:Subject:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=22fHXeK+Ich86eAWgLUFd2iy0kgFnrfzFK4AnihzWS0=;
	b=CB5paNUmdTQMkzCIHOW+2fgLuU2cFEF8Hf1z227ZmrhYWRT4aj969Uoqh5/z6D9AylI0
	 8g1wbNZILrVsVcQobxHNDhdyhi7W8DLhAUHYS9E8EfNSygniYJnjUhqcLVOIDULHcLmVd
	 p+HXvmL755fur/UprDcpZdZs1flnfq9+wjNItuMHYRPfspPFJF4w4gCDpkxEp357Ctq8T
	 qpO/Lcg/iFXjJ3wbuAJs2PnhQruHx8W0r1R0jXmquHrMb67r5um2jxObBkl+eRWkoJ3Mf
	 7s45WJxFsswic6rBXnvi6oKlG70D5VhnvbJTWSerO7ICTSk+HBXClopLkphUs/l75sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=LtFoqj5h;
	arc=none smtp.remote-ip=212.227.15.4
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5243606A31C;
	Tue, 10 Nov 2026 12:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5243606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=LtFoqj5h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1794313323; x=1794918123; i=markus.elfring@web.de;
	bh=22fHXeK+Ich86eAWgLUFd2iy0kgFnrfzFK4AnihzWS0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=LtFoqj5hGF9dFgLT37lt2zL8559XxLVyaUtcx6up2fsBVPpTTbDr52mlV7q2El8y
	 m1cVXbrxFMKO9DS1Mvs18lGMv/35d8ce0AVby6/uSYsA6SY9Hewon1yGIwzolBY76
	 b35ZuZhWFEqLoTtGjka8/j07ZyyyrxvD6B9aF9Uo8k3YmAsn6aZURe8vUc21Huc6l
	 y/uXkICkhTeZ3Tc2vVV+pGDJkc0X0TL1iYT3hWYy26A4QGpbsCE7kXd5HQBsLGx8r
	 LK3ZqdljAfc1yC4PpsExdeJpBn6XgmSR71Sz1mRdgHSWwLTQDNxerXXVm8NtPvPUW
	 KTfFVHuSOXrOLY2vhQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N7gXO-1wMT9d1K6s-00tTEc; Tue, 10
 Nov 2026 13:22:03 +0100
Message-ID: <a0b9693e-2a6d-474d-b178-3bbd098a69d2@web.de>
Date: Tue, 10 Nov 2026 13:21:33 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tuo Li <islituo@gmail.com>, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20261110090343.1245744-1-islituo@gmail.com>
Subject: Re: [PATCH] media: dvb-bt8xx: Fix potential double-free in
 frontend_init
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20261110090343.1245744-1-islituo@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:q/C0eHMTfCmj7MShhT6czIQdEfuxck2zsgs/6NQhM+rXC0oXGKD
 g720BqqYcPYbuJYW5rxC7RO0FmrNXG1tYZgEqafgcL9QUAmpQ06oYlrns+uUB8besfok1s3
 f7rOck+gf8zjqBBU/Sa3Lj9glDsqcZHilw+p/PO7wH3HKWGhLWRu71ibdNjdI6E5fIvsnxN
 D6DtN3goVlRxBIMNRR+zg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cWDPoaZA3bY=;spHjW8GYyaEIUqK9WI0VrZBenDm
 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

=E2=80=A6
> Remove the redundant kfree() calls from dst_attach() to avoid
> double-freeing the state on failure paths. This keeps ownership with the
> caller until a successful attachment transfers it to the frontend.

How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv7.4-rc2#n145
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/stable-kernel-rules.rst?h=3Dv7.4-rc2#n34


Would the specification =E2=80=9Cdst_attach()=E2=80=9D be more appropriate=
 in the summary phrase
instead of =E2=80=9Cfrontend_init=E2=80=9D?
https://elixir.bootlin.com/linux/v7.3.1/source/drivers/media/pci/bt8xx/dst=
.c#L1693-L1723

Regards,
Markus
