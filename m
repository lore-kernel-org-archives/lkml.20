Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487B43E40F3
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152948; cv=none; b=S9ipfkFnaH2RdLY18IWYQskBpM8g7Z/BTBP8sSIPTwIuP57pRMwOyTfznmxz4xht5El+Jyqq0BulvuwjjabxunlS5IQWYkz/pAE+CSdYdtk085BqXn3XrgjxOuaexb6b4uLibYVbIsNE0sdu0DAKjKGR4oFqQWJY7Lz0Y+ZzVCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152948; c=relaxed/simple;
	bh=AlYVH6JZsylctzQviaLt4hc7y4RoW/sXNgqoYSnoG8A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SAsVgK3DFxI9nQ9lpvM2hFtH84i3elY6g17VV0yvlEDIO5I1ayZ6pmFnCCQcUCCp1Iee4j5zIH2BLOxHcsQ0uAeyG0JyInQju/7tT/5+vovIE2/PXRK45cQtfioHBOuJvnnvGzDLbDpOwiUU6U1aldgffkBkMPzIYCQCymM5xxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=YLJKfbjb; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="YLJKfbjb"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4ad9so3238125e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790152934; x=1790757734; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n91d5eWYAIFJCF0jV6IWCgrzcQaMYxpIShAjrH7dsh0=;
        b=YLJKfbjbJIocfNSOVi9MCfMtu9HdsuELgm5mWnyk+bUDUy4OPE6PUcxvHQBe9MwWnh
         gEo/UIuxacLxSwPZIbkfKt7/LjK9kjVyghYyf5a+qehu33UOpq8ZgRd1F20tWhMJFuYV
         3ZR2tMOuoyAVLZGWSw/79XNtyf+fy5o3d354HM8pnzt2wT6nI7ZS08jW+UJwY1u7+Nng
         dTtDewWupFxu8Qk8BWTZUel3EMp6FHU2YKZoOR42wmd1HQZMBrhl9LzC3G2fJ9QYJdcu
         dYmZmhG609LgHnbSjCTSt3w9kTyc74iOavUAiDr6COhWFYfKQg0jlJbV9ArWVFs7N0Il
         aCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790152934; x=1790757734;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n91d5eWYAIFJCF0jV6IWCgrzcQaMYxpIShAjrH7dsh0=;
        b=AXq3ziVKx2paN4gdcqkOR2npk35QBOQ6jWgITBnxWT6um8ZIrt2QiwR7wGhFzooqtp
         QSjss9lbph0dB+V1fLo6KegG6FAEHEqr3wa/HKCIjM/tLYwLj2pz9GwUsekhB3dhfq0j
         zUoZ+CX5PfbYtxrNBxOB3qLGAJznPA/3Q5JhMB+5eMXRnyv2J4gWVyeIy1hxbBg+mZQr
         GLDxXIHQZkW5WaZWrvhwSrOKa9o3EFx3pq4QiOM+V4yF+n4CfiQf+dDM5V15q1OvTDKo
         ombZz2mtNMMlcy2BlOX66JSTI4Kgpb+uGFxsAfFHtATOVw8RPn5Z1pMfqCNToe04Vpjz
         e+zw==
X-Forwarded-Encrypted: i=1; AKwUvBz/snwB3QvFDfio4RMvVriMFsJ9DqHxNwny/QsjOO+BY02u67xUgqHhIHIsCdC2L8q49n26odk4uKmsDng=@vger.kernel.org
X-Gm-Message-State: AFuF++nKOYSS5+8gEheMck3MYC7TjEvIhPBWXInTzzbKIVdAAaDOcCYW
	K5OogUJmuFoXRhKbGNvRbtqP0S3EqEIWUHAcM4H+mz35P0vX9r3JBk5/nItGu0Ha5C0=
X-Gm-Gg: AYBFou2gdLeGoI2U1FKStuwvO0NSk3vKPfU8vdVBaeE6hB6hy/QlIg+HgOQ1n+znm0y
	1kfVz554yEUtRuWrErEQMb+tWuRmpyK4gy0jbh/QIacXBMT53vANcm72uStEHXKPwoNoZJrVcAt
	nT2flLKunAWS3sdSz+w6tC6KxVFSSWw7rsh6JXGtAJyo2vRcWKEq+YsjB3k8ojhZlgWSv6zY9iR
	A7uhl//vzelCssE8zK451FrOFF53ldjuBex0ktVK3r13XX0bs3BneotcgMZbZIqKRo1I4uH6ZU9
	pwShSyW3n3GbwAris1z/5k/yqYfLL0IYfnRy8djZgyYrezIdt8EWievd50c9M4jVFdqGOAwdVdQ
	Sn9sXtMCncpivjPk1aeynV+tJFgQQZAOXtCJlUwOKFreh90OYO7Gp8kU9uwjToezGKlIP8w65lU
	F/vkoDK8T+2eXigx3jYtMfFtkOx3LxGB7gRzd8GZIC+iKVbbLcqjpVo0Xzd4KYF+zMcMhyjjoV2
	AuNSgY70Y7voW4twc8=
X-Received: by 2002:a05:600c:c8a:b0:49f:ce73:7a9 with SMTP id 5b1f17b1804b1-49fdf2543f4mr22923305e9.34.1790152933630;
        Wed, 23 Sep 2026 01:42:13 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde134739sm56714325e9.0.2026.09.23.01.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 01:42:12 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: "yong.liu" <binary_world@163.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 binary_world@163.com
Subject: Re: [PATCH] clk: Reject positive return values from init callbacks
In-Reply-To: <ccf-patch-f7a5fae0-beeb-4667-93c7-3a4ce9321890@163.com>
References: <ccf-patch-f7a5fae0-beeb-4667-93c7-3a4ce9321890@163.com>
Date: Wed, 23 Sep 2026 10:42:00 +0200
Message-ID: <1jfqz09x5z.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mer. 23 sept. 2026 at 03:58, yong.liu <binary_world@163.com> wrote:

> Clock init callbacks must return zero on success or a negative error code
> on failure. If a callback returns a positive value, __clk_core_init()
> already takes its failure path and __clk_register() releases the clock
> before returning ERR_PTR(ret).

If a provider returns a positive value it is bug in the provider and it should
be fixed. The contract is clear:
- negative value on errors
- 0 on success

Positive values just means nothing.

I don't think the framework should try to defend against every silly
things a provider can try.

>
> However, a positive value encoded by ERR_PTR() is not recognized by
> IS_ERR(). Consequently, clk_register() returns an invalid pointer that
> passes the caller's error check, while clk_hw_register() and
> of_clk_hw_register() report success through PTR_ERR_OR_ZERO() despite
> registration having failed.
>
> Convert positive init return values to -EINVAL before taking the failure
> path. This makes the registration failure detectable through the public
> registration interfaces while preserving valid negative error codes.
>
> Signed-off-by: yong.liu <binary_world@163.com>
> ---
>  drivers/clk/clk.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -4053,6 +4053,8 @@ static int __clk_core_init(struct clk_core *core)
>  	 */
>  	if (core->ops->init) {
>  		ret = core->ops->init(core->hw);
> +		if (ret > 0)
> +			ret = -EINVAL;

That would at the very least be a WARN_ON(), but again, I don't think
this is the kind of checks we should add.

>  		if (ret)
>  			goto out;
>  	}
>

-- 
Jerome
