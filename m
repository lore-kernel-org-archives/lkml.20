Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712038;
	b=a0X78KkxCskoeUvOXJOqxn5zMqqnHbyTQ/AwGBv7bNVS5MLrUYvHR2x7unXlUp69B7JX
	 Mzm+AycXyYdtKCffL1HALRed02cerHprcs2WQ6ysK9nl9fjUu/jp47yzWZhg+qhecq3S+
	 +3o5kTgTzk1bRcCl4pAIc4mw8htvKyY512lTvdqMwKAZ99/pCMIoV5lB9wbUKsnd5n8XL
	 w29F/s2S/6YLkij79AxzN3D49DYKwK4iNWN1x1fZPAWCtFppxSI+nl1YfqiCircJI9xOI
	 Q/oav/3CuIJCih0huAdUmZZG6Q55Tizxsw6QVW4NmOoYPWxpINNspJK11LvQGJIOL2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6Q4KJJmzeQlRv4whC0gDRuh+r0dxlpIGt0aXJeqNtVg=;
	b=z0GFV29jbTbKSycVCJepZIqebNL3PETdd/bSiFge514kkMPbeAMTSowVtefFJI3Tib5n
	 UOZblbzpJE+yaXGyjkUnVdaOx3S3A2/ZdCAEQz6GpEgULI+SnTIwl5awNALR1lrdZNHxL
	 EdnG7nmCpZVE81p4lINWNS+cjp0qCn2mQSS+Z1BueK5iTV9UO2BfalQX5pCZsB87a/EA4
	 TK/JwaUaVrnO7S2j6b5IsFpP+t66UzZ8vk57Sjcg739J3w7jD4EJDi1wF8M2OuCHyq5nW
	 94i4zyFt09fPOcoYIFuebdTYN3L0oGaRelnpo6JiKcpQh/H66qO/gNdp4uBUkUrPTsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DL1wuy63;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33813606A339
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:20:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33813606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DL1wuy63
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so26854055e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712036; x=1794316836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Q4KJJmzeQlRv4whC0gDRuh+r0dxlpIGt0aXJeqNtVg=;
        b=DL1wuy63ZQKyaZVhA2YD6nrUIFt573SaTAVJ7Allhokd4ZW20BpevHIvG33E+e846T
         psc0FDyZFTHcJHgdQr0qFikh6Qv7vqoufdL7kekhGbSw8UvVtO8u2f9XNevefUcp9jIP
         RgZFVQtoPLu+E6mE1i5cX3xDpYhmH6gshvU6O7MSQJRIBpy6kC4/ahfFV1wmZ+xFCST2
         34QGjOjML9QUhwhzJM4QunybKBdogSN2SRYGqTOf5YJNwrFwoKq88o+MG449ejbe3zCf
         XixzWQtL6ffiv+tGmypbYXDQQEC7iVrizH76qQ2yXTnOmP3jRL0AuD1EbfU4jmpQ9IJW
         72oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712036; x=1794316836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Q4KJJmzeQlRv4whC0gDRuh+r0dxlpIGt0aXJeqNtVg=;
        b=YbLu70MuFI+PS1TU5cm8T9Nm4LR0rQjaK2kILtLfyan8ALSiAKrnEDm0WTcNSuHf2C
         lQaIX8VsfXCs9AvmdLVvhxMhqkOwt1AlqLTEaZY7fpKJjum5bKQhXsGGz8B8qGnbP9k7
         Us2Ig48WtQMYs1vNguZPLxArTKWa0Ymak5n5oBO1nVMw84ON1lh8srLG7AbKapPEhmPM
         Tgneakb2kMcg1WeG3SCOwp8SLuOxPMKEdTPX8yrpHNsA9Fl5k9sWfrOPN7+smDBrxDgK
         Ut7StRE5UbwgnH4IahSp6ZGxYHYVZO+GFGq9FqNVl+/5aEeeVUecr/IegYHohJxnhbvm
         1vSw==
