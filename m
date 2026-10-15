Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFE8283FD9
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792025606; cv=none; b=Hun+udRSl3j/WlUDcoJma1tyMNCy/RwhAy1gjTQayRgkCnCJeX7lB1DSxqbd7SpUfRXMko5ZC5xa1BQDJnyEFEtXvQ3kKdsj5REYNM3+JIZK7WpENscwTSUvmKpP0a/9ZS/2vb8GXcGYSgZ8HNhoFW6MqaD6kRUlxUunFi+ePsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792025606; c=relaxed/simple;
	bh=a8W4R8N2Yi0O8FvasCemaSpedschVfQtJkWTvtZgMGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bPWBchQhqGKEnSsBXnSxpFNQM+ze0erhP5YKI1IID5tfB017jJ2nG8VwHMdVofkJ9heszFH7F3sawYoRs1dacgXgp8LkRJ1hK3cVOM4YJ0Hcs93iIJUpyXQkepFwx9LSQe+4pn4youshfk71x50h3VhWYJyT3RGyrVoJ14ywQMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dh789iPk; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dh789iPk"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48df3912dd2so43690f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792025603; x=1792630403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IUyEEtX7OMRFle7IW+soIgHuWHTH1MKpFrWXShCimnU=;
        b=Dh789iPkA2v+Kvbl6GvvN5bnswe05umOMJBKQw9ChdSusk8tV8F8WLTLFl7dpINoQt
         V087YXfESZNYg7KgVF7azhekSLaaWFTuNXytKRBVXtVi414Ae6NNv2rJqvyK0Wo59L7+
         z6koyzxMFH18hYgnP5N5az6N2V0jOUSPxz/1IDGr91B3qomFSePSJitQbUhfhf58LDSp
         8i1ls2/EyAjb6oz5j7zmK18Gh7bnMKkOzbGlm6Fm0DpNrirjjWsPH3mxBRhi9jttJ4F3
         OKc6jro/jhhmP8XUZSOyPDDYAeg3216zJE5ILrMHMJJz442zyuLDzx0fkG138yY46qwb
         kZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792025603; x=1792630403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IUyEEtX7OMRFle7IW+soIgHuWHTH1MKpFrWXShCimnU=;
        b=jS+78Az8I61V5eB21QmdDDAe7n8ucCfLhi2W2ct3Bj+vBCro7IynNtem75ZNT0msva
         Et6RvvRDg1jCTcjr4Ll4LdEnxDmEayffKgWKWAFLkCL2UEcbNMzS5P6qFKzE84Hlr+cw
         nbiBoeDrP9t+vlkVIkWgoguUayxxOEt7tBsIFBV3eUkjRtCH7B44ASQVLAawjMCes3uD
         v3wmegPkZr+NBIIm2O+eZrbERWKC2tbnfhz+55bYe+Yb+0KdEjXydeCE3+TjwKR1CytJ
         q100AYEbocaU0pPu/q5p1vfkD2ZuyAmpP1FpAaRyvgWPnOB5gYFGwpzLj/Puj8UUNLUg
         QQEw==
X-Forwarded-Encrypted: i=1; AKwUvBytapsl4w8YnLOBClcnfrtJmOl0kAIlY2T0cH/3jBxLMCzwVfVDdVxtpF0gsikGXwpn3ZhhixWUpKnPo/M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIdKW2HQ3/36isHEo5k+6WPxN3wmmAiJ9hCfC8txjU++bML1R4
	nC477DjF2hqiePYxHZV5GqFnAA7XbRhEnxrkp2lj/On4mcPAB6OkFLNH
X-Gm-Gg: AYBFou1Tp5ThlRabrZyuwweUlUobxQeFeY0e9uSs8lZWAxcem+LP7JDp0hYgNTZ8DNg
	gVycOKQt45c2HPSDazu+KHRR5zTOHE7YBofpOShGc0MgO2jE1GsNo1/kznefTz5da99lKO7ZY9O
	fhU3hSYxn9APYeuEjqetGizx9FGrPZxBCV50g/Aw80A9001u4H5/N0rfWbJ0tBu9+Iss5Ev9hYU
	w+H0AHxiCNKnHcpdzg+y7zNNogkwub2e3ptPF38NVPZQERgwYx80vPsKczhpKlbooV2gmuBctMI
	TFjav66U83pBDBMEW7sDvAJ2LU46E8IQJXNCMblZQyyIGrAGw65PhnHMPpgWzrNkVSb37Eopj3T
	+HHFEzIXlb+du2qVTJ96G8A9TI/ScS57NFVXsq3rP6EnmVkcZAGsVxHlmrkezteboLnkoMHWpMY
	RxFylqlIGf03CgJRIc+Ysm2mhronXC3uZK/r6WyEdPjixNwbwPRdnXVeHDM/YGqqNEZktN9B3EY
	CjTgTf/am7X6d22WYk=
X-Received: by 2002:a05:6000:4106:b0:48d:f14a:9186 with SMTP id ffacd0b85a97d-48df14a92e3mr3433584f8f.6.1792025602873;
        Wed, 14 Oct 2026 17:53:22 -0700 (PDT)
Received: from Nuel20.localdomain ([105.118.9.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab5262sm14895048f8f.22.2026.10.14.17.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 17:53:22 -0700 (PDT)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	mchehab@kernel.org,
	aleksandr.loktionov@intel.com,
	bvanassche@acm.org,
	tudor.ambarus@linaro.org,
	emmaonana18@gmail.com
Subject: Re: [PATCH] docs: kdoc: strip DOMAIN_NS() wrapper in function prototypes
Date: Thu, 15 Oct 2026 01:53:14 +0100
Message-ID: <20261015005314.7195-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014224714.16922-1-emmaonana18@gmail.com>
References: <20261014224714.16922-1-emmaonana18@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 14 Oct 2026 11:22:02 -0600, Jonathan Corbet <corbet@lwn.net> wrote:
>> Neither of these patches applies to docs-next...what did you base them
>> on?
>
> Hi Jon,
>
> I had mistakenly based both patches on mainline rather than docs-next.
> I have rebased both on top of docs-next and sent a v2 for each:
>
> - docs: kdoc: handle TRACE_EVENT_FN() family in tracepoint parser:
>   https://lore.kernel.org/all/20261014223134.14772-1-emmaonana18@gmail.com/
>
> - docs: kdoc: strip DOMAIN_NS() wrapper in function prototypes:
>   https://lore.kernel.org/all/20261014223437.16164-1-emmaonana18@gmail.com/
>

I just noticed another mistake on my part, because I prepared
the two v2 patches on separate independent branches off docs-next, both
patches add their regression test at the exact same location in
tools/unittests/test_kdoc_parser.py (line 444). Applying them sequentially will
cause a merge conflict

I didn't realize that patches modifying the exact same context in a file
should be stacked sequentially on a single branch as a patch series
rather than developed on separate branches.

Should I respin them as a 2-patch series against docs-next,
or would you prefer to resolve when applying?

Thanks,
Omokefe
