Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169315;
	b=j7+lt4du9D588ZLFn5fCKZA/orJIMxmuVz85CzKx8bB/PLu5CNKM7baQmzy8WmD4Fvnn
	 KKpTOYC+dANGzd5Fgm0JfJF5yJg7Kp/x4cT/TvovvJ72JfL8dBpIwMtl56EwLyQISfmHD
	 YOkSn452NV7MWUPGdUEH07qfFWWh2uZDJaKktCcHkxVwKhNgKT9ccVVJiVM+U838XG/xx
	 VNiKweicLksfs/rBDePKWnlIOgiV7Xa9pCky+srxYK1XUipl5F4CCmZGdJxeEmn87lGy4
	 utAfDceAB9sPJvA/OvwExRsBCsiqCzjWJWoBVHmkociq+R4MJZM7SoWJ6ezPPoE0YeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169315;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=hixGYmWJte+kotD/NGQtsvYwM+0zWtz/LPkWrKPrQQA=;
	b=JMVlvbw00nXi9iFhvS6dPX9B6mjqpcrdr3oJvQAAQGZSN3+8qs3RZECANaaWAKXTHWqB
	 9Qg2KKBB/8nlzc816lo/HYoKLBB15RfhLPWxXdeOd0G0lDSOj+dkSpCchmHN8tL9Oqm4R
	 rfsmv8oguzlGX49b6IbcK2ZSl8cXROQfjPO6CO65TaKBvBwIN0rOgnYyAH0q9zVqYwe33
	 Hw8BBwwQkcgle21jQN52VNFx39FPKa0tgId+FJTMhFOO1xxQyd0etNt4LD7NQotE9j/kt
	 bzMGuMk2vsXOf9IFfupbX1cEfgv92pzwNSX9gDCy0ulCDMyUpsP8rd3267AEJQqZhRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ccwadqvv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8F3606D811;
	Sun,  8 Nov 2026 20:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ccwadqvv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 789441F008BC;
	Sun,  8 Nov 2026 20:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169314;
	bh=hixGYmWJte+kotD/NGQtsvYwM+0zWtz/LPkWrKPrQQA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ccwadqvvCdCcc7l4lCBCju2BPr3rPe9aVWBGCMIYThwuSmiqpuz697TOZDeckTtSr
	 +bD2RpML1RJsSLRTbmZns+aJd7HKkj3cTWbj51hUOseZ00Pb0viBRI6BVs5bx9GWvd
	 pZJoXhNQDIqhBTL5DfJsIO8uuYLIj7AnKpMirVyoCtfCb8MDAb6WSff9WR8OmzHkxf
	 Sb3JQ+zJwtOaEhDyUZ3vUWAcXam65ILs1XxRZc/A/BsNC3bsb760KqVjTOTC9fcvtF
	 LajxEzdB9r+URCtxBoc6Xz3DVsQL0YuzRdWIVISg/jdfLiNQDcZKOMy8FXR7Mgaq8D
	 mtYwz3YL2GlZA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5] arm64: dts: qcom: eliza: Add FastRPC support
Date: Sun,  8 Nov 2026 14:19:13 -0600
Message-ID: <179416929540.628393.14393857343572906521.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261102-dts-qcom-eliza-add-fastrpc-v5-1-27ad8db4a47d@oss.qualcomm.com>
References: <20261102-dts-qcom-eliza-add-fastrpc-v5-1-27ad8db4a47d@oss.qualcomm.com>
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


On Mon, 02 Nov 2026 14:17:52 +0200, Abel Vesa wrote:
> Describe the FastRPC nodes for both ADSP and CDSP remoteprocs, along with
> the ADSP remote heap memory region needed by the Audio PD.

Applied, thanks!

[1/1] arm64: dts: qcom: eliza: Add FastRPC support
      commit: 12d7f2067e9bbaa685daaa07f69c200e54aa14d1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
