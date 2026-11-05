Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793876939;
	b=oTt/yO11C/ZNFa1Xo5zf2AWIlQykwpEo7tZ3ARY1aEg1ESoKShKYXASJV7VBmdIUGD1g
	 oSANrkCbMxZ13dZ6+ZO79MHureEfffEk5QRGIuzJJeEHCzAwIYO+V1Q/+oGPi+qs0xFSJ
	 UpnbCEFMXJh9XORrqMKdp4RdlLMau0/zncPzrsVdoICy4b1mFt8FhtySaHF2a0owxq+vX
	 8TcTxbvpwTiT9x0pnW3S9zNjLL8a/p0ZukF/WBSsGkXU2unuYA8Ix8Bvl9S4Fwx8I1Yw7
	 kIqrnZsz1xneG0/sPuCeSV8Z1yElavAnBmA5shjM6Ik28UqM+A0aI7vXG2FjRPYkzeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876939;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=cZqkr0kAqPsa1BYAVBcK24cy6vQ3xnvYJo+0eRER8u0=;
	b=xOzfE5J/Sb7V6XYekzevZ8YcqTJ2HeQWUnwLQMqeFwqsbtSwdeUZehBOOiYENmM1JTk0
	 kzE5KRq4ISY+Q7nOZGkbVBp1SjpEXoHCJ5Z9tw9VycEAJW+S5eO3s32H7jNGCDhQIMEEL
	 +DaJbI4HkHMYr8Jntc81PlXcz6bJWkzsMeR6k27fwNNVbl/ZeBsLMvPKGtqwcjpKHN54S
	 Sfmsp1nOWOo2xjTgTqdkGI9DzWhldD30oojwuhatyB8+L6TbBYynfW1sPNtUeREW4JLKf
	 S2f9ZStGa0SEZmWgypRAONLlArJjyP+7Sj0Lcoe16bzPRHPviwlha2qb2d18DbAeecg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=C30cSuTm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478B3606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 478B3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=C30cSuTm
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 91C192007BB;
	Thu, 05 Nov 2026 12:08:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793876936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cZqkr0kAqPsa1BYAVBcK24cy6vQ3xnvYJo+0eRER8u0=;
	b=C30cSuTmYE4iueDgJ7aA9cexnkwvgIfQ50bEv3YbBETo3lSqy4UBJEYvjArgPkWJyEQNlg
	kNbQB4kaTRCAdaeaPM7v+1LyRUvDaGgyGU9oUMBHETqgfIZLgTKd4BX8pszECnXjoXEfZn
	BZk8MEdTugs1R3xN/3ZxvztOD9UjGGQJ1u7DKvP7Q6dlXU5W9BY55HE650CQn1jBp+Vqq5
	pOvloE96ByZcxxxI02cQswTkdkwhgQmTMsNodA523dfTeuzi7AK7do8FtBJ1GjpFWGFpH/
	P1u+zhlMJFUNS7XbjkYZCN38qEWw8VcmxYisQtFJfZPoMd3EMIbnxeaEOZsTNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793876936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cZqkr0kAqPsa1BYAVBcK24cy6vQ3xnvYJo+0eRER8u0=;
	b=QZGxPB0Kn3uHuHD5U2W1h76PjRBAzbQglwPRg4lsbdFQqEu7BOzBnun2suYKOn9w4cyw/9
	hJCPzy+lDDfvSAoGhfWDDJdHiAJ6MkpDbytMLFsAJSwJPwEbfyZRm1UGGKD36MJ+KKqqdY
	9QoftoB6sMi7wV9BdsNDj1x9hksgT7UKw1u03m9xsXVTV7lIxsJxUYH5CFt7x808nIHwdk
	vGscgJPYVDtJEAwwVdE4HJ00XG7ThqDpGfA9Hn6fhN/OWyRtNaySZgQvTM+8ItGK5GUugL
	faHNVmRTVA7bVl3UIAq5JyEUb7HUyeaU+VPM2Mmjh27J5arf+ZUS6rmyyk9CmQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793876936; a=rsa-sha256;
	cv=none;
	b=SafFQ4erFCnYEAEwJiB8E2BmfaF9oehpi2HL5aEr2zKh++HTTxk0wdnOeQPjGxHNVLGHRy
	oFNN5xJx3IL9Ak+Qt3yh8ACfuAp4BD/uC1dBMjWsmE+QtCNDdcc1PWRUnN9IdNcHVjW8Md
	zz31EsYlt3m+hDk8GLFzM6noP6okgFnO7N5zcQd0dOIPc/YSB0OF1DgSxPuIgVji52itS/
	2rRvVs5LUHL/SNnNVzlJSyPk0RSoV/0pmKgCfruoJURjZPn1oj0x2RYTtivbQ7UbcvE6KY
	ZialMaUb4JdxeJBa6Yc0cRgciqDvAV7dD6IwwBG+4L+WooEb/FVzET3FO51jFg==
Message-ID: <a81cac04855d0e6941ed39fa3bae559470476fa7.camel@pengutronix.de>
Subject: Re: [PATCH v2 0/2] reset: Fix issues reported by Sashiko
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	linux-kernel@vger.kernel.org
Date: Thu, 05 Nov 2026 12:08:56 +0100
In-Reply-To: <20261104162038.48622-1-tzungbi@kernel.org>
References: <20261104162038.48622-1-tzungbi@kernel.org>
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

On Do, 2026-11-05 at 00:20 +0800, Tzung-Bi Shih wrote:
> This series fixes two issues in the reset controller unregistration path
> reported by Sashiko:
>=20
> - Patch 1 fixes a reset_control leak when reset_control_put() is called
>   after reset_controller_unregister().
> - Patch 2 fixes a circular locking dependency between `rcdev->lock` and
>   `rstc->srcu` in reset_controller_unregister().
>
> [...]

Applied to reset/fixes, thanks!

[1/2] reset: Fix reset_control leak when put after controller unregister
      https://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git/commit/=
?id=3Df06482ceb314
[2/2] reset: Fix circular locking dependency in reset_controller_unregister=
()
      https://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git/commit/=
?id=3Dd1f583c1eab5

regards
Philipp
