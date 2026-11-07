Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794058861;
	b=CN/JWUTNtVPA79jk5Fr2Ua2eRJtUKCPiREYGSF5YESpp2l811+MO77L5nygae7jH58ca
	 V0/SQ976VOCc6nSM9qQGdWJMELMW9OjV8V87/EiVqfuxRhm6mlBwBAXif0usooj4xGMYp
	 rKCYtc3pxWu9M7TQw4PLiUEJpFPuP0JomuMVVUG181K2ykljpOJKViXw4/4oBaFcD8UOS
	 GqdT/4reZSTgJnCZ30VcO1zwdDGYWNyK8nmPALiHSmxpnM6qSv0hcIugbYisHAmEDg+F2
	 dEmCgwjwJBzOKPms+VoDzKDWQBfc7jf3xc8LGWXQy4gxsHxaHbI2UUFfE5nalkyxkPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794058861;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:To:Cc:References:Subject:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=COksASPtim2reqsAachBbM80m9nkEvjOTM2iuax8eXU=;
	b=ZTW9ZveshmY1Mm51FsBii2fKPnxzLAcwFE9eIPrwHX8lQBMmy6MKJESOrptdv7WbL8Ml
	 X8GMClWL+vUEDhFe1bj3OJnxn+be4ITcnRk8cuIiAJ3BJOC98v9q8hoQv3vm3+lKLM7pW
	 v5h6YSZzaJCGcepqU8hsyPD9mOphsNznWq/3+BpBvths2zZNjHv85RurgOJd0s/jBJMr/
	 Wc0ZCGcOYlRJzB+LjOYxONDC6oyKiJf2sdtcP2ySIISPsAPAIdZbXcy/NutWcCWMYz2wJ
	 oGy2XUIj/QdFTN2Wed36rFag3QrEbyN+4jmoojj4M+Uf2TITJW55f6WXdL328pMlxTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=hKSBbSM6;
	arc=none smtp.remote-ip=212.227.15.4
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07420606A337
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07420606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=hKSBbSM6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1794058857; x=1794663657; i=markus.elfring@web.de;
	bh=COksASPtim2reqsAachBbM80m9nkEvjOTM2iuax8eXU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=hKSBbSM6TQlKGIx8+JJV9ez6BpGOF75M3/+K78799oKIQmPW2a8FOutENivsU2bW
	 rPCueft1CgT6osnvfurf0Xy5klUAcbgwso4rCDEhU4saxOFy856pPvB2+sSaMXmuR
	 Fa+T6pOgcpC1wc3lhV2qJBCEmDNjQ2ukvIEehWSgf9lW3YAMKBie2+F9fSDAnm5r2
	 cAwFq4HKAFTrQyDIq0pGlZHPLuOGUsGNsiPa/P73jH/Fhv85Z+OHSiBDFGFx1hS47
	 QAgetyy+N1VUyOrUWlPTvqwrK3QjYWN88Pqq05cmNMbSOQar20c4AyhvoZBBWLjMF
	 N4bArXaTizXk7dD7XA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N4NDG-1wOcDH3b9y-01142X; Sat, 07
 Nov 2026 14:40:57 +0100
Message-ID: <b5518744-4692-475c-8a78-9e6921a4fac8@web.de>
Date: Sat, 7 Nov 2026 14:40:56 +0100
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
To: Chad Aldreda <ca@modelmiser.com>, cocci@inria.fr
Cc: LKML <linux-kernel@vger.kernel.org>, Julia Lawall
 <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>
References: <20261106193517.3267013-2-ca@modelmiser.com>
Subject: Re: [PATCH] coccinelle: api: add a checker for device nodes in devm_
 memory
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20261106193517.3267013-2-ca@modelmiser.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nDQFFXPPe3wD74P5912HPkmA0aGGu92hbGid/Z4koJYeKfi/XQI
 cGkOdYyFVPuzWnw4TjN2meedYJsYc7QXmQh5pWv6F481T1hSYFs8851Zl5g3w/PZNMAHuh9
 ZQEgCD19LoGA6xFUoHwe3sVbhjlptTLS22luVsO+w7zAtCaIny/n1MIS84KL/HvJ8/1TCHU
 RuXn1tDUlzYrNJFc8N2gw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3fBXvbI1+Cg=;Px/a1AQmCsM/1VUtXuY0Uz6Rxvc
 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

=E2=80=A6
> +    coccilib.report.print_report(p[0], "WARNING: devm_ memory registere=
d at line %s as a device node or a v4l2_device; an open file outlives unbi=
nd" % q[0].line)
=E2=80=A6

How do you think about to use formatted string literals instead?
https://docs.python.org/3/reference/lexical_analysis.html#f-strings

Regards,
Markus
