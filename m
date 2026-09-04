Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4445D1F78E6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527616; cv=none; b=E2FS4I9qZoRakcS8CI52tIoO8L4ILteiCj6Ov1rV1LehWOtSzRG4hrOvLuVVW1cMvIcNgPFihMRe8trpw8On39uH+e5Y4FA5rvsQOuxorNmv2JaZHsDO+i8n2tZSb0FksQsmuer+NYDyqhq5K5Blnp46WUN35IZsM9xcO8WmSCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527616; c=relaxed/simple;
	bh=frKo+EDgyBgPiqzNfVxH9bEhfV6BDttiGdaNdUyhrPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tNC2sOzWbBGbnqe1KwbS7+G3CdRSH+QJ9WuBytqTnlEZqz+FamInhK1ed1ypU2SGzPo1UGGDGOpLk7+vSpJlY9nmhuw+3icZF4KjpPmkOlknFtC+girka9mgOzRb84YfNHsgoZIjIHKwsiwzBH9OQ4jGGQZZCm/09xF5o9TbjmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IeWYMJ65; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IeWYMJ65"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so10439445e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788527611; x=1789132411; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/B3wwZTlur6ZmEw56GSgDTNaWB2UuFCQEkVYM+7GfWk=;
        b=IeWYMJ65Q1LWZv3HS3Frm1F6PdWQA+aQECMPh7AkHYgZ3EymBIvAiCbtmcYd2bhWHo
         VJCQYntFVOFPpXq+Lkol59z5hD3SzHuR1Qa80A4EUzZysgFgbsbGbLQ9K78uXRxtrsi+
         AhgsrgVKlkOdQJzCTEzo1pAHMwGv/nQixuuRSOfmYjfoQkbN7UwuSuxtHJyjkGa5yX7D
         qX1WDrXM1m2dsZwCkJ7on9zP3krU8Jm8BEyhFSVqA7S9Ku03j6WNP1D8r7QOHM8zxW0+
         2kK9Xfex8DPG7b5t7VDcQRVsPdKMzfAJVPyeX46zwQIzK9y4Fw7Um+ZYpJhYm0HFKi+9
         9o5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527611; x=1789132411;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/B3wwZTlur6ZmEw56GSgDTNaWB2UuFCQEkVYM+7GfWk=;
        b=R29vwncrEDB9ferQsuIsDGZVMtHZrmhs67LWplkiDn2jNPufk34KIYWQ363pMHibIq
         usRY9uQudLXduV6tg8Pu12NWr6GynUStMP/88pquv0zX1lkGTAr71yYeNU5k15VL/F/0
         3yXnDl+5XuQbDhV1EgwhdR/6Mb8tvryOB6DFlSdieE2YNKFjh61EPxk0fsBhewpB2AfS
         eIThoCks1rrI2giL+FMO7pjVcj6IUtGk8aYpLCdCl3JZbHm3go70AJd1hYmQUjAiE57J
         7zvXugFZI7nzc7w8GH11/1GMHoMo60Y3u9CgV6fQ151Xiv4oFggmRknzIkBJ+keu1iOq
         S5Aw==
X-Forwarded-Encrypted: i=1; AKwUvBx1Gg7sN1Xc6CMNr7Y5GimnNYAPXnHIKmUX2DKkVuNedH4p9eY9NoHFyqlSOCuxOR2rBTpTNC0MyLbfn3E=@vger.kernel.org
X-Gm-Message-State: AFuF++nZNMfzMQMUikSrjd5scRcIW6nLLrGNq7WOfRUE3K4p5UAMbmL3
	Gw/Wy4B6DoNGI9zg67ynp/qvb807/Br+QONoMTsiKn5u3CRJA5aWzzMTGYRFmh1qbk0=
