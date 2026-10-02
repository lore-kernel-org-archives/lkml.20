Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBD736654C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 11:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790939298; cv=none; b=jkXIafD3qcF23wFehdqJPPrOidbwZ0CztDH0ibJuQaAw9ACTdtVZPUuFY+zuBdf8/x3he0ooLzCv8W3wQRPWUp/A+6HqLCuLr7Hga07ovO3hh1mxHEmD3g4flHn27p85VTibtZcHVgotCJQ1EotY1grojJ1H0Lu8bj6B6iyCG+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790939298; c=relaxed/simple;
	bh=Yxvsm+EpuAAh+HTcOlmthJbkprok5JE7YbbSuBmbdJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=urbD2chW57Gp0FUdA4VSau9SZ0mOAaQJdbFmphjmgBjNVogTDuHg41mImEmyrMFZzlYAqXOLucgvlzmUNJtw5cURWrx8I0UR2VNMMwY2qNoV1Uh8iDW+kML6rQ68FwOSnYae2UQrige065wzGOxCHXJDIvQJEkhdcpRYr1pamps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=TKIqkZYD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=C2RLXdsX; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="TKIqkZYD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="C2RLXdsX"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id B647AEC0293
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 07:08:13 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 02 Oct 2026 07:08:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1790939293; x=
	1791025693; bh=jrR6OUaCX5CDWnI61xSEBYpaGhAGjsqwnjVR7pcNAL8=; b=T
	KIqkZYDAn3QoGmwq//hBAiaRmnnDyIhe5MfE8NWY/ntmCCfKZN7RCwJ5jVr8e8jc
	q/dRSjEnuxQsYVi2NQaRFMMrpIvy2XAA2gw6OAM/9S/CO96GYyuwd7aVuvly8EAY
	XUUMwX84Oi9S18LGg2A08w9yC22vhjSz0rClCUyeDT2jEjt1RsswmalS1Y7Kyrot
	IeTLaXlWEHZFDks6Vwddfvz6LZC6YCpwHjoHKzPg27I2VgdI0U4+gZoLvE7mXj8C
	z68KlAFUyymXKxrsD9Qw89G+WfmbGrma/Y8QNhN5uaZsFo3hrnmlQE0sPyrm/Zsn
	dxQqwgQnaCIqclHhQO0vg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790939293; x=1791025693; bh=jrR6OUaCX5CDWnI61xSEBYpaGhAGjsqwnjV
	R7pcNAL8=; b=C2RLXdsXRHNKZ/hGDFofkCpT2htpUPLYe6JlEuihHUz4nerP6y8
	kR3/tcZ0xxUP+LtV2Ev+J6EXUnzcCEdvWu4nMqwVNA9aDuIxjjwQwTEOFDDrB5FQ
	tYimt1b2pEso+96tN7SY7CpyVMtBho3FbITph3htA9ln1w3t6lpP9Ghtj5VY0NfP
	ut1e7J7fJVzDMkSq/w8jskbKVnuoIdx7DkFpsAjilY5egOl2n2yhFRGdawNTClcU
	wXifHKRCybNQzlbUoxi4F4gdYSci8Z0D4jqL0ayfQsyiIIUmkbR40NNHgqJkPnwt
	CFfjtbUjq2ZWbZDe+NdHtFEyG2Md5Pj5slQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=shutemov.name a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1790939293; d=shutemov.name;
	mf=PGtpcmlsbEBzaHV0ZW1vdi5uYW1lPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:TeAnbCm2qlm5DskTYLvk9NdFJgC3tivJKdlpbPOg7PZUHrw
	NBxeACvYxEsTB/6OHm6SqcSj0C5G1OUlw+s0D/g4gFbUwfqROHNFYjpkkgwrp7nM
	iqPYYbDptgoyMWhWB6/2lz/l5F7fCk6cHIyWYCSivs7W1dvv2DHXrAm1BLHc/QOp
	gaAXMbRY7c15/TpM0JYWwElZcw08f/OY+zrSn9byyOT+TVnwykHguRqKYvn53hig
	G4oGJydY8ULdXBBHZhZLiBNxKZcpyCO4mZANfEyeuK9fEdpKj1gaDrfKcG/nTs+G
	0n6UAEAXsSmJ0Icy/10gcLvj04dv3OhBMgm0ZcA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:8ol4EYGt4R+FErTp0BTFN2l3nhYMwUXredyLtkLdvIA=:Yxvsm+EpuAAh+HTcOlmthJbkprok5JE7YbbSuBmbdJk=;
