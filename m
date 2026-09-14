Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2642D369981
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789366135; cv=none; b=fDoydBklrOTbW3tz52RAsMY6EGtbargGNi3vqXbWTgCOdsEjFiL88TUxYd1vcVWE94Iw5mnL4mAYAfg0NZmatGowYtIqv0bibLPvbbwAq3ugG3nK+1NsCkng23ikg9riS9oEH2Zy7Wt7p1VrVIQsEcaWTG1JOFfwNYB4tsIAjZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789366135; c=relaxed/simple;
	bh=4nrXIJVDXaUkwf+YC5VoiLxfZ+FG+C1MAP9IRBoZSks=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VkiVOPVBR7N6WY+iDf0Zy7Ro9QttB5Bsh8iRnNWFsrLWltcFNZHTYd+jCvwVV6lZMfWaqlAib+01RAX/ithkNd6lODxdTaJnpA0y5c8lxdNT8YER6F45ZYt7AMLphAtXFavvCkfhDrTgkPNu4WWf2xJzK7APlzscmJUxlnhSquY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SngrwB5Q; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SngrwB5Q"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2db18fe433fso10344235ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789366133; x=1789970933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J7ZLRztZ4qGLXwZmjT6Sfe0hmRUFOBvBkpnxtaBdgb8=;
        b=SngrwB5QlFLlgcJVXTQdKyiSY1F7Cav+E1EcZAIfIKbc5Bi1Yr6hYFk7jcDmCz8Amr
         t8IZNXpRo15QIF7IaPJUwl6fRljWgImLGAAkkanK1YVLQamZkywFAv45m7WNccgO3Qbd
         Y0fF2+FyMTwrLzkoKMD/bUI7LfwiC0RbnyDNCKUt7oz98iFjU/SFKKsxsr2Y0z223eyX
         MO5X9SdKygY7opegjeZs2PObbSyi8pdffHkAoPJiSS1VsYa9MRWVHdAzCSnlgOvigYzK
         9rq2bXC2oZ+0gHNrHriKAq5g00+QEiKQTDkT4ttAa7PgSIU0nHzkHS+0mPVOGdGcRbPS
         Nv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789366133; x=1789970933;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J7ZLRztZ4qGLXwZmjT6Sfe0hmRUFOBvBkpnxtaBdgb8=;
        b=dNfwunuUWh/mK5Avt+5yvGLtYSYu962AHA0iNfKRPkXg4RNwKPXk7qz8glUWWiGfa3
         J8DL732sw3KTiJeyOxNGt/o/H6pNM53dDzxToSroTzORoLiF0zYkNkWIETbc5XUQLi/X
         dTFKwGSLvR+WYQyCMzMACjW58Wg1M+znbA27g6psN+zsDbosoZQA9J6qNKRJcoR3TDp2
         7HE8ALRVLeDepIfviz8Dbo6hx8araMuJX+tuKhkHZ8bYxZrGLF4tKA0S1XSNW1JqQQHj
         cbC5AHB10y+d10Hu30Eb7zU7d7QkCouR7qyEHskqUpzHYvCzinQnSjgu/dv5a+qEvjdr
         Op3g==
X-Forwarded-Encrypted: i=1; AKwUvBw6Yd1Hvg/j6BQWn+ALSMCNdr5QsiZ4Fh0v4tpHP7RohtabFPYD3VBqG/TNvzT9UBjZ/KBnPM8yhHrRk6U=@vger.kernel.org
X-Gm-Message-State: AFuF++nCDsWvqTv/6zDneBaxkrEPWN0jTP3nHVA/gCi6TWFEgBha8MLf
	sKHzc7lv+E1fMig7ArcRulD/nneqTR/09+qlgtAlgowW9fnOrNUffGlV
X-Gm-Gg: AYBFou1EhuLuhhHQzE04ucfOEdRrNAOYQLCQ2IXAcD7ReyO/fM1AxCLU3OyCx268cXz
	lUEY6dQFB20zw44Xccl36W5CHR0DICw5Xx3ZJ2hVTOCvDi/jPsX7MEshKUCROWklhMHJh8RAkGV
	qxA0iZMP7P+TQga8aQJBGWCwuQFoDAe8EzfxOTY4WX+hoA+Y+UtYjNE/ntAIYgHCmorMuNGarb0
	PqrRS0gX/evMkjANZJ0veGf0qUG8xW1mWPn4ysDPn9F4PSOQ42bDCRPS8hP7jFeLOE1lijgG5ZK
	WWK9cPn6a0UUxEOVYhbizlfCeXigslYThf4M666/FrO3xWHtK+aJHFvIScVtbUjTFHOosobnoCv
	Y7S8+h+Y1Q+m/5Ueo+U23CPNgYMDC0hlmMPhVgKHn8OOBkh0PGJpc1tsk+F7MnuyqwPCaGS6aKa
	WuFH+/zC8xgOVlwIEapkw3fWSxXquq58MWE19blPFqnlXn8vXQLqGv9CUTxtIrXtRfIV/z/p3Zf
	pXsS1mnP981oW8nWFJj+9W3/KyThWidkBoSFUDq
X-Received: by 2002:a17:90b:4b81:b0:398:cb56:e92 with SMTP id 98e67ed59e1d1-39debfb92b4mr2677452a91.11.1789366133460;
        Sun, 13 Sep 2026 23:08:53 -0700 (PDT)
Received: from lipengfei28-ThinkStation-P368.mioffice.cn ([2408:8607:1b00:8:a252:ce11:2d53:3638])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9959ac65sm18651790a91.16.2026.09.13.23.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 23:08:52 -0700 (PDT)
From: Li Pengfei <ljdlns1987@gmail.com>
X-Google-Original-From: Li Pengfei <lipengfei28@xiaomi.com>
To: sashiko-bot@kernel.org
Cc: Pengfei Li <lipengfei28@xiaomi.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	kernel test robot <lkp@intel.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v7 05/10] trace: make the stackmap capacity settable on the kernel command line
Date: Mon, 14 Sep 2026 14:08:23 +0800
Message-Id: <20260914060824.4003131-1-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260912085841.48E7B1F00893@smtp.kernel.org>
References: <20260912083753.3426176-1-lipengfei28@xiaomi.com> <20260912083753.3426176-6-lipengfei28@xiaomi.com> <20260912085841.48E7B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pengfei Li <lipengfei28@xiaomi.com>

> Does passing this NULL pointer directly to kstrtoul() cause an immediate NULL
> pointer dereference and kernel panic, since kstrtoul() does not check for a
> NULL pointer before dereferencing it?

Yes. Booting with a bare "ftrace_stackmap.bits" panics. Will fix in v8:

	if (!str)
		return -EINVAL;

Thanks.

Pengfei
