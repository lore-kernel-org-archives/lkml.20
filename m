Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F5EF481643
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584695; cv=none; b=mTorWyt3NG0a545zZpLS93+TC+2m1XyZ3/sOoX6ELzv3IwqwtZjeQZtQuvCkSpDdL7EXl9nPaxc01eP0M0pCtw5fO/TTFEW3xb5XclCSU1k3V6NlyhpAIDM/vq8WpxdGT6wlIlLDP5thxe4d5PoPz5EHYV9PceWyAIy9LQRyhQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584695; c=relaxed/simple;
	bh=w0pjlC9s2ArhYjQY1ae0MzGnNdrjLVGIM+GY+diDyYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SiHmR764qOGo3pHg49A7tOOvxFkdcUf7AJzSMf10jJQ1rVUAC3SbpzxnckzqxFzWqDShLC12Y8ea0pMLB9jKuDNfQRgfqNpSixaXIAdO2DXJenhTlXP/VoQ7VRHeJIt1XMi1nreZdLCF2L0fxr4vKsgr9+gXh5IoMiJu5zgKIgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=LGfBwdWd; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="LGfBwdWd"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30A011570;
	Mon, 28 Sep 2026 01:38:08 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 474163F86F;
	Mon, 28 Sep 2026 01:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790584691; bh=w0pjlC9s2ArhYjQY1ae0MzGnNdrjLVGIM+GY+diDyYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LGfBwdWdd4BK9b9ZKua51uLgASRtHck2xx2qZ3pOBeN7oSUS2hPM7X9B7akmdo6Jj
	 759Ti9E7kSVVuXbAvtq/m8JZpdU2ONuY4llhKT18v/phPVM5KLnbVlcJDRin/CCeE/
	 OtxvkP+PN/F+91foYbOxKyoUDqzwB50Lhm1B26JI=
Date: Mon, 28 Sep 2026 09:38:09 +0100
From: Leo Yan <leo.yan@arm.com>
To: yingchao deng <dengyingchao@kylinsec.com.cn>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	qinyungao@kylinsec.com.cn
Subject: Re: [PATCH v2 1/1] coresight: syscfg: fix deadlock on device
 registration failure
Message-ID: <20260928083809.GC14479@e132581.arm.com>
References: <B16F90D29FAA2B3E+20260914074524.1694-1-dengyingchao@kylinsec.com.cn>
 <6CC680FFAC60931F+20260914074900.1711-1-dengyingchao@kylinsec.com.cn>
 <20260924162404.GN200420@e132581.arm.com>
 <E6F9385348472E5C+1794efa3-5320-412a-ae81-cfcc4969b76a@kylinsec.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E6F9385348472E5C+1794efa3-5320-412a-ae81-cfcc4969b76a@kylinsec.com.cn>

On Fri, Sep 25, 2026 at 10:40:22AM +0800, yingchao deng wrote:

[...]

> > @Yingchao, do you mind to work out a formal patch for this?

> Happy to. I'll send the patch.

Thanks!
