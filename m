Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794067809;
	b=4hKNcY2h9TTIUmvEjaB+HRt1OxkZlOTh8pWvZbjnHyH9bmNzr36q3OcbkRoP44Qic21Q
	 PhJtA3anJklPjKlNvEqXy0ScYb5gbn+33qh1lUazDcsKNyT2G4u4wfll73/KpOCKsbQGX
	 D6tfuqQsT/6CDkxcFGbCNq7fopzDOS7/UTpTnA6dV1hUhCveRa6JJtY57l9y5YXDAmKAP
	 3pv+6jB7KJBbBIcZUQ07tR67nUCq5BbYYIQFl1g/9lrVKht+ajkT4E0czuhRcr/K6nPV9
	 GM/c/iP2s4VGznWPgET8Q+3g88ov7Zev17fBNbVkxJCPxq+KAVV190ChjtOZiA8L52A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794067809;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=lfY3hw5XPTAyzcZH7BsWpbjXSyihNBuJm1ZODEuFXtg=;
	b=GpPsKlWIHlk5S2fPjeWnDPFDPZkXoesQNAD3v71jgkh3qC1OQ7vIYAKROkrt3+LKthHr
	 eTcJVablcArmXKVsn+jKn3OudAfVLUbcsZ1Ol7QiUHItqR50IcBd2lVcb0ylQ8OztRptc
	 asZH7tHq+6M0jO/p2blMwA/LZG5g5S7u444QYO+5UIh8PALkdnN4AzHxlcQPCUPFZCZDz
	 rdVzI3I8oARy9fDyY3n8ENZOzkZoxLnLTwijDrClCsFIxUS+bNFyuTT6f5H7/dMHnZ2Wm
	 UXZOZl+vcqbevPx0oPZRSBe/DHennu4FcwiignUjaPCVElpSSFy+iSHeFLOYrWVLUsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ViT6VauI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C17606B7AB
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 16:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ViT6VauI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C87901F0089F;
	Sat,  7 Nov 2026 16:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794067808;
	bh=lfY3hw5XPTAyzcZH7BsWpbjXSyihNBuJm1ZODEuFXtg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=ViT6VauIhlMph6CsVeLT2Yuf04Ns1sdT+jFtMMTSwNcPU2QlazYSqJ50SHoaKfaTU
	 CQHLFgBopxcrjJkRQGa23It0NS+Nwx+lQWwIrOVfP5tK4N5sf8lll+DmSjjtJQZ9d6
	 Mv9Eva8rtkd6V7IKHP4h8L3U16y6pgwd0TmEM2XJ0hGOAElW5pfs4f367rKYvwT1g4
	 Hd1Eo/VRDelE5hPUAx9WsMSnMb2bLJCp4NNUhv0d0AMOleQr0Lur+zSdRHSXqKgimh
	 pB1yLnuVWpLVhEXTGGYk98b4C9p8z4WY355LKKeKu/WyRpZwbpl4e29kgMpIT647Eg
	 5f+CS0k2uLouw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id F15762B5A7D9;
	Sat, 07 Nov 2026 16:10:06 +0000 (GMT)
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
Subject: Re: [PATCH v2] regulator: as3722: use the platform OF node setter
From: Mark Brown <broonie@kernel.org>
To: Yige Jiang <yigejiang86@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
 WenTao Liang <vulab@iscas.ac.cn>
In-Reply-To: <20261105100342.34730-1-yigejiang86@gmail.com>
References: <rc-review-20261103-19-ee1e37733b2e@gmail.com>
 <brzyrqnyrayxdpnyginamtdewj6cp3odhndlstjp6kupnr4q3e@rt73ebxxvbms>
 <20261105100342.34730-1-yigejiang86@gmail.com>
Date: Sat, 07 Nov 2026 16:10:05 +0000
Message-Id: <179406780591.3424803.16395424488807885604.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=551; i=broonie@kernel.org;
 h=from:subject:message-id; bh=jNRiYacMim98vHJ8tECPeAGVHWlLaqx93DPpEK84RrI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLe+8a5d/2PyV7Oyrt215zg/pVXovrfmaj4a014sCntz
 dMb3ZprO0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjARe3OG/8XJyipyJxNDL0RN
 XiMr98np/Ez+zCu+bHdZBQ+ZrykTPMrwT3lLv0OOqp7lotOek/h6Q/fVG1e+1F9S019drLvuHIM
 AOwA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> Use platform_device_set_of_node() to synchronize both fields and
> give the device its own reference. Use __free(device_node) to release

>  static int as3722_get_regulator_dt_data(struct platform_device *pdev,
>  		struct as3722_regulators *as3722_regs)
>  {

> -	pdev->dev.of_node = np;
> +	platform_device_set_of_node(pdev, np);

Are you sure this is safe to use during probe(), which must of necessity
happen after platform_device_add()?  In particular with the interactions
with fw_devlink.

-- 
Mark Brown <broonie@kernel.org>
