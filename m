Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413040;
	b=yjR0deKPkyfOw/Z3NH/WthyfdJrgUPV5VlsibBl4D3fUkMZngLVa/XzIZ9F+paaAj5MO
	 qT8YSiD0tRXM/WXmYIciKQ5OeJcrugjSqQmnh8OBt49emreu5D/D23+QTMT1dylN5u8Od
	 MqIoUhhg/oa0CJpqzZ7nSq5BPG3306Et1oXsniGgG0rzQcoW9krTspBIaumbLfSU/aaMW
	 VpZ1edku+Q/R0qPthCDGhwHqTLcDb/Od+hVKQiW+nExwXB0yLPCCsvsi2ibqXzVmkYLJ+
	 6QdIpm+R5uSAjE/AfXsuUDfDDNEzl4RmcOTPPkU0d/Z3VKbl0s6JKafDSRTDf7pwY/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413040;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=sutOCZD75kbiRsKKEjghPb53P8SwRi13E5GUxqPAHYU=;
	b=vlT/VOZ/3e8oLBMJWJCNnHCbsaxMXKBxxRaXhDdeyr7gXAunJE2+47x/ZH3FH+6SIW1C
	 Df6bTZ/ynjJIqH0yy3vrComhs3tAhxuZFC89SrLW7hXFHWn5gywImPeAZZl/MsViGLTKC
	 pKXsOfC9FeLYrStyLIb74KyYGew7i4mxaUffEaSICXiSzW98imxpv9NeS4j8z1LWz47Wu
	 dt+hvB6RPS9S0YWI5qLOyhPGO3LF4fZpMx8Efdy8+BEwnxrz4RXJgANoEXv6uXGxygegJ
	 W3p359W5/HMZJD4rHom6xDg72iInPxroetGOROjT+/KR3XPwTDo3iRZlJfEJNp0x6dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mCbf1rQS;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D77606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3D77606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mCbf1rQS
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so29278055e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794413038; x=1795017838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sutOCZD75kbiRsKKEjghPb53P8SwRi13E5GUxqPAHYU=;
        b=mCbf1rQS2oF4RkWH7BraYtw7Xxhp6FTbkfOx/M3oMoXxnoec9u/ENhX/ry2yXwpqjk
         D5LGE3rL50noszWbIeGu9h7J5s4wobKWVKKUBc2VxJq6wB3hgp0nVx+dew5BOHNbtStf
         PB1L/9odJkGhKS2hHqwTru+97MFLZOBlT3sX50424CXEdwFMsZ8OMwOSp42Jb0myvKgY
         L3imDxWvSwZxzzbKxJId3kFexdSymBE6+Z8VTiEDHJMXUqfujy3K4fzY6zDM+L8U+wv+
         T7Rmkl75Kn0bWFDFmJYYIogPEgzszxZU7YkyYc5eOJ+3hXE1HkJVRtLpS7lWbj5RQeJT
         PrrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413038; x=1795017838;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sutOCZD75kbiRsKKEjghPb53P8SwRi13E5GUxqPAHYU=;
        b=MQrRd3QjChIBBnwyTp/UQjdDtdBBgWbrwxkuXP6NjyIwBe2e1VuI5x8UhHknGDOkyD
         I0kFN5yckXesMD7q0OaRGV1D0V1DxWHhr+MJmG3GseX0tv0PXo9J98zTGDaDvkScX6Jx
         Ji78w86GgNbNJEMLBTAU4EZjeS/8UmBv/ikk0hb7JfgWAKsd89yNC2nSxeGBQfdnDjC3
         7C6qkKYeSVo20phW+t9k9t2mcV+s9WO8kBLVpqG6xjAq7eGGo7HHo6FJBPNv/hBzyl2c
         T5Pxxk/ZRG4H1GitBWvfIzAZ6ACxUOyElEDtCBJKM9yqKOczeN2oemniFo+9rhlBTJZ0
         +3/w==
