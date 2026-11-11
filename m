Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383639;
	b=aNxJq1Y+b2ZC8t/Uv2mlnYp4ONNJW6Y1Qjd5MoiFBCZ4DG1yTUdpgXdASxsiyF3uLVCn
	 2gPkgi9uladOAMrjsyvfPP/LePkkVf3zCbpCB5bhNAw98E+vxWRhRw2lT3a+raO348rme
	 vDF2xF+U5qIObWzXXB2ONPHEmQZtZVyRNJXNAL/m6bYVLAPXjEVGxgT2VTiZS49FWIYZv
	 KNZhrW02YxAA//nZKkZbfEihjjCtE0KCcYV7tAeiq40ko0AABqJ4NTkTxEYvhQ1Jv08Uq
	 4BotTUL+T97egMoHZtuQwAQXtvM+qbscwL9XMSUVjEgSixOw/17yDcH1aO2NOnQDgJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383639;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Wx44Jqgp9Clr6iznTe8eWUnZX1Xya+lT304p4BistjI=;
	b=h3M7+lH71hsiXuFh+2erOh2ydEJpbznhXlZcS62ketSGPeHu2ieWx7xWUb7cquTWpxY/
	 6plH0v55+676OiwmwEtqtA6fvF+mcorNEOJideTLVQhvRfWqmZWXavE8RFFpiOaqU/l7x
	 VZ3qS84fodEsTBlnwzA344Ft4w9CIINAOFe2B8J3i/joOe4c0UhsVy++htdAbTxkxD3wx
	 Bkp8dh3yXM/s8SjOZqsX859OBxcJFefCjTaZ9iClJUzeKG7SzxWMnYlbcftJH1JSzBIug
	 ot/4naufiqPLQ7N5jkDxNrMd5bxGQE82oKJbtMf5NcpG3I9ovGOaJ0mCRzBjd895RbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y7VvQopT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3B4606A33F;
	Wed, 11 Nov 2026 07:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y7VvQopT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E488D1F00A07;
	Wed, 11 Nov 2026 07:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794383638;
	bh=Wx44Jqgp9Clr6iznTe8eWUnZX1Xya+lT304p4BistjI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Y7VvQopTyiYLsfhNqmwj+Q0kimGb5POR2v14SGLQsD72WJyDcwJRcfUR3sqJ5Kmue
	 NvA9OnXRvf7pqNQlDmTkavzjMzSYd4Pc6OcscROatd2gmxTFwxf8ZWFobDDQTb9vfI
	 h4sJIc/sn1H2H/KuLO40piUNQvaqMnF9f0wsuCAnIKIWFvrqqsTHsKUR+DuVvY6asB
	 Z9/b7+lM3qtIOzNfbdcfDuIByE/aOR9g6g+gBALZ3dmHhdtWwVp0ksL4Z8Xu6SNDg7
	 x/EEjATAZCa8epM4RiadiuigzQpXOa7c+UwrkUBqNTHDljfviKzETFtmctSr+2qBBM
	 6CC1F9ESuBHog==
Message-ID: <5fcaf2c0-d38b-42c7-96fe-52dccbe87f14@kernel.org>
Date: Wed, 11 Nov 2026 08:53:52 +0100
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
Subject: Re: [PATCH v7 1/2] dt-bindings: phy: Add CIX Sky1 USB3 PHY
To: Hongliang Yang <hongliang.yang@cixtech.com>, Vinod Koul
 <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Gary Yang <Gary.Yang@cixtech.com>, Fugang Duan <fugang.duan@cixtech.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 cix-kernel-upstream@cixtech.com
References: <20261111030937.2954646-1-hongliang.yang@cixtech.com>
 <20261111030937.2954646-2-hongliang.yang@cixtech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261111030937.2954646-2-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/11/2026 04:09, Hongliang Yang wrote:
> Add device tree binding for the CIX Sky1 USB3 PHY, the SuperSpeedPlus
> PHY of the two USB3 Type-A ports of the SoC.
> 
> The two lanes are not separate devices: they live in one register
> block, share the same clocks and resets, and are brought up by the
> same initialization sequence. The node is therefore a single PHY
> provider with #phy-cells = <0>, referenced by both controllers, and the
> driver reference counts phy_init() and phy_exit() so that the block is
> set up once for all of them.
> 
> Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>
> ---
> Changes in v7:
> - Describe the PHY as one provider of both lanes and say why. v5 had
>   one child node per lane, v6 dropped them, and nothing in the binding
>   or the changelog said where the second lane went.
> - Reword the description so that it describes the provider instead of
>   the register programming of the block.
> 

You gave me exactly 0 minutes to reply to your answer on v6. Nice
process - bury existing comments it with new version, hoping people will
move on. Dropping from DT patchwork as previous issues are not answered.

Best regards,
Krzysztof
