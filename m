Received: from gwu.lbox.cz (gwu.lbox.cz [62.245.111.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBDE370ACA
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 19:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.245.111.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791228428; cv=none; b=Vl/N1focJl5+i6AkmChKxuxPiRIVesEbUiUJ8QpswGVnq3Qype5R+oaHho0lKiFK3JRKce8BrRRvfnyYopxjePXek7c/AyyTQaE/xaaxWUqkqOyIbACK89V+BnCBUnVpW7gpxcvJbFOyAdyxSJNM0LdrXXVuUqEwr/4N9KHjCbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791228428; c=relaxed/simple;
	bh=cvvsNN6K8fU4SA1QipWiWKhh12vBtmC8wmYikS+PF38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3b63uXVxGgYk8rgBAVUXRxJ1DcdnZIKXU+b/MZ5OApvI+ufkzzOBxxmY+JIG33VOacVB8dpauG8+j37edvsm5cqPhE0tajW5BMa0IZJa45yHniEqMiVAP+E79m/7qc2bGYsa9ly4TaI/soZUFaGnNr2dvWFQMKATs5kKOzv7AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxbox.cz; spf=pass smtp.mailfrom=linuxbox.cz; dkim=pass (1024-bit key) header.d=linuxbox.cz header.i=@linuxbox.cz header.b=J7hDwnY9; arc=none smtp.client-ip=62.245.111.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxbox.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxbox.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxbox.cz header.i=@linuxbox.cz header.b="J7hDwnY9"
Received: from linuxbox.linuxbox.cz (linuxbox.linuxbox.cz [10.76.66.10])
	by gwu.lbox.cz (Sendmail) with ESMTPS id 695JQ19o4191092
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 5 Oct 2026 21:26:01 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 gwu.lbox.cz 695JQ19o4191092
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxbox.cz;
	s=default; t=1791228362;
	bh=QpuccrIcgCvueKGVQVkI+hAnPAS4VH0mRSHq0z2XlXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J7hDwnY9F+btQChNhiXnDDvaPyIyZ25bzylci95cw5Ii+q9pOYzy19sME9STPS3mW
	 1P1P1RDB7tXKeDjKlOIO/cF/ZCo0n8CdmNE48eyRx4WsrUYrSGAWfnNJ1dhed4EbpH
	 cNQn2XihNsaomyCIFHjIlewPeCqkL+fKeF4IKYto=
Received: from pcnci.linuxbox.cz (pcnci.linuxbox.cz [10.76.3.14])
	by linuxbox.linuxbox.cz (Sendmail) with ESMTPS id 695JQ0hY042712
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 5 Oct 2026 21:26:00 +0200
Received: from pcnci.linuxbox.cz (localhost [127.0.0.1])
	by pcnci.linuxbox.cz (8.18.1/8.15.2) with ESMTPS id 695JPue52387525
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 5 Oct 2026 21:25:58 +0200
Date: Mon, 5 Oct 2026 21:25:56 +0200
From: Nikola Ciprich <nikola.ciprich@linuxbox.cz>
To: David Laight <david.laight.linux@gmail.com>
Cc: Rik van Riel <riel@surriel.com>, ljs@kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
        david@kernel.org, Mike Rapoport <rppt@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Pedro Falcato <pfalcato@suse.de>, Kiryl Shutsemau <kas@kernel.org>,
        luizcap@redhat.com, pbonzini@redhat.com,
        Borislav Petkov <bp@alien8.de>, Tal Zussman <tz2294@columbia.edu>,
        Matt Fleming <matt@readmodwrite.com>,
        Nikola Ciprich <nikola.ciprich@linuxbox.cz>
Subject: Re: hunting memory corruption bug in 6.18.x
Message-ID: <asP5xK4axiUk7jun@pcnci.linuxbox.cz>
References: <arwNebjYXyGqrp32@pcnci.linuxbox.cz>
 <arzRBv9ceJsxJppI@gremlin>
 <ar1Xl7PE2rcoT9h3@pcnci.linuxbox.cz>
 <ar63St2LBfCdyhwj@pcnci.linuxbox.cz>
 <ar9yRqq6cBxHDWKA@gremlin>
 <ar/F6+OUzj8qQ8YC@pcnci.linuxbox.cz>
 <asAE3kLFDUx5v0Nw@gremlin>
 <asKdhWiJb3qXeopz@pcnci.linuxbox.cz>
 <bd8e9b01ad88cafb12da33331f32a1ce315f590b.camel@surriel.com>
 <20261005132113.43548696@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261005132113.43548696@pumpkin>
X-Scanned-By: MIMEDefang 3.7.1 on 10.76.66.3
X-Scanned-By: MIMEDefang v3.7.1/SpamAssassin v4.000002 on lbxovapx9 (nik)
X-Scanned-By: MIMEDefang 2.86 on 10.76.66.10
X-Antivirus: on lbxovapx9 by Antivirus 
X-Spam-Score: N/A (trusted relay)
X-Milter-Copy-Status: O



> > > 10371fa400: fffffff0c930020
> > > 10371fa420: fffffff0c930020
> > > 10371fa430: fffffff0c930020
> > > 10371fa450: fffffff0c930020  
> > 
> > These are not random offsets in the page, either.
> > 
> > These all seem to be at offsets 0, 0x20, 0x30, 0x40, or 0x50 into the page.
> > 
> > If you look at the other addresses, are there any that are not at one of these
> > offsets?
> 
> If you hexdump the start of each page do they look 'similar' and are there
> any valid addresses that might point to other data and could help identify
> the what the memory was used for.

(again, I used AI to answer that, hopefully it does make sense...)

Yes to both. Results below.

Valid pointers in the crash frame (0x103360000):
Only two of the non-zero words in that page are valid kernel pointers; the
rest (e.g. 0xfffff86eb0c30000) are not in the direct-map or vmemmap ranges
(page_offset_base=0xffff985a80000000, vmemmap_base=0xfffff27140000000), so
they're data, not pointers. The two valid ones both resolve to the dentry
slab cache:

0xffff985caf209d48 -> dentry cache, object [ffff985caf209d40]
0xffff998c79483448 -> dentry cache, object [ffff998c79483440]

(Both slab pages show flags ...01 "locked".) So the dcache is in the blast
radius, same cache as the crashing __d_lookup.

The other value-bearing frames are NOT junk — they're a repeated structure:
Dumping the start of three of the frames the bad value appears in
(0x1ae234000, 0x24f0e2000, 0x342c40000), they are near-identical, a
fixed-format record. Field-by-field for the first 0x80 bytes:

off 1ae234000 24f0e2000 342c40000
+0x00 00ff00ff00100010 (same) (same) const
+0x08 bdcc802700060042 (same) (same) const
+0x10 0000000000006e43 (same) (same) const
+0x38 0bb8008000000000 (same) (same) const
+0x40 0000000117bc0000 (same) (same) const
+0x48 00000026813e0000 0000000fbb9be000 0000001b56718000 varies
+0x50 fffffc0ea76249a0 fffffc0ea76258c0 0007bb3a5e4ed461 varies
+0x58 0000000000001070 0000000000000906 0000000000000903 varies
+0x60 0000000003000200 (same) (same) const
+0x70 0000000000000078 (same) (same) const
+0xd0 ccccc30014894100 / 48cccccccccccccc (0xcc padding) const-ish

So: a constant header, a few varying fields at +0x48/+0x50/+0x58 (look like
a length/cookie/handle), and 0xcc padding. The same template appears in
physically-unrelated frames.

The corrupt value 0x0fffffff0c930020 appears deeper in this same structure
(page offsets 0x400/0x420/0x430/0x440/0x450), i.e. it is being written into
specific slots within this record format, not scattered randomly. That lines
up with the "written into one of ~6 slots" pattern: relative to a 0x400
base, occurrences are at +0x00 (x9), +0x20 (x9), +0x30 (x9), +0x40 (x2),
+0x50 (x11); none at +0x10.

Question: does anyone recognise this structure from its header? The constant
signature is:

+0x00: 0x00ff00ff00100010
+0x08: 0xbdcc802700060042
+0x10: 0x0000000000006e43
+0x38: 0x0bb8008000000000
+0x60: 0x0000000003000200
+0x70: 0x0000000000000078

I haven't positively identified the owning subsystem. Given the earlier
observation that these frames carry stale page_pool metadata in their struct
page (pp_magic set, pp_ref_count=0), a network/driver descriptor or buffer
origin is my guess, but that's only a guess — the header bytes should be
recognisable to someone who knows the relevant format.

Happy to dump more of any of these frames, or struct page for them, if
useful.


Field decode of the constant header (little-endian sub-fields), in case the
layout helps identify it:

+0x00 u16: 0x0010, 0x0010, 0x00ff, 0x00ff (counts/markers?)
+0x08 u16: 0x0042, 0x0006, 0x8027, 0xbdcc
+0x10 0x6e43 (bytes 'C','n') (signature?)
+0x38 0x0080=128, 0x0bb8=3000 (size/timeout?)
+0x58 small, varies: 0x1070 / 0x906 / 0x903 (length/seq?)
+0x60 0x0200=512, 0x0300=768
+0x70 0x78=120 (sub-struct size?)
+0x48 varies: looks like a 64-bit addr/DMA handle
+0x50 varies: 0xfffffc0e........ (two frames) (per-cpu/fixmap/IOVA-shaped,
not a direct-map/vmemmap ptr)
+0xd0 0xcc padding (record built in 0xcc-poisoned buffer)

I can't identify the owning struct from this. If anyone wants to grep: the
first two u64s (0x00ff00ff00100010, 0xbdcc802700060042) are a distinctive
constant signature across all affected frames.

BR

nik



> 
> David
>  
> > 
> > If this is a case of "system writes fffffff0c930020 into one of 6 slots",
> > there could be some at offset 0x10 too.
> > 
> > I'm having AI comb the kernel now for places where we could conceivably
> > construct this value, and write it into one out of 6 slots.
> > 
> > >   
> 
> 

-- 
Ing. Nikola CIPRICH
technický ředitel

+420 591 166 214
+420 777 093 799
nikola.ciprich@linuxbox.cz

www.linuxbox.cz
