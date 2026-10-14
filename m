Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672E14F472E
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791975332; cv=none; b=g1sMJGUcdV/96uGUo3bCPPEcerqNMMYGRyGd3cTUiyEY/wGR9l1NBJkNCnfV48XHe9yxXumHyLFGzWYFWJ/Xx6I3w894CWeiIsVdd/1IZrU+fA6IisRBDEC0rhchEeYTgXhHfidJbrut3a0GgtCFYvCLmxjMOf3ABZ5Tawu6n7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791975332; c=relaxed/simple;
	bh=Xk/fUwmHtRA0T1v4C4miwnlsKsD2mKq4YWKxoaoiUtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GadQpDm31YRuIdkb3fO/oDbLyBrFz1SM+TSNbuXO9nErAhZsagl/wHoDSKD0jNS5Qin283KTwpXsIWzB4Nxt21hAP3uKfVlOemdC7qv5XriN5MNCR5w4GiwBy3nrCeThz4MI0duYUa+ohjFTPRG2B2AVnfzEWPUv1lWcGa6uO84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=nJ0TaUNM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QHgq217u; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="nJ0TaUNM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QHgq217u"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 75B037A0127
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:55:29 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 14 Oct 2026 06:55:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1791975328; x=
	1792061728; bh=omdT6uKFt6UgyRDQimCvM0GtrqhzgEMeFDCBOuOK7D0=; b=n
	J0TaUNMSoCZ0/0H2bOkTsJX8HktIhKJBA6tMb31Sc8qsgDlP1G0OMwdkHXrRrr92
	Rg4jRwJcvVDDgiJSdEbWXr6jKzAml1eiYLgIH3xQ1/EewJ30gflkaCBaGntzXlKm
	si2O3E5+InvVtolgEfiEenZACfHhb2rQv/X09cch1wbNCAJM3gHTi/K3lYN8a0Ta
	MWsLw44F+qcxA/m/Ww6gc/rq9kG0EFJaOkZ5C33dq44t4vqNTlk2HQlF7QlEaTzt
	gmjIyk5MBIfkXfFzdwRoVtzd3o6djSN6mnUGHLV3ZpHmPtqoUhHeDrlvnOqygrJ2
	UZCyIaVJOSc6HWcQrCblQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1791975328; x=1792061728; bh=omdT6uKFt6UgyRDQimCvM0GtrqhzgEMeFDC
	BOuOK7D0=; b=QHgq217uiDX7qacTDMSrRKx6R6531j+4Zm5YzdkuiUSpmbcvmtd
	k8Ev+7nZWGgiN4fF4EKqhhFlKakyAd83bFQEd5fGUsnCUX+Q6ZuDHsRJkiTzhidd
	wGUQBDKVJSdzzz7DsalIQPjP5wOwzkXwaM+PyBi1Pq/GXi6H5E3wzXj/ZPm/3ccA
	COK+SUsJFgH+iAMDzyfHVpwjOblr9+rBqKp9/aLeqHXO8zFQsKo5C8hhdnwEz5la
	8bpDG2Dh3+NGR7VQgjZiXRt5RghqH7GrDqz1W/kc3f04xOL8L3RQR2w6x/Yx4S+P
	lggZFIHEz44Tyhp62b5Tzhn4YMP72Ut6wWg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=shutemov.name a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791975328; d=shutemov.name;
	mf=PGtpcmlsbEBzaHV0ZW1vdi5uYW1lPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:hIR2EhUhN7WhmnIoDdPweiidMi7XNhWMiGjyUAjd27kCF+X
	rCWyHuTOrmkv2vXg+A6WpOgVnvg9zI1fkRr05SKoLeyz4S/r1g1wTaukulizsH9D
	GqAipXz7E79v2z9A3iPc6gAknCPnnq/jZkPzTLTaIL/oizEzV3Vj9HuTou9VSTwn
	7rVvN5R1jv57UYOT7aP7tVWEV+pTkEblYJYf6tLuM97Ld49MxFAKr/3MfW5m3oRJ
	jIFdOUD2LjgDEV+Vp74XgYvN2ca1AV2JjTGj8TIYHTNKoVv8wV6aD54wiNLLzKKQ
	gcIvi4jvDppWp4jqxwlSWA2NrkmE7+r+9YGxMcQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:w7lEh1tu20A+ZpNoUeDrRfl4RpRTFm0eS11CIC/Uq0Q=:Xk/fUwmHtRA0T1v4C4miwnlsKsD2mKq4YWKxoaoiUtU=;
X-ME-Sender: <xms:n1_PasKFssOqG_LtWk8iA-X6qDJrR9PvGgiQfGhTbBXGWyq7CKtS_A>
    <xme:n1_Papz6po_PG_q0ISUcPHFRFbTroa2P5U-_OBp4xOqbPcnswYwckOrohLMLDtlt4
    S32f5jyL9NKrjj9DW7KIf39y827wJR3NZU0jr4vCV9VVtADA2Q3Yns>
