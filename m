Received: from mta1.migadu.com (out-247.mta1.migadu.com [95.215.58.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C641E3ACA60
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787749993; cv=none; b=UmvKPmmzDL2yvZNzA/Bz/+O2r7CLOANR8fhgQvub62peHOT3p2abrerE4kLKtVTjxgppYxJ4VCfbi7f+CC+FnTTWfRUPOM18SE4YLRfw70VSFi/k+itOwfnEz1AW7tsZm82ApuU36xHKEXaSgJ42gxjPtQfB/qH5PtXsNL1jxvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787749993; c=relaxed/simple;
	bh=3FSYCs/IB5bxCI+zK412GFPa/Q/dyXoSMmHUTnyiiiA=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=HTv0DRn1njn0yeVlPhyOPMwFFvKdYQQ5IGdCFcwnOopb9nbbbodUKn37e4gRSJTbRpOzE9nN4+YsE5QNZHZKe1x7bzdWAOJpwvO5JR90oI3eoFcbMHZAh/JHZjJDWYIhcQtKtdlkppLVsD8n704Gp1cD5iocp6hVlMZN1UX07QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iKjORPjf; arc=none smtp.client-ip=95.215.58.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iKjORPjf"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3FSYCs/IB5bxCI+zK412GFPa/Q/dyXoSMmHUTnyiiiA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787749989; v=1; x=1788354789;
 b=iKjORPjfnDdKnwuV+kAm55iaYEGK6paB5YVMtZcS01V9tL7RgR7lT2rdJ/rBLYrnCtkBMeVh
 V60SN3IfC8OybwB3RI1q1QNERFZBpUDlsCDn/I5U6Pwzul4RLPMUZ30JnXCLipSXpR5+5Vif0PI
 dbvKDhFl7Ly7SyId14USr7DU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: from webmail.migadu.com (2001:41d0:303:fc7a::)
	by smtp.migadu.com with ESMTPS id 0af0dc6877eab84a;
	Wed, 26 Aug 2026 13:13:09 +0000
X-Mizu-Trace-ID: 0af0dc6877eab84a
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 26 Aug 2026 13:13:08 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Zqiang" <qiang.zhang@linux.dev>
Message-ID: <0e74e6799bf042293fd1e34e2f242c56786c3de4@linux.dev>
TLS-Required: No
Subject: Re: [BUG] srcu: false-positive WARN in cleanup_srcu_struct() after
 78a38cbf6f20
To: "Sunho Park" <shpark061104@gmail.com>, rcu@vger.kernel.org
Cc: paulmck@kernel.org, linux-kernel@vger.kernel.org,
 syzbot+d4faf7db59e11f6fd1ab@syzkaller.appspotmail.com
In-Reply-To: <24c0edd6-3cdc-4536-ac78-394bf785aad4@gmail.com>
References: <20260824105625.3725157-1-shpark061104@gmail.com>
 <494f3e0cdb3692bf13690f4cddd3b40098b51627@linux.dev>
 <24c0edd6-3cdc-4536-ac78-394bf785aad4@gmail.com>

>=20
>=20On 8/25/26 21:33, Zqiang wrote:
>=20
>=20>=20
>=20> If srcu_barrier() be invoke before srcu_cleanup(), and after srcu_b=
arrier()
> >  completion, there are no concurrent srcu grace period start again (e=
.g. call_srcu() calls),
> >  the timer_delete_sync() should return false, the rcu_segcblist_n_cbs=
()
> >  will not be check.
> >  Or did I miss something?
> >=20
>=20In srcu_gp_end(), delayed work timer is always armed in SRCU_SIZE_SMA=
LL mode regardless of whether its cblist has callbacks:

In this SRCU_SIZE_SMALL mode, when queue delayed work timer, the cblist i=
s always no-empty.
unless invoke start_poll_synchronize_srcu() to begin SRCU garce period,=
=20
otherwise=20invoke call_srcu() or synchronize_srcu*() will insert callbac=
k.

Thanks
Zqiang

>=20
>=20 if (ss_state < SRCU_SIZE_WAIT_BARRIER) {
>  srcu_schedule_cbs_sdp(per_cpu_ptr(ssp->sda, get_boot_cpu_id()),
>  cbdelay);
>  } else {
>  ...
>  }
>=20
>=20and with cbdelay=3D1 (the non-expedited path) srcu_schedule_cbs_sdp()=
 arms the per-CPU delay_work timer for the next jiffy. This includes the =
srcu_gp_end() whose grace period makes the barrier's callbacks ready, so =
an armed timer is left pending when srcu_invoke_callbacks() completes the=
 barrier.
>=20
>=20Thanks
> Sunho Park
>
