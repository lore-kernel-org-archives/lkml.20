Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66EA3E171B;
	Fri, 11 Sep 2026 05:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789105161; cv=none; b=Bq8TbjBKmhHwWxOXmIpkP9jXFlacUIYdeP5Od3gvb8Vetm1yihwgknZIeLqcWQqTHGFsDUXKxfVPvHwPKdWeuHvdB2oWT3Mao3XQb17bBVuARP+Nlf52EZgvnbeZ5CkCQnjK4ZHj2zhZyvzcRBEMWnNtI8L/sudIhVxtkbLKUBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789105161; c=relaxed/simple;
	bh=ovYANnVI+M7edwI/fB9fLiv10vxwz+uAV7p+z5N+I1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xm6zJOOZ5FChzuQ01ilJq6/ilIuDaAf/XsGWcsHm96rqNJBukR4oFaTRm8GorU5iW4Sub6XIp12Q1I1ZJ9idfRQ/EpEe7Fh6Hg7C69KzSoX9dIO9Yg4INygsRdLyonvr9zq6XUobBOP5GS9wpZqV9G1sbkArwVQaulWm3iQIsNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DusSIJc0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DusSIJc0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E56B11F000FF;
	Fri, 11 Sep 2026 05:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789105158;
	bh=O8ONJipxGHTu0R8c/Grz0xo9ahF6qMivmSfFqfS4fUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DusSIJc064NNLBF+WWfg2lr3ztsalS0ns16iCsnVV5pWEw72ch0zfnswhElCMLcIU
	 Sr/hG5w1oaxR5b2pJKECg8BMR/4kpv6xLx5eq3/WHA6tMGpKJ9e4Bipu8wPWn7T9dV
	 bJ3/LVxr4rqfg3LldpC71b/zk3FtCfw52IGtCB62taOZ4/BJOPU46+EaZRGVs4keWG
	 w1El4lS2ipSzZ5Y5F8VfmiFFHeix50IoNXD0ylzJoVjb/zD7mxH6+hSwpUV8p5IFK/
	 0i/OhO1FPpwT7eOLCYUzT7zwPR4Ff04glReK0oMeiY1YR6ZBgoQmW63wMpW87mNZPj
	 K2w8s0/J2NTCw==
Date: Fri, 11 Sep 2026 07:39:12 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>, 
	Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v4 9/9] phy: qualcomm: qmp-combo: Fix error propagation
 in qmp_combo_dp_power_on()
Message-ID: <z5ufkalh5jlornxfjhosnb5he37trrliyfyl4qs6hug5ju23rp@g3o5h4bqrtj7>
References: <20260908-glymur-phy-v3-v4-0-ff22e5150538@oss.qualcomm.com>
 <20260908-glymur-phy-v3-v4-9-ff22e5150538@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908-glymur-phy-v3-v4-9-ff22e5150538@oss.qualcomm.com>

On Tue, Sep 08, 2026 at 07:31:02PM +0530, Nabige Aala wrote:
> The configure_dp_phy() callback can return an error (e.g. -ETIMEDOUT on
> PLL lock failure), but qmp_combo_dp_power_on() was ignoring the return
> value and always returning 0.
> 
> Capture the return value, skip setting dp_powered_on on failure, and
> propagate the error to the caller.
> 

Missing Fixes tag.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
