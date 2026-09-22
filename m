Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E425345EA7
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790038925; cv=none; b=EkvY0OKSqrMlUc4+FX52TeRaq8lImzcHP3TMwxg3tx/53T862T6TPbNDsCD3JgEatJGszrNZdFWc9OA4pSPcQZuqBoA4W50htB6iSmoKmOBAuBCdM7mRMRSPzROUK8kTiglbuDUmoNHDg3AsCFxKaPIP2wRIdzDBwtsTpZLTp2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790038925; c=relaxed/simple;
	bh=+Z4LkBFlt3A1rZH1ifm/ueQakuWEuyaVDA0hyJTdgzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aE89ACK963ilU99mj7gtUPqOCZfNBAnaq4+XepWTQDpVe/Yy1GfJ6g9uGA09WukTIHOgUScwSBlZ2lsD96cezXj7YHs/vTS2LAKOu8Sw0WKgjYoh2lu0k6oIsb2Gx4q9PUFHxJrlf7Ks7tMY9dH2lfxm9JXmtuuPkHsb+B22xyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=sp+Wv+P+; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="sp+Wv+P+"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-5329fc7e0bcso41675661cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790038922; x=1790643722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=88TeD9vXDrKYbs/Tr89klO5h2tOaiUe/TfsMlOHrFjA=;
        b=sp+Wv+P+sagqIQJY+FJ/SLCaIqSucImXodL8M4fXcKidglpT07RmaokE1bnoAdj/Tk
         qalzRgCdi0WQ+ex1dezlZ+o+pKTLgtr3VP621A6kCrjm/7s6NujPgtytIeelL2HQehIZ
         9iKMD7/q9JOJJ97KlJMdyKnn5/jq5wAowg0XhDgpAoynsrs0A5u7Y913GtqplMGL4KDg
         0vjqCVc5oKgh71a8wea4XN5yBENm0Et2Lycy+tRibV2a/m31cXWGqqOvLICdkH8Rrmyr
         +eBEJVNetxYUWjtgSaRThe4kGf2UabV5gJcZRMXMjvxTS4Bw+PVa9VyIpAQnKi+5Nb3v
         17aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790038922; x=1790643722;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=88TeD9vXDrKYbs/Tr89klO5h2tOaiUe/TfsMlOHrFjA=;
        b=rC4Qp1Ro8gcsmoT3ygSKZ9ppisSTAYQJN0bHlW5i+de7nXnSaNiiipw/DLM2P5ADDf
         HQ8htAjYSzERBABaCvbG/tMsM+yGFBsCHES9Y7FDbj5XIEta9JDhqPHdSmFV5kjsM8c6
         7ymjn+/85kBd54V+fD6r0PwH5TYqyHv7SY7BQ5HWT/QzoHpUej8z8J6SpAIe4fdcPdba
         NJinZoF8mE58PcHBKQBhYvDAtrNp7x5kccyv1qqsdthf8R9aUQpgLZNMVn6n/TP/s1eM
         Dlx5XqrKjlkrZqXeykOjTMR34Q63Y+5/UXyX05AD2koIdqx1sqUoF2W76HeyS2mBC05u
         YovA==
X-Forwarded-Encrypted: i=1; AKwUvByM6+fFbh4HnJdphpa7HaGWL5NHwWwA2yeLlU1ZcJx5GISFSGcC/tMQfKrAq/wC/r0BN/N7JKTZgiON7nM=@vger.kernel.org
X-Gm-Message-State: AFuF++lcWOje+AAq+G6LFCzecZyAchmN5oGAo8DoqqsR5q8z+IVxVQ31
	aZQG8EvP/Wd2f4J08zkufhe852kBrz2shHsMFa8xQCeIptYsAPsqna3lWO8bG7Q49II=
X-Gm-Gg: AYBFou39OAdz+RRp2nMqaD8+Rku9u0RNqYzOUP6uzVmplgJE56aAlxOlNFmNNBal9IM
	AkRYvKT5imRvmoLzTpCCU59+UfX6fCsOtzL0w+nmuByPbiZHUtOG8mQRUCdpodNQDjTbqe9w2L/
	N2hJNy8fmeQJdtIz1Vop/ghAOM2qTswNeE9Hru1q3qRN7IvaTWdZhaizvP4KG4nQzcmt7dqBlbn
	gJ9QI8KapfabbQEm2lzkDdtS+RF35ynxRcG+QNIJJOL98qB6TvtNMEqUwIpM+7PqxxEWnDMqAH8
	FC4OAok0WaXOGvuUd6qFXLlAQTXbgRCQXJGv5suOh5KzXkC97Fma+n6kFUJvMBa3LGA97KRC8fC
	KSYASpYnxNVIuzjcfPd6/D1PWp6Cqc+JM0TooGE4k2XfsE0Vb/H8UK0BVi4JRdBZQq2nRM/r+zY
	d2D8kC40uafsw7Fb3rp09pvc3mgldpN5lSCWhYkqpMSWkaEJ7cTW5swh80TLkil1bG+TsFmfE1W
	C2mjd97Z2FA+B2fDacnrPRhua0pBSXIDBHoF7JJLfhaG4THcA6lg28=
X-Received: by 2002:a05:620a:4803:b0:939:f5c4:ae5c with SMTP id af79cd13be357-93c15e5c4camr314965785a.43.1790038922471;
        Mon, 21 Sep 2026 18:02:02 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c1d17afcfsm6766585a.20.2026.09.21.18.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 18:02:02 -0700 (PDT)
Date: Mon, 21 Sep 2026 21:02:00 -0400
From: Gregory Price <gourry@gourry.net>
To: Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	brendan.jackman@linux.dev, hannes@cmpxchg.org
Subject: Re: [PATCH v2 2/2] mm/page_alloc: refactor build_node_zonelist() out
 of build_zonelists()
Message-ID: <arHS2anjIvS7v8w2@gourry-fedora-PF4VCD3F>
References: <20260912030424.2889731-1-gourry@gourry.net>
 <20260912030424.2889731-3-gourry@gourry.net>
 <DLKNHNP6LH59.3MEEBCAJGFEVK@nvidia.com>
 <arCeH_aD5PUM1tNE@gourry-fedora-PF4VCD3F>
 <C7A2977A-CDD8-4EEF-9448-A130411878B6@nvidia.com>
 <arFaiV9iVgxIsZ1g@gourry-fedora-PF4VCD3F>
 <72A76ED6-51F5-4A0B-B34F-C8F5416F640C@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72A76ED6-51F5-4A0B-B34F-C8F5416F640C@nvidia.com>

On Mon, Sep 21, 2026 at 07:58:38PM -0400, Zi Yan wrote:
> On 21 Sep 2026, at 12:38, Gregory Price wrote:
> 
> One more question. What prevents one adding
> build_node_zonelists(pgdat, &node_states[N_MEMORY], ZONELIST_FALLBACK)?
> Based on your above mapping, each of ZONELIST_* has its own candidate.
> 

Other than build_zonelist and build_node_zonelist being static functions
only reachable by page_alloc.c?

Nothing presently.  It could possibly be asserted.

~Gregory
