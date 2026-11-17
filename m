Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915179;
	b=Tqs1JS2801FgVXuPkg2fchhVIUYb0MPufi9UGgus+5HTqCgZM4rs2ny7v+XbY+LvSxB5
	 1zra55xNLL0lTaUnmR9TKZDrniQA7W07it6Pv4x99ujR8UmbCtWMBz4wMIMIK43b52242
	 SUeuLe+qa5DsJks0CcAzVN7tndT4P2m3UBgTIw+3YzVct69ozN7l/kAg9k8eJ1et+uAyZ
	 md1Gz80+v5HJHnhvtYgSX6lNfNChlXvnNZLRslOlStpwY1N87OcSGx2kbkL3P1AhVctw0
	 824OSKWryfxO+QwuR/keGMmuW7iua8AvlQVtzfYCFtwG5IKfeQk7w2cvYJ4KCuGv09Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915179;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=CboLC5QSvHLts6ZlQcICg7LChxHmvhJ3KQ+aPxCl0PY=;
	b=sJnDqzbpiCiRR1U8v6xWVDzViiQdgEhbDX73KkJAKPoGq5K7axy+qrnvoE2vQG2KqXM1
	 YnZKiIQNHUg13jom7uZgqXhJkrOMu8+gBMxKN/RqzTKmcA8VuvW95MtnPZCuehlwMs6FY
	 zx5Gw3SMSvOUVBD+K1BQYHdhq8Bg+Din/RgKIG258UH1CVetz/YFQxhbmfc1RodfxC2Qw
	 ju0Nvby+03Pjs70KfgwOMOzVq4dKLxAmHzhGaBbhxNuiJk/8QGnOTqmkXSTnMjYEBjnKE
	 +ewnGC++FeHI8O9clqTimyq+Iz68gPpVefTBQe7P7jmUdyUCSzZMM6+WRddyYmqkaYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=H5wPKqgA;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C792D606A32C;
	Tue, 17 Nov 2026 11:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C792D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=H5wPKqgA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794915177;
	bh=YgsE1D4jE1y2PCk2DdaKnIk1JqojvotIfqG4VkxS+ac=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=H5wPKqgAYr/7V+t/AtyledjUHXdXfGpJR62CvwPIMojQMtYaUx4UA/6xCY7iWKZ+q
	 T8NthVONRC+6N1+jB+9CjDb7Nhpqaz4MOK/iI6nNxslaHXpgFhqGaJgPNJjLygMZ3g
	 OOTNPG4BoSw+t4Aigf38kw1kmlaNSyB7cTh3maYi3bmy7pVBYe52dqsTF9A2EpvlrO
	 HnM1uk/fJjrCvV6+XZ++keCUP56RRYpsH35qnYhBgq0734K0aDg1qdr6Nu3GxCcfqh
	 MkcKfWYLhwlsYgxcHB8OV+jBX9J4NDoXmzS3NG3UUMfjW9zahTBHTj6MU619ZjjnKG
	 Q2m1xKugJzhFw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 64C5817E04B4;
	Tue, 17 Nov 2026 12:32:56 +0100 (CET)
Message-ID: <f738d2c2-5e3a-47a9-a499-a9ee284f92d1@collabora.com>
Date: Tue, 17 Nov 2026 12:32:56 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 05/13] media: mediatek: jpeg: Fix multi-core clk
 suspend and resume setting
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
References: <20261116013402.1273016-1-kyrie.wu@mediatek.com>
 <20261116013402.1273016-6-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261116013402.1273016-6-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/16/26 02:33, Kyrie Wu wrote:
> Make multi-hw component devices own their clocks and suspend callbacks.
> Keep single-core clock callbacks on the master device.
> 
> Stop new jobs and wait for the active job with v4l2_m2m_suspend()
> before disabling component clocks. Runtime-PM references keep clocks
> enabled until job completion or timeout.
> 
> Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
> Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-hardware")
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

