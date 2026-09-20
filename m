Received: from mta0.migadu.com (out-51.mta0.migadu.com [91.218.175.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2160743BDC5
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 12:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789907712; cv=none; b=Dl2Yt1hsNDIjW46WyNqt7L5N2uJ2Smiy/GMQ//IzYEALvkftDPl46/BHB8afueWaLJO3U7Qbo8T8td2+UYSc3NOjVkjLTaGdNyBXAP0yRRtGEFOqB6fPZ6TL7tQcoXNFKdpFAk1+YPamTJvADGSkNWIrQY1nVPKvjmpGFpGzoPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789907712; c=relaxed/simple;
	bh=sdNk5ihNH2e62rxLPJrJeu8kriaPZjukMTNXWfJ6eB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WChd1LpPR9V6oo/luoz6RrGMG6RhhZg6lCa+giNNNqFdatG/hWwJ+tnfQcPhN48D1s+pnSQzht9jCbXo+8h4vxeRWdu0g7/42wjdh/mr5feXIa1qiNmC0l6x01K73U6pW3W0eRfbGUOmScIihCJ56Eec9eM1kP7P1FM447uoRIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XaAV6Fw5; arc=none smtp.client-ip=91.218.175.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XaAV6Fw5"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=sdNk5ihNH2e62rxLPJrJeu8kriaPZjukMTNXWfJ6eB8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789907693; v=1; x=1790512493;
 b=XaAV6Fw5xRx9xSLTC/tHHGWs5gPs+wRZbCC5dvevsE2mMbPibZQ0GAJkNOfUtBuwkKshuyDa
 G4qbt8+w1B4gNRE4uCDCNhSdInfWaa+c+OW/bSHvpFhpqLo5BeIHL7tm3FR2TEyQlzGbXTX56wv
 ko/MRAde9HZXgU9+jleslAEw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cbc0d603ec100e35;
	Sun, 20 Sep 2026 12:34:53 +0000
X-Mizu-Trace-ID: cbc0d603ec100e35
X-Migadu-Flow: FLOW_OUT
Message-ID: <e0c63f91-4d33-469e-a584-f97fdf8c3cc5@linux.dev>
Date: Sun, 20 Sep 2026 20:34:48 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/damon/api: remove unused NR_DAMOS_* enumerators
To: SJ Park <sj@kernel.org>
Cc: damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org
References: <20260920100029.46849-1-sj@kernel.org>
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20260920100029.46849-1-sj@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/20/26 6:00 PM, SJ Park wrote:
> On Sun, 20 Sep 2026 09:20:28 +0800 Zenghui Yu <zenghui.yu@linux.dev> wrote:
> 
> > From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
> >
> > NR_DAMOS_ACTIONS, NR_DAMOS_QUOTA_GOAL_METRICS, and NR_DAMOS_WMARK_METRICS
> 
> More than 72 columns.

I learnt from submitting-patches.rst that

  - The body of the explanation, line wrapped at 75 columns, which will
    be copied to the permanent changelog to describe this patch.

But I'm also fine with the 72 columns rule for damon patches (or for mm
patches?).

> > are not referenced by any code.  Remove them.
> >
> > They can be reintroduced if a real user comes up.
> >
> > Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
> 
> Other than the above too trivial thing,
> 
> Reviewed-by: SJ Park <sj@kernel.org>

Thanks!

Zenghui
