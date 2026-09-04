Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB8E3ACF02
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788538774; cv=none; b=ubHADVuTdkR5nxuK9emqwbTLOGbRyQlnc5RjOXSTPwlqYieTAMzzraaeVfboH+/rPLmiov+YvobMFQyE9dCwF7F/FPTtYAHaapUZRL/Bfnagg9O5g9S1/Kye6/fP95c0VioZjt8uC1B5HVCWXw2NYyT/6nAnq6Gh26O0sA5yPOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788538774; c=relaxed/simple;
	bh=2zXPDVv9DWVuqKuwGs8AmecwdpmhWKbpNz68uca2qa8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dGHgujTcAReeLpF+4KFIOGER40P8e89j3+6yg2qYFS54I1RC7+JHLpExtlPvpadxBn3J06NB6OyOL6Scof8I131Uvng8jZdXOnjl//HbbBQrytSEIj/oHfcOEv2hW3zKv/9ArgrusPvKQiu1r3LehWAzeGUbq7bZktTaRDGsKyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CIjW7UwL; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CIjW7UwL"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so1362725a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788538771; x=1789143571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2zXPDVv9DWVuqKuwGs8AmecwdpmhWKbpNz68uca2qa8=;
        b=CIjW7UwLgSOYR3BuaqqgJF1B8h3tcBp3mpk0m4fogIJ57e3bplIdVoKO+05FVn2GjC
         Y2VzmFbKobnpHcM5bo+6nU68S5ZuAnVmQRO8KCHue47w4sJzn/YzdXqb80L3WrnmwloQ
         9TWP0CfRHpfhDn9jlMhZx1YyAAxJ/x22j5UYhRDagO8c/Ahiu1IM7IxU09bHvueGZvRe
         dLREA9l8jSPb2mzEizLuCKQq3uXkLsExPz7hqFMQ0qCNjyjAoKvE6SZiiXahZrAjfy1g
         5NUGoVsSmz3CbNLSXEgc5yoaHbK0yF/JqH0yjr2TdbGb+/26dJR++pRGvQbWEFAxr4ci
         YxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788538771; x=1789143571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2zXPDVv9DWVuqKuwGs8AmecwdpmhWKbpNz68uca2qa8=;
        b=Thc7k0g717MVamQsmOW/GazAy5O0d6doXQjrRlSzjouoK5wnDlI+fj4mhzqo//8JGX
         K+vD5ECCVGhnBpPPH3L1wT2edaaCcDpf0S84HGoziskr30QB2Ks15Ex+R35gsCzHFnt7
         NVShHJXlCFUnJh1r8OSHTuk42k3tf4Za/mdEILrcgHGAPjtwsyHCvMFaCiwoaalVFQOe
         EOv9yjqpkQxNo2BJxvn8/j04aT4CIAzp+VfK0R5qMWBKHd68bP4SS8v2ATVTMZCTU8/r
         YyFEbNrLF7vTJsd0ugo834SA4HzdO1OXej30eDewWi7kPqr6PsONTeh0IoA0jUOEBxt0
         93Og==
X-Forwarded-Encrypted: i=1; AKwUvBwKRAXaOVhyXHppeWPnlB3XIhzxfSsnFmgd2DIN+oz/oQPS/E/2Kjzf6+B7XXmOJdhnltBkgBLrZbuaF38=@vger.kernel.org
X-Gm-Message-State: AFuF++lPyIER5Kj3414Txb7LVAZ5mLVG9F1AjZ4t/t+claeUFd+QWaUv
	jwNHqINyvPSP0Gb2hPhs0ifvZ7syqT/IsiRf8zW2iXn5TuAprLscfAoM
X-Gm-Gg: AYBFou0kFoDH5aYlJ1gm+SE6dd55HbGmWlB65IfePKavXzlaEj/Gvl77+kZx3pqIgwi
	opE3Hari3jlfEoBYpoZHqtg0XB7u7ryR6cUvcyPkWqN1Oqw7QYpdnuFDH+0FJacUhl7yXiq7R3K
	t7gYXb5ls6glyG0du2hXfmyJi//RLQ+PafcesLbnC5I1Q80cRMM5PjZ2cddWWR+0wQGENtb+Iws
	Yt5uxXpdqgIe2CnUkL3KiLZOJzLZpDGLF7PYRM9Sg10x3dOBFuTqE1VqjEm+wRUgVOxq6u+Inbj
	HpR/AhlAyfIeCZ8NcHqOpwq264O5rLOhrWHbdWk52JkG/PZinOQkzq6NEZPQPrQL75fyxiRkjs3
	TdrDBYwZdn6pCzDE0LRgr4BLDIw9pj20Q9PEOo8djNlS2Yhyaa8OvtvDDNvL83Wf7Sowb1rBc6X
	tfJlS/X8ZwYFdO0+/x9IYstHoledpEA/HuSenCExw5Wg7juA9nGMaN4HVcYX4EiMsiwKosp1u6r
	STgA1Q=
