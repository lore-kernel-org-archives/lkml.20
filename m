Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794343773;
	b=AsC6KhhcP6ZMMNeJcxN84jzF3AuMJ5vPC5daQaEH8IazNQknRCXP7orXEOe9+iiKzWAq
	 BGTdnbiFK6S3gw0FB/Fthn82nLGevQNj+WrYuAhtmpy6v1KbSGEOtTLDpebg3TFTuHUTp
	 /GJG77PUHuXixG/xkMcQev9mHdBwc5u2ikJJ6ilF8KyK681KXziEG2UX3i//XLyeqZmbu
	 Sk07hXZEfnMTEaC/PzvK2UGXKSH/DIP+QdczvlXxX1dDcmWcx5D5wJ+KXptEFxU50NfMg
	 0xewPYmIz4hXid62DI65+dPNmRpzVJL0yoN/PS4cS1QXipAEpP58BaAgmDpWjxJqCSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794343773;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-malware-bazaar;
	bh=QZUYTVrEmnGgtZwJSdwQjuf+Kfj1I1WqfbMiipHwxpc=;
	b=M4lXY6neEkk11GslnIJQo/HhGtRJB27moWK9pU+kugHwFlnVs6LkW5Ljmhhqn5dQMSSC
	 B8qNUXXHOADtJ7U+iZIvhR0Bhi83dKiwsgusilCFK3ScwYqIV7mTwgHYrQDzGRKIFre1p
	 qFLdoH4DQpGz19RrCkhxJZe44ggZtId1InGMcZMf/L3uXP3R7SkHcZdKfKxAB72UaLNHb
	 Aa5Nl4jcpsykk779RmIfe7XLvKfZxYYrhs9QWQXP/7+MYKpUQnvJxiOYmB1IoUXBqcAVq
	 3M54ioNrT42B53mSlX4Wg8V8NhvFTFGSzrrIwOH5PNoq+K+wskG6rRfC5K2Qrca129g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=D3hZTb9Y;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35288606A320;
	Tue, 10 Nov 2026 20:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=D3hZTb9Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=QZUYTVrEmnGgtZwJSdwQjuf+Kfj1I1WqfbMiipHwxpc=;
	t=1794343772; x=1795553372; b=D3hZTb9Y+x1TGozMfaDu/KzK3Cb3RgQmZuBXfHWVZHJgbLO
	iWUGK9cZ2MscOKmq95gLlxbUhpnfQGR8IHj/EV1jao2RaYZnQ27geqLSCmv9UgyqsihsJV2KVUNTT
	AfpvkcNVkO7AHbVLq/Uub/Ew0P7PFEnrwI76Zzl2IeiBLW+Oecg/sUuAfGhyv9nU/XuqfVmHVsqyB
	5YulmhdE7YGWboj9JMPKjmARC2C/Ukn22PJre/qzEgn5MkDWNF0+NbQ7LYRZiJuxx/w4vxiYqdneK
	pXUfIP3ggBIv95RUFgltKF70WcF6eJFaQZoKkibKgbAoa6Aa+KytCM7h+QqibTbg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xQsmX-00000002KmY-2fIx;
	Tue, 10 Nov 2026 21:49:29 +0100
Message-ID: <60c815e5020502b91215a6c89c589d881e80d67e.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v4 21/21] wifi: mac80211: define API to
 invoke SMD Drain Completion event
From: Johannes Berg <johannes@sipsolutions.net>
To: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 10 Nov 2026 21:49:28 +0100
In-Reply-To: <20261106-smd-v4-21-62e39487f51a@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
	 <20261106-smd-v4-21-62e39487f51a@oss.qualcomm.com>
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
> +int ieee80211_notify_smd_drain_completion(struct ieee80211_vif *vif,
> +					  struct ieee80211_sta *station)
> +{
> +	struct ieee80211_sub_if_data *sdata =3D vif_to_sdata(vif);
> +	struct sta_info *sta =3D container_of(station, struct sta_info, sta);
> +
> +	lockdep_assert_wiphy(sdata->local->hw.wiphy);
> +
> +	/* doesn't make sense to terminate if we are not draining already */
> +	if (sta->smd_state !=3D IEEE80211_STA_SMD_DRAIN)
> +		return -EINVAL;
> +
> +	cfg80211_notify_smd_drain_completion(&sdata->wdev, sta->addr);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(ieee80211_notify_smd_drain_completion);

I don't really see anyone checking the return value of this, and if we
don't think we need to protect hostapd from broken drivers, then this
could also just be an inline (or not exist). Anyway if it goes wrong the
client will just hit the timeout without much loss.

johannes
