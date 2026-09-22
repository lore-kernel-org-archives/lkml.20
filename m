Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0BA3ACF0F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790050537; cv=none; b=oIJNkim1ZPw0piTJ8hm8j1tzvWeQcnCqaPAwL1qO9zzSjxZ4opjS6+eNLhH5LNuXtoewoTKymXt8Q8xifH9pHh4Mq2jSlEazjm8a/o5Z57rkxsWOoec/jgf0nrCqZMcZMyJYYZ0I56iMWW0OGMsjw5L7CdmchBScQrj0NHvwrD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790050537; c=relaxed/simple;
	bh=mDiU/nGiQl0VVpBnpfjokM30Hr4tqKKnNtBCuD8rYuM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JQn0E4BsLCmrPPJKvc/cJSyYb8vBLmpjFQwlT+MNSpTUfJj3vyUr/IJYove1mq5WlgRXjaGF5pxRH2wkJJ7MXmandt/mpAgMVhNYbW6nEKHmncRTB9bIrVEFxpCuzEp/b6zsBCq0XizriDTT/VdyNXSyNoUjfiYfzqL/nHjjZZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VD70fM2p; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VD70fM2p"
Received: by mail-pj2-f41.google.com with SMTP id d9443c01a7336-2d91a931f66so25865525ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790050530; x=1790655330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eqDv7pHlkC+KFYmyHHCyZJU3taMvXTuZA5VzDL+HOrw=;
        b=VD70fM2p7wYKpLXIKEpQwWw8X6ZBU8Q+47+MQwJMKt5r1sd9U6GcJVEYoFNWQCUFaS
         htrTAAUgp/fEPPK2TcVX5YUe66vfBdsmGlXydbXJB8s1zwff0bB01usWxS1mqmEtO0pG
         GtHYdpdA3CH/jQ/qYl7TaeVVlSuBoVg+karTy184HuTbRXRk5A2qw0I04LUARAHBqMUw
         u0bZgwJ9R1QUZ71cm9ej/Gju9o07Lfq4dtag83K9Z86NvDvy/EsS5YWd2pIJrSjXgHUn
         sKmK4qY5euZw+DsvKD3oPgPgeKVKgANXy9A5qJO90ynRhpTFVJyHiOpK+AIjkL9D3cuv
         9Z6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790050530; x=1790655330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eqDv7pHlkC+KFYmyHHCyZJU3taMvXTuZA5VzDL+HOrw=;
        b=uWwPwxqKFX8kL+7+1bRgHuEJft9fiTQwtgLqP80+efwI3K5MNQI3/X0xFJ54tKxevJ
         HRYQrf221UmrdgCA6HmbpQ674W58mQA2+U7lkyFJRbECycwxtO6JJMAYV0WWn+iA+Ff5
         3sufhAgSB7Ys1xrt3TtmMj0tRYTFY/iSg30GYdYBfed9oEBKMBFPo7knUWh0LG7ClkQ3
         9wxLJfDh8A2HiMPE+ptGImoIcXI7fJrhRKP3AyZnnyWC9QdTpWccJx6sRHgK2QNb07yG
         MbM1rPCkUbRVNCIkCGm+/fYV4rGhcDqHjVrtnFuxhvOHoShuIYNnHOliP+OqTr6pjBre
         5hdw==
X-Forwarded-Encrypted: i=1; AKwUvBxZI4DR7S9kPDuyxbUQbkafIlw6CW4di5OJdstPRwSPAtwejUwU7OYRHE+Twcazv6Mc4uwi3+aUxQH4pvU=@vger.kernel.org
X-Gm-Message-State: AFuF++nB4MDJsPKqKFpLL/JwLTqEnZ+uKi7W2cgSENrxBCyC4l5HkFk4
	JDL3nWxUA6gzrwP2OCTk1O8dz1n/CuuhEeCdbpy7+Qetq4tERJZ6yIVD
X-Gm-Gg: AYBFou3PhHz3QxfqDVCOslY5v3zkTijPbgqAhb/yY2/egFd3YvK/tc+fRVyIPcr+hhs
	505g9EkR8GSpOxSsO1jDMuEUEd18CiI6XQSI3KoxE1kPpFf/9NfG/SV0D7upKPg9/PJK8jZS06g
	lZe1uexgAv+XBcb304iiurKqHaY6OyZg1n5hfRZWuwo655i+7sUmz7jibaVfTEum6aLvoURurCq
	teboQlBnWI7HaoOYdcUAZjBqUGFzCdVZCMSDEeqc8IoDQ/5TJXtp32BYDwMwduK74ZxJzVH/gh2
	texX1j3+Hps1O8Es9rg+DPZmGmWvzeBaUzbL1Lzp6g+9FMbFQ2Z3uVBxqbyXXE3Cmmf55y4B+9W
	WCjQ/W/OKwrtZ3zqZysS8ZDJ8RGbpBSy8Fn11GoBSd9eFz0KgH8tAcALgG/OxAyN9BhlQv4z3Vw
	ky8hP/XKV5Yuss0KrPQ3HniDzvRVazD6T4nvD8Ks3CDA2XqmpU9iYg5ANgxgdj4dunnuYQkWsKN
	9WpTlBkQYfKVKS6
X-Received: by 2002:a17:90b:384d:b0:39e:6c6a:4b67 with SMTP id 98e67ed59e1d1-39e6c6a5448mr11353516a91.49.1790050529698;
        Mon, 21 Sep 2026 21:15:29 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06e26e6a2sm887240a91.2.2026.09.21.21.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 21:15:29 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
X-Google-Original-From: Bo Zhang <zhangbo56@xiaomi.com>
To: ljs@kernel.org
Cc: akpm@linux-foundation.org,
	vbabka@kernel.org,
	david@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	liam@infradead.org,
	rppt@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	kasong@tencent.com,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	zhaonanzhe@xiaomi.com,
	lipengfei28@xiaomi.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/4] mm: compaction: mTHP-friendly memory compaction
Date: Tue, 22 Sep 2026 12:15:22 +0800
Message-Id: <20260922041522.1824249-1-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aq1SrcniIRU-8f2W@gremlin>
References: <aq1SrcniIRU-8f2W@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Lorenzo,

Thanks for the note. Let me clarify the background of this series, both
regarding the AI-assistance question and regarding the scope of the change.

This work started as part of our exploration of 16KB mTHP for the Android
scenario. The overall direction of making compaction lighter-weight and
mTHP-aware came from offline discussions with David, who suggested this
lightweight-compaction angle for small mTHP orders. So the size and scope
of the series is not me diving in unguided as a newcomer: it follows his
directional guidance. Barry then provided reviews and change suggestions
throughout the iterations.

On the AI-assistance side:

- All the code was written by me, by hand. I understand each change and
  take full responsibility for the patches.

- The cover letter and some commit messages were polished with an LLM
  after I wrote the initial drafts (to smooth the English). The technical
  content, the design (jointly with Barry), and the analysis are mine.

Please let me know whether an Assisted-by: LLM tag is expected for the
cover / commit-message polishing; I'm happy to add it in v2 if that's the
convention.

Bo
