Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DBC39792C;
	Fri, 18 Sep 2026 01:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789696212; cv=none; b=QXXjLIvwbyouXpuO0z8uFtpImNvH3igVTNmK8LMPhNUN3u233ed8e7iY43XqtjA8KPW1bUb54X7BfD64sClTEYuUkpbm+7F5oj9V3NJrXTvNPuX+lk1zfnYg5jVZkMVp6zjxNptG5TwN6GSHPl42c49iPYXXF1VMj4T7FI0Aqyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789696212; c=relaxed/simple;
	bh=hk67C+YRbOEMdhKy7zSwjDQVQ6GaMHnC3Ty/C1LIgqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZfzVl29RfkWRLKj/1muTve5Vn7WSaslwUeEczdoJ05G+zbt5kvehUZDRDumL1QuCbsTuqF+oKHovJe3zelM2Q7Lfkjo8Kt5uMuRbA4bw6WfYCKZdy2ESHgMCfjGWVqp06L2cAeYFXKaLUtuJ4T2WWZM6Z7ggnPmiCA7GTZmOnRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kkxYHcuK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kkxYHcuK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CAC91F0089D;
	Fri, 18 Sep 2026 01:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789696203;
	bh=Qz5D1LGHK/yzt7thvspvyU2ZMxY4kih9CsRpfbauS3A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kkxYHcuKe3qDtzM2NAK+swXsLbkjyxBl0ouOs2jZX1yF/nmrbIhjKXk4OBk/+a4Ug
	 /HYF2ajndVg12mQoxlypoML1hIt+iCqiEuVFhVEyTeLrOTAk5rAK68om5KRpK/4LTH
	 5YLAUlnExzk2m6aTSejZYx3YvX0y7hhc221c5sh4B87axjIUeyG18r+GOSmR5oRK32
	 YzDl5qh30z+xkrjbqrAq1ERKOcsrmIOlRiojq63gdHdH161chS2JiRF1PhhRLrINbz
	 tEwL2aE2qh4ZUeOGooW1U9hvpShS9EskkLnOBSfSf8pMisMKgdxg6Bgcq3cObHLv9H
	 i527uRM4tYRQw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: talos-evk-som: Add firmware-name to QUPv3 nodes
Date: Thu, 17 Sep 2026 20:49:51 -0500
Message-ID: <178969618820.1582337.1328380627869658325.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260805-talos-evk-qupv3-firmware-name-v1-1-3ebd5e5578bd@oss.qualcomm.com>
References: <20260805-talos-evk-qupv3-firmware-name-v1-1-3ebd5e5578bd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 05 Aug 2026 16:57:23 +0530, Viken Dadhaniya wrote:
> Traditionally, firmware loading for Serial Engines (SE) in the QUP hardware
> of Qualcomm SoCs has been managed by TrustZone (TZ). While this approach
> ensures secure SE assignment and access control, it limits flexibility for
> developers who need to enable various protocols on different SEs.
> 
> Add the firmware-name property to QUPv3 nodes in the device tree to enable
> firmware loading from the Linux environment. Handle SE assignments and
> access control permissions directly within Linux, removing the dependency
> on TrustZone.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: talos-evk-som: Add firmware-name to QUPv3 nodes
      commit: ba8ced74c199337c8a0aff4c606f1066dc464722

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
