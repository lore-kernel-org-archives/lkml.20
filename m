Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794609416;
	b=W1Fx8UA0gaWwMNIcT8fIaeAyIJVoV9/5RrSTpGBObp2vf4JvLHaxm4CIJu/IAm2aiPat
	 plVOlBPRSLcVCVQL/BKhO3f9bAgnoYCHx3+lS016/p8QjH8PQ8Ko56s3d14MGDdCj84NK
	 /JW+ZDsIAQmOI45nW3hzhLOt/VSgsks5LYdMzHq80YrKieBmegge6JCC844zVleeXYvYW
	 jZfU/FZDTOgoNi6lhq/TdtRP6k4O+rfIUMqpmbsUJ2wx9sRHTuxWsbK1XEpbAqhwRbIpO
	 v9Q1RU5NxaPIe8cqk3jnp0/OAfMWILRbrVpc6q5Km2TQUpmLjWAJy7N+p8lq5A1f4Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794609416;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=AF9d3/s55owBhUJiIiIWyiUVQx0z+18PRAIyL8wj9Ms=;
	b=QVgfI2IJyk4JH48Q4vAwzyAOwpuZGjkm7HJClptEm2gMhqpKOKpGB4g9Nbc45qxPH7ei
	 iNQye1PQpWD190a/wxoYv4AMURWYP10tsGfynxiuRioF1dBQLPs8F5P0CyTbX4PW2G4Cd
	 kyVTsfio1RO4Jo1TITv0DghTnTkWLsoTcZ2EILHmQK7vlBDCcczOHq2UhnG+Qj6Btjgex
	 2gRdkNmJrtQs9Rr7O6cpmDXQVa1Tt0H/iec6bBQgqlpjzeOKMahoUiWWP32hvzzwkKo9y
	 QiRbo/zC0bHVAMMUNph9y1AwpcYf4mx3DdBcfzwfA8n1rBbYb9Jw1TTOHHXtdgf9mKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eoXoUkhH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3629C606A54B;
	Fri, 13 Nov 2026 22:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eoXoUkhH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EB9E1F000C4;
	Fri, 13 Nov 2026 22:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794609415;
	bh=AF9d3/s55owBhUJiIiIWyiUVQx0z+18PRAIyL8wj9Ms=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=eoXoUkhHKqTdbPP8de0fEdn6CQgARYdt6dgs97p/KHNPMDVziBs3Hl/+zWMi4cG5u
	 FdVjQmfLaxAOM0PFJRLV6px3ZPdEz4gdmemzBh24ggUnkvL49qKSwboy/msJMljC8s
	 73j+Nl7o1KnQ404aJsMDIuYqPUw2nbrUqj75f/JH7YuiaZott3u25w9za4iNGVMkck
	 D+vLzQWjm8Q8zLFFo65n3pvX97KJ6efNFdn/6BcUx/gLu2PV7RuSL5/qSdn2H4I/mf
	 j9xUYHFm8VFH9TG04ln/0Mb0Ns83ZhX5lg9HeDmBewru9PN5RV1BS9NPkOTznAdnJe
	 GJ+C4OFwmQsAQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id A595A326384A;
	Fri, 13 Nov 2026 22:36:50 +0000 (GMT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 4/4] regulator: qcom-rpmh: Add debounce delay before
 disabling regulator
From: Mark Brown <broonie@kernel.org>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, 
 Saikiran <bjsaikiran@gmail.com>
In-Reply-To: <20261027-regulator-off-on-delay-v5-4-f9c3b128c6d0@oss.qualcomm.com>
References: <20261027-regulator-off-on-delay-v5-0-f9c3b128c6d0@oss.qualcomm.com>
 <20261027-regulator-off-on-delay-v5-4-f9c3b128c6d0@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 22:36:49 +0000
Message-Id: <179460940931.590303.9395310796576570677.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2417; i=broonie@kernel.org;
 h=from:subject:message-id; bh=12pt1zHDasK7LJ9maTvmL1/ou7W8H6tUQyLIeXUDnbs=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLK+T2SapKf4ZNKZDg69QNP5j2NT9kgueOUgJGySF6C0I
 1JfbtvFjlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAEzE4SPDP/OGPp5H94L2LCy7
 rekdI5LtqTT7Z5CAW/RR9siV7ZNLgxkZFkbd2TzjpaUEt7jyMYeNCqsEUkK+/1z0Vaq8V6d/wpN
 jXAA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> Some consumers rapidly toggle a regulator off and back on, e.g. a
> driver that disables its supply on -EPROBE_DEFER and re-enables it on
> the next probe attempt. Sending the disable to RPMh immediately causes
> needless power cycling of the rail.

Looking at the code here this doesn't really seem at all driver specific
- we could implement this in the core around any disable and enable
operation.  Is there anything that really ties this to the driver code,
or could it be factored out and available to everything?

There's also a bunch of stuff from Sashiko a lot of which looks valid
but I didn't check it carefully.

> + * @lock:			Serializes disable() against the teardown
> + *				action, since both make a read-then-act decision
> + *				on @debounce_delay that must be atomic to avoid
> + *				queuing @delayed_off_work after teardown has
> + *				swept it.  enable() needs no lock: its only
> + *				shared-state access is cancel_delayed_work_sync(),
> + *				which already serializes against
> + *				@delayed_off_work.  @enabled and @rdev are also
> + *				written by @delayed_off_work without this lock
> + *				held, so they use READ_ONCE()/WRITE_ONCE() there.

The work doesn't seem to write rdev, but does write last_off?

> +static void rpmh_delayed_off_work(struct work_struct *work)
> +{
> +	struct rpmh_vreg *vreg = container_of(work,
> +					struct rpmh_vreg, delayed_off_work.work);
> +
> +	/*
> +	 * No locking needed. cancel_delayed_work_sync() already guarantees
> +	 * this work has either not started or has fully finished by the
> +	 * time enable()/teardown proceed to touch shared state.
> +	 */
> +	if (!_rpmh_regulator_set_enable_state(vreg, READ_ONCE(vreg->rdev), false))
> +		vreg->last_off = ktime_get_boottime();
> +}

There's no reporting if the actual disable fails which seems bad.

>  static int rpmh_regulator_enable(struct regulator_dev *rdev)
>  {
> -	return rpmh_regulator_set_enable_state(rdev, true);
> +	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
> +	s64 remaining;
> +
> +	/* See struct rpmh_vreg's @lock for why no lock is needed here. */
> +	if (cancel_delayed_work_sync(&vreg->delayed_off_work)) {
> +		/* Queued disable never reached RPMh, so undo disable()'s flip. */
> +		WRITE_ONCE(vreg->enabled, true);
> +		return 0;
> +	}

Nor do we restore this flag.

-- 
Mark Brown <broonie@kernel.org>
