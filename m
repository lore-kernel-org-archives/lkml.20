Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794343259;
	b=sT6M30aSLNuU2HON4W5Roo0ECkOG4I3jsvl6SQeRsBS5RbHYfcQlRa1bH+kommPmNYT4
	 b13LZcyiIN/r72QJxjSnddndqZ3eRue74rQ39CHabXuyPc3T2Pb0NEnCYtlfBhKCXwbcE
	 v03eZV1sr4PsDIsQdVMnGdXz7J6W8FbFBe8LqkUFrkk6OolA+WHT0GKTI1fWcQ68jdf4e
	 9+oKysr95ViX5uoxgNDc5bAd3cFS3u3LRK6hAFnWerL55jh4HrOclpxhZ18wbq4VtAHhO
	 cRzCEPpJr5FeJ4INGQTROHvTCRnXsbFaeh4J/2/kxqezi5g1VVbwZ/plFNmCBpsJc2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794343259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z2r/5TPOj6xlBCwBMvS5lY/uHLFbDokwBpHEPZnfXAg=;
	b=5Xt9y7tFXMAgFAeyAqolLrJ02EyPWTr/XVwaUPMjbrvE2HDi9wwiuiY4VJ+a9gGrOffG
	 5+kvAwHhtUUuLG1/dIWv+lK3s14ztAr8PGU6xPQBltQWac5P1+BqtMlYOjkIHzYSE9myZ
	 qZsz/FjYIPKjPT0O4sFj1Al6h45gSCu5iPCgfMrRlPifTIWgwpFcQmJYVQiGx0opsm4Qr
	 lqpBudB/nj3sEkL0mPdXCea/k8pLE96xZsi09raadF1lnb+XOpjwbSM/cxRkdvWQH+sWl
	 zupOUwzlOCoI/GiHAc2Yvf0vaMgS3BPQD+Zf6bJmIcUKMeNwBbBuYkzoAT1ApFAGlAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oDNonfYx;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75454606A333
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75454606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oDNonfYx
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so3910218eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794343259; x=1794948059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z2r/5TPOj6xlBCwBMvS5lY/uHLFbDokwBpHEPZnfXAg=;
        b=oDNonfYxV3uPERsEfmZktK78O1OYzkH6GfwFoa6Q28trPcc5e7NsrchzQxsI28BIXa
         XZlW/dSuycFbDvY+eqLdOolB8u2hU3zOxzX87h59Gz8ZeVf3c+5gd5vfnDaPjET+HJwj
         ydlIJb/nNsSUrt19d1qWpP+mDGLRurZiCHegGrgLD3IS2n+nKIEP30pd0s3XkAy8lxbj
         ikf41kzJAtRqigyeQtGfofjWZpx9aadU30zFneLo/LvweW8/NjzQBjoN1xJHGKOQDfeW
         dNY/vPhznM7JEWkRoXMDRFJljKljRX4zgA9SP6tzX0NfGuuC+pf4wAzDMANKXxHtzADI
         I06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794343259; x=1794948059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z2r/5TPOj6xlBCwBMvS5lY/uHLFbDokwBpHEPZnfXAg=;
        b=hDnFk2V2ylo8on5CSshbF8OyITLNwzo7SDvB9MFS2HoFeX7C5vwdJlxS3gd91MyDU/
         3AiZMG7sUAAVBn9mwUdKpXDkWIx12ysGjUhxlRT20bbBrIv8NYArweCuJUppJ4D59gpf
         Zid3CkX35+WwQaW+EFZtLhpxQKbhaqNvH7tVS0eTxO8G5ZWcHn6uDrLFWOYwgbo5S8HX
         jWIIy6IgwaTi2l5w0qYZh6icF8jJhdhEj/o+TECu9wRMwLv9FD/UAinWawSIz62ZLjJW
         /WbMDh4BXZIp0XW/A/tAvoFjzfRyZ/ppazNQSMSFAgDRarSRNPxL3yl9Xl8TRJlMRtOd
         GEDA==
