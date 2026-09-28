Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4913A3E9A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617043; cv=none; b=EeVa1GUonGChmNaPOVol+pWjwKyntbPY9TYBZeMugqvY1AL1CwU3mDeG+Xy6RIc1zT0XjALhDVcXzmGoPDqxu5t9ZCysq3cASIEi3RZmOzenAcg2ksxaYnb+llpYCHnlup9QhH2pNKTVsfUMFqy4yitsljpjnWdEbfEBWvSuzvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617043; c=relaxed/simple;
	bh=5mHtFBAg26QKU8dVMlRHFnW8y7AdoS7TKkzgUtwngWU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HHxtEcaxyDRajBnYSrSAz7vg/Yb316rk8y536rpAZQmmHjciAJrUjGV+WjFkBl7ZXbEvGo5qJV4f2BKakYwu9agSkJ5njkmUi1nIdwVWiYvTnC/3ZMRjpYJxWNBmu08hPU9MPNiG1IlQ9l4A6pBhZpzk3o+Dts7ugzN8pNVdwx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2OPr/0w; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2OPr/0w"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so19059725e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790617040; x=1791221840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vaR2wWHbg1jftSpi3ap04pX9MAkuCDlgGH8GXKfd2Pc=;
        b=F2OPr/0wVVxuufTjiSB6AhXnOxKQbHKCY4HXlksdD7xDlXdsJye57KAnl+karBV5bN
         tBeFHq20jnshE8YYcMX11pPmcxOEbRm1QGakAsF6D2btvqd4ZoClTQpLLzBMVMb4hMUn
         C2hde07AMzkFo3jKaBu7JtGnlAjQh1IY8WWuh2BnZwhw8DTGqj6SSg4Xu8CUslgpCT1b
         GO4i8o1Wyj09ZPvoImWpP1RiHWC9bYkWQX8XHnL9e39LMX9X0jMPGoKRuCWMvp4XlLG1
         ciubGQnprBtirWmM3PPf8NIw6+VruHBiEc5gl3cyFgE+/NUNwyK5IZuryzVfflAf4UxL
         Sf4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617040; x=1791221840;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vaR2wWHbg1jftSpi3ap04pX9MAkuCDlgGH8GXKfd2Pc=;
        b=dox1shyJL+TfAPnULUisf058vz/paawgN75afQet4az6NDbYosgV+L4bkJqGea7eGo
         v2andoF6MPenpRmAWd5+cgrviPY0WtjQIT5tDj8onQdfI35WjtNRD7/X5Wm/4C2q5M1F
         gRUR48MmyFB1t7NbqfKy029iNHqbgbmEfyapqtbuLD8XRWfah90cvLVJBQMO+ujnNodf
         DmbvUn/Zbl1+GlaAoa2PaQENSFQjXZ4HDcTSyKNpVjK2UtvQWRNgpI+fBgw3wXuHS5nH
         WAJZygYBVFNfNo4Pru1lxGv9aWAS30CcwgJF8FrqW/fuQGV4QAYaKteebBBx24vAFkpM
         w2hA==
X-Forwarded-Encrypted: i=1; AKwUvBzCOvgmIgFg01TNOWXQoWchbA7ZwcCcoSah/ces9cFy7JrqcFJ14evtvK2NfH9JeJWTISE6fXbT14s6pY4=@vger.kernel.org
X-Gm-Message-State: AFuF++kJexGdc7jOVSgix/ckWlG462OO/7TUzGc22wIDTPFhT/QhFRep
	KGgCtZ1p2qEBeF4Zfx2lfBmqZlKyKYBzE7rOSiQU71FBSYCiezHOYl/k
