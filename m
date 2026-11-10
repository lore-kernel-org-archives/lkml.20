Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794343103;
	b=xSl6DU/FQGPwNF7j4DieYEivCnAJi49OhyXZKFkUjkYJ7QoTDlYFojHUowMV2z3kTf74
	 WZZ/nKIknSMMD1VsdZb3yRRzTNBifeXdm6rhXvNlyftl6BQbsoJJqMJUjGpM9nP78uM+m
	 2PSzY+Rv4kDNwpDKr4cX0S4LMtDJGYCCZJAlACOJYeJr2EBDALEdCSM1B8QtrbUMohOwy
	 lRECl1YunocRa+tu6oCGmYN+v32bw54sc5TRkEmYDqIVGSwbPbn8N0MtSyerHp1gICFmQ
	 xM3OU42CB8vtgtteBlp+Gbs90cncWShTgHOhGg2N1N5N5PMFlmBAMCk5uzCe5QvyUTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794343103;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-malware-bazaar;
	bh=uFgFzob09K6Kaf3sphEJfHemmGNdieiAhsN36FW6EV8=;
	b=ooWOkEbtpvYNFtJSWW9VH7Y9d9ANyjuUFc3iPkr4SjNT7LOU6sj9sfOd4z9awfw7JUf+
	 eU8z8LoahuUL+fILnLSFQyCL8iaJBPSEhW7QGIA+MTbrCQGLsKiPORQIy80CFYr+qnkup
	 UVq4bd+F+8lXpwlo+8dVMNlMW2eS6M19R1+g1BhS0FyjjBTaC5hAQm7SyTcJ8dccTl+aR
	 oSAyZ0z6Te2awpsNeVlgITKlFF1nmZErkagtTxcPM+Ec3D5+fgZ7BMN3FaAwzbUzuJAN5
	 92aFJxg0umGlkyVMQ+6JlwgjCptskdc30AJTd0UPrPqPMuowwKJf+tb83R8gBnSIj0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=F7duTf+H;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6354660A2608;
	Tue, 10 Nov 2026 20:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=F7duTf+H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=uFgFzob09K6Kaf3sphEJfHemmGNdieiAhsN36FW6EV8=;
	t=1794343102; x=1795552702; b=F7duTf+H5PcPsJb5EJLNNrvzqe9Dg/3UUAkr+MeBrMR24px
	JqcuQCMM0NWZP18ZNUPNk1UQWasoDPA5twuM8wGl+Ruxbs3ENZ+Idenvur8RCHHFxKSNFANWB1rQ4
	IjfVWVzCGTib4Hgmd0o84UqL4UazXEDiEXCCOivFrpQfn6/ixtB48Idkq3tQAeXRBHlEDeax9BmDD
	PJM6uG8o22xAYEZtKwSkgagyWYEpiB+BprWoeiL26UifrUrz4K1OQIJ2dPX/IIZp7M8j131lavOcz
	ZsNogGLLARDsdAKeCXYrzAwi+rqvTdnqNPwVYF2VoLCRQFhsOvGyVSGIystg+UEw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xQsbj-00000002Jfm-37WU;
	Tue, 10 Nov 2026 21:38:19 +0100
Message-ID: <9016700a02b45e18e06525b338fcce52a1e341e3.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v4 14/21] wifi: mac80211: add driver_op
 for SMD substate changes
From: Johannes Berg <johannes@sipsolutions.net>
To: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 10 Nov 2026 21:38:18 +0100
In-Reply-To: <20261106-smd-v4-14-62e39487f51a@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
	 <20261106-smd-v4-14-62e39487f51a@oss.qualcomm.com>
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
> Valid transition order:
>   NONE  -> PREP  (ST preparation completed at the target AP MLD)
>   NONE  -> EXEC  (ST execution in progress at the current AP MLD)
>   EXEC  -> DRAIN (DL drain period started at the current AP MLD)

So ...

> + * @sta_smd_state: Notifies low level driver about IEEE 802.11bn SMD sub=
state
> + *	transition of a station. It must not fail while transitioning down.

What does "down" then mean?

And again also - "SMD state" not really, more like "ST state"? If you
want to take things literally, then the state with the SMD is always 4
anyway.

