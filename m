Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECE62CCC5
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 01:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789869195; cv=none; b=Rx40hUGnGqYofkRRCj/BLUOD8NxI1LX4X5AK4KKeaCqhrDeOu/GG6Rhxa7gQJOG0gC8qu6RiRrg7hxlkmUghnz+Vc+c2JTflCg6SoGsQ/1VgsUw2K+J/GHmkakJSPc7eXz8H1cd3JzdsQMVALSWw07bvo6jPQRIJsKS5tiMjYX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789869195; c=relaxed/simple;
	bh=CNs2E+qGO/+zrUl6drj1OWrYKFws96jmgTMzhakpZVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cXgR6sUmFDi2of+BmvOB9M8nXK7ucanZlbe43+LydHXK9LdfUW1Fx8tXc3OMmTDT4hPI7yWBPADKDAy0bmFu/lVx/jx9+Qt4jXzGZUuH3W/kU0XGnSPbWKFQByisqZJj3USCuGpX3Wurtb40u4fScplzbAscq+ZYqXygOMUfITk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=t+brCQIh; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="t+brCQIh"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-910531ea7feso19659496d6.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 18:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789869193; x=1790473993; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3IyWi76YFd5k6sT6Wel/JshxFvWpuBbjBUhku/DcG8Y=;
        b=t+brCQIhIf9oq2CfCLZb1EBKwtMgyN5Bq8cx90tuIXlNI4bBv7WMP1zwHQLMo+S5pm
         1aVFrqPYQXnRchsLGBrw6B3vsQqQN1ynKuEu7MBuxw8fqk9bGJiOFZznWZE6BC0ms+XT
         oedfr7MaAOJFWXOlmrPTqXFVXbgFhXXzgDA4nYhJseR8NvPB5qKWaX3DrgbpLGD/5XLO
         GUyLJsb1pZ4xfFn7zsl/qln9eaD+d1x9hCD8+2iwA1X4LMx0dVQZoAsM4MywaRfWvCBj
         sUfdnxS0dpe8LiegjaNF/Amr1bJMEyjK5KP0ANEPtO0AyZc8bBEr2RMuNcD91gs4tqY7
         ATWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789869193; x=1790473993;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3IyWi76YFd5k6sT6Wel/JshxFvWpuBbjBUhku/DcG8Y=;
        b=Vo0dmKX9dbI+hefwouCBNjDQan4U6GnI3APifDn6RmMupMBgnYc2nmJCGwmeVvL1gn
         4vMdTtQb87v96OGhysDDWxgpcLNQb/AGlW8HYQDJ5a2/VryA2WQ0ogLFNQQ44hfa1/NG
         mqDjMgBX4HCq1IuaA0T/JIYtlx/SLLagw+J3v8DbgYwxZ1AWYkJo9/+ftWrCyDz/EECq
         xe5nEaUqWzDn+ho3Qmdr9bYzooPhNlpKWOeBOHFR0zPmw/Km5DaM00nZtaDx3zOocy61
         KjUugpuV9u7hgHl283TLHUThbZt7z6BqI73gyIT7VH/Jo9gAVs5LDuN8fYIc+9SVg5ux
         g79Q==
X-Forwarded-Encrypted: i=1; AKwUvBxVQUP1GUS5b8atr/Gf9OVNSSbDm7JABKQbZML9OE082MuEym9dXe4hvlLcXdZDguyP1pFnYHm9n5YGqtE=@vger.kernel.org
X-Gm-Message-State: AFuF++kNQ0DTELa5x1qOuNLuCWAFNyneEeXxgEKxN4Vgzm/zM24yFaBF
	jJNFiWGfMlphjoWADkkaPPSqm6ppUYl+pOuHlvjeSgoMMPmV6OBUUJeGEsvB2cSIWds=
