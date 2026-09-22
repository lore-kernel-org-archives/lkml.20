Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B168272816
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790047836; cv=pass; b=hOaSYE6thowVKX5iW4YtsoJYH5WHHXGezV2lBHofIW7ZCRwX/cU7Cpzfj+qiN80BEs1BD1Y7EkXzx7ykgiXuBXKJTmdcvR41UDmLCIjmbE61eqZPIN0x9o3nXwFQRtVx5cMdxgSoE9aP2PIhiKgLS/ds9YfphRNGG9ea3JqEaKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790047836; c=relaxed/simple;
	bh=aTiBO3mrNcxiXnOw+jwAsMIGQiyr5m299oOoBDWZ9oE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H50zesV/xAN1zAYvHsOpYcntgkXLu+xqrL53C7CM8U39WVF0SSr4A1zRQ4mfk0Bn7ecvqFNe1B4caC5a4mqqohgKILcGWI35Bpn6SvVvGYl5XXNDwLjMFsPvFx8rhcfUXTilW3Tb5aUQ8+X5Z8F3LUocs6OgYRAfE1c32E3IXkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Hf2DPhdw; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Hf2DPhdw"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c5so2806271f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:30:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790047829; cv=none;
        d=google.com; s=arc-20260327;
        b=MbIpi9vZouiwHOFcZ0Sks9SaylqF/cm7moc5afM4Fe45FrbZVbT98qn7bz7j43qxbp
         DGMAV74Of6WFMycXst2zKfiKK/wSwF0jv+7msTAv5hr4/mOUsWW9A6ASaPghgcuRZQKf
         Yj287aIiio3OiP9xuiz0+JiOBAKwGXSavUAH8gP22NAptW54HTgPkwLFNHnrCw5ioDO6
         aZYl/u12+HKI33xpwrfRQE106/Qy24WfhaLjlcsjGnLPTCkGDg/HT6vOCRvMSNRXqLn6
         d2N50/+Pe54z0ytIqFCG2oIUx1vEIxPBYzIRqXOHrhtBZ0NoKb+lfRPPNdTUG9ULXNit
         nF4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=osxaavUpe5/OcK6lQvqkIdeeLn0Ti2gKyK1UDY2EViU=;
        fh=H22vbgB1Arrn54W3N68qBZcIag3l7NAxsJGLvkmTYIg=;
        b=c/zk4u2p1zbpobk62+WYgxNsnnEjEaoZ4Cfuc2bwtjUjLvKzjEKCk/v4sMFeF94Z9q
         AQAc8CQODzKuJf7Ec9/3MoPGsQ7/p6H6FnzXNBKGiD5uHeqfPXKjF6ZZJNJoQNgxCKOp
         s0J8igjGikDAn4fh/U7w2aQPA5d9LkGtQVYJOWr1GkFgooS0dbY22DVS1ZRfpgS4y0mD
         /dCR/ZMuyzn6BMlu7x0jlwFFuKq5fWCeW9Y5KJB+6hlrlFpWmB8M+23TO3kja4MiFPAK
         l5AH8D/5XivyNt7nXuFXCt9pTc+0Jb3rNGikcE+sshIupjlNvM2RYs8NI5jNbufo+2E5
         rZng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790047829; x=1790652629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=osxaavUpe5/OcK6lQvqkIdeeLn0Ti2gKyK1UDY2EViU=;
        b=Hf2DPhdwL8BIHYEma0/+zUj5e6YelQEeSJBYTpjxdOOOHPXN6//28f/w01yUm6QWHm
         G1FHAnY2FBo6c+NxCAGw8CB6OILdwK/AParRlCiT776FPUOd3an3zIwK39Tb58YIXkOW
         y3e6K4aUbF4PGhIeVo/9opQjw0LQ5OLWa/7HuNxeyDy+ywcZLY7/Ujx6deeHA8E8/0mT
         Ul44cxruwZ6Fo+M7qnW0TUvS1EbjM2zk/S1R4hIJEWldEx4IQrVxcpCrMyUx+JvcgvsL
         gSMQx0a9z++6zdMEXhUvolLphX3yv1j9tU1dnEIheloVGic9w9EFGLg32V2Er1IExjmB
         en3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790047829; x=1790652629;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=osxaavUpe5/OcK6lQvqkIdeeLn0Ti2gKyK1UDY2EViU=;
        b=sB5D9ENqe4a3KLA/2k1gF1q5Mtzrn0gQYlKEMwHmNYDuSwD1M7vmfpcEW65zdvFzTN
         I/H8qH7T2nLX1zQgesjx+e96qqJjuveBwuxVY7Pr3V2b+jvMh1R6uYoCtYaahXvWK0hb
         Tj8+tMCiG4IrDMtE5R1iFytW103JOBIL2VCv6zMInuC7tU2fGnMxee2IKnWvN4dsoClm
         NPkrLByywmyLOJRSHWeCc1q9rlyf1YvXlIpYum33s5nm37Z+3wYo3PAsRnGTPx0fiTpy
         SruUq2s36ToAtFrIdfQ+uR7gsb3G2VBKJa7XcX0M1cdpA42Dl0+BB8ySA+x03bU2dUfs
         pLvA==
