Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0DB22D7A9
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789961402; cv=none; b=O1lNx9y7whOnbcOOom/yrBI34sKc7h0GU9IY8yeLRiXrprmbK+bLIH7fsLC47qLlHf6B44d2QacNGS6ybwHsRGe0I1A11GgeZI1plPTkmhiAQRzfDMWzYhd3ZlT7r9/OILsOa1lBQbxaE9I8VkFQvdOBWwUgUONtPizX0KW2JPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789961402; c=relaxed/simple;
	bh=tHUYK0nDBUMFLT2NCanIpdqGAgNC478FK1eCjuiQQWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oi2LOovT2y+5AwpHrdFykg0ZtkD3JBsEicW/v7ffF8JOclYPCwJ4z7y5ppWBEPa/M/3UilX+7vHp1k3m7pAohjNsnlycuXHhl339lMvTERFRuyPL0el+BchhkizH9MQctZ9KhvGELCcq5q5wmg6LiJcGnlWJebisnup/3sZEO2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=G73Y8qHS; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="G73Y8qHS"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910a0cefaso229795785a.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 20:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789961399; x=1790566199; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ycUlz7DSy4nva9AM8PqQHd06zeVWx1ZyueB3ugH+fHQ=;
        b=G73Y8qHS+k6hi/84WwjPKNcdSJrVhXvaQDlpAsBXsHdO4ttx5ikcFxMLiYY7uLibyq
         laOcRZJaP2jnozGNGJw9w8OftwbValaRvWSnHave80l9NBViKPEo5Dd8mD/cgz4wTS0F
         bZ6hUY4NDWFiIW1O/Wd3Q1Vu/y4mIbxpzfRirGWm9jq1kC4UY63tyMwAiN65knS16A6w
         AupkI+vOmb6H73nWOHLiVodNKZ9OMlkHAVCPjgtHtpieCpBpqB1+jwQ31RmBSRnEH5Au
         QdWEYHX9TI7iL164hOxuTV5fEiycoMtMU9sRVG/ukUYP3H/OhJBVHWS5O/ak8s8c8PZ7
         mBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789961399; x=1790566199;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ycUlz7DSy4nva9AM8PqQHd06zeVWx1ZyueB3ugH+fHQ=;
        b=rmTOaYK1I+iQappqlePZuEio/GLvBKy0/JVUe8KopKcDioaweUqn1MBGUmqD42+9dE
         q74lNX4kpn/uAvglHq+5Lo7Zv9JsacZu8spwLmMEupz2JVsEugCMq1XyOI2oK/aguBJv
         DFvBs34N17z84DIQvSN+P90uUm6aMJV2Nh2NWDQrP4npGFqq4Zp8K5uTtJ4qw+JNxwru
         syaNczmaJT3oZtDXfI7fANGy/PioaeqE5etFAGE7VnEpLY71vHRGY/EjPA4Flc3zWRa/
         rRFmJwYCMAXMa4mO2VkNoqSD2FDLQcOL7dQQ8vhk4cR2laIZ5HARu/Ghw3h9Ww/iGCIk
         ZnTA==
X-Forwarded-Encrypted: i=1; AKwUvBwp0xljw1dotZQIUWsjhYty6tNrWUvUeZ3qLt7JZxipYlczEjdxpq8k0VI+x+U/eblZBRzcS1OXnr1u2WQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l7n9b29nVpLOAGou8Og8cNIiJ3JTtie3PrjEyKQ+2rLL3ThJVB
	QEMxJSaOqIB7JEK47w+n03IGDkMjQjiKj15y+OGL5BVLf8MKRMjyV8OUfXxIg/AQsDk=
X-Gm-Gg: AYBFou23ZHAGEuZPW59JbDHkyzE2yqxkw76lGfJaDLS8/hDRCKs9/ngkJSTt7HV4qlb
	Uu7wv2hw9a0/Hn2wFFit+3JSN5H8tNF1ViKslW52fFFa5ixV4uX47O+X+JFDGW5DD7B86supNrd
	CKQbhwJmpcFKSiVC4aOyic8qFnbc4XR3tcStU7/rAlIU6pNIl29sZAarOgPyL9ziPCvGv8FKuuI
	uqp3vtzzDFsDnwQ5SItvfJmuGxQF0XUhztDhmkbo/IbptEL4ASMgcEw8ECrIIzw5293ihnDbap6
	mOhTKfoOwuef/om9cM6iQlDbzAfJe3xDD0lchKMNYTOrMhI3+elwPn7a7yxC6HBhFHjwxGDBOmE
	Xqhpr/I8eHUDwitr2wCVxT3pYxnFggYBFrJyZ4qn4YhtDv/wOqCRJpH2xmtVR6825bp64Fc2K4N
	OA4cTFgaJg/1whU/Lc5TwGlwz7Zr8UgIP55kYEqCziv8/Ywd6Fs+NWBBQm155OLvuW2yRC2dLGy
	FsGFhlCroc/xHWx5/quYhJj6Hpmm0nQdUd1PD4p0JO1n0CAjAINtn0=
