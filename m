Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B3C3D9DD4
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 05:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791524848; cv=none; b=aQRqAPOl7sXeNMU3zZPplq89qavFtCI9ANraDxMmHHCXnFI+IUWm9xTbRsw2+HOzS92jddw0b+wyQvaHbwva7C09FcmXuHAS6zBZnlDB7Mg6qV0XgKGCAsuFwDLyXajYN4XkueORmUpEgJCCXJgxP4B2hXsj89DE9ZK096SASMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791524848; c=relaxed/simple;
	bh=2YRi+/c4t+6Ygg00E1gkQ4/m1qP5c7APJ+UqWGNMuuM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=d4vIbkyYaN8kw2QMVitDrL9SOSuEYHJqTLrjo2Zclmz67IPSzyQBgJWopHCz1tMZExHzD1kwm3JW7+es5/gTlf5GEzlm7doXU3l8u9ELkgOwbMaZCGp6IN3XovDU8JiHE65ehRToFm95HJVYkdx91Png/gDLURDGNZB2Tm57oUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cZgJ8GBQ; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZgJ8GBQ"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2dd9cbb661bso30232235ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 22:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791524846; x=1792129646; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2YRi+/c4t+6Ygg00E1gkQ4/m1qP5c7APJ+UqWGNMuuM=;
        b=cZgJ8GBQkwHIsKNIDkdRr7O1+flSN1VUAd805sYFmUuoR+4v7RmOaw/qAb7WCD242p
         asnRIrGMqYv1ZpZB/sX4Zf5PZC8goCEkdgLYpI4mhxpxJjaP3Ks3F6trRImm10o7TRKA
         oQBJGFxiUWfIoTxbV2VyYRrdHiuaJgJ+fztc0tcT2ZEXuXwjcq7ChX+Y1Yxj+iTCThUe
         CIUmUGIYdxqHwYM1rllRODtGDt2wM04Lg8EVUyAeco6ZouvwbPV7G3RBUvNJBkXiKrjo
         BL1lsHVjiTZnOXgQgSLDc/hbR9MfvqGHR+fkasECDCO/Arlwq8hYlcGOaECsQBphMesT
         bv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791524846; x=1792129646;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2YRi+/c4t+6Ygg00E1gkQ4/m1qP5c7APJ+UqWGNMuuM=;
        b=X5/CPJYxQchIRfPOW7XrLcMJ2CjcreRzKJA6A7Bg1Bk5csbKQ1Mzp4KLAw5G8xEBoD
         uAvtDC29YQwFOGFA0CcItMoPmd0actVljV7VPz42cp+yZhGtZ981MQcgb7atbMvjLwsr
         Fs8v+AvGUVxcWzbBp6PXVUMDmK/Yl48xgsJzB6afINA4YWH/5DOQKb1tC2PSFRYLAEg7
         AtAYLVuvNi/4FjQ/biCEI753M8y4GTnbNfLTGREGmV3oOPfJ0OYmZ9pzMGF/8w6D9ekr
         coHxKSfufJaUpWVR6+mV2yKTm1VtY0dx4tGY4KgW41sJwOjsGpRbXknO9fGMNj33MG4H
         p2gg==
X-Forwarded-Encrypted: i=1; AKwUvBwuREi9fy6tyuEhpSvIeVwn1syVWCB56w42aC9NpW7L00bRE3uCGUXdn90B4UnBEpm0JeO8GplBFoLvR6A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjye4SCu+tAkUW84HtZ4PU8biGszWtj1QrflVlNheIM6gFaFog
	cfyXSKvNa7E9cBytZde/Ec7ob9PGXJcEn+1IT8bVMF5mbhkr/4Xd3Q9j
X-Gm-Gg: AYBFou2FicTsGUvb0QDd2uR0kE5K9Xt5SCV7ds3PSkqPu3sM5SBLwmDji4xjpbgd9qR
	+cyl3MsDkTZFPTW2x1feXo4e4Ht36aCqwYeNiBPDaeev3Rsa8rAhSqqNTDRRlam1Fpyvf7ls/Ko
	5ouFMG0fYtXwMKaTlnAPnU9ZqyoMxbGV4cfo/+AN8t4yAA0fzgnVud0LobC0IsiyILyyXudzcVv
	fpgZKEt3zXNhK74mO2yFPck4DSsIW3XhwJj4h2ZFU9bOlZTnGaQy6yrswKeGG6u/2Mex3lsirRd
	qOBvdC0VlZm2SEGtcrMGAIPm1hWFnmkatcv4YuRABLceYDxHAWazxfAz2qlcVZ0wH22KkZPY325
	A/PQSkf4pTGSuMXZvZizmk6gkgECmyHamyrLyejZ568q8Q6YJ4GvugDrYV789tKhsnXXvHZW/bV
	wni+5Kjsz62kX1SYCMomLr27A6ivZ7sESNE8TI3524m1QG5lIKHQiWTc8NfqLkv1BB8Diu976HO
	FqP8w==
