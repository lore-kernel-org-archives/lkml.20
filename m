Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538AE364045
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790943902; cv=pass; b=FAa24pj2nViLMgzKWcsSLz1PknXl2sGU7+66CkTXqLLRwRdppptIoTBuEuq41157RYbW1ALBfXZjSgeaBiEAYQhMXtha/lQ33E5/bCF+qPXIgvrvtd7ltbHP3wPSmiiBxOijg3ztRc5NsUvG/2rYdrsGmdS9KZWeOTMeghp7S4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790943902; c=relaxed/simple;
	bh=2nnVUg/SZaHyHuKCzH7+n/VkIA0eqs6cP2ty2QfdMaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J1vRc2OCpsoo+5+/WxZH4RePeN7lCeoZypIKHRnaGkU33CCuIZ4SsWjfWrIj2cUe5o86CMXpttM9RWMfEDaHZK8342R7fg0tQDkt/z9JevM/Z+nO8QJHJ0xAzET8uS8RTRb9eGPiGqtA7PkMcbT9MuE9W8pumtvVsVrP5P91D8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=daS/ylG3; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="daS/ylG3"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34c99260bd9so339490eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 05:25:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790943900; cv=none;
        d=google.com; s=arc-20260327;
        b=BtitkxNJJrP2tzAyFbCn7tV/No5vvsx8NcYL96+jfGfEU9iy+cMT0RjzB72TPOLkoI
         sCb81IZ8xgI2XLeBHn/vSIyow1qXAxwKwt+c6ccKEcK43sYhga++juXJj8lNHhze70uN
         q3jw9p8t2o2ZLXPHR1hxj/cN+BkmEN4ideaQQkCXnerUq/KOoNckqS7Uc2/UwKNOZplX
         YBDEXpnuqLgocHpXCqNYoaWxyzSTIN+BVbR6ZRn3nJBbHd+jaNkLA8OVXGw1Q9iUSRUA
         SDBeYvn48HM6YfHdioMW8WqUun+AaxOi/p3hS91G12rAZqkbOcVsoLiBAShxncqq7+dr
         Xssw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2nnVUg/SZaHyHuKCzH7+n/VkIA0eqs6cP2ty2QfdMaU=;
        fh=ZtCrGYkvTfF8bRiw9qpJYEWUVCMIFrtG/Un/3QeKX8Y=;
        b=TkMTLPnrzcahwDKmu2LbaIB6roj85SAxOQu88BGc4M+a4IbTeodRzVKQLAIu5mi8Nn
         gEQ8fJe10aVVejjOEEKo0hird4EDAg+WUtD0oCRuM8jLMKeNWd1NJWhJoBqkvs7FP/F0
         JzqqAY0iEopgSH6fntcXJtYjre0GN84dudQM8uGPGevaBvek9/3ZQeEOev7RTvSmE2Of
         DaF4YjdNzD0THyJRp/oBkZzOWsp9o+ywfzlbe9bjurG9nTUr14wld85taHqAxt2m9jEZ
         Jn/sk14xud/KVGjxiv6R9dy80lwhaW7VKGh2YvDm8uxmeQ0GeoIZQlSzjavs5B9vf3Ik
         f2qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790943900; x=1791548700; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2nnVUg/SZaHyHuKCzH7+n/VkIA0eqs6cP2ty2QfdMaU=;
        b=daS/ylG37sk8HHR9l5NeHusHDzOGMmwmjIXDVUKJVREKsrKeT9cW8Yxacuu7+F6/lP
         8Whln29XStGkEXtc1I++48UCV8E8/fm3MCimrPOa6sxb685xfOYAQva/XzQ3EFQTHID2
         O5XT40ewxTZSEdSLrIjduCPlGrmbiUqKDGXMqgZjl63uy+bxQMRx/cZB3zvxZVOdNFW+
         h9EZHiBIi/2c3R9PAYtTpeezvVC67A81wZB77BO39BW3GEtoOuTdpRn3KKZ7EXPZ8y/V
         d4NtdyQtUOBN6po3/m2egGJ2h9Mk3CNSERK+2rw5JMv2AakUXGQO7bUm0DciePD5O1zt
         VnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790943900; x=1791548700;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2nnVUg/SZaHyHuKCzH7+n/VkIA0eqs6cP2ty2QfdMaU=;
        b=mVxqGhrh8w+ib5uV5nyVVkCQ2dKSuAd5MMh9INQCBIz4YI4G6HnB1xKVaVd/lYx3cd
         8ymutcS/difT4c8iXvK76AOhDWEUmstO7XMYbtT05jygSRHvK3YyzzRuGDJPMK3rnwEr
         HBfEqvHZ1/KKOdg2AZnv5V4j2oxGJ3IYXeWqFard5shB+TbmgJFwao7lYIY+FLG+c79e
         zJWuDcM3Ybx0YecjAUum5MxpqTFhRwhYc7TVZHaU5yKx3T6xLpRa9hJed1SXQ7yIcKFN
         cW/jZyYOhGD8or0ZpeP+iQv9q6SKJ8aYWzYgF8S6DmmT+L/phz5jf1HcYa8XtULl2wef
         NGdg==
