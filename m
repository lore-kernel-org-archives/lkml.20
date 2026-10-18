Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C4D367B96
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792304532; cv=none; b=t2j8Px1/cpAzjKlhJUPBp4N1h9AYtB8WII1DOM+11pAwFZMTvcmMBbjYEaktcbYQ7CINSEmFmTLtYp9DLoLOrwVwO0Rseq9a9tgWq0iFzMY5Widnr5ARttvfarXYGygrYqOR+5PLiCEE3tYyKNJNhlcqgABjk1Y5d8lOxRcB/Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792304532; c=relaxed/simple;
	bh=y8F7dXJHndM13xZhNRXHWKnJACtvf/G0EiIhGDJJtWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SooJHYjE3u0kPwfIW1NMq1PlfB+cEOby1rI5oEsO9xyPavJ98XEhL6p1ysrRtgLwncIrxZhVodXzlwaOeopdNP2kUwgdttItEhoh596rcUeI9JIvjDEuxIw5yOX7kurmd8tzV5gBbMG5fVuaXbi7fpqi3ttGa0TxuPihLo8bjws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jpRZ6G95; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jpRZ6G95"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8520161fdb9so662672b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 23:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792304530; x=1792909330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ImNMEDi8oPrWIx71COnlaNJwSBMr2u0fGsfEGtTKVc=;
        b=jpRZ6G95dVbCisuXSRF1PGL7VWpZfc7cqqzlvnta0wcWdu7mkYPlgmpooLCj7yNDcV
         +7JooiXIsgUqoeARYKEPCsesEBLTcQwBq7pDTavELZTRJpSJ9zNNz3iKaOCOVhmJzX7j
         1+z2POJbvLq5itzyfI8qpw5syO7D7robQJAC6nV9vLvATm6ekntSHSo2nXI208gbI0l6
         cQisLx1Am2Z0t6Z1QjAoSqVZfIF021GMN86X9zDmUMXwHgsKiGjxrWE8JL+9mIgrHtOs
         Bad5Nr5MDW5i4lqaRCSRkHM3PqyUjjjDx+lFZGp5L0n1M7kJQFrTEQoDGfyncVS4H6Sh
         GhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792304530; x=1792909330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ImNMEDi8oPrWIx71COnlaNJwSBMr2u0fGsfEGtTKVc=;
        b=Fe6UDAU51uExwXKGqOxt1Ag9VHZ11zMG18QNj0f0/QRV6vfz+FztY24JGJsqf5loSy
         psrOO3sA8vDmNUy/Ko5dYIkqaM2NOLJrSEEie0TnBxS2OCVw8l5o3aW6jmnkTjqFsK/p
         EsWG+Ws47zNoT+C2Wui4QorHJKo9rBxDvKwB2mJcnE44hvjdroLEZSwAbebA1jwnQDBD
         AnDW7wolWKb83hvyxJ4cT1TcNMrPth5vR+QBrnIObR0mOXsnJQbiDMU6hpQRD0gMxwYh
         fkgtR2u1DzXRV6l56a7bHz/QOa9bxW84pqUf8TBswrJf0aXPp9m06td4J5NoIeZjheHW
         +GUQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5DJoZMEbmsBwtzgoXHNaswY3v4NQy4/QxtZUCC0lcvYQjHdC0LR9rVB+VctCiDEIGAKAdlsGEtnwjjJk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjheFEg+m2Co1JMN3RcIJrUHnc3Iq3A05kLY7IigDw4TBMBx+5
	djwA4R+2qm/h0ALwy5rUTXzO+8Jf1FRdBqSd9TTxztHSQF+4tGTHeDOT
X-Gm-Gg: AYBFou2CZwP4IZlmc/apNA/JsvHOI8D2T2KqZ8bovXnEyiYvIINyGns4DqBPVuQE5dj
	pYP4PEhyrjuUlRKY+oHzpPgG4Xzukfc3qEU2qePBAJjjFLQl+WCY5ZDxfpqH233uvtvrkdp1IHe
	5rR+aCZ6KrDU0RQzPOMje0B6mjjXDabOsGEgdKA4qAXlCGgy1MC2vxi4dEfGooLOIka8vo6kSzp
	lBNXUxUMHz80g0NFFhoDNZj6ZppjHo8XM3rS3KAVsLl1ZRTAWjjlqh4tM4kmhtTHUoZWoy6aLq/
	bgznCM/11z6LskHXrUMi5bn7dStAy8BG6zqIoXHMlUmirqH9hosh32MEo9t+JafLUOPfwteqq9b
	+7NxVY7HuignC7f1syxrz1kV33UixGMo88OzY4AmuGXa4/yMlcz8BsGuWhRg9zR5SO3ObcWLcVj
	7cWdpu9EUnXFS7nKrUhEQuHAd2JsCph/VFQRkHDVynBgmxMJeM06fAq/ENlNXUZdMnOYfl9KMzX
	6rlei4p+TeRcDXw8oy0lBbpt/gz
X-Received: by 2002:a05:6a00:1707:b0:882:ae75:b846 with SMTP id d2e1a72fcca58-8a04ac2a7e8mr3453484b3a.4.1792304529741;
        Sat, 17 Oct 2026 23:22:09 -0700 (PDT)
Received: from localhost.localdomain ([222.254.197.26])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a05d4b04dcsm584738b3a.16.2026.10.17.23.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 23:22:09 -0700 (PDT)
From: Nguyen Duc Thinh <ducthinh100812@gmail.com>
To: Weijie Yuan <wy@wyuan.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Duc Thinh <ducthinh100812@gmail.com>
Subject: Re: [PATCH] docs: submitting-patches: use git switch to create branches
Date: Sun, 18 Oct 2026 13:22:00 +0700
Message-ID: <20261018062200.29256-1-ducthinh100812@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <ardqGdjnd7kC1B-E@wyuan.org>
References: <ardqGdjnd7kC1B-E@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Sep 26, 2026 at 14:45:45 +0800, Weijie Yuan wrote:
>     \$ git checkout -t -b my-topical-branch master
> +    \$ git switch -t -c my-topical-branch master
>      Branch 'my-topical-branch' set up to track local branch 'master'.
>      Switched to a new branch 'my-topical-branch'
> 
> @@ -882,7 +882,7 @@ notice that it will have the ``base-commit:`` trailer at the very
>  bottom, which provides the reviewer and the CI tools enough information
>  to properly perform ``git am`` without worrying about conflicts::
> 
> -    \$ git checkout -b patch-review [base-commit-id]
> +    \$ git switch -c patch-review [base-commit-id]
>      Switched to a new branch 'patch-review'
>      \$ git am patches.mbox
>      Applying: First Commit

Hi Weijie,

Thank you for putting this patch together and for the credit. The
conversion to the modern command layout keeps the guide fully up to
date with current Git usage practices.

Reviewed-by: Nguyen Duc Thinh <ducthinh100812@gmail.com>

