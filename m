Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD8A2519DEE
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790863818; cv=none; b=nyfWfMTnv2rltMFBPmdyOxosH+BUa5nZktg30GSMQ2KO9OGOSKQBy1G5mNdljXcIVBqVeKYtTNyCGp+U7j79XAGz6sn/O106CUfmL/EF/Fkicrk+MjiG6AhME9tPiyp2Xk49s15PhNe7ydveugAIROd8lXtnE2+S3Bq+dMCmP+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790863818; c=relaxed/simple;
	bh=BjHrcF+BNbl0dvUjEbSruYf04pwfXNyP2d4YCURGXOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eugruzI64GQvrlx+18RDkBC9qxNrHpIAwab5+IPae0ofkxEW5nLL827XlXjsnsJk5B+pvb2Wdwr7f61BJTHEzy71rxRCUHR5KK6sq+gxuzzIGXHlMC+AE6T4b5eZwwoiznRgo83l9bHIKXPNdt4WVZ3reM/ixLE53OoDJnVn+lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=neVrwLLr; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="neVrwLLr"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7358C497;
	Thu,  1 Oct 2026 07:10:12 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 835EF3F85F;
	Thu,  1 Oct 2026 07:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790863815; bh=BjHrcF+BNbl0dvUjEbSruYf04pwfXNyP2d4YCURGXOs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=neVrwLLrP88olN8suMLn7/Vu/uAwWaGfBSmw+FDvDL5nQkeHIK6xWV2W4MFBtGysM
	 0Byrdi2AC5nbH25n3nagVjEnl6HeSzxkQNEAprc8g9esXQvDgQFCe6UxaokhyxW1RK
	 DW1m0GdoENVytOgEUxtEcMHRFC73qiLZYYFYLhtk=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>,
	Leo Yan <leo.yan@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] coresight: trbe: Hide enable_sink sysfs file
Date: Thu,  1 Oct 2026 15:10:07 +0100
Message-ID: <179086379622.1520831.1082807013676739382.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807-james-cs-hide-trbe-enable-v2-1-0b2af223feed@linaro.org>
References: <20260807-james-cs-hide-trbe-enable-v2-1-0b2af223feed@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 07 Aug 2026 11:13:22 +0100, James Clark wrote:
> TRBE doesn't support sysfs mode, but the enable_sink file can still be
> successfully written to enable the device, and only attempting to enable
> the source would later fail.
> 
> Avoid misleading users by adding a flag that devices can use to hide
> either the enable_sink or enable_source files, and set it for TRBE.
> 
> [...]

Applied, thanks!

[1/1] coresight: trbe: Hide enable_sink sysfs file
      https://git.kernel.org/coresight/c/a32819346126

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>
