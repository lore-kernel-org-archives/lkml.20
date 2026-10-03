Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C29D43E4BA;
	Sat,  3 Oct 2026 15:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791041134; cv=none; b=SNhb3JqIyBOxsC7/t+zBDaibiaHVxRzhIooa4GS+jZTePjIkGRZmAHWgaRbwQEtd+GvsCY5E5FSxyVG6n/9u7am4GNGNPwN4VG1lIiiYhSZsCATn5Xsi2EYODWrCvgmeOJhLWjyxpxBC4M2e1OD8FKdw/CxWueHESUkZif6P9HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791041134; c=relaxed/simple;
	bh=r4HivBlm+xzm9Uix2a63PHDX85EH1fdhkqT5qYKJApk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZjkeI7GBnYllqQFem0212YpT3AXK/oAWvrSb8uCOFUIgb6mkl4ZCmkFR8YbXFGWp0yA+Hyd4vKjkoJSmRMOU3lf7C1fEN4aUH0BaeJGNni4UZdPYcsBhiea1GwZFEO58gRJfdeoIe/NrenJARXdWAx0OL7PuPUoDt9TpbXj3mDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nVtyIJM8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nVtyIJM8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F8C41F0089D;
	Sat,  3 Oct 2026 15:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791041133;
	bh=049uPGtYxN8IGOPOlZbVCBT70USK+uuKiYpF8itJ5Fc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=nVtyIJM8IjKyr3dA2F2MEBbVGv03WpB3+Lfv1JfvrIoWwpsExT9nicFOr7lyRzwn1
	 N0kvYK0xtgdNMQuctFS8S6lEn6oUBQRXlCM7w4mmYnyq2Fc8s9pYs9DiiH7LiFkMC8
	 aLjHG8ng+CveIfWp3Dh10Pk7xRm87SsdlolIKO3LB22uSn6RGxalbxck/FR+QxNqni
	 PVev6S9Hfco5Lzh+WCRskUBLPSVoK1LlzJ2P2gQOnFdB/QVUL2VqQoLNjLM+9MvtBa
	 HZyTSDXYY8aVLXZcTIlSV/LKMOvhfMAAt2LqDNFO9FzSN0XUGlGIj33QdyMgIefQH/
	 OSXvdRZgXCcSg==
From: Vinod Koul <vkoul@kernel.org>
To: David Carlier <devnexen@gmail.com>
Cc: neil.armstrong@linaro.org, qiang.yu@oss.qualcomm.com, mani@kernel.org, 
 konrad.dybcio@oss.qualcomm.com, krishna.chundru@oss.qualcomm.com, 
 linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260825225729.230493-1-devnexen@gmail.com>
References: <20260825225729.230493-1-devnexen@gmail.com>
Subject: Re: [PATCH 1/2] phy: qcom: qmp-pcie: Select MFD_SYSCON for the
 multi-PHY driver
Message-Id: <179104113076.223537.8163260919027364085.b4-ty@kernel.org>
Date: Sat, 03 Oct 2026 17:25:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 25 Aug 2026 23:57:28 +0100, David Carlier wrote:
> The driver reads the active link mode through
> syscon_regmap_lookup_by_phandle_args(). Without CONFIG_MFD_SYSCON the
> stub returning -ENOTSUPP is compiled in instead, so probe fails for
> every device and no PHY is ever registered.
> 
> Nothing in the build catches this: the driver still compiles, and arm64
> defconfig happens to enable MFD_SYSCON through an unrelated select.
> 
> [...]

Applied, thanks!

[1/2] phy: qcom: qmp-pcie: Select MFD_SYSCON for the multi-PHY driver
      commit: 77a0e6ae5dec54fb6049e3ab88288bc40c81f9fd
[2/2] phy: qcom: qmp-pcie: Check clock-output-names count in the multi-PHY driver
      commit: fb0f0e0e9e5dace7a6d9cde289537980ad35db3d

Best regards,
-- 
~Vinod


