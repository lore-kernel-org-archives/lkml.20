Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94FF2EB5A6
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 02:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791599775; cv=none; b=ByTWLHviQxaLm2olTrdDJTckVIub+cjjCis0oV1+qUskQvxsW1LqOjZA+gM4JcHKTOC/8NWfUHGVJUwXJe84k0eiiBBkjwzPD+ZpFNFzr++6lrF14d55ezrpRDPs1NzD+ejO1XZg5WhyqLLD5UUfVry8tz4iKVm+717NCz7nooM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791599775; c=relaxed/simple;
	bh=A51dYTmNQlNEG+5tR9Chhzl/dZtyn2HsRPAvD5n3sSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qc3DomsZJv5cJTAJdwIpjnlZkKgrmoOTg0dVJpqcB0q1P1zXBkEU2UqzK7xQ2XYjCkn5vanqSNd86Xw82UrFZhfBye4XVsLz0hnJDfhu8GYJiklnFYXQux4A4/mpxEHzfKyvCbF2dulz5XhfGLlccWJ1OtSr2rYqCGRBAtwh3e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LCRSJULr; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LCRSJULr"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35829219da8so225523eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 19:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791599774; x=1792204574; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A51dYTmNQlNEG+5tR9Chhzl/dZtyn2HsRPAvD5n3sSg=;
        b=LCRSJULrMi9wu6/NT7fiv2IMPYVbCGeuE5U2OvmkzshOBnpRQNCiauOWtqSAiEZjwD
         oQpaz9vqueZJlis7t1gLFQMQhDG8znaNQqSzSbmM5snU1sgYQIHbchPvxDDFOUPKdw5t
         kv14e4Q+OYBTjzcbF6vXGUnkhsEU3lJR6kXarQPR1Os/tNwoTM3EqzZ0iXOJ+UrXpqLS
         hEPOEuVCPONeh0Quli1zjSchhL3Z0suma9+zdXT97/zwEY7jKDKmNwhR64fttrRZEUQ8
         u62/5ckNC2z47UrHaa2rWHQqoZwGW4B453rIvZHChya/0ycSzCEIRqV3K3YKNCs696kZ
         e5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791599774; x=1792204574;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A51dYTmNQlNEG+5tR9Chhzl/dZtyn2HsRPAvD5n3sSg=;
        b=ho+Ww/xD5ACTmZhzqPeGP5dS2nsZRWj6UNTr0nMrC28EGKbo1DYCyeV0YNglZYhGHw
         J2qRBmCLLvVILSHDfBLSS1d6W5G2DTysHsLh4Hd4CEofpjE4xxPoW72FrXc0I2Q2p2nm
         cAtTWnwgXR7oid1kPOxcYJaTsTrlGH1dqa1Vne8TN9nem7/psJEhzcbJ5/HYsS/Xl21s
         pT+7s6CRG/eSgU0XeXS00wfP/toImFqUjsY19D9J38UEEWz481PeE0c+qc/a7zjans85
         LhrWxviBSqP9BIlOQQdZIKNpLBGLVCN0ZPXplU2S7BSne5x5gcOLzPyfHpZOsQS5nAo/
         EJGw==
X-Forwarded-Encrypted: i=1; AKwUvBxfge2JJgH858W6TsOXLIpPF4a8NPXNs9bvHxjEkTc6zrfIEKzr4/YGLA3a8CB525tCdi+dqnPTXTw3acA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpKBLf5dMP4g93i1PaMdydTFvTQ6qVE7KfzDXlpb9fFDnC7AIk
	xisgmY3HW4x2v7YbdU7kMzliWBjEUG9f3XWNVMrZhzVHi/zeDtYpiIz7
X-Gm-Gg: AYBFou3JjizyISexdQ5BBQVQfdtq8QK2ObaMIUCGhMY3CvLMt2yrM1Y82eZEUCXMHpu
	w6BD+I3vybaylzmQrz8Nv1mZRpLaE56AdpFxJgCo+JgB5apd0tnax+3iBIDsK8+t7cm9A42i23x
	ACh1051P3wlgyonUBD2bAJoYqxDkygOVkhyi1U+UbbXa1zMfde/poIgn8xEI65wAVp7DSbFrti7
	DNZf/lPTUcfqK6rlPbaByNoC6CvLLDMjiN88H1Y1Be/d1YeEUqXmGEGi8fRmCs87eCpqiyvlqju
	3gZi58S62BSerwotZ/uc2BvgZ1rdq6mmSrakhYU3g64ZaKWWVVV/9uDbf7uR/2l9sk1uYmNbGeq
	JLtJoWwzgclJG6aGuoP2rLA8RAjAYxAb0PQuctWO7rG3c10tWEsMHW7TeYFUkbmggH2m68yJVd5
	RCn201aue87l5uqLbYIMzVggUrPDjFuesLEPwtk+kaURbnUe7fzsduBdAsyYZmUw==
X-Received: by 2002:a05:701b:240e:b0:166:f097:6f10 with SMTP id a92af1059eb24-16a1206facdmr4452008c88.11.1791599773725;
        Fri, 09 Oct 2026 19:36:13 -0700 (PDT)
Received: from ubuntu.. ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442956asm12850045c88.16.2026.10.09.19.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 19:36:13 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
To: Ming Lei <ming.lei@redhat.com>,
	Jens Axboe <axboe@kernel.dk>,
	Nilay Shroff <nilay@linux.ibm.com>,
	Hannes Reinecke <hare@suse.de>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] block: don't quiesce the queue when setting the default elevator
Date: Sat, 10 Oct 2026 10:36:07 +0800
Message-ID: <20261010023608.3667184-1-odys.yuan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001-bug-block-elevator-init-quiesce-v1-1-5c85fa0ec59b@gmail.com>
References: <20261001-bug-block-elevator-init-quiesce-v1-1-5c85fa0ec59b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ming, Jens,

Gentle ping. Since 1e44bedbc921 ("block: unifying elevator change"),
setting the default elevator quiesces the queue again, which
245a489e81e1 had avoided, so every disk added with a default elevator
waits for an RCU grace period. START_DEV of a single-queue ublk device
takes 7.74ms at p50 instead of 0.68ms.

Ming, as the author of 1e44bedbc921, could you take a look when you
have a moment?

Thanks,
Qiliang
