Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E28524B1D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 20:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789762850; cv=none; b=rY3ht4QQzdAlk3lmGKk42gVMDN7LQAgcKsuUMqDngFksa3P34d87BvDgZzOpiGZzdXUNOUAykwIaXX5tCkCTkmM+gP8vZZOlMfjUcJMIob1bks8qoneAHgGhKOxVAryeK2UIHriDf5s3xOnO9nO9tgDXJrEq8qp3sDslx8d2JiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789762850; c=relaxed/simple;
	bh=nu8qU1YZwp97dnkL+bX+96A8g+p6R7Z6RfF1S27tVbI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NTkt0tVSq5pNGTDBtP2n1GKDYPrqFHqDEA2sT9sXDk3VevOw7VRqYXhNCBZqtCCQhvMGzlug6S7yCc3FmUXWpZPi0MVt8dK1R/XjZsDvmc/bUgrfkwWqKzzotQhiTXd1zj9wEqJWhCvhHRwbwkia1XJuTYjzavlvj0FOnR4o+2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GDtvkj0c; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GDtvkj0c"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d8facae850so23885ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789762848; x=1790367648; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PKHYiIXSy/sUkOC1RnRyCN5D48PNPtcysE7SZpaqPCg=;
        b=GDtvkj0ctido5RDXvBBl6jYZ1YS3JEwQ5Qm3tRX11VHF9QSF7XXSUT/+NyFrAGZ4zf
         TzkRHqTQ94l+0PuBPKcJ23LVdoR2ujrxi4WRZOj/jcdRSffyzAxG5MA79fmMyHGQFV16
         Nb+5SN4VKFWyILzKFzvg/oXcU1r5LhP9lp8KKOdZfOA/c5G7+9BZrrtKgqGKGMAg/TDC
         QPxiO5+usNxVRLEo2c9Ger6ResXtjGkoXsBCFvVwXBBw2m6483+5n2We7bVOgp+qWwYv
         W1bC0xtC+mZ7ZNi4SiRr1vgVPxK45lhf7F7462lDm4FIe8cyG1ghEn6UYUDHqe2Tq2wL
         gjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789762848; x=1790367648;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PKHYiIXSy/sUkOC1RnRyCN5D48PNPtcysE7SZpaqPCg=;
        b=FlTkwTVy1E8CAgIajJY5woqWntJ66968RmRGWs2ekLGGpLR+4lKl9zfrl0MUiju69n
         42IFMVvuq7SIdshsD3QuCJoDUKOthO/eyDL9IMhggnhuiDht44GIAiv/43s43ODSkB9t
         lxM/T3Yrx8zA53kI+tb+WA9jgwU+LMSLAxsbnzN7m0oqWljbUw9jT+kGbZ4aZg3KOe9X
         9oEl9bBvgbOGn8QO3g25zu4l1E8yB/0uZZXfrBEje5wcPRP9LTm1EjTjDoTnPwjwRZfu
         yhCHFm1nm+6Zbsxf0+0cdFiYffjbXTMAz6/Cf7DWludqnOiJ/Nxm4072MTkv0VE8iBNf
         I/pA==
X-Forwarded-Encrypted: i=1; AKwUvByFXAnf2ucMXuU5nFAh5wxNmfjZe4kshas5/lzR/NDLbyYhaFP6O+X5OWhaK/2GoOls8hmbWoi8zeq3W8Y=@vger.kernel.org
X-Gm-Message-State: AFuF++ln+eBSpGRl16hUmqLsAvGC+2I8JQeFU4V3qzhVDhzvcTJaZvhJ
	wgFfvF1B0DB0dMeR22saeaR7CYgFd0TFb4PpEVBpvZ8mBWvj/bgWe2U/74NoliVv2g==
X-Gm-Gg: AYBFou23lUELpcHQKrW/pRCi+Qif3Acx2ziAM9bRxH+HhRIEi0CUirzioVNAijcnREO
	kwJqMCf6RwVDlQSNF77lQKeVUGWjYgfoHgSYccRsJjbE/UwtgAtRXonD9EWO38rajGllugLBtN/
	e5aTWSIQAJYn9A3wWG0B5paqdl3s12qoOjW+O1GayUCQKcSKzpCqOxbvnacZlTKS8u0hSDLTXNw
	LvCjGAi7vG/m1OjI9yWsp2k3MtuOhFxy9KfN6LqZXtotGYar/GBM0HSZVIBiDmgpBkjbp4Y1K3T
	4Vj2Lt10SPGFaIT0gNXL9soKwh5Rr7d99ps4hDGYcHVp4rJ3wutydE7X7jXO46vPeKw8HF+gxAD
	cpsbhk12yBtyTr8EF0d/7oziPHdn5pk5/e3iBkrVMbWysLRYKHqpdzy7sHXrp9hEwCpgiInPfAx
	tjXzD4AIIzd3rspDPDkS6L+O7jYscfreNC2UQAuW7VjgrgKb1zaQgnO+GWP5EXKPvTgHE2ntJMa
	l1+8AiCZYt0ixVeiRNhCh+qIAq437FVmi1duUoa9mop5A35HOGLKugOQbPlv/6G3AzXdTWkismA
	oYexQtM5CBI38zY7H5wioq4+hSSiEbpKlxOFj30KLV9QYNCXVNPR1Aj+VSuYNEXM6ujNQOo32+q
	7KjPnsg0=
X-Received: by 2002:a17:902:f610:b0:2d5:c090:3810 with SMTP id d9443c01a7336-2ddc165e533mr2194815ad.2.1789762847953;
        Fri, 18 Sep 2026 13:20:47 -0700 (PDT)
Received: from [2a00:79e0:2eb4:9:9a8c:9370:b2fc:a09a] ([2a00:79e0:2eb4:9:9a8c:9370:b2fc:a09a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c6dd585sm947935a91.0.2026.09.18.13.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 13:20:46 -0700 (PDT)
Date: Fri, 18 Sep 2026 13:20:45 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
    Christoph Lameter <cl@gentwo.org>, Vlastimil Babka <vbabka@kernel.org>, 
    Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-mm@kvack.org, 
    linux-kernel@vger.kernel.org, Sarthak Sharma <sarthak.sharma@arm.com>
Subject: Re: [patch v3] mm: test_vmstat: add synthetic benchmark for vm
 stats
In-Reply-To: <20260911223728.dfceedb4135e0b758df0ddd6@linux-foundation.org>
Message-ID: <1e628c9c-47de-1552-7a04-11a1c6c46e60@google.com>
References: <014ef68b-6312-bcdc-f432-34c31476fe77@google.com> <20260911223728.dfceedb4135e0b758df0ddd6@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 11 Sep 2026, Andrew Morton wrote:

> > Add a synthetic benchmark that can be used to measure performance of VM
> > statistics.  This is used to analyze any improvements or regressions in
> > functions that are frequently used in hot code paths.
> > 
> > The test is run by KUnit or doing modprobe vmstat_kunit directly.
> 
> Can you please quote some typical kernel output in the changelog?  That
> will help others to review the proposed change.
> 

Ack, will include the output in v4.

> Sashiko made what appear to be some good points:
> 	https://sashiko.dev/#/patchset/014ef68b-6312-bcdc-f432-34c31476fe77@google.com
> 

Got it, I'll use NR_MLOCK instead of SLABS_SCANNED since it's display only 
and won't have any side effects at runtime.

Instead of switching the type of the "rem" variable as suggested, we can 
just remove it entirely.
