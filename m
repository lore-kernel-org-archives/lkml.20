Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792551888;
	b=RBaaZeysoY9922b14w5kgiLrZ9xDZ3p18Az3f0UeWvBNtUf0DTlKTKgSwFfbAqSVNaMu
	 oDEU9kuiwhkv9gke+/SpvUSrl/hMgNxR4OtZnfyQwueHkev9o2vMHNlpoyPPvhKo0kqIf
	 vzs6sFvr9DpsTtiWZbse8rvIkSaGEpby07PzMzxDePoYsIG0PAusTO1PZTLCv5iFPJB0L
	 AQwSJKzze3C22xhmO1QNmHrxaM0jj78dAHAADv3kxZwz0EWPUrRX9erAfu3EfQ/J6MDBT
	 8Zf/f7vIqWWzaFeyWRMvCu6wvJ+UpbQp6NBRLtibZqjHHeO0Gv+Y1X3+2u40eOKDyyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792551888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=rc5wrhUHr1AVoBfBDZ+r5qvZgVrRLeIPWk5f/ArMKLg=;
	b=qmytTmtD2dyv7aLGQq3McXDd/vSc+mTD3c7IXVdPgH4LtvHx1aSFdPTE4tYlp38ep62P
	 SGAm7rULCzj3STrmkIURynBMIgyUro4gQ1ScNJAojjrSM4jgRPP/fcpamdSv2BBlk6hCw
	 fzXr74YfMch+8VBPE3WO+5hFkKm2vo/fmxWLL2Jcin64Utw6KznHgSd0rxlNM/4vwWWlr
	 TlzWSFVkM5DlRW+VbmgcWieJTrrPs/+JV+7Z1zluBqhgzmirBC9FtuEZKh26XfIdzdMlR
	 qZJ58w6WGNshZBBt0chqiNdn41WII6K/4F3snUA3z7o+BnUEpHbFgdaWzwOaFB4iB2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PuGDi+yC;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5628E606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5628E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PuGDi+yC
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so62389a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792551887; x=1793156687; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rc5wrhUHr1AVoBfBDZ+r5qvZgVrRLeIPWk5f/ArMKLg=;
        b=PuGDi+yC/qP1bGcg/TSJFrSAOJewAE8/w32VXn0pviJ9BU1AXHc+a3rPhPUuvSfVDm
         JR7tpDlII85BMuy9n3vyR4guPVqaMo0FxWhPE9NcoUQbhXT+7mMAI4QRfLXUIcqo5/Xs
         q6j4Gd+4w4vZcM5fGQi/8qw9VONKn+ZhsJ6qLm4IGL2EXDxGcJlYXGqZxwREBl5JaE7P
         l6vYVejnVU+p2Lwy4bfhWLOkJSbW+EYU4kJGgtyAWl+a57JCZRRlZ6MXcsMGDQJtdKfX
         UIsVQLX4CpWTz8Ys24LC4PJxBQF3aDGHBsiFJYu9VBoyLLX+g3l+ljvbGnceydfkRGMe
         hbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792551887; x=1793156687;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rc5wrhUHr1AVoBfBDZ+r5qvZgVrRLeIPWk5f/ArMKLg=;
        b=iPmj0MhSwTqz+y9s+t9VsD/cL87Z97MGAGqzQZqiH+a/JXZKhnoC0/L+5VmNHVVD+L
         6qIAC9uYI13yIjN3Tlv1iQcgxkjYcIp7kD2rUmI9v13HTi1EV/0di9k5JORjsfLhicgM
         HeKHrVI1tZgmjWdE0xGVwWIFsqhftE0ikXwtcmdb8r1r9VdanCXZUytbtwLAHbUNkwLJ
         dhoynQoj+0ZiS+kIHm8gwk7837dzFtgU6sZ5eVJbU8AGr5ot7R8DsyCe48KuEviKtLil
         AXaWkfcLEvuoujViPKPi/hG+HkcfPG6xywsUhVM3X5HrjXsmCQ4H7FrEBuEFAMy25bqO
         qJRA==
X-Forwarded-Encrypted: i=1; AKwUvBxnZFaoOri2zPo9JVvfnlTOC/Bt9JqkXJNB48fPVTWBU37MEgKWyKxt4sk1vngDAQctdhcgeP+KXFEYLds=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcY0s6/mQDeuyUKMDEpklPk0nYZPVyyUKqoXmZBCIdbXSQqssy
	TIIOW2eMPLO8MyDyZKJhcAnNCinyfMtgfwfl4/aC8POMkxtErFGwJ2wL
