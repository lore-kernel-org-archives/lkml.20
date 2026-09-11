Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAE01A6813
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789150496; cv=pass; b=WWk46mVeWNTUjBuelLfrVBde7dxhamCkJ1eMgp8pwhz0p6ceXHyXc+KXy8eSrRSXDScusP3RrooER7w22BOhmKDSC881ZeawuUQZ9nFn95420xGGtb49azoSiGLQ2U00mKOnxfNTb47GRSZhtphCzx4hVjCTq8N1MLHsgBqYJK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789150496; c=relaxed/simple;
	bh=GBuxWMSsg4wZZ3OpOH0+odAqCmKuZujhQPqIzTdn0Yk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q2Ihen9JNVvdGe5doMVALuxd1dXiiM0/jAS56SevskCbcqNoY3b5rSsA2HgiD8/sdrQ1Thshl7jKz0LNXtC9Ym8cu8w+JMJlZ0gfQnJd0IxXKCU2vlxmczH9wKUsc96tokJ4vjLzm1BEHvlGEVIgqdlnYrluG5n1JIBp4tqPB8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VX0N/ICf; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VX0N/ICf"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c253425b253so201471866b.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:14:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789150492; cv=none;
        d=google.com; s=arc-20260327;
        b=dyjxFz/DiAcAEJLGE1nVoykCx6N5FISiBHw2TKJKPHK6NoAZGlg/KMAxQl+mvawUm+
         vilzKjmtmiWArf63AQE5x/bL/Teu4zMMJFmUeT0vMKqU2cbD9L7WiOxfXh4Ryly1GQlD
         W21NhYKXJsEctCTQZ4NvJAqyPJLj16xBQrEuaw72E24B2xUigvfVLbwsnPcjJWZjQCnq
         dsOrqpdPGXAqR/Hml8Jqhj48s3uhgiJ7yCVL01iMBF7sSOa8Br7I5e9Wyb6C1VbVTh5R
         3mhynifrrYC5Zghw74XsxqxTQvl3Uxs70NEnMkvmYT6k4Eslf6WerBFGc25mc6KnPWN7
         B2cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sgMffH9c4Ut5GzZRUzz1jul/MtsWXNFvANxlyz2Cqvc=;
        fh=7IDIv+7r6EkFZFWrjfcqKKk6zqPOEzHQIK/hA66HIz8=;
        b=F/mnz87OviF6Q2CbTK30r8re/HHxbL2ahW8L5W4aisPTkCZzM+YihK2XSpyp/MJHNw
         eyMjcWaat568WYP+KoJs+oq3nD+Z7cpt7yvrthq9BkWAybLwtYfwQXQC3M7BFBrRcatt
         W89hXYQLCn9oSWv2eMZAkkiT/kFB3p8rcVfLm3vWxQf0CjjMP7OWlh2tuF5Adm52kEC0
         RlGgM1XvBCvn/tIXOwdL3YSOOEy0DouZDBiUUZ492igEstvokFdGMdfps8EZAHOUJU5A
         1oE1a+L6utJ33bf65ISF9y3GJRM4l9bHlzJZfudQzj/XDO6qeO1vzaoijdFXMlvxcjRf
         kaUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789150492; x=1789755292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sgMffH9c4Ut5GzZRUzz1jul/MtsWXNFvANxlyz2Cqvc=;
        b=VX0N/ICfu6nRhxaCAHv2F/9u4G0ce6Yvyyj9kYf6yKwcgmh4mGHhVrKRzUUGrUe82e
         dBSCR9VM4bbbucXmQuVRNwen9qIBQbUC5lhp/BJhA6uozTYw3JJ6C3hY61Bc8V2N0oMH
         OsenC7xrPsCNjt4k17SfnYGAnwLGIXuWASqa3KcopYNNdixArZx47YK8Wn6LzSXzvDJX
         x1NsCnbmPvYJES2RR+9eDOEqUPc0DMcZd2UUzDR+6XBPvO+0zHxNEKNqw1xrCN+LHBha
         tcZ3NcfQQ/VmrXX0AlN2GTuAzmN1CX+k2fKbafpWss5W//1XDE4S+Nyi3zOpUrriKaLu
         wWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789150492; x=1789755292;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sgMffH9c4Ut5GzZRUzz1jul/MtsWXNFvANxlyz2Cqvc=;
        b=sDKOQrHFi0vrqBdxjQp53TpjmSQiRgx8AhskN068gGrBZFle1NjeFgnwOpfk47JjA2
         BCDjzqitPz310uzbg6AWfPZ8CEh4of9LvpUkGK2kaRtZoh0vin0j8t2FFB07y9pa6izJ
         LpC+v037dwK5FN1ABKNbiQoO2kPDB6LeRAvF6ihs003oo4H2b8V1nD8HHfVVDozsB/Qm
         iWG4T7PBBGTqPOllx8OofNm/HTh3opscrrIrzQIGt/kkTXr2XdyF72odAKlc4JhDiMtW
         EagcZQJYmyO1wcg9Z5irJJlr1Me/sAJhJkaMytUUFTSLnFR0UFuTqzt8C9zs2vJ8kd4r
         zQVw==
