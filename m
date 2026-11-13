Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565292;
	b=Kr1ef/Hv0In1ilB6PkDXQGYcQhPHAClUo+NJjnyvZiGiQedGxc+gj1H8qnyrTsVibevC
	 zyoyy17u5HuAXBa9NUvX5MVjZUIIjbL9nF/CiGzmdbfsjUwSUJfMW/3cihm3FnJq5vNqB
	 MObKZZ4t7fVUhiBanW9RnWWarIrKJvx/CnI5Khmlyk7E9qai1OfBYaH8hRqj1/e+eftTJ
	 9ZaNV+FR7yfxwhX7lJrtxV19dnI7k3SZMAFnnD7JNPyvf9j69X9vUnDlCkpMQHPF0DCMq
	 ruWQ24uhjQJw1COlmBvSeQP0bj7ZAnufDTc5yo8e+abrw7AI20wgxUMPi+Lqc3LREXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565292;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=A5Fsa6np7bcmClkXRjxn4FFE7aVHpfRJ5ScRIfaHxb0=;
	b=k6krZL38e72043MbTCDJXTom2NJ1Eaoq/swrLE2A/fkpS1Myey0YYz7XL6b3VY1j35Gq
	 +JPnF2xjuqrCI9kgEGsrESYITTLL+fkATDI9LwNYEu0hs3TdHmUQktZWjqseJeUMUeRjQ
	 UfgsHKQYyKjKN62wIfOanLpON3T+606muqMs33MYF1ZkzH7RIjL9VMp/X6iN+OxEy1JYJ
	 B1S+25cA/5JX16oxot+y58/uVxohIgyEFIgceb77jto9sbFGlyC6dSGi4wBn4Ujc09bgo
	 sBneQHa4oLtpaJqstrEJj9+KCIksz0Q4n3LI+L4GS/+kNqwEEmWc+XymnhuQ9XFfZUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fObJOcqr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F294D606A323;
	Fri, 13 Nov 2026 10:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fObJOcqr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 105AB1F000C4;
	Fri, 13 Nov 2026 10:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794565291;
	bh=A5Fsa6np7bcmClkXRjxn4FFE7aVHpfRJ5ScRIfaHxb0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=fObJOcqroU1AFQY7X7MkpxbVFjOvCNRRtEX3H2q9c2I3m5UesCPkUh+oz8h2PRGnk
	 V706fJSIVT6Tj/fBY3pDOwdI0B2Ja0ZLIisXRLZFNVV0afBjEhYizkCtCSQsPjOYAM
	 W23b3ksHsXmta9bRCqnHdca/8zar23H3qODcszgdttiJh/ONd8UgvXKmiOiova8+RC
	 B7K4nhlJNWxbYMcUhTyAQl3Zn6EBA0ivmMVeohkQvAwsbwfslvf/h3Zu80UXxGIZiC
	 dGDb5GQhfzutP+dAng7ZGnh4zG7Di0l0ZY+jP09L3LGwwa3zULILVMBIgSFLbU8x4+
	 LOfIS46nMhI2w==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sriram Dash
 <quic_sriramd@quicinc.com>
Subject: Re: [PATCH v4 2/2] phy: qcom-snps-femto-v2: Add support for SA8255P
In-Reply-To: <20261027-phy-qcom-snps-femto-v2-8255-v4-2-874023825a63@kernel.org>
References: <20261027-phy-qcom-snps-femto-v2-8255-v4-0-874023825a63@kernel.org>
 <20261027-phy-qcom-snps-femto-v2-8255-v4-2-874023825a63@kernel.org>
Date: Fri, 13 Nov 2026 11:21:29 +0100
Message-ID: <xhkdbqzgpqbfa.fsf@mkorpers-koolstof.csb>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Hi Mani,

On Tue, Oct 27, 2026 at 14:00, Mattijs Korpershoek <mkorpershoek@kernel.org> wrote:

> From: Sriram Dash <quic_sriramd@quicinc.com>
>
> SA8255p platform abstracts resources such as resets, clocks and
> regulators in firmware. The SCMI firmware exposes multiple protocols to
> control such resources which are identified by protocol_id.
>
> For this USB phy, 2 SCMI protocols are exposed by the firmware:
> * power domain management protocol (protocol_id=0x11)
> * performance domain management protocol (protocol_id=0x13)
>
> The power domain has 2 indices: 'core' and 'transfer'.
> * core controls the regulators, the clocks and the reset
> * transfer only controls the clocks
>
> For example, to power on/off the PHY, we should use the 'core' domain.
> To disable data transfer and keeping power enabled, we should use the
> 'transfer' domain.
>
> Add support for the SCMI firmware-managed variant in the driver.
>
> Note: the performance domain (0x13) exposes opaques values (0xa to 0x11)
> for which we don't have any information. Since it is not mandatory
> for the PHY to be functional, we have ommited it from the driver.
>
> Signed-off-by: Sriram Dash <quic_sriramd@quicinc.com>
> Co-developed-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>

I hope I've addressed all the comments you had on v3.
Could you have a look please?

Thank you for your time.
Mattijs

