Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC71D38D01B
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326227; cv=none; b=CDVUgXO0YDC07ffYgAqJ8fEbDgoRbe6JEgKWfbpGPvs19TKzjx7/zJs818PST/4gcxzuuoXQBMYvgjMGU9U41Z4wAV/IfIBquSvWvQFSrZ83YOg1TTEigpX6euiDZIQIU+4TnCde3ltpzPpTUep60tUEd/krn8Wk0V8ntXao94c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326227; c=relaxed/simple;
	bh=8gagy4Br0ffj4FJnMaaU3EPK9gUNhcG5m+wDZFe/L58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vm7s35hT75iCZ7tV/Bu3kJVUnWJrGbewZA0gKxdUVcaeqx0z1c9grkWkkcN1Jk6LWUip2FOQhf6H0pNLxy1oRvLf3QSDZgj4m3DyODoCG23cNBwrDdzsjUvIA6RzmyVERHQHu0Xe29FBGcTwlpAk0x77W05AlQ7ybmCNatO5RAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=lNa+5zxJ; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="lNa+5zxJ"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-88c72646f03so1709415b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1791326225; x=1791931025; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=srtPY9GyX39p5JfD6t/4b1goE6lD3CZxKoKqv9LGd98=;
        b=lNa+5zxJcBCBdT+qEA0AMyh7KgG3NKVQTTPdWheaa7arwZ0dW1PsBPWnphEMPvJdOy
         BYlJb/D4N52bvQQu45WDpcC+5WOlNVUADaOzG2aZ4Hu8F5eHi8b4+nKr/coaJO25tJlK
         8qGGQ9uPJxd383pT7qBFfypIc7DoVbMvJCnMCO3YJW5Ry6DcmQ1jBIbTbs8yXCQwRIlw
         3w/OifTsyFZ10vbOX0yS3oFE+uibRU0ntIOyF4kDKzwmFGBT9pvx3cbOQHuRWEtSprNp
         ki7Vaip6QbxfvBTl2XMfEFSr69X9A/Vuu0iGHdT3LvKBj6hPgthPFy1WUxbZFDklNaNS
         52qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326225; x=1791931025;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=srtPY9GyX39p5JfD6t/4b1goE6lD3CZxKoKqv9LGd98=;
        b=sdqWL7mNutCgQlbR7HsUOhqJKMzgYBPCbTEJTD2FPHsoRowARQNVefZ0dr8OimZkaP
         M9nCovKK7ZbuPYKcipkNtLS4MiDS44CtblDYImA+Cau++yy/qnBwrYAYvaLYIb8tp92a
         CNW8emrE3cmmP0AzpjnmdhbFCYLe+qNuu0/4OJDS54Fbd/MaKs2Dr4dP0+FacXpGDBRE
         NYjAX+y8/jq3P3Z2VSZ8VWfe867esCY3FHa0Ix4RtHSNw+iWwTOTc7n6wJn7Ultmw01N
         puZMQ4Ft2OR8iWmeacDiFjIonzqHxM6U3N5I3drCH+V8MSJ0htBZP0+muX0aUNq8S0sq
         b3tw==
X-Forwarded-Encrypted: i=1; AKwUvBx1q7tj5ZQLsX5tKugziTl1doKwonYdqe70Q/LkOqZLKBK1g7pPln/fkcpc+azDGRcRPmhkZ7qtE4HM1r4=@vger.kernel.org
X-Gm-Message-State: AFuF++lh8EBRZiGKFA5UbxR4FI4azjWFV9mt+1hO5q5LD4OP//OfRBzn
	PkevwcajywRIvWylXfP1JAkHq+QvZ5HG5PGX6kmH4kpkFrv7uy/lgbqYmR3DYS+Hya8=
