Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC531A6803
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 06:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791095703; cv=none; b=YDXY/6o3F/y43Z3sZaUEZ0a1Mnw0huwzxmi/frNvUdn1eoXuAMQ4zU5QcRTIi9i8LBmP4xd1deniFjKTGjS3e4zbc3DI2kzk83lZuNxVH8yWGhB4GtGF9I4IwVluO7CxlI5p86LrAZTWcjeYA/Eqog3mnT1xWcCDwpZhCjwXms8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791095703; c=relaxed/simple;
	bh=BfWks0jGGjKyD9Pd/O6cchSXWVGgKzrA1jydKjNmTTA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tqCsJm8Mz9au9JqRR5LhRvcElehNVGi8CsTHhFVIWSilm5VdR9tgd9QFU9eoq9b+cdqkd9sqpJSPoLGDRBRn5LXmYMjO2UmesMyzaluq4odCxQQBURqpr4d2zq9kP6dh576Qk8TC/f0e3ByuHxT2+TnSklWK+AuPcjA+Jw5ntIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDkMkAmz; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDkMkAmz"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a2adb9bc3cso280259a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 23:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791095702; x=1791700502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WbnHNbDys2WuStNEMWb1PaflkNK/JWz914uaZlrZP+o=;
        b=HDkMkAmzL/DRSdFPBJHY62XikNbJfc8zYGoBEPzW3cjzC0ZhXs9O+VUgIqJa/v4hBf
         XwM9k4MUdOtyrOFFZKfHBScS+NkNLbtiRU+QXPnZrBPmp3Krtrdk9UMCg/zyCakw7e26
         rkviwcMa4hQ5CPSS029psGahEnUgQlDA0O90nKkThIggzDty/JR4u8NEqVlcRBuQd2Nh
         1Lge8J3/rPOdb36JpEDSe4hHZSRwmhhDPV0U4rspic0LPhyyDdck6O7Yfc1zYNxVD8C8
         4y41N8tHLy3mza3ZW16Vuy5wy17cRlP6XTkoFjPuAyw4kb+zGi1HbctUyCoE57phMtVh
         ScYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791095702; x=1791700502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WbnHNbDys2WuStNEMWb1PaflkNK/JWz914uaZlrZP+o=;
        b=PU5n0P8mmh2nv22XvGp0H9eZOrnEXJHUFcuDkI/n+HNk3jlBxWvvSp/Y5aSBMtZvR5
         UB0402xvAhP7KRN1pxJ0mq245ocKiW2iw3w7AWL0LQGoMJGdkotnV07h9wLo6PX6curK
         UZAfmUfchDEGC4ztFEKD5VVKwFL13u0Cc+5G6ZwnDTNt30B8VI8gO2m4k2S8PUvPDRrH
         zOoyDAGD0l3aM1iFYE5g8GvPxT9kGeVDLFX/sk/pmQIP/U1iUfKlICEs+r023jQSE8ax
         kG2RsvenVmMqBn3iiOPJeAn5YNf6gpHstUr7Avo/gT2IAHUdtBGK7z5oLEM/pid4RVTC
         GqYA==
X-Forwarded-Encrypted: i=1; AKwUvBzF/tMFshC+0Vde9+FlO1cM68W7b4IJCTXJHRR/dnpD855sYCy9h2jbGbQcDKJ30EIHIE1gqfcYtvTjIjU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/jRe7Ii0XSfuKQOYhz9DHqFmVPRxDeD8ewgKHS6A/nD06WhbV
	+F8bjdY9vby+eQWElFtal7O0y8SDug2QY0aVbJ9ZZ903XP62CZrfGV7B
X-Gm-Gg: AYBFou1xJ55PfHko4TWENm/bXdB7De84E+FituYi0hnV1vcdgmMNtjDctxTYctgvAkd
	tGpXp6yZOzLJoqS7KF+FNv5ZzZobM9GuJY4CDT710voF9bsYECiy18Pd8vzICuP7ZonIsTWOwkd
	RLOdG4WqlRIrl+taPYnEI1KD1qHk8Ca71c3PyZaKBLjCMouGYPhJL1qAAPe5JVrPZ5J2K/oCvDj
	42d1b6QMVAPpAv1hVvfyxQYf0dIqGkfQSWsyrZxEItMa2TM6U94d/5tPqM/RmWckc5REi5TGMAH
	NQwSKfhTjLHrqsynR4fyc+ZJtKlPjp36faHbwwUxwhuFWVevBPS0acOYZ3XNL79nJsN3bRMsmTH
	8v1XLz8blyz+xuPWQ3zneE8UbxxxBEGdI6HQaZsvDhdWbjYp4Mqu4andwWQvEFOBSXU+MOlDx9Y
	0OHM9QUcrdFSbV/zz702HtvhErTge9k1jlA2PdPvIzHUy6qnheURkhdvyJtgZUvxp6kgvn
X-Received: by 2002:a17:90b:37cf:b0:3a7:a9bc:729d with SMTP id 98e67ed59e1d1-3a7a9bc9629mr911026a91.0.1791095701612;
        Sat, 03 Oct 2026 23:35:01 -0700 (PDT)
Received: from 027.. ([223.215.74.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d65d85csm5504430a91.4.2026.10.03.23.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:35:00 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: baohua@kernel.org
Cc: akpm@linux-foundation.org,
	dev.jain@arm.com,
	jiangwen6@xiaomi.com,
	jiangwenxiaomi@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	urezki@gmail.com
Subject: Re: [PATCH] mm/vmalloc: bail out early on invalid page_shift in __vmap_pages_range_noflush()
Date: Sun,  4 Oct 2026 14:34:39 +0800
Message-Id: <20261004063439.95516-1-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAGsJ_4xWAd=VHPdGhS2AHKag2WhFA=_3MSOPuyt3ksKH9ezQ7g@mail.gmail.com>
References: <CAGsJ_4xWAd=VHPdGhS2AHKag2WhFA=_3MSOPuyt3ksKH9ezQ7g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> I have checked this carefully and confirmed that this is a correct cleanup.
>
> However, when I applied your patch, I noticed that the author and
> Signed-off-by do not match.
>
> Author: Wen Jiang <jiangwenxiaomi@gmail.com>
> Date:   Sat Oct 3 17:04:30 2026 +0800
>
>     mm/vmalloc: bail out early on invalid page_shift in
> __vmap_pages_range_noflush()
>     ...
>     Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
>

Hi Barry,

I'll send a v2 separately with jiangwen6@xiaomi.com
for both the author and Signed-off-by.

Thanks,
Wen
