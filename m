Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794222333;
	b=pd9ymCYJj0EDay7heX9ZF/6x4h1At4GE+FB9l0tfNju2NX5vSxvWxCZY6nE7ew7S6OSM
	 noShdVpdDhGbi+gbOUpuH8seNXOMEoy2OXw5QLGn+97TKpJd9PeVVDmhtcWnyq1jeEuoz
	 SFVVgXrlKx/vxsNoeEYbvVYIvtsNPlVMOwGl5QVJc3gYgsWGN3eNUt9LGHaYNAQkQawd3
	 GAocnJSgRh7VdLCCOYJH6vwKVq+4eDnlVAmEPq9Zr2TaJPduZjajoKYYklmho0llKoHFs
	 nznLSaT5zKilJ7ekOV8XgnRS7tXP6IOHuJAxQSHxmZM6bwDXgYbrS2OlKECgP2O0/xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222333;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=pGfi9v5V/oJczcC3ecixk+4GDq/8SmE7CH0lyXFHMik=;
	b=Y7efz11kjPd+q3Cz8Iy8TDxZbWyDTzAAwRq14U+0ULgVEI/k+d0DQcTmPooOrHG8S6uw
	 VzAH2PCmrtOANU8QvLP4iDn6Scj+46uOKgT9mkIi1gOXy9X1mYL/Z7xAT2osQ3o8WummL
	 LWKEbgQcsKdqpje+NP6HXu8cbAvEc+rxQiJ1n9oyVsAtOGlHarDN1G7/2h0it2ZBusf7Y
	 bVL8ZOS0xEpHzRivst4NF+k6cxWecHc/k7C0aD0VuZim9tcGzdc+HAImy72d481JDmqYn
	 8pSYBziqCH1KZbLf9M7Pve7eu/j8WTTUs4FcGFF20u5sNJ3schgFs7bZxb5NspwuAqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CQfQnGmc;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B81606A330;
	Mon,  9 Nov 2026 11:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5B81606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CQfQnGmc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794222333; x=1825758333;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rbVyfS29jvJ1BszuMyCAnfTyQXJf8xIcluwSq0SMi6s=;
  b=CQfQnGmcqWw0ukXYWQPHeedfqYs7BmaBKFDBWXVnWHSGIcXvgOHSr2/2
   qBohfiKfYvpkdjt5whGORUlJTjuvc7Mo6NhnkfL8KFhiHQxfWn7sL7Eze
   kV6m+nyaPNCIH246Wb17ELgN7D01zd5hmsRUCsVRzILv/Pr1RdEdoz5Gi
   C/KRAZxjbz7f+llGwLSrHjgaKkcUBKxgGcuQjVGmbKJtSLpCbsbk8KsBh
   jgmsjaGxtGsqK5UWfsN47LY47ffg4hqd0NSrhTFkR9GLKzM7sCC/J/Hwk
   QsehpHmHJ8cMetdksrZYNaw5syalZIA+PMkAEVSHlx+5Z+Ven5Sn1hjMr
   g==;
X-CSE-ConnectionGUID: 26vdCLqWSDatdMi1mBCe6w==
X-CSE-MsgGUID: armrLSBBSsOCSgSgU6FhuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="3042507"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="3042507"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 03:05:29 -0800
X-CSE-ConnectionGUID: 5ipdnXo8SFCiyvSYoI8Jtw==
X-CSE-MsgGUID: K2rPomrISkiv48WDrQ31nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7887928"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 09 Nov 2026 03:05:28 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 5226A99; Mon, 09 Nov 2026 12:05:26 +0100 (CET)
Date: Mon, 9 Nov 2026 12:05:26 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Sven Peter <sven@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Drop the DP tunnel activation callback data
Message-ID: <20261109110526.GP176724@black.igk.intel.com>
References: <20261107-b4-tbt-callback-v1-1-5ade9391461d@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261107-b4-tbt-callback-v1-1-5ade9391461d@kernel.org>

Hi,

On Sat, Nov 07, 2026 at 05:57:06PM +0100, Sven Peter wrote:
> The callback data is always the domain the tunnel belongs to which the
> callback can just take from the tunnel itself.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>

Applied to thunderbolt.git/next, thanks!
