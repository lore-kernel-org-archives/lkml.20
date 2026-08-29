Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED2D412C17
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 18:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788028983; cv=none; b=qzklUDvO+E1b7cBEfJmX5f33D/dqzEL3TSDtLYb57+YqvJtRTofQsmTfO4w7XPFGjCvVgy1cEONDUewOfLvmOajrd/EtezsCXQ8kXtPrMUIYt5zzBAIx0qykG8DQKakTD2jaQYob3fSGIL1OSea54T+rYjZCE+nR1+YqTPL/xYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788028983; c=relaxed/simple;
	bh=8Gj2G76gEDUSTrJh9wyKhjlV0WDG+1riVaR0UmTV1c4=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=HwK/hcoRVGaEob6CRZc+K4ppkHMp7Rgf66c8F98aGIzHftBTS5rFvHrEwpNUIgdPKEWrnTtL7C68OGR2PSANCocUMQAwZJp7pjWixXle7HvXbbFRhHeodHCh0Lp54NSanH7z59NRRhp4Wu1Bl3NwJ+QKTCPshQkPqsJ8r8YDlaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=YaJycs+P; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=xJMFBU7G; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="YaJycs+P";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="xJMFBU7G"
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TIYsOh1917881
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 14:43:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=0bd5
	PAmYpGy8JaYT1BKzRh2l/HCvYP+lW1f+KIURCm8=; b=YaJycs+PgkXAxiEmTQzc
	x40/bpBx1OYZh241szBo3lKKjWsHNNTm/SUNCPAfRi3n/VvGgS3pPmiT6vJfeTeE
	GiYqlQAcB9LxnBFHNoESzb5esOccev9qrcQWHm0gEHQGot5RZ3TlnUHgTh1mlvDz
	d9N5rHFvicpTxBVJ1Kc7qEh1Y27NhJ6xXj8g377SAqIe5++so+krlfoZAvQs/gIU
	kCMT6z/E5NYAilPWjvHEyj6ymy4uPe3Gtsnyao6hjzXSseIMYastb0rZJFYPC+xh
	8rKV341s6RpP56zWTz8d8V831a4RBpe5IcA1BvubzOBoLFQUXRg3oy5g0dCR/q6W
	2A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gbqy7b0u4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 14:42:59 -0400 (EDT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52ff59f2c47so24280711cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 11:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788028979; x=1788633779; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0bd5PAmYpGy8JaYT1BKzRh2l/HCvYP+lW1f+KIURCm8=;
        b=xJMFBU7GQCayIbfE/cZMP8mwh0IfylQylrPhUpZBxmpVYi2RVGAjfDyeBsDEwx9xzd
         TfrpRpffrA/wJ6xl9pQYcSVBhmEKp9cDktrlyJojPzwSDh4OA40bIIK/lPQYNv4qiejL
         Ui4/zvXdVV1fseG53Y3bbx05exgxDw/IqliY8WXjDbo65O8jB2hu4kgVxZV9V+4phyKk
         1KyvFBv7Q8Oj9PIPcEy99NQJ6X0Y9HpYMDP1lDnhiAQc4uLTX1Y6+HABwvmdTv/BthEj
         quQK3NYVN5hBoiMWWqQpwMP+iIedprzIMuUaz/g9KiNUtGdZnLUjB709S9MnDJCQyu9H
         q9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788028979; x=1788633779;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0bd5PAmYpGy8JaYT1BKzRh2l/HCvYP+lW1f+KIURCm8=;
        b=m18ALIjWHrH4fJUCg8P+ge8gas001HhnWA7SiJ88p5gNK7xnC1H9K7zBYQC7aRYW3c
         JaMyd82bZkt7LDH8aBirGiWZvgUXa5+ee2dk30wteZKQTo1IKYwjuqhsgVrqUHHXSMTW
         i3bQLVGuWVgN5Hl/RRtdzyNd5rHwFLk61rS0XKvlqgjz9B7Zxu3a5bifxmAfDcfDR5Bq
         p3ApaNuHH4e2mBUmYllOE5bjr5unR8Xqm/gnYllLURoxlMoc7UkkAhzExTWpSUSPJm6O
         ZWXELGhbfq4P7esF+VZ78ViZK5a59LElTck0HSZ9uuZ5CG5D76izOctqOjSdKt4yKsga
         dYLg==
X-Forwarded-Encrypted: i=1; AHgh+Ro5uTD+aYvYtG0Q5rM+27zHDh738FEKSoylkZETX2urLpXq40U+I43VudVtnw5v0dm4jEMcF4mzpN3EIa0=@vger.kernel.org
X-Gm-Message-State: AFuF++krpKm0oes5JqkRmbwBzNOJgS04onoWcbdhcNxJN7+0pGeNMl5G
	ZFQZj5uBSYTiOexXJLCp16aAx18Tx8MEq3D+nKRq33VDiJZ5qToJyKAROKT/HVMg4ub6c39FO8U
	ZDk/gtqdbSGEmFt/k2ocKIC2FmBkS9koft14+VRLhebUoCojaY8ChgxehmUpwgQ==
X-Gm-Gg: AR+sD13VxM1Hl10bPITPtzqRddzYi9pCnThfsHgwJzPK+5Q+JH/hDfFXrzmFb21KN3G
	RwD1mJCz2W9YvInhgwqBXNG12la2teLzYy+ortuwNfWnSBA17XRVyRM85/7H0Nit6lRQtjDWHkj
	1dFyFCKapFXOxreOr1/1d5B8td65mmkbIR7wxss7kOonpcsigcO+XeloLQ1G38OS6IViVoSBx70
	REvHS34yzsORFL6+7xr4l9joV1IvEua8YTIKpMe8oA+v3N3WPMlPfZdNctoX+wlGLONZzx/xC4D
	8C2hvkoKzoJhh92qoTMfs9i5D9Z3doQ5fuQCX6Nzhb5PJUfeTvSwnyZKiSryZqEyzq3E3gKq+Dm
	TKYiLGc98H7HGh574yewY5gCfuAzjDy0ngGB/dRlMepNsyeg=
X-Received: by 2002:a05:622a:1910:b0:52e:4982:22cc with SMTP id d75a77b69052e-52fa1a4aab2mr249923121cf.5.1788028979072;
        Sat, 29 Aug 2026 11:42:59 -0700 (PDT)
X-Received: by 2002:a05:622a:1910:b0:52e:4982:22cc with SMTP id d75a77b69052e-52fa1a4aab2mr249922571cf.5.1788028978606;
        Sat, 29 Aug 2026 11:42:58 -0700 (PDT)
Received: from [127.0.1.1] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb32d30sm12171637f8f.34.2026.08.29.11.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 11:42:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 6/6] userfaultfd: collapse
 VM_UFFD_{MISSING,WP,MINOR,RWP} into single VM_UFFD
