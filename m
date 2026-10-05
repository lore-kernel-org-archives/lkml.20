Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 382C64AD4A9;
	Mon,  5 Oct 2026 14:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791211648; cv=none; b=UJbeJc1Gsaq20LoDoNE1rXs3oMPySZiURirj/H0sUSJv2TWKFWNR8B+QGU9bM0YkLM7ojXmHeWc1iMouyiUeLJlDrN0L7XfdOgsZx+2NrhG89Fhu8hrZs7v0oxfUIj2axAfUl/fkClVY/o7qj4aTVWAm6NhnYVnaYXFjrXy7aKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791211648; c=relaxed/simple;
	bh=9T2fmSNRbjXFVPQksKl+UwFKOHU4uZBn0rZ5YRuuXiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HurUEN0c0gEdKO+XNQ8ShlruLZheROJN6VK604CS7KEEYaDCXtAbOu/w1iaU1ixhRaj61OYOCDdBGrqUklC7vUZfbnwYbbOTbYruiMzXOThL8fZwBok4btGf4Cf6ozAyrDsf+grn0Li/V4CgsnobJr7gM1Fs8WQW3mx4rfJR/hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=IRmoPjy4; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="IRmoPjy4"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57A2A152B;
	Mon,  5 Oct 2026 07:47:19 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5CCAC3F66F;
	Mon,  5 Oct 2026 07:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791211642; bh=9T2fmSNRbjXFVPQksKl+UwFKOHU4uZBn0rZ5YRuuXiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IRmoPjy4x1D3I65S3fuZZwvM/YUbo+fDHogt0bn7J0vJ8JhY0OZ5z7xjxXYwh4Rz9
	 AYZH7sCcEGNxNA68Dmth5z95uoeV7a5lbogEIuC1al6IH7rte27ZOnL8amzB8MTpiA
	 97wr+5l/e0XGTei4n9y2QszmJh7+fFW/IcOgkRas=
Date: Mon, 5 Oct 2026 15:47:20 +0100
From: Leo Yan <leo.yan@arm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Wei Xu <xuwei5@hisilicon.com>, Michal Simek <michal.simek@amd.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 5/5] ARM: dts: qcom: apq8064: Drop PCLK from static
 replicator
Message-ID: <20261005144720.GK1208404@e132581.arm.com>
References: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-0-c3edca1c480b@arm.com>
 <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-5-c3edca1c480b@arm.com>
 <z2bu73w3xcl4ofbp4td3rj7wazzoth5gq35obiqkrfhhfxufcq@hrfvij5jnb55>
 <20261002153328.GE1208404@e132581.arm.com>
 <umknnkfjevejagydaktpq6zgh4l2uuxy4k2f5l7v2ypr2xb57q@obtxdmeihisp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <umknnkfjevejagydaktpq6zgh4l2uuxy4k2f5l7v2ypr2xb57q@obtxdmeihisp>

On Fri, Oct 02, 2026 at 07:05:14PM +0300, Dmitry Baryshkov wrote:
> On Fri, Oct 02, 2026 at 04:33:28PM +0100, Leo Yan wrote:
> > On Fri, Oct 02, 2026 at 06:21:36PM +0300, Dmitry Baryshkov wrote:
> > > On Fri, Oct 02, 2026 at 04:07:24PM +0100, Leo Yan wrote:
> > > > The APQ8064 static replicator has no registers to program, so it
> > > > does not need an APB clock. Remove its RPM_QDSS_CLK reference.
> > > > Other programmable CoreSight devices keep their clock references.
> > > 
> > > QDSS clock is not actually the APB one, it's required for the coresight
> > > (or to access some of the regs) if I remember correctly.
> > 
> > If so, it might be atclk for clocking the module rather than the
> > register interface. Could you confirm this?
> > 
> > The replicator is just a middle component on the data path. I read
> > that it shares the same clock with other CoreSight components, so it
> > should still be safe to remove the clock from the replicator node,
> > as other components on the path will ensure that the clock is enabled.
> 
> Unfortunately it might be hard to find info for this platform nowadays. 

How about rename RPM_QDSS_CLK on the static replicator as "atclk", the
optional clock name supported by its binding.

          replicator {
                compatible = "arm,coresight-static-replicator";

                clocks = <&rpmcc RPM_QDSS_CLK>;
-               clock-names = "apb_pclk";
+               clock-names = "atclk";

I would leave the AMBA CoreSight nodes in the same dtsi unchanged for
now. They need an apb_pclk lookup for register access, and so far we
have no evidence to justify adding the same RPM clock again as atclk.

Please let me know if this works for you.

Thanks,
Leo
