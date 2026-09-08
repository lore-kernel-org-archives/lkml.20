Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD0F357D11;
	Tue,  8 Sep 2026 05:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788846175; cv=none; b=BdvyNkRYbU0KvjCE9YDeMjdcZ5um+FMaCHS1f/24By+m//82W58Jd1oerCDvfT9sW6wMnjxeSisQfEbzADtzPn87Alw0FFbMtMbAuExWwbt2Vuz/adPXJ4wqVuy+meQoA7st3Ot2ZxtztQHn8IaDtEyC6dI96gKWR1uUzbP3ntU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788846175; c=relaxed/simple;
	bh=uiyjXvjczF+VqKcA0lwhOncz300CSb2NwdXlm57hguc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AyV15YWMxnWURPa90ZCbhHy4NG8Gj8QIhxX9Nsiu7ei9BVpxlGVlbf+BKr+iOYpX6I6DdU2HGR1/ULl6e8c+k22iTbl/g2EePXZtFFJqQRRNBjBx5dKk+oRu703F4aFUjiPbAYM3q8Fy2lowgGmWosXBqfHnNadN1vknWM72+iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DBxEq7tc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DBxEq7tc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 578471F00A3A;
	Tue,  8 Sep 2026 05:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788846174;
	bh=9sHEWlWrduaZo4Cw6dYBGV0fa0iwumEibZz9vIlNPKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DBxEq7tcZGqlXO5/Z6EAU6edEONx81ZGdqmKud2Q6iBgbQCyKt40K2lyaLG+VKwu/
	 R/RBBalhqjW0tVZiuLDagoFdSOgy5nbJdGjPmySNE7dfMU3f8H5iLyrKR4c/EyL7Hn
	 5kO03TtRYiFPXl+Hv0jFrQhrQRHcondb0Yh8iB1ZKW5RmZo+LqGhjtaRuLg4rk5Tk/
	 IPS12FoThq9s44iSZDJFo/SPW/M5pJURV7d6zUuVZqB/R4csPN6DohpKm0Kt58K/f4
	 8RkT2dxajI03pDiEArPZehWZ5V+LUeGvTb5oC4jGdCleZ1vkHrcMnuIyY980R9bEJ0
	 8OYQZOyaur3XQ==
Date: Tue, 8 Sep 2026 07:42:47 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>, 
	Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/4] phy: qualcomm: qmp-combo: Update link rate
 specific DP PHY tables
Message-ID: <vm7epwl7mz67xhp3flxji4lhor5g23xiclu65xyk3xhikoug4g@p372qnb34r5b>
References: <20260828-glymur-phy-v3-v3-0-8e73ce7c4636@oss.qualcomm.com>
 <20260828-glymur-phy-v3-v3-3-8e73ce7c4636@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260828-glymur-phy-v3-v3-3-8e73ce7c4636@oss.qualcomm.com>

On Fri, Aug 28, 2026 at 03:13:15PM +0530, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Update DP PHY initialization tables for all link rates (RBR, HBR,
> HBR2, HBR3) with corrected VCO calibration codes, lock compare
> values, SSC step sizes, clock forward config, and bias enable
> settings for proper PLL programming across different data rates.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

Missing Fixes tag pointed out by Konrad. With that added,

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
