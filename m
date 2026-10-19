Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE36E485925
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792394194; cv=none; b=GGMSU7YxFTNMD4ixU36Z2+75Go4yqUf/0CV9A9pvnFH8ivPcLj4Tr7UbPxl7gRZZbJyvLTqrKp+3slF9zju89MEgsJl8WeBEuGARxGUJUVX8QbtbSNaR8DxRes0ngL6woZ+wAG1Dz8//ThMBJF8qeZN3RXRKbfCTiNRm3s3QKcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792394194; c=relaxed/simple;
	bh=Ib/0Jiq2CTtAN56Lsm/P1GvxUcXEmvLrLBBKb9p6EyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D5KcyOzi7xwh14J8kGnyfFtxAvKvwJ+wAhXteNykgnxU4UZ0r/3YoTgxBaSoQ/bcD4p1omYEHT81F1fLvZM77JY5Qv08Ik4SJ/tinv+hsYYxK3yWlJlPEqbbpBqPRKKFyFluuIxtjtkZ9KNJubg/KO1pShE4SeWLhYspvzZm9wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5gTX9VD; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5gTX9VD"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so1005405f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792394191; x=1792998991; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K8UC1h33uTXAmEsOd21N1W9UrPJgvJpD5tf5yIkoy5E=;
        b=j5gTX9VDiFbsvh+w/lsD3j/obhi+wuRwRWXeiS0+8q53GUkMgbNERswou1sToAlLHu
         wQQCkiHj1AsYPFJyLnOoLZVL1AlG+S9dJzcw5hG+n2OypqOdNBKzTkWzsMv0dZmpAseE
         hA5o2wintxEjkyl2EfKX0EumKBvHEJksTEepSPvZjzyDrAMfh1lQkAUQsFk/Y8uj3bhn
         eWkMhE2hNxaxTgZRUcvsFc7RwMekOR7CD4jaBthKJOdJE9e8CbvbRe/01swOfMyq4XQv
         KK0yV1XlxVEsEjTlLUUC2YiFxmpt5CU8ert+mamkT5okLEujYzFSTmlb0YOrKpmTz7bb
         istQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792394191; x=1792998991;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K8UC1h33uTXAmEsOd21N1W9UrPJgvJpD5tf5yIkoy5E=;
        b=WR0G9KFXAVl9hS0Uz+cyDd0lMxj80evt976iuz/N36BW3iphaEuLKkR9v3y5UQO0pP
         r1sgiIycACppvwGj5ZuwaLtkcFhqLzqrs80binCf5g64nDr0sYSGAZ4mj3DF66f60mSQ
         2Ng67T7aYMBlCyiSJxzIf4MUJo/johk+7h13nZRnmvUmlGcW2TnyLFc2nA2yddoNHve6
         4RLM56jiRoQ1z0L9TcrI0/10QPsjcVU+SH2bv+3ArL/YZFnwVHaL7e7Blx2duH45bH6e
         Xy44dEDD2GpmakZgIqS8X9UpTEA1kj9IUL8Wlnc9eQpBrEwY+75FBCuRXFjaBmjJIowf
         IJCw==
X-Forwarded-Encrypted: i=1; AKwUvBzOdP19e7CEk1CBBKL++vXTI6jwWtry9+wU5IQ+9OV4Gb/A+Ik0H/oChe/RiNaK/pWb9v9sNnZ2CGa57/8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKliwMIQxBfdNeNQuSRxvuxtEigExPvsDM5RVzD9cJIEveD7ob
	msDrA6yB6RuLL1iK3zWyFXCcLXCVd/HehbpzTOjX2P84tH4rUtp3HWKX
X-Gm-Gg: AYBFou1WoYs7FLzrEsDL+PaiUq3JqIx+TqecRQt7J1yv9M6uMpN/8TmUSIOJITrVZBO
	jT/CJNN930US5cGxSV9WSWw2bOJsJrYbJ1uHqNjkpbfd8wauD/l2a4wSvTP6y2mUb2Ud91w5i7W
	aIBGToObl7Mvmg93I30h4GgW5e9R9hxAI1t69JqE5ZkbMIUGGyNENW6fPJqhk/X0lcRuMLrzwgT
	UJIrFJIGwAUAt7pfoxhDBX2sFFJIuKrxhB0cB25wluiyWAVPaPpUQ3m2769Os6xJ1JXjdaknptq
	oa1B/xurBVqLW9UMaVObhZZJV8ok5Q927IEZki+tLKVV8i0hgzlvhgbA5YYjK7dLRgontvE8gEY
	ewbCVcwJ1fpdun1wlEN93QdVebRb8L3vDu77hPmiX9Dhvnyudid4r6O5moVOzHzsaE2IiuSDBwi
	BBdI7yoDKqmpVNNir+yxax3Tc1XAraSb2Gev8Kw5B2CbzqhVcPnSIvmyUvdVe/R+vwfCQ=
X-Received: by 2002:a05:600c:4e8a:b0:49f:cbf3:551c with SMTP id 5b1f17b1804b1-4a1d75f8399mr148752645e9.12.1792394190220;
        Mon, 19 Oct 2026 00:16:30 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd91c55bsm303395445e9.0.2026.10.19.00.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 00:16:29 -0700 (PDT)
Date: Mon, 19 Oct 2026 10:16:26 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ashmit Kumar <work.ashmitkumar@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] staging: rtl8723bs: clean up SIZE_PTR usage and
 remove custom macro
Message-ID: <atXDyq4nVUb3ODKu@stanley.mountain>
References: <20261018164403.14921-1-work.ashmitkumar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018164403.14921-1-work.ashmitkumar@gmail.com>

On Sun, Oct 18, 2026 at 04:43:59PM +0000, Ashmit Kumar wrote:
> This patch series cleans up the custom macro SIZE_PTR (__kernel_size_t)
> across the rtl8723bs driver as part of addressing the TODO item to
> "convert any remaining unusual variable types".
> 
> Instead of a mechanical substitution, each occurrence has been converted
> to its idiomatic kernel equivalent:
> 1. Replace open-coded pointer alignments with the standard PTR_ALIGN()
>    macro, removing an unused variable left behind.
> 2. Remove redundant pointer-to-integer casts where pointer arithmetic or
>    pointer arguments are already sufficient.
> 3. Replace the remaining pointer-to-integer address casts with uintptr_t,
>    use size_t for alignment offsets, and delete the custom SIZE_PTR macro
>    definition entirely.
> 
> Ashmit Kumar (3):
>   staging: rtl8723bs: use PTR_ALIGN() for pointer alignment
>   staging: rtl8723bs: remove unnecessary pointer-to-integer casts
>   staging: rtl8723bs: replace SIZE_PTR with uintptr_t and remove
>     definition

This driver has been deleted in linux-next.

regards,
dan carpenter

