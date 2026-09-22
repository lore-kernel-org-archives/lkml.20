Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FDD53B5EE;
	Tue, 22 Sep 2026 11:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790077204; cv=none; b=UqhjFVTjHuK6XE1VyNEBaHFGMbKeuAWP+Ux/BzWZFPM4y1WjHdnDhxquG7qgp4tGONxWquTNlHW6IlXrVnPj9rxtZRTpONrPU/hhE6cth7mFh5zvPTdYW+GMuCpjLT083Uy31CZ5G+085N+1uK41ZYmSsxYLDzs8rsEjCoSPxS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790077204; c=relaxed/simple;
	bh=pi7L7sEcu1+h5k0WGFL6886sxuPYOeK2alcgcEumhis=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DSNsPqQWBlU1pXLm00vqrCU6H7A18TatayBaHzQEly9YYXcvN8WhAYQ1ymJ4P6I3EZy6jO3iNhGF/P6qGRFRTL5KXh2Y+2aYT8vrxB5bw30CW0IZCoHCwV+5PysuP5GoWzDc06F2E301y+HfNLNzho6iB6UVe9TMlYijMkmNBB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KL7SKJN9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KL7SKJN9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790077193;
	bh=pi7L7sEcu1+h5k0WGFL6886sxuPYOeK2alcgcEumhis=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=KL7SKJN9W4UhzUr0Nkvfj3KJnOROhpUVUIzGfev899fApvMDKzW3JBrmRxea9wx/V
	 ioBITVQdOVTGegmNM9rNnHLI9+W+O2TZbI+N4A3uvNJE2tpoqFwhsGA9O1LbM06CYY
	 9plaYLnj3zejQDRTH2Q4k9pIjtlTNpA5mJ6vbSKOsvJp4JFLMnMfr4xM2HP1CO6iW3
	 3PinqqIEwuqt0/AR4KucaLTTF4pjFLqcEI2e7qXiv6tpvWYCnimyhfGakLSR5O8r/V
	 0bMSR6FsGnheagzBxL4Dpw9emuVYUrj64Z7HoN0s4+wRwGDD9DKNUo7EeMJPAJgirS
	 EA1lp+LHPGaHg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0C21817E0A66;
	Tue, 22 Sep 2026 13:39:53 +0200 (CEST)
Message-ID: <41056327-dcc5-4252-a92b-b268357b6659@collabora.com>
Date: Tue, 22 Sep 2026 13:39:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 11/12] media: mediatek: jpeg: add jpeg compatible
To: Kyrie Wu <kyrie.wu@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bin Liu <bin.liu@mediatek.com>,
 kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>,
 Hans Verkuil <hverkuil@kernel.org>, irui wang <irui.wang@mediatek.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260922091530.241762-1-kyrie.wu@mediatek.com>
 <20260922091530.241762-12-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260922091530.241762-12-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/26 11:15, Kyrie Wu wrote:
> Add jpeg dec and enc compatible for mt8196
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

