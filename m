Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7773E2ABA
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872717; cv=none; b=MaxGXrjjIuKdovv//99MBP7dWKOWRNLibAZmXq2YT7lp5s/CSp/fIqMb9ZfTq9jSTEL0AhavObDO05R466QZJQ3/yRMoIf9Aagi858HFwjwoiTE14ZJxsClYukZJbVDT+XL07wh4qs/3+gxXnvOVy9wR0/pTiBi5jDBw18rs3E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872717; c=relaxed/simple;
	bh=ZTtwMkpLOSZu+3YbiwWlIQkrGYDyVLn8Y+fql8iKjic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rlLRjFC8b94hxRZrnXR/4Tl4qcgZKV7nlrhbNBRfykXyCKFldDA4jWt2PKpDV/Za+z5Nie+y2xLTBWo9reEo1XG/1TlntMLSc16MoGCBC2T2PnMZsMGYgH9btX8MhwdlcVYaexxV/xpG0ZN5RnkJd4sdk13BciDkzE9go0NYKwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+OkjAsN; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+OkjAsN"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso2389935e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872714; x=1788477514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dGAnNojWnd7EEdnWQq2YtB4nZzTR62jm7SPRm9eXTaE=;
        b=T+OkjAsNpFs1WVWgUUTz2tH8mop5bNqn2wIeScW865nhc2o2LPtqHiUK7JirG8guBj
         3mMpz1w1fJiiSm2V+jATzw6keh8wExUshM/GUZKxJWvltCpslDtPoBiNEOaHLlWO0W9k
         5+qiqecba2RW9b1SoxYUtVJAFyw64sFtjqefTwZuDANzzFJ0GzT/PlXZtDQUagQUurPY
         QrvEIeb7Ne5N3xZRt3S4eSP/0hccrGJE08JzbkclHoKMOiR8+EZQy7vxlnIWWymhwg48
         JmsyvWW4zADXR0ODgk5dR1puFNa0xxG2pmAbP2e9afHxs2gFReVyHSlj1+IUAoObmVK0
         uhnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872714; x=1788477514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dGAnNojWnd7EEdnWQq2YtB4nZzTR62jm7SPRm9eXTaE=;
        b=TYvWfJHhdx3bb0vKgRutECqYU3va5aLAAjKfvZXKqFxkLk/tnp8l1jCo/v5n0tbjy7
         fbEI3yPkeIZu0WZldEyfy6ZIa9GbznEnbUzIQ8uA2iBhpFzU+BCVMKWJNRzTuKbStXhs
         baQTM8KN9YmVjKqmYYyLeoB5ovHpzhH2+a0VPAORgVULWaNCkYuV5fhgSHuJ5JCWvLBP
         yF/f1tXn3xlr0VbwebT44hxM12tlXXGnFf3b0Zzk3fm4T8AWA7o1VyCSDOnctlY1jYdI
         t7W7X7MFXjFeSUoYH5lp8Skbqm+ep2uIR85K7aDeLabAKS7XEaZ5Lr4l2jVHCKzQ2GM6
         kFYw==
X-Forwarded-Encrypted: i=1; AHgh+Rp20y51sOW0bdQKzbJ2/8AAtjKwPbnMevLa032lojz0SMb4E/uIXh36yHJn4YrXEnzNpvGdaYQHN1G5tbI=@vger.kernel.org
X-Gm-Message-State: AFuF++nluL71knP3SIjFtmjwg4WVDcsw4FSQIRzyQ45Vo3o/tv1x0QUD
	K6irp8TnzyC5ckkUWjg/PWQgYBUbSBRPOUjzcGFWpQzpgAnxXdztdXNb
X-Gm-Gg: AR+sD13Ic8o5eHgj5FytSOcyMaTS49bEOJ4Z2Vxaols9y/h/M+obVHxsMkH6pLxrY15
	K9mFNzZnM8BUi3zmsrgmJxa9GtEVYYU5yn5irbEFwAkCorCm6C2dfCGFY0N+TztAisnU6sWm+tu
	kLp8hl1JeQdzoRiPU0MfQGy6bXygHI660Ev0f/kk7dQkyPKqrpIfND2gDUY6fQbUeZsDkoSTrh4
	y/XFyNi0vQsevh6m2Z5xvhM+EDijpM2Mb4Va3/DUQc9IlZBG+h0jjN4hWP7OQl51BmIxDMWV++p
	vmEGaOw+V0IAed8QUvqEj/oeFaesMyrd8BAOYIaZy3QajgWX4uZKp5ZlLJjoOBXLR8HSKA491OR
	LPNdNOrPlAgCMwbMSv+epJz5IMI645W/Upai6qNKenOIj46PxmlssD3t/iP4zbpgWQZLGPweI1s
	7qkCVdoudgDZVm0Y1LtpmFs6Vt194HWCVdBG0oK2v8iR6iJpk5zeP9sTVl1zW9W3lk0xx13iAMb
	h/UfUKD2Gi4atg0d8PrYqZuxNBNvNBUumR3L/p1udvm
X-Received: by 2002:a05:600c:a02:b0:499:da8b:1476 with SMTP id 5b1f17b1804b1-49b91c52579mr25104815e9.14.1787872713803;
        Thu, 27 Aug 2026 16:18:33 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4e2c1af7sm85413445e9.15.2026.08.27.16.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:18:33 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/8] media: atomisp: support the Yoga Book OV2740 link
Date: Fri, 28 Aug 2026 01:18:30 +0200
Message-ID: <yogabook-media-ov2740-pahole-20260828.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <apBJHHhAPowUs8Kj@ashevche-desk.local>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com> <20260826132256.3343451-6-mauriziocasciano7@gmail.com> <apBJHHhAPowUs8Kj@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andy,

I checked the final v3 object with pahole after moving code before the two
register-list members. The resulting layout is:

    struct ov2740_mode {
        u32 width;                              /*  0  4 */
        u32 height;                             /*  4  4 */
        u32 hts;                                /*  8  4 */
        u32 vts_def;                            /* 12  4 */
        u32 vts_min;                            /* 16  4 */
        u32 vts_max;                            /* 20  4 */
        u32 link_freq_index;                    /* 24  4 */
        u32 code;                               /* 28  4 */
        const struct ov2740_reg_list init_reg_list; /* 32 16 */
        const struct ov2740_reg_list reg_list;      /* 48 16 */

        /* size: 64, cachelines: 1, members: 10 */
    };

There are no holes or padding. This layout is included in the v3 series
sent as a fresh thread.

With Best Regards,
Maurizio Casciano
