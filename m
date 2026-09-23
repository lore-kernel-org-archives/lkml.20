Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AAB279DB1;
	Wed, 23 Sep 2026 09:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156991; cv=none; b=Nw4iQAPRAZu8GLXdHpA00jpc0kr13/09QGrL+Z5fMRb+ApRj8XqIU6xbsU9ld2CVZZ/i3H1SwJyrjNjuHmysEueeuTcqK453DArn+YPgvnrD2vzDhsTxdzeHkP/rrL9gOA5QPNvtzigp1c38x6F51BUWDUjjFY0/1q/oPFjSQ8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156991; c=relaxed/simple;
	bh=ZllYfIqMj5QwbDcYFikdii50JKHrD69B4mvu4oa3wTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pmOSjSg6M995qodt8DHKyCvAbbWB+i7ZZ6g5gzCZ0TF4/Y2v1NIJ2RKTP4myNlopDRjVWEQhbccTsx/fh3qAC64H5Fqk+swJL9uWFQLiJ2dAXZ2JZ+JrXXkmCDUDJXJYzLIvTeQ3NU32mZ5TJCaK6UkvSmaU7mmYr6BEb1RWh7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IK4n4bXJ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IK4n4bXJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790156987;
	bh=ZllYfIqMj5QwbDcYFikdii50JKHrD69B4mvu4oa3wTo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IK4n4bXJOOQ+sysykbv7gYumDmA7LQlGFjhUNXn6BP4KhBFIb1ZF1FslH9MzbNF6N
	 ezQS4sDTXwLW+pb3JUIocSoTkzrtCtYonylmhul2oq1q4AwuWbUfUrI+WP/sgupZbi
	 IgP49JG45XwreBReCHCNx0lKx1sgPiCIJjrQOlKLdaVgnYmOHV0zIKti/PIUyr5eU0
	 UZMaHqrZ/62AeFJxg9SNGS6U4kLWl8x/ehub2803RZSU3o0ieHIqk18k0+qX0fRrm8
	 WgXfzXA0kxxPm9v4MfvarvhfHTDlyaMDf4PxmIzhxx7bBoft4EqNALmRHn50KBak0y
	 5VhQOBEtfCX4g==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D8A8517E09ED;
	Wed, 23 Sep 2026 11:49:46 +0200 (CEST)
Message-ID: <78abee33-9ef9-4fed-9968-eb2010068f6c@collabora.com>
Date: Wed, 23 Sep 2026 11:49:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 03/10] media: mediatek: decoder: Move firmware
 selection to platform data
To: Kyrie Wu <kyrie.wu@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Yilong Zhou <yilong.zhou@mediatek.com>
References: <20260923081246.268182-1-kyrie.wu@mediatek.com>
 <20260923081246.268182-4-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260923081246.268182-4-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/23/26 10:12, Kyrie Wu wrote:
> The decoder currently selects its firmware backend by testing optional
> mediatek,vpu, mediatek,scp, and mediatek,vcp properties in the device
> tree.  The firmware backend is, however, fixed by the decoder compatible.
> 
> Add the firmware type and initialization callback to the decoder platform
> data, initialize them for each supported SoC, and use the callback from
> the platform data at probe time.  This matches the existing encoder
> platform-data design and removes the DT-property dependency.
> 
> Fixes: bf1d556ad4e0 ("media: mtk-vcodec: abstract firmware interface")
> Fixes: c7244811b1c9 ("media: mtk-vcodec: add SCP firmware ops")
> Fixes: c3da5e939cbc ("media: mediatek: vcodec: support vcp architecture")
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