X-Forwarded-Encrypted: i=1; AKwUvByjmBKcg/ChgmyTcq2vqsNc1duCeWBfDzvyFspdLZVt5hQItpOPFq5qL0jJxfljDfHjfTJ+w5Fczp0tb7E=@vger.kernel.org
X-Gm-Message-State: AFuF++n4P6yBPPuXFZulcti0yo87o+tkcOiSjTwjCIFR5TiqtoCt95Bv
	3Eo3u+Qvqm7rqekd1qUHUCet5RZrQq6UqQbaQidwomroHGSRtJ1/smFk4152sbffRanFcv0SlDV
	9qhaoQit0WcPjk3GttwcgV/A148g68Gg=
X-Gm-Gg: AYBFou2osilEOwt0XrDEoN8ok9D1+L4xuyszh9miX7bSGBQG2gllaHeqlhUSiGZ5cOl
	wwmZEPzD1xcbj1c76PG1t6lqHkWVy0pLM/x5uRzjyWV37ISAetcyL6iF2/KJn7sM7rkb7eJnhGz
	rdLvV/kd7ziZMWRNAF3swqlWIoiYVSfKc7kJqPCr5fLJxSalmwRrnC6lf9Z/ctmY+8Jy7DPxbAm
	wAtXt1WpV9U175Dl4zR2b8OA3udIc7E7HfHDs0IhCo833xEPGyr/uyt0opJd7bnAD8iQTy5YqJQ
	YVbI3QIjVt2T/0Gt79WnOhbKeFr+8tf7B1Ob6h20HpFodzHk37aF0xiW7I/cMBNQVANNX3IxNuo
	8orF5LDXQHwJz
X-Received: by 2002:a17:907:1c10:b0:c29:286e:2e3e with SMTP id
 a640c23a62f3a-c29666d5f9dmr241723566b.38.1789150491872; Fri, 11 Sep 2026
 11:14:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <CAMgjq7AHRzBsbmGOx0s=TQFBwcn=DEU1naR443sO6x+pJd6hAg@mail.gmail.com>
 <CAKEwX=O8i+OsP6BJXNZNk07hveN9HDT+PoyMTAU6gOc-xp0Ppg@mail.gmail.com>
 <CAMgjq7BQeQQOZMDPFJ+8LS2N4t3x53r6Nm+9o0_pi92oVUgjgQ@mail.gmail.com> <CAKEwX=MS-7C96i4tzBijHN=-xuZgny_wQEa_0YjfHzhoNysdYQ@mail.gmail.com>
