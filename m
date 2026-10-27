Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793107710;
	b=TjCyfjx4KDMkOsoDR7CVZiQSD3nzW79y9Qj55i0q66uAPW5X5uh4FCECcBeFpi5dWDm8
	 BagYBzOf9UPydBEdzQJOEDDp7Jj35GpD4Znw5pnWv4fyldnhfdq+xrQ6DULI/vfKSIgTt
	 fGH19wTmEhtM77hkmixJxEUWK1q+cHTWHh2w3ejE0Mi5KLPoxw1bC1nfamcuyFjxGytrV
	 nYCYBk/JXKoLJKZ8jOSAyEEi4nPeVKFUyz5rRgVpL2DZYNGYhOCBerCoZry4f5ilRrBc4
	 8iwZT7dCGNwkWm3527eSNB8kBfqUsdGibRpY/dDd1Ibt6Wcn7zNR5Tt2QLiqstR5l4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793107710;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=/LmQHCswd8SfIeeqDopTMeOWKOyvGpThjlAJzBDjBj8=;
	b=dtl4cTbJsPGxkgA05kdaKrpV2y0IoC9dbIJ7fYgx6a4lLSD4MQDcCdBW6PMQo40Fh5qk
	 cvxK7zr3MyVyULklYJVC0plPsyyXzrYN9fbnx6S2BlXAW0mBYLu4Xd8c4K3ahzuNkJWdn
	 TQfxEqwvCvvbjVhaFoKQIUiZqZkCTEtQvkNFUWNUkie+K7laQcfe+uiPP01hbnq8hO1su
	 hXhKsl1T0Y6JpfwSBA2GCpLaXZRTR9ZTB/XDE5yPyG/W9ho6VxSYg6APBy5MaoU0Z07wH
	 fTuP0UZiEb0rzCvRe7KqBvRB/d1BvhYm7/Il47WxlMSY6GHgdm4JfRV9NucvlZZXlJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HnYSOYnP;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B5D606A320
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04B5D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HnYSOYnP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793107710; x=1824643710;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QSmYqMUwrdiGhBYnC3D3j5Sn+FvYFhvblMJneOyMsyk=;
  b=HnYSOYnPchw+gi4Gd97I8XY/e6aYNEFuL+iEgwSMI0/rOEa0mrEKvsIU
   DP6TbImak1bXl1eqhkSIrrdIeQcBqfzPG+hOYpD/u+sY+ox5X4zMZ0svY
   Y/F4/rideHr3IICH2lQ1EVZXXAQyt+/XQAI1XB897g23frualA/2E4huI
   EsOvCdR1v/k/N/qqWSuV+zW01YqJkuR2GmBaI53IJBzXYDbxhsgvhA7o7
   8qR6KqCMBWZYVgbRy888gHc2/QmSnAuXiN3keMlIvBPv9Y90D6RHBjy6C
   Frw9x9yV0Ylepe+RpQs2BuarGu4xmOPlxOpKAwfMCAGRdTL/f26bEwrYE
   A==;
X-CSE-ConnectionGUID: E1bMi81AR52nqoKdHaA+Kg==
X-CSE-MsgGUID: 26N83fhbQtSwNpTkEbMYDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1818614"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1818614"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 06:28:29 -0700
X-CSE-ConnectionGUID: i7b1Vzy2RHWeRyJSFHrysQ==
X-CSE-MsgGUID: OaJPxecrSYi3WX3z5GRmsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4940576"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 06:28:29 -0700
Received: from [10.144.160.194] (unknown [10.144.160.194])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 9ED6120B8CD1;
	Tue, 27 Oct 2026 06:28:28 -0700 (PDT)
Message-ID: <0836c005-2690-4b76-adad-2a7a708a4e18@linux.intel.com>
Date: Tue, 27 Oct 2026 06:28:25 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] async: Use ktime_us_delta() for debug timings
To: zhoumin <teczm@foxmail.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>
References: <tencent_58D610F93574D60C9AE734253AF69A528506@qq.com>
Content-Language: en-US
From: Arjan van de Ven <arjan@linux.intel.com>
In-Reply-To: <tencent_58D610F93574D60C9AE734253AF69A528506@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/27/2026 5:01 AM, zhoumin wrote:
> Replace microseconds_since() with ktime_us_delta() for accurate
> microsecond timings.

Hi,


while there is clearly nothing wrong with the change and it is a slight 
cleanup (so "Reviewed-by:  Arjan van de Ven <arjan@linux.intel.com> "), I'm

less convinced this is reaching to the level that this change is worth 
the churn in this era of mass AI originated changes that are fixing 
actual bugs.

Obviously I'm totally fine either way and will let Andrew decide in the 
end ;-)



> base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
