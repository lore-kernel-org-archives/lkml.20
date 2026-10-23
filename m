Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768912;
	b=YNgbB/8c8mGBzCJl6YPDrEecFPAg+8CwmfqoRoEybK//284Esa6+6X+NoXoLlkogMeJH
	 fPkDBBjmGrczs/vJ34Dn3hL9qpudmTyfwIvqycblb6pS4REqEvMbNLT/muVLMdwY5/D6q
	 7ifrx42efkVWlVlfSmsR2ZWbktO/kBFNPaFTyZkgnac4kD83rH/qpjhCF0rPe5LDRsP+H
	 spnj1bPqEotTaW2fvXXSy4W1oLKta3RJ9F60N0bfAqjHNx2ELycNnlPybF0e7m6Hm6eS2
	 XDB5uOmg/vYtPXiaXsI5+WIUtGZ1b/cmRDM1XAmD20ofmKvln0bt50Q7L6USX5MDy2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=F7i+InRSa4G919gLktQY6UWrq6Rt53sNH1CB673nI0Q=;
	b=QBHYukuPBA+lofvnFm7VjDmM4oGRZQqPbY5k2yr/fAE2VBXB/KFMGHvOWxz1EsNAlWi2
	 Boi1MxM93Asa5MDn8ujtxiheG8Aualk++uhBpEYNF56nvU4h1EYjNPf6ejniYertAWdRn
	 9upYaeWow02rxwNwFh7fEd1oy9SZtnMAzfxt0ULV1SicdqSK+NfcL8OgYS1VoeoWvuWC0
	 O4rjY4N2IIP8GhABrwqlYkDvvJMMTLDhVN6GhRPXDOgX48RQYtPf2JJSDy2YtzCqo74BU
	 Sir4MWuGq87Xs1yaKkR1syChAdKNsHNPPUt4ba/S6RRrBD7Uf9KAm0ft49TBuMzFbPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=CXTsgTt7;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1F6606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA1F6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=CXTsgTt7
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-53653e30353so13846861cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792768911; x=1793373711; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F7i+InRSa4G919gLktQY6UWrq6Rt53sNH1CB673nI0Q=;
        b=CXTsgTt7eLf+21+DdLWMlfY1EPGtwFSHhq2eOq2RlBwv4leBZwfWJ554l7a/qn8rMq
         Ur1P5nJUrxOJE+gu37GCS4JFw67LwOCR84gGyz9WQZGd89/Sd9vfu5ZSurTHu1DT+3au
         /XiN9ssTj/qA+ja57y6ZDDQZKfyxw2sNCIO79E8qHF3M0osnwCs1e5r+KD5NjEW6bhk8
         f+6eghdwAIeC+50HJBWVpruAshn8zapBE0awffkjcQsMvSppoBtQ1iAnaO+cfznU+MV9
         9B0KlHRBqpGQZ0xIzjGojmflElbIvdh5R3rm9y3vMbuRX78S6kV+utVCc69tfyYmWFOY
         zZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768911; x=1793373711;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F7i+InRSa4G919gLktQY6UWrq6Rt53sNH1CB673nI0Q=;
        b=O05HuvuVGLfi05PvA90hEkRydvfCTXF+MPh2xQ6rzYsUaxUZgvlRwlUX5wygk/XdkO
         RP43/RgGQaaNABn6/a9Rjya1v4sAF3AIMIg3eQ200RajCqNL5qMSAgqOka7kkeQDFZNl
         mIzWXJBwrLXvrI4FYtCk3jLRO4i1y7vQaJpAa8wezdWrdWOPHaayKui/HBt40oSf469g
         esNrxyLSuOgOdVoBo5X8+OpFHmBVnVFIdxtLH4lWtoIz7cnL1ZiACxKuwMU5ABI4bCb3
         g2pnu2HCJPZnknE3vDdzo5PhAuUSJirOG9G07p5EWx49t9moBorhbixiYi2aJwwYactm
         TfHA==
X-Forwarded-Encrypted: i=1; AKwUvBzFtKORMd7hpI6wQnJwFzjLKFYreT391JGajXxn6J/SEtetlrrT8AqFncHL33cwqZ5psyN6Qz38U6qW2zA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7BJIw3SfZMbLUiN+uHWTBp0F6jBrxpiLtBPdB3gLYdsH8cIT3
	GspP9OcbR/AExpDeARDXDrUKT31UnSelwRiIIfRiYdFCuC+658gbSQFPAQOyhPzuVXb2QLgeuFA
	8fWIC
