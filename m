Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169475;
	b=oWWskfNCfxumwXLRxvfaIc5xD1uWiK99SYCNf7P5aVUOWOAKOuS3rjWJDQTvK+dG+dQ/
	 3nFCAxTGFclnJxZwiFX8sbcbrAsjoMmN5K4/B/X7DWD1piiVkJB6ioUopoLelPmexAgyW
	 cS3DW/m6aaVaRZW16vUkaU2UvcVc2pPC2096eSsD1kjqr7a3oa93GrTtA1QfUoDvEZKGt
	 YB52jT+iIgdZBdZAXW5/R1YvPS0nx1qpGx2vfDYAe4WV2CsxPFbajKvwQp/m8m+SNP43u
	 my+FWs9q5RCw/jl6TISqRGJFByzlxMD5Xef8R9n69mTbOPlzXzd7hcbmC43PKODT9Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169475;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=3c3r7h6NQhJOxwz/O9+t6Q01aTCnppsPh2tJ2tniiSw=;
	b=uw8M1jsXF39nIVyjCaUGIXoFcAaDa5YcSsKqm27Foxl7L0QiC+DsIDDxuH550bgTAgre
	 ud8UgdklPbgaq3HWYxbDCtlGHui1SyMj6gWfog5KY0e5wKtCKXPg2CcVN3eeYf9t72OTn
	 ROby6vMAMyuImuhhT+XKud4tpYMttGkuuCCrxxtAiy+FLXQDi2tp3s01Yr+b5UEfFF1c4
	 Z0YRAaT/UnPm9iV0bvx7O3ZqTc2yFaABO6jGN9lM6w0mxz3U4we6vtxHT9gH6X4enaUso
	 Nz2YWejfTNp66WXZFz3FTqpXTRbZJ936utv7rXztZvoQduTpQtUx651v5taNBnSGNtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ccej0zyJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DF9607C5F9;
	Sun,  8 Nov 2026 20:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ccej0zyJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 849301F0089F;
	Sun,  8 Nov 2026 20:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169474;
	bh=3c3r7h6NQhJOxwz/O9+t6Q01aTCnppsPh2tJ2tniiSw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ccej0zyJcXpxE2EU1O2jHU89w+F794yKeeKnRDsvq0UT2JNbxxWRfpP0Ywouw53bh
	 i+snF+VeOMKhlPIgq9QUNhk0Qm0Lm6l+3TRiRM36kJqos1pUOZ7qVZ7i2AL7QrhJDG
	 7SF6/hQug4tp/Qf2nVRDF8MeokTnP3zwQnGHlurUVSD0Um3LoNoXD4kZymeoBO+10v
	 5puNOp5W3FeZDHIDCkPinKf5+Cad1WPkg1joWx7eLNZS8bQA8lp1mwbHvBH6Ui8Ryd
	 rJyD0GmCPgXMSrnU0ZdKeVBJTqmoXfsXFzie4OmYNOKQ8vD1BJxmYaokPP9CihT3Tj
	 vQQ7Q/UL2Deig==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: shikra-iqs-som: Correct PM8150 L10 voltage range
Date: Sun,  8 Nov 2026 14:21:06 -0600
Message-ID: <179416929282.628393.3229975484137044010.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929-fix_l10_max-v2-1-2fccd87115e7@oss.qualcomm.com>
References: <20260929-fix_l10_max-v2-1-2fccd87115e7@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit


On Tue, 29 Sep 2026 14:05:18 +0530, Rakesh Kota wrote:
> On Shikra IQS, the L10 rail supplies the SD card's VMMC. Its maximum
> voltage must be limited to 3.3 V because the derived VQMMC voltage on
> L2 supports up to approximately 3.3 V. Allowing VMMC to reach 3.544 V
> can drive VQMMC beyond its supported range, potentially causing SD
> bus bit errors and resulting in the voltage negotiation failure:
> 
> l2: unsupportable voltage range: 3500000-3296000uV
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: shikra-iqs-som: Correct PM8150 L10 voltage range
      commit: 53503055101c2ef25e3a58d1e75b1a5c3ae84402

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
