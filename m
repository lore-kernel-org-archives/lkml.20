Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934594FDE44;
	Thu,  3 Sep 2026 17:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788456067; cv=none; b=WzZrq/XuQ/FESNM54WoAmUcRtFcZIM/aWlNCU98cPbJA0Z/NV21sE1Vu0Kok2uVMPgs9k7ewZpAnN0bC8X2qQaEN9eXmdJotTbo9o5M71MmH0NnJYbKOoKuhPWbTZ9jNt+1LxvjTn5yf4bH1jcBmbbgPhy5wxkB6k42r65NK0rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788456067; c=relaxed/simple;
	bh=BsFYeHJFbRkN7L4/X1cjaPBklsEheoLOioZXmpi1FNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CfK27GxIeb0wT6tpey2Wmm9kHwpMnDmurvKX4fRdBO3bWhq++GqJef83V7HECFHBPVYeyq0hW4IpADUFz/XtBNjTwa2fIlk8BcNUfPEIdVCI6hqPkdpwhIaDg7W4SS+R3eJBt4/D0y5WIiBrh/kT5pcf/1V7BSeWQ3H3pRDZG0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kGgWdgaK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kGgWdgaK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A60751F000E9;
	Thu,  3 Sep 2026 17:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788456066;
	bh=CElnlB33TsaQSwBCd0+edg2HvwemWlkaUgyejN9+fXo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kGgWdgaKYFX744X+Slpg/0UIDCMYrqakbC4Ep/dE4xvecOtNncd4aWO11QITa63Jx
	 JTyHk4grGWAeOmbQmpHuS3ZIYm4VxY1yZKwnR4F8YeIhbGnL0zFzpS9wGZ9kkFo5Qd
	 /P1hRn5ryVV2TWIlzR7/WoBniHYb6LXnlsAgACEuGd5Gel8hWFATAy0QcsPQG/jTji
	 fUTF2j39kOdXcmpsmOYL3Ak0B7t2/at6zvRtnvmowZMoR0FiLgmJ0bIlglggt5sk6s
	 vCXOWrFm/IZot2d0erGR+U3z+oKyKlYMf3mKsZHDO68bdFx6RE83QpvJ4IXede5bfx
	 yVBDsxkNHF5LA==
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
Date: Thu,  3 Sep 2026 12:20:38 -0500
Message-ID: <178845603580.348193.12141040001593368130.b4-ty@kernel.org>
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

[3/3] arm64: dts: qcom: monaco-ac-evk: Add IFP mezzanine
      commit: 0fb8fb4e7377d999456e184503d053429fd605ab

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
