Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD2A47C108;
	Tue, 29 Sep 2026 03:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651803; cv=none; b=LYfbWXFkBNiipB3g/RpRJOnb7tBopmwS/eKzxbXDwE+VKpeMYAESDpWSA/tjhtv2qjwoLTkK7PYJF/pNXsw0eJiuwptfRUt0ouTiyzugaeaTqj/EAlPWqAu32sSdsNzpE0UJi+Xtv4/xg7gNFWRUsQXHtTcW7Aulk4pFOL1APlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651803; c=relaxed/simple;
	bh=eYZCHOlcKGHvQPsARW6dQpTEbrQAr/J5Fmoi21VqqKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Si9SLoQV/Ot0ZNN542q3iDhUeCpRF9O3Gln3vNBxGlAdjXBI/M+j91Y2KBo5E6LDcBalRr3nZyxrcZrSqiXlN6dx6RCo3UZ+EQ0lj37W3JkuG0vxOQcgiALZ+RK8BEGGEpUodI7IuGRyfKFHERN0YhCfRzfI75vQzGnzvxn54IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y4PW7owa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y4PW7owa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57B621F00899;
	Tue, 29 Sep 2026 03:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651798;
	bh=j/Jsg16T8aNqhOsssWZBoTG1paKYZhyELc3AM4GX6SM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Y4PW7owagakkIEhrKdxwIX3+qjsaxNH0NZMfObafOOSHiXYC8ZlSSlprAHHqYHkuK
	 lSoTNzpHUEOnMMvFSBBZqbGT2wFkf/M9f2ZVuaN4/ucxOER/7dj5FuO/NApkdgoKNI
	 6dTXrRintdyzjoz/WVkzGYLh6VtTrVLIw9QL2Pl/6HgF3MynDnx80N3p9JjDjV9M8+
	 5CxqqGEyasNT4/A3LOVznxsfiQu9JK+S7LZrxFXUCPFjowYI0N8vW36DgwUSvLrpOZ
	 U2mZRQWBHcs5F8zRCVKyW8ztvaqtlShBos+kHF7Xv//NwhEdxjrh8fRlVZBn/BBg44
	 rad7PiipCHOoA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Deng <wei.deng@oss.qualcomm.com>
Cc: quic_chezhou@quicinc.com,
	cheng.jiang@oss.qualcomm.com,
	shuai.zhang@oss.qualcomm.com,
	jinwang.li@oss.qualcomm.com,
	xiuzhuo.shang@oss.qualcomm.com,
	mengshi.wu@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/2] arm64: dts: qcom: Describe the PCIe M.2 Key E connector for Monaco EVK
Date: Mon, 28 Sep 2026 22:15:24 -0500
Message-ID: <179065171008.2673486.7801183154119633386.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914-b4-monaco-evk-m2-v1-v4-0-dab83b048d03@oss.qualcomm.com>
References: <20260914-b4-monaco-evk-m2-v1-v4-0-dab83b048d03@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 14 Sep 2026 14:49:12 +0530, Wei Deng wrote:
> Add DT support for the PCIe M.2 Mechanical Key E connector on the
> Monaco EVK, following the same pattern as the lemans-evk series
> (already in linux-next, commits 67f06acf/a6d4bb0a).
> 
> Patch 1/2 adds 'compatible = "pciclass,0604"' to the pcieport0 node in
> monaco.dtsi, required for downstream DT nodes to be matched to PCI
> devices.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: monaco: Add compatible to the PCIe Root Port
      commit: 926c325da50588399a9ab08cc01b17600c1eb0c7
[2/2] arm64: dts: qcom: monaco-evk: Describe the PCIe M.2 Key E connector
      commit: 253afe26cdea0372755e5ba1c7a6f72ee730b50d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
