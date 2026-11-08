Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169393;
	b=rIdSKlWF0Oa6BEDz7zOoWGzf4ItCng5IVSxfYIxYaHMEgDZfB1L9HSD6DHeNEfyu5OZE
	 yl03BxpSMymI0JV7a4K3GGGrNnOPc+klDE1Pst0XOfv/z/K4JWlTFyeozciHHCw5ON3st
	 Bj4J/Y6cUqFgptt+xouDVKXIBdHsBe6j2AuXEcLQRMhOle+85qDVPI2mzHHSmjtt5LndY
	 NjlzE6cU+756AVo0hyhZNVATjzR6z3o9WkrYJU++1nBf+vMPCvgOs7NThljG9zT1PkUiq
	 vyKqBwefSXe9G+LShHXS8gaDHVW6e99Hk4e+Bs3Rh2VmhxeC3rtu2na9jtG7wJWQT1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169393;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=CECzMDIF2gJ6XE8Z0xa08QBZjPLM/BQyeO9Ww9B8kRo=;
	b=z6Vp+n42XB7s7/At9jVC7LGv6RNMHqYU2lYci55phyLD4YXQj/ZwUcXjbdPpZy7rWG+5
	 5KKw6Xnhb64erXF5IXUurVlr4u3Bcp8XN7GN0QxDdGbGoCRNIjpW9Rg0H00pMmwFvMrvv
	 rlSMLARqt7EyofCxvKvzrwpjRX9djNHJdJawPLLwXiQ3adSNVVUevDFqcZ+prdrkNWS6U
	 e8UdEMs+VQwsXHAVyX4fKuvnncX853YMSz+E7FEB4YJkev6WJV/Biqv2qMMU1lsNajctr
	 twdEtmYbXrfjpaB2pVHW1OBiPo1BgtqzXpHR+ImzV3+mcCRmQZG93U3wPNHnURB3AUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bv+cokfb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E81D606F8C2;
	Sun,  8 Nov 2026 20:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bv+cokfb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA8911F008A3;
	Sun,  8 Nov 2026 20:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169393;
	bh=CECzMDIF2gJ6XE8Z0xa08QBZjPLM/BQyeO9Ww9B8kRo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bv+cokfbWn5Rqz+JQiVCI3VH7+8SomvDOlJPGyhHk6ngPUCgeAqh6rGUQgBl2K+Z2
	 DtR131UGJloHT/VZ+Oq7LySY2you8fF/PVPnhrFkUyedaarhzCG0LzDE8uOaZZU1/e
	 9y0Xsh5k8QDTRlSFUIIndSkj0U0uGTMoLej9tM6hXnZLu6MMOr4GxmriOMqR8+/UgV
	 uQbvrd26l4bHPWJA6Q5O70pCKwVB0omqVFPipvT/qAqDTV+HeogFrM4RpLSj5+mCbc
	 udp/Kw3lyB2pQT9070q6zIx5mI582HLfiIaB0EXKmWctg9aFpiU4k9n7Xbzzl7tVD/
	 Zyg/2Rd/TfECQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jason Pettit <jason.pettit@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/3] arm64: dts: qcom: Add HP OmniBook Ultra 14-kg0xxx
Date: Sun,  8 Nov 2026 14:20:01 -0600
Message-ID: <179416929534.628393.5444551747347806383.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261101-hp-omnibook-v2-v2-0-1b99767deda0@oss.qualcomm.com>
References: <20261101-hp-omnibook-v2-v2-0-1b99767deda0@oss.qualcomm.com>
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


On Sun, 01 Nov 2026 12:02:33 -0800, Jason Pettit wrote:
> This series adds device tree support for the HP OmniBook Ultra 14"
> Next Gen AI PC (product SKU D29KLAS#ABA, board 8F03), a Snapdragon X2
> Elite (Glymur) laptop.
> 
> Working on this laptop with this series applied:
>   - Internal eDP panel (2880 x 1800)
>   - 3x USB Type-C with DisplayPort alt-mode, USB, Power Delivery
>   - NVMe SSD on PCIe (pcie3b)
>   - Wi-Fi and Bluetooth
>   - HID-over-I2C keyboard, touchpad, touchscreen, lid switch
>   - Adreno GPU and GMU (Freedreno GL on Mesa)
>   - Audio playback and capture
>   - Real-time clock
>   - ADSP and CDSP
>   - 5MP USB RGB Camera + IR Camera
> 
> [...]

Applied, thanks!

[3/3] firmware: qcom: scm: add HP OmniBook Ultra 14-kg0xxx to QSEECOM allowlist
      commit: 72bd92c0115f265db8dcd2f6647aa522dece23a6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
