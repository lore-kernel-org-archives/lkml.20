Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522FC36A033
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789062436; cv=none; b=XDLih4JsJsC74zWM8sLlJOrXagmOvXDCXVgCSB9rmBHgiW5TeLADSKV5uVzdD8adXAfXhhHtuZGSKao/K/Mu+BkffMJhmok5PbmqDzaCNLprj0fLcXqAqxOW9AN0KvMpuxj+tS/la8zW4vVLK3SCN3KlyYqV/GZ5CeF9av129bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789062436; c=relaxed/simple;
	bh=ggmWy378Fm8XbzIqsmoiDfWqgCWV7miSo+Loys+qS6I=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=IaoXaHlR9yWOh2oBBLZCtFelll37AfHRctHgoH9ZLG3+lwemjMNwkKzgtk+cRk7Cg2aGdbeCEVgV+jisGHne7wyhBQKPg5d78iNIR4kOTxUtq+n9rdNaZy2h2mzX3XDI2CcwSC0S/tQeXWtbdSj8AvMVa2gEMElgioCiypdlto8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=HUHwSk7O; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="HUHwSk7O"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso111681a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1789062427; x=1789667227; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HAvA87Et5zN/g6j7vdy1Ap87pfUn9R+X0a3IzOHRO74=;
        b=HUHwSk7OVdy7wpzNCyqFSt0yxKwOynRRXEBnkyUtOGsGl5Si3uamMpwuqIA5trg7Hs
         Mr85LLXnSJseku++pvzOVjuvnNBC2p2FsAZgMm/a9thop2FTNDBpsLdrClIDHuW9NKzd
         l9dPe+TT6zH4vRn/x44lWIMCXqvLpV7iiTBwaoIHZQd489fvGazRkxRek3cZveM+l0p8
         1GSlRPDslRjkUgIQ8umUr/fPzSDkjjnioCpgJxzcjSoibPc8DJQ3Rt/yVqWq2bzeuaiE
         HxFEZ3gTH+AprS3kP66SXQjGF5dcGm6bID2iGSzoMAMpmhUstuPzLeDPfiaEWPtOEhQa
         +FFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789062427; x=1789667227;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HAvA87Et5zN/g6j7vdy1Ap87pfUn9R+X0a3IzOHRO74=;
        b=K7yOsfThz+2qcKHMgdGJIviP21NXF2lYQ5JE5RmMHS+mO02oumAQ6vI3nRN9Rsh41n
         jmBXoLfx9MuKSoLe9jDV9HnxT9jO6iXst5ZlXayLXJme8OjXnWr7m9TSfUh63uJ3VyOC
         SOvqgo6Zm1WVW34YTJyhuCx3wwXrwqN4ZTOGtZ+1psxXTXSrQTGW6jDVOW5Fbcgp4/dn
         FnMQpP1RjYN5AX/JdZGn7CqgOpENjskY23Fpeki+Lg3s14ygdUQbpcw/BS6miOdH8KdF
         YpG3RNIn1PNv2m1zoSVc7c86OZVPWuj7Np/YpkvpQsGj2v4sq3RSfXTkXTmJpoQuVXqj
         4HDw==
X-Forwarded-Encrypted: i=1; AKwUvBzep5HDA/UYjbjT5obMxuNlj2GvtdcAhyRrWkUMhL7AkQxoeQTNlYh+zCmNBTCwcZEzodiMQ7dPu1KUdaU=@vger.kernel.org
X-Gm-Message-State: AFuF++nByhZZposl+pjldyy8gds3BiM9M0ENcETYGdG0lTGp8aklx5QG
	wzgoF9pbd0IpnvA/T+8NOba+P8PzXxIgoaLBGnJiOdFpljgaiAjcC1wKFdxfsDrXMwM=