X-Gm-Gg: AYBFou1uRMdOjHJ2JalwQbqyV4nzKwuzpsvXOt+mCaquKWhxRbH5bTDmqisc5r3Hb+p
	L5q2CdWZ1qwmhsROoFUPPtsAzOYwp0h8ydifYQhC1yx3dS2glfQW/ljM99HazPr8wBHViguF53t
	fO+fsAOa7mnAmobeSa8F8q+aQJbxX6/rZLTapqPjvX+UYiP+YlYpLKYJyN/OeirCIlDm+LRyoqZ
	c5fgcnt2vwfy2ltoPWZ8vtxIHyK8XcRpdE05GjkaIS2r9wxfYInhzhj+y2iVEHSCUKFaV00dOyi
	iDIIeh2tyNfrrn9+vRgazb5QrxFA0tQZMus98MpzX60hnCFMCDlH7CazhjhSjJuVlhsLDxD7/GT
	ut8+gfgBWSUYK/k9Hy836AqR41tJE5ot/lwD00n/GAo+0weMXN9SGGmfQfngi5bhcVehPP+EsOB
	E2/pF+B5Q+kkhldpqlVdv8fuh7ddPH6SRpV9zcd6hvx5p7t0IDpb74SCPWpgfCr72h+cw1Ygwox
	HQ+4RHSBD642zLPv/+wWj1rGMhONwyFEj4GmgFCf0uar32dKHlBS3upOtlK+rfLC2a6cOYRRiRk
	zLKx9NS9dxs37Swtscjqq2BH/beRyYVBK97dZW6jxAek4wh4Gta7y6aSyavimvy4j8/2ToSe1FC
	rA8vrHA==
X-Received: by 2002:a17:90b:288e:b0:3ac:2788:cab1 with SMTP id 98e67ed59e1d1-3ad86ed22f9mr629222a91.30.1792551886548;
        Tue, 20 Oct 2026 20:04:46 -0700 (PDT)
Received: from localhost ([153.61.198.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad8035883bsm1999788a91.15.2026.10.20.20.04.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 20:04:45 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 03:04:44 +0000
Message-Id: <DMA6LZFMAQ3X.2YOXSMADL3LQ5@gmail.com>
Subject: Re: [PATCH bpf-next v3 2/6] bpf: Add syscall common attrs support
 for xdp link_create
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jakub Kicinski" <kuba@kernel.org>, "Leon Hwang" <leon.hwang@linux.dev>
Cc: <bpf@vger.kernel.org>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S .
 Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>, "Alexei
 Starovoitov" <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong
 Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Jesper Dangaard Brouer" <hawk@kernel.org>,
 "John Fastabend" <john.fastabend@gmail.com>, "Stanislav Fomichev"
 <sdf@fomichev.me>, "Steven Rostedt" <rostedt@goodmis.org>, "Masami
 Hiramatsu" <mhiramat@kernel.org>, "Mathieu Desnoyers"
 <mathieu.desnoyers@efficios.com>, "Shuah Khan" <shuah@kernel.org>,
 "Kuniyuki Iwashima" <kuniyu@google.com>, "Hangbin Liu"
 <liuhangbin@gmail.com>, "Martin Karsten" <mkarsten@uwaterloo.ca>, "Masashi
 Honma" <masashi.honma@gmail.com>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
X-Mailer: aerc 0.20.1-349-gb940a4174a3e-dirty
References: <20261020152804.39863-1-leon.hwang@linux.dev>
 <20261020152804.39863-3-leon.hwang@linux.dev>
 <20261020182553.534c8d6e@kernel.org>
In-Reply-To: <20261020182553.534c8d6e@kernel.org>

On Wed Oct 21, 2026 at 1:25 AM UTC, Jakub Kicinski wrote:
> On Tue, 20 Oct 2026 23:28:00 +0800 Leon Hwang wrote:
>> --- a/net/core/dev.c
>> +++ b/net/core/dev.c
>> @@ -97,6 +97,7 @@
>>  #include <linux/kthread.h>
>>  #include <linux/bpf.h>
>>  #include <linux/bpf_trace.h>
>> +#include <linux/bpf_verifier.h>
>>  #include <net/net_namespace.h>
>>  #include <net/sock.h>
>>  #include <net/busy_poll.h>
>> @@ -10771,7 +10772,8 @@ static const struct bpf_link_ops bpf_xdp_link_lo=
ps =3D {
>>  	.update_prog =3D bpf_xdp_link_update,
>>  };
>> =20
>> -int bpf_xdp_link_attach(const union bpf_attr *attr, struct bpf_prog *pr=
og)
>> +int bpf_xdp_link_attach(const union bpf_attr *attr, struct bpf_prog *pr=
og,
>> +			struct bpf_verifier_log *log)
>>  {
>>  	struct net *net =3D current->nsproxy->net_ns;
>>  	struct bpf_link_primer link_primer;
>> @@ -10784,6 +10786,7 @@ int bpf_xdp_link_attach(const union bpf_attr *at=
tr, struct bpf_prog *prog)
>>  	dev =3D dev_get_by_index(net, attr->link_create.target_ifindex);
>>  	if (!dev) {
>>  		rtnl_unlock();
>> +		bpf_log(log, "Invalid target_ifindex.\n");
>>  		return -EINVAL;
>>  	}
>> =20
>> @@ -10812,6 +10815,8 @@ int bpf_xdp_link_attach(const union bpf_attr *at=
tr, struct bpf_prog *prog)
>>  	if (err) {
>>  		link->dev =3D NULL;
>>  		bpf_link_cleanup(&link_primer);
>> +		if (extack._msg)
>> +			bpf_log(log, "%s\n", extack._msg);
>>  		trace_bpf_xdp_link_attach_failed(extack._msg);
>>  		goto out_put_dev;
>>  	}
>
> No, this is silly. We shouldn't be spreading bpf_verifier.h includes
> around, and making core networking code use bpf_log().
>
> Add an extack to this API and for the extack -> bpf_log() conversion
> in the caller or some "boundary crossing" helper.

Tnis will be a trivial refactor in the follow up.

