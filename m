Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADC2379EEF
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 16:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790439604; cv=none; b=N/bUpzZNESCkX8QQKbdmONT49V1X5HDKHzs+pqJcEPqiV7nOorR1b/pJaYMGvrcrKPU/fu8zs0lYk+6PPiNFTJFosaTPxj8B3FVWaTooiO/wMviMATVimXPYwgF9rJa5S09zMuVcbDl0xz/CNS8bFaZvVDuBFWQ1+eVNfwc1gPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790439604; c=relaxed/simple;
	bh=TDq8I4yszb2l3Y4cpjONSWEFsN+qtzRX8w0fWiheeE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FOrpRcqGjesGR5T3oS3EreejQUekw15ZRYHEdpCSxbQajWE0DKCOH0ADVEJOVZi6np0HZxO1DhYSRfZgoNNKdbx9Y98ZlKO/PSkazJMjJptMua0qhlkmPDEV7otG7MG+zBTST0HL+3We+tPcH/c3SqEFVf6kWEVf8OzkEH9S8cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NmQmManh; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmQmManh"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ff23af865so13014005e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790439597; x=1791044397; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eRtKYg0sOGgBmCELm1fPJpD8C1O0ubIGfHJNiovVGiE=;
        b=NmQmManhs/8xRqD/e+N2PCa4WK790hMKFGRMWV5EL1lqy8gPSwy1oRP6z+i+BFORGs
         r1vW2oZxS/IaSpLKItgGQKWOLJ3M7CrQ+OIkPuETATzKqBKNXhKX85A0jcIJdEa/hpKE
         MAPRPFrKaoohTtN/XcefqcM0bYpITG76bcya4Nw8wWtlnCClkjB15VpDmhU3TCJJzmuR
         hp+udJu4Od+BzJ2z8NNdAGA+O4OACDxB0BqKToWA+1hiO5a3VXBDkaGaMjT7m431HnWf
         nnX/2UWZPryNhIFsbh6yov++iN42LlZt5UtjufrZXOhfvo8ewypwi3sgNn8kTlC17dSX
         0Ajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790439597; x=1791044397;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eRtKYg0sOGgBmCELm1fPJpD8C1O0ubIGfHJNiovVGiE=;
        b=xByaHeqqQvgTwG18B7f9of+mWGjv63OM+xIY27hNne8BuYPuA+Ewyj22DnNhbsmKno
         DQ7pB806+WXIC7lg2N3RyYriMlwHk7xGjCsiQa8W7ywaipxw3QzduBVQ4069sH3RJPkP
         CPNLaxX6IuEpRhRkpyWEOa9ytIeEhKHXXsqiNn7OnK28LJUky61BXTmKdqoqSaJZLcEL
         cL5R8oRAXa3vDe/BaQpK+V00JdWzuE9sCbbN0zXGR6Ge4NT1Eh4SyJ0L/ChqKuEKuuHa
         AV1qEeurQU0M4uTV4mbD1l1kB0b3KF6hyfeNlAcxWkbN/iD8gpOSpxL/+g0Pmk5sg7Nk
         wJxw==
X-Forwarded-Encrypted: i=1; AKwUvBwNRbLaf+Gnj5/4Kt3amccGDC5BHryxszs9MKM9mr/6EpS73nxp/o1c0makvW2Gxqrc9Dj6zYiQ11ZEEgo=@vger.kernel.org
X-Gm-Message-State: AFuF++nBeQZ3XVogDy/qE47iIGX3X8ffwB2h1iPmZq9/xNI2FL6WiG7p
	ve0+APczt2EKOmwg1ISvsTXOY9dmau8+M61OTCnV6LhdxDxBUTT3Y/Mc
X-Gm-Gg: AYBFou0iY9oc5sNwuAP1zrsK2sGhqqV6o6buXwMd85fxbAqDQbGG0oH8j5M5poa3gWk
	X1lfjV6xoFD2sX4OArBTeizv//4nkYMzi45xIwx5Vztkobzl4YsEG7sYDdsm3nyC1/yrEdIiJXb
	pVc7Ly1I3WgtqE3iYAwhA5k9SrXZKU2qk7go7WDgVObojhi8Xv9vIkxzUMcp3U0mW4IFTK/9IyY
	01WH5uV2Zi8sygv3cCBZ4NxOzuEyATCDUlpjXx3P1slXC1b9wwCxeFtMDiqPMteAM9UAHQdt1dT
	5ckbv/wJIP9ZoKeMqB1RwZHQCkvExTCoRbJ8mA3Eq3f3Mj1hFmbI+3T78VMpFGeGeQEKL8DPVBB
	UMYyfJFjG2FMwXySerZTslJBAstBeqTh8GbgXMU8ucQFPfmOrIQ8SJ73wPW1Z5GAjXDWcajAlM9
	vaNUY7dotNuPr0TMKPOQQ75IpzjRH5/RrMOaeYXTrWxw0/PjnRoBE4uWNrIwDUWVI8+L9FXnTXL
	SKhb/+oqh52tXuIHMmTHKAMDz5aGCC5yfL2N53w82KTvdMHB+Y5QyRgySuISOceT3pT4fxAtj4Z
	KcefDHura6IsT75y5/2n9peJ02xLTHmaP4v+RMNoFbChvgwBqSJIE83htwj9Cz2KuhgOKL1rVoh
	klwdw
X-Received: by 2002:a05:600c:4703:b0:49c:fc6e:a3e1 with SMTP id 5b1f17b1804b1-49fe66fd374mr152026325e9.32.1790439597094;
        Sat, 26 Sep 2026 09:19:57 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b162-c701-4960-a998-3de8-2fce.310.pool.telefonica.de. [2a02:3100:b162:c701:4960:a998:3de8:2fce])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef60da94sm102924275e9.4.2026.09.26.09.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 09:19:56 -0700 (PDT)
Date: Sat, 26 Sep 2026 18:19:54 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Muchun Song <muchun.song@linux.dev>
Cc: Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: mm: align hugetlb mappings to the huge page size
Message-ID: <arfwK6XInu-S9COc@gmail.com>
References: <20260901085740.66283-1-kmehltretter@gmail.com>
 <5AB6FE85-4CB9-41EF-A700-BC5E071F29F5@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5AB6FE85-4CB9-41EF-A700-BC5E071F29F5@linux.dev>

On Thu, Sep 24, 2026 at 04:41:30PM +0100, Muchun Song wrote:
> > Fixes: 7bd3f1e1a9ae ("mm: make hugetlb mappings go through mm_get_unmapped_area_vmflags")
> > Cc: stable@vger.kernel.org
> > Assisted-by: LLM
> > Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> 
> Besides 32-bit Arm, the same regression appears to affect MIPS and
> SuperH: both support HugeTLB and provide custom arch_get_unmapped_area*()
> implementations that only enforce cache-colouring alignment, not the
> hstate’s huge-page alignment.
> 
> Acked-by: Muchun Song <muchun.song@linux.dev>

Hi Muchun,

Thanks for the ack. I've now submitted the patch to Russell's
patch tracker:

https://www.armlinux.org.uk/developer/patches/viewpatch.php?id=9524/1

I'll also take a look at the MIPS and SuperH cases you mentioned.

Karl
