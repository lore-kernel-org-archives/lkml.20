Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E81519CC14
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790132291; cv=pass; b=A0/V14Sc0xDOZwzcZDE3u0ijapVRa772Rc1XIj6tS9+wfifUaom6zpQlyLY3tNV7HdfT/cP+jfoz4KsvB/knyFtfG89Gu8HOLfGBy4PyW5fKg8qacvqAgrq4nUHvPRB3ELAtz2XRx9CIjdSPB3md4id0BffQtpjVSm2hw0v9WL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790132291; c=relaxed/simple;
	bh=l3tgQkR9srvgyKL7i57hlhGzAomIE6FEMYu5Sirphko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tw8kVMeR3tqHGMhGvau65QPxTaEjopOW7EVoyRLYAqk7d+ZRmT4cM9OQkIBEcmsuMtEugzU0uRV0gNWVNB0bO0ELYbByoyvZC90xe6JOQEcsMMI2rHfoZ7FhrK6VTKja9enjNM2nLZ77zD8WXG8coEXqxBPFzmzr2xd6HwtQxCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=noRUpoMB; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="noRUpoMB"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530de452c33so4725791cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:58:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790132289; cv=none;
        d=google.com; s=arc-20260327;
        b=fuLOj2aF1C1CHriuXMX4oVWzoq+kP8NWdxfIs7c7SRn1ujgrpsRmLSe48rvjtC615B
         ATqBQQ7NklhphFF68TphluKE928Yi6cA7aJhYTAwMVfgM20BwVo2mAA+2O1ui7EZ4Nnq
         xsOWHVwQrSiez/MpvE2WoC4pU1/jwyDZM0AHxyLgxgfrHvEcrBz0umJyQ9koBsVbaZqR
         g8aLEZDzEa29LtuK5w+YWMbR2qlPcqwEK/0INa8aqwD4NnAoTLthnyzSylHNQc6XIafL
         io/uBX9hK7CGuQfoW13/+mrHlQaKWqk5ntSlp/mS7nUOL/hXQJZl82o5w1ZZf+2NWrWA
         sWZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l3tgQkR9srvgyKL7i57hlhGzAomIE6FEMYu5Sirphko=;
        fh=xAicSdJp5druupjP9OJhZs5TTbfmSq/v+jOzbNuuslg=;
        b=Vr0pZuEwD+ScM+ra0qq2JVE3PStlYEQFsvYwcoQP5Pk21jmuMx42Ba/Pf16nz8N/fl
         U9+cbBSLPxKFil18+9c6aWBCjRW7cFEfiu1jd+MWC+hYgg5q8+EghRCSI6QeEsG5Q4jN
         6JDQjYkyIII6IpjEo9/IO7KJVxHlFMUZO6V32rQAMQ/ZyD3BEzie0XwCtRx8fA2fLZ1V
         zLz6nHObw7MiUEai1/RjISd6a+k38RJ/62fASn6EomS4NhLzfgogav3QRPtIHZd2EfFA
         YHO80IKMc5zKzo9Ic+E/emxIDvwJmCZDE0mkJtnn4o07EAOK0BVCN8lQ47mYXlQAFEf6
         FQcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790132289; x=1790737089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l3tgQkR9srvgyKL7i57hlhGzAomIE6FEMYu5Sirphko=;
        b=noRUpoMBzhTWXQAK8YbGy737qnQ0CxsuGRYEQvGtZ+QaTjPWRMZfJIhJe+SYmB5Vdy
         EocXWF1K71ONHLJA+Pmmd7O6qLYyicwLlyYGdevdZHR6TU78Sq8oQAKxMoiE+o+qEFKU
         D+eRnRqvdnPWiKOCIbFy0c+A1EnwKX6+Omdz0o69Aye0msbLT8Ma5CNBqRcrNhqUFrX3
         6kcM6QXh+GiQyLxBYx+rMS9UAkxd8ncvX5Yh9y/Mpaj5VGb9Sr145lMghnD6bc5v8tdr
         UKq1Mobv6sHK/FfU2t05TbJX2DRT52CDFBBRFaLOnpveMGAkm6Z7DZRLyyikGWLwgWFw
         v88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790132289; x=1790737089;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l3tgQkR9srvgyKL7i57hlhGzAomIE6FEMYu5Sirphko=;
        b=ud8sbu771x0tbU/6tmLMHR66/mvPBFQtu5VZv9W7a3g/n/g0ovqCMkwYRCgUuGpFN4
         gQH6OSmkjKBXe3jQ2d+MC1vy9RuBbGYCHPVjRI7YHupy4KLhOoELTcW2p6FA523isw2T
         xwvBlbkJnwdPtR2m/rWcuGIWj1jyYoov8Ukwe9VIr9phlYgZb8FA6tDpP4V9+JKlTA7t
         utN7aG34WUzpL2qc1iGoU60gkF/vGkuKawjreO9LwPCl2KdA53LYEq2mioULsgwXsXQe
         yR7PKxNX9pnQXGVlVMi+FR9lTK1n8LUVKncwaBv6J/Q4aSp292bBzZVQgz3he1eJxlue
         uGvQ==
