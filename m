Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190458;
	b=wOSO8fmg1UqwzJumpIGpzu6Z7zVIl9xCnUxdh0JHWswLsmjZeEW594qnv/NcpZlOmyM+
	 Lf8svkWWZYPKDtMO+bE4bSj3/unFgtCEWTGQKV1fn6J7HvtL0D5o22NXo55bZbwJg45x4
	 bGNRgInLWhtqwa3l9gutwvOiTH2BXGoav7DsHNwPsFvEtmva5kPGmm7vDYsyJxGUhzzVA
	 pCkxKRKJkygYEArDY5zHi8qprP6GKw/nPJeK1/QLfOOalCACfsmyT3J9Zt/8Hbu0n3TiZ
	 1MvrSnqA5KSChlodQ1+ZUM2mfxFM29PrFuwZhDFfQTSoauqOj3k/Ug2z+L1pbVQPlKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190458;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=adm3/MIJo3E7WXMIbe6tHjeBdjkUPTriM2gda+HcP44=;
	b=xiLhC7QRL4GyEZnqOhQ+7P7l+ajOqu60v/ugJ3hzRs2gAXL/DEawb0IOLeturYOaYXnj
	 irZQDSzr3R38azSPr0NO9QL1AFjplu24tKEHs6W50bcfsQS79W21/M9S8GgsrlI7IU3YV
	 r0OabBiejUZppt9wvK8uaOwrHP38WYo1a8BqPZ89KK6e5hUX7vJqU63FUqfuQLMlBakG9
	 KNUqpJ0VntaTu/I/+wZeCahJC3mWyl6A0HiMnVsBnAw8OMIRzKw30XBEEUsMwSDtGfPSL
	 FkRfMbGcr/xo7ra8shtr368Hn2WXOLSgNq4QG29EAmOiTSsSPdGYxNhduFdG3EprTFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PMvkuXyN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D68606A320;
	Wed, 28 Oct 2026 12:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PMvkuXyN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D3541F01828;
	Wed, 28 Oct 2026 12:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793190457;
	bh=adm3/MIJo3E7WXMIbe6tHjeBdjkUPTriM2gda+HcP44=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=PMvkuXyN2zRu1HA8JBneaxhXnjx0oT8RzIoiYhv9sdNE4/hTDnTUlFU0UKyQKTJ15
	 Dyyn1pNk5bjeW9vTvr+iC114w+3FpqT9xPePDPjlZuQblqqGaE0zMWrmSbHFWJMto9
	 ChlntmpfAc3ZQXUq+Eb1ObX79UxoDV4uIT7aUr8KsJbh6oxa7jqVWGyvQeyLT46LMd
	 +efaKFiHbyMcxHsVNJaO/6EroPR58qKDIBkUF/Lu13ZXUSflavDEu7HVJyhf9XhA5A
	 ApVQx+0OJKd3AYHugxzi+zQ621dhFzihEvjxgD+WTOnF/A5g33bSebysuQ+hAAPaGB
	 SWHXiFLcZKe5A==
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
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v14 0/3] airoha: an7581: USB support
From: Manivannan Sadhasivam <mani@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261006102937.10972-1-ansuelsmth@gmail.com>
References: <20261006102937.10972-1-ansuelsmth@gmail.com>
Date: Wed, 28 Oct 2026 17:57:29 +0530
Message-Id: <179319044944.10280.12083829801747357670.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=973; i=mani@kernel.org;
 h=from:subject:message-id; bh=OwSPiTEyrIyRUc9GwTlmqHlcVXTglC/I/83i2IzbsUU=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq4eo0hk2YgvBuZ7r5ewC9IOk/KJFTqel46Jp9j
 Y00DFtI0EeJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauHqNAAKCRBVnxHm/pHO
 9ThPB/9IjRUjU9za8K+ZBZR+lsZVoZ8zp7laAPEbp5mr16oITGXuX6aps2NOkgAs3TngET/JqLi
 pY7JCeCyJ7NL8LJp9CgKpoUN3JoLoqieEfAjvMSbykamjXqEcSzsNplI4XEO5FO+UguLlEWl/P7
 puslg1vGSCnJUwnvQooSeH8wNewfckkn/+0++bnegV5EPw1Ms76RKOVD+8HpkEIy+dI69UgrN++
 xNAx4KZfP2gYmNHz21rtsE9Y+s8odddJgBt80yDJdoFHTs8J4DTZ2aE7tMBQiTpkWKQkTSPqIj5
 b4q5+r1/Jbe3z4z5KUsIdElHz+AXVU+Z8aKKffHop8B51qIb
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-06 12:29 +0200, Christian Marangi wrote:
> This is a major rework of the old v2 series.
> 
> The SoC always support USB 2.0 but for USB 3.0 it needs additional
> configuration for the Serdes port. Such port can be either configured
> for USB usage or for PCIe lines or HSGMII and these are configured
> in the SCU space.
> 
> The previous implementation of a dedicated SSR driver was too
> complex and fragile for the simple task of configuring a register
> hence it was dropped and the handling is entirely in the PHY driver.
> 
> Everything was reducted to the dt-bindings to describe the Serdes line.
> 
> Also the property for the PHY are renamed to a more suitable name and
> everything is now mandatory to simplify the implementation.
> (the PHY are always present and active on the SoC)
> 
> Also other unrelated patch are dropped from this series.
> 

Please rebase this series on top of 7.4-rc1 once released and resend.

- Mani


