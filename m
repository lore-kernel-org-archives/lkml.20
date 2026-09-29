Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D033DB63F;
	Tue, 29 Sep 2026 03:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651759; cv=none; b=peEiDBZYxZjDRMBBaVicasDPxueyJQSsdVRbfsAcXF41D4PEd8HgJc3BBlWoqQf6/zUOUlD5CaBKKdtccVBR9wlckGjJ51VXTbqIgs/BMYa0T/fi4n6GkJ7dgjyhWG0qklSdST5uKYrl22E3fGo3L9+8nmC0RY90NC5SDfhfjeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651759; c=relaxed/simple;
	bh=Ew4K0C04pwznprppnpk2J6k0O3jqxNQ+9jdYQ3HHhN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xu0DhQJJS1qBgTHpUgVBKyRE753ZIMcHGjlbviiZbqGXLl9IEmQ1UlGIqXw8iiVKBhzQ7iH3jeq/LAsgJLnTGW5ZTRf0eAwTe7RHaFBA2AQxTwvLuDwes0JS20NXJzYYgxnGZk3J/XR1JCNXYRB9DQ/g0b78RIiPbv7hwSOODvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JoEUq+NK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JoEUq+NK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAAF21F0089A;
	Tue, 29 Sep 2026 03:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651754;
	bh=SpsRsWGU8p3RJxegiQUIYhGC2EkXJHtI7ly94Kwprbs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JoEUq+NKniVdUdmv/AYLEOx+NjT0K9gc21exEccaS9OK9XAbI5dRRvZm9bKihoQ0Y
	 ItIw3G4yFmK8uC8/rV3cHmFWvVBS7jbXAN3PH2SPtwjbHLFr1+s6EcqwIjF0fdzCl1
	 Ij5QizmmyybAh+UBy6E7TbCJqW3fwAtdiV1yUrTj262vEYR00wiV/1LBv04GzKe0FH
	 z9m5ZKjAEczjtjDcWltrjodc20m/YN/dVtGRomrBZJC+PXFyLoAsCAzx7b/Puk2GCN
	 goOieGxVt4K2dR6yqoND0wUbTer5TDieskbbWOW/NFKkgrdTJ/fABYEV5rcLDbuULP
	 qGMCj/tKs2woQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: (subset) [PATCH 0/2] Add PCIe support for Qualcomm's IPQ9650 support
Date: Mon, 28 Sep 2026 22:14:50 -0500
Message-ID: <179065171042.2673486.10646408196953840751.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260714-ipq9650_pcie-v1-0-4197749d06bd@oss.qualcomm.com>
References: <20260714-ipq9650_pcie-v1-0-4197749d06bd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 14 Jul 2026 09:59:15 +0530, Kathiravan Thirumoorthy wrote:
> The IPQ9650 SoC has three dual-lane PCIe Gen3 controllers
> and two single-lane PCIe Gen3 controllers. Add support for
> these controllers and enable the three dual-lane PCIe Gen3
> controllers used on RDP488.

Applied, thanks!

[1/2] arm64: dts: qcom: ipq9650: add the PCIe support
      commit: d6aeb78f093fabbacfa39e8c6c1fd1536145384f
[2/2] arm64: dts: qcom: ipq9650-rdp488: enable PCIe support
      commit: 6ac7b21d2ef8a503c5d33a09ce59307565d1ce9d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
