Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793773854;
	b=CpHb/PLYT4WD6sHTxXcqg6P5HQl5KpIyaTtR3uYwTGqyH6yliao4I00Xj8lH+FoZk3qW
	 nBd0xtFeYp2u+nugQCmL+D5M073q8sgBg2ha26v0Nqh2bk3rbaoQvu5iBQr4aUcAsP/FF
	 4UGhubqvDSoGzs89lDDvdwWZjVcukSBEdc10bUtZJoxK7DC4HVDjdZWdMCCFhcZN+T81r
	 TwXl43dqlRRhX5OfhwXwBAXHVlDnhS8fqREhswIlBjsl4F722vPh8lnCe7tOJG6fDMGBc
	 CjrDrznarlw10sol3Y3gPVbHaatp6l/0JDaEiuMhs46irVkXlVv2d2vk35dkcZntsHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793773854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=nxObPTj/uIUEGHfeQ9adXhEvppId2c7V0+NPSeSoNZI=;
	b=HcDg17hf5ccZACW/wBtkDQ9TdWD7asoJtdQOyc5QMNVXlMazoezInBxzn0cSy2zDyzYm
	 4cCA/+R5ii5zZ5LeUVtYKY3Jn1gWInEUKK4c5FX2EU6gzR6OSQqXR507fcZW/QT891S8r
	 zCI28IkwqMafpV4elysml05XTcXB01X5c32AMqmvCJvIQBK5ftm7nUd/RW+CKuTimoaVy
	 FnxYU8qfDD4EZisBaTfE++17x4N5fLyQzMSFCbcZwSG0o5c1LI+stHHxZf3otosPZs4WI
	 ae+HLFIuxHqw7EqDz8232kbnFYNyvOxvtlbSLovNeJVbKg1rkTtcb/Wr0+GZajGNB3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ghm/XOD6";
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E67F606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 06:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E67F606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ghm/XOD6
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b1ce85287aso363059c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 22:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793773854; x=1794378654; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nxObPTj/uIUEGHfeQ9adXhEvppId2c7V0+NPSeSoNZI=;
        b=ghm/XOD6ujPLQihO+KHWRj6ldK8L1dBP5jTWwWS6woQhENxcApbdzhvp1Wj6v4P8om
         ITut3zVMqYf/Scsl8DFAlm69c9PrwbbrUfBS5OagQizpIzR9yFWKyMlSdd3aoe3msPVf
         hmX/FVpWr+9H+R7ID7LcY+QjG7UHL1+M3H5joLlYmjXp+lZRoghzdOFCZjlRkGxpQv6z
         saaKmnrLcxovWeHTUb6OnyZwmto7wFJKnuBGOaDPjz0sXXdzKkrmva+p7P9oEkWN515R
         ueiPfoGB7EKHqm+o5VE6ROTzqx8YJZRdeEZXLOceE+wjcVc5TIwUbgimyZGfjTwGzysq
         8O/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793773854; x=1794378654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nxObPTj/uIUEGHfeQ9adXhEvppId2c7V0+NPSeSoNZI=;
        b=UpEDc6d5ZhwY2ra9VHSxtfRRHPx3DCaSTrtlEYfITd9pA9ovi0nGABwfeg3aSIRN5Q
         FwR3K5HizBPA0tOGDOzJuw/dfz3On17eKm5ZKT/NyEz+sYAtZ6NhqECa9y6j/LM42VrQ
         xOe6Vn1YU15t3Z+0z4PrSyyjFvOD8sExhzCYW/e0b759WIyjxC67tBjA3PEX5S/aRZNE
         H2qMk8erQZUorObtV33JDc+1RKVJPyI26fzWS3iiLLqzZS+i1yTFJbgJbArTgpjPC7wU
         6HC1L4iUrLRzFvwDkQmi1XNar/RLqVFSDU0Ys6szzX2ua3ilgQviWxVAFAX7wttbIHQL
         iddg==
X-Forwarded-Encrypted: i=1; AKwUvBxQUUoKLKfZ0m8qUlHZqCfsIWbv6pYLqdBYuvYyVjzhrajPYpH6g49oA5VboOVWMrnbd4wFjI/TIVA3r44=@vger.kernel.org
X-Gm-Message-State: APuU4Z86V3gP9zdxToUGQl5DwwAxfYuY37riZWhz9S5a8gDeYGa3/yFz
	/LEMQtdH7bNWQNRwlb1+nVvkH7C4tovis0inx2xZOxkdp8JTeZGGrCQD
