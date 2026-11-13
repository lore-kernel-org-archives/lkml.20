Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590606;
	b=geZ7XQTAFGrj2islPeqenfMy2gsG6di6TG0XqeX2Rn2wVpv2GUnuziN7W8oF4h15xUEJ
	 kyM4cthBQHRTO65Nbds76oW+iAGEQ6oRcjqyGi9Zc5qOz9nqZyDCIiVt2HB/MJ0WMf7bI
	 bYjdaDlQGfad1eykN/pKRIr8/0hn5gojOuAjIjwYjEmzzvMd1cWhsOqpq/icFFnH2k/t0
	 IQ70rARtHO7Fr5CYdnUIWm3BgHX+dv2cRg5lp7KArVd753jyT6TSaiQ73VE9cpvN/hO/d
	 YeKz4tihQAmJ2UGr+ky+4fkutDX+IZEr+khJdy5VrIztk9jFVZoRhCRzQHxsBA2Z+Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=yu5QMzc3QXUklBl5GRmDPmTAJYce2ooMnlaR9b715Do=;
	b=4VwOJCQyAhcC1h93hgh6VBdseTLDiLRavcxrd4I4QnbLylEWbqADx5prI/SyX4II7SZN
	 D49YHGDZ2JZVC7ezCiNJ6J+4rU7x2reE0qYzfnlxLvF4GqO04cnttOngKCuIB+JMiG0+W
	 00R6pbQOmtP+KIr6IOyhBqKyeKRxH44uhi4EC1Z/qqoxxpajv2NFTcJG2sQtYi9qxxT5P
	 HJ7pbHdah42xNV53WbhxXJksYiVsmVGcvibtOgwbV8F59WxmenH1Ab2idBCnxEvD6Fwy5
	 mkCCfGuzAoW1x9Fr9iYJqDf9hid2wlYfgbfydUtSY6QmGH43NLHtEITVcQlRrNMNu3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b="xkc+l/Ri";
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EA66075E04
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5EA66075E04
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=xkc+l/Ri
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso640405a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794590605; x=1795195405; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yu5QMzc3QXUklBl5GRmDPmTAJYce2ooMnlaR9b715Do=;
        b=xkc+l/Ric1gBL/XJaF/g07pdXD3EjnqX30zCqgLh5dnb/W3Y3Q9ZzcPLGVnPIEW8I5
         i6wkzU4MylRS147v7U//alMndB9TXpOJXn0KrJJ/w0VKZJ/QDLctzKQtDx2FUPMqQGe9
         f89nfb9NApy3X0lORFb/a89MIDaaSpv1Mp310=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794590605; x=1795195405;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yu5QMzc3QXUklBl5GRmDPmTAJYce2ooMnlaR9b715Do=;
        b=Pe+H261TklDJ4VM/nbFzCmcZtV5YZu2Uukn9thxdgDHgOBnVIdHdILTE2yQx4Vu29G
         t07VKY+jGnUkIi5RQ+GKivY/xEiAp/Qqt6R03THly1EcFv/IgzMEf2d4491jPB98UpqM
         Rhk6sWxS4BwoqHcx5GWMQaF4mRRr5xEsvOMh94re75sRejOU5YEYS5xtUWC8YxZEsRpA
         kM1Kew3ydp2mEPjMasiFbXbeP0LoyyYByCq4Opa3b6PE8GBXU2m3OiJ3X4GBCToE/xzL
         5GbLGjJhGcBZ9x7DVFdhxMvi+UkP1Lxa/ph141aVnrMKecgdNwk5uNzJZ8g6q3uAcJ8A
         jv3Q==
X-Forwarded-Encrypted: i=1; AL+hErG3QQ+RZ1nz+jwthSKhWVL9oX4xmRU3F5Yp73WcD6rvAsI8i3H/RLIrfDtUh3I5ccmZgKrbz+1lz8jYOW8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IIPC9VGtvb0PTPi968ix+KCerc4o3ct/85eSOCiLMkfG2QymG
	tCnDUIhoDpWjkOcSyZ6VDLQhCcbFvKir6hl43t9mKusBGdCjbm5uYcFMR82ehoJtRiY=
