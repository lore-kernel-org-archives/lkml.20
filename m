Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793876873;
	b=Oi5uXl7KOWWGB3g+cbo2Vm2O7u6caMGi2UZgaBk+IhEW2egb6A/5OktllaLymmWFXOHP
	 oLKpDTltsfP9RBr1yyCmO34umeHZnp3i3GDaHYqQDxt4UgQiy3+8jgwWp3EA16k5gNLXg
	 5RQrgCskHIttWpU5cGcnQH+cyWscqTkuYLFwDh4xdd5kiTH4lBUtNQGnQlbAn3Zb8EXQc
	 On4SsvuUfbnY3IxSkoC2InH5fHVeLwOK/TVSbk4pqoeUI+P9bsX2726Hsk7u2cnOVR5Dw
	 3yOchGZsv1K2wK8h+ToW/+TJeNDH74TIGxQ+dhKNYSewRogpnhmY7WnWaZiRYuG+Vdw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876873;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=CILwCXfBslkBEegazfT+Lv0EIlDyNxw4aeUfHpw5q0I=;
	b=3tfyhYnQMnBloRjaPD3zTKGrA+esEGham+E4aUTH53uoI6WQoleeYlPBpUPMNLk3rPAY
	 RWo0eYUcgQH22LqX/LSVXrhvbxXXylsDOM13wXffMtgMnWfS3FZiE9D43/7GMTZlnKjHy
	 Lae1zMyhWC/SEuYrS/VdurLTFPIj3ENZT8hJo4MjJNi5EneRkpjzfN/YV1pnS0PYiP/Pn
	 0KJx3tLKquCZEdgY1b6T0KWyoMIkxaHvSK94ziiY1H+wcQ3B6s3NICUhiRM85WbZa/2fb
	 aBJpMHpWI5io0wXC/7xO4polpAdMh7OCNTUP+jjuV/0dhkLYoot2sbQOMjQWdtjxHeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b="TWgSnI3/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA753606EE9A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA753606EE9A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=TWgSnI3/
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id B04072007BB;
	Thu, 05 Nov 2026 12:07:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793876868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CILwCXfBslkBEegazfT+Lv0EIlDyNxw4aeUfHpw5q0I=;
	b=TWgSnI3/xYBMcClqGjKffL3s/mp7vaijLNcs5AGX63a97M4w/xiQ/pb7AFS5/nA9eDBq2C
	1jxdiFRjdYrOx1Dll/bd10NEEtA8CUnMVX0hfddH6K0KtLP6tH9wV7VV55f1ETUus0qWlV
	S1ozBJayEk807XEdH6rRnMTLYNkO9HTqcOrADhgINx8gsA6TkmO7lp6vPVD3101O1kb8EE
	LRKDsl6ZGR+n4KxdW1aEKHlhbH5Orl8doubA7qS56Pj5PR+udALBgzg0zyBSIT83wNcfh3
	uLQfJ9PnRNxpUDvqzL75kR+g7dmFtPHvv6Ll5ndtBiExb1q64Kdk/Z5UZ9SAWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793876868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CILwCXfBslkBEegazfT+Lv0EIlDyNxw4aeUfHpw5q0I=;
	b=GCHCpthNXtqgrnusm0GBRmPjyym9d3SFdcof2bGjieU1LQ6dcpdiFUZusnZsDkW1K8mnfj
	WRntESm3SeuC74ZjI5oijtoNc3Euo50LV60VNywavlisrDsUKtFJn/9Mf34abhrObktHKH
	eUwxLe4+fL2rSmhzDIldYX5YmGoDJbB/7MyT2K+R28sMvUOvra52X92+OpGnVXPKOcJ7EE
	LmcmrtBsZ6oDtNEQC350/BpzvMYU4o0ishG9WN4FmMA0Pannm+hnkZhtr1MSajgwAJPZzq
	LrHumKbcLnBuxFmAWUmT3N0uxxDTttV6j68FZLVYozPz9gtR9gndIhqG8+9qlQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793876868; a=rsa-sha256;
	cv=none;
	b=gEE34WI7ZikDNceGk6d9gIiTBFjvvbiFBrGp/zLklHOvmsz3GkbUMhHowDjrPeLev/I2Ws
	+fDlgu9PZ/LyiyxWEm/gr9Kpf+zjusQzDdIBGcPYDTFswAmEp6fkXTaLpwAfUaakN0b+cB
	DjhbVH0e8e6qH2mOJBHncjAGQsecN/SOSynI34xwx0F4EYUs/VSuZsA+I8xgFX4juSgEmA
	4HFNoh+CZlGbZWCrgYX9b8hVyPtwMZTtX4seAsTzkng3+JKsBkAucWI2ga74v9XV+lNqs1
	dhwuMIAP+stAo3/n82m/SLyJowbodtODgchICetOBQenOUn44yJ98F6qLYqQmA==
Message-ID: <29d122e3c71f4235e940eec7907351d3b054059d.camel@pengutronix.de>
Subject: Re: [PATCH v3] reset: Add KUnit test cases
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org
Date: Thu, 05 Nov 2026 12:07:48 +0100
In-Reply-To: <20261104160123.6784-1-tzungbi@kernel.org>
References: <20261104160123.6784-1-tzungbi@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Do, 2026-11-05 at 00:01 +0800, Tzung-Bi Shih wrote:
> Since commit 9035073d0ef1 ("reset: convert reset core to using firmware
> nodes"), reset suppliers and consumers can be wired up using software
> nodes without requiring Device Tree or hardware devices.  Leverage this
> to add KUnit test cases for the reset controller framework.
>=20
> The test cases cover the following scenarios:
>=20
> - Basic: Verifies that a consumer can acquire a reset control via
>   fwnode and perform reset, assert, deassert, status, release, and
>   acquire operations.
> - Use After Unregister: Verifies that after the supplier unregisters
>   the reset_controller_dev while a consumer still holds a reset_control
>   handle, subsequent consumer operations fail safely with -ENODEV.
> - Concurrent Unregister: Verifies that unregistering the
>   reset_controller_dev concurrently with an in-flight reset operation
>   waits for the active operation to complete before returning.
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Applied to reset/next, thanks!

[1/1] reset: Add KUnit test cases
      https://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git/commit/=
?id=3Ddb2f5f4ccc3df

regards
Philipp