X-Forwarded-Encrypted: i=1; AL+hErEQkO5VpgaeLFXU3s39uGS+ZuCUc2Db4DJ5/C/weOsHPko8SrS8BSZQsdpAPRu3/AjHquX9isBLVaE5qRk=@vger.kernel.org
X-Gm-Message-State: APuU4Z92kzNsUiKw/3PF+PIQ70EGj5sq3YUXSSzFBcCfwqHpMk3K3TaU
	9eTEX1WGUj9PWloG9BQK4ZgIwFnlsgH/b6UWtdvXityHoPr83ZOVsmxh
X-Gm-Gg: AYBFou1QNpiKNXNRuluRdJo8XuS+giLMzpiMyGUZ9Pq1R1DlaRYtuatxwhxDFvFIxkq
	qM4qDsgYoh6BV2/AOqOBD4JM7nct0PBwEmR2xEKBCdjgej/V4dSWumryzqpL6cT0CQPvvsIRQv8
	A9AA3g0dlDQHyzr4RNwpgHSJVzzhWAOW2igxRpC0pioylTxIfdKviWDuUZMrKccsXstPVyxaxA1
	BAvoS+eSvlwfGQ4qI2iRG8VYMW91G7EAIEm84NAKdnmLaOwRxMkSUK+v61rLyd3tUzKQhdFrGwl
	wScefm4MZCO9V7+6MofpXaOmB4qSm+76Eig9+vx7UpZsymYzyVCOrDMLCyRHXgAEIIB8QHGp9Ys
	RqNr7bOJoREk7GNmyhpuCEcSPvzR50cj5jul0wX45lwntWJtHqNeNe/MW+5MHgGUcCT+6RytxXK
	rnAFV+kdyOKyAplcf7xWSkCnkgknqALLUn0J8vFZJS7I6t0zzMJrbCy/NAUHFkFsmTRz9hLPPyT
	Y/+scYGLVycQZKQEwUaoU+P7NtKM9dFG44Ak8JdwY75CofblnoltLeJloWio0otychKGzfEyQfN
	7qEkbmQndWE4nRYIcO40t34I8qbFzm7wBXPutoTmO8aNrsuIWkkaBXM=
X-Received: by 2002:a05:600c:474f:b0:4a2:47:b79c with SMTP id 5b1f17b1804b1-4ba093abb32mr52472865e9.32.1794413038127;
        Wed, 11 Nov 2026 08:03:58 -0800 (PST)
Received: from fedora ([2.35.201.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08de826asm49553615e9.0.2026.11.11.08.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:03:56 -0800 (PST)
From: Francesco Nigro <nigro.fra@gmail.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Mike Galbraith <efault@gmx.de>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Huang Rui <ray.huang@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [REPORT] sched: ITMT + DELAY_DEQUEUE: woken task waits ~1 ms behind another task on the preferred CPU while allowed CPUs are idle
Date: Wed, 11 Nov 2026 17:03:33 +0100
Message-ID: <20261111160333.2206028-1-nigro.fra@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <99366157-08b9-411f-b180-fa61bc5f5002@amd.com>
References: <20261103154603.1893325-1-nigro.fra@gmail.com> <5af4860d-096a-4e9d-a3b3-0b8277924146@amd.com> <20261105081245.81773-1-nigro.fra@gmail.com> <99366157-08b9-411f-b180-fa61bc5f5002@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 2026-11-05 at 14:04 +0530, K Prateek Nayak wrote:
> I'm having a hard time understanding why asym_active_balance() would
> trigger before worker 482 blocks

Sorry, that is my trimming: the "blocks" row is 482's context switch.
The raw events (perf script on the same recording):

    .654331 [6] 482          sched_stat_runtime  runtime=792910 [ns]
    .654334 [6] 482          sched_waking        comm=migration/7
    .654337 [6] 482          sched_switch        482 S ==> swapper/6
    .654338 [7] 481          sched_switch        481 R ==> migration/7
    .654341 [7] migration/7  sched_migrate_task  481 orig_cpu=7 dest_cpu=6
    .654345 [6] swapper/6    sched_switch        swapper/6 R ==> 481

Thanks,
Franz
