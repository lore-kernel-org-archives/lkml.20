Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259854F3EDC;
	Tue, 22 Sep 2026 11:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790077504; cv=none; b=hsEF6VR0GhFVmVKM0OihAv9x613g5qo+5bVGUlvVRpCFKnIzYoqJZTRjGXLivFx16D0nNh9Oj+VNPAF22cgnOng2T8mUyMuoHE5zQrt084CGvWo++7GjK4fayPMagsBCt9aFmi7WRX6Ju7QAm2f1OHoDu1AMAdf2lR+b0VB4wLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790077504; c=relaxed/simple;
	bh=AHja0yD4FyL0JwKbB6XFciBZB94zl2qabSHyLFZXFVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PdlqrLdKaQO9V8hAsI2vgZ9Y2tvlMTPB+OJPvt/xB0wIKRpRFY4mEFOolYZXdVwvrrn+Gyo3b1SyqMcDmXkVrYfXJboIddvGJlEFOXAlSK3QFE0u7Ov0vbAsFQfQQaMB1Td/LfpLURZliD96CCHbubRHF+wS62LQAgkSZUVKMk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=aItl/keP; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="aItl/keP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790077501;
	bh=AHja0yD4FyL0JwKbB6XFciBZB94zl2qabSHyLFZXFVE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aItl/kePLT0RGvrMpaIGUQWlm29K+JRifvpDPls512jxIZHkYVWWrqAGnDLB/BpAl
	 LnlA3EscDtfZQVru+fs7Q6ZR7jpbUrVDggMZ0exEc5hqSPpVhFlNW3a474fw7kQrdK
	 2xSAqhT1Arhj0EJoFXWOBjDrdBIdK6GZmNLSitWU6jkvawSuaqjNWSnOchPr9iJ510
	 3o6WfToEEPFKE2C3H2wJo60feQnQpNMj9iOtwVuvotEDWMuWSOeGeC96h+LNA8+3VP
	 h1k+6aZ5+2SQ6rOcF/dpUgHnHKGz44Q/k7tC3WgH3Pj0UP0Mi3jYiqQd9xHUmVCCpA
	 Iq4NPK7d6ZSLA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E8A9817E05F4;
	Tue, 22 Sep 2026 13:45:00 +0200 (CEST)
Message-ID: <113f8bb3-2f50-43c6-b552-8bcd22b41dd5@collabora.com>
Date: Tue, 22 Sep 2026 13:45:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mfd: mediatek: Allow MT6357 ADC
To: "Rob Herring (Arm)" <robh@kernel.org>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260921232632.3131680-1-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260921232632.3131680-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/26 01:26, Rob Herring (Arm) wrote:
> MT6357 PMIC nodes can contain an adc child using the MT6359 AUXADC
> binding. Add the child node reference so the ADC subnode is evaluated
> instead of rejected.
> 
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

