Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223462;
	b=o0Z38nWl+B12BxarcTnIjOyMnpU4318UuuhtvAqwulwuKo7FA2J4jnu184cegEbOLQnN
	 Bexh6mCbFNT0KmGti9s5hW+2aoBpZ07NhMxxijk9kycKNcsQtbu9oJoivF7i9hAzsiNT0
	 EPDfeMDurHUKffdGUnUkkB9puQX6BHqs82sdbRnS3+Jmo0YNgSoJoUtiKgrX4peM5joWY
	 hs7R7GCG1sGYLGH3qpSMh7TGGtntvTDmpShihh9yUmjIc/zi8R9CBolhg8hovjuEWpexI
	 KLLM5dnNoB50xTphtisqa7hRYQirEUloVgPCQp4dhf92faHV0oNqVEwJJhU967blwQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223462;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=4oWMsz1WRA/4iyR10gjcesrSJWoNFgd0/ws2ghj/hec=;
	b=UURoSrbozbwF/C+ZQ6E19EMfntJSVPpHslk0VOmQIK6+AKT5xAQ0OtgXHd3PAL72mLiA
	 yGh49onzhj2U3QUZtO2iaHP4jMf/tXLnxSrrmxyOHAFvg4Oxmq6wG5AXCPkwggku1Pvq/
	 BeiPClNA7jqwi4Vr5sIfvmN0i2FuApcnfHaI4sckHctCbRbwnuFhwf5pyuM37F63Mc4B6
	 W27pkLacM6G+TyuS5Ls3t3fifJjz6gWnWtXEHDFeSOiFqgwqkjg/Gvw92M/98/ypOFmOK
	 Mlvr4KWrx3mDe6aZ0BtRf5pVlVnitE2l8Tsrjh0CTAi+jqAX9LA7fu8TG3pSKn9bsgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AUpcF9rc;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E17606A330
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66E17606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AUpcF9rc
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81FEC1576;
	Mon,  9 Nov 2026 03:24:12 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C59B13F85F;
	Mon,  9 Nov 2026 03:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794223455; bh=kkzH8ilX2x9sZQrNQewI6dXSqwaZnr/xmC9vY8oBM5Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AUpcF9rcgqAfzV1VEBIiZpL2O6O3sFw9Cs0kUwlTv8wOoZOqybAMjRs6PdssdYkat
	 G4e64rdvAeCdq2Zb3d+c45hwMoZnqkSm56MGmRsogHLRsoaUrUuIf3evg/vA6CQayH
	 rgKVC8OFDnG2bWfbsz65SX7bKdVt+ishGeiyPfPM=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Tao Zhang <tao.zhang@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: tpda: fix race between refcnt check and register access
Date: Mon,  9 Nov 2026 11:23:53 +0000
Message-ID: <179422341586.3275439.7185301847041748123.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408-fix-race-condition-issue-v1-1-9a148d07e08f@oss.qualcomm.com>
References: <20260408-fix-race-condition-issue-v1-1-9a148d07e08f@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 08 Apr 2026 21:23:44 +0800, Jie Gan wrote:
> Several sysfs show/store handlers check csdev->refcnt before acquiring
> the spinlock, then access hardware registers inside the lock.  This is
> a race: between the check and the lock acquisition, the following can
> occur on another CPU:
> 
>   CPU 0 (sysfs reader)              CPU 1 (disable path)
>   ─────────────────────────────     ──────────────────────────────────
>   refcnt == 1, check passes
>   [waiting for spinlock]            tpda_disable(): refcnt → 0
>                                     debug clock disabled
>   spinlock acquired
>   readl_relaxed()  ← FAULT/hang
> 
> [...]

Applied, thanks!

[1/1] coresight: tpda: fix race between refcnt check and register access
      https://git.kernel.org/coresight/c/4f5f1e5ae120

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>
