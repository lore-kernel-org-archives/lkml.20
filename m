Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793123911;
	b=4OEt/9sZvL6C+c36ZRB7z857U0m3RhbbaUGciGGdzO6/irunlHDmRrb8Nn0i9CqNE9lg
	 g8n1Rt6rmqJBPGROuzi22X3JuhQxa4FOMax/DqYbi+y56zlb48Wqa48WjR/ki9SAuTAP+
	 NOmzL7Fx8RBclZa3/fODJ6cGJ+QeRtwwQah4b/pWeocUgD0FCyWFe3NqM7Jgx3lR3sGwP
	 7RUYexJ3S3weifrWK+UCPHuDlYbPjoFYwtn8NoSIm6EFKGjOawmQIgQb7+b6TJj6HX45Z
	 r5tzjJwyHtOr2tbxtCUikDuYLTKiUIeuzjaECOs/WklzZmAG7rxNycPt3ry3MMge17A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793123911;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Kluc6hFtXJb4Em0lOMEIwEdYqD1TeutOmfFOrNFeE7o=;
	b=1SlX8ISt8Mql5nWt7n9DCC+TgXUJy8ytLdwvTuiY/uY0EYdS4OiS7OwiuA5Frow7YLrI
	 6sRrdzOmUYxP9kEbCdNflR7HA9A09eqbs8XAxc0d/cz7oHsPO3PQ7/7FFnt0u4D852f9l
	 neKd+IvZtOSg6LgSptd8xNFftmiXVtS7lefVYY4HA/Rm38gXnI94Uk4GRTx8WXalx7fIb
	 qqrRkBAOwim6hsPYEpDLP9XX4xIl5O2y0oWe2ZtpbOuPgeVtB10rnJnXXtsoONHJz4gDE
	 qKNRMCKc43ZmuuGSwgmkBE5kTaoIKl58DSQHk1RCfr+xxfSYNT3NBgQwiC7U1xqxqfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n781NjVq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF06606A31D;
	Tue, 27 Oct 2026 17:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n781NjVq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15BEC1F01825;
	Tue, 27 Oct 2026 17:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793123911;
	bh=Kluc6hFtXJb4Em0lOMEIwEdYqD1TeutOmfFOrNFeE7o=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=n781NjVqQ7a8HXlnJvIXpV1KW0jFM9Be0hvr/LVy1uguNYye+k2OJ5kmLcoc+wiFN
	 JfmvUYUzUWBYJ5yuJ/fwopsv2m0H9HoG/3YSHWDEBB3vsgqZ5u8v+ZNjElRpP6Bp/h
	 O5ukEYSAKsgNcqJ1N2Z3/ngxey+FqqgtdR7Zq9YH48q5L7rkAOFfB9xL27p0D15ubf
	 nzEnlOQSkxCPKdl9ehHtjqyRDMBEgFS4fK0Cqs4uAepg90YxoxM0NYVP9TdirhDRLl
	 V1X5pT8OEjcRskHfoUsLRp5VvIkpKAuaZi9Kjapee16WH5NHTznm4/2YJB+LqZn3Ac
	 MOrHH8KL4YQ0Q==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 602BB1FB1F2C;
	Tue, 27 Oct 2026 17:58:25 +0000 (GMT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] dt-bindings: regulator: add Will Semiconductor WL2868C
 PMIC
From: Mark Brown <broonie@kernel.org>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261027051055.213301-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261027051055.213301-1-xiaqinghuan@mail.ustc.edu.cn>
Date: Tue, 27 Oct 2026 17:58:24 +0000
Message-Id: <179312390429.199157.12016700546762955000.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=937; i=broonie@kernel.org;
 h=from:subject:message-id; bh=7GnfAYrB0f1KOKXlzm+iTfZ1ZUsE2LHmey/skD6jKZ4=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIePHPc8Dth7onf6y9dW/Uxw6SZY6bNnFztmUeVg6Xn8
 j+XqtDZ1lHKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJuMoyMsy8/2tL0To9H56N
 r29nMQr9qzk8PVfq+0dzj40NbNbB2kAVJ1Su3o0rmW71sTe8LjAo5rLd6+mZk0vuVf//+mAp50x
 nZgA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> Add DT binding for the Will Semiconductor WL2868C camera PMIC with
> seven programmable LDOs.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

> @@ -29303,6 +29303,12 @@ F:	include/linux/regulator/
>  F:	include/uapi/regulator/
>  K:	regulator_get_optional
>  
> +WILLSEMI WL2868C CAMERA PMIC DRIVER

Please keep the file sorted.

Seems a bit premature to say we've got a driver when this is just the
binding!

> +M:	Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> +L:	linux-media@vger.kernel.org

A bit odd to have linux-media, I guess that's because of the systems tis
is usually used on?

-- 
Mark Brown <broonie@kernel.org>
