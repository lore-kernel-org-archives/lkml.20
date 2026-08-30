Received: from mta0.migadu.com (out-247.mta0.migadu.com [91.218.175.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EDA2D0602
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 03:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788059184; cv=none; b=mCW2Ilx0l58o4mwz8C5MGXIFN5h9yKomvnSKj0sOBvJr/mZHuic0j6K5ewV5wtIL+4vqW+fF30Ny3JUrvWCEB+4Hps6/j6SZCWxrFfJPqtymj3Oz3w7zdl4osMcEyiNRNmbbPbYaKLh8pxIo/wy8yh/fgpf+wl6fwjzbMH9MY6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788059184; c=relaxed/simple;
	bh=qXVdb+IqU2kIMGpTuiVRCYml0ZcRQXM5yPEGZHiM3xg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oaBfyNWtY8SvhNKYNPzjEZHbOrAotkWjO2GWAvNNqc7i9+NWwYiPo6BteSFxecIVEiSAaSw59TPfH5xIP/Yn2ft3dq3cdujLe/cYyN+dycDY221suNbJzxSiTImu6ZvbjLRWY0tUxSg9Y6Z5hnfTTBXxWv0Xy9FPSNYeBKWeFl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pm46zNl3; arc=none smtp.client-ip=91.218.175.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pm46zNl3"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qXVdb+IqU2kIMGpTuiVRCYml0ZcRQXM5yPEGZHiM3xg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788059179; v=1; x=1788663979;
 b=pm46zNl3xIZkfZM/IhrNnf/xOvGCe2l+WHpDZYZU/siwYNPDgphRTDZzu4xSxYi4T0RPNrNi
 4iZnXwstTANlXlDFhwvdWa1xvA9gazF/sH0xQv+1F1tvKd5FFq4eNoN9lByRXqwuXA339I2UwEi
 CcpEMcnq4ngr3pcwFcpjLDk8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3cf237b371277dd9;
	Sun, 30 Aug 2026 03:06:09 +0000
X-Mizu-Trace-ID: 3cf237b371277dd9
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: trintaeoitogc@gmail.com
Cc: willy@infradead.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	harry@kernel.org,
	jannh@google.com,
	lance.yang@linux.dev,
	liam@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	riel@surriel.com,
	rppt@kernel.org,
	surenb@google.com,
	syzbot+395b7abe9696862fc188@syzkaller.appspotmail.com,
	vbabka@kernel.org
Subject: Re: [PATCH] mm: fix the race on huge alloc failed
Date: Sun, 30 Aug 2026 11:06:01 +0800
Message-Id: <20260830030601.90899-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260829180234.435064-1-trintaeoitogc@gmail.com>
References: <20260829180234.435064-1-trintaeoitogc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Sat, Aug 29, 2026 at 03:02:34PM -0300, Guilherme Giacomo Simoes wrote:
>Matthew Wilcox <willy@infradead.org> wrotes:
>>> Fixes: 164b06f238b9 ("mm: call wp_page_copy() under the VMA lock")
>>
>> what makes you think this is the right commit for fixes?
>Maybe I would should analyzed this better. I only seed the commit that introduce
>this function (and consequently this reader)
>
>>> The race occurs because the reader (__vmf_anon_prepare()) checks
>>> `vma->anon->vma` without holding the mmap_lock and withou the
>>> READ_ONCE() macro. Since the writer (__anon_vma_prepare()) is holding the
>>> mmap_lock and updating the pointer, it creates a data race as the two
>>> access are not properly synchronized.
>>
>> also this explanation is bogus.  i don't have time to fix it right now.
>Hmm... I would like to say that the reader (__vmf_anon_prepare) access the same
>data that the writer (__anon_vma_prepare()), lead to a race condition problem.
>
>When the huge page alloc failed, the asm_exc_page_fault interrupt is fired but
>on the same time the procces that was trying to alloc the huge page, try handle
>to this failed too..
>
>How READ_ONCE() and WRITE_ONCE() is atomic, the race problem can be resolved.

This patch should make KCSAN happy, IIUC, BUT ...

Still, the subject and changelog are rather confusing. The race is on
vma->anon_vma, not on a failed huge page allocation. READ_ONCE() and
WRITE_ONCE() do not stop the two faults from racing. They just tell
KCSAN that these concurrent accesses are intentional ... no?

Cheers, Lance
