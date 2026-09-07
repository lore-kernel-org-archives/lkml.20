Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AAA425899
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767948; cv=none; b=pHaSx+Yh5UqBHEVYC63UP81UIfgeuOhCkHKR//lLWZFaQn7kpVYbstXaKDOIYsus2bULh1Q+fK2T5ylFPcDbo8NH8KJff40AFDaxhoHUrhRANbk4o6XmlngDjiXCnhI2pyhnDeePd05MrRJrFCyMy7twhEeOj0PHP+SNIuxPG5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767948; c=relaxed/simple;
	bh=khDfC6/LWD0Q4/Opwx8ffd/lQkWbDpCYUNN+ihTrgFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X25CaU6VwIVsRM8pN6habfexpJJ0CumbHh47ujnZBh22DpYl4gCrMdlV9Ecz9FmhcsnVSYDXdQWh+aTP9ek1wLNArbC4I24cEpT9j66EUEAyYEZgQU1Bzn24CiF0YM4LZRmsnrb66KgaDLiUpEJSfWk8Z9K8QW/bxbhSnjxwHVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jSpatKAM; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jSpatKAM"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d9201076b3so36887005ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788767945; x=1789372745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9xsmNs6fEcfIC053Za2znwufqL6cSMJhGirj52zu9CU=;
        b=jSpatKAMZMsJOBsLXeuroRKLvBwPbNOnw8jrl7vBChQGx8BtBmaaq8rgWR6L4bBqt0
         gQFfFFikBZP7SJcLingRaJczSE7NHpLkXvdwgq/omONk78cI5ANL5rTxJeqxD7NuAx/h
         glcOTVrTT/71ksL4c3+eYPhHHjda3Fz8q2IDHg52oX3CHwbekFepL6x65UDqsKcqPq9e
         veUr/+0+1MnUkUaIAFP3yNiIZ+59ac16me0V4Oo0ppHcU4V2/paeGWtVvhgAJCDuYprM
         DafQvYEQ+wV1qqISA+gjDSNAjuGP9f0zr1NBLerp1pA462/lNZznZFghzRVdRC6lHprd
         xgRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788767945; x=1789372745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9xsmNs6fEcfIC053Za2znwufqL6cSMJhGirj52zu9CU=;
        b=LDhzccB36DSnfU+SahOpDlkPgHfsIsFsR5rufER0NTmb0NdNmALTwsAsM+NDXOgOvo
         Q0DVBhJ8CWl4Lfq0ATiXTZUhDPtlrH62uiqmjs2pznTbV0JXn9XS/xrSbiV3WQQSjAFQ
         0FC8kfBEclLSjZXT6S8MEWt/3kIQCbAruxaashxhBHoYPxkgywjusP6A4B8d13OS0jsg
         Z//RxncD8mM4jWYI9ZPTP9LB018mnOb629RshEjCwdGoixVOML/FToAlSX94ttACIAx1
         tsFR8tmAqr1EvedUpNlDf3JRjus5g004UJe0lTTS8bXXjAzfHpqKzV29oGcDXBmDM/vI
         Dv6A==
X-Forwarded-Encrypted: i=1; AKwUvBwcJaq7qUdHvvkrXwHOHWCpHmdQx6qAJ0S+/9VtgEX+5BZPMQQPEade2yDGdxKdmL1jHE7ZFg8Uh2pXrlU=@vger.kernel.org
X-Gm-Message-State: AFuF++lb8nnsE4wNrKWTjry7WzQPa46cmrJfsAtfXLpSg44vwoFNFAqT
	Xxo/xB2NAGYjvXtNvIAPODO5/v4DyC1bsjSMpCEm5Uc11aU3bws0Ze0P
X-Gm-Gg: AYBFou0G8fpSSqXNcTLO51DzSJb/pzS0PVaGvSmZ/BK63xqRIa4PsvrcIcxxnTFx7eb
	U4Y6oldo55SAoLhGSu7NinDxqKTfLFeAmFehsWb8EQJJgWBN8zIHqu3GRmSDv7HLoFzFgjwS7IL
	BJCWn/9N9pnjJoIWPKW45pEQIXwETC14MRSE7BZbwfUC2dxQk/zeX9HjtumoVM6HhaIQ3+7MI2r
	WR1n1nRiuf9CeX4hfTREsYOiL4HsVMn0nTRV2HoqbA+H9btho5R/bDYXC08zbk6hyOLARCCNSfn
	3wmAduBw+geim7mGJwGGTUuo2n0KSS+UzdmdOlCTw16ECWKzF6esv7DesTc4A69fFc3CpvBLCSX
	oZnCZH+fYTvGLbdo9elTEXB3dxLGJRQULRFI0e8YAgzPzTj0jDQoZCXD1evjpDzScRelyeeBGjK
	8NzlWynncIlxZpkzutwpwqpo+K+r+D/uwvgX6AegnUf8DaHF3tA1S+7j05AXrGWhagjXiJvlatf
	VpBkHo=
