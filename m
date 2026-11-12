Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794517507;
	b=gqi0/E53Pxp559pIctf8/ben2UFbLfkwInRExh+PjBYCqQnVLTcPfT71JVPN70H+sYme
	 5czIBLEKjyhMo5uuZZFPvnrFrOZj89Gw3Q7fUcsj8gty/KIgNlB7st/WrwYJN3MUj+CxJ
	 ZQphpnp0KulhMNL+Cm0VU38VVjlTD4iChVEJ1CsN9cSA+asTrP6/dxBwCTovjqIvOTSVt
	 oy04+IOXXxGUiMSd6X+xwM2UCJr17S2KTetulMGJ1az2QKBzNL7PUJDK3H2sSh3XW3be7
	 r3yy+KCklsiC2/kZIPLbAcDhNgTErT8ah7wlhcjjk1BK0ViRtEmRwnFdMsDHY15sWzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794517507;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=ya/9Kyp75u+kv0fbcfn1s8UYrtXFsex7509YvIgb/lU=;
	b=hVoOwp+UFxc5ha/RuUrrSRMXK3ZtU6CQzf8yRDYxM3Wqa0hB+nLMT1mcMORcV1eY+9kZ
	 K7e0xneOrOOHhO2b+5aikpOnfasyAlte2gspoSqpOxs1oTZQtJbiMMvSWjp579LEoZVsA
	 2KoWOMmnWDPnrVZP3t63YNArPFSSn0QP/flXFkPkNIP2uwon1W1Glqg5j3xhZPcrzQIrV
	 kcqp8m+gnpLbkgbOzn+PPKTvYtacKHNR7wAoXTXucGLyt/mF6CulY/eT4bIhUDB+nvKCL
	 mgaF8IoGcLwmuI/T7JH5y4BXhrHNYVzmowt55nwewuMuPVj4tcbbMyb23G2frmRJloQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=empyreal.works;
	spf=pass smtp.mailfrom=empyreal.works;
	dkim=pass header.d=empyreal.works header.i=@empyreal.works header.a=rsa-sha256 header.s=protonmail2 header.b=iDzdAXzB;
	arc=none smtp.remote-ip=109.224.244.119
Received: from mail-244119.protonmail.ch (mail-244119.protonmail.ch [109.224.244.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFDF606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AFDF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=empyreal.works
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=empyreal.works
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=empyreal.works header.i=@empyreal.works header.a=rsa-sha256 header.s=protonmail2 header.b=iDzdAXzB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=empyreal.works;
	s=protonmail2; t=1794517504; x=1794776704;
	bh=ya/9Kyp75u+kv0fbcfn1s8UYrtXFsex7509YvIgb/lU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=iDzdAXzBb4TiDfcFH2lJuzoIhytxziXw+2Mcm+t5m4f5aRqaR1BLIcMmbKDU0vfou
	 HzYknUda5/hFSyjyrkrY4Yiz33fWkqi4UohQjDjWw5GJrfZLoOuQXb3LbGYAZNMd4p
	 iWqb3E58AWpJoTVAk8ahW9VyvTywxFkffEKPwSEiGS+L9rxazE5FY+bNc11TAW1Jn0
	 pGp9XTHmCz7lh+Y+CKCprnHMOomYqmSdAqL5DYBcvc5MeK97VgwqW4DPhkXctoObW0
	 cMmucsUbkc/2VhxAchvyZvf4Mej/wSGEdTp6WOOOQdRcNFkmnjEJoOkn/sdskGSv6u
	 Yauo1Rdf9+X0g==
Date: Thu, 12 Nov 2026 21:04:58 +0000
To: Denis Benato <denis.benato@linux.dev>
From: Andrei Rusu de Castro <arc@empyreal.works>
Cc: Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: asus-wmi: write the thermal policy only when it changes
Message-ID: <20261112-asus-wmi-tpolicy-reply2-a72710a0@empyreal.works>
In-Reply-To: <8523039e-ba83-48f3-aec4-6d9540b9d0fe@linux.dev>
References: <20261111-asus-wmi-tpolicy-5fbc4e09@empyreal.works> <ec9515fb-6698-4e7e-8a88-5b3fa2f50c51@linux.dev> <20261112-asus-wmi-tpolicy-reply-f7889fb1@empyreal.works> <8523039e-ba83-48f3-aec4-6d9540b9d0fe@linux.dev>
Feedback-ID: 182420409:user:proton
X-Pm-Message-ID: 1f4cddcd3cb3b93815bc7d6c9e5491a8fab1c0e0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, 12 Nov 2026 21:33:54 +0100, Denis Benato wrote:
> How are you applying limits? The only thing that comes to mind is intel
> rapl, but it has way lower limits than what asus validated.

With ryzenadj: it writes the package power limits directly to the SMU on
this machine, so neither asus-armoury nor RAPL is involved, and when the
thermal policy is written again the firmware re-applies its own table
for that mode over them.

Andrei

