Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E62380FC8;
	Tue,  8 Sep 2026 07:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851415; cv=none; b=YTBOmJzuJGAcUVZ3PDmpqd45q+K0OB4sqeWSs7CYC9p6ExRZ/AKM+m2SBuo7P+JMNBsFng+4fLcUDZ46IRhZacqigufUb1EGyo5k+//q3GZJxTax3LED+s0jckTYQy/AvyLzomJtSe+zSG7HdOnI4s4tYRUm14l2bHdN0+5wUn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851415; c=relaxed/simple;
	bh=XYcm6/u4aPrRxtMnU6crOjHT12cC2RoaM2V5PFQ3WGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B48b/a60wvJb5vYK/xb9i5P0EkFHOFhOj4zeSV4e+3Fe0E2l766baJ8MJsLEe3YALUrJ/qaB7+9P9UTiNttI30WyVp48Ggz9eusx+GtCTcyZYhAmk1JDbtu5phRiru48qSiPN98uYAVZBeWW+HrIfNqye28lwEwyEsBwgKKYyiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bcSUTkTn; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bcSUTkTn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788851412;
	bh=XYcm6/u4aPrRxtMnU6crOjHT12cC2RoaM2V5PFQ3WGo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bcSUTkTnjY746bpRxVLz5XsbQtiYhwkK1l3rnfjDBMl5EKYfEIBHaNvXMMxt76vNd
	 SSfhWY6E7bVF8lPncqvs8UDQqyRzXZ+HmZifwXM8YnwFIQ9JZQefXf4joLloH8YNTW
	 xAiyynpiO9MulhBIx5XJDo54dPd8/tUO5yltVTmFjHE5HYz6CfNRoRTY8EO+eRnnT/
	 Kl2BmTyNgsPhbhE4y31nsk71eSKLjF0zu28vcMSfUrKWdsD3pFdQnsWO0oqwf2vOS+
	 A2zJ1APW0YMa75G6RL8ScdeeUzR1hBfb6uwuS1DBigazO52U/QTslr5EtWe9ZrgGGx
	 ItCIdJw106b6g==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AA2B717E0945;
	Tue, 08 Sep 2026 09:10:11 +0200 (CEST)
Message-ID: <84dac42d-39ca-4d45-b5ba-f23e6fd4675f@collabora.com>
Date: Tue, 8 Sep 2026 09:10:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: dts: mediatek: UFS cleanup adaptation
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260902-mediatek-ufs-cleanup-dts-v1-0-7876e7a27a9d@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260902-mediatek-ufs-cleanup-dts-v1-0-7876e7a27a9d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/2/26 12:32, Louis-Alexis Eyraud wrote:
> This series goal is to adapt the Mediatek UFS dt-bindings changes
> done by "MediaTek UFS Cleanup and MT8196 Enablement" series ([1])
> 
> The patches were present in the v10 revision of the series ([2])
> but it was requested to be sent in a separate series. The first patch
> was also modified to add a valid OPP table rather than simply dropping
> the freq-table-hz array to fix an issue detected on this patch by
> Sashiko ([3]) during [2] review.
> 
> The series is based on linux-next kernel tree (tag: next-20260901) and
> depend on [1] with v11 or later.
> 
> [1]: https://lore.kernel.org/linux-mediatek/20260901-mt8196-ufs-v11-0-dbd007704490@collabora.com/
> [2]: https://lore.kernel.org/linux-mediatek/20260730-mt8196-ufs-v10-0-bc5ecef202dc@collabora.com/
> [3]: https://sashiko.dev/#/message/20260730-mt8196-ufs-v10-24-bc5ecef202dc%40collabora.com
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Whole series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

...but obviously I need the bindings bindings to get picked before being able to
do anything here.

Cheers

> ---
> Louis-Alexis Eyraud (3):
>        arm64: dts: mediatek: mt8195: Align ufshci node to dt-bindings changes
>        arm64: dts: mediatek: mt8395-genio-1200-evk-ufs: Complete UFS power supplies
>        arm64: dts: mediatek: mt8395-radxa-nio-12l: Complete UFS power supplies
> 
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi           | 35 +++++++++++++++-------
>   .../dts/mediatek/mt8395-genio-1200-evk-ufs.dts     |  3 ++
>   .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     |  3 ++
>   3 files changed, 30 insertions(+), 11 deletions(-)
> ---
> base-commit: a7957fd910b93155d81edcdd4472551764c8957a
> change-id: 20260901-mediatek-ufs-cleanup-dts-6a7f7a3e1292
> prerequisite-message-id: <20260901-mt8196-ufs-v11-0-dbd007704490@collabora.com>
> prerequisite-patch-id: 841e7d21c8ca7e3f35741279672e23c84db3d165
> prerequisite-patch-id: 44f254cfdbb97cdf19ab4c2ab8126a95d6e2b050
> prerequisite-patch-id: 5176591d5737581d21ff2d045e8f16c30fb8a39f
> prerequisite-patch-id: 54d073543d7687cdc9cea3d91025b2bae3cc8e8f
> prerequisite-patch-id: 3c082f576efeaaecae285d6ba734463b39f2a9df
> prerequisite-patch-id: abe5e24769fbb4dd6399bb9ac3a6c7c8567fe6ce
> prerequisite-patch-id: 1e16da816ec429b5261e5c2145ed11646acec4b7
> prerequisite-patch-id: 89e0e053a67aba4c8897110ba32c9ee64acf7dff
> prerequisite-patch-id: c968b5646b227ceb339883450a5bba635033cac3
> prerequisite-patch-id: a193861af215b41231ff22aac96e3f230881d896
> prerequisite-patch-id: 47fd54e3799a18734587ce17776f75c823ca6e23
> prerequisite-patch-id: 7bce272ba16fd694baa7e75c3612c48b64b70ed0
> prerequisite-patch-id: 2623e1613e37cf92a13f5912053f216897d44e37
> prerequisite-patch-id: a27017f12729000629e7397677468ec43d56b488
> prerequisite-patch-id: 90be5a4db503b293b6e2aaa11b6626764f74c600
> prerequisite-patch-id: 17987efb08b3f7882577822709ddf1b4b0a47f17
> prerequisite-patch-id: 3a4a3de5953f1aa5adbe9d4d919d79360408bfcb
> prerequisite-patch-id: 8c0177924a6a5ced7d097d1069de693a29bcd7fc
> prerequisite-patch-id: 41a2390410768e2331b07b9806ccb7509828e2e5
> prerequisite-patch-id: 847e46df5bbd0539b1324d628f601122728e025c
> prerequisite-patch-id: e97641f63406d43924af801293e5d24ecd440ba8
> prerequisite-patch-id: ce5a76f40d591a54631fc4caebf97bfe49d57ef8
> prerequisite-patch-id: 74648a530be0081338cad49722eda0839c363455
> prerequisite-patch-id: 44bcb8920c4cb56811943d0d51bf0de9fd363ac7
> 
> Best regards,

