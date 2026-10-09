Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E75139FCCA
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 03:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791517316; cv=none; b=lquuWdBmNAaYN4dOG2gQ9Ekw1acn5+PILWdYjlR/5Bb4wiOWVEbtI1g+MgPRkvWvRv56ULTC9NBffqEgN4Pj/5xSUoOn1Bblz6XiVMCt2Hd1r/wRCdd5tdIX6gO8RPrtGG+YrFaV+ncShrU23XN3l73IvIdgH8bGHMhrhs/1m/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791517316; c=relaxed/simple;
	bh=qzxKZDjyZzvzXI+CL7uByZKbJsIkTUlyIT+tokoP7xs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=YHht0AZxh1ypXweM6k+qgbyqnWVh8mAUfifHHhjruJvCy1dDcE9KaCOHZj5ExXWtoXOjZerP7erMuCzOrUqnVxSjyGpBWjV0n6hH8+HThjtYZoZhR6jCRlqDeKf8dt6OpIj+TMPiAtWTNYg8Jbc260BR04u03zvDhfxwvt4vyf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CRQVa1kJ; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CRQVa1kJ"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-381b831d535so5991341a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 20:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791517309; x=1792122109; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qzxKZDjyZzvzXI+CL7uByZKbJsIkTUlyIT+tokoP7xs=;
        b=CRQVa1kJIgv38GiKcwbV5KsnpG122h2DuA3VVtl8JqiTeYdfRZcsTuE9XZDLE4jQ3m
         7aRGMED1liJibgWt3vjLTtGJAb9AAOhmBNKoigWcZsvXyHMIDICx8VnpxdDWqnUs8E8l
         Y0MzK2e4jpYk7GH+ri6wiMoQT/5m61MvHOoYZ8ZN6Kl6u4nvTFSCjtCEfS5Nl0yLVvR+
         rxJeF0T6oNMKFaoId2dSrhzgXuTacDcbvNzVSjcFY2u8ee4aBP7W4iEJgEK9QdqOAgVC
         80lU6RHPEyQ6IWmz03MwmabhK/Q+Sn5Yjmk9nDeKUolUM6oFGczNLa3vrDne/TpdiCzf
         TOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791517309; x=1792122109;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qzxKZDjyZzvzXI+CL7uByZKbJsIkTUlyIT+tokoP7xs=;
        b=C0gQ3JUa7SDshX2EoDirY2mzHQvfTUHxD0qRcMaOHoQOELl7B9lMrqjbUyB+2CwWEH
         Hbism74L5LXLQfgXIXNUHCam7I8WqYi7bsx41jIIZxNM/ZVoY8WUbasDnekMLAFUyZtV
         dkjH0W+Q+GyLCdBMD6lm1dZwioOxNzS5whT18WZvnapoNm85t8gSAa50V2h/5ZBu1uHu
         jpV9bRAMrORltYPxeRPZTWmJyFCoQRwbIlVx+JnEQN3h8aA4b83I/VZnCx1MUc9eQcPy
         F+/j+uKa8TehUs7V+BrbkRCIkTwjEpUbhaLavEHD9h9MYoX/X4ukVXge64BpVZmiJUq4
         H+KA==
X-Forwarded-Encrypted: i=1; AKwUvBxTD+Ns+T+AANosx2xTJzk9h1sNryMqXkQ1G8vr7FWNYEeg+9hkvHJd3U6eA/qYU3i14q3GaOeJo8NA4No=@vger.kernel.org
X-Gm-Message-State: AFq9FYJH3brnCSe+19rZPhicDc79uoZAHQmabGtUV9YBlh7DPm7J0pa4
	JR69HWaTwRx3uV8DpQZM1TJtxsdIU/zUJU+MNV29Bek9DpOonQa3Kfks