>  	if (params->smd_params.smd_sta)
>  		sta->sta.smd_params =3D params->smd_params;
> =20
> -	/*
> -	 * SMD BSS Transition sub-states (IEEE P802.11bn/D2.0, Aug 2026,
> -	 * subclause 11.3.1).
> -	 * Only meaningful for SMD-capable stations (WLAN_STA_SMD set).
> -	 */
> -	if (test_sta_flag(sta, WLAN_STA_SMD)) {
> -		ret =3D sta_apply_smd_state_flags(sta, mask, set);
> -		if (ret)
> -			return ret;
> -	}
> -
>  	/* mark TDLS channel switch support, if the AP allows it */
>  	if (test_sta_flag(sta, WLAN_STA_TDLS_PEER) &&
>  	    !sdata->deflink.u.mgd.tdls_chan_switch_prohibited &&
> @@ -2954,6 +2963,17 @@ static int sta_apply_parameters(struct ieee80211_l=
ocal *local,
>  			return ret;
>  	}
> =20
> +	/*
> +	 * SMD BSS Transition sub-states (IEEE P802.11bn/D2.0, Aug 2026,
> +	 * subclause 11.3.1).
> +	 * Only meaningful for SMD-capable stations (WLAN_STA_SMD set).
> +	 */
> +	if (test_sta_flag(sta, WLAN_STA_SMD)) {
> +		ret =3D sta_apply_smd_state_flags(sta, mask, set);
> +		if (ret)
> +			return ret;
> +	}

That's crazy, don't add it in the wrong place first?

> @@ -3038,6 +3058,19 @@ static int ieee80211_add_station(struct wiphy *wip=
hy, struct wireless_dev *wdev,
>  	 */
>  	if (!err && sdata->vif.type =3D=3D NL80211_IFTYPE_NAN_DATA)
>  		ieee80211_nan_update_ndi_carrier(sta->sdata);
> +
> +	/*
> +	 * SMD sub-state was set in sta_apply_parameters() before the station
> +	 * was inserted so drv_sta_smd_state() was skipped (WLAN_STA_INSERTED
> +	 * was not yet set). Walk the driver step-by-step to the target state.
> +	 */

What does that actually explain that's not in the three lines of code
below it? Did an LLM write it?

> +void sta_info_reset_smd_state(struct sta_info *sta, bool notify)
> +{
> +	if (sta->smd_state =3D=3D IEEE80211_STA_SMD_NONE)
> +		return;
> +
> +	/* DRAIN -> NONE, EXEC -> NONE or PREP -> NONE */
> +	WARN_ON_ONCE(sta_info_move_smd_state(sta, IEEE80211_STA_SMD_NONE,
> +					     notify));

How is that even useful? If we're talking about a sub-state while in
state 4, then surely moving out of state 4 simply invalidates that, why
bother?

> +	clear_sta_flag(sta, WLAN_STA_SMD_PREP_TARGET);
> +	clear_sta_flag(sta, WLAN_STA_SMD_EXEC_CURRENT);
> +	clear_sta_flag(sta, WLAN_STA_SMD_DL_DRAIN);

Understand that you need to clear the stale flags, but for the driver
that just seems strange?

> +	case IEEE80211_STA_SMD_EXEC:
> +	case IEEE80211_STA_SMD_DRAIN:
> +		err =3D drv_sta_smd_state(local, sta->sdata, &sta->sta,
> +					IEEE80211_STA_SMD_NONE,
> +					IEEE80211_STA_SMD_EXEC);
> +		if (err)
> +			goto rollback;
> +
> +		if (new_ss =3D=3D IEEE80211_STA_SMD_DRAIN)
> +			err =3D drv_sta_smd_state(local, sta->sdata, &sta->sta,
> +						IEEE80211_STA_SMD_EXEC,
> +						IEEE80211_STA_SMD_DRAIN);
> +		break;

you do realize "fallthrough" exists?

> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (!err)
> +		return 0;
> +
> +	/* if EXEC -> DRAIN failed in the driver, notify EXEC -> NONE */
> +	WARN_ON_ONCE(drv_sta_smd_state(local, sta->sdata, &sta->sta,
> +				       IEEE80211_STA_SMD_EXEC,
> +				       IEEE80211_STA_SMD_NONE));

I'm not a fan of sticking whole blocks of code into a WARN, but I'm also
not sure this whole "model what should be a one-way sub-state based on
sta_state" was a good idea in this patch.

If this _fails_ in the driver, how do we even handle it? Should it even
be allowed to fail? What's the point? Worst case we _technically_ break
the spec and continue accepting frames from the STA in the wrong
substate, but otherwise nothing much happens?

> + * @smd_state: Sub-state for STAs in SMD BSS Transition

st_state, or so?

johannes