X-Gm-Gg: AYBFou0SiG+X65mUf1ALm0AT/yjaLn5smL5kZmvZZ7+DzuxHplJhA+WGdekRTzEoIUy
	lXJp/vLK0JRHEcDpFwrSht1vkAOrpVrW5KEz2ui2gL5FOav6taoqbh2POh1uKWl2jyjlG5WSBa4
	hAU8IMIeQ8Mk37BjSFDN5dq4MccQaRM9QCbW3Dz3Yz7nN/wACUe1d9Yq3mQ/bSNLN9TDz7IdK79
	WZ2S33DxowLg1CAEaGqy18w5YUrKkkZUiyd+KIaIxJPl3j4/zdoeXnDNEg9MZyEu+Dh0cgqcBW5
	wxZcCH884cuuRHbUk4/361drRBC601R7q1FV4J+ct0JPCXlxPNURqAvag3/6CKnbRb4n46pQpEK
	r6ijRO776MQ5zacvy7DBickSf2SJPz7DcKCBtdAokx7lMDaEpCt3XPYy6a5+RjxPOc0Mrb7Ft9G
	1eCsb1CorIFjZ0rH4VGjYbmZbc81yIBKvK+cDkQzXetvxA5dBwiZJx1pVI410NA1CRq8jx1BhGy
	f2g5KGuUgHwzKaywCQvVOLIrtpb5LbOmOeJbbuJpmcMNTquo93IMcQSpsUD9xSoroxNQRU/QvHE
	/ezRKpPZD8IOKFM99UdXx/u8EFw=
X-Received: by 2002:a05:622a:e081:10b0:537:af99:b562 with SMTP id d75a77b69052e-537af99b650mr7244191cf.47.1792768910676;
        Fri, 23 Oct 2026 08:21:50 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536c1872a8fsm18930641cf.23.2026.10.23.08.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:21:42 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/2] sched: use static_branch_likely() for the NUMA
 balancing tick check
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Yafang Shao <laoar.shao@gmail.com>, mingo@redhat.com, 
 peterz@infradead.org, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
 rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, 
 vschneid@redhat.com, kprateek.nayak@amd.com, gourry@gourry.net, 
 david@kernel.org, tim.c.chen@linux.intel.com, yu.c.chen@intel.com, 
 linux-kernel@vger.kernel.org
In-Reply-To: <CAKfTPtD7UsFkH=YPp9Faf0LX8ppNDw6hkVgFd-0Y30oSBYdgfg@mail.gmail.com>
References: <20261023023105.28829-1-laoar.shao@gmail.com>
 <20261023023105.28829-3-laoar.shao@gmail.com>
 <CAKfTPtD7UsFkH=YPp9Faf0LX8ppNDw6hkVgFd-0Y30oSBYdgfg@mail.gmail.com>
Date: Fri, 23 Oct 2026 11:21:40 -0400
Message-Id: <179276890032.2252127.6836118712740428624.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-23 14:23 +0200, Vincent Guittot wrote:
> On Fri, 23 Oct 2026 at 04:31, Yafang Shao <laoar.shao@gmail.com> wrote:
> >
> > task_tick_fair() checks sched_numa_balancing on every tick. The
> > static_branch_unlikely() annotation reserves the nop for the disabled case,
> > so the default configuration (NUMA_BALANCING_DEFAULT_ENABLED=y) pays a
> > taken jump per tick. Flip the polarity to static_branch_likely() so that
> > the fast path matches the default.
> >
> > Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> > Acked-by: Gregory Price (Meta) <gourry@gourry.net>
> > ---
> >  kernel/sched/fair.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 973647ad6c2d..71dc47d6114d 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -15351,7 +15351,7 @@ static void task_tick_fair(struct rq *rq, struct task_struct *curr, int queued)
> >         if (queued)
> >                 return;
> >
> > -       if (static_branch_unlikely(&sched_numa_balancing))
> > +       if (static_branch_likely(&sched_numa_balancing))
> 
> static_branch_unlikely is used by default for other static keys too
> like  sched_cluster_active, sched_cache_active, __sched_core_enabled
> sched_asym_cpucapacity and others ...

every other instance checking sched_numa_balancing checks likely(), this
is the odd one out.

> So systems which don't enable them don't pay a jump when not using it.
> I don't see why numa should be different
> 

numa balancing ships enabled by default.

This just looks like cleanup to me.

-- 
~Gregory

