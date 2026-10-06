Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AD853162F
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914164; cv=none; b=qpq00Kw1mRQBBCDeYqB+AcqoVKnr7SlCcKhNi1023QmLTtFn2tmNeEnQmYD/5Ph5FCcqgCQp72JQUkmo+sq9qgc6cEUoGoBdUJ1XDIMZoztZw9gYpLlr2+rPLQwUZcAiRBkWCE5Fo2aOO3QSUJktef8GDiuarak0ooCg1fYAHxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914164; c=relaxed/simple;
	bh=5FJ+3wqGyca59F2tJp+xdGv8275pCwy3K15hkzXRqdQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oJbKrfZU2sI53f/Nkt1d0WJX8slU6cJCNC2QqXOA90ntUutdji7+snIFnezNlZdpj0l3OlR3txXz0jDYkcZtACmLdYGHpsrjuOEi/quPmt6UiSBy9CjlPqRFf+PJbqd48bFHEgzMwKJaYiRH3aX//hEwQqFpOrnuleZHwaAwJMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UJ65X48i; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UJ65X48i"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 67382C653FD
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:56:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C4BE96075C
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:56:01 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id 5958711D718C7; Tue, 13 Oct 2026 19:49:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791914161; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=M6kf9WIEKxyalB1T8WRSaTSHcfDMs+UGbwv/Xr7lXgw=;
	b=UJ65X48i57ZepFSbwuSzdRtbOCog4RhsBZMgu3fwVYHn/ine4/WtN2mWrcicUD45P8/6sf
	i6a1zfIsUd+Q+ClK2uA6HZPN0ByN+yRKiD/qFFLSB+zGEOrAkTe41AjCdFukwFCbi7EweT
	3iH6beTnvvTyqKPWWm3r9IpAKwJ2+oHZlpHLz9DMCMcVVI3tSWMGtLuUuDnqTxF69p13+n
	gV/KoQrrt9m0xCdz5Q1MuUHNfhFzzLhUnvA7V3CUgagyJR2bmwn9taGMMukPRl1JEAAVPZ
	8oSet40eOQR3/bG5MDJsudyp0kwBMd/QT/BD26Rgxz5xeqSpSZ7BdgNMAIaxlw==
Authentication-Results: mail.galae.net;
	none
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Puranjay Mohan <puranjay@kernel.org>,  Jonathan Cameron
 <jic23@kernel.org>,  David Lechner <dlechner@baylibre.com>,  Nuno
 =?utf-8?Q?S=C3=A1?=
 <nuno.sa@analog.com>,  Andy Shevchenko <andy@kernel.org>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  linux-iio@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: iio: ti,tmp117: describe interrupts
 for TMP117
In-Reply-To: <20261005-add-tmp117-notif-v1-1-c6cef6fad64c@bootlin.com> (Thomas
	Bonnefille's message of "Mon, 05 Oct 2026 16:44:19 +0200")
References: <20261005-add-tmp117-notif-v1-0-c6cef6fad64c@bootlin.com>
	<20261005-add-tmp117-notif-v1-1-c6cef6fad64c@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 06 Oct 2026 16:02:42 +0200
Message-ID: <871pa3hqpp.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: y34SyqK1LxEe
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 5958711D718C7
X-Spamd-Result: default: False [0.03 / 30.00];
	BAYES_HAM(-2.37)[90.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[171];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_ZERO(0.00)[0];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	BCC(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	URIBL_BLOCKED(0.00)[bootlin.com:mid,bootlin.com:email,localhost:rdns,localhost:helo];
	TO_DN_SOME(0.00)[]

On 05/10/2026 at 16:44:19 +02, Thomas Bonnefille <thomas.bonnefille@bootlin=
.com> wrote:

> The TMP117 can send alerts when the temperature crosses a low or high
> limit. This triggers an interrupt on the ALERT pin.
>
> Add the optional interrupts property.
>
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---
>  Documentation/devicetree/bindings/iio/temperature/ti,tmp117.yaml | 9 +++=
++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/iio/temperature/ti,tmp117.=
yaml b/Documentation/devicetree/bindings/iio/temperature/ti,tmp117.yaml
> index 7fb3e68207919..68ee936722ded 100644
> --- a/Documentation/devicetree/bindings/iio/temperature/ti,tmp117.yaml
> +++ b/Documentation/devicetree/bindings/iio/temperature/ti,tmp117.yaml
> @@ -30,6 +30,11 @@ properties:
>    reg:
>      maxItems: 1
>=20=20
> +  interrupts:
> +    description: |

You don't need      ^ this, it's for keeping some kind of
formatting. You have a single line, so you don't care.

Thanks,
Miqu=C3=A8l
