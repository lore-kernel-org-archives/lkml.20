Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794877403;
	b=GL+QnAh4vgk98/M92RpXG3F4smwSKLnNdl5JSZgu/POXsPHKoc6AEw+eUH7uDNyeFz83
	 NpPRPiU55YyGxuIsJ0WT+U+wNZt/XtVuv68VJcCK+fAHGXge3Kq79GFXeWhNqNOUJtMMg
	 7ZC5Ve7IaFc5SRySSDDyV8lj64DF6t52pb87o4busNXabHIit5Vf4/bkl7NDnl7o7Ctw2
	 9l+0Bvh7N7gWUkeI5utmKUxlNlKSoUsJHRQ9zoHki3dKWTtygBC5ZESKIxcjDFrfdIh4o
	 1SJho13ZnXUJG5/+t7zirJmtvMdtkZ0jHw9S2/i8iXkgLq2F9q/2oyE68xQCP8sT96Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794877403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Q8xRj1Homj/VTvTcbwqPDSEFGebgrQcuNK0zuIg1sPk=;
	b=erbSBlkkwVPssQoDihbggoIsYXCfUePq3Xbe3SeXjd0Y1XI4BE2WFVPDfFrpIl3DeRy3
	 zpCm/WyfkGmWoEf2ruXAcYgOLaDNBCjaiqutWt7HIlbxXEbXZl9szbuVoCdl02Ti3WpVp
	 qq9lC7RCRnY6+B9mfashk/3mEss7gziGIFm9WiQ4wTvoycaO1o0PBWbsXWT1JCr7OxSIs
	 uGliN59jCgaIWKBdMNvpUGyFLyYAEahOylWZtmTEzbBYur/n/f9GMO2rWknBmIRWCcGGb
	 N9jCe1hKZHL/vTE//nhbMDeWt9/DGsB0foSL/VpeWOmapWwlhmmOgneEYSb2AwTtyfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zJgeIx0L;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55990606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55990606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zJgeIx0L
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-372bdb942dbso3675154eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794877402; x=1795482202; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q8xRj1Homj/VTvTcbwqPDSEFGebgrQcuNK0zuIg1sPk=;
        b=zJgeIx0LaMdjhlYxD44HyALbgxnMk5ITiG4INp5yFDEwqxAKQ+Z8mvUgt5EsSdyRs0
         lI1uKVfXkO708gLETJaKoa1H3CiDaud+DPFQfGbjsyItoU2lgI+KHOZVVY0K+KofEH3P
         ApZwfeR/Ztxp66cQrrBeLG8UVTAH0r+k/K6Ik315R2cLgvmFqGGT8T6BPfl/pD1wsC3o
         lYOynhbKvUpSzHjObYwLSnc4z9D6qVHU3T8aC2OWs/cpOOw9OFgjYqq4ScVLsVayQryl
         XX6XVJlMQSCN39AZW95ptzrCuH12WNOv0iGe2scA8v40QbNv7pTWecagE+tq2JRMqwqL
         t4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794877402; x=1795482202;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q8xRj1Homj/VTvTcbwqPDSEFGebgrQcuNK0zuIg1sPk=;
        b=yNzkowXNVIkbYpUXiWatOOLfP6hhgEaQDcqBGWOML27QILB1abGNwpTfI7uOyQCSNY
         UXwbYYayS2nseZGk7AWw2sptC9DysPDU8/OhBWU3lCIOTkimB2QjieUcLZ+YelQNAhuT
         4+oQG6Q2wRPJUSRkP2uCcsbC+EmHFHz5g9w8FMcYOQwGdobr6WFWN2VnxWCGQgh3oqC3
         Ng6s9MZW4Wk4J1c/PuwWpiKHovgfVuk1Sdor54KByPiv+2a1mPJ0/Be34mj1+Eblmm7Z
         CVvHjJAj92+RClJl/8YO90OHjtAgucaguW38s6rYggT8UTWGMn7sFi2VilqhrFxdIxje
         2IgA==
