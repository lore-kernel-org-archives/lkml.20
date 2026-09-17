Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7663CF685
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789621170; cv=none; b=OwX7tOBp41ko3KEXrvaNFBT6tKwiXl43qnjBzc32DXEh1Sele9cmAlOSUKStWFPcQ3TOA68zuuChSKu5m6EthYrs9oTX+GJowFAwNoMxATue+el4VIPGFNy/jx4kKJ2ZuIgsKtIS9PhqjVpqtzd90oIaVwNeXrDGVWfo3JpS1f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789621170; c=relaxed/simple;
	bh=gs/PzXTul/jmGqr89QmFKk4XxkukNlwtIYTEA5jC17A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jjdcShTi2m9cx0Ft2OgFVa/O8kpLRt5+Is7PMp9oLrkjXXAkuLXQEFXHjxK2eoixmbtejwEfpJPeUEK/Fgqoojv5rpmtr8QGYaQVMRATHi5oZmjC95t0cDcQofPmUJ40fVVTE+XrQ5Qpx0TmaaZrtAAdjhOCZmwOre1Bq7QSg2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5+w15Re; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5+w15Re"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d91ede8035so4953595ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789621167; x=1790225967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IGfnNLxYgSH4WAPgBhFsDBjnPoyc1JaktTPCwgLw28c=;
        b=Y5+w15ReCdS9fKgTSy1KUiImQdj1wghWettiSOPIp9BhgnW629xCipYl6xqJ+ALEtb
         ch2DD5c4SkZF2GgqyPAKlNJwYoTqLjxyHCiCCaJnnh5UBi3HwEXtxYaVUuGHjjXAesst
         0HXMx46m8/blrA3NOLvRZbfDzDCHqSTBwa5aYwzXeVpq625oPwXLtdMvt/BtCkvJR4BN
         QoEoh6Blvgc5WAK0UHJte6WnsXxtBx3BgB7tqhS6ztoXeaRZ89ebcgCt06+x+KA9zF8d
         6M6XZaJcf4APamDXjczjen2Udooq0RTjkOZbaseg9KflJqYvIOcVY8l8qdiS85RtK4vv
         xKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789621167; x=1790225967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGfnNLxYgSH4WAPgBhFsDBjnPoyc1JaktTPCwgLw28c=;
        b=yolKyjMkPtqAWhgPNhCHOYM/B6rdH9cdQTbImYUqGvSyqgtUSlpGx9ikH7w/FBz8m0
         5DoFC46rQpBnTggr8HGsTF6OqWE41HK8zQ4R1KBhqGQbY/sBFLstrErqa0QmC82gWILC
         d5oCbjuRwhJtIiM9fumMGyAqOYOHaVM2ksYb3kGE/ZJk32o5c+jVMaXvJaI4E9hLItJb
         nT1f3J+KuwQ9MczIU2DwOM5rkKtDrxRav5QK559ENN6FLjCQaEGKMZD/41wgixFGvUal
         bLH861Y88lHGrKVIWbwRm/V2rKPtzoz519ve83lLLHHu7ShxRnmTxoSulanU4Wv6S3w6
         bKnA==
X-Forwarded-Encrypted: i=1; AKwUvByLPNUQrnx/dPw0lpxql/sMPEXiL0iJxeDnYYbUnksNQ6mqCncKuZmsdD9ToMbAlZCQwUOHxh1LjvPDRXE=@vger.kernel.org
X-Gm-Message-State: AFuF++n6lg8ySQoVq7mBXNOZKOxjOO1Wi3MtZ04ftVQfNmKOQJrrAfuq
	wlzkcgQtVnQ4ByA1UhCZJQMrpelASSQPbdU4jHhwx4Iokr/qCv5lPQx8xR+lYog=
X-Gm-Gg: AYBFou11/r6Zvl2tSWwTwqBBxYVNoZ2MuvKPvXXgm2XAVilvNCPfvct0W1h1c3kVGpc
	zO3LmhYbyngwq0yfXmX5uBIQpoScxiqKt8kb+xpswu4VwmbPv25LDyiaF4wSOw0JnADCvLLXYyR
	y7CCKYRu+JQ9w3CYR2mKkLxKi7XioGl63wJw9zZyvNAZ7LD5Z03a5Kh5H5aabVH+TKWNry/HEmV
	YerdYEyWK6Mi1Q43mc7P4dK1WZhtD+9ZEqv9CKS8SHEWPK/ug6i9tFGJPOgJrUdYQz2MjL05BHU
	F21DJAR6gmFgbxyDWzB5GoOA81YF53SS1rKEDYPnR3jkl4+GhxGRw8MtHQO1WPhCA1FaCaOmtCl
	njNquLU6E6b6bM5mUyRnWa0rOLypQ8vLyRKsL3EhshcHB0F/FIY4kVg3OgspyXKr3RrhKC3xAEX
	3yxhKczvdXzG78lBarmP+0Sk6qZnJ90yy9tv61oJiD9chx9Q8/XdKaMeM9uoiG7nmVko90v1I4T
	boRjAnNFylG4vmVe5ztYeWifbqm5zbTOfywlQ==