X-Gm-Gg: AYBFou2v2CGa7Yv26fhcX7kxbnOxVSdH6Gj1CckRGOe7WPBiXxPVe6Q4QgYDZMDHoTu
	aOc/1MyeYBvPtMIZlnpTSSpbdWh/hSVQTsVsXDV+meR8rzDMZNzJPooZ+LgWxkvQSjalGTOahnO
	CiGtM3ar3OGnF7PtMBj8Vvj+shLmKIDNagMZnxr//XynMC12mze0OtZcdIRsmmY329k/emvC012
	3f93DjtkLeZjNrvzlsNRO/DChMV+hJtL10IpySEnf6MGDN6u1tSwlH6F6E4/aFzK2eKtxhjVNHd
	8I2/3aR5vlkwSKuYZPtISzVmJy77kj0EpGeEeQnBY2zLxfHOiw6VZtoqdtqL5tMjExItZ7zriXd
	QNZtnmzRjuqYNRhKhU0OfGakSjP/bAARa4EqQtCl1CThh6bTVJdk8t734GSdqpDVJQ6N0Ofuvh5
	1HDzBlTWluNdq/gxFAPKqtZpfTdQSMeODW+j91GI5+E1Ef3gBc+ezi4ceBUOHK0w==
X-Received: by 2002:a05:600c:3508:b0:49c:fc6c:be02 with SMTP id 5b1f17b1804b1-49cfc6cc032mr33479365e9.25.1788527611383;
        Fri, 04 Sep 2026 06:13:31 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d476esm170317445e9.1.2026.09.04.06.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:13:30 -0700 (PDT)
Date: Fri, 4 Sep 2026 15:13:27 +0200
From: Petr Mladek <pmladek@suse.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: bcrl@kvack.org, viro@zeniv.linux.org.uk, brauner@kernel.org,
	jack@suse.cz, tytso@mit.edu, adilger.kernel@dilger.ca,
	libaokun@linux.alibaba.com, ojaswin@linux.ibm.com,
	ritesh.list@gmail.com, yi.zhang@huawei.com, sforshee@kernel.org,
	akpm@linux-foundation.org, rostedt@goodmis.org,
	andriy.shevchenko@linux.intel.com, linux@rasmusvillemoes.dk,
	senozhatsky@chromium.org, kees@kernel.org, tglx@kernel.org,
	linux-fsdevel@vger.kernel.org, linux-aio@kvack.org,
	linux-kernel@vger.kernel.org, linux-ext4@vger.kernel.org
Subject: Re: [PATCH v3 2/8] lib/vsprintf: Use acquire/release for ptr_key
 publication
Message-ID: <aprD97HPpbVNW4ir@pathway.suse.cz>
References: <20260902074805.398540-1-ruanjinjie@huawei.com>
 <20260902074805.398540-3-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902074805.398540-3-ruanjinjie@huawei.com>

On Wed 2026-09-02 15:47:59, Jinjie Ruan wrote:
> Replace the smp_wmb() + WRITE_ONCE() and READ_ONCE() + smp_rmb() barrier
> pair with smp_store_release()/smp_load_acquire() on filled_random_ptr_key.
> 
> This expresses the publish/subscribe pattern more clearly and allows
> architectures with native acquire/release instructions (e.g. arm64's
> STLR/LDAR) to avoid the cost of full one-way barriers (DMB ISHST/ISHLD).
> 
> No functional change intended.
> 
> Cc: Petr Mladek <pmladek@suse.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Assisted-by: DeepSeek:DeepSeek-V3
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Just for record.

The conversion looks correct from the barrier guarantees POV.

I am just not 100% sure about that the performance on different
architectures. I asked this question as a reply on the cover
letter, see https://lore.kernel.org/all/apq5iLOF8lAQ_ZVU@pathway.suse.cz/

Anyway, vsprintf() is not a hot path. So, we do not need to take
care of the performance effect here. Feel free to use:

Reviewed-by: Petr Mladek <pmladek@suse.com>

I am going wait how the discussion about the performance goes.
If it does not block this patchset then I could queue this
particular patch via printk tree.

Best Regards,
Petr
