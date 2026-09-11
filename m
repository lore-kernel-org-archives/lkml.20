Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4193E49C3;
	Fri, 11 Sep 2026 02:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789093556; cv=none; b=m6dE8+sgw/2aCtOsEaPAZlaiYbRFwZgzwLQyFhWjlWACBRiRYE4hXLjJoPgaM9EtLLK3ZisGQx9+WalQgrf51av8Itx1f0nMRD73YVm6gzjUQQPW4YShuOCK5ILTHSWbelavAKbrK8EPApJVOVT2Auu/vKvu3+oPPTmRpB/hhi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789093556; c=relaxed/simple;
	bh=99OLv84074sN3CnXUdvsudC4WFNL0/9eNSP4S6RX3A0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HUbfzHpE9ATV5x+AishJnPmTCg0203X0+IZMkQY80XPwgZb1yQkKoeg1LVZuGaf0+2aa346nfCKCtkF36Qnkh7ZvWX9DvDRh+5GdYW0UgIW71NTZy2AFy8FpaFKjZSF9GpRTWcs+u/qnqMP4teZKBGuJ3tKq49/lxCJFPRHbcOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U8V8gaZ9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U8V8gaZ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1101E1F00898;
	Fri, 11 Sep 2026 02:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789093554;
	bh=ncO5gMnPZQhpjfPHrCceL3HkBs1FGTV05b+FpIbP6Es=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U8V8gaZ9VLZl0rm7N6zcOafpG5Xvsez3pP23I4/ms2GBJ5AvtXofSxw2GbPofCIR8
	 nssRu8vYpTzCwv6Q1BB/D4n7CykqDy2TCafSjXOV1uwJVXouESH8bRkQ1a17UC/srF
	 hZvpwwSgGl+p5RP/aOLpA9QH9ci9SEjkrmcjcWq15YkqIMDObmnG9CH4rPgUSj8w+t
	 V6t8onc250gaZ5qyRDksc4oK+T61UX76xIajvBk+ROtw2aVL3TWjEK2tj4e0E35ikQ
	 8u0McvKNtCNcARRvRFLg2QHMVV0S5TcGRES4ZGyVJvV6IYHP4ZbGVYdusYEDXbRUJR
	 EiHkPm/2DNNbA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: eliza-evk: Add power and volume keys
Date: Thu, 10 Sep 2026 21:25:32 -0500
Message-ID: <178909353845.920241.11012882531683944958.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903-dts-qcom-eliza-evk-add-volume-up-v2-1-375fc9ecc3b6@oss.qualcomm.com>
References: <20260903-dts-qcom-eliza-evk-add-volume-up-v2-1-375fc9ecc3b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 03 Sep 2026 16:47:59 +0300, Abel Vesa wrote:
> The Eliza EVK has three tactile switches: SYS_ON, Volume Down,
> and Volume Up.
> 
> Enable the existing PMK8550 PON power and resin keys for SYS_ON and
> Volume Down. Describe Volume Up, which is connected to PM7550 GPIO6.
> 
> Do this in the Eliza EVK dtsi so it can be reused by the Eliza CQM EVK
> board.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: eliza-evk: Add power and volume keys
      commit: 0bb0b2513fd3ab9afc01c9cb6f0b68b469d71869

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
