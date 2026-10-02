Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D378481238
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 11:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790939765; cv=none; b=tZl9dDy3IRRa8EFD9X0R3IW8807stZRJXoN9qDXVgv4HFbq6AM/vBOpNrydiGLYPF8XGcgNXunKbye6fF2ytFYnnN/he05sjSzHVqEOI+JGVvyiyTJBJxgLc3UIm6gfA9ysTlAYNtXQYjMbZcajjZ2Y0vuM87rloV8S0YhwnweY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790939765; c=relaxed/simple;
	bh=rLjD7PTRxRLm6zR7cdPqYXDYyMN4xlD9erFhXKlSNn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Niu22AHB0GKguMs1pYYWKfTDHvOUc+vcZfcxlUotyDAuUK68B1707w96fdXmE5RAZk0rTwcED7QiEPPURqNEBuy9IB8Vm7d9p6lNSphFQwuZ1IXNpw0VQ1Tkw71EgQSf5h26GgcyIl3vv6vDu+FW3WFrCI5SUhyTxx0kgURlqjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=F6e8jeA3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=caGEv8CX; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="F6e8jeA3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="caGEv8CX"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 160421400151
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 07:16:03 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 02 Oct 2026 07:16:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1790939762; x=
	1791026162; bh=p6P809YcEFkgZYt3dJBX9HFU16JBGD60jWrOGj9WhIM=; b=F
	6e8jeA3Sjgohv+3K5lXyiBi5JOgA+lmGMiUKerbuNQLJmrCfx9vzND1QynNHPVO2
	Fk5lafsqpdcvaLD7FE4U472GAde2vxEkCqVXHM8AWxcL0Eyfgtt6ffuO6QUwMZVR
	2WeRzSj13bTWmwgY/d4M0Bg71/Z0datxnjPFCUOK9DmgNOYHlybwsrX/fd0AgNgW
	v1LoEVyQUWUMyTTtdfybiQSctv7BT6i+wDFmXdJZp50mL2u+xa+aNsyYvu789cw4
	kqDRK4yxzdx0G7u1nqmYEnvTwFYJwGjVpopSzG+BYdgP+sLww22fF41QJ6wSFiw0
	s8Pmicf9VfZv+4BVStX7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790939762; x=1791026162; bh=p6P809YcEFkgZYt3dJBX9HFU16JBGD60jWr
	OGj9WhIM=; b=caGEv8CXFpU5L/754PZtURUwBdWoRG3+RoXodZdqeXP/P+7MKv9
	ZCrtXzmWxso2c1hRadrPbGbSMltSuhjyga4luTSfx/Td5N8hlyt2y6iQzqm0Rf42
	DUSXBC+alfkiMeTM2kZlJdIAsgw2Fnx2Jvx2crdYvxrV+oVBVTLWVgWgGuSvecvk
	Trg5MeeB3MobaBmzrSzDWMN90Kqtzm3iTvrzJfw29NIxrYnFTJ29GasDKJ/RV1PQ
	us3gKgwwHbL80eqoP++ypWe0EoaS1SYpEnLgXlbxPxyi0wWTVo4FMeiH6hP1xWr6
	SuOpfjBbkJQUrXFlJ31VYk2Ohhlc7dR/P9g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=shutemov.name a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1790939762; d=shutemov.name;
	mf=PGtpcmlsbEBzaHV0ZW1vdi5uYW1lPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:ReLqxzpfaLZisExdGUChsJ2Ag/GmWTvIaBKr4LTaedhpSBK
	GLwxi1yi+ca3Uyn9AInGrMM9NxQ/MgJ/srcVfzTl3U/I1IWrE9OAe2Ba6+0OWRmy
	KRkv05k0isu6PXv/jns57K1/hzkjC/onjettiPXJJAaNZ6/efPfNKi12p4qBZSBf
	RR95yNSeNLKIWiqZUdRue/TkpTBmK4ZKboDbYzQuj/Z3sxAPhUmn31Bfu/DWRGpa
	nm6FxjM1NMCBwki7iLc+Tk3xRWpbhC8ESj16+kCjNcw1knlP5d4IVrRNVL5Djoss
	/QJ6oFNiHP/XAgEAZxJLEiewQCYAxKWKjtcD7BA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:bMo8HEqw+XiMNM/BAcO6Jb6FU65Q3QvxVC76RxujU7U=:rLjD7PTRxRLm6zR7cdPqYXDYyMN4xlD9erFhXKlSNn8=;
