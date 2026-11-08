Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169313;
	b=FoZAkFqaDJ4h7Aq6jFd+kut1mYcCaHR3YJT4CLpsDpaz2cjKEG8s17g4meHAAYQbGpYF
	 bKa69Ih6eM/X90dP+CX2Owqy3MTYhyZWd0sqFd7nCvpNNCOB3MXChyt6VERiQ+mH0/4QW
	 edJulSIDVqJXDkgK9KB7bKa5sGZjD3ckcCL82X+xExKZww1fdGcamYIlRdA8pndvKvtqz
	 ZXQvFZ3HBbjgUPSk+quxvfaMJNJZ4Z1VkK3BTea+ulpNdYizP9aQ/b7grdf+REXx4/Bkv
	 OeHk+evozgXsp1O7EvEr0YRLJ5tlQ93vON5VP5K8DlONRgQz0kvpfXoT7mdUykoo3yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169313;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=VVyykXlSyrTgP+EcH4x8XMkElcSDwtfYCMLDjda6kVM=;
	b=o9i4IOdKAivzgFJYB53ncAHlH7vJ+MniKWahOHyQ5LNj1J/BaQIjBcI4vwk5qbfTEDpA
	 lPgL74o6M1IvFJ1HwyW6Ew/Qhu1+dTXB4FOGXlLKIZhPICMksAaBe0QmErzAwPm8e8d5S
	 pGkT/A67Sr3XKoi+VgXtuBGev0uXOHxjMIf1bvd57+Yv2rAEju03FORCdxDWzaxOT2/zf
	 pcjwU4ly7zw3HQWhVM2HaDwkY+vJFQ48YOQ5kPTTzFKF8DKcfaNvpH8Xz59HXNKJhyYnk
	 uqMaH671qZtNQaYC3wY6HS6I5cS2o1vj28yoAPsdvDUYx+HiyHqKt8ivqkjUTkkxZkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CD1l+INm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9864A606D805;
	Sun,  8 Nov 2026 20:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CD1l+INm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ED361F008A4;
	Sun,  8 Nov 2026 20:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169313;
	bh=VVyykXlSyrTgP+EcH4x8XMkElcSDwtfYCMLDjda6kVM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CD1l+INmMBxcj12WDTy/1+mSS0uVd5+j0qYhdDiXA92ICS8BeK83zRXPa1XB90iO0
	 rSnAjm311aiVY9UNKzK09P+IHx4BVwTeBI7gdOcO5ovJxv2PMYpQVkgWwBPbU/nFdj
	 9CMukkhqnf3OshE05rwAveT2jKXiTJE65HX9X85sIOkxXDLD9Lv8ilH8jz/tertVC3
	 E8KOLCLIlg0P4N3u39K2I0hk9CAMYeg96TLbP2q1vndMkvgqTkE/J9Q71tKcfhF860
	 GjZg02DRr2EopRhhyqYKT0v1vp5DNv60l/wGVOJVtp50NhHYZXLEchuBbM1KRfYfsd
	 rIxfCmC7QUHZw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/4] arm64: dts: qcom: eliza-cqs-evk: Support eMMC and UFS SoMs
Date: Sun,  8 Nov 2026 14:19:12 -0600
Message-ID: <179416929538.628393.16489021292278996381.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261102-dts-qcom-eliza-add-ufs-variant-v4-0-c92512c7c759@oss.qualcomm.com>
References: <20261102-dts-qcom-eliza-add-ufs-variant-v4-0-c92512c7c759@oss.qualcomm.com>
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


On Mon, 02 Nov 2026 14:10:46 +0200, Abel Vesa wrote:
> The Eliza CQS SoM is available with either eMMC or UFS storage. Both
> variants connect to the same Eliza EVK carrier board, but the existing
> device tree describes only the eMMC-equipped SoM and uses storage-neutral
> names for the SoM and the assembled EVK.
> 
> Give each SoM variant and its EVK assembly storage-specific compatibles
> and filenames. Keep the shared SoM hardware in eliza-cqs-som.dtsi and
> describe only the storage controller and its variant-specific supply
> voltage in the eMMC and UFS includes. Neither variant is derived from
> the other; the carrier-board description is shared by both assemblies.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: arm: qcom: Describe Eliza CQS eMMC and UFS variants
      commit: 14120bce2899a8736934018f9817c23b95b8a073

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
