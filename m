Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CCA493D29
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792065758; cv=none; b=gHWwSOix1mbt8upjja3d4lnBU96VlUqhuitWPbkkgCPLtVqf2J6LxQ8Ze7OF84/TlHGXQbwsAjF4ZjYcTACmlvUKZ3SbOcJSEn6um6JcK4KvuyMIqyRFD/8IjLjNQOeZ2cN69oas0DWpU7liSfT0+k2/MNwAaRewtxpBnJX/0zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792065758; c=relaxed/simple;
	bh=FuG1vbVIoaF1w5ukegLfM4Tj6dJBiRgblJirrl4Nuwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nVU0pS2PhlA0zQc/yZqh6cg4O3JHYk+ZXh+WGX+q1nD83xFFw1+qvxn8IEJnjNr/zCKCaZf4rsyQJsAp6sp8KKSg6Vp0zaNMRbEoNIeGlpw1szWmaosxbDgUpUtxn+PqZSEdBi7QQ0pjAF6MHPrWa9FxLl6izcvZJqVQuR8MbHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VScYGhnZ; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VScYGhnZ"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so1321212a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792065757; x=1792670557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FuG1vbVIoaF1w5ukegLfM4Tj6dJBiRgblJirrl4Nuwg=;
        b=VScYGhnZd5EuPlA65yXkz3tRdiccN016WS9N97Rlchnvuax8TsTeBQCG0NUQUc1suV
         s0yZmcMSw7lLY1OJuNJHj9MWVpUUYGBFy/3f7tLSgYaWWc0at0Iwp7pDyNGFpRGcQ+GJ
         v2k0KwHDYjQaC9yz7CShjwlcRLSYOuml0PLL31FnBFLJtCx8rYiD+gJkKosT6p6VmDse
         Yz0TTMlBYddUfS3pMiMOzJ/H5HNQVzv4SbYzUp9A1rM6peOZotaQtc3tv1VWIYpAyvKX
         NYj87+4/fr752ts8HoPTIw1mpCHkOEEShf8jx1txu54CoOpzBYKL9aCyTJDWhGuiQVXH
         v29Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792065757; x=1792670557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FuG1vbVIoaF1w5ukegLfM4Tj6dJBiRgblJirrl4Nuwg=;
        b=unS3GLZlC8+N8vB+jkTZIjwrAF9ozwyTkzqPqlboIqTtPG1pnoLGgE/xhfiQ8NpFBB
         duYFee1q8O4aSUP/vQxz1Lt65CFLtA+EnJuQ71kSVVzo14zNkuLL4wimfBTa3gEXdsnJ
         tlMNJ3teRW7v+alSdmAP9emkDxusTiNCg/vDADn92+UkgwCawHXVXZdLRn3g95w5AC3r
         aZeQToJmogDHo4H2jFaKZ9acb6bvZbZD2k7p05sx0WkO4HfNEbVGJL0qNGwU/V/T2aTb
         meAueY1ZmLmYrzYhdcVPx25UT16jwRiRtUv9dSfOxUHTH1FIL4d+R6L3+LonIWfvU8My
         Jt0w==
X-Forwarded-Encrypted: i=1; AKwUvBwQNO8fxU1eYTsjJmOHBGU79suLkpQNIwFT7bWgFzgyB0GPhpj5a3cx26UExHbuwJH9QJXBzZZ+FBNAhJI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxZyQGqY16GAK59GocG0L6UDPyEctMRFNELbND9u7A9JGm4/i6
	zOTq/XSw9ra0QhC37fxF2TLUJu/5rzhm1X+1CJaVDCVs2T05Jo6AY1IZ
X-Gm-Gg: AYBFou1x1lfeXH15CJpZxgMBxZI55ZEbohVfy3RZqmE4+fnEFYqP4zKArQbeYPTOkKB
	ezNx844fC0UFBBWN9eFWv/xXUQJtkOOO1ho6e8n16hJLeKfmynnXYC9jIt6jhRhPPQ9QgLztu55
	1WTfxyaT1pVE4QknxSxjWkLJo5xgejroM3atX6Sxix+0DE/gD67xmvwJtcwDMlV1qEkKfi08Itq
	5CGnUhS8LUzdlN3Hppnm+DWNbHXCku+gh5/deU1CTIFmoUk3lQ0d9a/MZiGKwEpTA0a0/C38yfx
	vce28TbPqfxeEgELh0hMZC3xX7eh+c6FObhT5GsLbkG4iJfFBDE1OHkzOePVgHKSTzSPDW7BnT7
	hXbBhNwbCvoibG6IP9M2A4GcOr2dKLHXQLSYeSG8Cm4HzsuuuBR+wJ/Un/jO9+GvjCwJDtYicNM
	Pjg5oV1OTBfgIK5rZzexm1E26KTtekYM5gky5jnHAgpZvyQevWcXT5X/6F4rx/IPkgBS6UnQhCt
	B1yhqnnHKSHne0=
X-Received: by 2002:a17:90b:2f0c:b0:3a8:5d1f:59ad with SMTP id 98e67ed59e1d1-3ab3ac9b91fmr17339439a91.43.1792065756926;
        Thu, 15 Oct 2026 05:02:36 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94794dd9sm4086794a91.12.2026.10.15.05.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:02:35 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: Christian Loehle <christian.loehle@arm.com>
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Balbir Singh <bsingharora@gmail.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Josh Snyder <joshs@netflix.com>,
	Kayra Cizmeci <kayracizmeci@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2] sched: Account I/O waits independently of delayed dequeue
Date: Thu, 15 Oct 2026 20:02:27 +0800
Message-ID: <20261015120227.1929531-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <fd8578a1-e60b-4993-ab51-2b5d63abcf77@arm.com>
References: <20261014081731.1068794-1-zhanxusheng@xiaomi.com> <fab66e31-7c7e-4a81-be59-1a4c1458ff43@arm.com> <4ce12bff-9532-4b27-98f2-a807bbccfaf7@arm.com> <20261015025912.1541134-1-zhanxusheng@xiaomi.com> <a71b6375-f460-49fc-aee6-9f01d58163c2@arm.com> <fd8578a1-e60b-4993-ab51-2b5d63abcf77@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

On 10/15/26 12:37, Christian Loehle wrote:
> Save the CPU charged at the start of the wait. Delayed tasks can migrate
> while still queued, and proxy execution can also move blocked tasks.
> Decrement the saved CPU's counter on unblock, regardless of the task's
> current placement, and remove the old dequeue-based accounting.

This addresses what I reported, and the nr_iowait pairing holds for the
paths I could find, including the should_block == false one where the
decrement comes from find_proxy_task().

Reviewed-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