X-Forwarded-Encrypted: i=1; AL+hErGwMB60oXUb7DAKxmxGheDZqt4H8pdJ2Fw5iAfVikXDcS5NPCsTXCo/Chn4AipKQQXP+E8gIx7Mx1fzLxM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1AhhB9FXmnN8479acKY4S4D24ZATTbmkE5w10nIO1uzGq9w+5
	gqx3HswLjx5YL7RyQ+BOo8XIn8mNrS2vAmHEVx919eTWJvd/FA1tbJk3
X-Gm-Gg: AYBFou15t6vakJQgQt65TRwIzwA9K/yPITrMPiUySIWbV4xeX+4UEPVstObk1goBuyt
	TmqbSo97eAY8uzvPl7kI4hn9oCGRM857Jw8KVgKyq47VQQ5Nwc/6DvdyaS4mtKMkUrRuyk7TZeH
	MNCGY8YlkOxT/OO1l1Ai/ERt3vORWg/nCmr7wkkatGtFdWs0R7ZTH5ydfDRhR1qYkbOl6IDjvUA
	xOF2wqA08Dr+bVpZMRyJre90WJVJdcB+PPvzhUe40RTrEZyRyoUUx2sNOEBqKnYkcw40YORiPEi
	IRfmwl3EurWoO02CeFHikmC4ovbpviBEE+s4eHQAMNkZSj3U538WbF+T/K+jvAK1CjZx5RcV8P4
	Hw+CT+4iPTXc/5S22cQuwvqIBqQ1/SAjqNq1Gz56WCT2SFFu/+H18uqD5iMwank4HLcqWfqPJWA
	0VMVwvJWGpfPgcQNQ7WL9sUaQ8FcPnuHKHGfZ1Hv3Z+c8N49JgZTv3CfJvrejD+6t7qyn4ZGqz/
	oYpmBt91mM3g74NAbOG/30eJq5d3EQzWS86CEKgD1Uz50972iONhtz8Td1REZ9WVgC9j6N/f8YM
	QYd8ZtXqhDEIMIVFzEWJhewgC86THssuqA==
X-Received: by 2002:a05:7300:cc9c:b0:371:5cb0:4929 with SMTP id 5a478bee46e88-37967dd4c20mr11790852eec.25.1794877402316;
        Mon, 16 Nov 2026 17:03:22 -0800 (PST)
Received: from localhost ([115.99.200.166])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955822d58sm37778195eec.10.2026.11.16.17.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 17:03:21 -0800 (PST)
Date: Tue, 17 Nov 2026 06:33:19 +0530
From: Shaikh Kamaluddin <shaikhkamal2012@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Davidlohr Bueso <dave@stgolabs.net>, Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dan Williams <djbw@kernel.org>, Miaohe Lin <linmiaohe@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Breno Leitao <leitao@debian.org>, Ira Weiny <iweiny@kernel.org>,
	Li Ming <ming.li@zohomail.com>, Richard Cheng <icheng@nvidia.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
	linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Kiryl Shutsemau <kas@kernel.org>, Harry Yoo <harry@kernel.org>
Subject: Re: [RFC PATCH 2/5] cxl/region: Factor decoder poison-list retrieval
Message-ID: <avun1x_x1UK2yWjL@acer-nitro-anv15-41>
References: <20261010162017.62506-1-shaikhkamal2012@gmail.com>
 <20261010162017.62506-3-shaikhkamal2012@gmail.com>
 <20261016232103.6497bbb2@jic23-hlaptop>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261016232103.6497bbb2@jic23-hlaptop>

