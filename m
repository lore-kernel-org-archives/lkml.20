Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794881777;
	b=nQDykHK3CscYf1vwUoc9wYEUTBUBnwxFxke9CaShjVpIardw/6wRCj7hugL6yMDbKb1f
	 wq2ifyBidSwa7OF4FfBADY/yNfDIh8iTdAFZO3CveDsYn0HtmgU7JD4Zoir+wbs81YnLx
	 yVvSzvGrTw9PXRtwnWjeUKPZtrJ5TA9oxkFVEvpD0zCt8SLGndCUNfilg4RxULO99wvdQ
	 S/HX4qvS3Ck71gtFWm+zvGXienkrPoFQzDdv26TxpIpoANUie+bjKY0aB8FlHDKKTh7iJ
	 ibrUBxuZg7WHZDeSUjiaAFf+PiE4Lx10Ef8Fqb+EsNpl57romkoBXze6Dx4i7W28guw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794881777;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=yt13tp/rvLvexjlMPma+hJFiFj/qQmugNFpZecZf8sw=;
	b=nwniPakvwUB1mboEFUynxweQpUIlU63A3tpYnDV62sPqDi3vEPmuCh1NeURW6zJtWA38
	 kJ/hecwQPCjtzQCcmkGRKL6NV8a9KR2/BfeE58JuEQAm+0e0UvcVDduJd64XpWJGungyJ
	 5Fmzuz+bLpQ8ScTX8alIufD7IKo7Rtu4pRUYNhj7Ky/6Z+6hgAdDiftLxbqTqzqCVRMAJ
	 xOUaadE2m4oWE5csd9opMcX/k86STHiB0Lob6bfUCwGD7eXyKT/gt8eWvhHpi2giLKhhr
	 frKGg0+v/ACxmPSXP1Qn2k68BDFA0/LkcvmKaYfjJHc+9lQkJ541dnSwrcXmUxATamQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BRGHWZ4Z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A20E606A31C;
	Tue, 17 Nov 2026 02:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BRGHWZ4Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FE141F000C4;
	Tue, 17 Nov 2026 02:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794881776;
	bh=yt13tp/rvLvexjlMPma+hJFiFj/qQmugNFpZecZf8sw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=BRGHWZ4ZG4Pk2S9yip/TgmH+UX3gPqHKvnmbx3WYO7WVHx6DhUQ+VsoehKTeDLcXa
	 HfIpHmKlYHL+glR7sOXidda/KfRzP92NpnD5Qgaz7KxTd6/RoJkovp8ACrNUjGdH1y
	 h0J2TUX11aSyEF4NIZWzlVGvDlSP1J2rUn05r1B9c7IgNtYX4Hs/2ATUuMRhndrtaZ
	 YoBBog8btT2sLVSEba+91hEz7SrOcJSU72MYMaYDb/9H+aMNdA0oDSmM4/v4Cjbjek
	 AcgyM2tnelMvoJ1NSgrtuXp+LkgNrChuOIOPi6Wj4qFYbHmnTxVIe1uzGAOP30TgHu
	 Am4Mw8VifKZYQ==
Date: Mon, 16 Nov 2026 18:16:12 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Ivan Vecera <ivecera@redhat.com>
Cc: netdev@vger.kernel.org, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Jiri Pirko
 <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Min Li
 <min.li@microchip.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek
 Kitszel <przemyslaw.kitszel@intel.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Richard
 Cochran <richardcochran@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-wired-lan@lists.osuosl.org, Grzegorz
 Nitka <grzegorz.nitka@intel.com>, Karol Kolacinski
 <karol.kolacinski@intel.com>, Saeed Mahameed <saeedm@nvidia.com>, Tariq
 Toukan <tariqt@nvidia.com>, Petr Oros <poros@redhat.com>
Subject: Re: [PATCH net-next v2 0/9] dpll: do not serialize driver callbacks
 under global dpll_lock
Message-ID: <20261116181612.107a4b57@kernel.org>
In-Reply-To: <20261111164021.273409-1-ivecera@redhat.com>
References: <20261111164021.273409-1-ivecera@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Nov 2026 17:40:11 +0100 Ivan Vecera wrote:
> dpll_lock protects topology and object lifetime, but it also serializes
> all driver callbacks in the system, so one slow device stalls every other
> DPLL device, whichever driver it belongs to. mlx5 callbacks issue firmware
> commands with a 60 s default timeout, and zl3073x callbacks can wait
> seconds on a driver lock held across ToD writes and phase steps.

Can you provide some real life data of how much this actually helps?
Real device topology + scenario you hit?

For the cross-domain pins - shouldn't we stretch the domain to cover
all interconnected objects on the system instead of hoping people get
lock ordering right? You documented some rules in the doc, admittedly,
but not sure how enforceable and practical they are.