X-Forwarded-Encrypted: i=1; AKwUvByW/Z43smyZtKtvgWZOIWJwfQHrXxeTWy0yeuf8Qzw8GX07fikFseElkl6uIs8hNPEOZyGn3m/+ajCMnic=@vger.kernel.org
X-Gm-Message-State: AFuF++l0QINcoCcq7YD3RfHUEZ2H5GPSMCYYkPVOnvt6v8kTh1/KR//h
	DHo9Q7N7ba3NKoJ6fzkjmN3OUmm+CfkKnKcKBxgMe0sd5sPXKgY27IUPTOGNGYCBFvm1w1yGs84
	GTO4gG9RuDS9KmwOEY4EljUsYPy6zaCb/JlcibFYK
X-Gm-Gg: AYBFou1y/7pcJnUEdy6FoBLCsIjqBSCfeqqcuQGlw0fVO1ScZ/3jqMMP5urNQFixO4W
	exho6qbDjhoe5iBmlK8CxG8k0s9Q/Ta2xtfjPbJYp4G/AasW1XgZlv1v0+OelmR4VOmcwYDvH4j
	yfflHkLPNhFnZumJcNlwyM0YsSKqYVcMxN0DfQMEvbnpxh0Qy1q2LpN3kLtxQVPR6rukfT2wnmV
	R/arUnkOeiH4nHTDhWN+pRMjMP4oRZAZ5TN/1Mvs8V5p8mhD06CD+tmyG+Y2Em5iHOcLLg/ha6j
	EcNUhxwUOwgyNR0a9TGF+Z7WQ7nWoRF+u16MRa4sGxHraSlz+0hO8QSJwZ5xiQlGsQ7oYudOfR0
	pYQgCUTGFoa7u1Cvr12X6vN7uHVVNoT8Or8j+DGX6nhnv/OUxjtpyUZSj10WC4VFGOWjNwwa40t
	L7WDOkSFs+FrzbGyE=
X-Received: by 2002:a05:622a:410f:b0:532:d36c:7097 with SMTP id
 d75a77b69052e-532eae7c962mr21206521cf.63.1790132288661; Tue, 22 Sep 2026
 19:58:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920063419.3587332-1-yilinzhang@moonshot.ai> <CANn89iLUNiEjX4U98=SsQWg5BSV7=cV6ZzwPBiDC4Hu-6US6Lw@mail.gmail.com>
In-Reply-To: <CANn89iLUNiEjX4U98=SsQWg5BSV7=cV6ZzwPBiDC4Hu-6US6Lw@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 23 Sep 2026 04:57:57 +0200
X-Gm-Features: AcwNN1WdgL1agSkiZKUcafkk9HpYDfB-wvgSX3PVaoVjaGY9yaq8Zt5Tz8dmB7o
Message-ID: <CANn89i+rkvu579v+F_PBoSvHMr=S+9vVLtr47so9HtAQaWB=Aw@mail.gmail.com>
Subject: Re: [PATCH] tcp: fix use-after-free of retransmit_skb_hint in tcp_send_synack()
To: Yilin Zhang <yilinzhang@moonshot.ai>, Kuniyuki Iwashima <kuniyu@google.com>
Cc: "David S. Miller" <davem@davemloft.net>, Neal Cardwell <ncardwell@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kimi Security Team <bug-report@moonshot.ai>, 
	Weiming Shi <shiweiming@moonshot.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 4:49=E2=80=AFAM Eric Dumazet <edumazet@google.com> =
wrote:
>
> Make sure to rebase your patches to latest net tree, not an old or
> in-house kernel?
> The context shows void tcp_send_active_reset(struct sock *sk, gfp_t
> priority, at line 3694
> rather than current net (line 3887, where tcp_send_active_reset()
> takes enum sk_rst_reason reason).

Ignore this part, I was looking at an old tree.

Make sure to not hand-edit patches before sending them.