In-Reply-To: <CAKEwX=MS-7C96i4tzBijHN=-xuZgny_wQEa_0YjfHzhoNysdYQ@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 12 Sep 2026 02:14:13 +0800
X-Gm-Features: AcwNN1X_Mr5nGygMYASuHxKAbKSbuoEdUvrKDUVcI7Vk1_FQ39e_c44cG1FLDGc
Message-ID: <CAMgjq7B7Mc7vpQN0gBknsSrfZWXdif5L7nU29YskG9mzS-_jsA@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Nhat Pham <nphamcs@gmail.com>, YoungJun Park <youngjun.park@lge.com>
Cc: Chris Li <chrisl@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Chengming Zhou <chengming.zhou@linux.dev>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Rik van Riel <riel@surriel.com>, 
	Gregory Price <gourry@gourry.net>, Wenchao Hao <haowenchao22@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 12:57=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrot=
e:
>
> On Fri, Sep 11, 2026 at 9:10=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wr=
ote:
> >
> > A boot time bool will cause real trouble for us, at least. We have
> > many VMs with fixed boot images and fixed cmdlines. However, the VM
> > itself is used by different customers, some are ZRAM only users, and
> > quite a lot don't want any kind of compression (e.g. their data is
> > dense compression is just waste of CPU) and prefer plain swap. So I do
> > hope we can have a runtime tunable instead of modifying the cmdline
> > and rebooting or rebuilding the base image for different cases, and we
> > have already seen that a runtime toggle isn't hard at all.
>
> Ah yeah I see. But before moving back to runtime parameter, do you
> think we can come up with a heuristics for this that have does not
> require userspace input? In v4, I'm doing this at folio_alloc_swap()
> time:
>
> a. If the cgroup enables zswap, then always go vswap.
>
> b. If zswap is not available for the cgroup, then bypass vswap, and go
> straight for physical swap entries. My intuition is that we are not
> buying anything for these zram users, as we need a physical swap slot
> anyway. Thanks to your design, both can co-exist in the system now -
> that's something I actually did not envision possible in the original
> version of vswap. Pretty cool eh :)

Thanks for the test and idea! Yeah, I always hoped we could do this
because there are some very promising use cases for raw and plain
swap, not just ZRAM.

> Would something like this fix it for you? ZRAM users will not get
> vswap indirection overhead at all, because it would bypass vswap :)
> Down the line we can revisit this decision - for e.g, if there is a
> use case for vswap-on-top-of-swapfile. There might be other interface
> that makes more sense.

Hmm, this interface looks confusing though. you mean tangles vswap
with zswap through the cgroup's zswap limit? I originally expected
this to be a problem solved by tiering, skipping certain tiers seems
much more intuitive. Maybe Youngjun have some idea here?

> > > > doesn't conflict with what vswap is trying to do. Some other of the=
se
> > > > differences involve design decisions rather than just surface knobs=
,
> > > > and those are the parts we're stuck with once they ship.
> > > >
> > > > So a few current interface difference of vswap and xswap I've notic=
ed are:
> > > >
> > > >  - default size: somehow also tangled with VM_SPARSE, which
> > > > needs an initial virtual value. It's super cheap if not zero cost
> > > > (the only cost is occupying some vmalloc area, which is fine
> > > > I guess?). But we still have to pick a number, could be large
> > > > enough to satisfy everyone?
> > >
> > > 8PB? ;)
> >
> > Right I saw that at V1 :).
> >
> > I'm not sure if this is the reason that is in conflict with VM_SPARSE
> > in your mind? Techically, at least for 64 bit, we can just apply the
> > same limit to VM_SPARSE, for 64 bit machines we have a lot of virtual
> > space to consume and that should be fine (VM_SPARSE is just the
> > cluster map, which is much smaller compared to swap space).
> >
> > And another thing is do we really need that much in any case? Will
> > things like, e.g. 64 times the physical memory (max pfn) be enough? I
> > know Baoquan suggest just use the physical memory size. So that could
> > be tunable, it's really easy to tune, just a number.
>
> Potentially, but we have many users at Meta. There's a huge diversity
> of machine types, workingset size, access patterns (both frequency and
> file:anon split), compressibility, etc.

You can just set the number as 8PB? :)
