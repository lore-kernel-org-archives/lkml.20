Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=136.143.169.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793664125;
	b=nOkEuuGJiUha1ptroZcgNQAwXiepeA/2QUdGaoXHgeP7RK44Ui08ZMzvre26eleurZAT
	 8fvHj5sYnJjrt4IaMz6p5KlHRZufMVTRcc3XSnRr0O8RxAvAvYyPY9P1UTzy1IS5ZxIrP
	 5VZUA+1CEZIaKtGzbZEAQR8gMHmdMgRbijqgUhI8b3sQdNsN9LMw4W6OGQ5BV5b8oAzG+
	 kGdCo7ZA0nkb6WtHFSsMC9vQX13/Lrzlk3aoY348YRCCCLI/wgeZosh/NL+55TYF8ZA77
	 iIU0/MLTjkoVlgq9NXrn2Xw75+CnIT5t5AcnprAbaRZtFVdCZ6aIEAZUDR70PiKrgDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664125;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 In-Reply-To:References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Lq51iNfoBTarnKa8QkowBkcUOmPokb/N+PZR8Ux1pks=;
	b=HkFHQcoQb6CYKrW7CEOBuhqwuxHFllyC9fTLuEr5JI+XMuGvl7NxljtxFkSDW3r8aynw
	 spo0rzq3t4IBsd1f4MF+fGiHo7MGnifNBV+Csi1LvWBOzo4t8kN4t2oRgSb6cU8GF1/kk
	 WdoYGypm7Kq1TfRWpIkh8p5H5fA1Y5IUshJXOigqv3CNJgMq8qh1/1Zxn80pqbQNLt8wq
	 tby/vFGlWB197C+YaHG+uxQEakimiOa9nQrei/FeBi82zhbElpimZbmWABY6HfhLLGT8q
	 JJfp9a87ayi5VaLBJ9mNDvSDx+etcyOoKdlac6g0yub4Esx7Ryn3JXAdUzKhcYOyLWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=iav.lv;
	spf=pass smtp.mailfrom=iav.lv;
	dkim=pass header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=JCyZO1Ff;
	arc=fail smtp.remote-ip=136.143.169.15
Received: from sender-op-o15.zoho.eu (sender-op-o15.zoho.eu [136.143.169.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD352606A329;
	Tue,  3 Nov 2026 00:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD352606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iav.lv
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=JCyZO1Ff
ARC-Seal: i=1; a=rsa-sha256; t=1793664107; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=hsUZCqhmQYEC0EqIJS73nyaYwq5sSez0kknqgGO6ZZdDFGtBYqyoLd7pwTsy3BUpCz63rbA+2CmOaWu6O6yzWYMqrTeelwhiNE7oXXBcpfe3TC1Tk3vYrxSvPPbIeYWvfakt63dTwL6xhSi5OjuTJ7buH/ZVs2M2NjJFAIjVQ4Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1793664107; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Lq51iNfoBTarnKa8QkowBkcUOmPokb/N+PZR8Ux1pks=; 
	b=ZjaQSGb/8+qmfizNu1c3fJF0gl7GRaIP2T/+PxULU8c+7bC+Qr57VEHRXH8GnMShrh2at2/yjXEGskqhGyDNQS5BVlL4TLYHnl1ouhZ2IU0VWYIuoZ4Z0vChTWRTZqDhENORNbqvjIiYcb7uHHinVkCnppubrf5Bx2Unw4y30bg=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=JCyZO1FfBhLrMrUW6H8SajgJ3Gmwyl4EDm3XBw65RFuAp/B7TUukuL0OHlYvMt6mok0Kk6TiWtmE5DuD1OUIi6u0RPI+cLarS6Vbir4nNwBoEC3ruLGOFG2NQwZJrKdFxgagE5ve6D+w+mP+YYwzbURW+jcAm5YqS4e6stqUPpM=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=Lq51iNfoBTarnKa8QkowBkcUOmPokb/N+PZR8Ux1pks=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1793664106301154.01142487451705;
	Tue, 3 Nov 2026 01:01:46 +0100 (CET)
Date: Tue, 03 Nov 2026 02:01:45 +0200
From: Igor Velkov <iav@iav.lv>
To: Jacob Chen <jacob-chen@iotwrt.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Igor Velkov <iav@iav.lv>
Subject: Re: [PATCH] media: rockchip: rga: Keep the clocks enabled without
 CONFIG_PM
In-Reply-To: <20261102-rga-runtime-pm-clocks-v1-1-1bad7807f037@iav.lv>
References: <20261102-rga-runtime-pm-clocks-v1-1-1bad7807f037@iav.lv>
Message-ID: <20261103-rga-pm-withdraw@iav.lv>
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
Content-Transfer-Encoding: 8bit

Withdrawing this: ARCH_ROCKCHIP selects PM on both arm and arm64, so PM=n
only comes from COMPILE_TEST builds, where nothing binds to this driver.
Discussed for rkisp1 [1].

[1] https://lore.kernel.org/r/20261102234238.GD3559911@killaraus.ideasonboard.com
