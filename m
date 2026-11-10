Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336341;
	b=uw+UHrDqa91dsDWfxCyTv647pbhg3MXwNf7B1nS5namMcBh4czurykZ6S74zh4Krf75S
	 eIvCZLMLe6EIw1YklU214Rj5GoYnL6C3oLL5Crej0ApEsqhbVHm8IbQsY8+1qNS/fE/8Y
	 qMHi72MyxbJheLujTBrgA9Yi5y3KFQ2ZLG7gf/MF+4knV/SozB/grDCTvLz2Qx3hRQcc2
	 F/A9sMbFU+W/k6Plsg+8blFis8PE39E4DILUl/zkoVq+Wmrbe8op5LyHpA66Bj610OP2c
	 7cvPF9MTPqLTYBLJ37/NYSG6Yq9GGPJEumqgT8zoNuHRS4Cxs+9L1AzuDz+L5naG0rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336341;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-malware-bazaar;
	bh=cpJJtLOFz3P0sUNXeBfXN7xq2D+YajosRJqT3OCqsuc=;
	b=UThdqB2fPcY01UyN9nECaSUxHYCC6CKnytbv48IqvXnSYimU5j0iUvDFw6+22TX7uzUo
	 6IM6V6l9R6zfhu6Dx1Yevks+01eW4/OmbhtqJ6U2evfyuoE6DmfkDh+TDyk+VNyntINIy
	 L3zRrj0CiDJC1a0J6eEYqJYQ1WRcx+N8jVpHZAmYcurhpBPa1iDStR/bYEuSY+0tTQnCS
	 ow9GIcMZWjypZv57MRBiltOD/r0Yul8+x+6hcAJ6p61AJxAqaqlchiGH2VfKU84KlR/t4
	 7Iu5qrzmDMr4wsFuUEsPaWLyQM4LIFkOn7QNvAxKh5dar9cdzfYpJsnfXrj+dEkJz6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=Slj3uqmI;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BAA606B59C;
	Tue, 10 Nov 2026 18:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=Slj3uqmI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=cpJJtLOFz3P0sUNXeBfXN7xq2D+YajosRJqT3OCqsuc=;
	t=1794336341; x=1795545941; b=Slj3uqmIAbTI4eSiagxFmExG6UKKW+10G0QrwTNayHlvNu9
	phrTJcMdDwBQKlWhWxLSjWOKKNA9DbioT6lvpQO64vUSB8TMxIhbgN/ntyez0DZjm8b7N1/Y/TwwP
	FunE6UXqXAYaqQekzb0uLMMgANtZ6mHB/w+IemabRg47kRGPPoInO2qLMFrH8Lo1hNvgi0y36PMHQ
	zjOuMVbiKqs1lUMJ6jVUy9x603ONIcZxqqK/8k74DzellA4/3HYr/T5UAoPg26l8/UitxU4Y1kNM4
	4OlPEZiZPBRIo2Qx/FuzsMY9jBWrBB7M+lJK2k44EUiqmuv94Q1AMP75kDF1U8mg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xQqqf-00000002AOi-2Fue;
	Tue, 10 Nov 2026 19:45:38 +0100
Message-ID: <554491de8880420965217a37a7748d48622f1187.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v4 05/21] wifi: nl80211: define interfaces
 for SMD BSS Transition context transfer
From: Johannes Berg <johannes@sipsolutions.net>
To: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 10 Nov 2026 19:45:36 +0100
In-Reply-To: <20261106-smd-v4-5-62e39487f51a@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
	 <20261106-smd-v4-5-62e39487f51a@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Fri, 2026-11-06 at 13:28 +0530, Pooventhiran G wrote:
>=20
> +/**
> + * enum nl80211_smd_ctx_type - SMD Request Type values

This is more "ST request type" or something.

You're conflating "SMD" with "SMD transition" throughout, and the "BSS"
in the subject isn't really supposed to be there

> + * Used with %NL80211_ATTR_SMD_CTX_TYPE.
> + *
> + * @NL80211_SMD_CTX_TYPE_PREP: SMD BSS Transition (ST) Preparation.

(as here)

> + * @NL80211_SMD_CTX_TYPE_EXEC: ST Execution.
> + * @NUM_SMD_CTX_TYPES: internal.
> + * @NL80211_SMD_CTX_TYPE_MAX: Max type of ST context.
> + */
> +enum nl80211_smd_ctx_type {
> +	NL80211_SMD_CTX_TYPE_PREP,
> +	NL80211_SMD_CTX_TYPE_EXEC,
> +
> +	NUM_SMD_CTX_TYPES,
> +	NL80211_SMD_CTX_TYPE_MAX =3D NUM_SMD_CTX_TYPES - 1,
> +};
> +
> +/**
> + * enum nl80211_smd_ctx_ba_param - SMD Block Ack Context attributes
> + *
> + * @__NL80211_SMD_CTX_BA_ATTR_INVALID: Invalid attribute.
> + * @NL80211_SMD_CTX_BA_ATTR_BUFF_SIZE: Required (u16) BA buffer size.
> + * @NL80211_SMD_CTX_BA_ATTR_POLICY: Required (u8) BA policy.
> + * @NL80211_SMD_CTX_BA_ATTR_AMSDU_SUPPORT: Flag attribute to indicate
> + *	AMSDU support.
> + * @NL80211_SMD_CTX_BA_ATTR_TIMEOUT: Required (u16) Block Ack timeout.
> + * @NL80211_SMD_CTX_BA_ATTR_EXT_NO_FRAG: Flag attribute to indicate
> + *	fragmentation support.
> + * @NL80211_SMD_CTX_BA_ATTR_EXT_FRAG_LEVEL: Required (u8) HE fragmentati=
on
> + *	level.
> + * @NL80211_SMD_CTX_BA_ATTR_EXT_BUFF_SIZE: Required (u16) extended buffe=
r size.

Same here as in the other patch - splitting the buffer size into two
variables or attributes seems ridiculous.

> + * @NL80211_SMD_CTX_DL_ATTR_VALID_TID_BITMAP: Optional (u8) TIDs include=
d.

That doesn't really make sense, it just introduces a place where things
can drift - the per TID nested values below already implicitly say which
TIDs are valid.

> +/**
> + * enum nl80211_smd_ctx_ul - SMD Dynamic Context - UL direction

Right now I don't see a lot of value in splitting UL/DL attributes when
they're basically mostly the same - we can probably unify that into one
space and maybe have a few that are one direction or the other only?

johannes