X-Forwarded-Encrypted: i=1; AL+hErGj3pMtyK8kRy3VxEycJmqRWFWmsIK9kUE7K6twf2eY+swx2zfJ8ktd3MmkdNodNgvqhJx1AINl8WF+DVM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9h9Ekkn481ztjr3vg5geYu6yAfoSjWVuf1jtoYDlsX6f6nllHr
	x2DDCMsgwBQY2+WTauB3OxaqQi/KIoj6dvElUoGyWwpOLciQ6VnbVBJpALD+Ntii
X-Gm-Gg: AYBFou3W43kiyDhAH2LF/XObrTPBbZt8AuAsO+C/n3q9E1Hby8FX9/4ovDZ+tEZKsMO
	3VqQ/cvVqPL3JNycsySVzthHir1uwrMbgws5RaS7wt/cdgJyJDno8qqXNh0bKswMOI3/veyGxbo
	o84Z6YRbIfCx94o2h+3OGaEeJ9qNxoiUbfm6oTb4oZqB2nQKoCfKoyIMpFFyXC0EXaE3d4Nu5lY
	H3LIIydhEXhmUGPiZHKP54qbjF5n8V6uv+ewc+ngIAmGvFtLvYiOeI0ar7sUepj5tNsx6v/+toT
	AaKIi7IGoVOO7+/LOeQgypJSXOM3H9lwNa1hnJRryFtOiTntCbcj7mhfCng/Qti0yJcsgJ6vvXB
	08UIqhGdBd30VMU+UsQNt+RCWGca/3cByVqOwfZSa4mXNGoQPxaeG34Z2ANXyx/2zHB86+GBR8Y
	kjQCPz0xz18nDPvZ8Jtt66cq/7NOJW/AjcWjYdKGZKqyt3e96C9DmiJ5YJaZpbjTYVRBc68A5Db
	VjreYdDVvt41t6ceaXYb3rQWGIdp02CTvKFSgPJNvkJ/8uoDDGWE+t7cAAKLLa3Z0MpPZG/7nN1
	OQcWgOgi1q0MSPRBRIvTNk1lZrwbLT3RA0r7kiEs8xB8I2lE7H9h0lZLyTFj3vEC8w==
X-Received: by 2002:a05:693c:600a:b0:35d:4e41:d2c2 with SMTP id 5a478bee46e88-37686d3278amr499900eec.33.1794343258427;
        Tue, 10 Nov 2026 12:40:58 -0800 (PST)
Received: from LAPTOP-KD1TH5BD.tail375eb4.ts.net ([47.11.98.41])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bfb58dsm17473286eec.18.2026.11.10.12.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 12:40:57 -0800 (PST)
From: Gopal Malaviya <gopalmalaviya53@gmail.com>
To: akpm@linux-foundation.org,
	willy@infradead.org,
	jack@suse.cz
Cc: linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	fujunjie1@qq.com,
	vishal.moola@gmail.com,
	roman.gushchin@linux.dev,
	tracekotae@gmail.com,
	sashiko-bot@kernel.org
Subject: Re: [PATCH] mm/filemap: restart mmap readahead on sequential faults after many misses
Date: Tue, 10 Nov 2026 20:40:35 +0000
Message-ID: <20261110204035.184968-1-gopalmalaviya53@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-206717@kernel.org>
References: <20261109091444.128521-1-gopalmalaviya53@gmail.com> <sashiko-outbox-206717@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Nov 10, 2026 at 09:15:49AM +0000, sashiko-bot@kernel.org wrote:
> - [Medium] mm/filemap: do_sync_mmap_readahead() recovery fails when
>   min_order > 0
> - [Medium] mm/filemap: do_sync_mmap_readahead() ignores VM_RAND_READ and
>   !ra_pages
> - [Low] mm/filemap: prev_pos == -1 wraps to match pgoff 0 on 32-bit in
>   mmap ra

Thanks, all three are right. On XFS with 16 KiB blocks the reproducer
still takes 4096 major faults with this patch, and on a MADV_HUGEPAGE
mapping with MADV_RANDOM it starts readahead anyway. I am testing a v2
that handles both and the 32-bit case, and will send it once the tests
are done.

The page_cache_ra_order() underflow is pre-existing; I will look at it
separately.
