Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554C5483BC4;
	Mon, 31 Aug 2026 14:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788184865; cv=none; b=E/h2+/YVg6uWEBJxhiAqDKgAhxg4SSKF2zAUkuVfrf8md7V2q5Oh/klOh6e9Z771hHCInaqJwZVQUdgXb+HqUxCAhdDrQ1Xeve/u1OXmnAH8n3EEXY4swhmjyz6ClZ8Y4t0bVXZTcuub0ErBRQhpjNBDAyRDXI6zI9fqavRPI/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788184865; c=relaxed/simple;
	bh=HdrZlJmdhLSw+hSSn28hoPGvvxucJimHNYdL4jitnQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V9L61l+9NnjWFHJPpwWBWtOG0OHfC0AhhFHr9U+Px5qL9xNSz3Xkze+Q11vXZKkTI66fXhuQBMRREcdzChjV0d2KQOErDNliJsVIiAuUSFoepxbLRZYv4qtyORxzLtGw9Z/JCJewMQArfkcPIcvyHaJGm0MqxCIp0pX0TPRVk2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=giyioOHC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="giyioOHC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258F61F000E9;
	Mon, 31 Aug 2026 14:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788184864;
	bh=9zxeNhkzaavp3WNg+ZK28oXExjQx3b+TCsATeDIAHLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=giyioOHClD/o7S2A+svulfwojyzawhweL4ujYIafVCWm+M1ENAmUegBzI9Typk75k
	 aJ+xeO78tCYjg7LV5PrUpKs9hdHzrnLyhvilvQiFSyRrGf0P+XOZ6dLPOVwrr1U2KM
	 6W15oRWzZZ6H3QO01nQceEyG6HMy/8lA7hcS6vL+DT4SeM9xdMcc26t5JYsg+HzqpE
	 ChsZZ2TrgMh5pX2hXeshg3joe9z3c0aX6fedxFazHYJDYWUAgOL33j2fzgR8cQsbtJ
	 AyacxwVLZJTPzjNx33kMRVa8kKIxfihdjwpgGtuqJcHgrbKmr09L10vyrN6zc71AK3
	 Yx/ZePzOslhsw==
Date: Mon, 31 Aug 2026 16:00:43 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Wei Deng <wei.deng@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, quic_chezhou@quicinc.com, 
	cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com, 
	xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/4] arm64: dts: qcom: hamoa-iot-evk, purwa-iot-evk:
 Enable M.2 Key E connector
Message-ID: <zd5jyrzcbnv2wrz7334o4gzlulviz2a5dn3lmr5z5olu4o4jpz@pzfkfjijhjib>
References: <20260804-hamoa-m2-dts-v2-v4-0-1b5ceac74538@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260804-hamoa-m2-dts-v2-v4-0-1b5ceac74538@oss.qualcomm.com>

On Tue, Aug 04, 2026 at 06:02:24PM +0530, Wei Deng wrote:
> Describe the PCIe M.2 Key E connector on the Hamoa and Purwa IoT EVKs.
> The two boards share the same M.2 wiring: PCIe for Wi-Fi (via
> pcie4_port0) and UART for Bluetooth (via uart14). Purwa inherits
> hamoa.dtsi through purwa.dtsi, so the endpoint stub labels and the
> PCIe root port compatible added in this series apply to both boards.
> 
> Only the UART BT path is described here. USB BT variants of the same
> M.2 slot need the USB core to acquire the M.2 pwrseq target, which is
> being added by Chen-Yu Tsai's "arm64: mediatek: Add M.2 E-key slot on
> Chromebooks" series:
> https://lore.kernel.org/all/20260724084328.3943997-1-wenst@chromium.org/
> A follow-up will wire usb_2 port@1 to the wifi-bt-connector node once
> that lands.
> 
> The pcie-m2 sub-ID patch that was part of the original series has been
> sent independently and is already applied:
> https://lore.kernel.org/all/20260724-hamoa-m2-sub-id-v2-v3-1-af97de70bbbe@oss.qualcomm.com/
> 

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