X-Received: by 2002:a17:903:3d05:b0:2e6:c39:b23b with SMTP id d9443c01a7336-2e8429a58aemr7757775ad.21.1791524846140;
        Thu, 08 Oct 2026 22:47:26 -0700 (PDT)
Received: from smtpclient.apple ([202.8.105.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e20d2sm3660485ad.77.2026.10.08.22.47.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Oct 2026 22:47:25 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.66.1.3\))
Subject: Re: [PATCH 0/3] sched: Fix proxy-exec use of curr and donor
From: Jemmy Wong <jemmywong512@gmail.com>
In-Reply-To: <179151887161.2196447.9527206946798924448@163.com>
Date: Fri, 9 Oct 2026 13:46:57 +0800
Cc: Kayra Cizmeci <kayracizmeci@gmail.com>,
 jstultz@google.com,
 bsegall@google.com,
 dietmar.eggemann@arm.com,
 juri.lelli@redhat.com,
 kprateek.nayak@amd.com,
 linux-kernel@vger.kernel.org,
 mgorman@suse.de,
 mingo@redhat.com,
 peterz@infradead.org,
 rostedt@goodmis.org,
 tim.c.chen@linux.intel.com,
 vincent.guittot@linaro.org,
 vschneid@redhat.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <B242DE20-F1E9-4C61-894B-DC73F3884627@gmail.com>
References: <20261008132604.98242-1-jemmywong512@gmail.com>
 <20261008153348.92684-1-kayracizmeci@gmail.com>
 <309FAB10-ACB0-4EFF-81B2-5E7906A00ECE@gmail.com>
 <179151887161.2196447.9527206946798924448@163.com>
To: Hui Su <sh_def@163.com>
X-Mailer: Apple Mail (2.3901.200.66.1.3)

Hi Hui,

Agreed on 2/3. Your Sep 2 patch makes the same task_sched_runtime()
change: task_current() for the execution context, and update_curr()
through the donor class. I'll drop it.

Agreed on 3/3 as well. Andrea's patch is earlier, and it removes the
nr_running =3D=3D 1 guard that mine keeps. With that guard the bandwidth
test does not run while a proxy leaves both tasks queued. I'll drop
this one too.

Thanks for the pointers.

Jemmy

> On Oct 9, 2026, at 12:07=E2=80=AFPM, Hui Su <sh_def@163.com> wrote:
>=20
>> Yes. My first patch and Hui's v5 2/4 and 3/4 move the NUMA and cache
>> ticks onto rq->curr when that task is fair. Hui's 1/4 is the right
>> shape: task_tick() runs the donor class and, when a proxy crosses
>> classes, the execution class as well. A fair lock holder whose donor
>> is RT or deadline still gets those hooks. My patch only changes
>> task_tick_fair(), so that case stays missing. I'll drop it.
>=20
> Thanks Jemmy,
>=20
> Yes, agreed on 1/3.
>=20
> For 2/3, I think this also overlaps with an earlier standalone patch I
> posted on Sep 2:
>=20
> [PATCH] sched/core: fix task_sched_runtime() for proxy execution
> Message-ID: <20260902112539.879979-1-sh_def@163.com>
> https://lore.kernel.org/r/20260902112539.879979-1-sh_def@163.com/
>=20
> It makes the same two changes in task_sched_runtime(): test whether @p =
is
> the execution context with task_current(), while still invoking
> update_curr() through rq->donor->sched_class.
>=20
> For 3/3, Andrea has an earlier patch, first posted on Jul 16, =
addressing
> the same NOHZ CFS bandwidth issue:
>=20
> sched: Make NOHZ CFS bandwidth checks follow proxy donor
> https://lore.kernel.org/r/20260716132229.61603-2-arighi@nvidia.com/
>=20
> In particular, that patch also removes the nr_running =3D=3D 1 =
restriction.
> As Andrea points out, a retained proxy donor keeps both the donor and
> mutex owner queued, so keeping that restriction would skip the =
bandwidth
> check in the active proxy case.
>=20
> Thanks,
> Hui
>=20

