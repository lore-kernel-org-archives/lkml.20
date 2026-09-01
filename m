Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9A741228D;
	Tue,  1 Sep 2026 02:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788228604; cv=none; b=m+sLV/euvNJr74dKQUb+sjpAoWJqoPyzG6kMyNAmPiMJMwtvFknsnWPGtkAr2ZUcVNce4vlQ2wfks6JKR5yWyucAbKNkLRsrYGatioo1ZFgyaN0Vn9mC/VnfeTc7FIHs9HGIfGq71sMQf/VS2ZDeXT2dMqjHYqHJ/yD9PQHAgQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788228604; c=relaxed/simple;
	bh=T6rVcFpbptNuAocO8+wf+SKPpMvzlxOroqBqUGBwwYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G6AOCNXxKKNIGwS7HVzThRLf6huRt9tXrYf+LsJwhVoRvjBYB8tJKhrTOEBm8zWXJTwG949vSMNxFenqaCOR3b7ZJyCi/paRsyYaHDxE4F7e9GBuEKU/BLO6zT0HXR4tBTt2TKGsWENYRqfFZT8CbQy4tKBnpAKie2Y5198E5zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FWKqnJge; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FWKqnJge"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F11721F01559;
	Tue,  1 Sep 2026 02:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788228590;
	bh=4KV35LRRzAcXDAA3Z+0TQPtonjANhHuOp9rk6IxOfQA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FWKqnJge1xE0Rml4hZQcVnYKrL87GWnByb8yYviLuTY48xlmtRJMWoLJmJIj6PJpd
	 QbYO0zI9bIB6rJEEHisTRaMpkQ9ltoD72fP88KNeD8T1HZeKaq8eLZztyBuel7IYBE
	 DttXzhqs2z+rQ/y9gEKXildJBME2mppMEE0gD/Yp+KTYNFmjkne3NyziJiVXCtfiPs
	 M/v9/05oVVdjOcH3E1bN1myVm3TDSrYOwB88ZQBw/gUgurKrKP+FT+dN4wn7g4F8t7
	 ocG1GvqHfkMQRLlsO3VUFQwHP4x8RxMhP+MxgMj54okMyZ4YMe7eV50Oe+3eVeACqL
	 cBsVnw1v7wnAg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v2 0/3] Sort kodiak pinctrl nodes & add camera mclk definitions
Date: Mon, 31 Aug 2026 21:09:26 -0500
Message-ID: <178822856240.1835959.8715553464184744009.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260717-kodiak-cam-mclk-v2-0-04451f1374bd@fairphone.com>
References: <20260717-kodiak-cam-mclk-v2-0-04451f1374bd@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 17 Jul 2026 15:19:31 +0200, Luca Weiss wrote:
> First patch is just cleanup with no functional change, the second patch
> adds some camera mclk pinctrl definitions for preparation of adding more
> cameras on different kodiak devices. Third patch adopts the new define
> for qcs6490-rb3gen2-vision-mezzanine.dtso.
> 
> 

Applied, thanks!

[1/3] arm64: dts: qcom: kodiak: Sort pinctrl subnodes by pins
      commit: a732b12f1fcc65452075fdc49a481091d49d877a
[2/3] arm64: dts: qcom: kodiak: Add camera mclk pinctrl definitions
      commit: 98a69bf61a4be40d16d2f32a23c210ca9e3c38d4
[3/3] arm64: dts: qcom: qcs6490-rb3gen2-vision-mezzanine: Use common pinctrl
      commit: 63a202df997c3facf2bef43ae8697b79f63807d0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