X-Received: by 2002:a17:90b:3b41:b0:398:9bd3:d6d2 with SMTP id 98e67ed59e1d1-39b27ea25b9mr4820326a91.12.1788538770923;
        Fri, 04 Sep 2026 09:19:30 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260f64ecsm5149043a91.8.2026.09.04.09.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:19:30 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
To: aliceryhl@google.com,
	gregkh@linuxfoundation.org,
	cmllamas@google.com
Cc: arve@android.com,
	tkjos@android.com,
	christian@brauner.io,
	surenb@google.com,
	baohua@kernel.org,
	zhanghongru06@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v3 2/2] binder: add install_mutex to serialize page install and shrinker zap
Date: Sat,  5 Sep 2026 00:19:06 +0800
Message-Id: <20260904161906.67595-1-zhangbo0325@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260904110448.23086-3-zhangbo0325@gmail.com>
References: <20260904110448.23086-3-zhangbo0325@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the review. All three are valid; I'll address them together
in v4 by tightening the roles of the two locks: install_mutex only
serializes page install vs shrinker zap, while alloc->lock (spinlock)
exclusively owns pages[] and the LRU. Details per point below.

1) AA self-deadlock via direct reclaim

Sashiko says
"binder_install_single_page() acquires alloc->install_mutex here, then
calls binder_page_insert() which invokes vm_insert_page(). vm_insert_page()
can trigger page table allocations using GFP_KERNEL semantics, which may
enter direct reclaim. If direct reclaim iterates over list_lru shrinkers
and invokes binder_alloc_free_page() for this same allocator on the same
thread, the shrinker callback will unconditionally try to lock the
already-held install_mutex."

Correct. In v4 the shrinker uses mutex_trylock(&install_mutex) and skips
the page (LRU_SKIP) on failure, so a reclaim recursion from the install
side's vm_insert_page() cannot deadlock on the same thread. The original
shrinker already used trylock on alloc->mutex; restoring trylock here also
removes the ABBA concern with mmap_lock, since a trylock does not
participate in a blocking lock cycle.

2) RT task livelock on the -EAGAIN retry

Sashiko says
"a race window exists where the shrinker has isolated a page from the
buffer's range (causing list_lru_del to fail and return -EAGAIN) but is
preempted before acquiring install_mutex. Because the mutex is uncontended,
the allocating thread acquires and drops it instantly, thinks the shrinker
is done, and retries. It will again find the page installed, fail
list_lru_del, and spin in a tight loop."

Correct. The root cause is that the current approach splits the
shrinker's pages[index]=NULL and list_lru_isolate() such that
binder_lru_freelist_del() can observe an inconsistent state. In v4 the
shrinker performs pages[index]=NULL and list_lru_isolate() together under
alloc->lock, so binder_lru_freelist_del() always sees a consistent
pages[]/LRU state and list_lru_del() never fails. This removes the
-EAGAIN retry path entirely, so the livelock cannot occur.

3) Use-after-free from clearing pages[index] outside alloc->lock

Sashiko says
"By moving binder_set_installed_page(alloc, index, NULL) outside the
alloc->lock critical section, a concurrent allocating thread holding
alloc->lock in binder_lru_freelist_del() can read the stale pointer:
page = alloc->pages[index] (which is not yet NULL). ... When the allocating
thread resumes, it will pass the dangling pointer to page_to_lru(page) and
page_to_nid(page), dereferencing the freed page_private."

Correct. In v4 pages[index]=NULL is moved back inside alloc->lock (together
with list_lru_isolate), so binder_lru_freelist_del() reading pages[index]
under alloc->lock can no longer observe a pointer that the shrinker is
about to free.

v4 will carry all three fixes.

Bo
