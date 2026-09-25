Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10E44A6CE9;
	Fri, 25 Sep 2026 14:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790345723; cv=none; b=SCFWyUFqSMo7MzljOiQ1uT0W9ALxGH8lq4Eu4mAVpiRpFzopuuVpbIW+33rXP4lK2LO4MOq9sJWdEMKlVDyWEd+2X4OukHDzKlBIV+9fDoU/QNnU/txySxDZPhCffKBCbALoawt8EqhS5JsiMmNgrSZto2YDZhjvkKvRK7gvJhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790345723; c=relaxed/simple;
	bh=7eVfCgXKWGUyx+ULl/Wf5HVLa4aM913WECP564yeNNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tZkzbZNTATcmA/nk+BXvrjFUf0rl3liT7sstY1qixurr+vD6FJTHPMkF7rBswJVlCwYE2usyZL1SmjTvkGxoibiLSkmBb0meS78PaTXw7wS8qUw5OuVMye+ipg58xZjHkuCh+wlzGWY1hfZYtU5DibDcz0DeSg8bm6Xe9X+xJ2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L/Muj49M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L/Muj49M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7061F00893;
	Fri, 25 Sep 2026 14:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790345721;
	bh=8K9jQFDfVTCl7JissWrgyjG1zWG3ZYUG30Be5h2TTx4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=L/Muj49M2OnjIKtB1IF/sKaJzPuCdPs/Xvwdsps3JJ4EOMDVDwKhCmB41aNfLqHaq
	 nvv2hSWopr9PmfqkET8qtZ0JbDgiZbjZpmcxJcTS7xYZ2H0AENhJuqKC1Ajiv2ps4L
	 EXxNa5+nSNr9+zWuxNoAQax/hUXbkjMp47/KIivmwbDZ+jcJVRiKaNDMp2SdPJiSCP
	 cMyNmx6mj1tHnRFDquayaKlV0n5hsVmxVbfv+69mZDl5ukEwT4bS1ypUCaEh01zGE1
	 zrP+Y/6wIe9BwoA5ooK0wihb8Vy76vy1E85WoE3dfwXKtSLOrUHysmP2eWe1ZMWtf5
	 PPOEpeJzhTu7g==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v11 0/3] Add support to read the watchdog bootstatus from IMEM
Date: Fri, 25 Sep 2026 09:15:05 -0500
Message-ID: <179034566349.1095282.15482882343181064968.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727-wdt_reset_reason-v11-0-eeedb22beefe@oss.qualcomm.com>
References: <20260727-wdt_reset_reason-v11-0-eeedb22beefe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


On Mon, 27 Jul 2026 21:17:34 +0530, Kathiravan Thirumoorthy wrote:
> In Qualcomm IPQ SoCs, if the system is rebooted due to the watchdog
> timeout, there is no way to identify it. Current approach of checking
> the EXPIRED_STATUS in WDT_STS is not working.
> 
> To achieve this, if the system is rebooted due to watchdog timeout, the
> information is captured in the IMEM by the bootloader (along with other
> reason codes as well).
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: sram: describe the IPQ5424 IMEM as mmio-sram
      commit: a97cccbf7a3025df41fa49d894c4e118594f046d

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
