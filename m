Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795038;
	b=jt4PO/P4lg1p/TprckJ2+WLX49rXLwEK6/6iaMIPpC3lRzOPv2CwyJBL7OiY4ptr8PiJ
	 v+t4i2YyRJym1KK9umUmpXMw8agH71GZ0GOxX6cLnZlpWHJu96kE1o9N5nz4oi5PDZvHd
	 BG2kiuZ7Q+cBSjWd/mXMG44KrJDp92o0DMbzI9Vu7E+nfHIw1BmQmjlWq9iydOZMNOshx
	 QZATxYdGd92bU989ErO8qR0MtwVsEopbP0LD7DdVSc/vzaWQuhHfKgcjolXGDPCqZosNL
	 y5q2swTZCM4iVz+GyTiqp49puNFu1WLpCMIZJDIHiMzWhb3fFB4yss0CCBtkqtfDl1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795038;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Za+88lM2oxtjmrakYQ+1cqIpKaHb38fBg5z8c40LFio=;
	b=tMn8htMw83otk9osZGZ+DAwLKBvk5OCG8GQkM+1Vn08YX/X0+ijG2if37Gfy+NUHWpjE
	 NU4vHrMfJus0UZBWDJucrGBQuGZwxHhbJ/I1cadvVvlXWTS1X8EM368THeAPnBf0sU4mW
	 Z7ObSFOTSEQemDS2A3EJ5ibgaY+vLzHCkIZlS6UgFIc9VTce8EAWF65iNik1Qe5qvDdPc
	 OMhr0LfNBKdmXhg3OVjAkoXxDJhn3PZceSs8L0vTNWXGgsdhC28WVOii3UQP8tWh5ZpJF
	 bLZrS/kTzG5wvlbiN3GXlIaK68sdDZgs+/X3EbgOYLqT/vTKezouk1dOovbksC9ZByg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i720krEQ;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C06606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:23:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35C06606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i720krEQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793795038; x=1825331038;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=1BGhszcXd1nd2f/W1asjzyiXIgQ6Y8hOWyfjyF/i5wo=;
  b=i720krEQiSAfIXk+lGR+Qhltid7v2lQjfhlWLHVy/mgyFDCbfbs/woiw
   GfgCex6hPEpDKQs0VuF3WUYNjNrZ3eH//OnoAlUFHoX4jZIfFofqsZUYc
   6UC+EJZxzw91Q/+8PpADyVWPUYXYA2SpZlfDJPy57QeudaEhU4woY5zju
   69vuD6zo23VH4/hVizWndGXtfy+5MWf7jELKhJJlyji7yEd2EgSvx+zQu
   /hGgXaGXXc3t6LX41vKHkPeZFu68nXQbiB3UCaI1sC1Sr4mjXa/ReO5AC
   tPAllUwVZuuwqOU/rzzucUktbzzermXkd23exZ0i5v5T/OzLx9bNFGjuG
   Q==;
X-CSE-ConnectionGUID: /tgvQEAETnaqKeHjSWhnYg==
X-CSE-MsgGUID: TzbBImzqRKK+G3Qd8aZdXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2425499"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2425499"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 04:23:57 -0800
X-CSE-ConnectionGUID: Qwin6OTXTPmwyFEmPMQdlg==
X-CSE-MsgGUID: cyPe5PgjQHejj2+uFyT8eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6532938"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.244.43]) ([10.245.244.43])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 04:23:54 -0800
Message-ID: <5f114662-8c82-4781-9bb1-32e49112fbf4@intel.com>
Date: Wed, 4 Nov 2026 12:23:51 +0000
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
Subject: Re: [PATCH v3 27/33] drm/xe: Add IOVA-based xe_res_cursor variant
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
 <20260711025619.2540575-28-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260711025619.2540575-28-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/07/2026 03:56, Matthew Brost wrote:
> Introduce xe_res_first_iova() to walk a buffer that was DMA mapped using
> the IOVA-based DMA API (dma_iova_try_alloc() and friends). Such a mapping
> is described by a struct dma_iova_state and is a single contiguous IOVA
> range, so the cursor walks it as one segment.
> 
> Add an is_iova flag to struct xe_res_cursor to distinguish this case.
> When set, xe_res_dma() returns the IOVA backing the current position
> (state->addr + cursor offset), xe_res_next() advances within the single
> contiguous segment, and xe_res_is_vram() returns false since IOVA
> mappings never point to same-device VRAM.
> 
> The flag is explicitly cleared in the existing xe_res_first(),
> xe_res_first_sg() and xe_res_first_dma() initializers so stale stack
> values cannot leak into the new path.
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