X-Forwarded-Encrypted: i=1; AKwUvBzM4O1XpV+ZLCRSHCaRih9Djq/301ZniKt8C9quzUtPx6myCcMHYGC1x99C1Ii9/oHW4AYseoj9cEJ7NUY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0BaoOpFOtbPdFsmsleGlnlrct7wxjKbYCPzR+1O0KCPuaTrn3
	kVJsGgh0KfXK/C1zycJPShckO/jQKzA7joO5z2dF5j225/UlxrSfSiYt
X-Gm-Gg: AYBFou1LsAxl2PlN05qJbRTuP+YjlPjLAxBuPCRjiTmcAg3p3eHg87gyirMfpoPNfC2
	+BvZNQpMNY+Dy0tqFk/aeX2EL5Ai8yt5NlalVXQkqt4CnsEq1ysmXWXnFRhxS6SnhCoave5j7zI
	SecpWRjafHEK7EhyI3ufNJfAehyflpPEaL9cS+nFfTzUE38zpBc2XKFn2JHgFRKi0jprcKh2WjL
	yxSOGLhIWidUNptUCdugM3aapxTag5UohLwDGxJoBpR3CZbwVcLDEJ78Mv3S0zGEtUpDuNpTZqa
	cdD1xDPa0cAVv2NaOhcZVaQf4fL30WyOYkF4ccDmpkMSgYjHgZedjrRctLk+99cPARTFHDpZUDe
	cgn/Jk6G/JZ5UBf53Bos2sRwrrvREdZJLY0c2yUWLY70DqhnE4nVkWz7JsCIFxJ0utlWZaeQqxQ
	hzYbfAl1tKKiDk8ob3nPN1C6Jd35wnX+pBtiD5JFA34XF3Qco2VmR/FoZu0JvTlOslR+H74oYbv
	UIUGgcvV4h2H0pEGyXTzbhve+HPYz1h6RDpm/EMykk2uj8se5sC+CechB+HbyBSS5VS6b/pxkWW
	eD1ACxvG5OsK+0O/4jAQQsxE6q2o1tra2FEnRdkLCkD201oVFFqI6Dqdip4fHL44mDpLj18jXqN
	Ye+RIvPva+92SJB59GGhzVRE=
X-Received: by 2002:a05:600c:870f:b0:4a2:1612:6367 with SMTP id 5b1f17b1804b1-4ac185bcf74mr287463535e9.15.1793712036276;
        Tue, 03 Nov 2026 05:20:36 -0800 (PST)
Received: from andreayoga.wind3.hub ([31.189.68.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cebc1sm84263175e9.1.2026.11.03.05.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:20:35 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Aaron Tomlin <atomlin@atomlin.com>,
	linux-rt-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/deadline: Fix spurious -EPERM for migration-disabled tasks
Date: Tue,  3 Nov 2026 14:20:13 +0100
Message-ID: <20261103132022.4004-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aumIRjQS2M0wWlVq@jlelli-thinkpadt14gen4.remote.csb>
References: <20261102135420.244745-1-parri.andrea@gmail.com> <aumIRjQS2M0wWlVq@jlelli-thinkpadt14gen4.remote.csb>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Nov 03, 2026 at 08:07:50AM +0100, Juri Lelli wrote:

[...]

> The fix makes sense to me.
>
> Acked-by: Juri Lelli <juri.lelli@redhat.com>

Thanks!

> I only wonder if we want the reproducer in the changelog. An alternative
> might be to move it to https://github.com/jlelli/sched-deadline-tests
> where I keep the rest of SCHED_DEADLINE tests. I can probably do that if
> you agree and prefer.

Fine with me, please go ahead, for this one and for the cpuset_mutex
one too, if it fits there.  If you'd like a v2 of both, with the
programs replaced by a link and the tags collected, just let me know.

Thanks,
  Andrea
