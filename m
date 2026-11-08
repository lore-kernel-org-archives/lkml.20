Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169483;
	b=3AyeHYOKr+n3jlJmxlGsm0p+JLb0VVgCDv2bTEEe7Lhu71CUYugcxIGEhEuI+nWRrzUX
	 fyYs+aeZn15ZPneDa4CMLu/QiVpows0/rVFDxSs1sYoHV8bnqcDvYQq+dLxzPeKhPX9A4
	 7r4gvdA8d9u7HlnJ86UGdBuRUOOP8pOAHliPgqCCs7NzYnNz1pDYcUDK77ktZnKAFOCtu
	 sby4wnjg4XcorOIm1/Nnz5fNp/PurWEqpsO40WRo5hzcn4mFcfQ82+nq+loEcMVs6Z7/W
	 /vxJ+npgL0LUepybKUn42C/NwPO78VZCmMyUBTLJhdsVSG5nniDXYYRCfoK8UPNliew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169483;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+DxLqfIwOo7VRlUwx6jolu+5Jmc67RJLG7kDcqyLb04=;
	b=aSpQ6dAl+FnFm1OtRaEzAQTdKLLCTD+8eXEig+p9ELP/qh2M0f9bmURJk9qWH4khxoe6
	 /y1XWoAHeC1Jgrm/HJxe23wpU9jdmRVYuVejIojLzWOiyRSw9TQlXiadxsrRHqRpK66CT
	 1WSz1S7Qgs+q1ac961ZF1/18IY8B3shz90lEbSAUh8tOO+MUcf/ELoVoPom5bLir2kRaj
	 REHzjC4MVBX03E09Xtlrthyv4JCwXtYbmpPUOYARGIluCxtqWO/pNKqtBH0+IMn2c7jcr
	 K3whkBbT95paEZgYGTA9ushahaEJxIGq6IVfFsbRmaLRZVKbHkzyVM/mue1ZFnOKx5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eDki3D5+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF0F607E4B6;
	Sun,  8 Nov 2026 20:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eDki3D5+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C08BF1F008A2;
	Sun,  8 Nov 2026 20:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169482;
	bh=+DxLqfIwOo7VRlUwx6jolu+5Jmc67RJLG7kDcqyLb04=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eDki3D5+q6G1OZevm7cto9dCalFzPxfeUIZa6LfzTnm/mjweblbBv9lV4kGuPIKsj
	 vAipsOW+97rXvQJadIkMh9FP1tMj9uvpNlP5jh4GCKTNjQRXHidflnL919XtEg5c57
	 5ocN3ImyV1UFEtz0tnPGqI7V79amcVy+vLYqhlxLKjTsQ/cg0KkM6O1DhsEFkrlC6L
	 3ouoz1ZbDli+c4zjLCY467kqdgzIOtESwtVSpCO1YRdHvEJmvNBnqnS3ElZrthYc2Z
	 /6b/rU3C8tdoAW+FPNOoMS2w5afmEn0Kkg+Y6ghcbKw/rmj/Eh+c1nnrXYx+kQSLj7
	 psjT6nr5X3G7A==
From: Bjorn Andersson <andersson@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
	Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/6] arm64: dts: qcom: nord: Add remoteproc and PMIC support
Date: Sun,  8 Nov 2026 14:21:12 -0600
Message-ID: <179416929206.628393.2926818723732467339.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com>
References: <20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com>
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


On Sun, 20 Sep 2026 16:49:14 +0800, Shawn Guo wrote:
> This series adds ADSP and CDSP remoteproc support, the SPMI PMIC arbiter
> and the PMIC descriptions for the Qualcomm Nord platform, and adds the
> initial device tree for the Nord Ride Embedded board.
> 
> Tested on next-20260916
> 
> Dependencies:
> - NMXC define: commit e484a765f543 ("dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index")
>   from git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git dt
> - Base DTS: https://lore.kernel.org/all/20260903140617.441111-1-shengchao.guo@oss.qualcomm.com/
> - PMAU0102 thermal: https://lore.kernel.org/all/20260830101025.191697-1-shengchao.guo@oss.qualcomm.com/
> - PMM8654AU RTC: https://lore.kernel.org/all/20260904074541.590485-1-shengchao.guo@oss.qualcomm.com/
> 
> [...]

Applied, thanks!

[1/6] arm64: dts: qcom: nord: Add support for ADSP and CDSPs
      commit: dca3e74978c47d69688df0d6b852719db09d05ce

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
