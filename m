Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875128;
	b=zdjfClt/ERGSJmuC+2/jJvr9myjvRy/inb6azKH1qV/3jkgoTr3xUsrN8tHKiXR5G/lJ
	 RDSQqDZLlF/FIzywjPPBsVzafWvLdW2Ncd+O8BJBRQ7CzSO24MDv5L+M5705F8IKUYK4Y
	 0y6s1B7wU3tzvHGbNDh0H2XCfyNKh+iWPn5VVXj2B12dpYRDkZuSzQNFfgQrL93Gx4PyY
	 4PnCNDdmR6cgmovTLdVtuen5CRYA1G6ExiodEFErcy/xke/fX02LS7npo1jyF7z5Iq0sz
	 2lfkISgW+rxsUoPJ3Jgfp4IFw3WcEw8qCuRzyhENOypYFYvLvmfHlV5+iGmR1reK7ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875128;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=8MNOTi2RLMd4i6tMmuWiGfGs1n6K7KS/R0/JcFFI2Uc=;
	b=BWw80rYI4xoaSoMAlRu4C73Wpv9oF84PKlKzbmwJrTHvJJYoiKbYZUMMSaZWzjYm3fta
	 hjfnLRJBsP5FivQi2IKhWs8Q1qgu0DORcdTivh9YKXjvCe72YqxSV1vDCcIURylHQU6Pt
	 T4qUV8O7lILrL6Y3ey5/c27giudvb81jJROCrRee0HEKDjXfxxgCD3dDsMcEFLdOhN8G8
	 ssPijLkT72Ip6KeXBBTtQgF3iqlymJRMW0b0FWUO7y8aNhWM3+HvsK/nwbbmR9RbRCjOU
	 WfVupMA4pgPZxy9OThFOAvJLqRM44Sy3ObAr2OtUL4T+8s7Erdh08J+wCY6PI7owvhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H1XN58t5;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=QAZIcYkh;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23D2606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E23D2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H1XN58t5;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=QAZIcYkh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793875126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8MNOTi2RLMd4i6tMmuWiGfGs1n6K7KS/R0/JcFFI2Uc=;
	b=H1XN58t5N8ePNahSdu53o5pTTHECMcg8aUpU6mwNEx4TgsSxeieiIfFjv0d6CUed6VMFHK
	wj+5b9gNM1KObYLDROvbh/PLsL2wBCHGIFS2LclrjyajlpcpLwzx2yH5aywnrhcXMwkdA5
	4sUUbixen18vAJBE7EzRSPTwaJmN174=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-hKFEpFaFMEGZl_4KbyfVFQ-1; Thu, 05 Nov 2026 05:38:45 -0500
X-MC-Unique: hKFEpFaFMEGZl_4KbyfVFQ-1
X-Mimecast-MFC-AGG-ID: hKFEpFaFMEGZl_4KbyfVFQ_1793875124
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48df02b91f9so316543f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793875124; x=1794479924; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8MNOTi2RLMd4i6tMmuWiGfGs1n6K7KS/R0/JcFFI2Uc=;
        b=QAZIcYkhciFUwNcp4j9XXWW4ACw5f23YIXHnKx+GAwMybWIt+19iz0QqfPtYqonjZh
         L7W6Oz/j52O+K0dVkqwSky0Z3t4p9ATtqcxYQK2kEG4/ieqj97xg46f/LimKRFrT9Qnt
         vLTsuuj6x0FMn08k78VW5OimtgjIqyBbmwnoV0g1gaWFHyt622sPhbBOZk/RqETbSk+1
         k5Wls3uNuhca+WXeWEH7H1ri9j5kGDzZ5dSMrP43qmx/4okFDN3GVVufDbqGYaslXxrZ
         AbJmid5xk2ho5VWIZsawHbO8d67ElDq/NIwf4V1AVIIGSAsYASEIdPFfmuzG1SNDBOWd
         h5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875124; x=1794479924;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8MNOTi2RLMd4i6tMmuWiGfGs1n6K7KS/R0/JcFFI2Uc=;
        b=jrOxCFX5C4gOvr5ROz8xfjnU1zmzZs21XkksuSG+iGyEwynpK6gldL6pHmqOkZkNIT
         vprJ5tH0Ww/W2HlfFajLanS+tILGTespy01cC3vV+hoXVX0OnTjwJOR8KmbULQFw0bh3
         mai2o+ULrk96191vYqzUfRnO1KxzFTbZ9gyieeYPhMSlxo8K45QFbltk1toK8EkBF4ay
         Zxq348wR46dqgPvUMw6DcmLIc/KkYeHgvPgAkeiuDGyIe20Gli3ehtq3LbIWJGTgvB+n
         lSiMVUEnvD3pip7CfDrGO3FC/v3VxrAbfvHr4yFnBHDzPqo9npp2Uu2s6LCtLa2HCcUr
         dP2w==
