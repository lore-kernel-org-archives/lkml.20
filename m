Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51DB4E9C22
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 15:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791473640; cv=none; b=kYFltiuileNQebcutAiAtySV8AsqZwBssOYe9i00zXumtMwUKeHeAxKRD+s+dlGCZZPgKxAiLPfSxIhyYhkyPmOSX/40vzOF7Pmf4rPDaN8z8+J5bmfwPetKIIhxzAHgBBe/6c7oVVOuG8jnY5R5K9QXQw0c8nApu0EE+Is/oJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791473640; c=relaxed/simple;
	bh=/aWHGsXWOjDr9T7FZt3/VndzoTje/aUy3zDtYXkkPHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tkEjRPs2gNegVkFfTCUJcWIzVTwP0PKJ7XDGSREwpKn5NJ1kmP4dIf/V6zVik5QflETLPvMx3mgb/QRQKHYyq0CZ+LALGZfUpr7JIPXZOemGxO6VvJp0hhvLoTdZdbKJPrY2uimEqPOrwxTNOGmwSGdi8w/Qgbs0GR7usCqi/o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fZZg5GBx; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZZg5GBx"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48b06f58380so128903f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791473632; x=1792078432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/aWHGsXWOjDr9T7FZt3/VndzoTje/aUy3zDtYXkkPHY=;
        b=fZZg5GBxkEh9RhrENGsqe8fCqGwDAyaRrmvTIeLY7JjJn5SVQhn9Gjtkbip+yER+ZG
         aifG/ecCH8kFXt+EosuFw4ngl8aPk2GQN/8jHNt/ZqgDNBhW4460sJ44rQeVMgOo7Hjb
         gXy4O5+rDR4ROw911/P0RPngqWk73eh+uXeJm3amIAXVaBWOWSxDVd6oSi1Gztq7JxjJ
         ghOeox8GYA7hnvMv1gbl7XNu80RihoYYIYckDbxjYsU1Wr/oPu5vn2FJxxsvH7IBZe6R
         ZiZg7z7+D6ebMYPDpL1tKnmk27ybvO34t5rk/Rhz2XGb8cng5CrR/62jseyvfx7R/Uzg
         9NlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791473632; x=1792078432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/aWHGsXWOjDr9T7FZt3/VndzoTje/aUy3zDtYXkkPHY=;
        b=LPztc4YOssrt/JGQAqWn70WU0wCnF54w5Oy6gPhxaBXvESx8bbrMbEisgp4R+5yq6r
         96+lyfsQnJW06ctYCW1Hyq2ROfEsdimq0tAapoieOVxVyPxUrM85DR6qa1n7mDusFMGd
         kYBL9whGJb0CQFRjIed0SfD7ecxUlfUP2u708Xfnzu9Xpb5ywreEy07yxYhDA4gh7rdq
         quaoIspFMVM6mHG2TqxssEcKcnpWAka3O1yNxrzjqrGJVrcMjHK9VlD5/ZyRJjW69wWe
         O1cAX/oJF2PXzNkKIJ2lWJ1I+a4B85sv18cqrP4HGo4WIpmJi8YXK6pV5m3Pffw1W8sp
         dJCQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6o2/+h0qmC3wCNj+x0NUva/HRBW43tQz32lEuCOFeayqrHgZSEWhw7g6AmGvqJp/iygc77eFQDFhgNfM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8BlWrCLAP3hSJ+/zgFIf7Zo0jfi2yOC41v++GVEPGTf7ufjnI
	rMvtipV0qT1FUqbCdMT4pxqOPlHe7c2XbJd0/AoS4MN+9pGZnrhLC4Gn
X-Gm-Gg: AYBFou2nHPKeJXU3TuX6K/UEzWJG4B6BcL/JKZGMXh2udfx2mQDhGBaNgD5YOOiWVsW
	EFVE4An79sAPfFPDf+4uboFH2PN2MwWlEvJVbBDqAdVii7uwCwTKWOfA7jVnrGxaqRAXT56i1zM
	56iocyE6bH5q6PEHE1xv+Nq8piwxKYp5hqFQE9wZGh2fjMMnsV10ankZCX+291Feeodh3HMgDjY
	KalFGCGC4u32vXVUErhYjVeXM//AjEGMJncpF/IvH90WCtHB7d5dwMwoxQcWO0HSJJpeZEbsQjh
	yHRRauYM/xTqA/RbVEjx7njZSE6GaIcotfnr5LZuFUMUJtoWfIYwC8aJhuqg4aV1BGuqvp7KzXw
	wjstM1KsGRtYmVWEJkVCMnh5mjW4FJgsIBAoBKpSEel7dx1stNyzF3WVbG2njxMhew6omLt1UMi
	rzFKj/eJ5B+oAVU02AtnM1/fMDmVllpj83ykccKRWa39VCcQS5rMRuG5Jf8FzsEglPpuOcpY2Z8
	iQ7oRAKmVxUMbB+8rXX
X-Received: by 2002:a05:6000:2002:b0:48c:6611:82 with SMTP id ffacd0b85a97d-48c7e21f07cmr5719374f8f.1.1791473631640;
        Thu, 08 Oct 2026 08:33:51 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db63ce348sm201969f8f.3.2026.10.08.08.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 08:33:51 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: jemmywong512@gmail.com
Cc: sh_def@163.com,
	jstultz@google.com,
	bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	tim.c.chen@linux.intel.com,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH 0/3] sched: Fix proxy-exec use of curr and donor
Date: Thu,  8 Oct 2026 18:33:48 +0300
Message-ID: <20261008153348.92684-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261008132604.98242-1-jemmywong512@gmail.com>
References: <20261008132604.98242-1-jemmywong512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> After the split between scheduling and execution context, update_se()
> charges the open run interval to rq->curr. The tick and the runtime
> sample still treated the donor as the task on CPU. Under proxy
> execution the donor is blocked on a kernel mutex and the lock holder
> is the task that runs.

Please look at here: https://lore.kernel.org/lkml/20260913064722.1534766-1-sh_def@163.com/

I think y'all are trying to fix the same thing, no? (Or atleast similar in most ways.)

Adding Hui and John to CC.

Thanks,
Kayra
