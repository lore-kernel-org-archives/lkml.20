Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009E75187CC
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789749733; cv=none; b=jq7aJRjOQ0R/kqg099OGQ7wZUE1ezCFdaLg8wsu5m1HnOKSg5wJxYyiDWILBWJUt7OpGZNLpYDG4o57x9Tu1JovyuOhkehpqj7LgQ+dBnBeBcsoeTDhROS8zhMk2gT3TWdWGsmI8AXSCsj17uyz5FqIYD8gwysR4XImLNqrNwwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789749733; c=relaxed/simple;
	bh=3KorKheeKvtYVwTky0+oTyb5SuRMvBm69brSHGQbwj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H7UnRBS29JPta3VWs+kT0EpPBztRoY5R0eNtZo4pYJSBPfpz5R/Hc8rLvGwZPjtLxPW9VEFI1bfRonYwrIM+/JMUnpJm1TrVFxXlfcq8/pxDghz/sQNKEVO/Nc7z2++d6pwTnK6QgL4WjwW+7ac7dFGuut9gP/QdGpYfefee1ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=SF/nOUAm; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="SF/nOUAm"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93a0299c787so73583285a.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789749718; x=1790354518; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Umk/S3wlCI5JlgRsrkI0MpvZKU0Mb4rhS9gQVMO1YuM=;
        b=SF/nOUAmCQhtYUgeVSxbZ8q/CWtPORfsakGcRypM1Q8Y13qIbJCmS/wp8KpVaI7WPF
         CyJcY4VSpmoCTrrbCcWheVlHHXeWQ4xGOrvMAj9ouOeeI9uK3XncC8z5DqLHBDHcdy8h
         gLu1BmOTh6LsFW8dqPc/MtVDgkE359KHeThRo/l6Zs0bjn8vO8ZlqOP/X0PEtjk8QC9U
         4K7KoB5XHhmQ9qEvGVXN8kAs+4+fSrczq9CEst7SK5rlNmBb2Uv4hoxMd2BKZk85S4wb
         b/6XqLj1p7hqPyP9EI2ss5OkVDXdIW7xW6Tp7VQxeXjZXV6jnVacDStoU2auXcOFLJVD
         hxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789749718; x=1790354518;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Umk/S3wlCI5JlgRsrkI0MpvZKU0Mb4rhS9gQVMO1YuM=;
        b=pir55WBWFokKrUN+K5FWvv38Tg3wtNM1qhmvWyP/izk6XDh1XLZBFSUxtWPDS4SROT
         5unfclN+rMZy3okWRa6nqDI5bYmFryfDdrNIV7cVSWhldwWPtiayt5b1ktBrHZMdHVKB
         uVK0JUGPu0kPRs44MPemdUJRUv2QJ2+YUx0PdTD0pv3UOYl25mgAlRaRNUDaDGG2UP0Z
         A04uIHPCi99l90OH5+6mwQkaCzYRgGo0+gfFS+D65e2wol4ODD4b+N/cDrG8Zxfxb89U
         V8O0Lhv8mW8yZUkl4zJtWLXfCftGiFnqlFxKHtbSYjxiNPqqiBYtAaAeItJg+NzbMSxd
         Ov/g==
X-Gm-Message-State: AFuF++lCMQcwLYZxB2rMnGTwye0BxYs497FZBFMmXMhxWUOfa906J8GB
	KLGwDA8vMC0tvVwHCb2NeDc3IjNeQq4R7oH9VbS1yMX1pL8eROfH2Zxtkrs0E8Af8pk=
X-Gm-Gg: AYBFou33e5LwPpPP2nBn/2sg1pCDjbcp8CRpk47iToJxbuJCjmUjGkEHGsCDoITwy4+
	35LIm3NN+YgvJpw+Y7Oj3zB2Ijx6ugVTbodE8D4sLJDnNyWiuwBhApkWquJ5rkrasWQ+qcG/Lyk
	9Hp9C5xX8dBY8wC5vtDgdRN58yYb0JAa3MfH4ySFymgOj4oZigJNFWg0Fyq2DDa/yxGyPnIq3YF
	aq41Vhi4cYACCAJ76LryS2g51GcEvnbPOSkMr5gJcBIIEDym7XtYIAGR7z78fCoHKtTDu+1fJ1I
	oJSFUIS74vrXYCh7tU4KO1ZLp5aVrwCSvuHDlpAjBD7HeXM22Z67QTOXseYBBq//i6foMbIsVgx
	thAXWb2e+xjDiVDhDJZ53N3rOFxuID+HWRA6BMUOrVb+dQwm4YtYN8cyN57AdomeNaCpCBxrY3U
	g01FeJLys+VBR8brX/rYzeOoufMQMRZ7GOlMfh/Y2zqAH1zzPAPj1ZTb12/h9WmZYdslRwPA1Hu
	xAmhwZAoIhpOPdtxgfbHz2MBUiuVRhCk483KsUmV1fGtIODkIuc1WM=
X-Received: by 2002:a05:620a:d96:b0:939:3571:bb90 with SMTP id af79cd13be357-93bdc6ae669mr459306385a.24.1789749718205;
        Fri, 18 Sep 2026 09:41:58 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93be0f0a202sm179495885a.41.2026.09.18.09.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:41:57 -0700 (PDT)
Date: Fri, 18 Sep 2026 12:41:56 -0400
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, 
	Rakie Kim <rakie.kim@sk.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH 3/3] MAINTAINERS: make Gregory a co-maintainer of MEMORY
 MANAGEMENT - NUMA PLACEMENT
Message-ID: <aq1pO6KRR2CMov8D@gourry-fedora-PF4VCD3F>
References: <20260918-maintainers-mempolicy-v1-0-9a94cac6d135@kernel.org>
 <20260918-maintainers-mempolicy-v1-3-9a94cac6d135@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-maintainers-mempolicy-v1-3-9a94cac6d135@kernel.org>

On Fri, Sep 18, 2026 at 06:34:26PM +0200, David Hildenbrand (Arm) wrote:
> Gregory is extremely familiar with NUMA placement handling and volunteer
> to help co-maintain the numa placement bits. So add him as a
> co-maintainer.
> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Acked-by: Gregory Price (Meta) <gourry@gourry.net>

going to take me a second to get used to that.

~Gregory

