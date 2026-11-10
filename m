Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336721;
	b=BSTNpNr0T/NspRPe6z4coQ9TLaSCQ2wMzaHKgwGGdQCPaiczF0a8TwqHt6UREjlzr8qE
	 7NAzyPlBDS8wQnJiMRqTLLsYn851WR6U/tx60fGv9495atBD/Lwn6eB+A+ZK+jtQXJNjN
	 PGfTlF99ZvcfKcR9XIXmZXLgQ4XaQ27I2kj4ufdbPl7KgyxsmAKcIQW+2611f/I1g3QEB
	 wyuW4TdycX2yFkk+SmvTrG+qrbbimb0Dk1nhQRQlQVvk8msMEGIJgRqv9UGRHRtntshaK
	 IURqbVJ4+xU7NTQ/Kx5n6EPvLJvkI7PCYbK6hsZqiUK+KISt7m3++EiEsq3F0YGPb/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336721;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-malware-bazaar;
	bh=FJhCO8KljoIPpc6Zj3JtJwQyirJf6h7Glr5VpdrX2ng=;
	b=LDyY/RvYMIWrkaGbuDIcyEdpEWKvdrelWmznB0E5qnrsdlExm6xh2LwmgUiv3arRecJ2
	 6jnGBVovd+ygz18iBvPcNSnCLVNdmV6sGREwYzeWq2RFuV0N5PlYxJkB+TIsCF5v7va4/
	 RANVv4BvfHR8YpHChtmSf0tdk0iZ80HNPm4oc0+8/GqNxbEcVaB9qF7ZH4PSIytXDVoUu
	 V+wsKvu/Xn88D0cBgiI7JRUr/o0fCAsW7+cUj9t3W1n4G13m8jt1JEtiH+6VR2Mx/N7a+
	 dvfWZVeFuOgJiUjHfrs46k/zitZyQCcvw95KKwahVeFB0u2abvlqM95vCT1VzPePt7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=aHTpABXf;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB45606A330;
	Tue, 10 Nov 2026 18:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=aHTpABXf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=FJhCO8KljoIPpc6Zj3JtJwQyirJf6h7Glr5VpdrX2ng=;
	t=1794336720; x=1795546320; b=aHTpABXf7TWrbzVl/sbC5Ye1PEKHMPiIj8RMVi1WWVcER9m
	gTU3WRJwIKuhvGakSv0jx5Zz+464V2xqjD5sUAMJ1wkhcxMeX7HpRASXPilPlrKh1zBvuQhEoL2uT
	/6qP8SkR6E8ESDqpVTdZPgVdQE/bmAXu44+RelkuwIQ7Z1GivjRCfcOg6kY/xVMcUZlJh1Z4nUiLF
	7naxmYeLESKR+pBmvykQFENz97c3PW8fY4PlYVZEtJOinw/5Nsd37CjDJ6XGB20BIbb65mJ8FH+QK
	Y8mQ1MRVGzIR5ZqvtKq+FeywKMLTE6oFE//fLPTKKgfGKYL3fpUp9Rs/exhjlg4A==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xQqwn-00000002At6-2ADl;
	Tue, 10 Nov 2026 19:51:57 +0100
Message-ID: <db523e851beda07c6f52f3c094b5ea2bf718af03.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v4 08/21] wifi: nl80211/cfg80211: pack SMD
 dynamic context along with frame
