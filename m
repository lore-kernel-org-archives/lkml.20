Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30E01D7E5C
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 23:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791675231; cv=pass; b=RA7XYCPgmy+DKP2I+ZJDXg9F1XaYYJ05aVVh8YgOCKqZduY8p8Z3RWSHxvBBTpnHjXIkNXLg7SAxogcHTmt41GfoUvZJiLEg5WtMAMy3Y0k+gQMcH3PWAzkkk6UJuQDUdeBHwiZAQGUv1YB4tvhZVXCB9GujyJeAHX46aSRh9yE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791675231; c=relaxed/simple;
	bh=8FrkyLXgZ5G0GaTgVylroaVCXzg1tp/UUKvMV38p9V8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jEGiJ3qtZccRfTwxmDfYr5YEjdFGzsnguLrEZxw/INxtmRTtFiXLyzsO6DK+B2OuCer1TpHofZgy4zavKVqfLF9ZVNTLFC01xe1xWiUvHUaIoQsIheT7LS9/QqS0GRQgyMe+4ubMjt+zLtVqpomDzPHjrXOI3+raqY0FGrJHX1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s7ryLHYz; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s7ryLHYz"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bcb3726952so570372e87.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 16:33:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791675228; cv=none;
        d=google.com; s=arc-20260327;
        b=g9XQSHKJxT2lWGySRzOJX+EHnIbCEr3FNfasfEnE2DbWg8oZCtfOq1h/N94gcbq3yb
         MXkaIAiv3238eijuYlc+BnrvRgt0hm0A8td5ed9b8tK493+BU7FwHbvdYs8q5stpLIc8
         k2WEvet4w9Z4ctwNFxAw4MDvs/t8Wubws7LgpC4AlXyZWx2CSaZMnZNk2BAmUV3REhIN
         nG8lzeJl82OzvNtyfm7xfhlRYeAlRphzAX/7udhAMGPGBfVR8W0jPhK7cJ3aIofPC8cU
         /rXjWe8fzUQ7HnTcLJ7tA6sSrWPc8O1+LEBWIcpiAQlIzA3ueNZkQGSr5E/nqlYXNu5i
         UcDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8FrkyLXgZ5G0GaTgVylroaVCXzg1tp/UUKvMV38p9V8=;
        fh=ycfbZcHWhBpzua82CcDA1/+Kp1jV7kfLOF3+gaEDjIg=;
        b=B5B4DcvRj6op0YxeiLyjUDA5a/LbA/W4r+20bGr7VrjWhppJhRTPuyiqB2nlV9DoTe
         dKYDEeq0I7ModJn4aHSqq1enKujHvP5MKW8WeB7VTzgBcEZ5ov7+DNZlD2LUcnRb5NWx
         vnGH5RMI8159ISczdck4M2I7cDrIzwAyw7B2F0o30G1ZS5aBaWG/4gHxxYlBO7tKw64K
         5EHY26n3NEYJoFGTRb2lStBSofuB2v+zCO5gdWlRbrrU7WlckWrX7ekXbD531llu1HCB
         UvElhTqzE0/byopTpT5cU39t+K1nzF6OFP5NZItr9k+2khrhLLeYZ7H+T6K3j/78c4JG
         tsGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791675228; x=1792280028; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8FrkyLXgZ5G0GaTgVylroaVCXzg1tp/UUKvMV38p9V8=;
        b=s7ryLHYzJDdUyioofoZmnKcvWkpEQw6om8V2CilIkHDWfXHS7ggq6Vklq1hwhWfyIo
         M93PSo0K0W1GZhsPtNYdjOiopCOfO3nSOluOUdaUmhqevye9nUPbJbYaUDKvz806L7Kc
         WAYe5xnnKun65EsqRmHoi0Bz3hfDNcQf0YwH8+OzIWbOiekYlyTYepYnyx2QSLZ95dg4
         e1gaM+VIOx0T/TDAyLMMaTH4tzldt39+GrTFFUfdBg2QCmGc7PuV9JDz+CZGrtefFrIs
         kpAauDPej3qwcdIj7OZeQMTw+D1oftGf/q69FLQfaWSLODVm2WD3PIyHzunUa77tP3sD
         KfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791675228; x=1792280028;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8FrkyLXgZ5G0GaTgVylroaVCXzg1tp/UUKvMV38p9V8=;
        b=vtR3bkPI8uZmiw0TqIyDd0KO9vQVG6jZA0n7oodS6NvbZ+UZa47ocY4rkdbdQKkK4n
         A5H+R3vIBxQPdlm9VxEQYUIjOThW/8ETxER4FkYbhnKna27ZJdkFl67PLy0KYEvb+UQ8
         TLpVtwUC+6fRPNHyNoTBp77q3J6p0IRNT6Jgr046dOmrVC/JCTMJKJ7jKfw0P7/gy6q4
         BzUk/N8hKmDhBspCypu1gu3E26UJSqxNhR5sJAMV8XJAEVP7uS7yi3iX0bz+lmER1xgB
         BZidEyeJmSJ4OcIJQmwlUlymOe3qaTV3MrFZLfGIvs+e06ODJ4MymRSbfrP5Rfh9l+op
         xmFg==
