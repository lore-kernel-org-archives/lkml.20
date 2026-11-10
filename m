Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794343680;
	b=xcNtmmD5tcKTMpuV57NOLaU5IOsh/wsflkZ2mPBEdsUE3d5qbrsgU36fg0F814DP6ga7
	 GOZ81SFPZ6tq4l+A6/oTalwpWN9RFixeMX5CosxtSDwYgzMbEDivYAG7uNn/qdpf4UwGu
	 dSa+iFFyOmUY1jge4QeVxkd7BBI1+mmTLI26mHjF8h2Inwv79pWprAa8HGH9WZ72pOVV3
	 dL6pcAvTC1HQYWJY75e7FNXLULt3P8zKzqgkWE9x+5s0ACNz8c5bIiYg6sbxnS5D7PjA1
	 bUG0leddStKEzYDj5KHmDiI5Vbys+pvtiDcMTu4oQE+ureC5Yy/7oEwZHqyqrxxBMTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794343680;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-malware-bazaar;
	bh=MvH6bQIHpFycqgPpUViybiO128+Y08u2M2CcFeNKsjI=;
	b=umIYPQ87xCNEOP2NWImzhVI/GIJAorg07GlAfbypVhwkXCwcx9afIebV30kjSOg8KQ8V
	 XW4oMJBM+Kw4UsJVDlkQ27S3u7VCxwO5nB6aisyv332PcEye1oc25jEw45ZCEpxa+GjgQ
	 ox0behey7l/f9v9nCYQujaViq4+6PGQps6MnBnAHHSDYlCavp/XMJldIpyIGhVw+x8Pht
	 3sBCU2BY3K8ncSwUF41oibWceQfNfP7jvmqx5/KSuKs2KuinStEZj0fz51lfHy8/dWHp3
	 qJzWXta9q8mx5gW0nIZi7iCsb9xAQhPf6FVW8+lf+JuHQJWSqXu6xZjVzueiC/I8YjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=uzC0TMvU;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FD9606A320;
	Tue, 10 Nov 2026 20:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=uzC0TMvU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=MvH6bQIHpFycqgPpUViybiO128+Y08u2M2CcFeNKsjI=;
	t=1794343680; x=1795553280; b=uzC0TMvUxeb2252SwsW/0FTwVWhy5vTZ8QYK+yEv/5BoAbH
	hwIqzn95BPieiDTLv2yg13C5ZUwjf4TmZ33j4qmTSEwFWlqNz2tvbhXaO3Zwj1DPtee+qpXdHBg5w
	mD+mKM35ZmACFGvZNs+I8FEGhi9JM1x0UjHobisZ3i0LvAZivnPP2Q0FeBhztoR0IzAm/0SRNzhlG
	KHUZrkj5D7ex3LdbY8Fn2Zz5JltJl8T6xfG+WidbPoIl6xSYR/AvpNNJWoghqWHoXJVE/uqP+YklO
	lnXspEzJAx5Ulx7rjQqt4maCkMt3B2vnovK/B227Wt/F3XFJKH2o/+Wwa6LHBMaQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xQsl3-00000002KdB-0vAr;
	Tue, 10 Nov 2026 21:47:57 +0100
Message-ID: <9ee5e8e45152b4f50b3cc6f583bf3a2c6a49a10e.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v4 20/21] wifi: mac80211: add mac80211
 support to handle NL80211_CMD_GET_SMD_CTX
From: Johannes Berg <johannes@sipsolutions.net>
To: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 10 Nov 2026 21:47:56 +0100
In-Reply-To: <20261106-smd-v4-20-62e39487f51a@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
	 <20261106-smd-v4-20-62e39487f51a@oss.qualcomm.com>
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


> +void ieee80211_get_smd_ctx_done(struct ieee80211_vif *vif,
> +				const u8 *sta_addr,
> +				struct cfg80211_smd_transition_info *st_info);

Given that we have ieee80211_vif_to_wdev(), this doesn't really need to
be an exported function, maybe it doesn't need to exist at all, but I
guess an inline could be justified.

johannes
