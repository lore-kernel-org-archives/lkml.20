Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0BD4FB9AA;
	Thu,  3 Sep 2026 17:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788456065; cv=none; b=ipgfNW2sCY0RZQfDyMQ1UkFpuxXRNwEtDGX0T7RG9HtknPTwIra9zH1ZSDkVcZZ0FfeNeaCRr95OCqPSA5gN96NcJJEdV2ddPEWfSazQ0PK5OYiEYB8QIeDtjK/p6/qa8vsWx/Rw1IklwUD8CAEQDTS4Fvi2YBRowqOlhEmLX0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788456065; c=relaxed/simple;
	bh=BgR2ueb2FuesYaM4Y6FWP0x0rhHvUmpLaxmcjV5+kLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LS71XzF61g05odoMo6v7eIWI3Iq2Q31L+LbrgTclSX/NkcvabKIfK2/eopIWJF/lwxptyrj5H3D1pGDkjhc+I2wQMYgFfVvusbGK4efGhsJTRl4DN50lLdOkrxk8Dgux137gIExU8ZkX6RxDtEYF4YQNkEPGGspZ1MUtALrYPdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DbxnoL7o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DbxnoL7o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C77511F00ACA;
	Thu,  3 Sep 2026 17:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788456064;
	bh=oqCXeqZmA4YECuoqCS1fcuTipoi953IvrbdmcjbVgzk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DbxnoL7oUt4KnolFyKUlT/4xGCO/Yxjzv+x6kxEO83f/7jf+iBF0LHonlkNHWX2eg
	 WbN5Ha1Qg2Rtj9Z3+AorGL3ZcRMv+VSwB5GZfDYaaUVQIMOZY3AHrEDg/POg/7F1M4
	 UD7x33X0e3wFICVr4NpRwsLuvZU9XXR8LyJMDIbiwHtS5B9is0+pjX2ze6bhUooytj
	 GY5r0fh3V7mPQjpUDVKQ4oVHnb68q065w08Iwt/z9CyJVsIZ7dO/6Xcnd0a9i6Nznk
	 rgfizl4uBa5kvvgH5GXwyByYxhLGqjnKb/HuoZnOubCjvwWDz4cUMEEN6elEvXMBkZ
	 REzrsrpe0PUpQ==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Alex Elder <elder@riscstar.com>
Cc: mani@kernel.org,
	krishna.chundru@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	sushrut.trivedi@oss.qualcomm.com,
	umang.chheda@oss.qualcomm.com,
	rosh@debian.org,
	jsandom@axon.com,
	daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] arm64: dts: qcom: clean up PCI function nodes
Date: Thu,  3 Sep 2026 12:20:35 -0500
Message-ID: <178845603572.348193.3168971864145970580.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902214321.1721477-1-elder@riscstar.com>
References: <20260902214321.1721477-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 02 Sep 2026 16:43:14 -0500, Alex Elder wrote:
> While working on upstream support for the Toshiba TC9564 SoC I
> discovered that the way its PCIe endpoint function nodes are
> defined in devicetree files is incorrect.  Two issues have been
> pointed out during the course of review:
>   - Only PCI bridge device nodes should contain this property:
>       device_type = "pci";
>   - Only bridge device nodes should be named "pcie@" (or "pci@")
> 
> [...]

Applied, thanks!

[1/6] arm64: dts: qcom: qcs6490-rb3gen2: clean up PCI function nodes
      commit: df4107fc729e3bffce27fe0ed06fc6a64dd675cd
[2/6] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: clean up PCI function nodes
      commit: aaedd4ea312d6fd70dfc5cf430edf5106c5b3382
[3/6] arm64: dts: qcom: lemans-evk-ifp-mezzanine: clean up PCI function nodes
      commit: ca3027cfe8c7ef612910d2f04e58d75ec8a9b427
[4/6] arm64: dts: qcom: monaco-evk-ifp-mezzanine: clean up PCI function nodes
      commit: 0f8cbe572057b0ef98c651fbd6da1877983c7165
[5/6] arm64: dts: qcom: qcs6490-thundercomm-minipc-g1iot: clean up PCI function nodes
      commit: 55580d234cec123e9b2964cab30fbfad10774b26
[6/6] arm64: dts: qcom: qcs8550-rb5gen2: clean up PCI function nodes
      commit: 3f7d46aaf5565471f65b2e21fbb649cedc55e6b8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
