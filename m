Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8374963A7;
	Mon, 31 Aug 2026 17:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198861; cv=none; b=bRbA9aFjK65aWR8DTd9zU8j6URqbaoXYhOqiXcqPAf3ZyO9cG9CNJAIbK2M10vGfa5BMyEBV+UkmOE2qSYP4ahMMWsuYel/JZ2sZnLWRd2Mef2+cpcxE4Rwz69UiVDu4Blif0/qYEBv4nBRSAwgOtreIXeg+tb0qKs1iuYQr3E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198861; c=relaxed/simple;
	bh=/mppcDFVN4lItP0Vr7/xNSNcP9yMFFldkCmFuHyVwq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KLbmBPXD6Xfc9IdF2Zd0d6HsGbT54ZW6i/n7xBx9SoEN8L04aUYcty1fJigM8SGXA9ZmP1FyfiUX+Keg4Hrn0Cgq2F1FrFiZNtMLe/Iy+WEsvlAjrqwVsGYyKKBd5juNljB05FidxsUI5XF6Fw50jEf6uRUus5pnoP1KhFRdEHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e0rM9V6+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e0rM9V6+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 544FD1F00ACA;
	Mon, 31 Aug 2026 17:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788198860;
	bh=MkIWAbzAAeEqjgqwtZoFj/fC3OnDB9xlKUYvhO9+0Og=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e0rM9V6+128+Nte3u1N3Jj/KRlgrd/UuxC/kxxJrQovsxADxffHZ+l2gY++431CVA
	 J1qTYm7pxU7Ro443XVrfkkv5MNAqIMtYH5AUoBLm+h+RfdJS17dSy7pQk4Dh0xOpxm
	 Kqgkmmv1g7IqRTgtaQTCYkC8m/YGQtxff4xVNcdx90qC4Et3Fw9a9kw+JOZ1zkG1+z
	 ZqJcgYQx7rX68rk63KyQVVuWQ4p5YeNC2BIYhrafL9shAGili9JCziZEwtz/dbgwMC
	 7+s3jKP3Fv/5mCmzw/gWLuu0dLguv2NMam1pp5qhsXd564BWsWBvO52BaoNCYPtT7P
	 t3aYTZhBFDhRQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sachin Gupta <sachin.gupta@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 2/2] arm64: dts: qcom: monaco-pmics: Enable PMIC MBG thermal monitor
Date: Mon, 31 Aug 2026 12:53:49 -0500
Message-ID: <178819882990.1411250.15818210928369939116.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <6a7ee53d.797536ea.65c65.2a09@mx.google.com>
References: <6a7ee53d.797536ea.65c65.2a09@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 14 Aug 2026 15:21:26 +0530, Sachin Gupta wrote:
> Monaco boards use PM8620AU PMIC instances that expose MBG thermal monitor
> blocks handled by the existing qcom-spmi-mbg-tm driver.
> 
> Add MBG temperature-sensor nodes for the PMIC instances and wire them into
> dedicated thermal zones with passive trips, so PMIC die temperature
> monitoring is available through the thermal framework.
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: monaco-pmics: Enable PMIC MBG thermal monitor
      commit: d3633a03c071c2ca81c3983352ead903b4b17785

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
