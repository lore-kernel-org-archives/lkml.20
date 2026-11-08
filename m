Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794149903;
	b=46oRiRG9xIVoWAAwyuktzBCJrQ7pmjmJvzr1hZxvIiXKDiaYI1vtex6TSOXHp8uG8XiH
	 ZCr1hHvhcjvnzkLFGLnmKT+RmuFXfCsm21aF/6uMPcXDigy5bXim8q8QvnlrFp+s6O5un
	 V31dojppW3I1NB0S8Fx8sOH5Ow0rAwAYn7HAvd1Sz/G2uX7AUgY0mq+mih3O1BOr9aDyi
	 dkLKZ4J8ACD/kAsRKtWSzEcuWtBmi4WQjeaPAPrmILTDkkQL1P/TTSJyTQx9PLAZczfgF
	 Jzw2m85kEsMPgmrnTt7Smsa7UBs9rAtIyZX5b53m9oIr0UjPYeAHrNzA0y4+nn/nDeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794149903;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9G8iDq9PgStkjmR+yV5JSPWsbqrzQ4CGM0C2KH6B3hI=;
	b=42wEQgZi7dsExqcNDyO3WA2EDs2gxXkVYtHpRjT0qw4V/tKLh73SVWtR4OTV6JeSiT1d
	 Bfs7kSBW2Vp8/58cJX133atOB0Qv0RbLkGrCUMNUdpB7pMkGfPr99mtWxZq951LWj4ad+
	 h2mi6lrizszhHaQXOAvqrQ9aaPiT/qiedfj1+zvKWiUpe6P9UKSgFcqMvyikx7X87MtF2
	 FyJA6EjIXo23FJou7vukmQJTPi0QUt+2ekN29kckrzgmxSRwX2jbI2DE8xIjxfG3wejDm
	 LlU0avU0HT0F35c+ZEiErivexU5JsOARH01z0ur3eZwwaISNiYL+Ae7cU/oRItsVojA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jannau.net;
	spf=pass smtp.mailfrom=jannau.net;
	dkim=pass header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm1 header.b=GK42ABHy;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=0eC0qwAa;
	arc=none smtp.remote-ip=103.168.172.150
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB789606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 14:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB789606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm1 header.b=GK42ABHy;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=0eC0qwAa
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id F16DDEC058F
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 09:58:21 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 08 Nov 2026 09:58:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1794149901; x=1794236301; bh=9G8iDq9PgS
	tkjmR+yV5JSPWsbqrzQ4CGM0C2KH6B3hI=; b=GK42ABHyjBtdZT3jPCUSYX7jxL
	O+a6kIhNL09GUpYqD/jfA30j1rRoAqkw3ihFAUhcmNyTVdmKDFJYhsUGl8owJ3lN
	Fjl/B/sXfDq4ZVvxEhYlerI3kh+pD9f4rtI2mGy0mDqdWy/LqrINfQ4cocvTIH4q
	sYm7vw+NRAL9h7z6Z37DdhFIcI+/1JhLh0OnZjA2FYumNGlh4JOdTN7wx/d6vH+k
	4ZQYWOD3RnyB4pynE833Zz2yK/X3NL7IPwpVa3kH3e26wsTIEzhp+R0sgVMzPmQ1
	jE/isXCy054cXhHAO8ES0I1PpSCpuATxGNU0L/BfEkmZV2Lc/0bRf4jkg7tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1794149901; x=1794236301; bh=9G8iDq9PgStkjmR+yV5JSPWsbqrzQ4CGM0C
	2KH6B3hI=; b=0eC0qwAaFWFVLOIZyG4V3PFu4nYgGrm7GW9vSqBj9as/vJRAar7
	Keg/DYEnt2297sZd43L/sMcKH7Qfi8CEBTJdGj6fEO0D2ohCUlw6AMcsYCUtUuR2
	Ig0WD5Ji5hQRYu6U5XYf2GtHg52W47MqyeVwlZ6zOtLwUV18k7xBfidOeB9R7RtD
	OtLI7KKv/VLkCAR+wMlOBrqS7YqBYQ9MQjyNZmwl6YXIljSaeuRlw8LYF32WqGSk
	YddmVZsIzdU7P0mprh+CAuetmGKP53ZqyIuAGwzDbKYa5K2gLrSTIlYBaZP0PxXp
	XTrZrUd2YIOWlx4x/7CLUTqbf7CA46vM5DQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794149901; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:MdHO9v3+QhnAbCLKsW9yxVcZ+LDAKYcH61k3QdC6fgbq2O2
	cKuYABEkfEnovQmP/bEwcy31U087wLclPIg7WeX7F38lR1SQ/NHgCf+L3df5Dl1W
	zlmt/rDmVDiZSHNTaHvnhpo+gQ2o+G+V76hZP18iyPtmsYb9Q0VH927q5hdwmyKp
	uWIUttXGAn8ivTvqUWQMi6FHYSUD8UB1i8AMXvxvYhpNp01OlyH21h7TNT+8CXPT
	+mK6juRtbv6BA/wlD+Wct9gW77e32/TQ+UjTAzMFy7qsBRrKirnNuB0MYNKNLSLj
	R3VovZ+v6wS55rblSUjxQrDdrcdfkfUGDqc47aA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:FVyg89EHhanLbUX+laxjF8YLXPMSx/LDlmdfiJ03Z3c=:CEgt00gN0SsvFLw1HJqV8+/SJMLe87wDDOVUlEnHRF0=;
