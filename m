Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A12139A7FD
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790221975; cv=none; b=QKlaanCyfRBZ5903SKGEn00TpuJ2jtbeBPwvFEsK+R1ZI7MoM/ZjvtbiFxgpbjrm+t3sXGYZyavSGrBqNRHC96Be8uZ57+xo1J0uRv9j9VJXO9e5gcjkGv4eGaqWD92JSu8t6lNz7oscXcHxadEJ9XJ7O+2dekw00RE9f6pvOug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790221975; c=relaxed/simple;
	bh=HMrOM7vzfWJDRkwcvRQsGWRYxRgpYk4wHHutCRIrF7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k8Mh7PLk2K0OwP3SsfXZLYiRIqQoPzwyy9L5Lr+4x8A75S6aij/YqsHUA/aAQUVDwEcmE2iJ+8+vnzmMObojOInGWvZTii0X6m5zhdYGOqJHaQguTIqCELR7uSPGQ8de55YwH3HnXpD4QP6BuCVXUQw5h8owtq2Jc1JxaIoblYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r6RTkER6; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r6RTkER6"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85a4329731cso921338b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790221974; x=1790826774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HMrOM7vzfWJDRkwcvRQsGWRYxRgpYk4wHHutCRIrF7U=;
        b=r6RTkER65DkdVDU+m71cGC9zKz73ZIaQmzXXBNYaSwqRWVqrUyxIIlNlyIihMNzgzX
         vyLK21nSegDRxG6IBtVEfyw2F8CkHH8QjUrFm4105D9SfE8iMV6+HP8H6u5rdAvcmgla
         D3zn6ekwcJGij2we/lm3e/lOFttEWX2SCFEMPo9GO3qIEKE30aqR4EUy1ULJeooAYBtG
         62aiTGrfpafRExZnFt+MGAZVlFhF/xLCvzQi0AthKxlcTcnXeFku2SyoGRZMeNcrY6kk
         Gykl9k62wQTPhnszJqTCRztbbyV/67zybzN3pXGYnCzIQg6F5CHlq/XD92Yrib6Y/pQm
         ffrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790221974; x=1790826774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HMrOM7vzfWJDRkwcvRQsGWRYxRgpYk4wHHutCRIrF7U=;
        b=ss9Qcyfi468j+UWPuFH44ZGRe9DMIMnAXM9VeVd11d8vPBYXiEQ3nFcI3Ru2uDtIpa
         XkJD+9DqP4N1wFZo2xcU+n51LjaqxZjiDPMKBlJ/WwC7Z8vZeHBte9Gi1CJJld6FueL7
         iaoZnDpUPPOtZJwQeqtXXz8zFLO+lECtp65fR4uDH7JNG4r+Uim3lzTnRcippPeSX0JZ
         AFss+X12lze5wbSIuyY/E+iwgMBx3N+KWfw6nNCfsHidyDi/xC/t6f9Jxr8EaxsT/FO0
         lCYseNTPXmJLY38woJuODo4fWKyzxwh0nZ+2AdIBoB/bQcriQznhsN/+48SAei5aPpVf
         1wcg==
X-Forwarded-Encrypted: i=1; AKwUvBwlS0xi6QT8ptgsU+VxxkQUTVeVuBPw2Bm3/5gq0lZpmSAyUV6jsUUj3wakSAiefbyr7ruoe7d5I98rLxc=@vger.kernel.org
X-Gm-Message-State: AFuF++mktyQIJTGPJK0SGsdRYCXANnWtbJxMfCglSn1FDN9MxKKUE3aA
	JZc5JffMgMAWvHKbdFvN5f7B6ZXP6KCs16+ncgn6dckR5AmjK/Oattv2rsT2oYfJ
X-Gm-Gg: AYBFou3hy4v2sBI8LzTT8MLU/pGmDreh2ig5X9CnfnUEivgfTgWZ3nueplLcNP0fyBI
	6HBblU5eaHqUB7AUsaPRhYrUyCs42IDDcn8DVwms3VMxRJSgN+T7xLvgxYeOFBpC8dBtA5xdXx9
	QbdBHtx2EVw20nr93DTwJ5nIOZjw4AexFftlLljXxPru8ykS2ISNGl7iVuwNNd9zB+4iLwIF5qv
	jct47DCxoJzXh4oVGxbJq2f65um106nP9rCttjISe0OttBFiy8LGsoL7d7+t/k90mDE3ZnOd6kY
	DkD1O8JIZElKqTW/HsC73wagQ6K4oOxx1RJrtH9mavtK9gZRq5+iWpV3KbDl2q4DktPu5jF/xL+
	OmXxS4x3xWrWlaDQJWdD17tDVQXN6vgflp1g+q+tyKmS61kRvuQMSRuH5i3uij5GPwhMIictvzN
	6EKfbT/iBYhAeVCnbFN8XdKGfMvNdBNnoyWYrZOnUbuL3Li03imbA9MpovaGS66uPBKyEKEGrCO
	132X1NbBYx0eV+CUJ/4mqtIq7uvYqcot74=
X-Received: by 2002:a05:6a00:6c88:b0:868:f29f:67c9 with SMTP id d2e1a72fcca58-87e9899515bmr958238b3a.9.1790221973831;
        Wed, 23 Sep 2026 20:52:53 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1cfbcc08sm2188359b3a.15.2026.09.23.20.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 20:52:53 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com,
	Daeho Jeong <daeho43@gmail.com>,
	Daeho Jeong <daehojeong@google.com>,
	Qiuyang Sun <sunqiuyang@huawei.com>
Subject: Re: [f2fs-dev] [PATCH v2 0/2] f2fs: fix online resize state
Date: Thu, 24 Sep 2026 11:52:46 +0800
Message-ID: <20260924035246.3604446-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260829060524.2656620-1-qiwenjie@xiaomi.com>
References: <20260829060524.2656620-1-qiwenjie@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jaegeuk and Chao,

Just a gentle ping on this series.

On Fri, Aug 29, 2026 at 02:05:22PM +0800, Wenjie Qi wrote:
> Online filesystem shrink changes both persistent SIT state and the
> in-memory geometry used by pinned allocation. Two stale-state paths can
> leave old information active after the main area is reduced.
>
> Patch 1 makes the resize checkpoint drain existing SIT journal entries
> through the normal SIT-area write path even when there are no newly
> dirty sentries. Patch 2 refreshes the pinned allocation boundary after
> every geometry change and rejects a shrink that conflicts with the
> configured resizable tail.

Patch 2/2 has received Daeho's Reviewed-by after the concurrent-remount
rationale and test were clarified.

Please let me know if another revision or additional testing is needed.

Thanks,
Wenjie
