Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794256745;
	b=KX7CLg7jTpkDZcOjDW0qpkBL5qPJAOTM8sYmm7QdE1MLvkPkFR4WqINYTaykIDNoCTCY
	 uH6d9HX4pNHku+pfAGsZumNVEXYd0JDdE1pZZymNSj81NhNmxq/2YteporfwJvPTCRHfB
	 5NTB2q5zuvd8lIgQs9htWeu0cg+PyY1YdPf7USLjP5ZBeYHy1oMYSTQd4s4w/lOarwDOe
	 hS/fBrV1YNMCGepgbp1rr4BFiF+O+FXQYt6iTd/SukJjZnyiPPa705T7Zo6avXC9kBHPF
	 YbGAicmv7iflfGJwYJtM8iXny2awQLRSF+ZsIGMt03YBBQ15aP1CzGZllxMtAbZzGZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794256745;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=KXTKxpvQmG4qWI9EEs3gz14VI5DReG+qhWlAxe45/Nc=;
	b=WSTiJFI6wfVYM7/qR9NT27gls+98CvVeQH9c1v6Hp5TD6PcGvgA2817fPu12w3DSKHX6
	 WQVTlCEPGc0JDuWypSD5LEoAVpsGVYA/KuoXOOKIZbou1ZUD1v0wlDzxFtkV/o4t/vcFw
	 q99/bavGbgFqBcmIQaQy4rYGXkJujN803jMA5zvG2A7JtYQjSM+NPYtYDXLv1jUJi29rJ
	 64r+nq1SMV2deaXxAWNxm16a9uKkLIH++dMakZOXAv8IUxO9PJpOnU5susHzGPGnhW8GW
	 XbkmvtQkvTPtAXNgzQCXESGOaxD9WyqPW33LoE7XRdnV08+JT5kfDfsBbC9/RvBRp3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=iv63CrR+;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848E6606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:39:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 848E6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=iv63CrR+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=KXTK
	xpvQmG4qWI9EEs3gz14VI5DReG+qhWlAxe45/Nc=; b=iv63CrR+NkxkquUtgPAq
	xEKCX7A9CKbbZWNdTu2lcZahuFZDtMGnqQQ74Y5qcP5fyoa0paj0o/gfo0jeMsZ6
	PUhWd1+03dTf4bDg/7g13tuVG0PJyP69YOLSYVc6vscb0Esftjgpico9K2F0e2xU
	gvPI1j2AzUtP8sFgOGxN5+wrZK9aRo7OODlLLtmbTavBpp4cc+f3ayz56AjDrTM7
	aIr0jOIJewj/VJVAAKUhDiEPrqOdvMOCfJ5VhEGGkSH+TSBpt13R0IfL+HDHvTnx
	8+eFb37xTHxQT6+/hxTCIVsdO15/jY1Sm9fqCbGQtGVpZU1gjvbCe1rBSfuvlv6E
	QQ==
Received: (qmail 3406806 invoked from network); 9 Nov 2026 21:38:58 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Nov 2026 21:38:58 +0100
X-UD-Smtp-Session: l3s3148p1@1JSC891fWJ0ujntg
Date: Mon, 9 Nov 2026 21:38:56 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Linus Walleij <linusw@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	srinidhi kasagar <srinidhi.kasagar@stericsson.com>,
	Ben Dooks <ben-linux@fluff.org>,
	Andrea Gallo <andrea.gallo@stericsson.com>,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] i2c: nomadik: handle pm_runtime errors
Message-ID: <avIvYMDqQtyBVIWI@ninjato>
References: <20261103-i2c-nomadik-fixes-v1-0-655c6af2cb70@mobileye.com>
 <20261103-i2c-nomadik-fixes-v1-6-655c6af2cb70@mobileye.com>
 <avFwLctRcnJHtINQ@ninjato>
 <avFzEaxgam-UuZH0@ninjato>
 <20261109100606.493ca48095bcc3527be18573@mobileye.com>
 <avICFAh07d7XrAIY@shikoro>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avICFAh07d7XrAIY@shikoro>


> Having a leak less and cleaner code? Yes, I am sold :)

Can you please resend an updated patch? The code change is easy for a
rebase but the commit message needs to be rewritten completely which
calls for a new version of the patch, I'd think.

