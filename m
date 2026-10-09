Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D583EFD02
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 05:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791525205; cv=none; b=drBVQvNZXRDQ571g6CTw49DdyrsqItHUQXmXE4zPRtZoJYYCRLwVvAnp/yg39oZZJveLUp9d36gQ970JS1YOH7AlsIOSxlLvehPxnGWzdKIZB7ERoK6Oa6CKapHLyJ6gQ/hGp4FZ5Qj55tRZNwvortWD3aM10/bCmc9uCl15e/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791525205; c=relaxed/simple;
	bh=Ban0n7745AzBI+q28L7dD9Gn9SbstwTnM2yds7GYTLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WufPhktXNCY/WoQqBzka0pGqjC1oRiJyYFMXXQD8Hjkn73X3VjvdW0RFe+X+6oIEb3AcA11PwbRVN6+n6CGWb2yrecRHIcb8KDPQDGRvEekPsYpZ0ZiEenJbYU4DyMIiBYOFTNIUoHpMAxI+G775vvneFNwiN3NQjCMIdtBpEZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YPFkhcT5; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YPFkhcT5"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48b06f58380so206736f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 22:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791525202; x=1792130002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wVlDnOJmdRHsN4qn4A2HDhzFDxkd+SqZNh2m1iwQaYA=;
        b=YPFkhcT5vfxb1V5Pgkij4XWrcW4Lf19inD+lUsMtD4VROFaLvooWnJY80wkW0qLubj
         svMDNgfRJaUzQHD45XvJS5cGulxeSNK8ENB4sNZFkt186MTGIs2UTBoJLYAiR5ynwdfQ
         679mocTqwmQyY+BBfZv+tXNhkc4oZCGGapwCHMvSWIfBJoySLqQa0b/TPPjK7aSu442l
         XlcxV6sRlfG9NqYv0GIeZlg2B8p0SnqG6mal6odXG1EjMXHjR3pG9eKb+Sqsva5J63wh
         E6VImS3xfX5JJ6UfMSjPeF/urOjjUt9R1bZZqlpBTc2+S21yQpf+kTFu6MLpGUp5LcuI
         rHfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791525202; x=1792130002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wVlDnOJmdRHsN4qn4A2HDhzFDxkd+SqZNh2m1iwQaYA=;
        b=NF7a/e/K0hmWeRdbqpgaKtU2E3WjvtWp2dWgpXuzMb5zP8NhgPjwLnpp2Rz5i+vTSs
         UpQjJ/QS9Q1hnXD5Q3ZNnJ6UNvYigGm/0wiGMSGBjjsX2l92ZPwI5FrostJIjy//3s00
         H4lcJ5PM2Ivg9rNMvFEHDFrTI2USMi0FCdAamUWgVqIb0PuMqKiv2PD9A9EohrObVFj0
         UYdENcGUFJIPxCd30imwrcFJKpRnKe7D9wlfUAA2T990iOgDWF+IdbasjW1erleaP3Ib
         BEYsc5vm+DJJoWDvOqmFccN4tKDm6MV6FmU/CQnb4chlJDZIe+L+PTh4X8loTiHRBF6r
         xkYw==
X-Forwarded-Encrypted: i=1; AKwUvBx6qCIyAv0AZjfJxhW6la2rzxsP8Z+f9lpd93LLD3bT1isB5utE+W5Laq2mfc8hXxMHuLyi7dOTTvInxds=@vger.kernel.org
X-Gm-Message-State: AFuF++kl46UakvlkDFRdcO6FVjdiGHwoTCzr5HL0321DaU3ACOLQl+xP
	4iS1rXFW9HUz3Z9JZV6obJY1YQqAonr0QWE3WcGJBOdxq/vig3PXH0aD
X-Gm-Gg: AYBFou1Zg11bTCE0c8yW9OBneg7E+ly/SH+dcFLVBYJsKb8tCzcVvUTWhmuQotKhkp7
	lQ/csNCKOvqBB2hNZ/klZrrnx80nEtJm5AZEzx4a04ugSpBUYR8WAoHL2e3HKrWDU2xYY8rwLuw
	+iRTBV6dCABcpOZFCoEuUMbHRd//Pah/+P4LMMmbZbWYtJY67HHGjppY/Bf27Ym6TMxBzNbA0Wo
	w0qUo/g10hFcm6j4j5XXIbZGevY2gjCcaynpEjA7iWbQiNlrn5IxILv2PJFbNuNb/Y0jSWJZemZ
	DnyFMiU08hrZ/wNqXWU1oD1MpzDienr6tQ9XeDll+X8fdhEZvQ7fM9aRCIw6ROarClU+UN3oS7N
	ocrTIlZ3Zp2uhyPFez72pJGOrXXCBu/+wy6NSPQZEOVD/B+/sfYDwU4F/DS5gUZJGCdjbhUVF0t
	XPwVdt24Ymj4oyjTwoykzh/+m3vQM98OYHOGDOGsENIoWMCKqqZoKNO5L3gA+ovQzWzBrSL3mAS
	f3mVF2JDzH8mT2NtZ0W
X-Received: by 2002:a05:600c:1912:b0:4a0:73b:a222 with SMTP id 5b1f17b1804b1-4a18e3ee97dmr11594485e9.0.1791525202556;
        Thu, 08 Oct 2026 22:53:22 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18ca51465sm22826485e9.4.2026.10.08.22.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 22:53:22 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: vincent.guittot@linaro.org
Cc: arighi@nvidia.com,
	bsegall@google.com,
	changwoo@igalia.com,
	christian.loehle@arm.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	lukasz.luba@arm.com,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	pierre.gondois@arm.com,
	qyousef@layalina.io,
	rafael@kernel.org,
	rostedt@goodmis.org,
	sched-ext@lists.linux.dev,
	sshegde@linux.ibm.com,
	tj@kernel.org,
	void@manifault.com,
	vschneid@redhat.com
Subject: Re: [PATCH 10/18 v2] sched/fair: Add force push task mechanism for fair
Date: Fri,  9 Oct 2026 08:53:17 +0300
Message-ID: <20261009055318.29609-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002154415.2270586-11-vincent.guittot@linaro.org>
References: <20261002154415.2270586-11-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>  	task_tick_cache(rq, curr);
>  
> -	update_misfit_status(curr, rq);
> -	check_update_overutilized_status(task_rq(curr));
> +	if (!tick_pushable_task(curr, rq, rf)) {
> + 		update_misfit_status(curr, rq);
> +		check_update_overutilized_status(task_rq(curr));
> +	}
>  
>  	task_tick_core(rq, curr);
>  }

Hm.

I think this mechanism added on here does not works.

Before fair_check_pushable_task() is called, we check
if nr_running is bigger than 1. If it is we return false.
So when we enter fair_check_pushable_task(), nr_running is
equal or smaller than 1. We first run __check_pushable_fair_task()
but it doesn't really matters, since it's output
can only return false. Next block is skipped to since
next == NULL. When we're at the check_pushable_short_task(),
the h_nr_runnable check is always true on this path,
so we return false.

It this intentional? Or am I missing something?

Thanks,
Kayra

