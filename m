Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B68CB3AB460
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799304; cv=none; b=k6uPVr5opn2+zVFKaBOiq1Q6lONfFEEMUr+pqtb33Kc5LrUsKOth2I2UrADbsNp2Q5Bc1c99mW8Honk2IBBuF0H4TfNrb1yvN2Eem20c2dkWOJUx28jiShUR/Ikj9w3pwE6I61kzueKbN52YJ7TMWfwblvBZv68Pn2iQc8AbX6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799304; c=relaxed/simple;
	bh=ioxAD5NEefwHCH7m0022ZaZKRDDFOL0UF+08q7OYx5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pm91e4mVAu88cdXZZrGjUHHXAiAke8PvZRLeBHqkNPcrWL4Zi87KGwZ910Qq/hkdusH7evZPwZa50kOcH2Pn96SMPcklawuP2DtO+aMSVXTjNFpFOCx+yfIHXip6p34Gy+grMKXQQEghljovMzUH2FRJZr1fzRK+MQppg6vAyg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qxS42MyA; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qxS42MyA"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C8DC1655;
	Mon, 12 Oct 2026 03:01:35 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AAFD93F882;
	Mon, 12 Oct 2026 03:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791799298; bh=ioxAD5NEefwHCH7m0022ZaZKRDDFOL0UF+08q7OYx5Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qxS42MyAin7q7dbLbP9d7IHPiEH86Nq81W40jF9iIYzNHUyBoljSr+qhFmjjPj8Ef
	 o/SfuKhtd8dL4Z6UW31sKmN1yOSjJXowxToSdUQxg66HMP9zK/Pcdl5v0QWtePN5kr
	 syt4hJ34mdOKUtJWS6ApJrs0jHLP1bPaso+hy0C4=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH] coresight: tnoc: Constify amba_id table
Date: Mon, 12 Oct 2026 11:01:29 +0100
Message-ID: <179179927012.2623661.5598266686499948785.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705171934.116425-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260705171934.116425-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 05 Jul 2026 19:19:35 +0200, Krzysztof Kozlowski wrote:
> Static 'struct amba_id' table is not modified so can be changed to const
> for more safety.
> 
> 

Applied, thanks!

[1/1] coresight: tnoc: Constify amba_id table
      https://git.kernel.org/coresight/c/343cfcbb3ecf

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>
