Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630FD3BB134
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789397336; cv=none; b=Ek8FR6ufNpqQoFoNYeqS6kHEF6gktzaiZl9LUz2ef9l6bllmZN7FzOTsf+DcsuTI37UlLLk4KOXy7f2RV36yfZ7dJXxfrIUKR2s0zI7jhYupWDVlI9wzq9Jh44FwAtgVqhoiZLy1rJgMqkmJR+Myc2De1VtnBJUBY3z5Wi66yO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789397336; c=relaxed/simple;
	bh=1XAHUwjh6zUEXQ3bvhPhcRYD27b50yX9tdUAkDOts+o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AQwWsaTMQYKIC2SJXtPAsp5puqtZGsBUsaOGgGDCSgvKb48ZAz/QmA5paAWBfqQNiT810VkgEIlfpdSAvQaH3zB+xP5e4YuM2CLWBg5o1JjyhS4EiLWRYqC0TZdxsz7QG8bZrSclCF7EHFy83W9HSUn2xVSi28i0oM0nactIIQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZHp+DMEX; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZHp+DMEX"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39d865b11b4so1768852a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789397334; x=1790002134; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1XAHUwjh6zUEXQ3bvhPhcRYD27b50yX9tdUAkDOts+o=;
        b=ZHp+DMEXvmSaOoDradMCGJm68rbJ0zekWk2X4vBxUnYktiPmuTJHfU2BuYgmyh+ZvR
         GV9IWlyUe5kX0czZwJNkg6XvAR4MqN846Z0Hb1g8wnVFl4HlW+qPfRSnvykhhF9d6sJ5
         aCuRNM4rQtZJ4dqqlItM0F2JhbqCV7m8q/8IDcsFBogGmNxkjo39b6uAOWAlk4EnkEVN
         U0ohdqxE8GfQGC6R2RYnx1JqtnmSqEtrk+A5GXnqvEPu88gHfZZ3/aps4nBk0+mrIEt1
         FXg7Pf1h2eteBI8GN34m0nH/InaiAMi2uysEkSw/LGlnGKKBY25PDqt9hLLty1JNlvwc
         RdAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789397334; x=1790002134;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1XAHUwjh6zUEXQ3bvhPhcRYD27b50yX9tdUAkDOts+o=;
        b=Z/U5Jwx0W2krUnH26g0ZODOweBxw8E8V2IgPJPpoiwNnY9Q20RoCAC6gZ9JkPsvGRF
         yUQZGbDQ14osQDizjsKOJ/PJJbfpOBQcrJy0rtuNNGHEZu662bBZFsKahA1A+SbI2g33
         ZSZEFh19e0o5ThNGCOYGqe0zeq84cvc6Mv4wPXnTJZ8aZThRDCO5MioNOLhcXwtHPugi
         Bzf0pAaTFVRuFabuvdv0xW4fcifx8HFIxmkjS3DD0EEhPAtNAT+gndJwZiXYreBp8OLx
         9k1yLUjtTbgWvvs4aG/xOWjDHHlbLEYqFb+7f73XjTpfqXRwVkOz2tgV5upaK70T1cqk
         QWvw==
X-Forwarded-Encrypted: i=1; AKwUvBzcUINWm5g4baI34uFKE61deYLhzO0BtEONrDSfifnaymsXAqCtkdtydpgZt4vBSmy1UGw0IMmg+7aZ/M4=@vger.kernel.org
X-Gm-Message-State: AFuF++k23QYNvq0PCHUeYsNdXPPKEqbgBh2z0BMl3+aVtx7I9shGXYlt
	yzDP8CDU0zeP8gXyzgZKtCvwyG8UzFDm124zJYv7CdiZq4tDcy+XdW8cQWNTEkHzf2KMBw39k2/
	LKMj6wW4Va5MvNcpEoFrIBw==
X-Received: from pjbbs11.prod.google.com ([2002:a17:90a:f20b:b0:39d:93fb:c298])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:e7d2:b0:398:c0ad:711c with SMTP id 98e67ed59e1d1-39dec08d844mr5799298a91.15.1789397333949;
 Mon, 14 Sep 2026 07:48:53 -0700 (PDT)
Date: Mon, 14 Sep 2026 22:48:51 +0800
In-Reply-To: <b1fccd35bf35abf384c31bee6cf3040e02051755.camel@iokpp.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260913033633.3159296-1-stanleyjhu@google.com>
 <20260913033633.3159296-3-stanleyjhu@google.com> <b1fccd35bf35abf384c31bee6cf3040e02051755.camel@iokpp.de>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260914144851.930983-1-stanleyjhu@google.com>
Subject: Re: [PATCH v4 2/3] scsi: ufs: rpmb: Decouple device lifecycle from
 devres to avoid UAF
From: Stanley Jhu <stanleyjhu@google.com>
To: beanhuo@iokpp.de, jenswi@kernel.org, mkp@kernel.org
Cc: gregkh@linuxfoundation.org, arnd@arndb.de, bvanassche@acm.org, 
	avri.altman@sandisk.com, alim.akhtar@samsung.com, beanhuo@micron.com, 
	can.guo@oss.qualcomm.com, ulfh@kernel.org, linusw@kernel.org, 
	shyamsaini@linux.microsoft.com, alex.bennee@linaro.org, 
	James.Bottomley@hansenpartnership.com, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stanley Jhu <stanleyjhu@google.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 2026-09-14 at 11:55 +0200, Bean Huo wrote:
> why uses list_del_init(), list_del() is not enough?

It is. Back to list_del() in v5, and the INIT_LIST_HEAD() that v4 added
to pair with it is gone as well.

> every entry on the list has rdev set, so this check is not needed?

It is not. list_add_tail() only runs after ufs_rpmb->rdev is assigned,
so the check can never be false. Dropped.
