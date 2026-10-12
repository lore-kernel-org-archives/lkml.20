Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273C248C3FA
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791809771; cv=none; b=MXMy8DbzFXyfoqOj77gw0uPflgrQkj/N8AOPmNvl6WrtqOpI82o3ptQLZ2oGn8WEx7hqtY6pLucWfmrpYymfvRQNmCZszf3HHCrKvM4YX3BuZ7z0B5LolB+K7BN3y1VKuB/9zgUae40e3TEhhKPKAiyJpdU1TPlkq8XOjrS7eBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791809771; c=relaxed/simple;
	bh=XEP1JMgEvgarU2LAmWhlg8ynr61JTR9MCrQue5c2NX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SDQ+k13l8VT2QWC6KpseVTic4UMxY7UuwCjoF14y1wmc572Ez9fNXdovvOAq5gp8GXarNCbMdg8kTNmDjwoTrE8RuCryti9yGsbwGJ4hCJOxcJdZeucaOb9I2ZPaK3SKMxJSpqQw0f6ZstPgKie+qJJ7w/mTU5aBO5KKpmVLZvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VBRKvTJY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VBRKvTJY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38E221F0089B;
	Mon, 12 Oct 2026 12:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791809769;
	bh=Ib8A78xeZlcVLWl71P+eBDWU00+aCJZSmbdI9EMbj0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VBRKvTJYnETdUH/8YKPE5x3wlitUAS4JV03s52xDY9mSlaA3oFnJCvOhCnnZ5Ten2
	 9annwOEKPh5ZhQ3K99DfYMNUpwV771RvvLAvpK2Sv193G2kU4Ix8HV+C6qX4Ma0m/Y
	 Jcrgf2OyagtSKZusRJJ8tV1BHA+nlCX6CBqDacW/dwGPm/qcMNBiLM6GKuLAOWpA4i
	 aH35j9CtXwqStt5uAINtgGofCumYQI36+iKMVYioGp184Vn1/4lptjEvJEZyqnnrjk
	 ds27YnCgNrvekilyN9xqJSLc7zLHVbnTO5z90kG7jYSy3+DniGGvaYlZRjTveNLFNh
	 tZgLHQGqWi9cg==
Date: Mon, 12 Oct 2026 18:26:01 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, johan@kernel.org, 
	kishon@kernel.org, rogerq@ti.com, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, zhongling0719@126.com
Subject: Re: [PATCH v8 2/4] phy: ti: pipe3: Fix clock resource leak on probe
 errors
Message-ID: <aszYBh49xgeByYlU@debian>
References: <20260909122630.1313205-1-zenghongling@kylinos.cn>
 <20260909122630.1313205-3-zenghongling@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260909122630.1313205-3-zenghongling@kylinos.cn>

On Wed, Sep 09, 2026 at 08:26:28PM +0800, Hongling Zeng wrote:
> When devm_phy_create() or devm_of_phy_provider_register() fails,
> the refclk that was enabled earlier is not disabled, causing a
> resource leak.
> 
> Fix this by adding an error handling path to disable the clock
> when these functions fail.
> 
> Fixes: 234738ea3390 ("phy: ti-pipe3: move clk initialization to a separate function")
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