X-Gm-Gg: AYBFou1mc5uhohZY09yLPvf5upLQnXzbiXmwzdoAEUscGFHHKTVC0YavJA1uvr6mtte
	BZrkSfYFUnZ7D8USpsPW9a9sXPlzO0e4cwcO4WYBq/blPXcnFtfAHzOXmJvN2kvm9Tvv1jZjiQb
	FoCCT/3owGw/HI1ZsPZVtVBi0PqVCQ0V23hKrFXBk5I+1HyoSu7NcXrg6tCP7BRdfHuaNbx3gK9
	19KPPYLboB73/yS/ztgqFPadXwzQYk7wB2/cNbIYUjF8Wbj6xkVXQcsYI3G11ftxexcCkVOPMYu
	olnGWG6DuiBvEAtsdoXQnASxTkrVnb4+kO8iULDQU7F/dMFQTmKubMdVA72gWMXXXRl64FJHM0x
	aPI08DRThnQiKFhK46culytkMb1E1Hn/JD0CY/JU5LvDd+OVXzk8Z0bcpo2SzYtw2tp0kPyxIfN
	6QseYUCJPwM9QOrElhi7x1b8qiRex7cr+4Rv/W93TCWniay4fBxXy/mQ7DBvaYiPgBBFFj1RxzI
	yl9IfRsOJyImg==
X-Received: by 2002:a05:6a21:6e84:b0:3d3:adbf:7779 with SMTP id adf61e73a8af0-3e13401b746mr290392637.21.1791326224911;
        Tue, 06 Oct 2026 15:37:04 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4b::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd0a58225b8sm522976a12.2.2026.10.06.15.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:37:04 -0700 (PDT)
Date: Tue, 6 Oct 2026 15:37:03 -0700
From: Joe Damato <joe@dama.to>
To: anmory <anmory@protonmail.com>
Cc: netdev@vger.kernel.org, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, linux-kernel@vger.kernel.org
Subject: Re: [RFC net v4 0/4] bnxt_en: Make RING FREE more robust
Message-ID: <asV4D3J7K8FzQO4I@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, anmory <anmory@protonmail.com>,
	netdev@vger.kernel.org, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, linux-kernel@vger.kernel.org
References: <VyyrJwrwBZEIGezDRJP8QPxbcsGROaxnmohLCnzNQY6sX5CEt0BK3AEC_0MGBx6OxGf4H5UG_xQcqgtAonwmXLdZ5Bd3INWMsof8Oj6ruqg=@protonmail.com>
 <asVYjdbZGMAEck2t@devvm20253.cco0.facebook.com>
 <eXJey19uF3K9zJxeuqly_VAGq8y6AiyexdzLKxv22b7m1Av025Dp-w9cGWDelfFwBqcD-wtUIjtz7p1ZYKwlKeyzd3vHHpdY7U6FGPIrK7M=@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eXJey19uF3K9zJxeuqly_VAGq8y6AiyexdzLKxv22b7m1Av025Dp-w9cGWDelfFwBqcD-wtUIjtz7p1ZYKwlKeyzd3vHHpdY7U6FGPIrK7M=@protonmail.com>

On Tue, Oct 06, 2026 at 10:22:51PM +0000, anmory wrote:
> 
> Hi Joe,
> one important detail I omitted from my previous mail: the affected eth1 interface is an 802.1Q trunk with multiple VLAN subinterfaces.
> We also use Keepalived VRRP with use_vmac, so virtual MAC interfaces are layered on the VLAN interfaces. Traffic is routed/forwarded through the host and uses conntrack/SNAT before leaving through another physical interface.
> We are not deliberately toggling VLAN offload during the test. The reproduction so far is simply to boot Debian 6.12.111-1 with this normal network configuration and workload. On one host it reproduced after about 20 minutes; on another it reproduced almost immediately. We have also seen a previous occurrence after several hours, so we do not yet have a deterministic packet-level trigger.
> Given the VLAN configuration, Eric's patch looks especially relevant. I'll test 6.12.111 with that patch first as you suggested and report whether the failure still reproduces.

Seems likely you are hitting the bug Eric just fixed, IMHO. If his patch
resolves your issue, please let me know.
