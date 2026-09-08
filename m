Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B110D36F916;
	Tue,  8 Sep 2026 05:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788846134; cv=none; b=GSMcdCkA8AjYJnkEqFF5urYa7fITMd3iJZjS58n0B5Bpg50pZzVu9vpCRiXXdg2eCblKQU0oo0iY1r+c3Nm5fpBfz+7eo4KM0urd0H6vH4hb56Sv62p5HiUn1qkM/UMvNRDmaZ1M5QP2lJoIxfzjGjk68ZMrPoLdAXFantW2Ehs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788846134; c=relaxed/simple;
	bh=B95EeUPVxARRvgs2TBsRkERgJuEwOEx8R/YSLeEFO40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h/Sb0HyW1Dj1sBjbpnYS2Q4v4/cjGEdlKaxzpWNvAWnodkj0wrtj/fmvTNIk1egLxBy5BH4KSBZ8S4dYq6RkydFDcklspAvi1aW3eYdHB4o22aRam9dUfKJhQi3HZyNFaxmRID6Ez1MpfViiwH53skIyTcXX0ZC52yK5PZJbUTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bblt7AR7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bblt7AR7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83ED11F00A3D;
	Tue,  8 Sep 2026 05:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788846133;
	bh=KgnqIr7UdRvBDkUAm8N2T9hQv3n55lNAI6VA1FdVOpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bblt7AR7DCVrPTeI0sY3bIJ3aLvd3OzvrY4UeqZlabgashxgz+tMjwq1QVCCofOrn
	 ipqyoEfF6qToOf5a3Ez5xtWLfGodHs8XCLL0QpBjmliJYdUWP3kPpcpG+j0YWIKK5H
	 sNFZVH+k5HitVqB6lXazo9nfCZvtVhiR0H9K92hxgJK49WFx+9akipChVLjh3Rpayf
	 HHz5MePviYpGvbcfGNOuKAYHOx4iIxf+WqEP71qmiYT3IUG7pHdSlSN7UT5djkIloB
	 Q/lh2a53bJfYM40uTQsd7s+zie5ztxZVSuHpgueva+VCj02Ml8PIJ1/GXPZLH8X+T+
	 tJmrEmLr2jrEg==
Date: Tue, 8 Sep 2026 07:42:06 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>, 
	Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/4] phy: qualcomm: qmp-combo: Update DP PHY common
 init tables
Message-ID: <bivsendfomibvs6kemiwhrnqhamtozishrd7i2hfqikxx6ozvn@xyfhtuenipxt>
References: <20260828-glymur-phy-v3-v3-0-8e73ce7c4636@oss.qualcomm.com>
 <20260828-glymur-phy-v3-v3-2-8e73ce7c4636@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260828-glymur-phy-v3-v3-2-8e73ce7c4636@oss.qualcomm.com>

On Fri, Aug 28, 2026 at 03:13:14PM +0530, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Update common DP PHY serdes and TX initialization tables with
> corrected PLL control values (MODE0 instead of MODE1), updated
> SSC step size, reset control, and various TX lane configuration
> parameters including emphasis levels and driver enable settings.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

Missing Fixes tag as the update sounds like a fix.

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
