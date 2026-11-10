Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342574;
	b=wFJT5rBmB5QptPNw1LxoRCBbyv4MqCwlstKG+i9jZ1xnNil5xIDBYGvSF84ajzGZZFd2
	 tlTk8uklo6F9qB44hNFjab41vKm0uLmt0W8y1BAJos4VF72R2NyEUINkWl2Yewj/83sL6
	 s5vzRqRcP1EfbOd77sUPoEEAFkEj98ODAU1iMqjuAkSbF2eRDmlA/4Ezljo+LL3k4CUKy
	 Xp2DWzNnIQCL3TuC33EsafLcq+NW23F2cH86guvJE9wPnVAGxq3P+JO/dVBsrtisSCmh+
	 YZVJ/l9G+DJPhnB6i9UwFWaUIxb2OL0xnYGhOBj954ixHDTTwABtdrvC1Eq2rL003Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342574;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-malware-bazaar;
	bh=Fk8LXHs8N79M/Gb/tHOLTac2s+kdfo9IKr/YpYoWCAM=;
	b=rCWXnVtfw9rBeKxTqTplk4BpMAqYiJALFp2u+YpGWYmFRpLFlusWN3qeLTomqM4BXwNe
	 FR4JOiKYvmGfRUvemAFoUCZ3BV/Rs0hYBLoHgnVQCb6eKzEoombW7+NsRfUYkEpFjEUN0
	 OIFePkJ9KdyD/oMdJ9krVePDznteyN39xmzia5ik3AvWY4moPEI/ztZCjxSyq4qE65+Gy
	 TEIxjBuNx3VpGVStCFI+sF66Zw3s4I/Az5cfwx9dJMU9GTQDu/wrYDbjxpqrFZgx9xEaC
	 79ADXti/wvjPCRGceRUzXZQqnAyPJ/iQW9MHXgzeU1lIaAp7Yx6RWhDDEj88mrGnVpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=ifjBbS6T;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D948606A31C;
	Tue, 10 Nov 2026 20:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=ifjBbS6T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=Fk8LXHs8N79M/Gb/tHOLTac2s+kdfo9IKr/YpYoWCAM=;
	t=1794342573; x=1795552173; b=ifjBbS6T0LKTwJsTTmdUKVCoCMejBifaDxuHs16CwJLWq71
	d7qgrt0fmiFYFMXC/7QgRHz1O4wqb2rt4vrUBsoMVtAVxIVFwDP/jGmMoqdcfJd1GIRst2Mau2PnQ
	aiy2f85x6r0S3G9qvg9r6WOXvmJWq6f4QfrnJd2lFLMjvHWwWsm1r9ueuc6YCOEpedIFqRO4OEfNH
	7S11/sfr1Z+vUyurTMouW7DKWbpGYyePoSW8Cql5c1dm1MWLSBifcOfXt2pxJ+td9PBdS8yrpjqhF
	zONtDydMh/CPtppJ/6uR+gBDDBPokW1WdTrffk9Fxi1yEx2BGohIWgTVmovTz1bA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xQsTC-00000002IwI-2Cdq;
	Tue, 10 Nov 2026 21:29:30 +0100
Message-ID: <f4164ec832b8dab5da90ddccc527ddcae74a44c3.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v4 13/21] wifi: mac80211: apply SMD BSS
 Transition STA sub-states
From: Johannes Berg <johannes@sipsolutions.net>
To: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 10 Nov 2026 21:29:29 +0100
In-Reply-To: <20261106-smd-v4-13-62e39487f51a@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
	 <20261106-smd-v4-13-62e39487f51a@oss.qualcomm.com>
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
> +static int sta_apply_smd_state_flags(struct sta_info *sta,
> +				     u32 mask, u32 set)
> +{
> +	bool smd_prep_target, smd_exec_current, smd_dl_drain;
> +	u32 expected_mask =3D BIT(NL80211_STA_FLAG_SMD_PREP_TARGET) |
> +			    BIT(NL80211_STA_FLAG_SMD_EXEC_CURRENT) |
> +			    BIT(NL80211_STA_FLAG_SMD_DL_DRAIN);
> +	u32 smd_flags;
> +
> +	if (!(mask & expected_mask))
> +		return 0;

Not sure I'd call that "expected", it's more like "relevant" (for this
function)?

> +	smd_flags =3D mask & expected_mask & set;
> +	if (WARN_ON(hweight32(smd_flags) > 1))
> +		return -EINVAL;

WARN? Isn't that potentially reachable from userspace?

> +	smd_prep_target =3D
> +		!!(smd_flags & BIT(NL80211_STA_FLAG_SMD_PREP_TARGET));
> +	smd_exec_current =3D
> +		!!(smd_flags & BIT(NL80211_STA_FLAG_SMD_EXEC_CURRENT));
> +	smd_dl_drain =3D
> +		!!(smd_flags & BIT(NL80211_STA_FLAG_SMD_DL_DRAIN));

bool, so you don't need the !!

> +
> +	if (!test_sta_flag(sta, WLAN_STA_AUTHORIZED) &&
> +	    (smd_exec_current || smd_dl_drain))
> +		return -EINVAL;
> +
> +	if (smd_prep_target) {
> +		clear_sta_flag(sta, WLAN_STA_SMD_EXEC_CURRENT);
> +		clear_sta_flag(sta, WLAN_STA_SMD_DL_DRAIN);
> +		set_sta_flag(sta, WLAN_STA_SMD_PREP_TARGET);

might be better to set then clear?

> +	/*
> +	 * SMD BSS Transition sub-states (IEEE P802.11bn/D2.0, Aug 2026,
> +	 * subclause 11.3.1).
> +	 * Only meaningful for SMD-capable stations (WLAN_STA_SMD set).
> +	 */
> +	if (test_sta_flag(sta, WLAN_STA_SMD)) {
> +		ret =3D sta_apply_smd_state_flags(sta, mask, set);

Sounds more like an LLM invention than a useful comment ...

It'd be good to know why any of this was needed I guess.

johannes
