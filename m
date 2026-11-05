Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868663;
	b=dAV1sFdbIKIWZ9NYuBuBCSCxpJLWoJoa8bU6G3ENDRJnilJ5JB3eMtivVmbqVZ4AQRm7
	 3DOyzCwtPzIpK/jThU1veQo2xBJeIO4rMhgk45Gp2QNV1Wh9VssIsaD0KRbcZW7qomuQT
	 O1WGHOPg/MhV4PRIQFn5NZp3Mr+xXZhNcQqH+2nelY5nPgqSaQiELkq+spBrFvZhu4hM5
	 xSvMB6zqeHymbx35X82pBJcS/Zlnv8o8zbFwuMgFooLN1H5aVTFJB6kZ9f9DhC1rR3kIu
	 Mxk/o4Yv4t5XRvmqZspg4g0Cibaq81VvxKU4csn2rkTYfRvy4px140UE7ZywVPhxqTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868663;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:To:Cc:References:Subject:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=qIUynpX0Miyc9yNp73izXpbLq1Mbv/4Q9PTn6to/vjU=;
	b=Sm5kHy6RztRatgv+5LTtMzWcodJjnNTrbQP2kc0sn34Tl6PLDOZhKolw8BMZykVU40M2
	 rvceuyd+dVwdZQcpq4ncTeZo4ooh1iH4sy42iFrWx/LFR1HE+NmL3wOJhNrBrq7b554/O
	 EJ/oH4mLHISWpTXO/D1ZjuwSAxIAcqE+ZeHFXx4R3saNAvE/2l6BxBMf4+Hv9m6U1Qs/i
	 So3vJWJn+SWA2PF/lQYmoUfDzBM231i7lT8hiayQ/oMIKQvN+Z6AMAyA1mjX8CFYEd43e
	 CEzHJasIzZx2/zRt1etJlrqxofxSx1jyYKBUCL6hE4srxrBVEHniy0xv1BZVGMimtWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=ATuGsAku;
	arc=none smtp.remote-ip=212.227.17.12
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A71606A31B;
	Thu,  5 Nov 2026 08:51:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32A71606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=ATuGsAku
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1793868647; x=1794473447; i=markus.elfring@web.de;
	bh=qIUynpX0Miyc9yNp73izXpbLq1Mbv/4Q9PTn6to/vjU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ATuGsAkuMKvU2icn5ckNto5NRvdZmQifMEHiMKTgCVBS18VOb3E/YEY5nLZkwvDl
	 tKEqlBA03/bySi9uVVMehi9anTCBBZTcriF2+osvf05rOB2RCnJxOEUePhBVOheQ7
	 rwfMfcitmpHdUSs9mZrTRWAom9O3wRg2xzeA6LUC4EN3vt4afGDmjgwfmZYRzQ+6c
	 TACseBk8y/0T0R1bnUZZfWTKBPJLsFfbfxTt8hzWCgWoLwRKy3UlUcKzB3Htc8A+d
	 pIxQF5jmm9Y0SGV/3RYogHknFb4/8MrWuOJFOzQVBaxmb4cHIwsr5+pVfBZ5PsSkH
	 mfto80ZDefTU+6pbmg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MlsKH-1whsyy0d07-00io5m; Thu, 05
 Nov 2026 09:50:47 +0100
Message-ID: <4b391275-d424-4d2a-994f-6b5c650653ac@web.de>
Date: Thu, 5 Nov 2026 09:50:28 +0100
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
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 linux-doc@vger.kernel.org, workflows@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20261104171744.439209-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] docs: submitting-patches: Clarify half-baked review tags
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20261104171744.439209-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gxJ4Q4jA6GT1SS/w5xb7LIuD+Pf/mNSmvoQhAjZPSHbKnwWLnhU
 tILjZ83R1Nie/AL2YN489TAwsVGg0Rt9l2ojIeJfQu08pN8gB/D3M/vBnwltFf7GD+Hd2TP
 6RdnH01f4Yx7cxiKRsaujFtfqONrvQf50riLE+hQci5tCLfuMz5AG9uI9i/W0A8u7xUeOcv
 rjj2ToJuPDGBviVtA5DVg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:U8EvrJiCvVI=;W5/SwEKz/duI1GCCXs1ilZ+ipr0
 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

=E2=80=A6
> +++ b/Documentation/process/submitting-patches.rst
> @@ -585,6 +585,8 @@ serves to give credit to reviewers and to inform mai=
ntainers of the degree of
>  review which has been done on the patch.  Reviewed-by: tags, when suppl=
ied by
>  reviewers known to understand the subject area and to perform thorough =
reviews,
>  will normally increase the likelihood of your patch getting into the ke=
rnel.
> +If the reviewer checks only piece of the patch, leaving the rest unrevi=
ewed,
> +then more appropriately is Acked-by tag.
=E2=80=A6

Possible adjustment:
+an Acked-by tag is more appropriate then.

Regards,
Markus
