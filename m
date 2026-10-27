Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793124490;
	b=TnclxWmgxv9g3zTjQ3dP+ga+3P9aDYPhzR1ojNdIZfjXmulB5X//dF6Xb1LDo989CRCk
	 ZmP2i/cmQrhyuYWfMQw47gFlb3C0gT+HciBrzYRLJievHIdQXxfb/86HBQIvSXQOpymHq
	 hgLtx7HqCm+fyAEa7gxZu8imB4awZ64HptexOXlne9ckX9S0ytret2mCtvJvgwQMuRf3M
	 ekXwmR2jYcJ05qLD2Aq8XkRxyZbOIhR9Ion5MauT4XDbyg/dBkW3tJ24FOR3OrSsDoMgB
	 ITOFXC/HsfyN0Qji2L8C8n957iZLDE9UCq8GX1NGw92DHkt902YP2mZmwcHjwRdkL4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793124490;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=g4TannF1eLfeNwWOP3+/v54bMaOT4jX2MRK7osTgbCM=;
	b=hhRkVOnaPRDqotMg9MksNWHZl8mhARbeAz4YirL7rYAvkPzyNZFyeFMhZ2c7VupYElAV
	 XoTdxhT1HUZv4SRzM/wby16pcspWfbyJAnA2hGbg0lCPVco1YqpP3om2lR9okNgwTTz07
	 l3hiRvbMKn4jI0B+c/QvgS3SNGCiaYR04dUi8d5/8Cdrhli66KblAlH98o7957ptFRrbl
	 FWRSqkjpTRPMUZvOx4X6R4mOQrcy7p0zSeuSR1LEfRXISXDA/2VQE793ibQhHID0dDtFD
	 uGZLHqWof5uzkDQnFNtSYuMJEADZvSuriKKDTDZznU8HvMe3ixWr05jVBbFNCjtjk7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hW+Be0W6;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB143606A320
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB143606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hW+Be0W6
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE3EF1476;
	Tue, 27 Oct 2026 11:08:04 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A542F3F59E;
	Tue, 27 Oct 2026 11:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793124488; bh=GJjpafRmXrBNftY9I+AgaiRHA6ss3HwiCBHesSN7LD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hW+Be0W6NXrcMYYQ3+3I9+gACfnYWRCyv01ElXqPeGGfs0FuVcY6xqW+565uoZ2NP
	 G0OPRqaRNin/8/hg4m3LI5LrA9UfhKidMNh1VnNA+zgLnes2/PDgbiSc4VZlmJdjWl
	 QCrpdoGOFjjjd+r75w+4BXDhpWKcYGF7D05FclwU=
Date: Tue, 27 Oct 2026 18:08:05 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>,
	coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 1/9] coresight: cpu-debug: Fix PM usage counter leak in
 debug_enable_func()
Message-ID: <20261027180805.GA9176@e132581.arm.com>
References: <20261027-james-cs-sashiko-easy-fixes-1-v1-0-db43c4668644@linaro.org>
 <20261027-james-cs-sashiko-easy-fixes-1-v1-1-db43c4668644@linaro.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027-james-cs-sashiko-easy-fixes-1-v1-1-db43c4668644@linaro.org>

On Tue, Oct 27, 2026 at 02:55:47PM +0000, James Clark wrote:
> pm_runtime_get_sync() increments the usage counter even when it fails,
> but the failing CPU isn't added to the rollback mask, so its reference
> is never dropped. Use pm_runtime_resume_and_get() which drops the
> reference itself on failure.
> 
> Fixes: 2227b7c74634 ("coresight: add support for CPU debug module")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-2ff60e6d-33ac-4a69-9c62-63eb482f1913
> Signed-off-by: James Clark <james.clark@linaro.org>

This duplicates with:
https://lore.kernel.org/linux-arm-kernel/20260911-b4-coresight-runtime-pm-failures-v1-1-acdf49756e11@qti.qualcomm.com/#r

I'd prefer to pick up that patch, as it has fixed all drivers in the
CoreSight directory.

Thanks,
Leo
