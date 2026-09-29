Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFE03EF670;
	Tue, 29 Sep 2026 03:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651783; cv=none; b=KBRm9HcocEps/K48vC6VV7sw6dqlnrwvMyLar82Hv7O7gmjVg+rDvKWa/J04elD5Af4VCIVRjmA6rDcvZBRrd901OvKhG2P91wSEQUHQ/dl8VZljCK04KvZQqpEcAJdufjTXxQg+BGWyBWxLtqtKzob6Jy38Y4NaLBW3zfprVNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651783; c=relaxed/simple;
	bh=Tv6c29E3oPUK8ET6kCm2bmwGECRoq1rFJ6nVBQiLbHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qZbWjnXlukBg/ef/K8ye+KkArd7Guz68pINMUIXPJkZPEhIJbIZJ8EoQvjHiPRZuQ0EYcqbIsLRIniSZOgFQZdycwUfP2rG1hZeAt/oGwr+ilDNqlTpH2joorseZfQMPQkzeGn9Kfjas41SVKkfslLuZ51DPrsC01AhK2WDabWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gs9fa7Od; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gs9fa7Od"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A811F000FF;
	Tue, 29 Sep 2026 03:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651776;
	bh=qDqr6/DCmkM7zSogsKePJKjRw3YTxUIZkVQYVzKC7bs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Gs9fa7OdxirM+jqu4k+x+MCQNv+fzvWhfYofxDbcN9JY7Nqt12a/18T1R6AwE5HaZ
	 y04/Bdyiicwy3MeL9kPHM1SWne3qRK3+G4FJsC04Kii2klc7heypSX9PJkYmIPtfSF
	 qVuN1ImWC4GOO0hqpLjh4kJjbaKCPBU+2cSIYw03Gwe9a7Go9zqxg1gSYkMf/zOZ4j
	 0GPwipBC0Vyvb2ng/+Ukd65U42fl9eoGa6nXkRUqccPNoRqOBHxT7OrkhRLKlf3sks
	 yMQtE0CEGIT2WiR728Zj2f5q7HfHjOAsqQh2JhY+LOp6TEsQjRy0a11FrnyTc85qNZ
	 iSABinZFWuRKA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Md Sadre Alam <md.alam@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] Enable quad SPI mode for SPI-NAND on IPQ RDP boards
Date: Mon, 28 Sep 2026 22:15:08 -0500
Message-ID: <179065170932.2673486.1188980179031046742.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807-quad_dts-v2-0-6f578d4152b7@oss.qualcomm.com>
References: <20260807-quad_dts-v2-0-6f578d4152b7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 07 Aug 2026 22:05:30 +0530, Md Sadre Alam wrote:
> Several Qualcomm IPQ RDP platforms support quad (x4) SPI transfers
> between the QPIC SPI-NAND controller and the attached SPI-NAND device.
> However, the corresponding device trees do not currently describe the
> bus width capabilities of the flash device, causing transfers to fall
> back to the default single-bit (x1) mode.
> 
> This series enables quad SPI operation on supported IPQ reference
> design platforms by adding spi-rx-bus-width and spi-tx-bus-width
> properties to the SPI-NAND device nodes.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: ipq9574-rdp-common: Enable quad SPI mode for SPI-NAND
      commit: 1f6925d80ae327ab4e18e21b7c87c57b793c462c
[2/3] arm64: dts: qcom: ipq5424-rdp466: Enable quad SPI mode for SPI-NAND
      commit: 4d36e6d8c5a489c85d9440fc7330beee9b74f6f0
[3/3] arm64: dts: qcom: ipq5332-rdp-common: Enable quad SPI mode for SPI-NAND
      commit: be63397b43a4b1b3c4fbdb149413dacd8ad5a844

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
