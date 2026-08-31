Received: from outbound.st.icloud.com (st-2004g-snip4-11.eps.apple.com [57.103.78.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AEE414A04
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.78.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788182219; cv=none; b=DXvVbhIXEX6Gl+DC/Q+Hpcic43UklX8mfJNbWacuFZLQqFZpwUzFUO7oC3WkYrOYdoOr8Q/ur9mPPAOBBe950HgPtYvz4a17tR9FDFKSFAeT4vZuZKBNw36Y7n+uu1F1MoH85J47d8dgeOIhELBelK56aMQJs6QfTnTM9WxKrP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788182219; c=relaxed/simple;
	bh=2mqzID0EAnc18f/7PSESxGJ50DdrYtnuWOz2frRlw1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tOhpeirlb6IMBFTGFzaIDeVZBYHF3Pqh09pBWvExTpOSBNtjQI64ZbS3/h6XqY2LF7IlcSLH2pFaEHQWiVk/OEl/dHdDLUD2o/jzsbgqyCaxI4YeiRoC10Xmrjg1Ta3Y2M/dsd35xcfstFv2pRhVO0Az9LR4h8R5Yx2vFiAlvWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com; spf=pass smtp.mailfrom=me.com; dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b=D0rP4vEr; arc=none smtp.client-ip=57.103.78.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="D0rP4vEr"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-7 (Postfix) with ESMTPS id 5684B1800BF4;
	Mon, 31 Aug 2026 13:16:56 +0000 (UTC)
X-ICL-RepId: 01a057f7-3e94-7ac6-948b-c8adf7ddf1ab
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQhABkMAWBxBDkkdXwVaEhVdRVUIRRlTHhccRgxFGVswVB0dDlgGEhZdRV4IGQhdHRkKUFAAS1oVVRcOAkIfUB9MFldDRB8cGVoUXBhTRVEfVFhDGUVWaUELTx1dGVscQmRYVwkKBldeWhdeTVoCVk0FSgNfAVsKQwhJAFwBXwpeC0gDWw9cH0EUHlYfRQpcXl0NUh9FAnIdXFZQAlpVEgRACFZQXgheH0wc
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai; t=1788182217; x=1790774217; bh=2mqzID0EAnc18f/7PSESxGJ50DdrYtnuWOz2frRlw1U=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=D0rP4vErFhTtG6H4viWqPMNQW584uquqVuQK7136C2syUitT9dRP/cdqXNozrpH/p886E1XlKjOBZilc9qW27kfJDZmQPlkv+vilBWyqR10tVki3MTyPQbGWestDxAvJSTlOBtPvF3tsy2rptT9E1wq+KHObJrUEy+aP6bD3b7uUqwUBIrBKp4/YNYoNBvut6oyLuOAwtL1RjXzPXxYLbMEw31u3pqj+qU3jMHPQ+LeezJgkPudDI82AagWf7eWBDxFLiMlm3S/d2nbDRTLd3NU7sLbkqWo7fvUbSKhiodl0ky9qzBLr48Zlu1zULWapGoor0YCp/kVA8ztFJe59PQ==
Received: from ncore (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-7 (Postfix) with ESMTPSA id ABA501800156;
	Mon, 31 Aug 2026 13:16:54 +0000 (UTC)
From: Ferran Duarri <ferran.duarri@me.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Ferran Duarri <ferran.duarri@me.com>
Subject: Re: [RFC PATCH] dma-buf: add a generic reclaim-priority hint
Date: Mon, 31 Aug 2026 15:16:46 +0200
Message-ID: <20260831131648.200687-1-ferran.duarri@me.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <5397d2cb-4eb1-461f-82f6-57a1ea5c8499@amd.com>
References: <5397d2cb-4eb1-461f-82f6-57a1ea5c8499@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fS5BrpLG7o1mw056ioF9kVZ2M8bpIu3H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDExNCBTYWx0ZWRfX5jW2dfPLHVHM
 1PF1KOfeZFlYaXzSpegK2y58lOdQU+Li0Ig19PQPXSY1oknM+IRTxijwInGZ1gerdXab4+OCs9j
 GUf02MftxXi9uSagB7iJ63FmwtujfuypTw+LC8XG5N3CVyTMegTUyxRl6x0+HHoF+GoM11PP1Tl
 C+HCoTOALYgOY8NuBSJm/TY3R9spWx0IyvBFhmWCUIQE9EZkDKYsd1k7MUPzn42fvT97/p6Qs6x
 xzhjlByNFwmBF8UoDf13j+zOKjCCq/caDMfJrXPTd2OUURGHyMdSwUvTkmCdi8Rk1lhVqBa6M6W
 IB/puyCmvKjkZPLlk5lixbXSUAFnA+CF421Zhc8rUFOU19xG2ISrX8YUPefjt8=
X-Authority-Info-Out: v=2.4 cv=JpP8bc4C c=1 sm=1 tr=0 ts=6a957ec8
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10
 a=B9nqV3Rn1-QA:10 a=VkNPw1HP01LnGYTKEx00:22 a=a0-iINkCwqse2y8dGaIA:9
X-Proofpoint-GUID: fS5BrpLG7o1mw056ioF9kVZ2M8bpIu3H
X-JNJ: AAAAAAABtPES4lkhVPY4S78vdADXaAnuW6MvoGqdWCL4Fbb9QHe95ULB7lhOea8AIConeQ+4iJYFoM+nR2IS4/Aav0t+WRhwoCInlzjG5t+aSNl7+bbxtekurXRcjXZxX0s+fWO/Jd7JwG6fZC+IISIdshDo3Mnr2f6p9VuXkkechN3W5xr6M+bGGYxxQYisgtz5AIzO9UQ80r4KYNMn5eOF0SXIpEaCd/Z1p9txehRDU5tvFavV4kpBJ5cJsaTYsqaMGbQLuOiG3eTC9O2WJxSYmgGeKqbP1tPjGj+3SLWrqA1G67oEnZ7hPIQWt6UyYdTS/cuqNoX1rkpzH4zvFmbz51c2T+rH8VrzAkSQ90ZkmiRkR43RE2nV9VZMsPbDmM7Gzef7ow6XhdZ6XhEj+r9X3Co9b0bvEGsbL94UYUTFEkh9OBAeRuZN1c0Rc0LXjcgBtTutDtNdPo5+/RKQwxOn/7tjr+BgvU8XqQXag4vk5rG+yMz+ywE2UqMRJyg553dlsLw5kpWkgGWqJESZ++fTstppYY1+ojxYO8tXGqOkda5p05HaISt00tOb40BSCMQA12rTKyqP/rZGrj+e5Sj0kzJYq4H0g0jTLSquf3UYQWFYtYNVd5Q34LdTHHLFQeMRoRAbBo7UXL1J54/IffQQy8JeTJHYJtLDKaCyjd+JZ05BfInJuREVo600ZQlWh19fRuVD1Z16IWA+kQiebDPWnxZ2nVJckjh80tZ/j/MaH2/fG9R2L87PZQqgDXHMTiBaORPnE6KisTHhpYUmsRN8PI40RrZ8/u+7o0NfN9nAAmd5aFrJuZcqoBuBOnClVH26HOauE7Yojrj7150ebTcG76DS64CVKdQfUZosRDGiNOHZx+tE6x0eqCnxMcV/VA8woPSN1Ntf3zNb95Km8mwS/sHV/mZo0AZkeVjTCK0i4yFZl4DVeKLKlwpAx6B3P7bkidKtzb4nOlT4BBG1SCRMe0VK9/K
 259PinQdezCoxy/bRbzqZ1a0qS29ixibqRgpjLrNpJDFj/04qD05w54aGf9+sSsRr6jJt1FCt2ccbnByvtIQ3LLl0Xp/cMHHGJXrA+m3sAl57W5PzFoeemse9djqa87BSPdI0hP2Bc2OPJHPUq33816ykZL/SdSuNAQ3QTG1UiQmORpYzt1h91PGfhBPqZzJH2ZrVJ3XWYnSC5XFwleurw8JweAzgCRziztTZsUecxvSqySj1EXuw+G/e5yh6W6Y1xgsGULrqEvzxsdh49dc5f5XdOcsRFZJIhA==

Thanks, and the FOLL_LONGTERM framing was my error - I should've checked it
before I wrote it. I'd been treating the pin as an accounting detail rather
than the thing that makes the buffer un-migratable, and once you look at
check_and_migrate_movable_pages_or_folios() and what CMA does around it,
that's obviously not a premise to build UAPI on.

On the in-tree user, that's fair. I said much the same in a follow-up on the
20th which you may not have seen - there isn't one, the only consumer is my
own out-of-tree module, and that isn't a reason to take UAPI.

One thing I'd like to understand before dropping it. You mention the
exporter migrating a buffer between local memory, system memory and swap.
If this ever did get an in-tree consumer, is that the shape you'd expect -
something on dma_buf_ops the exporter implements, rather than a hint field
plus an ioctl? I'd rather hear the direction is wrong than come back later
with the same idea in different clothes.

Cheers,
Ferran