From: Tal Zussman <tz2294@columbia.edu>
To: Mike Rapoport <rppt@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
        "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
        Hugh Dickins <hughd@google.com>, Jann Horn <jannh@google.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
        Jonathan Corbet <corbet@lwn.net>, Lance Yang <lance.yang@linux.dev>,
        "Liam R. Howlett" <liam@infradead.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
        Nico Pache <nico.pache@linux.dev>, Oscar Salvador <osalvador@suse.de>,
        Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>,
        Zi Yan <ziy@nvidia.com>, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org
In-Reply-To: <apK7s4xSgA_GmY7d@kernel.org>
References: <20260823-uffd-vm-flags-v1-v1-0-3086981b33cf@kernel.org>
 <20260823-uffd-vm-flags-v1-v1-6-3086981b33cf@kernel.org>
 <ao16VxNvaYzlt2WG@gremlin> <ao_9R3CbjYFipFu7@kernel.org>
 <apAB9GSnHNyNoSc1@gremlin> <apAcweThjiD-iIBF@gremlin>
 <37f6af95-950e-4457-886e-6548d4719f0d@kernel.org>
 <apK7s4xSgA_GmY7d@kernel.org>
Date: Sat, 29 Aug 2026 14:42:52 -0400
Message-Id: <178802897277.671075.10362065249796431311.b4-reply@b4>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788028972; l=1768;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=8Gj2G76gEDUSTrJh9wyKhjlV0WDG+1riVaR0UmTV1c4=;
 b=cMv3WyS297uSy6OhyEPKL7TFiV6NgPyRlli6/52vFPU3U+wxk43IDrwyt65mNyPQi/updU28Q
 fXkQOPOdareAvP+hQQ2rgHqvMZY30DpDTGX/m0/lnTSj2MdkKXGNeAi
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE2MCBTYWx0ZWRfX86YHZUQPthcB
 dxyytB/zu3ZyrO0G1MvflptFgLQf705de9GM7brAbU6a2WnKhQiiq2/arv17aVsp3qdPekNcrkB
 /IUa0ejxk38mGi0eb81nq8crChJ4P6p5V+rcn7jTdFBUlRrwJVdy
