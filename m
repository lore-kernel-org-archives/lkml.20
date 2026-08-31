Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3A6495054;
	Mon, 31 Aug 2026 17:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198860; cv=none; b=cp3Rj33obprgDfu9wsn00/PBx2JCYiRlqBz3NpgKHt8gyqBmdUmCwvEmfyhXlQEBLFw8fUYZc4Oz7y94B81Fc1illDrtB1jRqqykXn0WTIRhWJN2fQU+h4VU3Sa4U9kOEzuu3SlknLo8Qb3GqRVBvcLrLt0NZ4JVcEE5RuJuXY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198860; c=relaxed/simple;
	bh=eqc6bCI4i4Bfh22xmxU4LKiUvBTxtsVw4DNA3lfWy+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VK98ZANY8CcJIOnsrKltqakR9rwyb7FIX8hPPOnitgWreox0LQwuMnksPzhRNtkk+RuGDpz584UlgiHuF/XPYoax0GhlfDSBWGWxVxFtoANBTUtOQmHVue29PdEC7F3i9mp1wRzGI5twT5IIgccI33t7m7gSUuLlsqe0iP9qHm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mNxA0hEh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mNxA0hEh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A05E1F000E9;
	Mon, 31 Aug 2026 17:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788198859;
	bh=CMnej8Bh1y96dKBy9SSqtloXF+Y6vp4q2OrHGnxAiIo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mNxA0hEh3i/Qp28q29klRfubp08csw9o1jiz+2kSp7MXPVVKxIh8/6gC5EY28XWEk
	 1RXd2V0kk8lsS1wnPJQHLeBlHWy8G3xPrZun9Ud6uFzbYZzMz1HvMF/WgcFp/h29iz
	 +8jFknuyl/wcrWXyQAow5t9xRdC2cyYALKg6UhzrgwrDfkxX+INFDjfQT3gmswOKt1
	 21c2Z2PMLaPkny20hlHqtREO6+yUG+ncplADwNOnsuuoV3qIpHZgSoBoxcpX0wcWui
	 tAqqyX5EwZMl2ohgX00vSwqu5zi7XJjLD/ggxkZYPBb8cvZY3SWtbrYL4drvQkVmkf
	 tkW3ALWtNilvw==
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
Subject: Re: (subset) [PATCH 1/2] arm64: dts: qcom: lemans-pmics: Enable PMIC MBG thermal monitor
Date: Mon, 31 Aug 2026 12:53:48 -0500
Message-ID: <178819882990.1411250.6180008765863484953.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <6a7ee538.797536ea.65c65.28c0@mx.google.com>
References: <6a7ee538.797536ea.65c65.28c0@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 14 Aug 2026 15:21:25 +0530, Sachin Gupta wrote:
> Lemans boards use PM8654AU PMIC instances that expose MBG thermal monitor
> blocks handled by the existing qcom-spmi-mbg-tm driver.
> 
> Add MBG temperature-sensor nodes for the PMIC instances and wire them into
> dedicated thermal zones with passive trips, so PMIC die temperature
> monitoring is available through the thermal framework.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: lemans-pmics: Enable PMIC MBG thermal monitor
      commit: 739cc0db96cc2bd0da3a805aa96cd8c92d56cbdc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