X-Gm-Gg: AYBFou0rPCUrcnplly+B6ndNCysrC+rU0HoX+cc4L7hS7OspWrQh7q0Wa0/4qCJf/Eo
	8+tbTGmIl2hbQtcT/mxu8ZHLFJPvqRAit3Bdj1TcwDvzey6arTl1kjObQSwFCYb9FiDk7EWKoEc
	VyVlowuWAl8Tic1y40w0clgZVEaINyNmcXjQZ3lZa3QKdc+RV+vXEaMTO6Y0n6ceR0bt1OOxpzJ
	TNzcpU2Okj8+qMdIbyxaBJ1M8wIWxIPGahUdFvDgtkIokKLnlkyj4kWc1ozEzhHTrctxiuncdk8
	uYZguYssZPFoaRXTEc/4PfzNtwXBKqTn4yiOz0kZjBz8D+A6ThSowObdcPPos5hozWFiDMvPc+e
	07Q4ALGJlQVIEk/XzrgZTys2Glz48kfD0JBVCAFxv5nf5bszBJbjdczjvykpGzGMsNs2fZqqW9M
	fFi5T4oY7uYgcoGVZE58AU1RPWHd8cQzZcmlhgX6N/gm2VVCiZSQo7fcuT0z9A42No3Q36pmloq
	kE8SR6EA6uMbpZ/CY25YmRD2OOZcLNau8+eWOXdR1BYi8trJnpluxGD1jDSyDFPgqTN0yzaWGbn
	0ywAL9tdGEDqauvV4jTix4xK
X-Received: by 2002:a05:701b:455a:10b0:1b2:42ae:94fb with SMTP id a92af1059eb24-1b242ae963dmr4316991c88.37.1793773853561;
        Tue, 03 Nov 2026 22:30:53 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c65194sm4454290c88.19.2026.11.03.22.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 22:30:53 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Wed, 04 Nov 2026 01:30:39 -0500
Subject: [PATCH v2 1/2] srcu: Add list_splice_init_srcu()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-bug-nvme-remove-ns-srcu-v2-1-feb64ecb96ca@gmail.com>
References: <20261104-bug-nvme-remove-ns-srcu-v2-0-feb64ecb96ca@gmail.com>
In-Reply-To: <20261104-bug-nvme-remove-ns-srcu-v2-0-feb64ecb96ca@gmail.com>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Josh Triplett <josh@joshtriplett.org>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 rcu@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0

list_splice_init_rcu() makes a list look empty to new readers, waits for
the current ones with the given sync function, and only then links the
entries into the new list. The sync function takes no argument, so it
can wait for RCU readers but not for the readers of an srcu_struct.

Passing synchronize_rcu() for a list read under SRCU still builds, but
leaves SRCU readers on the entries while the last one's next pointer is
moved onto the new list head. nvme_remove_namespaces() does this today.

Add list_splice_init_srcu(), which waits for the readers of the given
srcu_struct instead.

Cc: stable@vger.kernel.org
Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 include/linux/srcu.h | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/include/linux/srcu.h b/include/linux/srcu.h
index 1a8a465a5650d..d4dcaeb83e2b6 100644
--- a/include/linux/srcu.h
+++ b/include/linux/srcu.h
@@ -18,6 +18,7 @@
 
 #include <linux/mutex.h>
 #include <linux/rcupdate.h>
+#include <linux/rculist.h>
 #include <linux/workqueue.h>
 #include <linux/rcu_segcblist.h>
 
@@ -118,6 +119,41 @@ void cleanup_srcu_struct(struct srcu_struct *ssp);
 void synchronize_srcu(struct srcu_struct *ssp);
 void synchronize_srcu_atomic(struct srcu_struct *ssp);
 
+/**
+ * list_splice_init_srcu - splice an SRCU-protected list into an existing list
+ * @list:	the SRCU-protected list to splice
+ * @head:	the place in the existing list to splice the first list into
+ * @ssp:	the srcu_struct that readers of @list use
+ *
+ * Like list_splice_init_rcu(), but wait for the SRCU readers of @list
+ * instead of RCU ones, so that none of them can follow a next pointer
+ * onto @head.
+ *
+ * Note that this function blocks, and that the caller must prevent any
+ * other updates to @list.
+ */
+static inline void list_splice_init_srcu(struct list_head *list,
+					 struct list_head *head,
+					 struct srcu_struct *ssp)
+{
+	struct list_head *first = list->next;
+	struct list_head *last = list->prev;
+	struct list_head *next = head->next;
+
+	if (list_empty(list))
+		return;
+
+	INIT_LIST_HEAD_RCU(list);
+	synchronize_srcu(ssp);
+	ASSERT_EXCLUSIVE_ACCESS(*first);
+	ASSERT_EXCLUSIVE_ACCESS(*last);
+
+	last->next = next;
+	rcu_assign_pointer(list_next_rcu(head), first);
+	first->prev = head;
+	next->prev = last;
+}
+
 #define SRCU_GET_STATE_COMPLETED 0x1
 
 /**

-- 
2.43.0

