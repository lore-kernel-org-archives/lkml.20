Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919339;
	b=t5/3iCD9PweZpSSWGRYmEBYSni1ubJzHNleNdK5yud4b3yIh/rsvQ5EkR0f0T1DmVXkh
	 2WjziO8zmc7eeKHD2bfI/keH1NSmPw6bg2lrJDjj3G25pzKXE0ixetv/6APfjRp3jRHpk
	 o+kDej3WjkBCevqsWs7j2XhBT8CAS8fg3goztgrUNWrtb2doN91jzJGBWZKEPgeAFiqM0
	 T6IamQIk0R2UOOAXsHOdv86YcP5ewJJQ/nbkDT6He+gWkH51/y1v772I1CgDEcXyvShcx
	 6ATbKBNJRyTyCX6br2eZrbnszbY4gMn4OoVd+QDGxHD4ntZrnhYkwhl/XU+dO6F/xiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919339;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ebk/52wLUJEtZVNkqmzXk+Eiklh6s8RMno0Eu2ztla8=;
	b=qPUgmTidNqbTcRqMe1jXBktCdmb+9/M04WZ8jPmQQuade/G/o5RuR7Dkfo+dGRuoSYVJ
	 tP6QZwmsmuj2UmhhiFpOK/rZRXX3/cCoVZsRBSoafPF7VQ/0rjvVKJhzdtPZBMifIsjC2
	 u0Qy8o2A0K76blqL6EMV4Rj3brTX2XHB6nBzsxPJTtg7+ZUWRG9wfJ0IcpE2H7FQ8Eqed
	 V0MeVwVcn6Wa7hjVWdPJR3yJp4JK1Qtx2fSsx6nMPSPwDc/ebKq+SYdQYaMps8S/wQwpF
	 Mfn3+Li2KY5x0zUswTqHk6qvL2p0vAaTYCdMi0Xnj5psbjyuPpS9bb5EO+p9spr/54g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dZP0NnBv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64754606A88F;
	Tue, 17 Nov 2026 12:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dZP0NnBv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 404AE1F000C4;
	Tue, 17 Nov 2026 12:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794919339;
	bh=ebk/52wLUJEtZVNkqmzXk+Eiklh6s8RMno0Eu2ztla8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=dZP0NnBvc9k1cmJQ59R0I4aYvRzjnc3lL2dW6uByA05zPYAqzrTuVYg5lQuAWr57D
	 Cbap/3BosZbA93DyWOXuioDlNuUV3g0wvXXqZVlKOfy0qHbPwGP/0reUNzq1U34ZRU
	 A8AO6YpvGWdyq8zmqbetT/xxxnPwCvWH37TsHwEQU6hk4je2et8O1LRfs6LxaDVLW4
	 ZtCUy2H4eev40nIsxJsRfBISu/yEqGePwX5Sg3Vi+fJUwHsIemIHp4ze7OGP3etgmY
	 nLYYe/8/jLs5IMYPCfeXmI5XryBUNHgMy76UpFZA7h6OHZE7dsWLKLwjX0AVPR1xYl
	 I7vXc9MeovKTA==
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
Subject: Re: [PATCH] media: iris: Unload the firmware before hibernation
From: bod@kernel.org
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261026-b4-media-iris-unload-firmware-hibernation-v1-1-c1af57ac16b1@oss.qualcomm.com>
References: <20261026-b4-media-iris-unload-firmware-hibernation-v1-1-c1af57ac16b1@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 12:42:14 +0000
Message-Id: <179491933438.2846709.5025592842946674041.b4-reply@b4>
X-Mailer: b4 0.17-dev-e3fc9
X-Developer-Signature: v=1; a=openpgp-sha256; l=3425; i=bod@kernel.org;
 h=from:subject:message-id; bh=Bqg+x2pkPaRXP1baOBhPEzj+591i8jMh0pwRPliYxzY=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq/EumHSj5jiT0Z/uLcjdRm7K/Ut5pdp12veJG8
 AXtAY1ZTtWJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCavxLpgAKCRAicTuzoY3I
 OrpBEACVtZ5kWhNMhtVFIzBNKPJBkLnSyXn2h/cRADp9Gprusft27XzJKAPle0X9I6bJSDcxGub
 HrsuelVWaX572ESwTBnuxPUQF/8lwoDHweMxaBltco+jEm1FRTlOzXhRYLGMMZIeflr+ozyCE1U
 ztEr5Se50VBCba7E9tWg619a1/mjkn2S8B3M1z6gZLj9fL9jbAF7EgZy+s38BontpDB0zFoWIWt
 PgQZeC10GtyPfbKthNLtPu2iumVJNiDgsj5Z2xA77zczPZVytRL6WNSq9nzfzYUa2BqAJb1WzFN
 QlaWcjBmNE5JZ/rycd0y849VEO2fjrzvJPjd+fwjk2Is887e4hO1vBuh7klU/HrnFDlbZ3CFAkt
 dkSqH5PM0TeocNFLzPUSQeFcAR+Q6leqWLhdxKyhNFXov0MoIhY/b5zXvBdCtDEYLpwAO5qkn2D
 n1f9q1DnuiquVyfuqvApqN4TbBFlyErCOESpt/d///b6il2DRMs8gaxONxn/mVRajxxj+kEPaon
 7eGJx+8F/Qjx3ZWF/oN36KZXjnhtc6pSwBlt6ChyJraJ75zJcM8phvFjBnysEPfYnYAIfnwYsF5
 cC78JKnp6cRlJtaBdB4ezV6klM+XlouHdPzs4YJjdBVrZCgdlfTe547bl3xweXBaG+QEGWw9+uu
 ha9NvePjO7N18qQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