X-Received: by 2002:a17:903:1b67:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2dd8e51df8amr114931955ad.14.1789621166006;
        Wed, 16 Sep 2026 21:59:26 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:b6f9:c198:e14b:34c1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89ee0e8fsm20410005ad.53.2026.09.16.21.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 21:59:25 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: mathieu.desnoyers@efficios.com,
	namhyung@kernel.org,
	zanussi@kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH] tracing: Print a signed histogram key as signed
Date: Thu, 17 Sep 2026 13:59:18 +0900
Message-ID: <20260917045918.370993-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A histogram sorts its rows by the key named in sort=, and for a key over a
signed event field it sorts them signed: create_tracing_map_fields() picks
the comparison function with

	else
		cmp_fn = tracing_map_cmp_num(field->size,
					     field->is_signed);

hist_trigger_print_key() does not look at is_signed at all. Every numeric
key is printed with %llu, so a sorted histogram over a signed field comes
out looking unsorted. syscalls/sys_exit_lseek carries "long ret", which
SYSCALL_FIELD() marks signed and which is negative on every error:

  # echo 'hist:keys=ret:sort=ret' > events/syscalls/sys_exit_lseek/trigger
  # echo 1 > events/syscalls/sys_exit_lseek/enable
  # (five lseek(2) calls returning -ESPIPE, -EINVAL, -EBADF, 0 and 100)
  # cat events/syscalls/sys_exit_lseek/hist

  { ret: 18446744073709551587 } hitcount:          1
  { ret: 18446744073709551594 } hitcount:          1
  { ret: 18446744073709551607 } hitcount:          1
  { ret:          0 } hitcount:          1
  { ret:        100 } hitcount:          1

The rows are in ascending order and the numbers are not, because the three
leading ones are -29, -22 and -9 rendered as their two's complement.

Take the rendering from the same place the sort order comes from: the event
field when the key has one, and the hist_field itself when it does not. The
same histogram then reads

  { ret:        -29 } hitcount:          1
  { ret:        -22 } hitcount:          1
  { ret:         -9 } hitcount:          1
  { ret:          0 } hitcount:          1
  { ret:        100 } hitcount:          1

A ".buckets" key stays unsigned here, and not because it is right.
hist_field_bucket() divides as unsigned, so the group holding S64_MAX also
holds S64_MIN, reported at

  https://lore.kernel.org/all/20260914054614.82A9B1F000FF@smtp.kernel.org/

Printing that group signed would name a range that does not contain
S64_MIN, so the grouping has to be fixed with it, in a patch of its own.

Fixes: 7ef224d1d0e3 ("tracing: Add 'hist' event trigger command")
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
Independent of "tracing: Clamp the printed end of a histogram bucket at
U64_MAX",
https://lore.kernel.org/all/20260914132346.2234731-1-donggeunyoo.kernel@gmail.com/,
which is still pending in the same function: the two touch different
branches of it, apply in either order, and give the same tree.

QEMU x86_64, v7.3-rc3-82-g238650ef6c7c, one kernel per arm and one
initramfs.  Sixteen histograms, over syscalls/sys_exit_lseek and over a
user_events record carrying an s64, a u64, an s32 and a u32 - one per arm
of hist_trigger_print_key() that a key can reach.

  changed   keys=ret:sort=ret
            keys=sv,uv,s32v
            keys=sv:sort=sv
            keys=sv+0
  same      keys=uv+0
            keys=u32v,common_pid
            keys=sv.hex
            keys=sv.log2
            keys=ret.buckets=10
            keys=sv.buckets=10
            keys=sv.buckets=8
            keys=s32v.buckets=10
            keys=sv.buckets=10:sort=sv
            keys=uv.buckets=10
            keys=u32v.buckets=10
            keys=common_timestamp.buckets

Every histogram that changes is a key over something signed; the other
twelve are byte-identical.  The values written cover zero, both signs, and
both ends of the 64-bit range.

 kernel/trace/trace_events_hist.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index 8af97fd4ee2d..b128fee0af24 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -279,6 +279,14 @@ static u64 hist_field_pstring(struct hist_field *hist_field,
 	return (u64)(unsigned long)*addr;
 }
 
+static bool hist_field_is_signed(struct hist_field *hist_field)
+{
+	if (hist_field->field)
+		return hist_field->field->is_signed;
+
+	return hist_field->is_signed;
+}
+
 static u64 hist_field_log2(struct hist_field *hist_field,
 			   struct tracing_map_elt *elt,
 			   struct trace_buffer *buffer,
@@ -5568,7 +5576,11 @@ static void hist_trigger_print_key(struct seq_file *m,
 				   (char *)(key + key_field->offset));
 		} else {
 			uval = *(u64 *)(key + key_field->offset);
-			seq_printf(m, "%s: %10llu", field_name, uval);
+			if (hist_field_is_signed(key_field))
+				seq_printf(m, "%s: %10lld", field_name,
+					   (s64)uval);
+			else
+				seq_printf(m, "%s: %10llu", field_name, uval);
 		}
 	}
 
-- 
2.53.0

