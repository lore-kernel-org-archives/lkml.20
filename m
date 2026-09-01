Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7532B488741
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 18:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788285878; cv=pass; b=VhVnfnCsT4bWUP6IvF0GpGYWHwb/7GJrOhpA5ae6a5o5OigJ3CP8UmMJP/YK6ckKPj8wRqHseFgziKIlbIfdP1tSyfSpch2sqYpak8nVihzMxy3nm5L/4izy8fY+QLiyqhsThSLt/HQW/sOEuTN3el1KhtIhImxB/L0sDzBUCIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788285878; c=relaxed/simple;
	bh=hUVVEFTVIn467SJywBoEi/ks8xT0q4iqiCkzqcTtTlw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KTfh0tehNr7v+pC4lOHl2d5R7wGWHFxHuVcvbXmMULHJ7Z3GemLvLrAPgJP5il95vRiAESD9SEV88JTSyH1ilgWqYQzH/fa7EQWEHU7mshKS9RjsAMYbpTMYzxvOCTrCK4PJMiRJD4LqYHmo9qeM5uRwOqv/xGnmy9Tjf0OS3l4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vf6ICtHz; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vf6ICtHz"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b8f86c6deso643715e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 11:04:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788285875; cv=none;
        d=google.com; s=arc-20260327;
        b=GVsYwjsismjp70LXDwFEVXvIZBpYiGDPysLCiOtGmx6ExNyzXNiR0SFFHRvzafZdim
         OTodsNSpBQSPBUaW8eRBNoaqg/WZmXEtzIsLtZKC49E9wK2cH50ELU7KykJ3CZNv/OLM
         rQDph6pHW1G+kNvOhNWdYHzh/Ald0ugEZhIUK3Qm6IM/F3pHJSFVs8vidat+0k7Lkd3M
         U9Gw7m8ygAzuJwU34rdM5Yy6f+YG1g3altetv/F6GngYYwHlWuuOlBtr/tWpyGH9jkG/
         x8Y3GyI3/rfFjMfXVhZtNmUgJAecTMd5JSW0JhmnoHYbVZEyy8AUcxP+YZcCAaFd1sxI
         3jCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hUVVEFTVIn467SJywBoEi/ks8xT0q4iqiCkzqcTtTlw=;
        fh=TgrNnBkdkgKg1jmrfrgr9IdJ+uzoeqttCt5S4jYj6VA=;
        b=hKnHHkbpaQevrPU/SZLT3GYMe/dzjJZnN1W9l968iGEMUBTbQY4BeeAKmXj/vLmy89
         ZtfYTnzn9HeGjdFBGcGZUNhfdKe+AcXUU2OMzBdoznLrKWVbyu3HR9YxqKHhsnb1zsz4
         JJBuba5gVkAwHVqa9Yuzbeovnn0HGQQ5csTrJBCZ0G8pGkPQrXLzIRAylSH62TQ3zQJk
         VIYjFINyUF4Y1ZIT7IEu1uukXLGbFERhFt2xs6oIWspzdAW3kre9arJvh8BajrbPANYp
         iTcmtrULGEzG+A23KfOVviGjGIYiVjip/F2m5PrzdsnWdiZ1iY1eqU4zwwjZ2eu5H42y
         0n/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788285875; x=1788890675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hUVVEFTVIn467SJywBoEi/ks8xT0q4iqiCkzqcTtTlw=;
        b=Vf6ICtHzn/LDfQuY7Z29s+dgl6mgQc6v7VXMT8JRZjShdnRssZ/LFMRcRkaJdyI1j0
         RYNvUDVThmTNmdcGBXgr2Bzt7/sFe/wA15iEaMq1m0E3ILsQvhLjShFDk3Qzct3X/lcz
         8sBhOVjDL+v6jmyb5cwX1nbsUijkcK4z/Sw2Ph3LKpkVQbc7flb+3EuQvFJgyIwUBX3N
         ReVqhksUcQ5+udyeRvB/qywZwoM1QRNh84svFrFAOKZ19iQ4vnBBVMrdh0jc0hEanFvm
         3eYln+BjgvuH6hxea5JIVXW4kzv+WgJRAQujtzNloEU0PR8mM0diQHHpKokb5uqztoSF
         FPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788285875; x=1788890675;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hUVVEFTVIn467SJywBoEi/ks8xT0q4iqiCkzqcTtTlw=;
        b=VHqYieIAc1T7v2YwXOCO4htkUVkAoPZPB/+u2F3nzY4twYR/e1E+dG4aBQ8VrfjGXp
         Sqogdcc+rTc/3jd5byBZLEktfLBUnwZjf71JXrxHmhy+hAOsVhSfVsgRBvpDYdMM1AR5
         ZXXa4PC0crpJk7DcN0UXBRzvNefm/LnZH1yQ41NTsCb+27irAHZgqW2Ev2A6ImHmo6bk
         XBHy75P1wWnwqhqTG29ngSN3DpWMKCrmbjl27MnDy657UN5bHvu4NDLf9ADrrLSc7aj3
         nvqGhNXlHWUA0Wt6OPvbZy4gUiwKQVMQpopMbpeQJXIkUQSZc6GT3gcg7ATLT0NB/gkN
         G2Qg==