X-Forwarded-Encrypted: i=1; AKwUvByPd0+Xr5J35XRKn5b+GqIqb0VxgBHElKwmbq/XmWC6Ifa4+WREBN5HbQPf73dCAOGKW8TEiLeRv13GBVY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdjWmZ99PzyaM7o2tYj3b3PJQKCQuVIh/YHHOLFSO9Hujlbh8W
	OKEvj5Y8w1Sc+HZfzWwaodYQzNKRt1En6i86obyM+ACDjJ5Jt0krI8nQjhRSvrLmWnq32g4xiEE
	U38QYch/NveCbFlK6QaxOoGAekx4HsqI=
X-Gm-Gg: AYBFou0Lk3AS5hLczNzzgGR8krb6pMvVdQmgou8tgbYm6ZauSACG3f6BpUernh2Wq3x
	rLEI+bv6Ai34erq1WEPt8pcvLFLtg/jFoqbkmHm8HQ+OFJz1RR0tAKHdWFb7kfYiHqd1JJdXIxc
	+bDXwHo3UotOXU+gRujH3UpHPw5AqrIU62kIn5eyrqzJI1GL9SL4JkORMzzdxu4RgD+1CqZLdmm
	quuD2Y9gQfpCBg4ij3CbwdKC2ai3UnbTmFx+BoXvmyplmKWgA9hctpc5YBgg3VNzT88zhZM0xr4
	nuBSmE6Q6mlJ+uYnNeIIMp7Rbk0tJDdVeQ7RX+KkSwsk5beAi0QQPl8yjvUVxf3kqCRKISCI8vT
	kVQ2OZ2zbXgI7+L2vXmNwSRasXvsucT/s/2KJrwtO9xCNA3xLotxOLei2mo/vHp9wdQKjEqo=
X-Received: by 2002:a05:6512:2305:b0:5ba:418e:9913 with SMTP id
 2adb3069b0e04-5bcde8d8363mr1735148e87.62.1791675227528; Sat, 10 Oct 2026
 16:33:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010144621.974850-1-linmag7@gmail.com>
In-Reply-To: <20261010144621.974850-1-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 10 Oct 2026 19:33:35 -0400
X-Gm-Features: AclHuK_hLuowc_DKwILHBXlzx8Yc5uOUD_EuiTSAw_i_NewrbdFnoYRkbLyriZg
Message-ID: <CAEdQ38H2vCGo6EHqSJwQdNNdKuMHvTKyDWrey9vxvg-K6BnGbA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] alpha: complete the direct-mm shootdown fixes
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 10, 2026 at 16:33 +0200, Magnus Lindholm wrote:
> This is the second of two series. Apply all eight patches of "alpha: fix
> stale TLB translations breaking copy-on-write and writeback" v4 first,
> then these two patches. The base-commit and prerequisite-patch-id lines
> below describe that ordering from for-next at 33465f6ab697.

The first two prerequisite-patch-id lines (d194ee1170a4, 17df30a2da26) do
not match what is in for-next. for-next carries the v5 versions of "load
the MMU context when switch_mm() switches the current task" and "run
check_mmu_context() from finish_arch_post_lock_switch()". The other six
match, and both patches here apply unchanged on top, so this only matters
to someone following the cover letter literally.

> Fresh fork-throughput measurements and an SMP run under compaction are
> still pending for this revision. Targeted Alpha SMP, UP and SMP with
> compaction builds passed, as did a full ES40 CONFIG_COMPACTION=y build.

Thanks for being explicit about this. The current->mm test in
ipi_flush_mm_and_page() is the one change in v4 that no run has
exercised, and the series is in for-next already. I would like to see an
SMP soak with CONFIG_COMPACTION=y and compaction actually triggered
before this goes further.

I went through v4 again and both tags stand. In particular I checked
that the only caller reaching the ev5_switch_mm() store is
context_switch(); kthread_use_mm(), sched_force_init_mm() and
idle_task_exit() all pass current and take the __load_new_mm_context()
branch, so the arch_spin_unlock() argument covers every publication from
that store. Two small comments on patch 2.
