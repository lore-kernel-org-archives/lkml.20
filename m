Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E26E74AA025
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789562480; cv=none; b=CGcI+/G6KHmb63Dg50U5JEzzqFgzyl1urmq+Mg39IGjfCPL/aCIaD+gpHPcy1svqpnWtXlGm9HZMX1U4i50Yv/YmQ70OqqJrYEXUd8bsBQoX67iBkBlBJLVu5HaFHYC0qzAtCQvVVoSJq1t5MvUQhuOwokD6vbPJ07e+uslUTFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789562480; c=relaxed/simple;
	bh=v4OJfGQjqupmOUYCTEvQPXvqsjM3S1VpbBPgTe+MS2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HBiaG8NuLEhS3jp1m28Qwn3fO1vhLGKVc0duwOE+0GCeGieKIap4Bru1zlYwC8wAtnM+UEntQa/2ZTZFA6ZCsTlym4XJP9KVQadwqHkoyW+qQM+eQHevd+MP0ZWvI0X2PQi3JSPmhqbijhMrsngvY1MPl/VKOLQo31QWNUHRrHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=juSpMVmG; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="juSpMVmG"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1598A152B;
	Wed, 16 Sep 2026 05:41:13 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 485FE3F7B4;
	Wed, 16 Sep 2026 05:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789562476; bh=v4OJfGQjqupmOUYCTEvQPXvqsjM3S1VpbBPgTe+MS2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=juSpMVmGrCyFLSdSExxYQzmfcyT72dlluiB43U6iMgge4d/aNTmEnNYnetZ33U8I1
	 THD36wvoiMYT8nAipLzpef9IOYYHEMHmd46CQEOELR0IzVbXNkBMQYw6ENt+TW1Cq4
	 MAeQKTgKmhnkifiFQEa2K6kH3RqTLhrlJmJc78pE=
Date: Wed, 16 Sep 2026 13:41:12 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Zeng Heng <zengheng@huaweicloud.com>
Cc: anshuman.khandual@arm.com, gshan@redhat.com, will@kernel.org,
	suzuki.poulose@arm.com, zengheng4@huawei.com,
	linux-kernel@vger.kernel.org, wangkefeng.wang@huawei.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: io: Reject non-user protection in
 ioremap_prot()
Message-ID: <aqqOaMcEtuON9Vw8@arm.com>
References: <20260911015859.71164-1-zengheng@huaweicloud.com>
 <aqqM_NoRRePxXzOO@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqqM_NoRRePxXzOO@arm.com>

On Wed, Sep 16, 2026 at 01:35:12PM +0100, Catalin Marinas wrote:
> It would be good to get Sashiko's finding sorted out as well
> (pre-existing issue). I reckon that should go in the core code.

Ah, that's getting fixed already:

https://lore.kernel.org/all/e06e28a46c2a176238f03b5740df0913e57c2861.1788842306.git.rakukuip@gmail.com/

-- 
Catalin
