Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794475718;
	b=tnUECwb2vP5JBiu5OCSfDWp3VvVqjWbeqy0c6gWNlwA4D6JX1vO1mqP40JvkFQwHEbWm
	 EAEKkoSeT608885R8LGObm6ebX2Mfl0hwtpETmBJOnCak04ExeLgynRNn5dEqhexKvwPk
	 9bx5JZRnHsx3w+dq1uQZXxi/5YbAgGxZcuMB3rqbWCO9brnkr8qu3OAyybrc88ywnGa1q
	 XpWuBpMD4j7OlmkPModB68RPafDrfGAfIySwHjxyImVlIGQwU4IGjDtF4Mn4MxklW5oU8
	 KnK0yRW2flg4FVuPlLsPNjEbYSw8Xixed+IpIt5fM2HRj287KdovRydkxhvq+2oPDKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475718;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=KbuCzE0byKrCqNBQq3LoAsHfLXabBhfbTAhCl8zjbwc=;
	b=PrWpkjMigf55XohNY6BHpbK6zvsnPqRypVCUlMwZzT3WctcCvU9zjSwAnsVIExriaY3n
	 czAHbIYkQ8cdNNxRsmy/pj5T+V2V5+kY++x8mcl8sN4Hz1WGejU8YGz9a5b1CUftkUPDz
	 wFXg3vWnf0j5DCIdC0HAp6pUV5nipPkAsZ4kNrACqlHxnkiWobFdW+6ST+XOhTD3Az6cT
	 ysFLrwGcIT/ANGwvBS2CqPQaz3SrQEYE8eDYba8LaKALZRFlyLOlVr7BKpKgCaxP1OaTv
	 OFHga9891oIvj9SRSqPWWItFRGFM5Q2Lyo2zmmV35xpsY1I0bSXVVKhsVWuvY0d3CPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TKMPx+yy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 1DE80606A32A;
	Thu, 12 Nov 2026 09:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TKMPx+yy
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 340691F00A07;
	Thu, 12 Nov 2026 09:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794475717;
	bh=KbuCzE0byKrCqNBQq3LoAsHfLXabBhfbTAhCl8zjbwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TKMPx+yyqE6y3ZOzeXSPsNoAzxOG2USiaLHYaHfyR9cg5vIUQumBRe15h6yS5cR3x
	 FVZnNPJL0Bx/Fndef5b5qMdbYf1riQhYWjcpvVsGObnVPj/82NGgI8uQ3JW/hlc4Pf
	 eg9QQaDyrdUJNKa/kvYtya0saHYhKK754EH8R+1JlRKFKArBLKfeq6E2dySTH4Dq6G
	 4sMBC9tDplocbPJgqRlWoKKH12TTGMN7rhfhtuFUQa5c7oToT6ohNaHHRSVlOjeqiN
	 yhHlSctVeRzcWLnbBF0dKTE3VSG6zmVGpSL1WB7lSfGrP06dtmBK5LVe+tI0/9ttru
	 R81d42DfGZ+SA==
Date: Thu, 12 Nov 2026 10:28:34 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v18 0/2] phy: qcom: add the SGMII SerDes PHY for
 firmware-managed systems
Message-ID: <rrwzar7uq3sxkwsio727mt3sgxg32m4beewjswboklk5mcnggk@iv2yk3bbqraq>
References: <20261103-sa8255p-eth-phy-v18-0-b00cc2fa0404@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103-sa8255p-eth-phy-v18-0-b00cc2fa0404@oss.qualcomm.com>

On Tue, Nov 03, 2026 at 11:35:51AM +0100, Bartosz Golaszewski wrote:
> Vinod: Sorry for the noise but sashiko pointed out I forgot about one
> comment from Krzysztof. This still should be good to go, there were no
> more sashiko comments and this is just a rebase + a commit message tweak.
> 
> Add support for the firmware-managed variant of the Serdes PHY present
> on the Qualcomm sa8255p platforms.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Hi Vinod!

This is now reviewed and has no sashiko comments, could you please queue
this in next to allow us to proceed with associated DTS changes making
use of this driver?

Thanks,
Bartosz