X-ME-Sender: <xms:cZK_ag6-CP6f_gb4D9vDrUfKp-kO5w-tbenjwAuJx9mWU5VIiGin9Q>
    <xme:cZK_assRmizyXeB7qZONd9_cj0AasuywH0VBcJ01oUWCh1xyr4tY3CiPq4YB16nXz
    X9WIJWDhA8H5A-GQlht_sY78I8qqaAlE0GEg9z7YIRxC9vt_PISqtk>
X-ME-Received: <xmr:cZK_atvB4az53u0LPZllRCclPWfZnepNl-2tLnc0qjPBWYF6SPHlsz2bcOw>
X-ME-Proxy-Cause: dmFkZTF/1tmYHgENW9/vj2pjkxCWxNZLy8cBqZqyG3QR22/biSzxfwGmM0SNSCX6B8CTEE
    sTzdhH4DefA/ogWq1+xZTNoNZrv6+eNRhC6+EKZ43s7HCM42zfU73HzR2hp18zMWUeDanj
    nxI3Hsq2s2NNJtxrBlAYWBwbjBSzuVnIQ62G1K7EAvF8nxwpnIK8LqmG8FleX8g1/NWWpi
    i1Eh2+rwWq/y+BB22y+2UHlhiK/LMUG1G01oG+O68qFEFivbqh0vsu2iQJcAgmsoyUHgKb
    2X88Uhgm2hGpfWmFleq/C55jouc3ELdga+uqGFmcFxDT3Q/oEEbXjFkgRaCAjW0VAlUlRn
    LXrejEbLijsGaWjNJTbbc/kFtaVuZERxtZs35DIxuCMbVK1PbOlz+gLxbYzN8M7tlMJrXb
    H5uKuiaO1wu3o6GytFsZVTuVzV/AzbDF98dPu52yFu+a45CF+Kf+AVGMuCL6SpIpMisDMu
    0wxgfWqDeTJc//eTAYYV8TXEO0GiIKxfOHTycUJfvcnE4hXUDAw7zG3CXh8cZlX1wNEc8N
    ThB2MNbWoK5+/sdViJhb+PNKJxmKRborKpl5atJcuQKgh0aRJZQUeAOYYa1ZzfDHj3WRcx
    Bni6Sf9xGhOISLmEPi9f40Y0UDnDSYb9DFWqjbqmIKjw56KodkXu3u3MpcCg
X-ME-Proxy: <xmx:cZK_aksEFhpnf2XrsNIkehG_MjzhnzDXag4QhVowuDSSLodFy_hB1g>
    <xmx:cZK_at627sWI4UwsAEjGi4nVkv1kWsFyI5fHLsy-rvBaWfLyfHYs5A>
    <xmx:cZK_anCbdeKfxXLXEBQWC4AwHYFsC-_AY3rYHeGjX9R9_M2gwiPsaA>
    <xmx:cZK_atvqTj6y68xOYjd3PE6Vu9ALp2gQG3B6BNdDCaZa-VlXoghpmQ>
    <xmx:cpK_aoT9JCIbXUKFqB5glVomIPxrr6D9r_jz6HtYdW7-B16y63O03yx6>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Oct 2026 07:16:01 -0400 (EDT)
Date: Fri, 2 Oct 2026 12:16:00 +0100
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
Subject: Re: [PATCH v4 09/13] mm/collapse: separate scanning a PTE table from
 collapsing it
Message-ID: <ar-SFw5YYJhv7esG@thinkstation>
References: <20260928100630.21870-1-kirill@shutemov.name>
 <20260928100630.21870-10-kirill@shutemov.name>
 <9bf6623e-ad1b-415c-9720-6063a1ac11ea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9bf6623e-ad1b-415c-9720-6063a1ac11ea@kernel.org>

On Thu, Oct 01, 2026 at 10:34:54AM +0200, David Hildenbrand (Arm) wrote:
> So I suggest the following in the context of this patch here:
> 
> 	collapse_scan_pmd
> 	-> collapse_scan_file
> 	-> collapse_scan_anon
> 
> 	collapse_pmd
> 	-> collapse_anon
> 	-> collapse_file


Fine with me.

collapse_file() has been using collapse as the verb all along, so my
namespace argument was not much of one.

> You should mention that collapse_single_pmd() is only temporary.

Will do.

> I'd just not add that doc if you intend to remove the whole thing in the same
> comment.

Ack.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
