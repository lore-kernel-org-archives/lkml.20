Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6444D4871
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162545; cv=none; b=B7T2Vxk5ofr7/PDa7ocL8mnP6rxc9IZQI+6AdJRunWef2hC3DlCzmdkliasJ3Pyb1tA68SljPfcEjZJLPcc+sQfG6hKcZ4+H/YlOOmVzaGWaXpng4dUbneT+wy3huJgunZLJVLCZq1A0pitksGOJcMPneEsSdGdrRctuRJwBfeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162545; c=relaxed/simple;
	bh=UNmu0sI1jUnw23wJrqVSfC/9czo+4sG72RQBka6n4e8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WFBtMKfHcJEKIxUi6i1peI/aEfScFeIZ30hbjNKp1RFcjRlsdbV8jaUDzoVhRvwUC75cdWImPquMTqvLuprWGYxzQ6zJYabrdVQUpJkb5deMjBX5i3eflvMFqQ1S+ivYsjxWJbYEFWvV2HLHv0GW7XY3nhaVxHWrakJdmb7KpS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b1lXbu96; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b1lXbu96"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso7057195e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792162542; x=1792767342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UNmu0sI1jUnw23wJrqVSfC/9czo+4sG72RQBka6n4e8=;
        b=b1lXbu960cPxffBlZYdqMpWyHHVrbGzCC17fcKlnTJO//IicDQbAyU5cTBvh3h4uOL
         5gyKisIgjOHj3pA64fg6FyqvKcrCe7tuqF+n70PQo+tRSRHrLD8HRH5scGs8ReK3/2rv
         1avFmukQfoaydAwm3zIMB3xDJu7RdbBqHPVci5kiNnvhhnlSI7Nx5wJvTV+zGoIh2mer
         TY5PxcD/sPMpzzqrwtRXJM7N9mmmQciQAFUWId4q/B2EefvihUCFJnJWFSLSNGSPLUZ+
         VwYVTusc5Yprq2MsFhEuN7TmlpsqJ50Q5QIVaGqjLQo8PBPFQNKi/5CbCr8NwTZthRz0
         xNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792162542; x=1792767342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UNmu0sI1jUnw23wJrqVSfC/9czo+4sG72RQBka6n4e8=;
        b=vQz2ymKIHOUVofDmm0faIsSHhpUigPFmc/IXkNFSBbdylwMHvoSLLnhSYpub9HQpyo
         c/qbVLfnd7JNidnPsL1Mkh1dl2HotKCS/eL6QUyl4eCyrEzvG/KyJZjE/OLN7h6yB2Gb
         3xKMD6h6mAxd2JmSZnM0mKjLWk3zu62GDJqGU16CizfwReKl1tH+sFN3aUQNUEDTcqtS
         vEr2OJKyax+qUjHkpqC4xG8+CnvAj64SejUc83HSIpS6jmuFzUNvhrX0elJQK0kUTT0U
         uQguFHRssaILSEVwH8JGRO9ySm2IJXqlz3Rysu6wPXEjgGbtcOspQbDRt9qgQthaDO23
         b+FQ==
X-Forwarded-Encrypted: i=1; AKwUvByJ4STvAMjpt/ef+XTsI6SN/re9+ag2LoQ4BDxwfz9wM4qSxqHPib7sb7BPgVFL1PoBupRNo4WFlM0Z3rU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJW5TNytyeNKyv9mAvkkNYj+CqZ65iJwxnu3q9WxDbMRPgAZZb2
	4aOeByeu1l+3mm+6nVEJ18PmBhHpobWWyf9IC2ftjEjdOEC6D7iIjh38FkZDRWY7
X-Gm-Gg: AYBFou1QjdD6R2DMcWOe+9Lfv/nLfOXcyN9mBYHytHfYYB6xBDveAtzbrmgPvbtxPJY
	AGdYhTUJL2NGYr4qopSAjvhNzvwYb8pW+8KYop3Ms1mJsx8kemKA/5BAlsXq46nsrkZRC6/hj8H
	qMfqnFAa2Jt2j1a+yc2E+ltXr2HlzeIhaYdT2GZ9WMYzfmNzuBbE6UNVcC24GRkUq0eEoM4kKbu
	lgbx5DQMr4cKx5HaVvoeeOC5vnrcSnGKDCYoILgXnXun3dgqZFdmZHVrhfu+RTbs9SlZ9oorZei
	p0ovUzmImvdiIRxlUgKb5XWTJrfeYTIiDeQ4nIeh1DPcjMXT5Q7ZuX1jHyeJwhwUzshHpqgW5WS
	EWkqhIW6Mc4zRdvdl1Wi/CW/IfOvunpZdZZHtEam0s2Y3EMSCWXLKb6QikQKeVenq02Lp2n5Jo7
	uJ+wP7122lSavEOJXnRnqTuM6KvqGBOhWWEsd+5uB9G89TLKty9ZaBoPAEsOgj8gDbR7pWyNXDQ
	Y4KJq62q5oRx5kOyMneh4S94vupJCgmEJLjd4GvtRiFTNgSqsQOP/k6WtrBwcu42cjh8umNsYLE
	9MGczSs=
X-Received: by 2002:a05:600c:2319:b0:4a1:877b:d4e0 with SMTP id 5b1f17b1804b1-4a1c66bdcafmr57421275e9.12.1792162542369;
        Fri, 16 Oct 2026 07:55:42 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4d4dddsm5644596f8f.22.2026.10.16.07.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:55:41 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Peter Marshall <pm@petermarshall.ca>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	fqwqf@fqwqf.xyz,
	Sergey Lebedev <lsa.uz@pm.me>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: i2c: vd55g1: fix VD55G0 streaming below 900 Mbps
Date: Fri, 16 Oct 2026 15:55:40 +0100
Message-ID: <20261016145540.37248-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <1a8f2064-14e3-4eb7-8e0a-0e90352aae3c@foss.st.com>
References: <20261016-vd55g0-sp11-fix-v2-1-aa08b4b8bbfc@gmail.com> <1a8f2064-14e3-4eb7-8e0a-0e90352aae3c@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Benjamin,

On 16/10/2026 12:02, Benjamin Mugnier wrote:
> We reworked the clock tree with Sergey so it may fix your issue too.
> Please test it once it hits the mailing list and we will make required
> adjustments.

Will do. When Sergey's driver is posted I will test it on the
Snapdragon Surface Pro 11 at 840 Mbps and report whether the longer
line is still needed there.

Thanks,
George