X-Gm-Gg: AYBFou1Cwv3PQS7xZp9a7SL046qGdWTUV9Z/CiswZxWhnT1K4BQ1KZJAhFVsKTIssVg
	rRsNUwd44aaYy+bC/Wz6X75n9jC6UQ3QP3A3Bj88s0DXWvxCVdukBPHRFwxyTGIxymvzJl0/K1U
	UPUPeAJLdmDjXce5f0mLiH8uPOKhfVM3DRiWJR2UeYhHfMMjLrzOsEPc5M3WNchNgNLux7r6FZ0
	POJFA2lzI2iVyqHrvnXioh7L9nmCIxPQXMkDCTX/0uz2fxLRoSEHcIHn12lyKdblDgj9zfxBRkC
	fNuya5KURgtSvMnXmhwAApAlBYsKXQXtyQeoo5pTNHqRJDvZPBqYKdCSEW+ba9F3cEMFmfrre9X
	NgqOhrr9UN4q4WlLwb3lzqRkytZoYy9WLptCmklBOyc0UH9TTny0wznOWr9coVfNtX/W/9/29S0
	C14qOJNm+YAlw4CISWblDw/JTxPxclIvJ1tpJx0c5sZD2J7LUl7zHyqyY1NgYkt9q8E9pdsLX8a
	JSjJ9bQXU+JGzn4ZlPeCEEROIZFa5bcFHGprnae9U8iz0a87KRF2DE=
X-Received: by 2002:ad4:5948:0:b0:910:4da6:8354 with SMTP id 6a1803df08f44-9129c780d08mr44342896d6.17.1789869193050;
        Sat, 19 Sep 2026 18:53:13 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260a9a305sm32833856d6.37.2026.09.19.18.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 18:53:12 -0700 (PDT)
Date: Sat, 19 Sep 2026 21:53:10 -0400
From: Gregory Price <gourry@gourry.net>
To: Chris Li <chrisl@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, 
	Baoquan He <baoquan.he@linux.dev>, Nhat Pham <nphamcs@gmail.com>, Kairui Song <kasong@tencent.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Barry Song <baohua@kernel.org>, 
	YoungJun Park <youngjun.park@lge.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren =?utf-8?B?QmFnaGRhc2FyeWFu77+8?= <surenb@google.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Rik van Riel <riel@surriel.com>, Wenchao Hao <haowenchao22@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Kunwu Chan <kunwu.chan@linux.dev>, Meta kernel team <kernel-team@meta.com>, 
	Linux Memory Management List <linux-mm@kvack.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Kairui Song <ryncsn@gmail.com>, Joshua Hahn <joshua.hahnjy@gmail.com>
Subject: Re: Path forward for Virtualized Swap?
Message-ID: <aq8dja2-timYBwyB@gourry-fedora-PF4VCD3F>
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <aqJXx2vtbKaRLt3x@fedora>
 <aqLi6cIjD2wJwk0B@cmpxchg.org>
 <CACePvbUG1ApMzMdEzf-63rpjgGVNsRk21pT72OQGJpM=OtRUew@mail.gmail.com>
 <aq6cVXPLUUwJA7-2@gourry-fedora-PF4VCD3F>
 <CACePvbVaPDnva8X-Xmz84r7j5HjTuih-w5phpw7cerK2uPnK6w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACePvbVaPDnva8X-Xmz84r7j5HjTuih-w5phpw7cerK2uPnK6w@mail.gmail.com>

On Sat, Sep 19, 2026 at 09:02:28AM -1000, Chris Li wrote:
> On Sat, Sep 19, 2026 at 6:08 AM Gregory Price <gourry@gourry.net> wrote:
> >
> >                         Memory Post-Compression
> >  |[CD][CD][CD][CD][CD][CD][CD][CD]-------- free space ------------|
> >    ^----------------------------^
> >          Compression Space
> 
> Thanks for the explanation. So the compression space is just the
> actual data store backing the zswap/xswap/zram.

No.  That is not what I said.

I said 

   It's the *amount* of memory consumed by compressed data,
         including the metadata associated with it.

I do not know how to be clearer than this. It is an amount of memory.

It is not the memory itself or an abstraction to describe how much
memory, it is literally the active amount of consumption - a number.

> Maybe we need a separate counter to track actual memory usage,
> regardless of compression status.

the separate counter is... the existing memory and zswap counters.

> I want to add support for your usage case as well. Please clearly
> specify what user usage you want, what the expected outcome
> is, and why you want that.
> 

I want:

  1) zswap on machines with no swapfile

  2) without being asked "how big?" - there is no number I can give
     that stays correct, and

  3) the bound should be the memory limit that already exists,
     not a number guessed at boot that hotplug invalidates or
     guessed at swapon time that different workloads invalidate.

This requires decoupling swap *file* accounting from zswap accounting.

~Gregory
