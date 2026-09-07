Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBA04E80AC
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786218; cv=none; b=LAw1g2wVMG08JZ+xCYGc9tqWiwWt6wJlReV1RV31KmVJI+hf8wZ9EnX4v5CAbkujSGHwhVse69ysgJzV1FWPq9ol1/zc3jmlswbPGYcowomRmhXrU6zPOSrLXrgmaQQ3I5Kb4kdKv3/D2BBjX9kb2prqrlCAoPqkH2OSUb867gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786218; c=relaxed/simple;
	bh=ZUkxa32wVg+v+WofZ8nomK58s0iux4vXEaZNp8/xzTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g7iiOE/KfGA4Fb+Xv75orBYcX3cFTaZLNElAzzxgKwWcgCb41ze84qquzuywryOTL73I8NUt2xFr2IvwL41qvlhp9skB3C4hB4iVMbs3R0BY5DOtApylxkiyx1KT05i8sT03E6w1BDaG1911zi/5yS2YabzNruaQOewarBn/ayE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qWqCp9T5; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qWqCp9T5"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-398a384b5f7so1961898a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788786200; x=1789391000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X94qvMDwd78sy0TddN+J3BHx1gatheoLmhmvtOWGjgM=;
        b=qWqCp9T5mXY0x92F1VOSH/MIj+d/Ym7kwyuEOGhNjpqxZjLA+KE/lSiqBev47PykeF
         0gtfliT3k5ysbaQ2l69iC7ZboeMus5Y0SibbRd6z4zD5AxOHtUpBOlBxGxjKwD1Q3/OD
         ujFkqDTIj93Q+8cUnHYWuHtwEgc328H8Esd4ZQCOn2a+kGl3A/bSRljMGm8KNlDDObqd
         XNr7lAEVXkGqkUe9WClcGcz5Myih7FzlRJzUYGLXcTJJqGVUtnINZiHlmv474kurIWDN
         ECDaMCjdN0Htah5hFAF2XHo6yqs61tY1RHisY+RsGuI1chDZggpTfmbDhmWVLV5eQatD
         ZxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786200; x=1789391000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X94qvMDwd78sy0TddN+J3BHx1gatheoLmhmvtOWGjgM=;
        b=b6TC2JTADFqZ9X3PCXdlb7sY8yNCRVfexTHPUcEg9YeCNa6ChVo2MzTcrakn0Fz7CT
         iT6BycBIujxjWzmJvnY6zgO1ahosFzWz2pfzMs7DpSIunE+remd6MU604DX1B9furvbM
         q9wCXslm3L/YHr1tf9nfe7sGh9Gqkym/tg06Ne7ahUN5kdUDMI1AjaznJMKmivuNTvG3
         1kFKJe/GWzmpRrFHLFPFG6ztcj/7IbEFIPFM4X/2lMQENKv0UleCTfV+FaubE7IX0/da
         JiHc7jxtYpdpKvwSnpDGPkGrjrMTknE9o8cA5rRg4zzBQYUpQBnlyPCtGcwEY6PNfTNb
         /czQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1IgVjGQ0cg6Gi2KJ8dfSzD1EMPTl2obhlR1juBQ48Be1kLFgr9kAge0Dwqszzrg/5SMnboZDHXk71sLw=@vger.kernel.org
X-Gm-Message-State: AFuF++myLraUphJacM+uIEX9EiGzJW1Y0ckuZ62yqRFdBHK/DyQ68QD6
	vL1kHtY06Aj8ATkdtIILbWXULM4cxe2MsPoGiVJZOl9OyCGOWtUsFFtw
X-Gm-Gg: AYBFou22JmAwQs5xBXAoQdKKq6Loh+YMLSK9uG15a/ce7tyyEM+H8fg9a2lqwOy9Guv
	pR7MGXf2W/4gDUwK4vd7MV7JLVI2jnlqhQ6RHadsTdi4WVB8yPD+6xlGCdHNpolG6W9Crg1KHTU
	FUTz/9zt8thySU1GkI2bmTqYcaxNz/hhJ33jwDiS4Je6fZgcdiBzZRC82Mdd44d0gE0liJxRWHm
	2nHJlvIkJbpWbEvubcBK8C8SaUE9HQvtMT9BgSV9ieaAVdUiAfRN6xlfDZf08E3EbcizX4ESTM5
	2Tx+xSBa/zmy/JkuFvGR0YOgA1ssgMcB2VKABCvafqzyJrbdBLDTPi36fOSKJ4mhRg7Eekl+Gjq
	a07j9seGZNaWVZhLUkGUPbBzPjvTJspoNNeRjqrcTybGfor5g0HMXphskfJIL0Q0P5ie6e1zGMn
	S1g28MstvP14z3PU3D7f0Mfe8z/jj8fb0AsVrAnM76+Qz1KhqR1kpgsN+nob4SBygY4sfp6Z7Rv
	S64iTG7SJ9MZWqDjcWeEW53AuITB5i3ZFMC
X-Received: by 2002:a17:90b:1343:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-39b261b1bcfmr40426102a91.16.1788786199885;
        Mon, 07 Sep 2026 06:03:19 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08cacba5sm28259693a91.12.2026.09.07.06.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:03:19 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
X-Google-Original-From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net,
	Barry Song <baohua@kernel.org>,
	Juan Yescas <jyescas@google.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Dev Jain <Dev.Jain@arm.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [f2fs-dev] [PATCH 03/14] f2fs: support regular file buffered writes
Date: Mon,  7 Sep 2026 21:03:13 +0800
Message-ID: <20260907130313.2626386-1-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <83fe187e-e3e8-4328-bbbf-a6751873b9e0@kernel.org>
References: <83fe187e-e3e8-4328-bbbf-a6751873b9e0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 27 Aug 2026 16:56:53 +0800, Chao Yu wrote:
> +	/* Wait for pending drops back to bias which indicates all bio have completed. */
> +	while (READ_ONCE(ffs->read_pages_pending) != 1)
> +		f2fs_io_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
>
> Suspect there will be potential performance issue, as timeout interval
> is large.
>
> Looks hacky.

Thanks for the review.

Maybe we can switch this to an event-driven wait instead:

--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ includes
 	#include <linux/fiemap.h>
+	#include <linux/wait_bit.h>	/* wait_var_event_io / wake_up_var */
 	#include <linux/iomap.h>
@@ f2fs_submit_page_read_sync()
-	/* Wait for pending drops back to bias which indicates all bio have completed. */
-	while (READ_ONCE(ffs->read_pages_pending) != 1)
-		f2fs_io_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
+	/* Wait until all bios have completed (pending drops back to our bias). */
+	wait_var_event_io(&ffs->read_pages_pending,
+			  READ_ONCE(ffs->read_pages_pending) == 1);
@@ f2fs_finish_read_bio()
 			ffs->read_pages_pending -= nr_pages;
 			finished = !ffs->read_pages_pending;
 			spin_unlock_irqrestore(&ffs->state_lock, flags);
+
+			/* Wake f2fs_submit_page_read_sync() waiters (if any). */
+			wake_up_var(&ffs->read_pages_pending);
 		}

However, this requires an extra wake_up_var(&ffs->read_pages_pending)
in f2fs_finish_read_bio(). I'm not sure whether adding an extra
wake-up in the completion callback is a good practice - what do you
think?

Thanks,
Nanzhe
