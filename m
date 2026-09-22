Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0A8202F71
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790054809; cv=pass; b=Sw1lbK05xu5rIx7Ymfy10risaKt3mGB2/pMcJX5AyRQLQqUsk+yRI86LdVqjYfYLHjlEF6wkdY7iEM0fjUdaMk8J7UiA/B9QBTjjhpCq41JswqYUks6ur9dLbsfjFy3bz2M3TgxudaT9XOhlErrMwDc9Nw32I2rsOnM/0QzqABY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790054809; c=relaxed/simple;
	bh=rYFyfbP/CzYucLP5KfxCO5aW3V9+0lxq26u4CmXuTbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BDixykq1EruY4vFtnxT8B1zqur1duV9avWf3qrpnkSOmzaIjUEjCww3YduzUWrwZ9KGrHnFSZpz4X71sAHc54lRWaZAe2kRfdUxPVePetmLXZk02uT8GBZj6gNLCodfVI/HbpI54OudZq9fKzszseQvs8VFpbcCT2u9L0jXY5Uc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bSAYwNoP; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bSAYwNoP"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c2790ccso2227978f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:26:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790054806; cv=none;
        d=google.com; s=arc-20260327;
        b=XTiKLTAnIU+zD9s5XRW92XxnKh28rXChEX7f7jKOD58MViSY2syqcp12foIZqdpX+O
         96bCKK5D7nteNrz7vlNSpnunrpzvaYQ9IMRlSMoAAhqEhNZm8xvPjsofr17EXmSBVV3W
         Keto5iBmL2ATTwXs5JZI2SrTkLMFym14l9v0/5asEylnUVvPWak19MswsEYzYUAe3EB2
         4M9HgncdbQrWu4L+vFelDxp7rA3vRDBS9KP1BscsFVPXyPgwuzUfBIH9YRkS/O5Pkd2k
         HgjZ63uFW3JfN9GTVMkIog1id1gIiIyPy7vLjK69vxct6HL4A2mAzPehcKOuesRfU5xk
         +M4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rYFyfbP/CzYucLP5KfxCO5aW3V9+0lxq26u4CmXuTbk=;
        fh=xfeeqlZ7pRBm+w/yIXsLhX9+8P+FBhEtRub3wE0HgoQ=;
        b=YygS4IsterSHa/BGbAa0vCxZR7vihNhPsfBj5dqUUSPqU/ll7K2QRwuuoNV3SUN6Et
         w1nWt4/MTS9F6r8dIs3yvPcKE/qsbcpvIp7Jc3gpq4zEG2C5RA3Blw/YPVACg1c9HrbM
         OC0umdyDgNTIH9eT21JWZ3zwV0uAR3LceipOwfhav7eNvUM0nicoLHelqwMdHfSXYAkx
         OgCcAwbN9qx1frArPboja3FKQjnagOh+5byJO1ty6K6gi+gtZLQUuHjieBvqj0u/jJzq
         asKRJ6jtVpzardGqItUFZQyaehrGFv/WIWfqt+jlLwCY7cjmsxqEjg91oaHVsjfk4g8D
         SaWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790054806; x=1790659606; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rYFyfbP/CzYucLP5KfxCO5aW3V9+0lxq26u4CmXuTbk=;
        b=bSAYwNoPx8thYMmtxJyb2x7EQVFhLYsVcAw5p/+wEPBzQY5BBm8xh+fNSObpsQfAOI
         id/rNJPoTinjWDY7Aiwk2Sw82UUSf5nkDGkC4C3N6TsNavOPHJp3506IVX62YdDbncCr
         kFthl/LOPo6na8lcgX/pJhL7lHmeeqsnfMybGkTADdA5JsRkVnPst3tYdQpOz5leQsrV
         v1RgtgtX3UsRfBmYuiaSQCFq2RtlpZUGh6QyZzdzaW/s0nXHerS6AEAyleR7/yGkaXtO
         CMkk4ucbiUxCHtnE3PjSU/YGZ3uMAJ3/cL1yRq8kq9k54LXmuiI9ybymBJip7wpTw1FI
         rRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790054806; x=1790659606;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rYFyfbP/CzYucLP5KfxCO5aW3V9+0lxq26u4CmXuTbk=;
        b=iPyeENXPtAvdf73oyQC3P3GW3ayaqkHlG4DrQ0p1Ge2PhemiWR8TgoRms9i2lb4Kjt
         sVtOJLOtNw7Q42b17LouMFwr46wmbW25Oc/pVwgnlHHFdRoMJBZVFV+Iq8R5eBimsyp9
         zMrIdIZyW8sbkEB6uBivGYjAJzZ72CBln57UiGkFJ/+dU1inBzQ4Sp00vXF+aE+p6uT9
         Fw8hH0K4vBOepNlWVfHsA6ZoK6F/+XbiKCSIM2G317AvTiNwIIGwNbKfH3FKBUH+2SHa
         uSzxGqzCTwI9PrNkQGo5nKZCoMRx8qkDOsZrlR0SIJchiU265OYlVYzgFMIsdEJm37Kq
         34IA==