X-Forwarded-Encrypted: i=1; AKwUvBxCEdknhkCe2LiHYBUP+QdKK2nHI7LiEns2Fn54gEDFe1L8q2DJYKsenWxMwNwm7ZzibYwi8PbzJkrsNEQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lfrLhfCP3j42H3jYShFmDoxEgSped5sa9EkSIePDxUbZrjbpkO
	JiEzRgZu+UHYdWgDvtRzyzT1fcDLVZ2VQwW40r0XX37ssQfPQ36ckDx82T/mBG/str/rowTUIss
	wic04TEzLFUpZW96zq0MgfxKBU0Oo/hzsyPwU+vE=
X-Gm-Gg: AYBFou1dD4GzpvJI43awc4wThEAj/aNmnuCPBDc2JiW5ELs+gv2nhVaCyIRsUDw/HZx
	OvXEMmlomDs+nx2SzLL7Iw+XOKQX6ALVusXfh28sBDD1nG8fkGGNuWLu8k/e28fTINfxM5KGaK7
	nMKc9Jp2GRdoq7m5Ej8GaUXd/E/J66Jd7jXHsC9iPfpYU6+6k4k8ymMO2eUNhXR4baG8de+7bOy
	mdzPrIfXsFVOkjP4Z4Ys4J4ufFMseSXJJRSFSnHzgajwYFjTH7BNv0oS7DfzZSRIFsTrm+cpaKh
	iVjptlVBcOnUx9BrOaDi+JdWrxy5UWcNhe/auYJIPZNBYj2ua38AArldY4JCLUXgEr3ulFGSbHh
	/G6tTzgr/E6ck865qShC11yW29c9/KSdyRPv8O5/3yXcIgYw7DnypElxwrrtFE1mfNBOBHZNWA2
	0H56bXZg7BfACwFgl6dYQ=
X-Received: by 2002:a5d:5d88:0:b0:485:8c16:5efc with SMTP id
 ffacd0b85a97d-4871e388146mr19458446f8f.54.1790047828467; Mon, 21 Sep 2026
 20:30:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918132915.1236312-1-zhanxusheng@xiaomi.com>
In-Reply-To: <20260918132915.1236312-1-zhanxusheng@xiaomi.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 21 Sep 2026 20:30:16 -0700
X-Gm-Features: AcwNN1X-E46gE1kKN0KR4-KlewRZAHoCv8otYCBRLQgHT-byYX-iOcq74Ncnftg
Message-ID: <CANDhNCrT-NFWyPynP42pHpZdaQeht_emoE802o8kgo8G2JU81A@mail.gmail.com>
Subject: Re: [PATCH] sched/core: Account PSI IRQ time to the execution context
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: peterz@infradead.org, mingo@redhat.com, hannes@cmpxchg.org, 
	surenb@google.com, connoro@google.com, metin.kaya@arm.com, sh_def@163.com, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, zhanxusheng@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 6:29=E2=80=AFAM Zhan Xusheng <zhanxusheng1024@gmail=
.com> wrote:
>
> psi_account_irqtime() has two callers which share rq->psi_irq_time, and
> they disagree about the context: __schedule() passes the outgoing rq->cur=
r,
> sched_tick() passes rq->donor.  Under proxy execution the donor is blocke=
d
> on a mutex while rq->curr burns the CPU.
>
> The tick charges PSI_IRQ_FULL to the donor's cgroup and advances the
> timestamp, so the call from __schedule() then finds delta <=3D 0 and char=
ges
> nothing.  The delta is not counted twice, it lands on the wrong cgroup.
>
> Pass rq->curr, which is what the call read before commit af0c8b2bf67b
> ("sched: Split scheduler and execution contexts") renamed curr to donor
> across sched_tick().  Without CONFIG_SCHED_PROXY_EXEC the two rq members
> are a union, so this only changes anything where that option is set, and
> it depends on EXPERT.
>
> Fixes: af0c8b2bf67b ("sched: Split scheduler and execution contexts")
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>

Thank you for finding this, and thank you to Hui Su for testing it!

Acked-by: John Stultz <jstultz@google.com>

thanks
-john
