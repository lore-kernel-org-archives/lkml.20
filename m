Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B3C1B6D08;
	Sat,  3 Oct 2026 08:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791015690; cv=none; b=dDUH8W8yLhl3Z7EGqvJXyTQD+xiYewvPCvIe5Uiy5cZLh5/O3QqO4XtVD8YxwseJ3sLKG1oY555W3fsKLhK0h7qv8RqoKa4PKnlucg1oWGSf/As54NlqtQyIigeLEoXpOnNBsUpimB7AsYEY96H6zIpYtq50zo08adAbEQAc3Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791015690; c=relaxed/simple;
	bh=LCqDYG53i+Ty/aH5+yRNbEvQS/1qqdALdcL7fpUBWn0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bwSQz3bGETMd7hviI5YVFuWPdFkZaUCQZFPsYvtTVcEyly2OBthrXTcopMgk0QmPCeSUxlhYD9gK03PsYxftKWtyH3Ycgt056EzaNzKc7sx11yQH6R1qdQ1nm6uBpL9OJtGulOHtTonXpVuOAo7iwguIaytMEz0X+ygaxHCLWu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iAtjUkko; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iAtjUkko"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C3571F0089B;
	Sat,  3 Oct 2026 08:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791015688;
	bh=f1Ipbg16BMsfH+xCSvqUFEmU3nFVGDdL1SOpE5+StaQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=iAtjUkko9NDo9AQuprglFkVvFHWPLvx87h08nu2U75KnKqTlKAVJlDc76Bhp/g6tI
	 HQ7kJeKcdOB6u+waV6Q6Jk/5BL3qvENzZMEHfNV3UXRboipfadt2vKOlQW/nrBCQJx
	 XXCiYyZ5BEHnfmq6j9k1XTemndMbEwX11flIJdO3tpszUBKV/0ZV2zhbEJ3nhrsYCm
	 GB+JCd0fBAJS1ocqqw5ou6/CLC7WCGE82LNph7UPWxENO4jP6U49xUP++uq0n43pWe
	 FZxldlV8urMj93ycR4ngCacAsdvIzerlFwnGCQ3Pm5IhKsMtDgxZ6YHEohQ1+5W1zA
	 yHGNzI/Y3cwRg==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
 Rao Mandadapu <quic_srivasam@quicinc.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
In-Reply-To: <20260910-shikra_soundwire_support-v2-0-f98c9a6ea1e1@oss.qualcomm.com>
References: <20260910-shikra_soundwire_support-v2-0-f98c9a6ea1e1@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] soundwire: qcom: Add Shikra soundwire support
Message-Id: <179101568482.158974.17009994282078059427.b4-ty@kernel.org>
Date: Sat, 03 Oct 2026 10:21:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 10 Sep 2026 11:50:13 +0530, Mohammad Rafi Shaik wrote:
> This series adds support for the Shikra SoundWire controller.
> 
> Unlike existing Qualcomm platforms, Shikra assigns the SoundWire master
> controller to EE0 instead of EE1. On SoundWire v2.0 and later hardware,
> FIFO, and status registers are banked per Execution Environment (EE),
> making the register layout dependent on the EE assignment.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: soundwire: qcom: add qcom,shikra-soundwire compatible
      commit: a936b634dd62a414a3da6517fac11f02117ffd7e
[2/2] soundwire: qcom: add EE-aware register layout for Shikra
      commit: b27be5a85ed3c11b51de189218d7a78b0972af4d

Best regards,
-- 
~Vinod


