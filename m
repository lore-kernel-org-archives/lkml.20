Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C40C4A2E17
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788948335; cv=pass; b=GmSNc2KkNB+bOahM2F3HL5NZg6OKorE1noYujwgLHIjX+47GVmulIQu7zOuIG7HxXttYkc5ddfWnpdJ49YVqZjshlbiFWnv4rNZES3MjtSEgJy72yoK4ygKeolVpAj6wMxh6jOXZGBdqk8vKdfRUT96j5i7gp10ipsI5XWxCTT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788948335; c=relaxed/simple;
	bh=Qs6MOo0ipbx7jwU40KRVH3VbId5c+se0y+w18KEpP08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ea2fgTfahdZobnVNYOleJEF8R1zRKxrZ63HAR3KCIpVrFkNLRVOwtbf75xjiwIWLLiq4YDZ6IUL/NYQiE1zIwKnakJTlsymgqsBAp9zOHmIfeVuGcjYUZQM+dCpDYE7ClDSf+N2RjBFGvjZ6F9qP8Yln47PNSxJboiYTGpDGIFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=Fyh67PfP; arc=pass smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="Fyh67PfP"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8690079f2c1so247700b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:05:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788948334; cv=none;
        d=google.com; s=arc-20260327;
        b=QimesXlVLuU9OtV1XORmn09MvvLRc1XI9Kxlgfw34OVtUas2P1wzIl9IPMRtvTmV62
         rZEBUFl4rdAimS2yYZpz+87bvZAFWIlBvCLaMUO3eHDGKVX13ql0x6R0XX16/EBDZSmj
         FIwsRMgdO/pQfS976S814klzsZzNbDM1Ob8GCqXouK9Mmsa7JKH2XfrBUtkfbyK/fEzY
         Ga8IymWxCe/amqi0cxqSrZfB1V1nIfl1UFoEOti04b6nBhj5JRjLqCDwaJOUdEuMk/Sz
         aCbpzG44piLXgqQKq/LPHnVLJTHX4Of8BZWEpc3zNizyEJBEZo5InMIeI/gHEM4iARIX
         3Q/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H4NnU3M9b/3b6iNVJB4nDxkla8ekZHTTUWyoEboJwMQ=;
        fh=u8wxfxu3GsllI8mE2eDwPOjr1PltKiMVu0YobK4OxLo=;
        b=hjR488DsN8rvEN+ghTNg2mD4Esum99pnuAcg3ozCHLbz4lM0ZK3YQ3wryD8N8o+UXM
         13BRjNgzYKd0pUpAm5D6NWTOQJ7S4DbBBRsgwxmlzTh67q8q7GWT42fs66xaym5nsZAm
         TS0jd6r1YhZ17VEzA5JWzO9PCQQfU2IexxsDVnM1aCefzp6+MTgV/87dbWFjL1oCb5dK
         q/A7qwnzgH+/AuQHW3ZqoTHpVW1AajGRwwRO/I0hIAvvmHpJdGMZmxvBn3RDkdKCcxOv
         re6JopjGjz6ue0qIsKnVUsYXbo00EEJSdD6Zr590vb5HYfiVaGIFvFFA9wO05LHBDesk
         Yr/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1788948334; x=1789553134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H4NnU3M9b/3b6iNVJB4nDxkla8ekZHTTUWyoEboJwMQ=;
        b=Fyh67PfPES0WDZ9cuGkdzPUfAb/BXY2KURx51u1wdu8e5Tl6ZZNBpFh+EqcZZx7lTA
         8NPTp8/HzX1M90Nwc08bVnAk1tGvzBHlu7BXLvpNxKzVK+fQGfwoqyF6PX3ls5Augf2I
         7PrJancQuLGvRwcbf9QigiGfTuZb/EANssCYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788948334; x=1789553134;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H4NnU3M9b/3b6iNVJB4nDxkla8ekZHTTUWyoEboJwMQ=;
        b=e/Cg5bDte2qslbNYSxjPku+5YaGKX1S/pSsmQCXX0hyNZUYKR76S0cyXwV1q3Yk/8L
         DIZXl1SEBxml7Ye7VbDbhn+8H7gxWT8UdvZGuXNXUDl88+QXyPuV3jN8ImaeXOqORaw0
         PkTliBFr0v7e0GL8qEj2ESmtvKg6SWEyTxd2WuJfLFu5jxz2SA+aOl79FNzQWySicy1c
         Qt5/q9NPcRMcm8Tg1lT+WdtyQb9A1HHz1NLxGF1UDYZi8Q8BjHErsFT0cAhv4UEM+tIP
         YF27HWjFiaBZQeKD7swmqmcClNXpxEii5eDadUbuH7gHjkju5zTdSvwocHaZw7W2/3pI
         2Ehw==
