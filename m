Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3467F3F1073
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 09:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946194; cv=none; b=aZtqH3gqV7sSCikzZ2Ul1CRKOpUQS8NGVtvg9mcDbK7zs/HeaDnO7V1fYgHxbsldhG+oBV6GNjeMgohFFDoOs+0CCJUCCugi93DGajB+n3bEVdO72YZW4gnS6QXQLkKcTVtku4gjSURH7fvAt1r9ZAA4N/53kKPsGFhaiv96ns4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946194; c=relaxed/simple;
	bh=YBHCyyidJUAro23ju4IMIUDqTWZtl4Wqq8769jnU3UA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lwiJvORQJTK5yoQKYaobhlBARI7h2ZAIzf9LUfGOaCqkEw3elFnDwKmaPuwof2rYc0kxUMxEqyUDX7eegqcM4BF5uyHnHbKxrxZ19F68Mf8JwLAb9joeqJZIpjfr1z4eYWx1W93+cG28/36KqgWMGet8SeD+NHRYbiZyIkj5M60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fnlZk8Bc; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fnlZk8Bc"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB2C01576;
	Wed,  9 Sep 2026 02:29:32 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 174D53F528;
	Wed,  9 Sep 2026 02:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788946176; bh=YBHCyyidJUAro23ju4IMIUDqTWZtl4Wqq8769jnU3UA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fnlZk8Bc/XKeil61O/z4hKox/RfFo/tBcfry3clDwaP29ttvrEzFTy+qZ4B7r+BbH
	 BBhP+tK5CW3qRGD7SQ0exGGP21UTBMhIKK3l2au2SIcEvxQAP0Q/1ZbAiY4TJKwdbL
	 ENoiJsagOIgPciAOcAHcXvf3Es1PZWxVDyegc2Y4=
Date: Wed, 9 Sep 2026 10:29:34 +0100
From: Leo Yan <leo.yan@arm.com>
To: yingchao deng <dengyingchao@kylinsec.com.cn>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Miaoqian Lin <linmq006@gmail.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	qinyungao@kylinsec.com.cn
Subject: Re: [PATCH] coresight: syscfg: fix deadlock on device registration
 failure
Message-ID: <20260909092934.GD200420@e132581.arm.com>
References: <604ED754D4669F40+20260825014717.2346-1-dengyingchao@kylinsec.com.cn>
 <20260908161614.GA200420@e132581.arm.com>
 <ACA6A9E0ED9B6395+1c28050a-b7f5-419e-be5d-e88010592ed7@kylinsec.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ACA6A9E0ED9B6395+1c28050a-b7f5-419e-be5d-e88010592ed7@kylinsec.com.cn>

On Wed, Sep 09, 2026 at 09:34:07AM +0800, yingchao deng wrote:

[...]

> I'll send v2 with your suggested change.

Thanks a lot!