X-Forwarded-Encrypted: i=1; AKwUvBzw5oEH9SRlh80RRshF/DNe2/hIKrz3VzoBAxy5qZLVYT7HVtgqtwK6O3gkkLvg8YQpYOuc/ygG5rUSAn4=@vger.kernel.org
X-Gm-Message-State: AFuF++n4/5+fJa0kWXliDSKAvg7kCX2N0iomPEbqPQxd3hIw2412oHLW
	zsYFK3UQPxqs9u+KbCa1AGFla2WghhE6TQcM4qy3tFuVIq/8muQ+V0/gNqA/hGLOnLcJs/k66xr
	bCqxoUEL1qsz7sm4I7MH4skr7iSy+030ijahB4P8=
X-Gm-Gg: AYBFou0geZkbchbaZvB0Ui0D6rZPSU2S/dR0kgEcxfcYA0/EPD3jDD6YSvc0kKk5jL3
	rTDwQ3fLy4JeORU515PPIVC6eHotfHKppxJ5gi0JoX72CQr2OSLZekoIRKBYoVrkjtJhzgn2Smr
	Cb0pFdJ/T/5+USSohS5qzNcxu4yl8ZmV6LbV8D0nks1B5TTrL/rTJouYUuz6kBAA38gMxNQo2js
	bjs7ksWVmmgI8YCEhTEz5uNv/Uc7hvh2mNtEXasQQa70kw5wu89SJIRMp5gDAdhF8h5Ps3mYjba
	y//d0eObgImVbGSnKm4HBVawBmuWi0hyu/yF68QwdPBIskJN2o8IC3SA/4FmdQlcQ3Pp3S0AA5i
	nF5qS5ac37mUYcARRRyFyDvAOXsA5RuqQQJLEoH54HkXmUx3rEefRPZrEPMg15o4mqys+H5ay5k
	5A0dNA4/g=
X-Received: by 2002:a05:6000:4903:b0:486:f301:11df with SMTP id
 ffacd0b85a97d-4871e20cffcmr16415045f8f.6.1790054805817; Mon, 21 Sep 2026
 22:26:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914165455.2126134-1-sh_def@163.com> <20260914165455.2126134-2-sh_def@163.com>
In-Reply-To: <20260914165455.2126134-2-sh_def@163.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 21 Sep 2026 22:26:33 -0700
X-Gm-Features: AcwNN1UyM8ZGuVf5qcFbKoLLp1sQ6OQrRZ_v2oDWYywldbfFGzAKf__stf5lX70
Message-ID: <CANDhNCqZwGk+wqhB4N8Emq0rPmzsrVWzHmayiSj9ptg-vLzo3Q@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] sched/proxy_exec: detect cycles in proxy walks
To: Hui Su <sh_def@163.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Zhidao Su <soolaugust@gmail.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 9:55=E2=80=AFAM Hui Su <sh_def@163.com> wrote:
>
> Proxy execution follows blocked_on relationships to find a runnable lock
> owner. A cycle in that chain can make find_proxy_task() loop indefinitely
> while holding rq->lock.
>
> Use Brent checkpoint state directly in the real owner walk. Cycle detecti=
on
> reuses the owner resolution already performed by that walk and requires n=
o
> separate preflight traversal. The checkpoint, power, and span state are a=
ll
> invocation-local.
>
> Keep the existing owner =3D=3D p wakeup-race handling ahead of cycle dete=
ction.
> Unlike a sequence-marker approach, this adds no task_struct or runqueue
> state and requires no activation-time reset.
>
> The online walk can temporarily install a blocked_donor cycle before the
> delayed Brent detection point. In the tested recovery path, the selected
> task's blocked_donor was cleared before it resumed. A forced-stale contro=
l
> also confirmed that mutex handoff revalidates the donor's blocked_on
> relationship before consuming a backlink. Validation of this trade-off an=
d
> comparative measurements against the sequence-marker approach are include=
d
> in the cover letter.
>
> Signed-off-by: Hui Su <sh_def@163.com>

Hey! Thanks for sending this out and apologies for my slow response to
your patches.

This looks interesting, and with Suleiman's futex work, it becomes
more critical to include.

I think similar to what Peter already mentioned, having a max depth
counter is probably still a good idea, but it does seem like this
would catch smaller cycles earlier without much overhead.

I've included an simplified version of Zhidao Su's earlier work (using
a fixed MAX_PROXY_CHAIN_DEPTH) in my tree, but will include this as
well as an potential optimization.

thanks
-john
