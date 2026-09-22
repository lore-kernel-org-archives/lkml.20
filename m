Received: from mail-pj2-f32.google.com (mail-pj2-f32.google.com [74.125.227.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4093537E5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790068542; cv=none; b=gjijdMyoIb/U3T2hz8tORDZ4buNf9L/EZqY6rsd983X2xNCbHd0Ili/H7Qe/543sbTauQSvAeoEeH2mzbjWKVmzF9LLWPlLg4Nh/g8wE6wHjLWzTPnP+X8oCgTcDkeUwbau4cjB4XQgU2ARK0Y8oSr1i4INgTJV8EeEKp2Kxlb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790068542; c=relaxed/simple;
	bh=PCS9EN6mr4VjpHhghDaRjt+CxzmF2EteyV9+voMpTC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cw0BC7Csa0u1uTiaQQTNAQIdKtD1BeQ9GAaztdi54HfWmgxzsLNiCGt/ChnF12shXthsGAhLE9MI/Ez/fFOXD39wRjy34/SiDG8TXCtDKvRyMQln2O0dW0nyAnk+t6TFcO9bQQvv0y3qOuxoGS2YmSFj8UDOcYNk5M6buXkBBD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qvgdKVAp; arc=none smtp.client-ip=74.125.227.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qvgdKVAp"
Received: by mail-pj2-f32.google.com with SMTP id d9443c01a7336-2d747f05ffdso27561325ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790068540; x=1790673340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KJXgMK8/TxMHCEaOocJ15V08UUI9KIYgXaBk5V2t/9E=;
        b=qvgdKVAp/eCtjcQvDQT7KrAwYhk4EQSQ4OShd5YXhgLXg5RyvPRTuNSHwR+VCAQhRv
         WCsgZxQ/vmGIZhp3E+5s537laE7NR71m773olokcps7Eent08bdL0md6nPDqbM02IiwN
         zsHxl8x/EQFdJvjP3hFMnQZhMeAE4NXKgu2nWpOJPmZf04c96xz0U49YSMDTFKkQX67q
         svbUF1pKC0MGxrIEiXy/TFwQlWC1Xw9ghTXV5VGtwdxCkcRV3HRo+2tM+d1KujYtKkrY
         +RqMm9940UN899d+HJSiAgqebbvqglcUipQ03GlLUjYaefe5BEcw/76ObkP7SLg5AZU3
         0z1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790068540; x=1790673340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KJXgMK8/TxMHCEaOocJ15V08UUI9KIYgXaBk5V2t/9E=;
        b=DJTHylLBSvdwglgE740RP07fTqTViZ0DYB5gqFtVHyRsSWdG5jAcGx2+qng7fE4tc4
         Pr/v4yqIFg3R3sqNhDIc4JsS7m9+quX2LXIRfSjHHtZlczpiadefo1ZAl7LsBWVmKI3b
         oUckqElYv5vvlq0Oq8kjlekUs8CcOrqXJGKPeRYB/F/xTbWKiYfb7AMA/hhclRiiYGJa
         m5PBJZ5LBX+qNURn9HdP5tz4oG/RrkM/C/n8CVMgvmTRdffrLRSi8HOWKJcWMzEdJp3W
         h/KSBSu/xfZaDCEX9l8GU/lG9s2Mgy4FK+xEIfC/hrHem+1nkF/AlBLPFBqOD1aTNR4F
         IW2g==
X-Forwarded-Encrypted: i=1; AKwUvBxObcJPaD3SDzo+FF1wgjGbKE9rs5XlTq1g1rcTwkjYqei3BMDDJfgZIGlgQX5KJLgDax9FPb4qKMF8mqs=@vger.kernel.org
X-Gm-Message-State: AFuF++mp9uSwANYmBN7mUC00j/FXtFcg9wizpWW7e0fdzH76GhISOXyK
	GYZhZukNTYEIK3IeiPU6SukzbCVuuztebhptfyYJKXwZZAnPddfrHVY1
X-Gm-Gg: AYBFou2m/e+pJmOdvO/vhHUkdwSknQJMow6L0YK16CzIZVFCC/iNQ1t2fAlwdPqEVvR
	inhGcFHdOXRVGtFpBmzHrbyVgNOiBIiDnm1mtbI7qOyLhsn2K2afgkjpPHgdXJRI2qYBR+TECN9
	9KeyxJ6WS1YyZw4F/QX7yAv5c1V97tbwBmBPkGDC7SsUQpBUvdr4klzu8bQc2VtASr6ZLGm12Y7
	frbNCl7TBBK6iAjLcA1bmtHwLd2dIjb3OXkeCIBW8J5gdN76XpVcRveQuHEsjjRdftpa4ewByub
	vhA3K2zei5zbL/5bhhdBPk9/cyJffuIvwA1Z/fgc26JHjHKxwEAOm15DH7FFmggK94yUBmt+608
	5U8Edu1k0PVSmPceubebsIz+C0CEgVOOvRDpHzUUgX+gfH3nEAbYZx/wFnPtKSem9IVJqevbt83
	s4qVjFLf6IXEpI6pGkXIL+yJ1d627B1PQDK+2+LX1+9VoWmGBvo1q7GJi6/zIMJHQjZpR9WP11v
	+My/HlTUKk=
X-Received: by 2002:a17:902:ec81:b0:2dd:c100:80b2 with SMTP id d9443c01a7336-2df60b61d54mr6309465ad.45.1790068539769;
        Tue, 22 Sep 2026 02:15:39 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d0308e7sm6544045ad.36.2026.09.22.02.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:15:39 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>,
	mingo@redhat.com,
	hannes@cmpxchg.org,
	surenb@google.com,
	jstultz@google.com,
	connoro@google.com,
	metin.kaya@arm.com,
	sh_def@163.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/core: Account PSI IRQ time to the execution context
Date: Tue, 22 Sep 2026 17:15:31 +0800
Message-ID: <20260922091532.2504886-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922081706.GE2009045@noisy.programming.kicks-ass.net>
References: <20260918132915.1236312-1-zhanxusheng@xiaomi.com> <20260922081706.GE2009045@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Sep 22, 2026 at 10:17:06AM +0200, Peter Zijlstra wrote:
> Does not in fact apply. There is no curr in sched_tick anymore.

It needs commit f5741d2b3451 ("sched/core: Call wq_worker_tick() for the
execution context"), which added that local.  That is in sched/urgent and
master, not in sched/core, and the patch applies cleanly to the first two.

If you want it on sched/core instead, I will resend using rq->curr at the
call site.
