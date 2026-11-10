Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794334730;
	b=CSU/3UVGYJoWiXRJH01WRRcgtWb4jT1kPqF9mPQhx14ww8h8OVkPhOJR9MizCawJxS54
	 Piq6xuHyUJ/J8BkkWqAqbx2UJWDzGn/lZV4uDFEp2XgS2nnJ1rfIC1dRBDedWbOAFPO+l
	 Kx5q7YYT8RNvJePcNJIDXFmn4YxJ/dRR0LSuQ4zcSmlHG3Z+MsI0xbvroI87F6X4zyIqE
	 UJ/10qO9t5P8nQcEJLA78k9+C6FpIpV+50Z5ydtieA78Y7xm5NgwB7iq4s5Irv0Ib792u
	 QTRVQh5c39Gd4LOs0faPWT76v/FV7PBcc2w3Wjz3BX3v9besmYsdyQnMFc327/mHtXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794334730;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-malware-bazaar;
	bh=kut8UqFioOq41/mkvCEslRdOq7S+gA7SGtcE05CHFj0=;
	b=jJtsBJF+tp7Suw6t/FZMYEUQAtwzWf4XQO6wrXdP2MqiVT5bn/nY0OJNgNFAkwdqk01R
	 /OI9e48VJeF+Qn52GLdqw3hTsWJcVcndCvw/O9NEY3GNTslH8Vdi0yT7LnDs3MAxbhO58
	 07dc4KmafEttWs0WFVXgwmkOkPfUC+sHIyd8WS/Rt0Y/mySOozZj5EZZZMF9xpjLcE/rd
	 jhbqjouK6E2qV77SfxoQ9y6eqXYDn5j9dNXxzT7ZLrK+2M5kvBFF9B/RKpKFSRFCi9mcZ
	 616yvJimo0N7Ns42y1aZHMz3zqVponYl7uxYT4nbMTwXJGOwHKJKt7jgfkPH7mSHaxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b="qWCl/sbr";
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A56F606A31C;
	Tue, 10 Nov 2026 18:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=qWCl/sbr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=kut8UqFioOq41/mkvCEslRdOq7S+gA7SGtcE05CHFj0=;
	t=1794334729; x=1795544329; b=qWCl/sbrmo1SOksNyxwZQy+gIPs84jG0vvqHAKqZDmICRHf
	ASE6CImqYHJUf039HLptGzV5UAYSLX5if4/XXaiCxmNLfffVwyU86prXzmjnVoj98feLVZj6Nhaga
	VZeDOBl6M/gJCvMkge+CoGri8NhX3dr4QB7fHcENgtSI1fyl8bk+pFBH+H8MF7WtMPP1xRKJOqZ8L
	BgoFOF7VY62Vx5nZsogU7Y8RkAeZiU53iResLMnvATatJnCsMba8KEs3IyFbHnfww8SfVcFk3JpfI
	bHFtRPMf7p2VmhWEiiwHDoWhfhrUsa6UKSjpQHMIjjS1X6DimUH8sceAVni/VZxA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xQqQg-0000000287Y-2fin;
	Tue, 10 Nov 2026 19:18:46 +0100
Message-ID: <6764285af0c694c036d4a670d23616e465050b2c.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v4 02/21] wifi: nl80211/cfg80211: define
 interfaces for SMD setup and STA update
From: Johannes Berg <johannes@sipsolutions.net>
To: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 10 Nov 2026 19:18:45 +0100
In-Reply-To: <20261106-smd-v4-2-62e39487f51a@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
	 <20261106-smd-v4-2-62e39487f51a@oss.qualcomm.com>
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
> +/**
> + * struct cfg80211_sta_smd_params - SMD parameters for an added station
> + *
> + * @smd_sta: SMD-negotiated STA
> + * @roam_sta: station was created via SMD BSS Transition procedure
> + */
> +struct cfg80211_sta_smd_params {
> +	bool smd_sta;

I don't understand why the kernel should care about whether or not the
non-AP MLD negotiated SMD. It's a single bit, and has no bearing on any
kernel functionality, it's mostly just a change in key derivation.

> +	bool roam_sta;

This is also entirely unused.

And then basically this whole patch goes away.

johannes
