Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884D753D0A7;
	Tue, 22 Sep 2026 11:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790077505; cv=none; b=IvcDid5phoIALYi7dCfs0vG6O2be0jllgX7c7pCK6frdcDalPNCMAFpCxXPh3xAsCNNx5oczgrZxatmHbADkEI982uv2+T5uPnBIeHqoBx10EiSh7C73D50gxV/RsZLJQP2XOf9xN+Q1wOz0EizPdTvEK475mW6+jcr+uXmX/dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790077505; c=relaxed/simple;
	bh=9ym6rEkISlhZpjeDkIyicq4VaHCk1N/tOnz9SpTaAxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZmWUW46mXJNcJdSL98qBr1xObgaTT6QL8zwpvpNiZl8hWR3bO4zeg16JnSilpu5gXyCDZ9txsZlV5uB5hBaK4V7lyIcaMryiUzMO5cp0tLPDWUSexBmhu5aQgtF65g0tSfDH40sOqj1NAdkjMkdrkWnVAB9oVHCpzrxkkXjzsxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=A4RXztdq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="A4RXztdq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790077502;
	bh=9ym6rEkISlhZpjeDkIyicq4VaHCk1N/tOnz9SpTaAxg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A4RXztdq65Sqs/zkCx3FYARWH1KAbN9GtnTSJRLqBfNjLbzODuR2Fe4n9oxJ//ORp
	 WPffBufcJJOfwNUUQggz5LMX+v+pfRXrfVb0e//PTG9IRWTNgWaNudIhCmn1TUVFs7
	 kT6v3DPwev2tGejI3d2vEz+NcZ52Qlim2FOF5M3b9chFVIxW7MEQjMwha5MQO3tW+0
	 HhgLJ2gpSXJ8Ao5BrlDdjoQdx0HTubpSoEv81eCMaq1YlfjvChpF+Hi/4W3LtTLX2H
	 T1FBlvQz9BVVR0hCox41+baCwtfc/+CBG7eua1xt+b/u/Xv5lgFZZtwqrU6Zx/y5Ix
	 rfwdVxGe4OEDQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4AF5717E0515;
	Tue, 22 Sep 2026 13:45:02 +0200 (CEST)
Message-ID: <9ff18cec-ab98-4197-ad70-1d0fd56c4e6c@collabora.com>
Date: Tue, 22 Sep 2026 13:45:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: soc: mediatek: Allow pwrap regs
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260921232527.3127894-1-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260921232527.3127894-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/26 01:25, Rob Herring (Arm) wrote:
> The MT7622 PMIC wrapper has a regulators child node. Add the child
> schema reference so regulator subnodes are evaluated by the MT6380
> regulator binding instead of being rejected.
> 
> Assisted-by: Codex:gpt-5-5
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