From: Johannes Berg <johannes@sipsolutions.net>
To: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 10 Nov 2026 19:51:55 +0100
In-Reply-To: <20261106-smd-v4-8-62e39487f51a@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
	 <20261106-smd-v4-8-62e39487f51a@oss.qualcomm.com>
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
> +static size_t _nl80211_smd_ctx_nl_ba_param_size(u8 n_tids, bool dl)
> +{
> +	size_t n =3D 0;
> +
> +	n +=3D nla_total_size(0); /* ba_params nest header */
> +	n +=3D n_tids * (nla_total_size(0) + /* tid nest header */
> +		       nla_total_size(sizeof(u16)) + /* buff_size */
> +		       nla_total_size(sizeof(u8)) + /* policy */
> +		       nla_total_size(0) + /* amsdu_support */
> +		       nla_total_size(sizeof(u16)) + /* timeout */
> +		       nla_total_size(0) + /* ext_no_frag */
> +		       nla_total_size(sizeof(u8)) + /* ext_frag_lvl */
> +		       nla_total_size(sizeof(u16))); /* ext_buff_size */
> +
> +	if (dl)
> +		n +=3D n_tids * nla_total_size(sizeof(u16)); /* winstarto */
> +
> +	return n;
> +}
> +
> +static size_t
> +nl80211_smd_ctx_nl_size(struct cfg80211_smd_transition_info *st_info)
> +{
> +	const struct ieee80211_smd_ctx *ctx =3D st_info->ctx;
> +	int n_dl_tids =3D 0, n_ul_tids =3D 0;
> +	u8 pn_len =3D ctx->pn_len;
> +	size_t n =3D 0;
> +
> +	/* count valid TIDs */
> +	n_dl_tids =3D hweight8(ctx->dl.valid_tid_bmap);
> +	n_ul_tids =3D hweight8(ctx->ul.valid_tid_bmap);
> +
> +	n +=3D nla_total_size(sizeof(u8)); /* ST type */
> +
> +	/* outer NL80211_ATTR_SMD_CTX nest */
> +	n +=3D nla_total_size(0); /* nest header */
> +
> +	/* DL nest */
> +	n +=3D nla_total_size(0); /* DL nest header */
> +
> +	n +=3D nla_total_size(sizeof(u8)); /* valid_tid_bitmap */
> +
> +	if (ctx->dl_sn_valid) {
> +		n +=3D nla_total_size(0); /* DL SN nest header */
> +		n +=3D n_dl_tids * nla_total_size(sizeof(u16)); /* DL SN */
> +		if (ctx->mgmt_tid_valid)
> +			n +=3D nla_total_size(sizeof(u16)); /* DL mgmt_sn */
> +	}
> +
> +	if (ctx->pn_valid)
> +		n +=3D nla_total_size(pn_len); /* DL PN */
> +
> +	if (ctx->ba_params_valid)
> +		n +=3D _nl80211_smd_ctx_nl_ba_param_size(n_dl_tids, true); /* DL BA */
> +
> +	/* UL nest */
> +	n +=3D nla_total_size(0); /* UL nest header */
> +
> +	n +=3D nla_total_size(sizeof(u8)); /* valid_tid_bitmap */
> +
> +	if (ctx->ul_sn_valid) {
> +		n +=3D nla_total_size(0); /* UL SN nest header */
> +		n +=3D n_ul_tids * nla_total_size(sizeof(u16)); /* UL SN */
> +		if (ctx->mgmt_tid_valid)
> +			n +=3D nla_total_size(sizeof(u16)); /* UL mgmt_sn */
> +	}
> +
> +	if (ctx->pn_valid) {
> +		n +=3D nla_total_size(0); /* UL PN nest header */
> +		n +=3D n_ul_tids * nla_total_size(pn_len); /* UL PN */
> +		if (ctx->mgmt_tid_valid)
> +			n +=3D nla_total_size(pn_len); /* UL mgmt_pn */
> +	}
> +
> +	if (ctx->ba_params_valid)
> +		n +=3D _nl80211_smd_ctx_nl_ba_param_size(n_ul_tids, false); /* UL BA *=
/
> +
> +	return n;
> +}

This kind of code is just crazy LLM output ... we can just have a sane
upper bound and make that a single line of code? Nobody will really care
about the precise size of the allocation.

> +static int
> +nl80211_put_smd_ctx_ba_params(struct sk_buff *msg,
> +			      const unsigned long *tid_bmap,
> +			      const struct ieee80211_smd_ctx_ba *ba_tids,
> +			      bool dl)
> +{
> +	u32 ba_params_attr =3D NL80211_SMD_CTX_DL_ATTR_BA_PARAMS;
> +	struct nlattr *dl_ul_ba =3D NULL, *tid_ba =3D NULL;

nope.

> +	u8 tid;
> +
> +	if (!dl)
> +		ba_params_attr =3D NL80211_SMD_CTX_UL_ATTR_BA_PARAMS;
> +
> +	dl_ul_ba =3D nla_nest_start(msg, ba_params_attr);
> +	if (!dl_ul_ba)
> +		return -ENOBUFS;
> +
> +	for_each_set_bit(tid, tid_bmap, IEEE80211_SMD_CTX_NUM_TIDS) {
> +		const struct ieee80211_smd_ctx_ba *ba =3D &ba_tids[tid];
> +
> +		tid_ba =3D nla_nest_start(msg, tid + 1);

that can also be declared in the loop

> +static int nl80211_put_smd_ctx(struct sk_buff *msg,
> +			       struct cfg80211_smd_transition_info *st_info)
> +{
> +	struct nlattr *dl_sn =3D NULL, *ul_sn =3D NULL, *ul_pn =3D NULL;
> +	struct nlattr *smd_ctx =3D NULL, *dl =3D NULL, *ul =3D NULL;
> +	const struct ieee80211_smd_ctx *ctx;
> +	unsigned long dl_tid_bmap =3D 0, ul_tid_bmap =3D 0;

same here, what's with all the pointless =3D0/=3DNULL?

and move variables into the inner code blocks too

> +	pn_valid =3D (ctx->pn_len && ctx->pn_len <=3D IEEE80211_SMD_CTX_MAX_PN_=
LEN &&
> +		    ctx->pn_valid);

useless parentheses, but anyway you don't need pn_len or the max, or the
pn_valid even since it's always transferred ...

> +nla_fail_ul:
> +	nla_nest_cancel(msg, ul);
> +
> +nla_fail_dl:
> +	nla_nest_cancel(msg, dl);
> +
> +nla_fail:
> +	nla_nest_cancel(msg, smd_ctx);
> +	return -EINVAL;

crazy LLMs again? You obviously don't need to have nested cancel to get
rid of the whole thing ... probably don't need it at all because you're
just going to free the skb.

johannes
