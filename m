Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744742;
	b=EzWRdKS93JDi7/zZMW19eykmrD9WKzCBn1LY2V8pp0FnYzrRERri8gKHJ4DOoQv1sD7c
	 J3aRHEkqDlDmSaYlxMmqZKzYnAWk+bP2O+Xk6gslKnxFuCTwkYKya6k532v8JFj15JG9G
	 m6VYZnYhxRW0cRmSowNPfErtXYQJ5AuI8FBCHewndxCThZgKtzvcI7XkhW50s/ER9zx1/
	 +/r7lZxTzJP0UZry6BKPuPmhec2EQolDZA/X7ZZPDXljT0/MPzryYp0cJvwgMEW+ThUVH
	 IiOa4SzpCWTDK8WJ7/Jq92Dem8QrBhhljLR15f7D9PF+IBzsjFMFZYkFIjF6bFxu3lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744742;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=2OtdOcSZTvSavNsYKJF99A858FVACHJIK/aEw7q35Aw=;
	b=yFJe7ZE7yNJ0BHp6zzduY02hjV9gwjjZEzBGqA/z8XWM+9QaSNKcWIkNIorp7m0zIxwj
	 WGiSBZVhxodbWlpcZZFwO20/EVF+QtZKKn2qrpKk1ZecZiPNXSZmXT5vFebH2t7E4/Qdr
	 rRHXnyxw4KQADz1pdyixLOO11U+/FRwHk9epqxXhV9eaY62pENRVu6vJG/wEbPstMNZeu
	 06JKJ5Dw+zEcgN3YTHfz8qGE+E8mQRqYXM9tM/SO1LiUva7Un6cPd3+rwi9/JGXfeutZF
	 BvZ+1TGF/86Wvo21NenQQytvF5xCFXiHYtpkN27UqhesdFg8Qpncbz+MERrmKvZWU2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=qW4r69u+;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1574C606A32E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1574C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=qW4r69u+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=2OtdOcSZTvSavNsYKJF99A858FVACHJIK/aEw7q35Aw=; b=qW4r69u+iZjrqMFYtfGSCEGIEF
	/OO21vzusu7a89jbOT89Z2Rw76399SnyF1HpCIXIhbYg/2u6z7uxC/NxaRVFL5MMV0KIhb/pVIFgz
	oHNB4MECzBEqwZTDnzA8FUkR8jKd6ynHgCIqD4dM+b7Y7fxa2frc3VTZIbCi8ooaDUcEiuEZxidR0
	SVsyhj3ghYQpRUDayxhFIydokOBUUbcx4jWT7YjUGSoW1vkm/OyvSqE/SAjtAOpIkx/lFDnXoJHMW
	mg+pCv8RHh8+UuNqyZKVtbKDzJEgMjjZwE/kFXVZ4Kk/MV37EukHyI228jXYb/6XLscdy1UhstWvd
	nSiv6VCA==;
From: Heiko Stuebner <heiko@sntech.de>
To: tomeu@tomeuvizoso.net,
	ogabbay@kernel.org,
	Abhai Kollara <abhai@protonmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] accel/rocket: use dev_err_probe() for MMIO mapping errors
Date: Tue,  3 Nov 2026 23:25:26 +0100
Message-ID: <179374472348.512720.15274017145976235152.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260515115335.4104438-1-abhai@protonmail.com>
References: <20260515115335.4104438-1-abhai@protonmail.com>
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
Content-Transfer-Encoding: 8bit


On Fri, 15 May 2026 11:54:07 +0000, Abhai Kollara wrote:
> The reset and clock paths in rocket_core_init() already use
> dev_err_probe(), but the three devm_platform_ioremap_resource_byname()
> calls still open-code dev_err() followed by return PTR_ERR(). Convert
> them for consistency. dev_err_probe() additionally silences the
> -EPROBE_DEFER noise in dmesg and records the failure reason against
> the device, where /sys/kernel/debug/devices_deferred can surface it.
> 
> [...]

Applied, thanks!

[1/1] accel/rocket: use dev_err_probe() for MMIO mapping errors
      commit: 49f40f15d20f5b4073d517da7efbcea079f1b9e3

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