X-Gm-Gg: AYBFou0HQaaKoJzl03Mj4nBvPrkNqcJQXGxvDm1FRwzN+/gKdeHbxEK67dVqspE1xk8
	YyCc9C+3AuD9R0rjeUymtdhoBrAF6cLg2UrDX6fvs91W9Hq/HwgVcT6aFG7ZUb79dMzSD0fOmkA
	snwWvDw4vWyL90/rumtcRsn/oLT9bMSo+pmXuWFlr1XPjsJeXZ+tSMflZ+uPTeksu+OE/kM4RSQ
	TrbFxGzvGfFp+71n5XQk+8N1uwrjJTQ4Fsr08H9Dlzlc1YzpiLhPzIrOKPxvrlU8S7SqpXIAf3d
	jYrXCpz9bMS+qz0w+8jFeOxN2VHRGa4xLKasINi94l+/YAeDa8z1Q++g7D/VPMbLHnwE7sDkAy1
	79zVazxljSyFjvMvKPApjP5pvMe4ZdK3x30FAWPrrZq2pYD0c6g4J91Wdj+JqOIMEBfH2+5Q1bo
	yeHHearBIrIBDuyoGU7MjMpMaxZKPHRGtLlNbX4EPY1cH1Eqd/BhhSBoNFohdC4gCwtCNxkN5+B
	O+050SChdQ7W1RcxFjW/A5AlRutl9YD0NMCiCK8AYV8Bu5v7z1io749boWiqyokiyXod5Mwg9CK
	6CRDPAXYGCAS+qBzLb7yAxqFX+7NiU94MEphgQ4FBhgc9gKxS+/MZrer2g4naLJiOYu6Mp2cJ3A
	rmHKHH4/yq/g+2QeAiHafoicIfnTyRnsZVFsAweecQPA4FC4sWAB5S4z6S42pfg6fLsyWVkNxZ1
	vD8BEI8NSY5t6RrA004U/XrU7ZLsI3pbZWBqCJXjkmHy8mIVPRtGP3fIiKcos=
X-Received: by 2002:a17:90a:c88b:b0:3ac:a6a5:5757 with SMTP id 98e67ed59e1d1-3b1b0b5beadmr2012590a91.11.1794590605026;
        Fri, 13 Nov 2026 09:23:25 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae98151dsm5319144a91.2.2026.11.13.09.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 09:23:24 -0800 (PST)
Date: Fri, 13 Nov 2026 09:23:19 -0800
From: Chris Down <chris@chrisdown.name>
To: Breno Leitao <leitao@debian.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Julian Sun <sunjunchao@bytedance.com>, Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>, Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, cgroups@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2 4/4] writeback: report a slow writeback wait once per timeout
In-Reply-To: <20261110-writeback_stall_report-v2-4-9e0ed75074ca@debian.org>
References: <20261110-writeback_stall_report-v2-0-9e0ed75074ca@debian.org> <20261110-writeback_stall_report-v2-4-9e0ed75074ca@debian.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261113092319.f975912d92c98651@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Breno,

Breno Leitao writes:
>The flusher only checks for progress between inodes, so the wakeups now
>land on the first inode boundary past the timeout, a bit more than a
>timeout apart. The hung task detector scans once per timeout, so it can
>catch the waiter between two wakeups.

This does happen in practice. With your null_blk setup and the timeout at
5 seconds, the waiter gets woken every 5.0 to 6.1 seconds. khungtaskd
reported sync as "blocked for more than 5 seconds" in one of five 40
second syncs with the default check interval, and twice in a single sync
with hung_task_check_interval_secs=1. With hung_task_panic set, that
panics a machine whose writeback is making progress. Stopping these
warnings is what 1888635532fb ("writeback: Wake up waiting tasks when
finishing the writeback of a chunk.") was for, so as Jan said, the wakeups
have to stay below the timeout.

>-	done->progress_stamp = jiffies;
>-	if (left && timeout && (waited_secs > timeout))
>+	if (left && timeout &&
>+	    time_after(jiffies, done->progress_stamp + timeout * HZ))

But this check can't stay as it is once that's done. progress_stamp is
reset on every wakeup, so if the flusher wakes the waiter every half
timeout, this is only true when a single inode holds up the flusher for
more than the other half. With the threshold in writeback_sb_inodes() put
back to timeout / 2 and the rest of this patch kept, the same test prints
no "has been waiting" reports at all, only the "waited N seconds" line
from patch 3. Going by the code, three quarters of the timeout would
mostly have the same problem.

The report_stamp you had in v1 keeps the reports apart without touching
the wakeups, so maybe go back to that and leave writeback_sb_inodes()
alone? That also gets rid of the duplicate from wait_event() checking
twice. With v1's report_stamp on top of patches 1-3, I get one report per
timeout and no hung task warnings.

Thanks!

Chris
