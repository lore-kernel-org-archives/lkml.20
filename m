Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D50274B53
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790572052; cv=none; b=A3n7Q6db0EECKytTy9QXLj01eLoTB2M4nRQSWvdQpHfLzZfarxG1mcNk+ETvIIS4PFxmkNlTbmMDx85zwhabbUTvJAunnc/NX6D9dlR9p6V2UeulwOq1tuP9j0jTWpTC4JBWPYSkmdTgQPuMP0gryynfSxs5XiSo/rJgQQ08OC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790572052; c=relaxed/simple;
	bh=cBbmgWLkTygFI2uRkgGE78CRY5thYY1pH6OrLNgGW6k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SUOWriRgMvAEOddL1fzw8wJ8dFtTt6tOOrCesDSJfjz1Uyab7ZlGQsQh6+PTkVwK995VIcQ/wYo2QlxPF4Kpnj7iPsV1OMM+tU4/MC/o0F9pqSgQZAUZUh0jfGsVdK1nQhkPXQ3QzWervP7kyxD9ehnvFdRh7YwtmPGfY1+ewNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr; spf=pass smtp.mailfrom=korea.ac.kr; dkim=pass (2048-bit key) header.d=korea.ac.kr header.i=@korea.ac.kr header.b=AwKPLFLI; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=korea.ac.kr header.i=@korea.ac.kr header.b="AwKPLFLI"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-398beb616f5so1355857a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 22:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=korea.ac.kr; s=google; t=1790572049; x=1791176849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qsssqQqsH/k0kClUG0kGbGA89DoV1qMemL3yMlvJcq8=;
        b=AwKPLFLILepeIex/i3EGlDc+KhEMu/bDOwM0UE2/KsX8GLk9X/BsWMpz9Lw2Lt4c+N
         JIkUvlWVmetqAy1C+ociejnKlsBzLiwAHGqW3ChfZ/zLv8rSvHJN8HnneqF6HKpI2mWp
         /W0C+IdXnH2TZu8vpDQ3Pmh25Aj8aOCwZhch8WV7cIdCFro/px/rx3C42FTbg6XEBYjz
         FHY7bYE6EUht8/5/b7fz41Fy+InQkfDETfVlozA2faJlK3gLssXx7lQn8v2jjWMztm0Y
         tYmm1b1b7CymLQJwGf60F3lnaHCmSPGxEJBCUBvEJYmNXfzzAPirqNjLS0n19RS3qx+3
         1awA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790572049; x=1791176849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qsssqQqsH/k0kClUG0kGbGA89DoV1qMemL3yMlvJcq8=;
        b=sI/G3jqj9TaRf/OJZUO6Akm+HJEjmCL4ZEJ9Hn54MRn+DVq2uU8zHN59T8yeU1SM4i
         4vZxnvkDR52uXnYOiBxKpfpT33xl91I0zB9JTPiE6GhZT3+wkEpJogZcygu0YXr62t2G
         PyfhPVrJ+7AsTlREWVCyzU/gLtMmO0iq/1l4Yk3C2huMV94E2+Yb5CrmE7uNMDv4YB03
         PiHh4a1+BeoKQBRVhGk6x1G9tsK35idkhqWTa3ELpHrd1lvUe8oqXJ3rGA6XDnnvF/Bi
         SMoE/ADLNaWUHZQpR2v5fqbZej8Syi8dtWz8w1TRWt63AGFL8mMCWFLo6hA1dn/Op86L
         dxBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZ8FlKIIhxqeD5jfEwpjtPZgJfZRjMZk7TqlaKWzzx375J/23D97F8TXsvHjlM43XdTSNuyYG2xb0LrXw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyqBZ2YB5C6WX9qP5BhimBzcyYvlFFMIm0cy0bDMHlJ0w5+s6O
	WjZedQu0Of//QvhFK6A4AhBUDnFuugNCXRSyANdqNzlanYytF2ledE5j2F3pWeVhyLk=
X-Gm-Gg: AYBFou0mpYSHapNvr6Q0Qkl0k0W7PNnZR/RJ4sp2AdDNtVQxDgCQbinkh9N1zWMxt9Q
	c0z9/LlPmAuXWDhwFb/9UkmDBwjS76+IFdjh9GBIXgPiWKEVW4t6G5AEmtUw4vjXr2Zscgd0pUL
	7l5tdRNUx9VVYEx7qS3nXA2gPM1JZNcJx70/dtHtaqB0fM07zNkFURL+cQG0Ibdwj/uVhyHGVqM
	9nUqHM6QJfgo3FP+YQNTXpxbNI80NsfZDoc4VKbKa/lTltgTGthxNsuqM2Lq5D6rUe06o3UjJ5u
	teqZfqRV1U24I0Jo4yrA1UXVjWgnZuSIGBzGY2xVzJGP6xNKbcxLahVHH75pd+bkcIX6hQ1Gluq
	xld7XjfHF7489XnNgIBuKJmzVm83hSZEyONkjMbxiO3mh2h2x0eCTWHzqjyucemuczYOqbb/yKL
	Rq5N8ZnTxGLE7sX5EcxuJmVCA92r1pf4C9HF+9mbzmJvjZG+oFic+YXWLiwySpliimQs0SiSqUH
	r3LfSN25QQutA==
X-Received: by 2002:a17:90a:dfcc:b0:3a0:cca0:4a8c with SMTP id 98e67ed59e1d1-3a0cca04bf4mr3730718a91.7.1790572048813;
        Sun, 27 Sep 2026 22:07:28 -0700 (PDT)
Received: from icps5-ESC8000-E11.. ([163.152.219.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b499a772sm6281182a91.0.2026.09.27.22.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 22:07:28 -0700 (PDT)
From: Hohyun Sim <tlaghgus0425@korea.ac.kr>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: Abylay Ospan <aospan@amazon.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: netup_unidvb: set the vb2 queue lock
Date: Mon, 28 Sep 2026 14:07:22 +0900
Message-Id: <20260928050722.274052-1-tlaghgus0425@korea.ac.kr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910063826.112147-1-tlaghgus0425@korea.ac.kr>
References: <20260910063826.112147-1-tlaghgus0425@korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Hans, Mauro,

Gentle ping on this patch, sent on 2026-09-10. It is still marked "New"
in the linux-media patchwork with no replies so far:

  https://patchwork.linuxtv.org/project/linux-media/patch/20260910063826.112147-1-tlaghgus0425@korea.ac.kr/

Hans, I have added you since this is fallout from your commit
c780d01cf1a6 ("media: vb2: vb2_core_queue_init(): sanity check lock and wait_prepare/finish"):
netup_unidvb sets neither q->lock nor wait_prepare/wait_finish, so since
v6.13 vb2_queue_init() fails in probe and the error path then NULL-derefs
dma->ndev.

One correction to the commit message: the paragraph saying that atomisp,
pwc, msi2500, hackrf, airspy, rcar_drif and video-i2c were fixed for
having "no queue lock and no wait ops" is only right for atomisp, which
got the missing ops in cf738cc7cfe0. The other six already had
wait_prepare/wait_finish and only set the lock after vb2_queue_init(),
so the check did not reject them. That paragraph can simply be dropped
when applying, or I can send a v2 without it if you prefer.

The patch still applies to current mainline.

Thanks,
Hohyun
