Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883182;
	b=jAJAW5bKGRnkZchBw/6LvxxjdWIvDwIveg/u7gFrxAlhgS26lhFijIbEYvRWlB98yE7T
	 Cix+SorY4rpfHbFXu2Lc9LzwiTV094jZ5GxNW6UZWpxBQddoqYMHEhlPkojuRRGphBtv4
	 VD8+Ngg/IdeA6qfiTNq0jPtllORhPN0DZXaYE0CkVOxIX67su/TCxZx2Kj/2RDqh1+Ic3
	 6KxWpLMf7Tfl9uwNzxJKPj5wyOBpplC3ZEME79mspTEBK+IDMyVc6RPfIRRirxVn0ieRm
	 pbQAGYTVc9Fqc4IuhNa0wFYna6Pd6+gAoZEag91zWX2xJ6T8J/tsr2erxWN4eo2PsYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883182;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=OzfYUMyey/FScz1aon6YZWxpNOlI3r88qT6df+SLrMA=;
	b=1V7bSY4COI61XQQAzKAEtf+4UHUIe8u49+LT2c7wJraH9p7E2Thg0yGI0fdNj4IsvBaU
	 TTUTW8qSWFC20SjEZfl8UVUVTMznnEHBlK9vVHssDArqs/IYA10Nla37pR04Uu8edQKgx
	 CsuupERP8kIFcJvbyUPCbDF36xuA2MNPJNiW/mJI5YUHzgn0Pnyg0ZnccR8PZo3ARpjCT
	 5URM+pKwnQcBYAOK9EiVYsoXxYtbljct1KlxijqozCaq2i0FDjqdwdQEiuIJwOZSoaLp7
	 qVOX2TmVtGst8pCFCyXu6hmCDz5vo+Yp1PQBFLmAseIzXNvT/U7LY/MfK1bdYti58nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=logarcheon.com;
	spf=pass smtp.mailfrom=logarcheon.com;
	dkim=pass header.d=logarcheon.com header.i=@logarcheon.com header.a=rsa-sha256 header.s=protonmail3 header.b=Bdr2XUte;
	arc=none smtp.remote-ip=109.224.244.21
Received: from mail-24421.protonmail.ch (mail-24421.protonmail.ch [109.224.244.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAE1606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FAE1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=logarcheon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=logarcheon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=logarcheon.com header.i=@logarcheon.com header.a=rsa-sha256 header.s=protonmail3 header.b=Bdr2XUte
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=logarcheon.com;
	s=protonmail3; t=1794883179; x=1795142379;
	bh=OzfYUMyey/FScz1aon6YZWxpNOlI3r88qT6df+SLrMA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Bdr2XUte381gv0Y8kScOyRvPmF9HJ4M5mST8UkujnM2fn0yAWSufT1V+QPjmpsUpn
	 d2aoo50VDW/bzPgd7rsbVjrXuP+Yz91TIwPRYRSDPOBQl9cHM4E4VujbbmWnB1O+Ay
	 gLndlY+oeS3HbPp+2dpBZTB02GrlmPVIUawdVNAayRrBSyMdaV+oGQjnwvjXGmCVWi
	 1A5knEKs7+WtjtaLM285HulFr3YYeoV3wf6R/fyJ4BpUA2upPwOGadfFhKlbfqKWNr
	 k2Md1tb1DkgiwwiZLA9UKYEajyUoGsiU8SjTkS2qqBPlvswn+fZxr2O5AsTQAqSo74
	 X7KlRHu8aPXnw==
Date: Tue, 17 Nov 2026 02:39:37 +0000
To: Jarkko Sakkinen <jarkko@kernel.org>
From: =?utf-8?Q?William_Chuang=2C_Founder_=E2=80=93_Logarcheon?= <founder@logarcheon.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org, kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] lib/asn1_decoder: add KUnit test suite
Message-ID: <wzMUBnLl6Z2s-eoaXFHCl92wV6voRbr7imPSy9hdJzHqoxg3869_lCqHtMa3G5N3H0G9XfrGCW9Nzw0Vm0HCJhvNKkTUtUFDXuM7S821AIU=@logarcheon.com>
In-Reply-To: <avuumVbCS2YQi4cv@kernel.org>
References: <20261117001711.47722-1-founder@logarcheon.com> <avuumVbCS2YQi4cv@kernel.org>
Feedback-ID: 145408520:user:proton
X-Pm-Message-ID: 95d52485a327c6c9beb9564b8767522d47800232
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Fair questions.

Why at all: asn1_ber_decoder() parses untrusted ASN.1 BER/DER input. X.509 =
certificates (keyrings) and PKCS#7 signatures (module signing) both go thro=
ugh it, and it has had a length-validation bug of this kind before =
=E2=80=94 CVE-2016-0758, in asn1_find_indefinite_length().=20
Scope: the suite checks that malformed and truncated input is rejected rath=
er than over-read, in the cases it exercises. It does not reproduce that CV=
E or prove the decoder memory-safe. That it isn=E2=80=99t vacuous: I weaken=
ed one bounds check in asn1_decoder.c to allow a short over-read. asn1_test=
_truncated_content then fails its return-value check =E2=80=94 the decoder =
accepts a truncated SEQUENCE (returns 0 instead of -EBADMSG). The other 12 =
cases pass; reverting restores 13/13.

Why KUnit: it exercises the in-kernel decoder directly, with no
userspace harness, and the cases can also run under KASAN/UBSAN
(verified in my config). It is deterministic and is not built into producti=
on kernels.

Why in-kernel: the coverage travels with the code. An out-of-tree test does=
 not run when someone changes lib/asn1_decoder.c.

I agree the maintenance has to be justified by the coverage. If the current=
 cases are too thin to carry, I=E2=80=99m happy to strengthen or narrow the=
m on your feedback.

Thanks,
William



On Monday, November 16th, 2026 at 6:32 PM, Jarkko Sakkinen <jarkko@kernel.o=
rg> wrote:

> On Tue, Nov 17, 2026 at 12:17:17AM +0000, William Chuang wrote:
> > Add a KUnit test suite for the ASN.1 BER/DER decoder in
> > lib/asn1_decoder.c.  A tiny two-field grammar (SEQUENCE { INTEGER,
> > OCTET STRING }) drives asn1_ber_decoder() with well-formed and
> > malformed byte strings and checks that valid input is parsed and each
> > class of malformed input is rejected with the documented error code
> > rather than over-read.
>
> 1. I'm not convinced. Why overall?
> 2. Why KUnit?
> 3. Why host the test in kernel?
>
> Br, Jarkko
>
