Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3451E483BD4;
	Wed, 30 Sep 2026 10:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764395; cv=none; b=dV4OYxt7PYMMzpIxGDeelzZOKcCBux8UItrMDfoRr1J4VlD2AfvoqiDeJoZ1Ujg05Dslqce0mvavO1BuUUT42N9doDyJwZDysIkcGobF0vUMvvEqos7Z3V/UuLCcbPLGhXaeLT/2pnTOQbqX6RzG4vvMnaH5E77ndvjCWmweHvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764395; c=relaxed/simple;
	bh=nUUrPfoxeoIOtII/Y3qhqEGmEnKiKDIun6Nzv7R5Jyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IPyAsIoJc4aft/iw9Z5xMZ9dSPV+8x08DwSwiiA0HtzkvgQ+NlooEgCsZ18MWNmKcA9VZoebr1SSdIB25bZA9Wiz7WN6Ch2k4q4G/fnsKjU7d09LF+uSPnBUxLh/XY0f5Yz7D7AHzEO/o3WhrrFzm+fwpra0J1FLXgYWdQlsmPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZZE4Zyka; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZZE4Zyka"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EFB31F000FF;
	Wed, 30 Sep 2026 10:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790764393;
	bh=SlzvIfXQMZTAzcLfa5qKcO8crOpD4oFhPZi7BRvdPzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZZE4ZykabQV5457FSFVZUAy4R8uyjvhBUSYq+h3sPAOhU4YaClyRQmb4ALS5vKQLL
	 KJvIYHx7Z0R1RfaimF7D77ekp8C8M1kJ+BTo8Ey0ScFgZZX2jbD0Ug2CJxlceAL8+H
	 l3rh15F/+Mo6nU3jYTnHSArFnBUuseJEH9WbLxED4BpnO6+posbJkkoYOc2HHepj1D
	 gRYIaMf013xFeIkkHeCv0VgKlJv0rPAM66Rj+cZVdZXECSNNMeaTxwGbZpSuoWIgS7
	 qfUmIA6MGJfqZu5LbSncqE9JuDWi1ruVSrQyOU8Af3dXzfYxzQePUPqD5EkglEjcsT
	 WlQ0CZ248MsSQ==
Date: Wed, 30 Sep 2026 12:33:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com, 
	Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Subject: Re: [PATCH v17 01/11] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
Message-ID: <20260930-passionate-mole-of-efficiency-8dd27a@quoll>
References: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
 <20260928-kaanapali-camss-v17-1-dcf3fd37f76c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260928-kaanapali-camss-v17-1-dcf3fd37f76c@oss.qualcomm.com>

On Mon, Sep 28, 2026 at 11:00:27PM -0700, Hangxiang Ma wrote:
> The Kaanapali CSI2 PHY is compatible with the existing x1e80100 CSI2
> C-PHY/DPHY binding. Add the "qcom,kaanapali-csi2-phy" compatible.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

