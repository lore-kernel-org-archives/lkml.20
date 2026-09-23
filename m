Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9F844F54C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790148915; cv=none; b=GNrYUHOYU1vQ1uL8MW3/y+oTm9AN6Cc+uztb3bgZLVECx5FrvRKDY9b+hoSkH1Y5D3DFqGIlWuUrZZ7MqnpjKlGhh867yg44Qdoeg5SLJfs8hC0A1X1LWjcfCiZiVN/F5jqqtVX9U1ywIPv57pkfJ0E+2cRgqGabu7i/Jd7T9Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790148915; c=relaxed/simple;
	bh=NpAQJEpAggqV1p2gBrvheK1e8z0DrJ7uAPNXG/lVgjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hwm4QySGHacfG7QJrYC7QoRLqL5s6N7wRoL6rXkyEDnip4fcYqXvU1sITMsiX0sMzVaRPOdzdizuHzGHOZH5/pU3WcZ92usUrT/gwdCuJLhtx/zEcbGHdM8pI5NM5T2m0EiRlFR35JmM8/UmJ9Lggw3nBAS4HI9LVNO+nJeSoVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DG5pzHh5; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DG5pzHh5"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so2991605e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790148910; x=1790753710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NpAQJEpAggqV1p2gBrvheK1e8z0DrJ7uAPNXG/lVgjc=;
        b=DG5pzHh5r/Zq22kTIQE4z2zCLr5Vvq+/VAZ7JzV8m0DHyr1DTaeh/5R80ylSDvhLdj
         ulRRH/nA9DN1JUtczNNCDcttkIzx2nrPO+jr69++qZ+0qdKhOXt4F+MBJLUS6C4/Izjr
         FeD2l4g6V8yVTS3Zb0+aoPB2Zfyu7KiZ7XJpw8J/7AHlxeKzmOGS4dROIEHp4iV3brI2
         EMG1KiKNqgjIM367zL/GYf02rdwf7QqIo6ZVQBSBeVG5hPm5To+Bs9Remb1AovlpftvF
         7mwxYjR5rKAHkTT69gHHbm1U9mEFJ/0hkFB6ns3gHQnTHeiEaecPDimliExUzSsg7zW/
         A0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790148910; x=1790753710;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NpAQJEpAggqV1p2gBrvheK1e8z0DrJ7uAPNXG/lVgjc=;
        b=UbLanTaYWg8MehOGtIxwcBui7IRdKTnjg/MuvVh/15RjI1pAqA48/pYdCvh1ZpIqvi
         BPVV9onxxua03NYgu7fMW+8taqtQOgdAUHhsVnrC7wsvi4+uK8pFZqTpNG6QBB9utZLK
         0TvmsC0eImh/Os2gCwrgqy0mVOZe4M3Qq3p2pHbV8SGQNXx05mZzd0ELZCwxheKRmU7F
         Qe07YYNrWGLLvb9SdducUiXcjdVbnvJlr5PBpNjoUJpkbgFHSFuPR8cgs3uZbX10e5M2
         QODbqiEnum4itcidDbQWvyb2klZW/zYOybBl/9GnKX2/pVr5M4ttDr9j3jwcSRk1vCh+
         VNLg==
X-Forwarded-Encrypted: i=1; AKwUvBwE2DyIXjqxWDS/khK7atNl4Z2gK7Fvxm1LGCvlxQD4m+iCML5YfnAu9oOjGuqk+JUnossD0QJMJ+1XJAA=@vger.kernel.org
X-Gm-Message-State: AFuF++kBvPpYksvvD6X9U3So3S7ajz2vySSJaDO8eh+PnPExN4RuJNV7
	4hKlyTdnyuVw84CMIqZcwytduK/Ji7m+FOaMRiPNj40Sw3yHhh21lJdh
X-Gm-Gg: AYBFou3Rg4x43n4IFr3kpwdGaVUeQAzWuzN3XUCAmOZgKhdeYfQRJMpb+DQTSq6H8c3
	MJtL32IqTd0cg08H3wzgGEbMd8yV62lTovPJODjf1560baDkFFCx2qVLfKjxsV04jLNtsLKEcMV
	A2VvOmF+obKyk9Uz4HOhUbJV7lbyctw02BZmB9b03uycUkJT1qRxLk/pAOqXYgdOXy+xnw5uOUo
	AGONkNaprgclxbfXnceaK1VxcGnUmR1R+SlD3kj2xz6WuDStMD174nsKbO4WpeIlr7FLGML5WlH
	mnSCUw2SO0XUfFFBCq3znkEYwO/B+zzlSkDZ84qOi/0e0LnhySAANvKTZhTQnXdwaOnVy4gFIni
	0C3mQ/L+qtTSy3/whIuOEKb6nyolGU9GIUflLWVgBIKX0bRHvM8X0KkVCfbzZcgWFygQYZ8wAYz
	B+BItDaSiedyxEmDz2uY7cXFuphidWIaXcbNm6KNL0RL5wNKSEwAhs4zHULVpUAUBc3nzC/+wyI
	owQQS4uZqmjRfhaxA==
X-Received: by 2002:a05:600c:34ca:b0:49f:ce78:3568 with SMTP id 5b1f17b1804b1-49fdeffd818mr18600225e9.25.1790148909725;
        Wed, 23 Sep 2026 00:35:09 -0700 (PDT)
Received: from localhost.localdomain ([94.252.74.168])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fde180a39sm70649425e9.1.2026.09.23.00.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 00:35:08 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Beata Michalska <beata.michalska@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ananthu C V <ananthu.cv@oss.qualcomm.com>,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v5] arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
Date: Wed, 23 Sep 2026 09:35:00 +0200
Message-ID: <179014889997.344140.3757658991789489835@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <arKpSGPXOCFF09hM@willie-the-truck>
References: <arKpSGPXOCFF09hM@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Will,

On Tue, Sep 22, 2026, Will Deacon wrote:
> ... does this introduce unnecessary 64-bit arithmetic for 32-bit
> architectures that currently pass 'unsigned long' to the existing macro?

Good catch. The truncation happens in the unsigned int temporary in
arch_freq_get_on_cpu(), so v6 will drop that temporary and leave
kernel/sched alone.

Thanks,
Oleg