X-Received: by 2002:a17:903:1850:b0:2d6:e9f3:9305 with SMTP id d9443c01a7336-2db1232c660mr337912645ad.5.1788767944906;
        Mon, 07 Sep 2026 00:59:04 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae7637sm40945595ad.79.2026.09.07.00.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:59:04 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: paulmck@kernel.org,
	jiangshanlai@gmail.com,
	josh@joshtriplett.org
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH 06/13] srcutree: Make init_srcu_struct_atomic() prevent transition to big
Date: Mon,  7 Sep 2026 15:58:22 +0800
Message-ID: <20260907075829.2073224-7-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907075829.2073224-1-kunwu.chan@linux.dev>
References: <20260907075829.2073224-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kunwu Chan <kunwu.chan@gmail.com>

The is_atomic parameter of init_srcu_struct_fields() exists so that
atomic SRCU never transitions to big, but neither
init_srcu_struct_atomic() nor its lockdep counterpart
__init_srcu_struct_atomic() sets it.

On systems where srcutree.convert_to_big selects SRCU_SIZING_INIT,
this needlessly allocates a full srcu_node combining tree for any
dynamically initialized atomic srcu_struct, despite atomic SRCU
having neither callbacks nor srcu_barrier() operations.

Pass true from both atomic entry points, adding an is_atomic parameter
to __init_srcu_struct_common().

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/rcu/srcutree.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
index 2af36db37fa9..01f224a56b41 100644
--- a/kernel/rcu/srcutree.c
+++ b/kernel/rcu/srcutree.c
@@ -305,26 +305,27 @@ static int init_srcu_struct_fields(struct srcu_struct *ssp, bool is_static, bool
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 
 static int
-__init_srcu_struct_common(struct srcu_struct *ssp, const char *name, struct lock_class_key *key)
+__init_srcu_struct_common(struct srcu_struct *ssp, const char *name,
+			  struct lock_class_key *key, bool is_atomic)
 {
 	/* Don't re-initialize a lock while it is held. */
 	debug_check_no_locks_freed((void *)ssp, sizeof(*ssp));
 	lockdep_init_map(&ssp->dep_map, name, key, 0);
-	return init_srcu_struct_fields(ssp, false, false);
+	return init_srcu_struct_fields(ssp, false, is_atomic);
 }
 
 int init_srcu_struct_lockdep(struct srcu_struct *ssp, const char *name,
 			     struct lock_class_key *key)
 {
 	ssp->srcu_reader_flavor = 0;
-	return __init_srcu_struct_common(ssp, name, key);
+	return __init_srcu_struct_common(ssp, name, key, false);
 }
 EXPORT_SYMBOL_GPL(init_srcu_struct_lockdep);
 
 int __init_srcu_struct_fast(struct srcu_struct *ssp, const char *name, struct lock_class_key *key)
 {
 	ssp->srcu_reader_flavor = SRCU_READ_FLAVOR_FAST;
-	return __init_srcu_struct_common(ssp, name, key);
+	return __init_srcu_struct_common(ssp, name, key, false);
 }
 EXPORT_SYMBOL_GPL(__init_srcu_struct_fast);
 
@@ -332,14 +333,14 @@ int __init_srcu_struct_fast_updown(struct srcu_struct *ssp, const char *name,
 				   struct lock_class_key *key)
 {
 	ssp->srcu_reader_flavor = SRCU_READ_FLAVOR_FAST_UPDOWN;
-	return __init_srcu_struct_common(ssp, name, key);
+	return __init_srcu_struct_common(ssp, name, key, false);
 }
 EXPORT_SYMBOL_GPL(__init_srcu_struct_fast_updown);
 
 int __init_srcu_struct_atomic(struct srcu_struct *ssp, const char *name, struct lock_class_key *key)
 {
 	ssp->srcu_reader_flavor = SRCU_READ_FLAVOR_ATOMIC;
-	return __init_srcu_struct_common(ssp, name, key);
+	return __init_srcu_struct_common(ssp, name, key, true);
 }
 EXPORT_SYMBOL_GPL(__init_srcu_struct_atomic);
 
@@ -414,7 +415,7 @@ EXPORT_SYMBOL_GPL(init_srcu_struct_fast_updown);
 int init_srcu_struct_atomic(struct srcu_struct *ssp)
 {
 	ssp->srcu_reader_flavor = SRCU_READ_FLAVOR_ATOMIC;
-	return init_srcu_struct_fields(ssp, false, false);
+	return init_srcu_struct_fields(ssp, false, true);
 }
 EXPORT_SYMBOL_GPL(init_srcu_struct_atomic);
 
-- 
2.43.0

