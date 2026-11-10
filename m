Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794325607;
	b=cMku49Pu2WYj73KAVVLciZ8iDnOPJqaqvxSL+qD1IaiVP6zUCG4hLwlBK3RVdV7Pwvu9
	 K+E5MbWI+7XkJ11e5aiSnEFmcbjhNxnqj65mtOwW0o5zTY9syaICbeS+xoYC82hxx72HP
	 bFKvj3Bx3f8sgvCaq3v3AurNOjHYkkp+Hmalw5416LumlBg5axBVDYL2XGXBSHeFhedRk
	 HnP1rXrA+Njp0oRaf1gbYmBJm4cCqBb4n3mtbloyv6quk9WcG6MX6CIirhNK6XvpbALkg
	 I56wfumVsIo/BWx+eRP0RQ5cHvCrSuYqttH5H/ybIPOTXuc/51KIvpi3X7/Qr6v0PJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794325607;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zeb6oiymxFDObRDcInmYbRceyPxEMFNrP3XnY1mdxgw=;
	b=Qe1bWGEc09ltaOj+Rw646GmJ2VSiu+sjrBJBQGLVuRjpV+/E0BTAlb0/HEwUp681pk9i
	 TLzJrSPg2PcJjxZ+Mvw592QPnXh/b/TVsdo+c3WBKHSjCBRxQVpayRTFR9mAS+kDJvwd6
	 k26jbhJxDT+onJy/r9YMICoYt7Tln6FbKHH9lwttBLTBMS+z2SvH3pfhlEkSvoxUWG8n8
	 efFeLYeO3qj/KPK3ty+a/vRsB+FtCDB+1sC3WS+vq/nw0kc+0tRpywHJpMqqQ4hFisVNN
	 uCs4D6npA0JOdlFmnRDW2OdDwtsvYK7VfNQ1FvZG7iO3Q1QVD+D01FfpCNnlO6xnhLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m8rfhSdu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B13606A326;
	Tue, 10 Nov 2026 15:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m8rfhSdu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 531A71F008A1;
	Tue, 10 Nov 2026 15:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794325606;
	bh=zeb6oiymxFDObRDcInmYbRceyPxEMFNrP3XnY1mdxgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m8rfhSdu+qgwEFNcVdZ4mx8q4gM2VEPIdELukpJS9tJxo0nIViQ2JPw0kNyDO+2Z1
	 ZN8uucI9P9UfXIfDZOY+7sZkrLmIDNu974cbzyFKz82lK9SKRvczFajlIhN56HvaYg
	 q+fcYMgAj/eV9hlv+Q9Km9gxnXlixiMfBf6BGmJX1C4UXV38Wh9vz0gZeC9zNZVBku
	 HvcAIGTa3cmRv9VzEQKXfO6BNVslhBHmwiE3DYHT9rlGUW3/1sjn1UZedgDCdUYsye
	 Kek2TKqvr/9bDJ42HIydrPDRUb5sUBHdH+y4XCmiMuTnP+p3AVxCGZJPeiWSsr7fZS
	 Nf9U8Mnp7oesw==
Date: Tue, 10 Nov 2026 09:46:43 -0600
From: Rob Herring <robh@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/5] Fix traceNoC probe issue on multiple QCOM
 platforms
Message-ID: <20261110154643.GA4159803-robh@kernel.org>
References: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>

On Tue, Nov 10, 2026 at 09:21:13AM +0800, Jie Gan wrote:
> The CoreSight TNOC (Trace Network-On-Chip) binding so far only allowed the
> two-string AMBA form "qcom,coresight-tnoc", "arm,primecell". That form
> forces the device onto the AMBA bus, where the driver must read the
> peripheral ID from the device registers during probe. On several QCOM
> platforms this AMBA peripheral-ID probing fails, so the traceNoC device
> never probes and its trace path is unavailable.

But it works fine on some platforms? We have a property to override the 
peripheral-ID which would solve your issue. That would be much simpler 
and avoid the ABI break on any of the working platforms.

But this is already applied and it's not any platform I use, so I don't 
really care.

Rob