X-Gm-Gg: AYBFou2YQGVCc+++a9cYOYhajSYWCdEvmWoYrt+T2AfZ61ImglOXg+mK+ftQyY1rc9i
	EmTSknUd4ih8GPaGgAX+Kg8ePuReYvyIwjW5I3GRcK2h+WDX5Ghu0lbICIE8K97eUwPWvufu1Gg
	iH+vN6tvrfr4f+b4pSPr0G2Zf4KPGYxa1k4ewEim+h8ucWj6HTPQl7dHCFA00KZqqj7ipZxm/Fw
	wBDC+zFV7cA+8qqryn8t+EOpd++YH9nJqNJ/s4D/abRjQugEPQveNNbyEWdPRWWALz0igVMXDoa
	Z96cYNO7ppAAddXq3BHB/OJkQrSi7pLbPd+/8ckUEWIM/Km8wiPUZ/SJ/le1V9BcmphN9aO/6G8
	/p6bU/NCdfCmw39yQm5eDS6AF2LkWjR9gTv4vgJnn1dCxhbI63IkFwl2Jchtyy90iwLiZ7kPoVI
	NXGb0TOqJBdm7fMH6IOAP03HRhQYQWqC78BeYmQ75gkp1noZh4gHmb5fog1SKD8tQBwxTdw8mcb
	TRdyUgFZsCP4FJriadKUDJa6CFn
X-Received: by 2002:a17:90b:274e:b0:398:b1eb:136c with SMTP id 98e67ed59e1d1-39b2610fe62mr64208964a91.9.1789062426873;
        Thu, 10 Sep 2026 10:47:06 -0700 (PDT)
Received: from localhost (107-190-31-17.cpe.teksavvy.com. [107.190.31.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm263339a91.4.2026.09.10.10.46.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 10:46:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Sep 2026 13:46:56 -0400
Message-Id: <DLBTP43WDS59.3HN832U7195TZ@etsalapatis.com>
Cc: "Emil Tsalapatis" <linux-lists@etsalapatis.com>, <ast@kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <eddyz87@gmail.com>, <memxor@gmail.com>, <martin.lau@linux.dev>,
 <song@kernel.org>, <yonghong.song@linux.dev>, <jolsa@kernel.org>,
 <john.fastabend@gmail.com>, <sdf@fomichev.me>, <horms@kernel.org>,
 <dsahern@gmail.com>, <hawk@kernel.org>, <razor@blackwall.org>,
 <bpf@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf] bpf: fix reading neigh ha in bpf_fib_lookup()
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Nikhil Ludder" <nikhilljatt@gmail.com>, "Jiayuan Chen"
 <jiayuan.chen@linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260909024011.1252694-1-nikhilljatt@gmail.com>
 <CABFh=a7Z=heZODVsXwisY3VwULDy-Rq1hwO09exgX2d0-KzgUQ@mail.gmail.com>
 <178898653497.1776876.10402414041023036972@gmail.com>
 <7f3e237e-ac5c-46af-ae21-8b437a099fe3@linux.dev>
 <178903991209.1916825.3991149870565892141@gmail.com>
In-Reply-To: <178903991209.1916825.3991149870565892141@gmail.com>

On Thu Sep 10, 2026 at 7:31 AM EDT, Nikhil Ludder wrote:
> On 9/10/26 12:59 PM, Jiayuan Chen wrote:
>> Yes, no deadlock.
>
> Thanks for confirming.

The explanation makes sense, hadn't considered where this is written
from. No need to adjust.

>
>> BTW, if an IPoIB device can show up here, dmac is already truncated
>> today and the packet can't be forwarded anyway.
>> Shouldn't we just reject addr_len !=3D ETH_ALEN instead of open-coding
>> the copy? Then you can use the native function instead.
>
> You are right, and it is worse than just dmac: the line immediately
> below copies dev->dev_addr into params->smac with a fixed ETH_ALEN and
> no addr_len check either, so both addresses are already truncated for
> such a device.  struct bpf_fib_lookup declares smac[6] and dmac[6], so
> the helper is ethernet-only by contract and a non-ethernet nexthop is
> already outside it.
>
> I would rather not fold that into this patch though.  This one is a
> race fix with Cc: stable and no behaviour change, whereas rejecting a
> device that today returns a (garbage) success is uapi visible and does
> not belong in a stable backport.  Would you be happy with the seqlock
> fix as it stands, and a follow-up for bpf-next that rejects
> addr_len !=3D ETH_ALEN and covers smac as well?  I am happy to write it.
>

I think this split makes sense, even if there's the churn of adding the
fix then removing it to use the pre-existing helper. It's just a couple
lines of temporary duplication. @Jiayuan wdyt?

> If so, which return code would you want for that?  None of the existing
> BPF_FIB_LKUP_RET_* really fits: NO_NEIGH is untrue since the neighbour
> is there, NOT_FWDED is vague, and adding a new BPF_FIB_LKUP_RET_* is
> uapi, which is another reason to keep it out of this patch.
>
> Thanks,
> Nikhil