X-Forwarded-Encrypted: i=1; AKwUvBw6V+HIUs7/JOdJFGG554ge/K5g8kdT5xFI4LORgik4V+wNs07X4Cy1mJWWUelup5G/U/GBkU+fxCgMf/8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9swvcCKLTQkKDGiNombQ+vhSPGaYZ1GYJ8LVqH3k7Ad7z1HoIs
	ThNIX8g38tDGmn9AyPIL9Y3xY7M0c47LFMUbPu9soXIu7JMtPmGQvs+TJzhtYYG9zDZladYFWQ7
	5iw+fb/qkftSvEn3n7xAKoEQhAwoKZNktPE8HbhaVATypty3Lo3wKcU2lUFCEC5cglQ==
X-Gm-Gg: AYBFou3SmzKZ72f2FpPYLHqhhOyeiflV/NjjsQ2EM+/eeFnV39hO4lwe48vFKiSNpf/
	oufd02TMKY0I8WPkvKaZf60T07rdRqv13Q/I9YvdLzu+SLCC4cYTHJUistH4xfpSD1rJwSKJhkM
	4bEY+g7/yWNC5zbUpra4F3XJI6qhY2t7Y96fDfgFjoz6Q4bVElsmzILE0Pv6yW3/n/P7JG50NB2
	rcRQNT/8pPAahoUv8MXWSpmjv2dWsCT4m89dKF/nARSowG/RtcOGDJ7dHQoZpc8Q3Ke56duWwZF
	kg5Pt3PLEgnBDntOPDxUvDGaYs0dVwCI5m+g4pXMIHKD5h/uN86SgDj6DNDpMDhjueF7GPV0CxX
	aCQdt4uUhh6GUXDzH8qVx5VsnVNrtOofSp7xejgJ9anDZihZV2jjmdO/nHmv4OCLclvIPDXFyk5
	dOHQ==
X-Received: by 2002:a05:6000:1acb:b0:48e:6651:5956 with SMTP id ffacd0b85a97d-49112301e21mr3946516f8f.0.1793875124358;
        Thu, 05 Nov 2026 02:38:44 -0800 (PST)
X-Received: by 2002:a05:6000:1acb:b0:48e:6651:5956 with SMTP id ffacd0b85a97d-49112301e21mr3946483f8f.0.1793875123954;
        Thu, 05 Nov 2026 02:38:43 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec9cd43bsm9080495f8f.14.2026.11.05.02.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:38:43 -0800 (PST)
Date: Thu, 5 Nov 2026 11:38:41 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Luca Abeni <luca.abeni@santannapisa.it>,
	linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
	Weiheng Qiu <weihengqiuu@gmail.com>, Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH 1/4] sched/deadline: Fix stale root domain in cpuset
 bandwidth transfer
Message-ID: <auxcsYGC7Fqa44LM@jlelli-thinkpadt14gen4.remote.csb>
References: <20261103-b4-sched-dl-bw-fixes-v1-0-dd761fe005b4@redhat.com>
 <20261103-b4-sched-dl-bw-fixes-v1-1-dd761fe005b4@redhat.com>
 <CGME20261105102052eucas1p2fa2d23d1c49cdadef3b1099e18ffb958@eucas1p2.samsung.com>
 <eb0e386b-da07-4a2b-bff3-79441fd6be1f@samsung.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb0e386b-da07-4a2b-bff3-79441fd6be1f@samsung.com>

Hello,

On 05/11/26 11:20, Marek Szyprowski wrote:
> On 03.11.2026 12:26, Juri Lelli wrote:
> > dl_task_needs_bw_move() and set_cpus_allowed_dl() use task_rq(p)->rd
> > to determine a task's current root domain. For a sleeping task, this
> > is stale: it points to the rq of the CPU the task last ran on, which
> > may belong to a different root domain after a cpuset move.
> >
> > This causes incorrect bandwidth accounting when a sleeping DL task is
> > moved between exclusive cpuset partitions and back:
> >
> >   1. Move root->partition: task_rq(p)->rd = root, destination in
> >      partition -> different -> bandwidth transferred correctly.
> >   2. Move partition->root: task_rq(p)->rd is still root (task never
> >      ran) -> looks like same domain -> no transfer. Partition keeps
> >      stale bandwidth, root domain is short.
> >
> > The root domain then over-admits, and when the task exits total_bw
> > underflows.
> >
> > Introduce dl_task_root_domain_cpu() helper that uses the task's
> > cpus_mask (which still reflects the old/source cpuset at call time)
> > to find the root domain where the bandwidth is actually accounted,
> > instead of relying on the potentially stale task_rq(p)->rd.
> >
> > Use cpus_mask rather than cpus_ptr, as the latter may be temporarily
> > narrowed to a single CPU by migrate_disable().
> >
> > Reported-by: Weiheng Qiu <weihengqiuu@gmail.com>
> > Closes: https://lore.kernel.org/all/14508cb2-805f-41ac-9f6b-bfd7c3d7cb1c@gmail.com/
> > Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
> This patch landed recently in linux-next as commit b4a61fdc19c5
> ("sched/deadline: Fix stale root domain in cpuset bandwidth transfer").
> I found that it triggers kernel BUG during CPU hot-plug tests on some
> of my tests boards. Reverting it on top of next-20261104 (together with
> dependent 41a7968022ca3) fixes the issue.

Others have found issues with the set and we have been working on fixes.

Can you please check if the following addresses it

https://lore.kernel.org/lkml/20261104211207.1392343-1-mathieu.desnoyers@efficios.com/

Thanks,
Juri