On 2026-10-26 15:39 +0200, Abel Vesa wrote:
> A hibernation image is restored after a power cycle, by a kernel that
> may have loaded the firmware itself. Neither the firmware, which lives
> in memory the image does not hold, nor its authentication by the
> TrustZone survive that, so resuming the core from the restored kernel
> fails:
> 
>   qcom-iris aa00000.video-codec: failed to resume
> 
> Make sure the image does not hold an initialized core. Unload the
> firmware before the image is created, and before the kernel that loads
> the image jumps into it, so that the next session loads it again. Keep
> the system error handler disabled meanwhile, so that it cannot load the
> firmware again behind our back.
> 
> Refuse to hibernate while the device is open, as its sessions cannot
> survive this. Failing them the way a system error does would let
> hibernation go on, but would break every open file handle on each
> hibernation, without userspace having a chance to tear the session
> down cleanly.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Prepared with help from an LLM-based assistant.
> ---
>  drivers/media/platform/qcom/iris/iris_probe.c | 44 +++++++++++++++++++++++++--
>  1 file changed, 42 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 41dec90f3e2b..ea77c573b333 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -411,9 +411,49 @@ static int __maybe_unused iris_pm_resume(struct device *dev)
>  	return ret;
>  }
>  
> +/*
> + * Neither the firmware nor its TrustZone authentication survive hibernation,
> + * so do not let the image hold an initialized core.
> + */


> +static int iris_pm_freeze(struct device *dev)
> +{
> +	struct iris_core *core = dev_get_drvdata(dev);
> +	int ret;
> +
> +	scoped_guard(mutex, &core->lock) {
> +		if (!list_empty(&core->instances)) {
> +			dev_err(dev, "cannot hibernate while the device is open\n");
> +			return -EBUSY;
> +		}
> +	}
> +
> +	/* Keep a system error from loading the firmware again */
> +	disable_delayed_work_sync(&core->sys_error_handler);
> +	iris_core_deinit(core);

I think the logic here is generally good. One thing though - we appear to
have cancel_delayed_work_sync() + iris_core_deinit() in iris_remove() and
now here disable_delayed_work_sync() + iris_core_deinit().

I think the iris_remove() should be disable_delayed_work_sync() it seems to
be the same error as this:

https://lore.kernel.org/linux-media/20261023223635.3c895c4752c4-3-mhun512@gmail.com

So perhaps a patch before this patch which Fixes: the
cancel_delayed_work_sync() in iris_remove() and then you can use a helper
function 

abels_super_cool_teardown() {

- disable_delayed_work_sync();
- iris_core_deinit();

}

in both iris_remove() and iris_pm_freeze()

> +
> +	ret = pm_runtime_force_suspend(dev);
> +	if (ret)
> +		enable_delayed_work(&core->sys_error_handler);
> +
> +	return ret;
> +}
> +
> +static int iris_pm_thaw(struct device *dev)
> +{
> +	struct iris_core *core = dev_get_drvdata(dev);
> +
> +	enable_delayed_work(&core->sys_error_handler);

I was going to ask about when the firmware gets loaded but its done in
iris_open() so I think this is fine.
---
bod