X-Gm-Gg: AYBFou0YJIGeN3TaWEbBFrpd58Y5M+zi0TLPa54I+16+tr73mCqmJ29eucsn8bhOm+T
	8rdqKXevsu6ftN5znj+ha6xNoJIBijLgczV9bsySCo5rBetligCdcxS75Bl/qTM3ke/+gO3EdsT
	oVpLHc0+lIGgO+5VamhNvQ1/r3xesT2IGrbuaX4GPBkSlXhMDEei6u8xmh8blkBHOlFvkXO9bXB
	ewOOS7ExdNDqdtMrqBcCD/jmHer8UBxAr0v/4rTLptwk8Zq7gubr7m56nv/Hyv8mKM9yDm6MVUD
	o5Bj2ZyzsrSwkhzJUtMtceppnN5xVlW2mXETa7OGnC1jnML5DOegm48eJID8QQKmR8+cylVPmoB
	GpXC9pNIHUyhed8eCLZ5QxOEJts8A0csGVQjWLbRV9VaFWtn2oFSKha3OtlwGgPQV/hvd24Mw4w
	Ug0LRdq4X1IVT3DWFH5xBEMpJQ8mYzDVZeDOXALRl+fk77yfJ23lM1PuOeLQyNkK5I7QsA
X-Received: by 2002:a05:600c:4689:b0:49f:fe48:d171 with SMTP id 5b1f17b1804b1-49ffe48d27amr112540905e9.35.1790617040134;
        Mon, 28 Sep 2026 10:37:20 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d10bb26sm5446595e9.0.2026.09.28.10.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:37:19 -0700 (PDT)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net
Cc: john.fastabend@gmail.com,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>,
	syzbot+fd7e415d891073b83e1f@syzkaller.appspotmail.com
Subject: [PATCH bpf] bpf: Fix smp_processor_id() warning in rhtab_delete_elem()
Date: Mon, 28 Sep 2026 20:31:36 +0300
Message-ID: <20260928173703.504474-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

bpf_mem_cache_free_rcu() uses this_cpu_ptr() which requires preemption
to be disabled. In rhtab_delete_elem(), this call happens after
bpf_enable_instrumentation(), so preemption is re-enabled at that
point and this_cpu_ptr() triggers:

  BUG: using smp_processor_id() in preemptible [00000000] code

Fix by moving all post-delete cleanup — rhtab_read_elem_value(),
check_and_init_map_value(), bpf_obj_cancel_fields(), and
bpf_mem_cache_free_rcu() — inside the bpf_disable_instrumentation()
section, before bpf_enable_instrumentation() is called.

This is consistent with __htab_map_lookup_and_delete_batch() which
wraps the entire batch operation including element freeing under
bpf_disable_instrumentation().

Fixes: 6905f8601298 ("bpf: Allow special fields in resizable hashtab")
Reported-by: syzbot+fd7e415d891073b83e1f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=fd7e415d891073b83e1f
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
Tested with syzkaller:
- Before the fix: the reported warning was reproduced reliably.
- After the fix: the warning was no longer reproducible.

 kernel/bpf/hashtab.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/kernel/bpf/hashtab.c b/kernel/bpf/hashtab.c
index f744a42bb813..8cc07e54daaa 100644
--- a/kernel/bpf/hashtab.c
+++ b/kernel/bpf/hashtab.c
@@ -2979,19 +2979,18 @@ static int rhtab_delete_elem(struct bpf_rhtab *rhtab, struct rhtab_elem *elem, v
 	else
 		err = rhashtable_remove_fast(&rhtab->ht, &elem->node, rhtab_params);

-	bpf_enable_instrumentation();
-
-	if (err)
-		return err;
-
-	if (copy) {
-		rhtab_read_elem_value(&rhtab->map, copy, elem, flags);
-		check_and_init_map_value(&rhtab->map, copy);
+	if (!err) {
+		if (copy) {
+			rhtab_read_elem_value(&rhtab->map, copy, elem, flags);
+			check_and_init_map_value(&rhtab->map, copy);
+		}
+		bpf_obj_cancel_fields(&rhtab->map,
+				      rhtab_elem_value(elem, rhtab->map.key_size));
+		bpf_mem_cache_free_rcu(&rhtab->ma, elem);
 	}
-	bpf_obj_cancel_fields(&rhtab->map,
-			      rhtab_elem_value(elem, rhtab->map.key_size));
-	bpf_mem_cache_free_rcu(&rhtab->ma, elem);
-	return 0;
+
+	bpf_enable_instrumentation();
+	return err;
 }

 static long rhtab_map_delete_elem(struct bpf_map *map, void *key)
--
2.55.0

