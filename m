Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C2B485501;
	Mon, 28 Sep 2026 10:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790590611; cv=none; b=lPxngQ83kuIyJRIy5N13Nu9AXdo/UnBVO/rPamVRHqkn3n8YaDtgkio1t6acVfun8PhAV0lfBrR25tEN8+gQbLdSrI8iIT+lAV93amyIydVOFlqqq/DVLFjjF5Qle4BemEmUREFxaVPGWwJNt40pdlhf5gUOB1i9loJj3Twm0Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790590611; c=relaxed/simple;
	bh=mK8ulxnnMyP5eYT/pg3uyc6XYyBAinaTknBXP5XtnZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M3dZaTgtg/KMdi+blljVsnaV2+lq6YEoYCwh2VSo8ilpOE0kiS6XvhmopDagxG3uOjGzB833gwfVYHobWZymTqL8dGZM1AGf14ttqUs81y3CkEK5NBfKOZeSziISA+NaWBTM/zGA43s9WJmh0sXOWRSs1BRol8Jo3W0+bW9IpCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ES/gPL16; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ES/gPL16"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 700881F00893;
	Mon, 28 Sep 2026 10:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790590609;
	bh=mK8ulxnnMyP5eYT/pg3uyc6XYyBAinaTknBXP5XtnZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ES/gPL16MsVcOsAJ7UHwllsLtlGfv3MBKpTIvn+xuuClTj+jY7hev4G7wJc14Pjm9
	 aUFFlURIeqo++FJW4LCti3ieqN4hQHjjvstl2m360zskD0xfcDVzf3nSYutszbFSRt
	 E0O6ATp3950xLbz66TBsrtNgjnmhyE9gVFl7S5y9yI++KGulhIPx9WA4uIYtCSTsKu
	 7WP1Z1gqCxAAQWma0rYq4g2wtMfD8zO55kpbvYogdoMwQtgAmS0x+X7/7SOkvcgSNj
	 BidbUD7uMAbyyOTnMvOAzi9M3et/JL/ip8NXXnUev1tshZyza4uffkdQ4tTNqhFGqb
	 +T/zPb+4NNCWw==
Date: Mon, 28 Sep 2026 12:16:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] dt-bindings: phy: qcom,sa8775p-dwmac-sgmii-phy: add
 Nord compatible
Message-ID: <20260928-gregarious-deft-boar-e776ae@quoll>
References: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com>
 <20260923-nord_ethernet_serdes-v1-1-f8ac1c487882@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260923-nord_ethernet_serdes-v1-1-f8ac1c487882@oss.qualcomm.com>

On Wed, Sep 23, 2026 at 05:34:17AM +0530, Mohd Ayaan Anwar wrote:
> Add the qcom,nord-dwmac-sgmii-phy compatible to the Qualcomm DWMAC
> SGMII PHY binding.

Why random order? Why not enum with existing part? Why not even
compatible with existing device?

So many questions, yet commit msg copies subject.

Best regards,
Krzysztof

