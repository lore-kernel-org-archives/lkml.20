Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736C94503E2;
	Mon, 31 Aug 2026 17:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198844; cv=none; b=nCN+Xtrk5VmAdTDib7rp+gpiOCerk0I9d141zxt3wBT6uHX5FJvZapPMwtZSH1Y5IvuvXL9yBoxmNCGYHf1X6VUMlEXOfbxuhieg8DhIRwxf9hdKXyhqMZxMqTuN/BWb/9mN2kzk36VLVndiSX//QGk17x7yPCvaqsNS7Kf22Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198844; c=relaxed/simple;
	bh=NmGsOEDVijh04Vui0tnCatesLLgpuTARdMaKaCkYj/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z6Sm/I+E9Vf3untLIrZxwEywnx1kb+Q7aRGeZBOI2cg9CJFrUZKymLXyWzsvI7t5OtUaoIj4/Iq0C/T/iu0/Yi6Z5kmRs69faMy5BWy2j34CqsvSjhZdIIbTVZudNSmkimEGcQWcnAYIUbhIpZWBmN6GeKxecEcdI3DfPtb50o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d8rV+BO3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d8rV+BO3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7FC91F000E9;
	Mon, 31 Aug 2026 17:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788198843;
	bh=5pm8on5dMLz+LKa19PTUphqSpcsqAetzGW6BHUPrIpk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=d8rV+BO3kMvdZ9S5R4bs5ACIKUW44Swm7J9LX11dtA8Le/iQ14jy01KJMs9MCmujP
	 7/ZOp/8leTu+JoK5ESCZJTAmrgf1jEUP7CiY2M1GQJ41Y5FVIrEalDdQ6VpduBs4sj
	 ib1Y9vGDEojTHQh/vxg5Hc6xsCUaLTXoiL4NgoIrnglabkxDGpDuOo819OeAqesqzT
	 7iN8ngU6VyQKSIyw97xPDW+CxYrgycj0MRGm+EwahXXtMBkdDp+D0BP1LQ+3PfIu2l
	 hxw/u9YJErlQpaVRWADAGtSN01/luCqeWiCurSjUFITRI64Gq88GuoghX3N3G0FU1W
	 LSZECV4ZvVAzA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dale Whinham <daleyo@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1-denali: Fix microphone distortion
Date: Mon, 31 Aug 2026 12:53:30 -0500
Message-ID: <178819882964.1411250.3889644896981380680.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260830-surface-pro-11-mic-fix-v1-1-36a53140373b@gmail.com>
References: <20260830-surface-pro-11-mic-fix-v1-1-36a53140373b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 30 Aug 2026 18:40:07 +0100, Dale Whinham wrote:
> The microphones (2x) on Surface Pro 11 are currently ususable due to a
> misconfigured sample rate, which results in a very distorted recording
> with the voice barely audible.
> 
> Under Windows, the DMIC0_CTL register is set to 0x00000005 while
> recording:
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: x1-denali: Fix microphone distortion
      commit: 35ce3c571297aee13c6da604d022929fd1aa9efb

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