X-Forwarded-Encrypted: i=1; AHgh+Rr1QwBC6bPBfw68MxMNkOZdEDIDQFpCJ91uJ1nHf3J1WH83uWjZ/wnB8Yft3lE8SOS1GHW6wjQszX2FtC0=@vger.kernel.org
X-Gm-Message-State: AFuF++n5NvmKz8bGafVVnJZPCVGCgYYdXrYeC6yIcdh/SJLEYE5GxjIP
	xl3SPhAqelc18xO9TYh0oTnbF9QBA+ca6tNwqUH3xEhgALbJmX9RVKmo4IP9UHnnTGHpCKcv+5W
	JMFynBv95tF2Gm6u44hAA0k/02KtZDH8=
X-Gm-Gg: AR+sD13a7lczHbThf2vxclaH9Z71BFjjnnVjYJc3jAXSWQbe9rr10smw9B8gAFPd1+k
	RuupnO1sJ0hr5Yh8O4Gcu8OI1XumzOTWra7GcHVkCV7KUKp5mM1neOV+FJM3o7woThd7vciKPKN
	hLod8Zgw0Uuu/PyeFTNw+jsCcFBn0Np4nJiYoIeLd1xFvZl/whS2mIleOP68ljR3bsxqp24F1rp
	k4D9oeQoriYr9AQqLMav+CyVIgB7GF1d6eIu0H/P7GH3f05W8scSZXFwIK4qFaSZQjROE5ZwHeG
	548Z5MKjGM772/sH70J2ODzox62HKwiGLK5/zQNbCdCYb0TCVfVPGZp1TLb/XcESpTVhiC8StOC
	8inY=
X-Received: by 2002:a05:600c:a012:b0:49c:d818:8764 with SMTP id
 5b1f17b1804b1-49cd81887aemr257261865e9.11.1788285874997; Tue, 01 Sep 2026
 11:04:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901161317.3468233-1-joshua.hahnjy@gmail.com>
In-Reply-To: <20260901161317.3468233-1-joshua.hahnjy@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 1 Sep 2026 14:04:22 -0400
X-Gm-Features: AcwNN1VidmfJ5pX46qChkksGP0fJtnDQ2Hgbr8MA8crLeorD9MO_R1ONtmYEAUQ
Message-ID: <CAKEwX=MD_EcAaLzMGnMytVJ_KTGmv=hpR2h-DD+w0oJRjzkg6Q@mail.gmail.com>
Subject: Re: [PATCH] selftests/cgroup: Skip test_no_invasive_cgroup_shrink if
 zswap shrinker is enabled
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, cgroup@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 12:13=E2=80=AFPM Joshua Hahn <joshua.hahnjy@gmail.co=
m> wrote:
>
> The test_no_invasive_cgroup_shrink selftest checks that when a cgroup
> has zswapped out more pages than memory.zswap.max, that it does not
> trigger writeback for other cgroups. To do this, it compares the
> writeback count in a control cgroup and makes sure that it is 0,
> and compares it to the writeback count in a aggressor cgroup who
> does expect to see writeback.
>
> When the zswap shrinker is enabled however, there is an additional path
> to zswap writeback, which can happen independently of reaching the
> memory.zswap.max limit.
>
> The writeback counter cannot distinguish between invasive noisy-neighbor
> driven writeback and the zswap shrinker work, so the test becomes
> invalid.

I think writeback in the control group (zw_group) happens right during
the first round of memory allocation, but there shouldn't be any on
the second round (as the second round involves writing to wb_group
only). So if we read zswap writeback counter of that cgroup (zw_group)
right after that first allocation round, and make sure delta =3D 0 after
the second round, then that should work for both shrinker_enabled =3D Y
v.s N.

If it's still too noisy, then I'm fine with skipping it when
shrinker_enabled =3D Y.
