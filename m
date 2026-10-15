Received: from sender-op-o17.zoho.eu (sender-op-o17.zoho.eu [136.143.169.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3F237F01A;
	Thu, 15 Oct 2026 03:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792036717; cv=pass; b=WrjcTaz4RTEbhpGhSyKbrYkwr/4Q940JNn4hhCHl5mHS3W436q9nwLqUfOSt9HE4I0CAqJ3KVcuMnV7m49+88Sro+P7pSc1Z2/ZzMoQGkaCfkqRSpRL0ndsFcyVki8m7h2X1+DCJgpdz5UQkqmibg7zQNRo2Q3GeNoYPG9ATn68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792036717; c=relaxed/simple;
	bh=pifDH0uDw0EMlv5YUttgPbWoNR7hI3QK3uBz9udZ6wU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=P/cdmbTG5iLIxFjaIhrjhywZnZ9lG3+09Mz4lBhut1551QNim4UR2FrhA2YvZr63yrHxAMpyKQKMkz21Pw8FtsNKntirexdz/2M1Jq34ZL9TNcuCFOgbNTUJvNaMZlKqDAVurAHaOGUzryeJvgXs1Iuu3jzDvQgOAfN3y/HcmlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv; spf=pass smtp.mailfrom=iav.lv; dkim=pass (1024-bit key) header.d=iav.lv header.i=iav@iav.lv header.b=CZ6T92YO; arc=pass smtp.client-ip=136.143.169.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iav.lv
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iav.lv header.i=iav@iav.lv header.b="CZ6T92YO"
ARC-Seal: i=1; a=rsa-sha256; t=1792036686; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=XzPeRgEUlE3s0CSareeggcFzEnRfqc7xoCpj4oo2E82QbQDlix7V9KbvZ06IcxJ9gTngzArzUTu8Ow3hnS1aRWzkj4bGt5IyX1V/G2XM9xXXre3FgXvqDEIWBVpCSZhAKOblOCeOA12su29hYHCisU3xO6Ep//FiMZI0//bwxiI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1792036686; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pifDH0uDw0EMlv5YUttgPbWoNR7hI3QK3uBz9udZ6wU=; 
	b=APm6ig9UNFz+3FbTT3D47VhHIUfHoLuD+FBpe36tSfRK1owNP9HeEHs5gNYxj+4joCsSS5mXJL66RtNpKJZuCMltMuVEHqcsRaBylNyW/p4CAT5GOtq6RPo9cXi/9c35wZW3HTAV1X4fqE1IoK75Xa1ZS+pKdc4SeHsSTLf90U0=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792036686;
	s=zoho; d=iav.lv; i=iav@iav.lv;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:In-Reply-To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=pifDH0uDw0EMlv5YUttgPbWoNR7hI3QK3uBz9udZ6wU=;
	b=CZ6T92YOtgOrWHHIxR94ereumsmrWWD6DTCKVTY8K/N+10dtHCVhqhIuwMjV3YpX
	r6jdNdqtfKPRbFC9HiksDsmVyvOKT2GinsZhkRFVI6G0hRSMMpKSZUBWkRslMMian4S
	Q9AcHjYd+6rT1uvzOFwT/24GGv6Qo9fjV/ODwSzA=
Received: by smtp.zoho.eu with SMTPS id 1792036684329824.7527309360931;
	Thu, 15 Oct 2026 05:58:04 +0200 (CEST)
Date: Thu, 15 Oct 2026 06:58:02 +0300
From: Igor Velkov <iav@iav.lv>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>, Michael Riesch <michael.riesch@collabora.com>, Diederik de Haas <diederik@cknow-tech.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Fix devices suspend freeze on RK3568/RK3566
In-Reply-To: <20260624192726.781864-3-jonas@kwiboo.se>
References: <20260624192726.781864-1-jonas@kwiboo.se> <20260624192726.781864-3-jonas@kwiboo.se>
Message-ID: <20261015-m1-tested-by-usb-clk-v2-2@iav.lv>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Tested on ODROID-M1 (RK3568) with 7.3-rc7: without this patch
pm_test=devices hung while suspending the first OHCI controller 4 of
14 times, with it all 31 runs passed.

Tested-by: Igor Velkov <iav@iav.lv>
