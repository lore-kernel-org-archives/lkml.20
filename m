Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794142464;
	b=hMYjRLHYfLAx+6Hp6GsBS7JCni7uQLoeUDYh8zSmQWDvCC+oY3o8RA6/xoOhKVq35MND
	 Z3hZt9gNthJe5VJPBY3MfKnnuLfsAcr6X7VwI+jnbeI5LdVEUGUd4jHTPTdKK8LYW3Ejo
	 Jkej2UO26Qjltn+l5D13Ncp8uS8x6MTnPTBck917ZkwavWEupQTx4Spjxg9aoT306aa/g
	 V4hR3BI7Nxb8rQvD5LSWsm3Yl2oLebv3dF334abZyTeXOrEl3TVbUlRfMwwTEST1Ri1eF
	 pFiN5VljYP8w8PiIm3h/8Rr9VCQgJg5qVh9unSqUzTkbiRVkkjdASCe2oUV1Jgt4jIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794142464;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=vd+Z3vrrpLkt6u4mXKHz+DlhTxBkA17cRmDQo5h223E=;
	b=0hKaEMI6JIQOeO/+lPmfn9JqJLce72SwlEL0BUrEclAe2e5LxDSM+qF6VhbQtWKzd2TF
	 B7FaXEWmzqzRJbR1CF0qcgC+4gSRpo/g7VlAwqiXvl9g1Ryh0tzfP7Y+jvOe5dGChmEVu
	 gXndYzGBAxB76H+Aq5ROTT2O2o/fijuCQZ+bh4IJUe0ctA3QcWcKkiKzcTI0UGG0LtNdN
	 1ShsZq91vMBfC1ycKbRM4ZgRhIp2oJBUUTqxmYyL+NqPLCRMr1GZ/UZhbp7MrjxPoQpim
	 7HXDJY+vA1pnE33JgVpnt0zdg681Zk8eWutdVGbQE0AG+o27CqqMneMCpYbUqcny1Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CLPkB7s5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBC6606A322;
	Sun,  8 Nov 2026 12:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CLPkB7s5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA6841F008A1;
	Sun,  8 Nov 2026 12:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794142463;
	bh=vd+Z3vrrpLkt6u4mXKHz+DlhTxBkA17cRmDQo5h223E=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=CLPkB7s5n7m/gzX8F9ip745FIGgn05IizUp77hyic6NZRR9DKupjmvL58iC06twpj
	 9wWKbY7OuzAFhy9/mL4P2QA6RE1IIbbz+wiL3VAQatEPoRPMwEF4LPyd2rMumRfvov
	 a3dxHNQkPXSXhyRGwbAMljXTgkIIouHrxCx5RMKkrlMmhgmhPzNm6IkQ4NHd91lxki
	 dC1AFxXzpo1fdZTq0KMSmsaI1Goh5JNGppiZF7EfQdlvmjVRFl1xHqnpi5mgTrMBUb
	 CAPi3PbvnwOwi1r/BeFeRQ+R9N6gqHAQ7IPkslMewvmShVNq6CZHiNSrEj8yQB243T
	 Q0VKRhZNHC79Q==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 22E292C5FB64;
	Sun, 08 Nov 2026 12:54:21 +0000 (GMT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/4] ASoC: arizona: always parse device properties
 regardless of platform data
From: Mark Brown <broonie@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, Lee Jones <lee@kernel.org>, 
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev
In-Reply-To: <20261105-arizona-asoc-v1-2-25ec7338446e@gmail.com>
References: <20261105-arizona-asoc-v1-0-25ec7338446e@gmail.com>
 <20261105-arizona-asoc-v1-2-25ec7338446e@gmail.com>
Date: Sun, 08 Nov 2026 12:54:20 +0000
Message-Id: <179414246010.3630016.7821414370886873553.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=718; i=broonie@kernel.org;
 h=from:subject:message-id; bh=jratIdgZGKMpYCQ5KW/IK2PJzXOICNrWFYpFpvSpgzk=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+FPyZnbb6u5bIHWfeLyzVTKUqj6Jlfj1x3ZegzPCSY
 8G75h/BHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZiIxC6Gf4YfHl0RCEji7GmR
 27fA4GdU7rW1+bdbUib7vNtRsuTBEV5GhoXfhFWUZr4RfCyQ7Nl1ouicRo7mZNvoaMGY/FrvOUw
 fWQE=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> Always parse device properties in the Arizona jack detection driver and
> codec drivers even when platform data is provided, allowing DT, ACPI,
> or software node properties to augment platform data configurations.

> @@ -1184,7 +1184,7 @@ static int arizona_extcon_device_get_pdata(struct device *dev,
>  					   struct arizona *arizona)
>  {
>  	struct arizona_pdata *pdata = &arizona->pdata;
> -	unsigned int val = ARIZONA_ACCDET_MODE_HPL;
> +	unsigned int val = pdata->hpdet_channel ?: ARIZONA_ACCDET_MODE_HPL;

This changes the default from ARIZONA_ACCDET_MODE_MIC to
ARIZONA_ACCDET_MODE_HPL, and might be clearer if written using a normal
logic statement.

-- 
Mark Brown <broonie@kernel.org>
