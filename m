Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793878060;
	b=iAhydHKbsRBYvpYpcRTZsVhe/aDIgqKZiah+JoR1lBrSK2qAMBkNFs3+FxDLlNj+781z
	 7JfKGZTtMWbg3QsbutYlN7UhST3EveZ7T+CMq0w6T9iHLW7IyckywJxowi1ybwRqmbudZ
	 2fbOgKHOe4BU6gqB1SVkeTYOkJoyWWDgjWVZbPnnSbu0i4hI50eC/gvf2/pPCv7f8ACAo
	 YiNZzQ+mF53Qp+6hdryzJmYxv5MDSyde6NdNVEE7WHOgo6L+zpOZ5jmvgJDPoR9uCd52X
	 6d7+efZgqVZDZEhXSzPktWTaOe0fWoChwlSKyf0AamybYfuAaexU14ypiDutx0gJQYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793878060;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=bnK5mX7X/Bv4JbpxTEg86vZMWxVVdLou1dEAfm3Rohw=;
	b=eH9aug7Ene+GIT9SHHlboNKSCrVpMQ9FGi/cVfjpfWnQo24TGaRK7AeGtrCUyU31UGhm
	 uC+OAhGeFAjyCuLyIhXh7RnHiwOSxm3dowgJTOVNkGxZzXzAfKg7UgVkQkq6034N9LjtE
	 jiPimyOVF1+3xI9eEjnF+dFYx8nLh5LKV8h/rnLm2lEGVUpB8qwWvJj+dl9oIbjQnmZML
	 usyXKUF/qG66YJCTkZ3r6sQrzTtjqRNMMcI3kCGOeXj++NGwxHgxWxghYq21k5VEr6Ks4
	 /Wi4tFS6SCqv+iyNRRypVjsC4komThMREvUWbxu1tSjvL1Hqce0hSOBrq5ObhOZ/HiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L8rGaNpu;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27863606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:27:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27863606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L8rGaNpu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793878059; x=1825414059;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=D4OjcmHrS0QbC9UUT3DILK073eHBKw+YkRSR7R15oDs=;
  b=L8rGaNpuB5a1nABj7OiWlbmn+a0dnOsW8a+uyQGPNLPKVfClVZDIwTOu
   11ny70idCp8QgfG+3XiYlv1QjZCZ+momTPxX1xIntZaCx8WRiMuIxCF9p
   Us2VtBMKls5O/j/XZVEHoFI3bPm7SB5SAVAB2kIV7tPRo+EOe8ffGTkrH
   rvcgImGbkhhyHNP2o5yIsWJjaahdnX4LVPQmyVmU6lHh8MuQtIr7vcTjQ
   wAUyzu4upwJ1S42zpRBgvM0XrZl2Bzeo0XwpEI0cskpEmSPZzdwGTi8L0
   sXbJxvEoiVn0zFmw5lIoZkiYu8YM90BmhBiMWzeMAqIeI9bFOsz7EKVzx
   w==;
X-CSE-ConnectionGUID: bG2yb3KxTpOLxy+0ua5UMg==
X-CSE-MsgGUID: LSVC1FkOTtO6iIClYrFE2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2560943"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2560943"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 03:27:38 -0800
X-CSE-ConnectionGUID: cIpsfU0YTKyQnCv4J0MbOg==
X-CSE-MsgGUID: nf8slcV4SlitA07YKR+Bmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="6861812"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.244.225]) ([10.245.244.225])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 03:27:35 -0800
Message-ID: <c2441394-82ac-4647-a068-be365194596a@intel.com>
Date: Thu, 5 Nov 2026 11:27:32 +0000
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
Subject: Re: [PATCH v3 02/33] drm/ttm/pool: Add ttm_pool_page_order_nodma()
 helper
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Carlos Santa <carlos.santa@intel.com>, Ryan Neph <ryanneph@google.com>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20260711025619.2540575-1-matthew.brost@intel.com>
 <20260711025619.2540575-3-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260711025619.2540575-3-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/07/2026 03:55, Matthew Brost wrote:
> TTM records the allocation order of a multi-order page in page->private at
> allocation time. For pools that do not use dma_alloc the order is stored
> directly, while dma_alloc pools store a struct ttm_pool_dma pointer there
> instead. Drivers that do their own DMA mapping (e.g. Xe) need the per-page
> order to walk a populated ttm_tt one chunk at a time, but cannot rely on
> folio_order(): TTM allocates high-order pages with alloc_pages_node()
> without __GFP_COMP, so they are not compound and folio_order() always
> returns 0.
> 
> Expose ttm_pool_page_order_nodma(), a thin wrapper that returns the order
> recorded in page->private. It is only valid for pages from a pool that does
> not use dma_alloc; whether a TTM device uses dma_alloc is fixed at ttm
> device init time, so callers know from their device configuration that this
> helper applies. Use it from the existing internal ttm_pool_page_order() to
> keep a single source of truth.
> 
> Cc: Carlos Santa <carlos.santa@intel.com>
> Cc: Ryan Neph <ryanneph@google.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Assisted-by: GitHub_Copilot:claude-opus-4.8
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