X-Forwarded-Encrypted: i=1; AKwUvBxSfK1hkpBdvpJWuOpUKgqOkmevlLde83+i+fkDIseDpaMc3AQ2JPBGd4oLFKem2+UKL8c5/irwMJeeMHc=@vger.kernel.org
X-Gm-Message-State: AFuF++mHCfEVT4CkwR0FGjey8p0SH9TJWa4Go8LQNWfzaa4isUTRNQmw
	9QLnxaSCaQG2c1q1gXXmDovbwfIG2CJr3pued+LXznMvmfmA0nYkk13IYDSQuxSc7r046s8NQk4
	3nilDNl+MBrqxjoeb5HZP+GKde4LRSlWEQTzWHJGd
X-Gm-Gg: AYBFou2BMdhpnn5ZCjScAjWXlbFBxtjYWBbm9tyabwVFt84xwrIDTt3TXnt9kabwTkL
	zjSGyRhdLo8uJgqNilzYvjWlcvEv7JD3VXKVxVGUG3Vb2+1qg3S8VGjyIHNAUcWzACrRZWd7kC7
	azNUaNM8FrltnqiytLQEbWLwQpEWxAZ0BVbMh39CxEP5WVuOefqK/Ha3IVHhLKSOfOwVGQCw+4V
	AguZYH+cheSpTAceIxvqsEnZNOuCMhzznCfFwsPX6KeOymyeIXA9ZvRb5ZSsscvJ959FWXT3sU4
	cOSnaoe/F+3p0fGGAVJD8nTDC8T1jk7YJhWcsPFkbZdr2XnG7zkQyeyJ4u6Bjve1gUct6gOyzVo
	Vou+VcbdQKw8P3LRw+nu4gqdkKDRMDnjiz/5rgiI7NGpP
X-Received: by 2002:a05:6a00:4298:b0:84a:646f:193 with SMTP id
 d2e1a72fcca58-861633ca7b1mr48778621b3a.0.1788948333754; Wed, 09 Sep 2026
 03:05:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909070336.32979-1-xuanqiang.luo@linux.dev>
In-Reply-To: <20260909070336.32979-1-xuanqiang.luo@linux.dev>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Wed, 9 Sep 2026 06:05:21 -0400
X-Gm-Features: AcwNN1XRsCSsVSIJECxCc-1JgLAJouQ3Cyvq8feC7J8tsCQrA7yQNPwNFlVqu04
Message-ID: <CAM0EoMnZ6AwTX45hHAkqe_tvY0jpeMhzz=c9jhduzzau2Qn84w@mail.gmail.com>
Subject: Re: [PATCH net v1 0/2] net/sched: fix action batch failure cleanup
To: Xuanqiang Luo <xuanqiang.luo@linux.dev>
Cc: netdev@vger.kernel.org, jiri@resnulli.us, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xuanqiang Luo <luoxuanqiang@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 3:04=E2=80=AFAM Xuanqiang Luo <xuanqiang.luo@linux.d=
ev> wrote:
>
> From: Xuanqiang Luo <luoxuanqiang@kylinos.cn>
>
> Failed batched RTM_NEWACTION requests can leak action references and
> reserved IDR indices when cleanup encounters a filter-bound action.
>
> Patch 1 fixes the failure cleanup.
>
> Patch 2 adds tc-testing regression coverage.
>
> Failure reproduction (key output excerpts):
>
>   python3 tdc.py -f tc-tests/actions/gact-rollback.json
>
> not ok 1 e3b1 - Failed action batch releases a bound action reference
>         Could not match regex pattern. Verify command output:
> [...]
>          index 1 ref 3 bind 1
>
> not ok 2 e3b2 - Failed action batch releases entries after a bound action
>         Command exited with 255, expected 0
> RTNETLINK answers: Resource temporarily unavailable
> We have an error talking to the kernel
>
> not ok 3 e3b3 - Failed action batch releases repeated references to a bou=
nd action
>         Could not match regex pattern. Verify command output:
> [...]
>          index 1 ref 4 bind 1
>

Thank you for providing a reproducer.
For the series:
Reviewed-by: Jamal Hadi Salim <jhs@mojatatu.com>

cheers,
jamal
> Xuanqiang Luo (2):
>   net/sched: act_api: release all action references on NEWACTION failure
>   selftests: tc-testing: test action batch failure cleanup
>
>  net/sched/act_api.c                           |  9 +--
>  .../tc-tests/actions/gact-rollback.json       | 78 +++++++++++++++++++
>  2 files changed, 80 insertions(+), 7 deletions(-)
>  create mode 100644 tools/testing/selftests/tc-testing/tc-tests/actions/g=
act-rollback.json
>
>
> base-commit: a401a9d547c50ef34db1088cc1fb9a201a7af657
> --
> 2.43.0
>
