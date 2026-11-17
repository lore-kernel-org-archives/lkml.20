Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.145.95.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923832;
	b=ZJgi+1ZJH07GyfL3Cwq5uESuVlqBfUyPhhGdiN/qP9jq+CFxmgYejZNnlu4ksdCx6uqF
	 ZfpZMaCSLZweuF5H36z9KhKNp5MDEipEgRESLOqdZ8ZWJsdkEHkAZ81HS6BO4DgbsEhUH
	 q7uTYob/fY5AvuUce2AHANblpdcg5qg2hLRlZm3Ug6wnFkmfLhohOnvxBsxkOU+DbBpmg
	 /YUbwvlPjkQ6o64aZ5pI2SYpmFGOWtsDWP8IdRKMR3lla+U73lYv8IlfglF+04C5rWJD/
	 VRorw/S380kW7oxAo29ku1tQHU/r25BqITkjUron/Q/9HZCGcsqmy9b4xoDMZDs+pVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923832;
	h=DMARC-Filter:From:To:Cc:Subject:In-Reply-To:References:Date:
	 X-Clacks-Overhead:Message-ID:MIME-Version:Content-Type;
	bh=gWoFWWgGwt5i8loUGAgHBMtaflb1OdFLTlsDayygGnw=;
	b=XTDLxlOUz2mhnffPKvKnJT/HfZSGZyObk9bs6B6VI4lI/QwazYkSDDS1ajoic3234izh
	 +IM1hJSW48jZCQ6spMA1R2/cFZYomK7lWJWhhF1UFe7ZAurD0dfXq+f5A9MnQezoU1BIb
	 rkr+0SyRHqDboUU7yz84WR/cg6EPf6TyU8c0LiFbQI8TFJrdUCymgiLokDU3Q0J0yRsWI
	 E91KG/bFwtQYZHAI6vN0TMvF7gpz/wcpUTlCNCTqS5xSEupdZ6We6g4eHwXm8OBL/dawH
	 wBKdlLVSnOGBVHZjFBOMprvmnA9aQUOGCX1ni5SMmobNETLUl48rj5RIYppO0StgoMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=toke.dk;
	spf=pass smtp.mailfrom=toke.dk;
	arc=none smtp.remote-ip=45.145.95.4
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E20606A31C;
	Tue, 17 Nov 2026 13:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7E20606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toke.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toke.dk
Authentication-Results: mail.toke.dk; dkim=none
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, mehmet.fide@screeningeagle.com
Subject: Re: [PATCH ath-next] wifi: ath9k_htc: do not fetch the beacon of a
 finished countdown
In-Reply-To: <20261117122648.1731207-1-mehmet.fide@gmail.com>
References: <20261117122648.1731207-1-mehmet.fide@gmail.com>
Date: Tue, 17 Nov 2026 14:57:03 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <878q2rtvbk.fsf@toke.dk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Mehmet Fide <mehmet.fide@gmail.com> writes:

> Hi Toke,
>
>> if (ath9k_htc_csa_is_finished(priv))
>>    return;
>
> That would skip one beacon at most. ath9k_htc_csa_is_finished() clears
> csa_vif when it calls ieee80211_csa_finish(), but csa_active stays set
> until the second round of __ieee80211_csa_finalize(), after the channel
> change, and ath9k_htc_set_channel() turns beaconing back on in between.
> The next SWBA finds csa_vif NULL and fetches the CSA beacon again.

Hmm, so it seems that the ath9k driver used to have a similar structure
(with the csa_vif pointer), but that was changed in commit:

4effc6fda7ab ("ath9k: prepare for multi-interface CSA support")

I think doing a similar change in ath9k_htc would allow us to have the
pre-check use the same function without this issue, *and* get rid of the
setting of csa_vif without any locks protecting it, no?

-Toke
