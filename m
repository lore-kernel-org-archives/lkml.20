Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7BD49B211;
	Mon, 31 Aug 2026 17:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198864; cv=none; b=kQKPAg2m8wvJ+quolXo9n0knIjSR3hDWJSTXeuJYozjt5knJgUC8kn5L3yFHEUThKyU7HZ6nvtAJhWa8gBmsqSrTAlghYiw15yw2Tz68/higig0t+wF6ej11XateCn7d/MsGWDJfvHwgryoIk4vgJgZmaTiuee0HcEV9mmSbSwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198864; c=relaxed/simple;
	bh=kcUxUaGTMHh4rNGRRUdtbujPH5Uo7Upwkj37fMhbimY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tR2EB/AB8t8hl5rapXpLG0c7pN3SW6Cb5UgWS9Ek/qQn2pqqd7X/dxlbwdzdYcz9x1ZFoMiCE5LWwPjatCRGQRcsoDNkMCd97F7VsyYbiVmpxdCSe/sRdwSIcoJquJFg2U2Gwl5yBFW1dnzmpdqnwiLt8hZmvv5NRfi/j/PeJ6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C/JN5X65; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C/JN5X65"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD971F00ACA;
	Mon, 31 Aug 2026 17:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788198862;
	bh=eHVfEF2J+vk8Hjo/t6Gcqr0m5mVNIqx8lhN2tQaoAgw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=C/JN5X65lbO5W1dwLmCWDmM8HOlC3iJZUiADCxbsg8DS1bGVOve12eyoXDyTyOXpY
	 0UMqbtfusJ2rxwN7q9HR2wFdKGPrypfBJUZYQiqVWqR/+7T06BlbPnU/tuQuJMz4y8
	 fhKuCF3iWrFlSJVbWXKgCGtD67Pbsh85XZxVNxD9Tyev4mWysDty1/MJ7QRwLX0qEc
	 LgctQkQwKa/xih72YtwOeIRSx5Ii0WwAVLm0flhb/FeuVT6T7jve/JAK2kg+lEvFYO
	 O4HSSk4HHNOW7ffek7h3NwCm0g0kG1a+LvSxoqMCrI4h948r8NvSz7TTnONC9gifj1
	 HpMveXNAvaCyg==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	richardcochran@gmail.com,
	Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mohd.anwar@oss.qualcomm.com,
	krishna.chundru@oss.qualcomm.com,
	monish.chunara@oss.qualcomm.com
Subject: Re: (subset) [PATCH v5 0/2] arm64: dts: qcom: Introduce support for Monaco-ac-sku Evaluation Kit
Date: Mon, 31 Aug 2026 12:53:52 -0500
Message-ID: <178819882992.1411250.5273517029712682137.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260626111301.3479559-1-umang.chheda@oss.qualcomm.com>
References: <20260626111301.3479559-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 26 Jun 2026 16:42:58 +0530, Umang Chheda wrote:
> Add support for Qualcomm's Monaco-ac-sku Evaluation Kit (EVK) without
> safety monitoring feature of Safety Island(SAIL) subsystem.
> This board is based on Qualcomm's QCS8300-AC variant SoC.
> 
> Monaco-ac-sku EVK board is a single board computer (SBC) that supports various
> industrial applications, including factory automation, industrial
> robots, drones, edge AI boxes, machine vision, autonomous mobile
> robots (AMRs), and industrial gateways.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: qcom: Add monaco-ac-evk support
      commit: 522cffd76eb85451f3c0f71a143108b19615f6fe

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