On Fri, Oct 16, 2026 at 11:21:03PM +0100, Jonathan Cameron wrote:
> On Sat, 10 Oct 2026 21:50:10 +0530
> Shaikh Kamaluddin <shaikhkamal2012@gmail.com> wrote:
> 
> > poison_by_decoder() performs two different operations: it queries an
> > unmapped DPA gap preceding an endpoint decoder, then queries the DPA
> > resource assigned to that decoder and its region.
> > 
> > Factor the second operation into cxl_get_poison_by_decoder(). Give the
> > helper an optional snapshot so a later region-probe caller can retain
> > records from exactly one mapped decoder. Keep the existing endpoint
> > walk, skipped-DPA queries, partition-tail queries, -EFAULT handling, and
> > trace behavior unchanged.
> > 
> > Signed-off-by: Shaikh Kamaluddin <shaikhkamal2012@gmail.com>
> > ---
> >  drivers/cxl/core/region.c | 41 ++++++++++++++++++++++++++++++++++-----
> >  1 file changed, 36 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/cxl/core/region.c b/drivers/cxl/core/region.c
> > index 75b8092e6dc2..c72524923b38 100644
> > --- a/drivers/cxl/core/region.c
> > +++ b/drivers/cxl/core/region.c
> > @@ -2940,6 +2940,40 @@ static int cxl_get_poison_unmapped(struct cxl_memdev *cxlmd,
> >  	return rc;
> >  }
> >

Hi Jonathan,

> > +enum cxl_poison_query_policy {
> > +	CXL_POISON_QUERY_DIAGNOSTIC,
> > +	CXL_POISON_QUERY_PREONLINE,
> 
> For now, perhaps focus on flags defining what you want done, not when the
> query is happening.
>

Make sense. I will drop the enum. The snapshot argument already tells
the helper what to do: NULL for trace path, a snapshot for region probe.
The helpler will return the error unchanged and each caller will handle
-EFAULT itself, as poison_by_decoder() does today.

> > +};
> > +
> > +static int cxl_get_poison_by_decoder(struct cxl_endpoint_decoder *cxled,
> > +				     struct cxl_poison_snapshot *snapshot,
> > +				     enum cxl_poison_query_policy policy)
> > +{
> > +	struct cxl_memdev *cxlmd = cxled_to_memdev(cxled);
> > +	struct cxl_dev_state *cxlds = cxlmd->cxlds;
> > +	enum cxl_partition_mode mode;
> > +	u64 offset, length;
> > +	int rc;
> > +
> > +	if (!cxled->dpa_res)
> > +		return 0;
> > +
> > +	mode = cxlds->part[cxled->part].mode;
> > +	offset = cxled->dpa_res->start;
> > +	length = resource_size(cxled->dpa_res);
> > +	if (snapshot)
> > +		rc = cxl_mem_get_poison_snapshot(cxlmd, offset, length,
> > +						 cxled->cxld.region, snapshot);
> > +	else
> > +		rc = cxl_mem_get_poison(cxlmd, offset, length,
> > +					cxled->cxld.region);
> > +
> > +	if (rc == -EFAULT && mode == CXL_PARTMODE_RAM &&
> > +	    policy == CXL_POISON_QUERY_DIAGNOSTIC)
> 
> This is becoming odd enough I'd add some comments saying why
> we are eating the error return.
> 

Will add one. A device that keeps no poison list for volatile ranges
returns Invalid Physical address for them (CXL r3.2 8.2.9.8.4.1) which
comes back as -EFAULT. The trace path treats that as "no records"
instead of failing the whole walk.

> > +		rc = 0;
> > +	return rc;
> > +}
> > +
> >  static int poison_by_decoder(struct device *dev, void *arg)
> >  {
> >  	struct cxl_poison_context *ctx = arg;
> > @@ -2971,11 +3005,8 @@ static int poison_by_decoder(struct device *dev, void *arg)
> >  			return rc;
> >  	}
> >  
> > -	offset = cxled->dpa_res->start;
> > -	length = cxled->dpa_res->end - offset + 1;
> > -	rc = cxl_mem_get_poison(cxlmd, offset, length, cxled->cxld.region);
> > -	if (rc == -EFAULT && mode == CXL_PARTMODE_RAM)
> > -		rc = 0;
> > +	rc = cxl_get_poison_by_decoder(cxled, NULL,
> > +				       CXL_POISON_QUERY_DIAGNOSTIC);
> >  	if (rc)
> >  		return rc;
> >  
> 
