Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337238;
	b=A12Xd3E0WM+alkD4pIgumq8Tup2F9tXlriJ8T+Q5oFlXSUQlSlGcQlV8KKM2h3Ksx+pz
	 zzmCq4eH8h9t/JNsZkJJ40bM0GSuzJbz7lup2c9jQZvQSfGMRuS6tk3WWUVkh9ZYHYFVj
	 f3S8Vuga3bk3EDaKTKkvplaS0m9yldhWpUviQ9xUKuT1Xj+wY6NXRxw2LqoknKYgZdW7A
	 sJn8D8UP1Tprg1rHjhHsBa2SBYL1MKPchGPnvYWLeUptMRMmi1UqaiaTP0kpBygkegTqv
	 z38IX5+QyuMiNiRsO5eZhKvSGNBQomOg9VzUVsb6rjDQy4IF/7SxHOj3aqYF8mx14UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337238;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-malware-bazaar;
	bh=dqSBQpCL97NY2Ay1Q3NllVVywRA6JpuBoOs1lXz2J40=;
	b=UalEH2vTwTm4cn0W1EZGDScubziO75PNBXwF5jan7atirWgPWjsUtXctv4oR9eirYnxe
	 PGDhVQBQ/JgcZ64Mx/A754vI584tfga3JU0Lz4LAY0PymZzqZmqMmMZqwHXpSgnzj/s5N
	 7ycN99BqWR1bg/XtaEE4uNEwQKiuiEnE0+FlZc7qPB6L/tqa/saGNzL3Dhq4ua7aZoMds
	 TuPFII8Gsrs2a5tE9pYicHAP0fUgatwxM1jQfwbt3kmbZx2iht7o2eAt7ZH5pP5G//I4B
	 4ArPFHOZl7I0i7NDTyOkQUurboAzCt4RSvXJmjK7OKNmYTsJheBm+SEtWy01kpiZc4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=Eq6ryoLU;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E95606A31C;
	Tue, 10 Nov 2026 19:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=Eq6ryoLU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=dqSBQpCL97NY2Ay1Q3NllVVywRA6JpuBoOs1lXz2J40=;
	t=1794337238; x=1795546838; b=Eq6ryoLUSRZRZu+lwrIqi2eCnVNMjursQBFDAOXEx/3vdOi
	XZGyl6bx2djcE9Wf0TRQetoe19qz+NiTEG5gy21gxlmV9Olyj3N+BeQr1F4w2hmqPdg3PEzTjMsvu
	LHvWo86v/Uk0kj+a9pgs94aDPXRnOSYh3FgvuW2knk2T4yRrQabbYl05EA5J8yv302zO9H/UoH89m
	/Zxe2b6Z0v5Z8KORWz/CBmY2gMtyb1ag8aRVWE4/cUqhSJc+yZND1qejO67XowhtVTx4TV0gIPLd+
	wd0+PLyUTpbL/1UCWH/l5EJ2eXD9eLh4GjNa+30XpkPUfWOrWly1JxcZU01jjJOQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xQr59-00000002BdN-0aIN;
	Tue, 10 Nov 2026 20:00:35 +0100
Message-ID: <29b38fc6c8a5f1b2b58d81c1a9046308d2ca9e2d.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v4 10/21] wifi: nl80211/cfg80211: add
 support for querying SMD context for target AP MLD
From: Johannes Berg <johannes@sipsolutions.net>
To: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 10 Nov 2026 20:00:34 +0100
In-Reply-To: <20261106-smd-v4-10-62e39487f51a@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
	 <20261106-smd-v4-10-62e39487f51a@oss.qualcomm.com>
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
> + * struct cfg80211_smd_get_ctx_pending - pending async GET_SMD_CTX reque=
st
> + * @list: linkage on wireless_dev::smd_get_ctx_pending_list
> + * @sta_addr: non-AP MLD address for which context was requested
> + * @dev_tracker: tracker object for the netdev referenced
> + */
> +struct cfg80211_smd_get_ctx_pending {
> +	struct list_head list;
> +	u8 sta_addr[ETH_ALEN];
> +	netdevice_tracker dev_tracker;
> +};

This seems ridiculous, if userspace sets the interface down it might get
a stale response, but you're writing dozens of lines of code just to
avoid _that_?

Maybe also to avoid querying the same STA twice but if the firmware
can't cope with it then it can still reject it (or the driver), is there
really a good reason to have all this complexity to prevent it?

Tracing on the output path, on the other hand, would be useful?

johannes
