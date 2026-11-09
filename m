Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239345;
	b=uPVSfa7bHHUvOYKWoUmx+4UwBTdpAJsZYIb7NMs79FtlfsbDKhWtos5Ji6XlaNXCeQKm
	 EG9Mw1GmsmIG00d95zS8Bsc3GRrOI2J7zK499ySABZ5LSyo5RHsyrEi3wBreA92RNGnQX
	 bgibvgo4hG4EePwu9MqEmRAGecxpNdkxgyLpXlxoT1FU0VkkSNfGTisuzVGYN+B3qnIqW
	 tla9ZlcCB8BUCUm6J7YIk5Rc9f2zHE6ZkXJ9c57QFJZF1S+DY+f/Xj0rdqvfilYMML3+7
	 aexY4rLs44euJnzJecrPeRU1AE3mvyZhPceaPVYea4lLFGwP2dYYxDEKaIHHugksi3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239345;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=raBij4qEhPxjWCEZowqML0scqr3lOT8uQMEhUh4pvtg=;
	b=l9UH43W826Bs07mvjzp6r4avxsRkEfERo0JG6uGLUVRFnxO6bmN9cUdEHxUc+ck+7+hS
	 vwE4FC4745klt7iGwSFHAqlEE45bTwYFslnuPXjYByZHYg0JJSyvCD0R35MZcFUAMlQmM
	 fkupwqNAe91cpR1hfMJ7slDAzvoGGmWYppKGd/6wAm+jTtSKIdJ9QAORpWJbY54yHs0t9
	 bYUgRO/5E2zIPGJdTC9QtNLpgNm4n5HuIFRoXGnU7zFbIZTtnHyI+UAcRItqLtp4cs/is
	 /WPn+vZlAoKgyBT9jmgAWFILuQbBRmrdIK6WG50itUXOClhwwUP19Fc1CMrrkbrdaeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T2rCxtPX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3C9606A31C;
	Mon,  9 Nov 2026 15:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T2rCxtPX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FE8E1F0089F;
	Mon,  9 Nov 2026 15:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794239344;
	bh=raBij4qEhPxjWCEZowqML0scqr3lOT8uQMEhUh4pvtg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=T2rCxtPXhIZX26HoJu/nFrUYRkxj85C42oxGcE/v+M0q2+MM8xJOD3hJ2U+kaZAIw
	 HYaCvCPl7Y9pDFmM1lCEGxCGh+0dpY6UniED+mtyT6uM9O1FsWKQcn2T5CFvIoUE+s
	 hXNZnjgTME7NvzT6925zJHPbxJezv2gS0ln54xsOoU0jZDQBE4E/AIsuc36WMh/O1d
	 3A3SkM/k9M1u5LyBGPJUFhw2G3CjQOeyI88ACGcsD/afINB9K5RIxeQmzp4DRhVa0a
	 LMbpUxDq8cLbUsPsMs1gaNxB2O6xuw9MA/+YvCsmdMfcRddVlH1smHDffRlJBMc6Rq
	 L9Ve0s7W+bZOw==
Message-ID: <8616d39e-738f-49f1-9ea0-3482d3f27d5e@kernel.org>
Date: Mon, 9 Nov 2026 15:49:01 +0000
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
Subject: Re: [PATCH v3 07/11] media: qcom: camss: csid-340: Enable RDI SOF
 tracking
To: bryan.odonoghue@linaro.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
 <qN79eFMjTmrURojfTgPvCGv_WrYLw4ASWwvs-Lb1O-Awx7xgiFaMVMHGoYcKn8yHjp_5RQMItil0aSONLJcbIA==@protonmail.internalid>
 <20261107-v4l2-frame-sync-v3-7-e5bf7073a35d@kernel.org>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20261107-v4l2-frame-sync-v3-7-e5bf7073a35d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/11/2026 01:01, bryan.odonoghue@linaro.org wrote:
> From: Loic Poulain <loic.poulain@oss.qualcomm.com>
> 
> Add silicon specific changes to get SOF triggering V4L2_EVENT_FRAME_SYNC on
> the '340' CSID. Covers QCM2290.
> 
> Unlike gen2 the 340 CSID has a per-interface IRQ block at
> 0x030 + 0x10 * iface, so the SOF mask and status have to be handled per
> interface rather than globally. Run the existing csid_port_iface_map[]
> through it so that PIX and RDI0-2 are all covered.
> 
> The spurious interrupt warning needs to account for the new per-interface
> status too, otherwise every SOF would be reported as spurious.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