X-Authority-Analysis: v=2.4 cv=e+I2j6p/ c=1 sm=1 tr=0 ts=6a932833 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=kX8B4L1VaituP6mSkuYA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 3jwhtlEU--ZEJn5ApjlEnae-JWlj0OPc
X-Proofpoint-GUID: 3jwhtlEU--ZEJn5ApjlEnae-JWlj0OPc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE2MCBTYWx0ZWRfXyFU/ZGtFqMMs
 ONSzEVNuteuB4wZN5blN0lfAmbAhkUcby7ubgArFu7SvDuv1wc4NPGNB+QV9JYjOCvM5g6HI6mE
 9gltX5W07B8NZNIGi40JrH2Lfyfm2RbfimKFrBKdigTse8QGJV89wJQOH87V2UypE3SEZQW45fy
 CBNHSckE9B+vJ3B5b2PnGAIXyTCA+4SXQLPq9Gz7yfjK9zST3iE1ig7xv3rVWKoUrAW2lVqNnL+
 5V63S30s7Hp9tPhjpaaSO9OmCvByoGQHmunjCojSyPFV5C6nWw1TRArpPym8d0IfDRvLPoQLXgE
 MIfxE716SXuSY8NTfzJCgQYxh8cFOX4LvBRtlk7ZHkNgZGeLYQCeBxvTYCTY4809zCDzqHlOpCj
 dOAxHx877A9P4wxxQ8/MxBzxiiAgNs3OywTePUujKZbgjNk4ojMDRohV7Y1NGLuho2r/3URMnlU
 b02cAnZukUcOEXM6bRQ==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11890
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 bulkscore=10 phishscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=10 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290160

On 2026-08-29 14:00 +0300, Mike Rapoport wrote:
> On Thu, Aug 27, 2026 at 05:19:30PM +0200, David Hildenbrand (Arm) wrote:
> > On 8/27/26 13:18, Lorenzo Stoakes (ARM) wrote:
> > > On Thu, Aug 27, 2026 at 12:16:32PM +0100, Lorenzo Stoakes (ARM) wrote:
> > >> So actually you're increasing by a cacheline and increasing the VMA size by
> > >> 64 bytes, i.e. 1/3, which is unacceptable obviously.
> > >>
> > >> Maybe there's something that can be done with:
> > >>
> > >> 		/* forced alignments: 1 */
> > >>
> > >> Perhaps? But that looks potentially ugly.
> > >>
> > > 
> > > I say elsewhere (or think I do) but to highlight - I think probably we could fix
> > > this by putting the flags in the low bits of vm_uffd_state.ctx?
> > 
> > if that's possible that would be clearly preferable memory-wise.
> 
> This gives only 4 bits and makes this completely not extendable.

Wouldn't it be 6 bits? struct userfaultfd_ctx is allocated with
kmem_cache_create() and SLAB_HWCACHE_ALIGN, and most of the flags are
only available on 64 bit, so it should be 64-byte aligned in the
relevant cases.

(Not that 6 is that much better than 4... but it's a little more wiggle
room.)

It could in theory also be bumped up to 7 by setting align in
kmem_cache_create(). userfaultfd_ctx already takes 192 bytes due to
existing alignment. Aligning it to 128 bytes would make it 256 bytes,
adding 64 bytes to each uffd rather than each VMA. But this sounds like
more pain for little gain :)

> So I think I'll drop this for now and wait until VMA grows another cache
> line or until having per-VMA uffd state rather than a pointer to per-fd
> context is a must.
>  
> > -- 
> > Cheers,
> > 
> > David
> 
> -- 
> Sincerely yours,
> Mike.
> 
> 