X-Gm-Gg: AYBFou2FSRGu4lrVEJDc5K8sKQrqtJlxEMtsBuvreAd6zzJ0Ykw//VKqFNqyiQ2xiQI
	5/H/a0IDideH1+Wwygdsv2M79bMzSBsateUAw7TJpo8FLsXEk1gMkwRQjYLl4p7FT+GtQieFdbf
	TVHgeyyTA4/S+1XUWSSqtp8Ns5dYVlK16I0LzLxgFlwDDZl5fispJAPex5OMrYTcPXF9rHl1o92
	v0Sx3T/zPmHfw5TepQSOEZntsh4gQDoGSACyCTw5BbLOVgz/wf57NRyTM866JjX1yNpB9zmk5Qq
	WcBLEpsbdWsxAWzQMU8p1H/K37yxsXsiJmxHD+WMuWf+TxdbjSVuXWOJVTYm+4oIxOKnUz32pcA
	944mbGEe3QqswBn6NJmf4sUFNfJDpBDttq9Ln5uQxFJlyggi+94xd54BTLp00oLNa4YWyRuCEpY
	5Gmv527acJ6Ys7oDtTTsUDPPxGKP0fuDmPe1ucSRAGGEnvKUo1V/gpKYMP6cCjC6cd
X-Received: by 2002:a17:90a:e7ce:b0:3ab:9cb:b5a4 with SMTP id 98e67ed59e1d1-3ab3ac7eecemr828552a91.40.1791517309526;
        Thu, 08 Oct 2026 20:41:49 -0700 (PDT)
Received: from smtpclient.apple ([2a05:dfc1:8bc4:feda::11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab39234b62sm1464887a91.16.2026.10.08.20.41.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Oct 2026 20:41:49 -0700 (PDT)
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
In-Reply-To: <20261008153348.92684-1-kayracizmeci@gmail.com>
Date: Fri, 9 Oct 2026 11:41:20 +0800
Cc: Jemmy Wong <jemmywong512@gmail.com>,
 sh_def@163.com,
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
Message-Id: <309FAB10-ACB0-4EFF-81B2-5E7906A00ECE@gmail.com>
References: <20261008132604.98242-1-jemmywong512@gmail.com>
 <20261008153348.92684-1-kayracizmeci@gmail.com>
To: Kayra Cizmeci <kayracizmeci@gmail.com>
X-Mailer: Apple Mail (2.3901.200.66.1.3)


Hi Kayra,

Yes. My first patch and Hui's v5 2/4 and 3/4 move the NUMA and cache
ticks onto rq->curr when that task is fair. Hui's 1/4 is the right
shape: task_tick() runs the donor class and, when a proxy crosses
classes, the execution class as well. A fair lock holder whose donor
is RT or deadline still gets those hooks. My patch only changes
task_tick_fair(), so that case stays missing. I'll drop it.

The other two are not in that series.

task_sched_runtime() still flushes only when @p is the donor, through
@p->sched_class->update_curr(). update_se() adds the delta to rq->curr,
so a runtime read of the lock holder drops the open interval. The fix
flushes when @p is rq->curr, through the donor class's update_curr().

sched_can_stop_tick() still passes rq->curr to
cfs_task_bw_constrained(). sched_fair_update_stop_tick() already
passes the donor. The third patch makes those callers match. It does
not change the tick while a proxy is active, because both checks
return unless nr_running =3D=3D 1.

Thanks,
Jemmy


> On Oct 8, 2026, at 11:33=E2=80=AFPM, Kayra Cizmeci =
<kayracizmeci@gmail.com> wrote:
>=20
>> After the split between scheduling and execution context, update_se()
>> charges the open run interval to rq->curr. The tick and the runtime
>> sample still treated the donor as the task on CPU. Under proxy
>> execution the donor is blocked on a kernel mutex and the lock holder
>> is the task that runs.
>=20
> Please look at here: =
https://lore.kernel.org/lkml/20260913064722.1534766-1-sh_def@163.com/
>=20
> I think y'all are trying to fix the same thing, no? (Or atleast =
similar in most ways.)
>=20
> Adding Hui and John to CC.
>=20
> Thanks,
> Kayra