X-Forwarded-Encrypted: i=1; AKwUvBzHUEvWHQ2LyiKh30jcklVGjmPo0UbfCtNIL6Wu5So2XKWhgBlMBMcvSYr7cj+o8v04rxOmTp7X6ZDWSvs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIe4h4dWyTksXwAeI+ZUfb2rEeHfUr6bGnBSE3t7sKFW70w9egp
	swkWUTEIaseq72T+zIBs6tOXoHKoQ2bFG0RrCcOz6zjvOOMmAOQOd4oV4445rdZaqq6bG/rmY39
	UipMm9zFeyARRkx1UrbPxmUpgiFAx3cU=
X-Gm-Gg: AYBFou1oC8SmUzLVZ0jJ0fZVRVh/fXrM5VBxjvHGg+9iaeqLd/qz0kybQP41jPSdSe1
	rl/xWbuBmdXM+P5CUi+wPQuQ0OSyzIBzTLWCNJdinrS8jDVVDOMNme0/TD3Thjz5Itqly1cItIL
	f0olYkDsbr6QfxZysDAr97OI/k563HFCY/pR2CyE88858LQzIX/OMN588jlD4aeTPxih/5OqmeF
	McYFVhAhQII289ZbE4UqI078b20C3bxekOK1FoRsUR9QVLhP/6rQTD9U1xZh14Oai5yyUmK3AZD
	6qsQrP26dPy773IzjgWvBGiE3uvJKkxk2DAxSv4b6yCAezuAM5wta+xLsbcpRSd6Nwh9Ai8TRon
	fbBeTrkQf84ExnYvtAMPZO2bHppjHpVs9qfXIvvqzADX3515p3Gk4vQNkLAQ8MrAnrjzpZTyS9F
	kW8fraDzrTLN0F/zUXfmGLiXBbcAfd0+G0pY3HA2J8bIGFnK+WU/ub
X-Received: by 2002:a05:7301:18ac:b0:34b:7c9c:9a69 with SMTP id
 5a478bee46e88-34f06678c69mr4048949eec.0.1790943900278; Fri, 02 Oct 2026
 05:25:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ar-cWpOhcuo85ttt@sirena.org.uk>
In-Reply-To: <ar-cWpOhcuo85ttt@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 14:24:46 +0200
X-Gm-Features: AclHuK_k-8l4icGOso7OUMh7asj3al2NOhpwyN0qJl7VrEX4X9rbgt3xGUxAe08
Message-ID: <CANiq72kOB=NuaeUz2i7m=uTmezf5Z_+9D_njCfCK-GsFN+S63Q@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust-timekeeping tree with the
 rust tree
To: Mark Brown <broonie@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 1:58=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> I fixed it up (see below) and can carry the fix as necessary. This

Looks good, of course -- thanks Mark!

I think there will be another similarly easy one today (i.e. picking
both sides), if I am correct.

Cheers,
Miguel
