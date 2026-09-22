Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14805218B4
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790114166; cv=none; b=f3IHN6Nl0BnRKlJn2p7FJGApBBNqYaQShkuCvPoWhBSe+ccthJL4yxHogK5rAaitJKkad3D8Z0WJHBUo6K52qHZcoTham9/XxuS3yMsMdoQLf25nG8pXIylJWUbZ2/eiLOs/46o7+yQHIQh8iGfeRAWQ0qCj4uhLR06pDnFCosI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790114166; c=relaxed/simple;
	bh=/zbhuXWE1WlTQdG3ZgKrd6QNK2ykNmsb80+FJXV8oak=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YwhfnmbDAX4isHPV7P+iWATNMGLtlHEdruDASV7myH4CwDRE7ii1Y7JHvobB317XlRBbT6+gcncGf+jGDKwBXbF+za58/nfjs7tB3s0qCz1ryjkOWs66BXLF8Lh1nDHn2Gpj7rZH4ke0mmkJo8TfYxIIPeQaAiZnAcEEWS+qO4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QVXE6NpH; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QVXE6NpH"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485b1d2874aso291276f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790114159; x=1790718959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/zbhuXWE1WlTQdG3ZgKrd6QNK2ykNmsb80+FJXV8oak=;
        b=QVXE6NpHVHu85g79U5z1Sb8a9IIPJ+t8+LFNQn74fcA5yjmSDap19VXtzpze6BSuRJ
         TR5aUUn89AxLueiUNa99kR+wmQ7vttvJBuA+dvLlwn/erWkWfb44K9VFy1xTQtdybcjG
         3HE7jgAgdGv+KYygybDbTfI6eNSl+fL5Kwj3bAG/P9u+nO+ssQtQdH2JhpdHgeuH3fnF
         B5DsAlf5l2X0mGNtTEA431lYuciTEOJ3j5I4NsNEaxemWdA2iPXS9NjB1PEDLmmLBnGN
         uHQeAFWxt8rvoAKvZOjr5WnY8loEfFOUKEskGPNKU4lwYFx4GarIZp32Zqb1kLY5P+mV
         wraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790114159; x=1790718959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/zbhuXWE1WlTQdG3ZgKrd6QNK2ykNmsb80+FJXV8oak=;
        b=kLahNun2kiCun79rCxJ/QqrFArntaCo95EQHJPPv7XiC/h0+Q7iN1ZP8aAUAzs+SR7
         Efc7NWRpBzYOXGsJIu4u7U0I5EnEtrN3ez7wbDz52sISSmGzyQk1IRghz8zUzLcCxrXp
         O1bT03Ui1DwLj1ArPtVk/nGN/L0gJVvH1x7VItnlp82ou9CP//MDnbkdCdr00eXYQRNd
         dq71hHB6nTi7vrNBJ94agBMPEtkYXEIUHpyc8knf2bkOPjXVuGA3p808gjP7/X+P1cCz
         9Sx8qSGw6Tlw9tG/KDDv8UXNtT9S8zgmYHLd2WzaKCweZ3UEgHei9LQPncFNUdbjW77N
         dEiw==
X-Forwarded-Encrypted: i=1; AKwUvBxu6XUKyHK6Xs1TvQ9Gn8Jx3Q7ojwiFlhQMd/VuSH6egwdv8sI+nehWQdnodj8njVA1UMO677UuxafSTeY=@vger.kernel.org
X-Gm-Message-State: AFuF++nMzOfGI8xkUc2qkEeVqWf4CIOtJFN+wuCR0xuG3D2nBTCMN1kF
	6n253MgI6irhQk0Z01ck8RCo0q1+4+GJ7XngdAMNdVVt/HrNvnw4rEea
X-Gm-Gg: AYBFou2HJT9H+AsidvucB8DY6m3ZZ/1skXCKxp64RSqztHIkjFawWo4ziitmBRSTJYD
	xEJVLfRrieuOioxImpc9GLwvNK85jVQClkk21tqlGLhCnUd3pNPcQ4tvKd6Ncbqq22uQobjt9b5
	TT4+Vp+ku8iIreTI0v4XVPDVXIFKPI8UrzOL6Z989lIWSppjjgbgxW2AdoeW7p45oZWcdJaxuei
	bIU6qBlxQIQzg09Bmyk8iX5GC9sqsAVUcrcs0d5t7UZJ4n0ZlEPMMpknbfN+hVhahSysZ9SHm3C
	Y9ymnlTDqrlPGuXNfFtlSs5EZAQjMNC9zZKl+gGRCGWi6DWR3wY9PShm3TW2XMOJIxu9ZVDoZpU
	AFf1Si+NTocV0bWIhTqp1DtSw4iEUKg3XA2wGRl9pFj8/9LHL9NJbTg2uYYNAhC2866FtPCIT4B
	Rwu7wX9GCNufVpzh5IDS52lQz3NENu7w+JeDpV9dbnQQKN+b4N6DswBTuabiHT75CojWdF6wKIt
	9s0ZWKH9qyYwF8p+NvC7r/57BWbuY2vmRwnjnZq
X-Received: by 2002:a05:6000:2dc9:b0:487:27f9:832 with SMTP id ffacd0b85a97d-48867095903mr1279068f8f.39.1790114159022;
        Tue, 22 Sep 2026 14:55:59 -0700 (PDT)
Received: from christian-ThinkPad-T470.. ([2a03:4460:170d:5700:7168:5af1:a975:cf85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488682668e7sm1789647f8f.4.2026.09.22.14.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 14:55:58 -0700 (PDT)
From: Christian Melendez <chrismelnu@gmail.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: perf stat: worth documenting task-clock/cpu-clock in perf-stat.txt?
Date: Tue, 22 Sep 2026 23:55:48 +0200
Message-Id: <20260922215548.398541-1-chrismelnu@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Arnaldo,

I'm learning performance engineering and ran into this while playing
around with perf stat. perf-stat.txt's TIMINGS section explains "time
elapsed" and "user"/"sys", but I couldn't find task-clock itself
documented anywhere, even though it appears in the first command
example, as the very first metric shown.

This apparently came up unanswered on this list before, in 2013 and
2015 (2015: https://www.spinics.net/lists/linux-perf-users/msg02405.html),
where users asked about cpu-clock too, without anything ever being
added to the docs. Would it be worth documenting task-clock/cpu-clock
there? Happy to send a patch if so.

Best regards,
Christian
