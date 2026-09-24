Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9486411FB1
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790234907; cv=none; b=LlCgmQcdb5ds48QygHgTOlOYcF68XDTRCyKK+ExPTKfYFMT+sSaEF1QijQGROZuTx1OEgwYdnlGpkYtPIE2p8BYmdk067s7U98BsNjmlivOcSDFtymQnetxzCO99uR/t0dJWpXMdwC7p+W/AUIgVaOg2/PzhvOisvB4FC8wCzws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790234907; c=relaxed/simple;
	bh=UHQmlCcKV4x98sHxuZMPnjMue+nilcOmstbKCOY2/s4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HfcVUBOmJBhPsXBfNAXxkNBWwWrJyyBAlu6O6r/2iiaI6PRl9y1MN1v4LJQ84JSjH/cH39X+LLoOW0YVfX+H5gqZEnUnvMnvg7Y33HQa02E+h4hHKj/BRnxezj0ySbKY/XV8Ne3MSAu/e1DX6Z7f4Evf5ugGBkSNi8FHMZsi6Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sA0wP/du; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sA0wP/du"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso13549055e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790234904; x=1790839704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c/+VrgP7wAI5ReczvO0a14U1+2AXtmCv/lPUe03W47c=;
        b=sA0wP/durz0cQesUkr/MnRgYtNNSuK3e61R6u2IBpxLP8Lh7KMcPfyH9wkMme7MBeR
         OYeHxze+orE/P/u9qTa1DY5LjaH64n5JpEXFEyDHzEWzcHqiiep7jEg9Y2/Lp66B9F85
         4fc8R2MxU+UxB8kDw6+XnkY3IZGa83Kf7Hw5hD4YZoXU2daDAHjZQnUTef9lw5Wr7lT2
         UqbA6P5Ef1zzrStWlAA5e0vLwGcNv7C4nIPyLbt/T13kjNWN+mA+dXa4QSWqZ/qMnE14
         An2aPctr2+I8BVds8gTAC0C6Lh6+bjVloMQhBXNrx0NOrr62//YC+8BCTogoFH4cdS4r
         gSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790234904; x=1790839704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c/+VrgP7wAI5ReczvO0a14U1+2AXtmCv/lPUe03W47c=;
        b=yJyok0sXd6mK2focVmloSMwWxuMT7TW9Guf6Gh7vL+EXCvEB9NU23SsPXLx0A3fxo4
         5DYdaGTqB1D5qcJrtVs7vpTVtWpCiqwwZYCxTOkR6dQ8QuXb3fRCyO8x+ud9i4oRJ2m7
         vGNUcavNM4JYJw59HBVaCTKKTR3M5/unCMCBLhzrJ1kieYGh8o3pdaw4andq5XCOZcQM
         LchJ9OarOl8wDAjnoU58PNFUzoEHT0ophpAdp2FwIkdEg01lgKVMUdFVgTs0XCjvYJPA
         BJGTGzU9Hrcekbis1bctX36hIjB34/Z4F2Oz1stwNfMLTlf1UDWNCepZasFwC293ptmM
         +lUw==
X-Forwarded-Encrypted: i=1; AKwUvBwRdJO07jA+cKxIPhyMQethRglXuoRgl1uZ4jofL/mQka8nELJDpjfYqcY7gy6lZxvMkOG8e8iqH+P/5tI=@vger.kernel.org
X-Gm-Message-State: AFuF++lZsDkCjD/SpTcTwnFEIuHbw0Sn03ewUcZzvFhVbAeLd6cHPXw5
	cB03uR1b3J7Bsf43tsGnQxsvZzOQyYkn41wHP8IT54htAiyNGbRAjNln
X-Gm-Gg: AYBFou2x2NYVSYU0DvFlS1B0+tHkiv74mI8c5/AXhyNBxdO4dHJMDSO5/WgqzulZJqi
	0O/o2h+Vy6ULpUTBhmLz3kvZNnfsa6ZtR9StcB1XA19aWGolLve/yglcmqEM4M5iA9zjODIwQA1
	c0it41ZnNgIbRIPud16fwbcmlGkHsJOs7zf9RorYCG0NSUaqxLYAzJC2imNnJJ35jrC4xT7wHwG
	/b6Fb5pvkA/rEbqvE0h4zL4BzrMqbgBZ2nX9p8E1GbZUk26bwe7v///UNzzKLsK7saHAr2crm3g
	fa/tSQKwycOlbET9rY76rngh5hh5nWyl5pFLLollrnR56kHRcZ90Ov2c+t+uFdGqzWojjT1Rkvc
	SYmDpZIJyMd5HNH+zqSbM3ikEFoMw39E88OaQFFaFR03K/ZICbmyVZ/G5PAFfN2vpSgkcw/riPf
	cCveJVuJe8pe8TsZXGqj20vTmqZvafAFe3Z2ZvMBjqov6tF/CJ+1rmRiCiannwInnGWNrxHKoKq
	GxPDjYbyfjwQzrht1CeCHBkEkv1b2DkAcByFFxiE7+WcEasQfvAaKjk592gbNCgX+J98yQ=
X-Received: by 2002:a05:600c:1391:b0:49f:ce73:5e96 with SMTP id 5b1f17b1804b1-49fe670af91mr25055135e9.34.1790234903741;
        Thu, 24 Sep 2026 00:28:23 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd42f2sm44430895e9.15.2026.09.24.00.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:28:23 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: David Hildenbrand <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Vishal Moola <vishal.moola@gmail.com>,
	Ingo Molnar <mingo@kernel.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	x86@kernel.org,
	linux-mm@kvack.org,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: don't defer freeing kernel page tables while booting
Date: Thu, 24 Sep 2026 12:28:19 +0500
Message-ID: <20260924072819.33277-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <41a59ba9-039e-454f-8d31-f647db802ada@kernel.org>
References: <41a59ba9-039e-454f-8d31-f647db802ada@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 9/24/26 09:07, David Hildenbrand (Arm) wrote:
> Should we instead simply skip the
>
> 	schedule_work(&kernel_pgtable_work.work);
>
> and rely on anybody freeing stuff later to just free that one alongside?
>
> That avoids throwing in more freeing handling.

Yes, that is simpler, and the early table then goes through the same
IOMMU flush as every other one, so there is no need to reason about
what an IOMMU can see during boot.  The only cost is that it waits on
the list until the next kernel page table is freed after boot.

I'll send a v2 that way once I have booted it here.
