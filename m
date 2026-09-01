Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEF4486BB9;
	Tue,  1 Sep 2026 17:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788282960; cv=none; b=rLvIE3omAyqqZsSPH4XlbdY/w8DALFBzDs1GQOETmXa0lHkPl8ReHc0oY42FI0hleNEGTDgV87AVlHD0tSU3hga9EQt1EjVmgPSk90T/oM2+dXLG8FqeKhTmhRv3wWDjiTF6D5H0CBHcYJbjh5EyLgJAszgWDxWsGuXi4LRBvGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788282960; c=relaxed/simple;
	bh=85q7RiQN/JhKIonZ75VhMH2ajkRhFwr7f/3VfYK0QAI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tf0/wF5Ag6eXdH7Q6VLdhNhyWU5X7oNLOEGd4rRFRLTx6DfHUD9+0ThZJKxaAvtmc+c7NIz7trR80NuGhHMNyfNA6rxVNedc82WTJKCbwvgazq/N7GlYwgEmhyXLPSZR+Ko3qlP/QZe5JEqIXtSg+KIuqkgWEX7pcPTqxqNgQjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n6nAuyXG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n6nAuyXG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF0371F00A3A;
	Tue,  1 Sep 2026 17:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788282959;
	bh=cQTBXpJkj1UlP7ogG5F0c8eAnwBzFK48nNqZQro88gA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=n6nAuyXGDZNasW0jNU/BngLzggwctC0v8Fw/Nt5A9HBTYseoou8eWLPU8DfewiSO1
	 KpiGbgje3sU7WCSoLtcNcE8p8WMZsmrwdEm+R+HRoVLlofo88n/CJxUf5mt8zH/PKZ
	 mlaU93p93PmWLxou9CQRl683Q9FCVFig2cz26n/lB4hxxcWBOOG9yTZuIqjTFdsGMs
	 v0zs7b3CMPhynlXtm+NhvOLPaG4DKeEotuDs6Tv4Bf14zDIybJGwjRgEq8OnM+QTSr
	 T9/IIDE++21MdTAvc5SOHsqtzWTaZAFApuj+iHBr5WeB5khYhc/1NxcvJQc4K/j8vC
	 +VspPXGGb5/8A==
From: Vinod Koul <vkoul@kernel.org>
To: linux-sound@vger.kernel.org, 
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org, 
 pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com, 
 bard.liao@intel.com, niranjan.hy@ti.com
In-Reply-To: <20260901012812.231057-1-yung-chuan.liao@linux.intel.com>
References: <20260901012812.231057-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: intel_auxdevice: add tac5xx2 family to
 wake_capable_list
Message-Id: <178828295651.1399388.16542439961102986283.b4-ty@kernel.org>
Date: Tue, 01 Sep 2026 22:45:56 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 01 Sep 2026 09:28:12 +0800, Bard Liao wrote:
> Add tac5572, tac5682 to the wake_capable_list as it can generate jack
> events whilst the bus is stopped.
> 
> 

Applied, thanks!

[1/1] soundwire: intel_auxdevice: add tac5xx2 family to wake_capable_list
      commit: 1d4d3198ccce18ec1d58ac41c47e7b2aabba2e94

Best regards,
-- 
~Vinod


