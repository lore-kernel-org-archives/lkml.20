Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794568659;
	b=uneNqpQpNJA5OdpclXPzpFedU5WKf/BAf0kd4QpiUejIfdQ6sdIhKUG65Ct8iAHVeLW4
	 bj5xzU04pwK2pGILVaBZK9pzS0Say8RozXMVboYYzsec3jPHtDu1RSYRhiTHh48hwwFsm
	 8gDYVLSJ0kfBXUbo86ZEMV/x4DQq271qNaLct2EUtQ6aLi498vYaCK5ViRCvgHMMAIwfY
	 NyzJ7j3yKkg6YTcIbELOc18mcNRR7Fg2DGwKHb4ceD8+PZbC2o4Nxh7L0d4SUcfNffcmp
	 8ma5lhGiAPtSiu2HV+L4XMDxe5HIe7e2LbWc1E97CuLP7txv8cWGrq053swRv2Gx2zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794568659;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=RxDC3JC5sxsmcIw+iwVyTq67rnUm+waYnxxk9UNp7sQ=;
	b=UFvVtXZpOYeFV8JQPrGD+NM6qzpfChK6w9LAIakQm2eu1nSAJa8whmvif/MszVCyFcWb
	 H82k0Begt5M9GYWyExXY/QmADZhNQK6T2vo0KEI9LMMJ2YGSpiQp3UbEaa40rARNlA05Q
	 I/CcY5qANcOMPChcWCbagzuD0el/z+6yimkK35Zx7qdnkAW1H0mUV1zFPZcOzabm3RtXZ
	 1VM+piQUF1676St92PxICsmeqJZdVSiBrkm4Vq0oqWBMF6LKldBaMK5W8E8CsAAy9Xj0T
	 /ajm4vzsLP3P3FIOb9PRvNMdyMBSbm11AIoyNwWMAe96aIxFScgYsPqp1tm9MPMdlvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WJiALC8Z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D46606A31C;
	Fri, 13 Nov 2026 11:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WJiALC8Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA4301F000C4;
	Fri, 13 Nov 2026 11:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794568658;
	bh=RxDC3JC5sxsmcIw+iwVyTq67rnUm+waYnxxk9UNp7sQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WJiALC8ZD7cWnd/0L88GvIYWcpka1nWOj0/rkT8BGw/c69CDrEHkxdZ+MKBBin63P
	 Wi/W+ns6mhqjscVmKu8Aw4YiAtTfwaL9txYiPiieeiEUqfrcmVo8R5hZOChdEnbO9r
	 YiKpAXrt1cYiIjsM9Ff8ZD6bIkUvC8jKsvW7ZWMcpKKv3Ah38889iNV9mwW4STfCZW
	 Y/K5aKUNA/UqfgAIoImt9o9a67iQ/bEL22+qzNWPfIiJwK8fEm3TNdz9UeOg/NLdSD
	 B7VRIpXokoj0qjf/g4UGxXNoJTxbBg8NhRbaPgYi8NJ+XeEl8ZYOulGC/QhxcVWaUK
	 V9A5OTOirVcEA==
Date: Fri, 13 Nov 2026 12:17:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aditya Choudhury <mail@inferno0230.in>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SM7550
Message-ID: <20261113-ambitious-solemn-narwhal-cbaeec@quoll>
References: <20261112-sm7550-soc-id-v1-v1-0-57299906d81a@inferno0230.in>
 <20261112-sm7550-soc-id-v1-v1-1-57299906d81a@inferno0230.in>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261112-sm7550-soc-id-v1-v1-1-57299906d81a@inferno0230.in>

On Thu, Nov 12, 2026 at 10:30:26AM +0000, Aditya Choudhury wrote:
> Add the ID for the Qualcomm SM7550 SoC, whose internal codename is crow.

From where did you get internal codename? Downstream does not use the
proper codenames.

> 
> Signed-off-by: Aditya Choudhury <mail@inferno0230.in>
> ---
>  include/dt-bindings/arm/qcom,ids.h | 1 +
>  1 file changed, 1 insertion(+)

Where is any user of this? Why do we need such SoC patches separate from
the actual new SoC?

Best regards,
Krzysztof

