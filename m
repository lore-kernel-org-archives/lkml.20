Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305E84825B2
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789041642; cv=none; b=XS8I1/25kNLfw+HfSS1pWI1rlCJRRElBph3+i0wbnuSUkS559dUyqlKnAxZjlZNWxRskWVnwk6qKdhnWl+glhxEyStQHxpCBXIavFEGTguKwRVpWbX1ZAtxVDEXVE1GzDm+gtpF5AlNxfScHslzFw1QHACmZjh9SWsvDqohyKZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789041642; c=relaxed/simple;
	bh=8GE+UBljCbfiVsszGf9Chg7hIB7018h+yiM+EkGlIuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IbF6xI7yKa+qH1FRTcAi6xqGb2jOoVXWubFKqvYW0NUpp1m2Mpaalhxpe3cFepqNHCVB9FKQzST3yRjc+bFt6dijJ8OC9WSHR5gI90XW+SOv5wh3RfylJQUMPf5zoUan1Y4mFp5wlfWMkxdJD0TLYnEpiF2haeoT3rqHXGaOYUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JrYTCWxQ; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JrYTCWxQ"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843178b1c8so628432f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789041639; x=1789646439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8GE+UBljCbfiVsszGf9Chg7hIB7018h+yiM+EkGlIuw=;
        b=JrYTCWxQuvMYbBJuAIDgnBVT46c4zHC1z9jUqdDmH5yI9960GqBefqX9ewYsZULnXU
         mx0NUWlwTsbMMAVoUXhXdg4JCV2yiMYUMu4awq2kgKT/YPydTOABEhBd1FEcClhncgvr
         fOxf9ZezgJVagYoaMZ9ZVDSm64zMqG9LLFr9Aa9tkZNx0UQmfM0YQwLbfKHWkrG1Y1qD
         0q0qHM7sJOV/9BM5AlMz109iLJLjUbPLWH+6kWt/lLF/4i7TyphUthsy1XFgFPPIP4Ar
         aJghzKtXfUuDDHGQuqx7gKbsfArz9aaTOlG4petb0VKfgka6z1uweky7XeHhr1h8LM1G
         jmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789041639; x=1789646439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8GE+UBljCbfiVsszGf9Chg7hIB7018h+yiM+EkGlIuw=;
        b=Q29uE4GIuJW3vqd2Y6jrfwz1oZc9hi7WHrokPtEZCZCMVSJsYU0HPQc+dO1U7FVyYu
         OyH+RFD27aXagpgcX23DuJwOFB0djgG9UIPeLQmapCT7/TyG9sn45Kgx4lm79EGaf+l+
         AiI2cSf//w8hAO4O0VqyPaf91baT+9T58/B204PzfAXY0zHe1G9jN1ubppA/CYD8ObRj
         Jcxp0Uji51L1+SKzqfjrVbI77Cq6Pi8EyojgjwlbSmlndRco55KleSHrnnFFTwaLcuoM
         JcH30EoaBqJTWuVAZANBKlerD7RrIlf945HYW0OW1UxJapksplLtZb9Wi4BdS/Fpz4MR
         R0og==
X-Forwarded-Encrypted: i=1; AKwUvBxtTAZvur//ngiynNlVTAGyjz57AACvXan/An/7H4cLCbWkGYNFAAUil8HeAnCLpkF7W5ZpoSJC0cp+o/c=@vger.kernel.org
X-Gm-Message-State: AFuF++mAHF/IyzrbJzENhrVkicRbd9VhD4H+1BbjL9WXlNrwY/anLoVG
	xhGseMwpvEm7NoyLTrTwGq7nV3+sZJhNOqiXGgMu5LkYD+Qx07gwuKZW
X-Gm-Gg: AYBFou1zP1lAsCHkphR45OU2OD0SRMvJLneTuQZEQLVxA0NF6b7AdLDpHReyFAal+29
	J57FAEEO3LXKLio5fm+nIGg5+TlwQPg0gOGgXy+CMeWxcmVrN8BZMiuNVyn+qU3zxY6chlzV06z
	oIdh8wptEbIzWDcOdIW5e+xeJ1Dfn/g0tZAdUbVfWo3NkAdH59YJhru/IowOlyrqBFk0sBt3+GA
	3vXkZkAlcoaNE517gfBPmFwAprUKQQ5BiacQrW5aXgepkY6hWnqyHMy/4Kiq0ITchCI3LXqzT4r
	pOHGGp65AuTHMUjf5FhwAPPQziSmaAvODV9qWNvzjt4Ot2AM7ubBleJ/Td43x0EHaui5ttdmcFx
	p/SrwHBDCHF16/Oebk6wrSbjolcguDCHqKUzye/s25EoQS5Y1m/JBH5lRgYkIuVvofy+GSjQU5u
	7RhW3YINqNXLcv7vby9iIBorB3uK6KRRO3siY/tsebiOhMtGlI4Z3DAk7tcyqfI635nQV82Ar1h
	tq0s6ij0q/OJmtNmyaCaz4=
X-Received: by 2002:a5d:5e0a:0:b0:484:3200:b7a6 with SMTP id ffacd0b85a97d-485907ec2c3mr34354506f8f.4.1789041632548;
        Thu, 10 Sep 2026 05:00:32 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48594172546sm42159296f8f.15.2026.09.10.05.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:00:32 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: jackzxcui1989@163.com
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [RFC PATCH RESEND 05/10] sched/fair: Introduce select_task_rq_fair_thin() to select rq when LB_PROMOTE
Date: Thu, 10 Sep 2026 15:00:29 +0300
Message-ID: <20260910120029.1207437-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260910042950.1619727-6-jackzxcui1989@163.com>
References: <20260910042950.1619727-6-jackzxcui1989@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Xin,

> Testing has shown that in our system with 18 CPUs running at 2.1GHz, where
> the first three sd_llc domains each contains 4 CPUs and the last sd_llc
> contains 2 CPUs, under same fillback scenario, select_task_rq_fair_thin()
> executes 25% faster than the original select_task_rq_fair(). It saves 22ms
> over a 10-second period, with this optimization accounting for 0.174% of
> total system time. Additionally, we measured the execution time of
> update_idle_cpu_scan, which took 0.5ms over the same 10-second period. If
> we use select_task_rq_fair_thin() instead, this time can be eliminated,
> accounting for 0.04% of total system time. Therefore, the overall
> optimization contributes to a reduction of 0.214% of total system time.

Okay. Can you specify which tests you ran or what you used? If you can?

Thanks,
Kayra