X-ME-Received: <xmr:n1_PakFuSU48SznQPrIcSWMyarIWl_LFBzaCD18ri01rklAFZU-FOFouvE8>
X-ME-Proxy-Cause: dmFkZTGOn86wrNKWqtV/L9sYewCUn3X/0QTPjpd/7tUrwcs05L418nntweIa5Cf7z91sgj
    cziqmIK8dhRC3X3AMKM1JjOkK85uXwPO/r0a8XxPIyu7pqMMOBaWtI4/Y4Kc2vgzvSEWVJ
    ZaRsnP9Nv4tX62EYnxn4n0bn8AzRk53DhMm8R64MuOTDJ+90AcVgZVnBwPGdlXqHQE9tOz
    SEHuJ16ddypP2WQxaX2fC4FhiZWyqjYyo2r2upTBplK5B5iszLmNZsNVxH3vvLrmntXn3R
    T7YymoFpBrxjxR5NpXb6v2OSEEjeNdTU6Ju65KT/NUdORxnzJxQLU2l8E1rSgXzg6NR8jW
    8OJjZMtRZyo7MQR+p9xub8402O7KsoTmZC+MUB8WxSjIdCu7HmdbLIFir6NhXjreyiGPSU
    Yvl5I7aSRPhEIEjwWIuq9WX9uK6wK8DqPhQ4IyKZ5q/UR/lFHSeNT33rKqxfYNtxrLSg40
    7iu4HZJk0KjiGVvtmEPF0O15Zn/C8qUfRkDhcP1PqpAQy/arDx6iY6s6hMa7ix8VXbSG/2
    kYqmb09908Vk7ONX5Cyue045o9MxG9Ak/1/IDchsoSzVKogB9YlhAWB5ciW9DA9jDyIYcZ
    76BuwDp3CRw87AIqlKpQMVF1bi6OhunxwAShdHy6koBWrkO0/U/SVF/CUy6Q
X-ME-Proxy: <xmx:n1_PahkkZiKOWtd3LRLK5kc4mckJEWrLyoEzIe1j-leCcesNPSJxTQ>
    <xmx:n1_ParGM32g4gQlVeftNMvjqJW8JXbDxQFmlVvSge6TNd40eWmWLiA>
    <xmx:n1_PakxuUZQmj4ri4cguzLuyYh8O5IP1mPqwhxfdlQv3OUq4S5WAfw>
    <xmx:n1_PakaJsvD46h4JrRHLaELBZQVfr--D2C3y-kje07b7JKozEcYpmQ>
    <xmx:oF_PasPQd9PVQAZ92DN8r02aT2pzkmBkTm1DN9nkYjROD86_ywUCVr_V>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Oct 2026 06:55:26 -0400 (EDT)
Date: Wed, 14 Oct 2026 11:55:25 +0100
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
Subject: Re: [PATCH v4 10/13] mm/collapse: open-code collapse_single_pmd() in
 its two callers
Message-ID: <as9cHpbmDm2FzJai@thinkstation>
References: <20260928100630.21870-1-kirill@shutemov.name>
 <20260928100630.21870-11-kirill@shutemov.name>
 <b2133cff-ce69-4a45-bf33-c44b774dee7b@kernel.org>
 <ar-nKHZ5hlbsXeFP@thinkstation>
 <dfbb4bac-0def-4e1b-87a7-91c9cd91349e@kernel.org>
 <20261013143839.832f1a4db51f801a2b95f850@linux-foundation.org>
 <3bd88620-c245-4fab-abb7-9091d9a1b649@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bd88620-c245-4fab-abb7-9091d9a1b649@kernel.org>

On Wed, Oct 14, 2026 at 11:33:46AM +0200, David Hildenbrand (Arm) wrote:
> On 10/13/26 23:38, Andrew Morton wrote:
> > On Tue, 13 Oct 2026 22:25:21 +0200 "David Hildenbrand (Arm)" <david@kernel.org> wrote:
> > 
> >>>
> >>> I see the appeal of the single entry point for the collapse engine. I do.
> >>>
> >>> But it costs us on both the locking picture and the scan rate. That
> >>> does not work for me.
> >>
> >> So this is in mm-unstable and I want at least the first 9 patches to go to
> >> mm-stable rather sooner than later.
> >>
> >> As raised in person, I don't like the open-coding here; it just results in weird
> >> API. I wonder whether we can come up with a better interface, while keeping the
> >> locking as per your requirement cheap (scan performance).
> >>
> >> While we figure that out, does it make sense to send out revised patch 1..9 to
> >> move them to mm-stable while we figure out the remainder of the new API?
> > 
> > I've suggested to Kyril that we park this series until the next -rc
> > cycle.
> > 
> > But I can bring it back - we have a couple of weeks, three if we get a
> > 3-week merge window.
> 
> I'd say we move forward with the uncontroversial parts, and keep discussing the
> controversial bits. Either these make it still in this cycle or we'll simply
> have them for the next cycle.

Agreed.

Andrew, could you pick up 1-9 and leave 10-13 out for now?

I want to experiment with a few ideas for the rest and will get back.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
