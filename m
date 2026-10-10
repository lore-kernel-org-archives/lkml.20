Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46352877E8
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 01:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791596218; cv=pass; b=tOqoD7EdlmwE439oQ3bUCdzyaJrXLvIRiZV5bWcL0857YFlKEeShJQde/dsyGvI0zUK4Rxr/kUp0V19FocXYB9KcSaE0VAj7xJo+PdVSAc2Ka+eSeL3fjcG1UPO/JNLMF1tCDIWFNInn+9Gh+vWT7iCy5mQGoMcTOHtj+Etny44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791596218; c=relaxed/simple;
	bh=cCKP29rpvusNEnTOFbhYPSA+xq6qRaYZGVi8GUipOqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g2UUddnTEzsgdztotjDkz4QjoEVywdaDfAbQHIjmS2LP4yLMLRm2Rlni6MrL9X3z0vQqjiF3ztUjk7dJIl8/GT3ftQEuEePQCOcdTFzStN6RzqSJv8Gqk3hAgwGS12wZ+9UGkst+J30O+UNszSFmhq5pTZZxbT0W6UU974TYl/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhq75/JO; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhq75/JO"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bccc96684dso124828e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 18:36:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791596214; cv=none;
        d=google.com; s=arc-20260327;
        b=UKOu5sAYeTUZ82I6wfGiBEG0WFR7ZnFpKESpllxEKdC+cgjMyKkvf89n/4dqqxXagJ
         r5nikVmjPYNpli2+AApgGEvn6B5R7rG1bpCfB2qN+bpY/r+qXgGn8bCg5BGZZSaQsuLp
         KTEdu3VB4QmqfczMadx+iwsjAQ9ne1oThFDVpLpnRAL0vvXO3PlJzouRv8qlbPeTFTZq
         y/LWJTGINgJnBLZpelvB3ZGu1LX7nD1QYScuS8JlR/nSsCTuZRG19v5ToVSDt/zwWpsj
         Jx0l5H3J7cf5TKpte4aZ3IV0ijn4zPxwOK6y2tSlTFwrgbyuBOY6qhfaGIbDgHlXbF1t
         SEow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cCKP29rpvusNEnTOFbhYPSA+xq6qRaYZGVi8GUipOqI=;
        fh=nGq/xIJGq/H4i6Gyh/lV8AePY/pxl+YX8SZQBG9klg0=;
        b=bhme3+LX8K4fO3Zm20NCEHQJGXP6JYOOMPcMRjUnVHGhbGfVc9Fgu4jtDyhnQh84WG
         X61uLvVRSOr0xOSp030+puKNNXrXuTkXjDVDv196IbXkNi4g9J1qubRk+sMBDv+VWJcV
         HodaHEZkTHuwj6m7LhNsy4BPcqMXhLy8kTtzI1vkBNbb8bd065VeDjYbMHWtAteLw9Xb
         Nn9Ijx9Jdan8p1JIux6IpwtZ5LqBy5/cAALN0MEAQzxUf/iQ7veILhIm9UmJBlP9/3HH
         w9mPMWlgXJmHeGerOrIM3D35avk9kgFSihaPEYeC3hs+gKB/HJHgQKHeVMFsp2U8PfjA
         8qHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791596214; x=1792201014; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cCKP29rpvusNEnTOFbhYPSA+xq6qRaYZGVi8GUipOqI=;
        b=hhq75/JOYHN3XLr3GVGXMeIVml6DyaJXHyQ/kfUGLQhHme0dNnzeRFslk2wiz7+Ei6
         sHZe+LvlvAOaw79gDA2Kqav5uQKD6jH9yR8KRwDUJ9ybax0RdwGzMNQTdimIX2uzxsTf
         QzmsLjxWjVQMu4A3dQ4584ZijXHLWxQagelGYl2+LIUMh4K3P6c3BJOwRAU6/r2Cp86o
         q5MfMpSqdxAcxz5452LGYLOl/v/OR25CE+jwMtMSD9bst699G+mpmgPQH6qovkat86J2
         YVszUfgna/iCmxzfO67DSGUkFutqLS0U6PLD6HVz3zzq8OaibvKA6CNezDhBobkq09IZ
         reBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791596214; x=1792201014;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cCKP29rpvusNEnTOFbhYPSA+xq6qRaYZGVi8GUipOqI=;
        b=xgE7MG5UySuCgzUwt7qfr6gLzO1mtiOKaMWR2GDda8xYsZ52HQ6yJVVOplRQCGWCeq
         tZZLrY0shUd0QrjRY+1/Kk0+ss+AvZx7nX3H7bbYvFmxFq4fucaYHerRtbvuDynLkyEM
         O6IKtxZUlbRZwHlHeacHs/ZUpUWJ/ginZ5Zi17OiYiRhNWMBcQUIKZN3vSlhrcDqPlRK
         odkuogBoY7EHuyMbvDzDLUaQYd3FJj5B3aVbFQZrZr9ZRMxwp7NjbCL7tnSl/jxowiTw
         s83ipkddhfL0pIZ/bj8//Xvcs2T9AX1PBLW/mY2RAmIrgsg5BZx+/FPtduSe60bIDchg
         9uWw==