X-ME-Sender: <xms:DY7watBszlm3goS9QnMsC-Gp_1lHJyNUYonfhfC29_fhVaXtl1qCsw>
    <xme:DY7wakeOY2b7m8CSgmR1FqPAHwAfNkOM6q2_9NtMqfbiAjAkoxTvQXoq3atu9Hmfz
    Po7rAvC-5pFHFwvJ5P-1uSSRPXcDLsOPHSp91Ih_P53DR5BxzuWEzU>
X-ME-Received: <xmr:DY7wakKm5BsrHEARH_yqJ3DjXzxF8jyKm1UFJGc_TMbla-JxMpz6yNugCxbYcyzb00NkbNjSmDwMPvvfsmRvPufZcQsZFqXdqTA>
X-ME-Proxy-Cause: dmFkZTEHaGvpM3yxaQgu7rtFJBM85WX2facGuVlKhrud5kZMZGJGAOISDqwmz6jyz80blO
    wFnvuQ+m27u39K5gByo/qMS1BLzGiNq1BRkmQyy2hF12i2ibFLohw6efovrLPzcmPSNOV+
    miVWWlsRsC6ziQhIxNbhhhfHh+0Ow3eEH1YtfkMFsanYBY0y8Y7sinzZ7xGJcQgJyThpab
    2T2NhRphpP4DzlG3paTwC1s40JSsocbvuTMJ6Ka/u1qxrn0JfZ0tLEZhXu56wJk4SzA+ok
    qB3lnuQ4sNxBb3PhUEXIkRRGuL+nSL3rIigFQZ605d5V+T5H/ioElZ+yvKEo2O+HxhrFVy
    S9nWH2NPcFxXRD+8VygpJa5YhRlra+pu6HcvORoCZpqn4DcQAYMSq8qcb9Wevlg2Sy7rYw
    XCuHk/P9H9q/jxQihgkORYjSScwJZMgGWD5q7dVS/KPQzsojZqZgsOXRZmhjD9b53wbTXR
    jlizqXWJpUajNTwE6BxevGgOFYOhK82RUXPuk13lg6JK9BPfelAkT33Lw4JNQA0CqEQbRv
    FI/KyJhVI9yRfc6QVqWNM7igKd0qcpzhGU1EC5a81E2LW717KD/8q+NnBzhIieuSl3b4WJ
    tX6bbuJmeYIA3jb3od+FGXmk0NayAiW87XHE9wMWVk5HgG6ItW47NBd/T26w
X-ME-Proxy: <xmx:DY7wan1XA8ZCjYIXi7Qyk39YzIfBzX4CaCvv7LGHUxBa92lLlxRUpg>
    <xmx:DY7waujoBaYELkOLySvqVA4BNbILcaDUq0P-VmfpW-3AD3n6QiUz7A>
    <xmx:DY7waoUKksn_a4PdtRnoXSJcRS9acH5fKSuIDq9_WZnRHx8zj_aLEw>
    <xmx:DY7watXHs3ciSeTtk4Bu82bRFmp-_bdaI71i9VuMxOI0WlEcEdc3Kg>
    <xmx:DY7wapU9UPUHTu8dgLy5yDRN2iV0y_DaXSvrzpSr-QYlK6RCk0YuXaKQ>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Nov 2026 09:58:21 -0500 (EST)
Date: Sun, 8 Nov 2026 15:58:20 +0100
From: Janne Grunau <j@jannau.net>
To: Sven Peter <sven@kernel.org>
Cc: Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: apple: Fix swapped paddr and size shift
Message-ID: <20261108145820.GA1462246@robin.jannau.net>
References: <20261108-b4-sart-fix-v1-1-dab7dc1e9adb@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261108-b4-sart-fix-v1-1-dab7dc1e9adb@kernel.org>

On Sun, Nov 08, 2026 at 03:35:11PM +0100, Sven Peter wrote:
> Right now we assign the paddr shift to the size shift and vice-versa.
> Luckily, this doesn't matter because they are the same for all SART
> versions but fixing this doesn't hurt.
> 
> Fixes: b170143ae111 ("soc: apple: Add SART driver")
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  drivers/soc/apple/sart.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/apple/sart.c b/drivers/soc/apple/sart.c
> index 66b99955b395..5f1f9ec5d311 100644
> --- a/drivers/soc/apple/sart.c
> +++ b/drivers/soc/apple/sart.c
> @@ -258,8 +258,8 @@ static int sart_set_entry(struct apple_sart *sart, int index, u8 flags,
>  	if (paddr & ((1 << sart->ops->paddr_shift) - 1))
>  		return -EINVAL;
>  
> -	paddr >>= sart->ops->size_shift;
> -	size >>= sart->ops->paddr_shift;
> +	paddr >>= sart->ops->paddr_shift;
> +	size >>= sart->ops->size_shift;
>  
>  	if (size > sart->ops->size_max)
>  		return -EINVAL;

Reviewed-by: Janne Grunau <j@jannau.net>

Janne
