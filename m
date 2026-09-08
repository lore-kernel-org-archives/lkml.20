Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CE5360EDE;
	Tue,  8 Sep 2026 05:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788846078; cv=none; b=TU8ppVktM62AeHC3eOod40hqQDQyZoA2acOPgvbZspbrt6137bng5oRllQaxq/msgssr0MaWeC3UFGm7biH3BwMzclgHffljR/0U4BDANevmAWVtQqhHrkPgRLlbZifVYAA44JcIxBnEFOOuQX6JgLYpKxyMl5URYzabW5F2W9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788846078; c=relaxed/simple;
	bh=NNZpZ01iA9CLz62mxX9CJmcBJDzyWUeWYzS2F5F6SGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aEdA9ZA3vLeHpaBZEBD9H3FFs5xejIQjuZaiOPsEQ87ztWp0wjKh4JWmhhvIfGLttNZmcOaw4upZ9wgAhUTy/WIYtYuwWcZOVfaBjGwEp8dR9TcTwCCRuPwHig5tlMJDCYoP7XZ14jYctSJ1FK5vUBuKs33Ufjn9CWbcNy61P1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bp3IoIBe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bp3IoIBe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ABEA1F00A3A;
	Tue,  8 Sep 2026 05:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788846076;
	bh=Zbc3/QBgryJy1J1i2LuokY1ENHtSEAeqBItdH3oUH18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Bp3IoIBeFpyYdKofgPA0BpCQOp3AYApyUv94GW8kvSYzeTu+4SaM7YeDrb5ZM5WDV
	 QTVQNBwFNpbpuNas4ASHqedNjMdy7wQP3k6SOjar6b0m1O0HspMXHBlhmqGUVqrAmj
	 CFtpuGMq63fOs1F3Zi04WWb2qKUnkYpT/+2TdiJKup11HjVY5EoxaCmwgepWcYSXKx
	 2mFvoTFpyI20qdZNoCqFB6OhI/Tf+aA6nRr6Id4JwY5ryIqPNPRCs2DYUEBy+R4d0P
	 PLz6TzWjej83Mz/OajXr/c+s98rsLEJrDHy39i/0wlbphgIqYSmmiBtZEzrl+kL4eP
	 yu+efC3tYOEMA==
Date: Tue, 8 Sep 2026 07:41:08 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>, 
	Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/4] phy: qualcomm: qmp-combo: Add DP COM v8 header
 and fix register layout
Message-ID: <zhh54vk4imnad6yxvxl6cpqkvtqasbfwnsgzsfb4kzmpjj44gg@uyywbrcfq4tc>
References: <20260828-glymur-phy-v3-v3-0-8e73ce7c4636@oss.qualcomm.com>
 <20260828-glymur-phy-v3-v3-1-8e73ce7c4636@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260828-glymur-phy-v3-v3-1-8e73ce7c4636@oss.qualcomm.com>

On Fri, Aug 28, 2026 at 03:13:13PM +0530, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Add the new DP-specific QSERDES COM v8 header file and update the
> register layout to use DP-specific status register offsets for
> C_READY_STATUS and CMN_STATUS registers.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

Missing Fixes tag pointed out by Konrad. With that added,

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
