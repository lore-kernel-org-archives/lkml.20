Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794062265;
	b=co47yY7Jcccm+88VZdGW+ynUVITgt/KM4MIbhDnnQyz763EckJMwnUOLg3EhTE2/+sg7
	 +kkWxJwkIAkuaREZj87iRbkNEY83EmZFMeXdFtPOYX4yOnXIen7GNT6+E8S+ReqXvyY22
	 JB8SM16D77tk8TFFxPd5epbn9ctnNnBCQ8Kq/ICFy8zaE9cr1Ry17u0frR86WG+7yzcPg
	 cavFoJQY6p9kSqlHZ3JVxc7oSZqcw3TZr/ENsSTt8Ck0aZ4cgt0H/gZYDqXVwolpWh2nr
	 7YsoqZ004s6RyfJKDvw5PScqD4eCnXHSSGp3DfTUTLe24VEJ9yeSPvtJgO3oi4cDmEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794062265;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:To:Cc:References:Subject:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=dBINyUdlNsFPHX7dJ8CwfKOuxG26e6ksv+wZMPNlt/I=;
	b=K6ZMSFo3fUt1UtqSe2yAi89RJG+3+BdkYY9gOP5YzE3eGMSyjUgx4ROVnOuUzyVtZGgh
	 3zrmtLSNDvA8e7HnBGgBiBu4CJ9b7gG6K2cZEIpqmSRpA/k2AbECPQbs47gBqfvW8pkYF
	 kvCS5Pq7gTghlKPX9+lajcCNSUU45b27WB5Zw56Z4ZszCJ/CqtbLVXjCPCzU0/D138lmq
	 nzUyCru+IbOBjmOAzfDnCXT3icB+yRgeBv9RvLVKhRcApL0nOGesPmoWX3o5HzcWK5sIj
	 6MzbLHE++X/wrrvzS33dFZMFh8LUvHTDThdW8rDiUyuLuZBMN5tEXw82XV0BAuoJGrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b="jF2FyV7/";
	arc=none smtp.remote-ip=212.227.15.4
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A4660A2630
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 14:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70A4660A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=jF2FyV7/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1794062258; x=1794667058; i=markus.elfring@web.de;
	bh=dBINyUdlNsFPHX7dJ8CwfKOuxG26e6ksv+wZMPNlt/I=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=jF2FyV7/ms30pYsqjwvEltjandUXLHasMeAMkc1s6BYYRJ8E7CFFepd628NLUtJj
	 VLtHjni7XHIdS27Si6J8KYpddGzExVUSUGNQJzxPiEmvP/FljP/qxxCVl42c6jfVs
	 1GWtLIpY4WB/jzdEbaYzxRG+jTET0aqI+HWreADy7wBizBaaFH0FSlrbxLOrBQk9O
	 HuKRWKjcdvMk+BFR3Boe23IA/DxNd5dZaDtV/8X2GVUxawZ89xxLxLVKRc/m2zRgA
	 gWBF86oCH/q6XAYPuRNrV0mi0HplfaS6TSC+zKjmN2dJAMRm40EfkoIVo53TwMQp+
	 OAtMOp3YijUm4VZ0lA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M43KW-1xPhY22w0e-0010rm; Sat, 07
 Nov 2026 15:37:38 +0100
Message-ID: <a762db71-437e-48a6-9280-9bb43af76843@web.de>
Date: Sat, 7 Nov 2026 15:37:37 +0100
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
X-Provags-ID: V03:K1:aETFl4VGTiidH+bVnwE3sdwvgnqTIhfAFrzh96j4SGUiRuU+5+F
 F57X2kc0CB/3qcG6riAqNOPhZXZgz9l/A/eEA4IaYIg6bsH7Bl+htrGLxLJJqTfJWsK6jQz
 3lY/xJYTDtP+YcG82n4Iip7GbXS9dZmz6I+c9xNOtfSzYuIzD6+NqpAcGR+XRQxH+NKkTs0
 ghRmrhXGAK6oFcvFFturA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8Sz4mcQbQkw=;uwLnHwWb3I0vIIO0kGgGR19Dt1D
 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

=E2=80=A6
> +@allocdecl depends on org || report exists@
=E2=80=A6

How do you think about to avoid duplicate code by using another SmPL disju=
nction?

(T *x =3D fn@p(...);
|x =3D fn@p(...);
)


See also:
https://gitlab.inria.fr/coccinelle/coccinelle/-/blob/ea58efe355dea21842179=
54248a01f5dc5995d24/standard.iso#L465-489
https://github.com/coccinelle/coccinelle/blob/11b93adb6516a358a6687051e576=
2136666626e0/standard.iso#L465-L489

Regards,
Markus