X-Received: by 2002:a05:620a:28d3:b0:939:1d67:2231 with SMTP id af79cd13be357-93bf56f85fbmr786905685a.34.1789961399140;
        Sun, 20 Sep 2026 20:29:59 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93bedaaf901sm553769785a.21.2026.09.20.20.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 20:29:58 -0700 (PDT)
Date: Sun, 20 Sep 2026 23:29:55 -0400
From: Gregory Price <gourry@gourry.net>
To: Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	brendan.jackman@linux.dev, hannes@cmpxchg.org
Subject: Re: [PATCH v2 2/2] mm/page_alloc: refactor build_node_zonelist() out
 of build_zonelists()
Message-ID: <arCeH_aD5PUM1tNE@gourry-fedora-PF4VCD3F>
References: <20260912030424.2889731-1-gourry@gourry.net>
 <20260912030424.2889731-3-gourry@gourry.net>
 <DLKNHNP6LH59.3MEEBCAJGFEVK@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLKNHNP6LH59.3MEEBCAJGFEVK@nvidia.com>

On Sun, Sep 20, 2026 at 10:49:05PM -0400, Zi Yan wrote:
> On Fri Sep 11, 2026 at 11:04 PM EDT, Gregory Price wrote:
> > +static void build_node_zonelist(pg_data_t *pgdat, const nodemask_t *candidates,
> > +				int zlidx)
> >  {
> > -	static int node_order[MAX_NUMNODES];
> > -	int node, nr_nodes = 0;
> > +	struct zoneref *zonerefs = pgdat->node_zonelists[zlidx]._zonerefs;
> 
> Why does build_node_zonelist() need to have a new zlidx instead of using
> ZONELIST_FALLBACK like build_zonelists_in_node_order() did?
> 

The intent is to build new zonelist over a set of candidate nodes, and
it's also just clearer: build ZONELIST_FALLBACK from N_MEMORY.

With this we get:

build_node_zonelists(pgdat, &node_states[N_MEMORY_COMMON], ZONELIST_FALLBACK);
build_node_zonelists(pgdat, &node_states[N_MEMORY], ZONELIST_PRIVATE);
#ifdef PAGEALLOC_KTEST
nodemask_andnot(&private_only, &node_states[N_MEMORY],
		&node_states[N_MEMORY_COMMON]
build_node_zonelists(pgdat, &private_only, ZONELIST_KTEST);
#endif 


> > +static void build_zonelists(pg_data_t *pgdat)
> > +{
> > +	build_node_zonelist(pgdat, &node_states[N_MEMORY], ZONELIST_FALLBACK);
> > +	build_thisnode_zonelists(pgdat);
> 
> If build_thisnode_zonelists() means ZONELIST_NOFALLBACK, why
> cannot build_node_zonelist() imply ZONELIST_FALLBACK?
> 

thisnode actually means ZONELIST_X+1 as opposed to ZONELIST_NOFALLBACK.

Since folks are adamant about not allowing another GFP flag for zonelist
selection (beyond GFP_THISNODE), the result of this is that all future
zonelist additions must carry a FALLBACK + NOFALLBACK variant.

The question you actually want to ask is why build_thisnode_zonelists()
even exists - it should be part of build_node_zonelist()

I can probably follow up this series by just folding eveything into

/* build zlidx and zlidx+1 (nofallback) */
build_node_zonelists(pgdat, candidates, zlidx);

And add a BUILD_ON_BUG/ASSERT that forces any CONFIG_NUMA to have
balanced zonelist additions.

But I don't think it's strictly necessary for any of this, and we're
just shuffling code from one place to another.  Probably I can just add
that improvement when we add the next zonelist.  In the meantime - this
makes it easier to add new zonelists as-is (and just makes the code more
readable).

~Gregory
