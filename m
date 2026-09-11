Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D273E073E;
	Fri, 11 Sep 2026 02:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789093554; cv=none; b=U0V/kdErLZHEnz/94BB/mL4pqGzwwfMJxoasnQuwsdAsFLSKUZMLk5YzzuRGAG5EYgQOGwRF7V4pz1+a6I4c5d2kjTfHPgskIsrpc0frPkCdOUgdLI5I0jBbDUkEMDngPODQ25QHU5/aFG6EM/vLFcyhJjKdLv5ft2pWN2GW8DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789093554; c=relaxed/simple;
	bh=8FduLgUJIVdqyUAt5t3jmgMYpWc3fV3isxLaSkHQUZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fv1rAI7U176O25VNzgUm4LMR85ojF1h7FGgRfG4r+Vidt9HemUs0tP38aMOq3WxqOY0jmI9AVnJpq9Od2ij8jeK069MOJ6r+zhHBMcPlAuD6HI5B9oBHPPRVVqJyuk6dc9YSFUzxVGyPxo5mLCouv935LLUvgeh5loPrEp4Xj54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tz5OoTJk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tz5OoTJk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3102A1F000FF;
	Fri, 11 Sep 2026 02:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789093553;
	bh=/O4N1hpc5lpVuDTU6fOOUrGiMSu2u8wa7w/x567Lbh4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Tz5OoTJkPnxRen+ekbCWu02lJFlANH9xg2TJbXJYLerVqHnmy9pe49GANkNJLOScm
	 XRJFllkWW0GbfsyGk+zAGxqFYswVHE+7mpWWI99GhE5v4WfDLAUj1GHKxa46/smVuc
	 4hk2/aBQVOutXtYVIhL0SYFsKV9RvvO6alFqD25WGW+9LFTA/eqF6ETiKzSgI+B9S7
	 t7QIfSLPt88qrFwHj6qDR7v2449d2qb/oQxe8Mq8miXZ+ooV3QYkfi+bbhiC4R/8AD
	 kjz3dtd+i5Z45kPXOig7jI9iMZiDxA0tuXKDrNpjO/2M/sYt7YcuLp22k9rsTMomlw
	 CozCNkaJyBuRQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: eliza: Connect USB3 PHY pipe clock to GCC
Date: Thu, 10 Sep 2026 21:25:30 -0500
Message-ID: <178909353855.920241.5070471719847271923.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826-dts-qcom-eliza-add-missing-usb-dp-phy-clk-to-gcc-v2-1-bf6746a849ba@oss.qualcomm.com>
References: <20260826-dts-qcom-eliza-add-missing-usb-dp-phy-clk-to-gcc-v2-1-bf6746a849ba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 26 Aug 2026 11:35:56 +0300, Abel Vesa wrote:
> The GCC USB3 primary PHY pipe clock is sourced by the USB3 pipe output of
> the USB/DP QMP PHY. The corresponding GCC clock input was left as an
> empty clock specifier when the USB nodes were added.
> 
> Connect the QMP PHY USB3 output to GCC so the USB3 PHY pipe clock can
> propagate to the USB controller.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: eliza: Connect USB3 PHY pipe clock to GCC
      commit: 1c34e5dd83217f8952c8d96f9851981999acc8b7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