X-Forwarded-Encrypted: i=1; AKwUvBwC4M7bdILG39dE663Wf3H0FtSwyEDyqOMkErm7EViFIZuVTTc4GbEaplebkmWZ4AP7vFYrZ7mGj+jyNuY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOyl9ziUu8K4T3Sl3FLtE4wiimJJKo7+1TP/I7B/fdHRYGSTjA
	FqBau8NV4tE7wUfiEEtRCVnMQrDFatle1I0Gv+1sJyviVlsHkLodGUGQ5qy0YWI4MBGR8TfOiYv
	ZJspESC4HpPhUzbBMsex5nYH2VC+TcCY=
X-Gm-Gg: AYBFou0rgfIAgQ+usgwmlmrMKN1JVj53QCV4D1sH6PI2MljErJsS8JrqklsbTnaCwBh
	Z/lCdyephmy+LwpfawwH52TSACeePAvlGLCNcrsl5C/OCjELZOsk81FiZT939tRDr/ZW08uRKkT
	r8NkeaDtkwDn9vGWtsdv4y54FE1w9MUtYeQWAMPBjvRsyAqAB59+xsdezbvI870pvW6LRtGBJe8
	PMOvNkbTYq/qlvAkaCyKcRNZ6YA+ItaLJM9tX+0rwh7VV0clOkC05mLCTubXf6ykQi+XtGoJ+ic
	5rKpa7lQThZVKRTXCEpW2/JFowQ+S3Kl+0UPi4OvJgrzq7eUxZnoTv6H3mZummyfX3ML/u3bF02
	CnTviX6BT91rZesw0A0RersHFXdFueEHBrCXad0LLWf4lc8yOOc7WpIN3QyveYb2sh0kDNBI=
X-Received: by 2002:a05:6512:1155:b0:5bb:7beb:20c2 with SMTP id
 2adb3069b0e04-5bcde8d90d7mr1158511e87.67.1791596214342; Fri, 09 Oct 2026
 18:36:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009115627.969047-1-linmag7@gmail.com> <20261009115627.969047-2-linmag7@gmail.com>
In-Reply-To: <20261009115627.969047-2-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 9 Oct 2026 21:36:41 -0400
X-Gm-Features: AclHuK-xm6LTymfiAIGE6e8DP3SPIsn13v67ibUTejFrZS92rV6Tnp6fVj3D4Pc
Message-ID: <CAEdQ38FAO=9V5VLbNCTE+8oyA4hcd2kYL0t=UYHkHTpWBj_-FA@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] alpha: move Tsunami machine check handling to err_tsunami.c
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Subject: Re: [PATCH v5 1/5] alpha: move Tsunami machine check handling
to err_tsunami.c
In-Reply-To: <20261009115627.969047-2-linmag7@gmail.com>

On Fri, Oct 9, 2026, Magnus Lindholm wrote:
> Move the existing handler and PCI error clearing helpers without changing
> their behavior. Build the error objects for ALPHA_TSUNAMI so that all
> Tsunami configurations, including non-generic Shark, can use them.

> +obj-$(CONFIG_ALPHA_TSUNAMI) += err_ev6.o err_tsunami.o

Nit: nothing in a non-generic Tsunami build uses err_ev6.o until patch 4,
so that half could move there. Not worth a respin on its own.

I built each patch with W=1 for GENERIC and SHARK, and the tip for DP264
and EIGER as well. No new warnings. GENERIC boots on QEMU's clipper with
two CPUs.

Reviewed-by: Matt Turner <mattst88@gmail.com>