X-ME-Sender: <xms:nJC_atm-Pcsr2QON35QNbpn6xF2n9iZrJBBE3MLN32vJQK8w_9BfDA>
    <xme:nJC_amfzbG7qnMYlpZ9Q04OPfEHdQ1Eq-wlcFc-l-5apYW4vDRh2hm5xS_v6CsVh_
    CpV3mTLF6cAuSn5AgH9dBVjuwnqbeBEFN12lbhCVFvKNqZ5nwjvcHs>
X-ME-Received: <xmr:nJC_arC-Pmv9tI1iHpUCnUl2EE1QGMDVgVVfaz5_LvHnxUR1GFNiZouNfok>
X-ME-Proxy-Cause: dmFkZTEnKtj7AidfH7fVYRV/Gu16ACcgxkEKSxWSUUMyTNmc62cb9W0oVIihGd5C5eEShn
    odF+vZX6J1yUfdePX1mU3en4NP1xdbwc7AxJREZkF14IWEdHwi3xhFCR3d59SRdN21aYf9
    QX0zAh/3o+TfdeDAFaBDqoiyEkpDs1bcEh4mBOGwmT7PXZNVWB8A5GT1YE7+LqT9RNc8r2
    GKsdqIDh+97RcZGZymjuD3g/wxQ4U1b7PwYZM8G3uU60G5Wa/l4/rVKcytpYpr0t//DtZw
    EXyC5IJfLn1RdNnEza2DaXSPFXqWXHMpAAbU4OweAydjQ4Z0Nvh4aN6wSH3H+Y8aMx5tsH
    YYqjUX2MyQZwaAQCvw+lGs6zg4ZaGRDkGlNW+2kF5+NNHZs2E1+lMdbC/9Th9NKIk8X8oM
    Aa546ci2N4D8zXggSEzSQ94AOoX6UEBjuSW89M2/hTV5k+ubqbsJt0ApHEnIDTypFag6eJ
    tk4lwUmEa9x3f2/1RgxrfVwFYdJgd3CBIuTpDcopyUkEI3JGSH4QfNdVueqDO9eQ1n2Tn2
    L9sDsztXSkAbb9XVHTAcDH4ew7lQpEgLmqWbgF5aZBbITx6cySFGNbsfj/1jA/0yPWOwVq
    hgfJZu3WBI5LOrj52fyA5Mdntdh54jcDk3D2Wmq0Yw1aVlA7aLuEr4kCYV8w
X-ME-Proxy: <xmx:nJC_alwdcUUK6Fy0aOQmDBoq8l3_FA7tucWWPtRCqZDZGwRWC5-M6w>
    <xmx:nJC_ajjgQRSywVEa0_NNEBgx0Ry2U5AUzL6qOlaDzvIDtdcKp059Cw>
    <xmx:nJC_asdIrvYnGkwl4aO3urbwitc4hAN5Nlog-ukLlsurf92DBRhzHQ>
    <xmx:nJC_aqUR6lGvQ6ITR9AyUOaZURU1Bv3j6MAg2hBdn-eBl2gexjayig>
    <xmx:nZC_asL4jBb3nU_ezElDUXVqc3wDz4K-QqUPaieLGEqXP1iG6PdU61fS>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Oct 2026 07:08:12 -0400 (EDT)
Date: Fri, 2 Oct 2026 12:08:11 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>
Subject: Re: [PATCH v4 08/13] mm/collapse: call collapse_file() from
 collapse_single_pmd()
Message-ID: <ar-QK2P_3Lc_YCkd@thinkstation>
References: <20260928100630.21870-1-kirill@shutemov.name>
 <20260928100630.21870-9-kirill@shutemov.name>
 <67034af3-9849-49ab-8904-6d661178222f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67034af3-9849-49ab-8904-6d661178222f@kernel.org>

On Thu, Oct 01, 2026 at 10:08:09AM +0200, David Hildenbrand (Arm) wrote:
> On 9/28/26 12:06, Kiryl Shutsemau wrote:
> > From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> > 
> > collapse_scan_file() reads the page cache to decide whether a table is
> > worth collapsing and, when it is, calls collapse_file() itself.  The
> > caller cannot get between the decision and the collapse.
> > 
> > Move the collapse_file() call up into collapse_single_pmd(), so the scan
> > stops at the decision.
> > 
> > Two things change with it.  The writeback retry re-runs collapse_file()> alone instead of rescanning first; collapse_file() repeats the scan's
> > checks under the page cache lock anyway.  
> 
> That change wasn't actually required for "call collapse_file() from
> collapse_single_pmd()", right? You merely decided to move the retry label in the
> same patch.

Yep.

Once collapse_file() is called from here the retry can go around the
collapse alone or around the scan as well.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
