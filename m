Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13CC3E832A;
	Fri, 16 Oct 2026 08:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138638; cv=none; b=jkoCP0rsAuV2dXf6zLVkcqZEPs+WXnssOTmaNocm8Tu/yIVQBGvV65895EJI0eqwfVyNq2iRS/4YVuArp55HXdmyF8q5vKVREvM60Uk59/M/1MckJzaP1SRFXu3BJsMEGGdNOfP1XbIm/9+TAapXBFDS6EEkf2+DUD83GGDHfTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138638; c=relaxed/simple;
	bh=AiwyrWDkUODXs8dl4zUFVskBDLUa/lBXzJI5hz0vAZs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WVqtQBNolkhnRHlatsjrFu5MgY3ZWS5KY+U1IgYeTAtVUv9CsSsslIx38bV1IR03139Xmtj9+KNo86Svqka3yk02g3Rv32hYFRjkxCMvs5Ux8DizopkFnYjuUJGO7/Wak6O1NYlzKB9PAlYkN2xuawBQn+DmGXketRSCWt46ApQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cXZwcUAo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cXZwcUAo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 030361F000C4;
	Fri, 16 Oct 2026 08:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792138635;
	bh=niwuhZlVTOt+qv1gKnE+ldqS5I46ejBDnz5q59j54M0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cXZwcUAoR/bhHRyRB0AywNuxxW1CuRdhon4wOKuOCdr3TCzUgUn9etwqaJuLLbF8e
	 Iql7LlbqqTyZSmOF5MBssIq3miyN0d4cR/Q5hAf8ZNPfhrcJYTlIywoopUcMpWaWvw
	 AuAbkF+ICsXh0G9oNmJAEoVMjW+IxjzkCfy/Ry6WtUNHfDJhnBEXlFiVCV5+sVb/Cw
	 mfGyGeO9NGFLo1xXvUSIQ2tzNFLJgbWAxZfqH6Pw5USloYE9NVIIsRay+gXhIc7Ybx
	 98kRrtaqbt3tLM7ElYFy8OHlZ9xt3d+K49Ft+X0oRlZz7MlY2bzCP30hkzW/5vz5qJ
	 XDCBpQ4k764eA==
From: Lee Jones <lee@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Long Zhao <longzhao@ambarella.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20261009-cv75-soc-v1-2-808330e93ff1@ambarella.com>
References: <20261009-cv75-soc-v1-2-808330e93ff1@ambarella.com>
Subject: Re: (subset) [PATCH 2/4] dt-bindings: mfd: syscon: add Ambarella
 CV75 secure scratchpad
Message-Id: <179213863179.2671759.15755325800663682230.b4-ty@b4>
Date: Fri, 16 Oct 2026 09:17:11 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Fri, 09 Oct 2026 19:00:23 +0800, Long Zhao wrote:
> Allow ambarella,cv75-sec-scratchpad as a syscon for the shared secure
> scratchpad registers on CV75.

Applied, thanks!

[2/4] dt-bindings: mfd: syscon: add Ambarella CV75 secure scratchpad
      commit: 1c92a441330ce392fb17b348c84fa50c60493b20

--
Lee Jones [李琼斯]

