Received: from mail.mdapi.ch (mail.mdapi.ch [31.3.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF82391849;
	Tue, 15 Sep 2026 13:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.3.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480420; cv=none; b=WLh99wRxQt22hNVhI8wHKlVqBRHa1aTRNkNXES1iUZLf8ioRyqEtrU8GHXSotRMCEk8ze2p8nceYxbskq2EIH1LRarJFk8BXTFI8bsaJqu/vrBcaWqcZq0qm4qgqbJe348tJvBmkvVSQBtFFQzAg0bUTWZR7sL1aD2CQ9DcasoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480420; c=relaxed/simple;
	bh=Mvc+hzUi/M0XV+3QInmKjaH23o7L5u0U3Z3U7NuJ/yU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XFzN+22BuM4pZ7uyOAb3+XbnEAJgC78YQLKUaQ6bJdXRTw1QH/cydXgFlr6yJQja/H9LcrQPPT7xBdF8x6XFjjeRM3O5XlMV+I532uxraYMTVdlHkJsfmBc7HRn6MlvRoPbP8vCQlj72zTpF6jzFk4gmDWihApEz1LZWtEmOhsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tillo.ch; spf=pass smtp.mailfrom=tillo.ch; dkim=pass (2048-bit key) header.d=tillo.ch header.i=@tillo.ch header.b=NNe58tWk; arc=none smtp.client-ip=31.3.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tillo.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tillo.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tillo.ch header.i=@tillo.ch header.b="NNe58tWk"
From: Martino Dell'Ambrogio <tillo@tillo.ch>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tillo.ch; s=mail202603;
	t=1789480414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tqNJN6r+R9FTM7z/9qcKuZusSlTXIajY6lxs4DtiQ28=;
	b=NNe58tWkpZIcv6/bgOgFEUCwqpE1158HwBtqmTNw5vhn11cEWdaIxUclShlOJxNXKr5Hrd
	ECsm+APMyJjozz7HJEcke8x6Vf9mMPMJop5FqQ3Kf3eoyVjYdgzJg/RU/ccklGYH38V8c2
	Kix15uM1zWl94kgnlyKcaUh8xxUWoIDKQqSj6MzTBwPnBS4NUEJHuoCP7bzGh9OZizHQSb
	aBMQzKeccRDZdQRJWkmT0A8okjT2hVOwbrHt4eAiJyD0xfaL1nVsF+0kEeBkhgMqN+Hme+
	qGShLltJ0aJbFGFpJUBFsvEBFxOleXqMVA8elDAUPOrJuXVL68wBKybBHUu0Dw==
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kees@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com
Subject: Re: [PATCH v5] arm64: dts: mediatek: mt7986a-bananapi-bpi-r3: add ramoops region
Date: Tue, 15 Sep 2026 15:53:33 +0200
Message-ID: <20260915155333.821189-1-tillo@tillo.ch>
In-Reply-To: <a463a9fd-dddd-4b78-8408-2be683f80f13@collabora.com>
References: <20260915141226.600486-1-tillo@tillo.ch> <a463a9fd-dddd-4b78-8408-2be683f80f13@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 9/15/26 15:27, AngeloGioacchino Del Regno wrote:
> You forgot to send the 7988a bpi-r4 patch :-)

It did go out - as v4 rather than v5, which is probably what threw the search
off. Only the BPI-R3 needed the v5 respin, because its v4 accidentally carried
the BPI-R4's values. The BPI-R4 patch was already correct at v4, so it stands
as sent, and it does carry the plain reserved-memory node you asked for:

  https://lore.kernel.org/all/20260915135722.566918-1-tillo@tillo.ch/

Same To/Cc as this one, sent 13:57 CEST, five seconds before the R3 v4.
Patchwork picked it up as 14818166 in the Linux-Mediatek project.

Happy to resend it if that is easier than fishing it out of the archive.

And thank you for applying the BPI-R3 one.

Martino

