Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958170;
	b=vadGk6TuFVJn29wmP+lOAbVPu4RyrPElYKnLpSnBxoHZrlAE2zIuMWMjavfFMMpISuQz
	 5NDmoBNX+gqaXfdRRpLJwIVtNIZgCu/d8OHi8gM6MBqwkzcaumsGHqujGp6PuHuh5o2MD
	 hhVuSuZE1X48Ygn4RNSP8yumXadk5NLQi/EICmSuCBt1fmk78iHdm3Q7jfzk6JCeZQh3f
	 VPNkiuHf5Otv54p5jfQbiYZ5mPSisYnGXmjxOaos4tBvKAfmgDHpkNqyZrbdEWEcu8tfa
	 pvUN2xRzgU2lCCNsbbamRcVjyRaDWU+Hi0Dp7ybQbB7YEpY6aseULYkRzN2A1uzIaNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958170;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=K7jOVqAETJcaglRqxXxRgOA2nRul8j6+4Z7YUWOjC3E=;
	b=j6qWyZ9X2nH9Wlo98Zz2gyFXVWxyQ9WHI7IbQSNpdqlr0/OyKgp7isp6c/cVhO7Obd9B
	 PcAcE3PpW0KMfKewzlhkisUkcos/E7We4sYNAX/NX8/M6sA4zUUBn7ma4+V6hO4jdmWYQ
	 t5h6DeJlV+efUF4C3QqqbSQcO0k4Feqhg2CNQWxlXGf6/+FQaI1FC4m48OqMoHhFXtJaz
	 UdoUnU8Tfc1Y3BIZTMR/EW035Hg3aRXp8FwZh4eb5mjdTox+YDDb3eRBXV74R5knLsHcL
	 ubEOyZdgZrpoTt7uaMpwflVHM3e/o5NslxnSX2mcEO1kyhnJwIjgzHozMtvORk5ujkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BjLxmIZE;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E26A606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E26A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BjLxmIZE
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ed0f842b02so466035ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793958169; x=1794562969; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K7jOVqAETJcaglRqxXxRgOA2nRul8j6+4Z7YUWOjC3E=;
        b=BjLxmIZE6tI+gC91ydXbSUgNH7MlVWikZo4RjnJlP4T0hzQVLQgm04+2mfvccdD0OR
         9G9/hXcSr01WGaVQG3u6bBG4L4Jxrh5b+LqS9InnDtKbnm+loKf9rdqPHddUxxvoq3pM
         T4UEdU3OdRUi8kG59idiJU+X1QEGRoJ+qa72FxQfjwLBxGyErzW0G7p7IT85uIrtBXrN
         uXJxBZFEqcmc1Z7SDS0Bidv6kThCOSoAfXmuKLOvf25IpEECFy5J8ch0nH1hCERKhrtd
         dHN+PirEewm3iAQ04LRtJ64fnX934kMW1zYGZoxKUc2x+J7s2kKY+LAHH9tQOckSHy/v
         HnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793958169; x=1794562969;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=K7jOVqAETJcaglRqxXxRgOA2nRul8j6+4Z7YUWOjC3E=;
        b=f24POibVIeMZPTHsX3Soy6VacvuaFTE0NWfmxHbnhReyGi/rxjpfupuW1NHpExBjNS
         i0i1foHECGxbCD/7osk/yWxUxng6OZHTRCxNduDijohe9qWJSfFRLPNLzLYq9ZDs9i6H
         YeTDYePGDTjLEN+iz9n9hhUaP3YrlSLv3UuxzZ+zyLQkkieDKsfmLuu7YHlYWJth3I1R
         /BbQnSggvO+L5FI+219IGMTeETIhE5r2DFIgQI7FIRDrNGkwALQVSj9dxeaUYljHP0Cn
         fOdsb4bI07BWH330o42C8GXTIePGOd6AOp4/H5Owlgs8uYohH7lLELM5FAuhngkeBwrV
         596w==
X-Forwarded-Encrypted: i=1; AL+hErFz/BvSrd1nuyllkGGu4DRCLIy+VLiNdLXRp6aDAIhA/+YIyVA8SxPGwDbhU7kCYmyghN0IEOqdmAR/1+8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oReJvdxt/2kN+ByQRladgDnDEbhTzE3zJBRw3csSTq7XOK3J+
	vu9kDqWm+wSXlIesohKkkyoqafn6cbGRKgXNgL26R6Af7wRz5JtGj+pzbhEAN40M6QE=
X-Gm-Gg: AYBFou3EZ5sRBPiSiTaRqv3GQO0GBsbyXjY/k4qwpbWIvuGH5AnG7Fc0zlGvxG56kFf
	7aMy+/d6YxjtJjwZBrQLg+ab6rl1sDAmDR7zGOZYm8ncZq+6S1SZKXae0+b078XIRY+kKrNtnpV
	Fy8cfi79F4Wm0itky5PmFYrkAGm32wXUWfJetNQKNL6NgEVsy9BHsO+OJsScAzajgGDsdQBJI/v
	4dbYGZMQNem4JN+lSR9XAzyG+om//Bw+TZL2tiRN1rLkkfox2qBLT5K7aExfdx/ZbTY6L/w9rGj
	Bdyah1vx3YF275HNOzo+DOVuY6coMMd+7HgusJ0aW0cNwMoBCoDL6MxYbzcMSBOE5VKazDpOinV
	5aEiZ4mYOHFvdihC0ZeVXe3+U6lK1IGWYeDGJ17Au6viHLdXdpl/bO5U57Os61VL2Vv7rvTJ4+9
	MhdNioxZ2SzyTqUZGzKufrN2YRZI8KGu2gETKrI+0pD45D7XSOwNMeOyGZuu99LsUmYTCsFDG7a
	k/GCZB8CcoHSZtqP7qbFDzPNDptqU7cA3IEvuDgLSY4chpEIw2LSI4bfpgG1r7Lv20HPyyTf85I
	1OIXOrw4Eww92AAoKlJKjlM1DB63Nmc4nQDgHa/Gbseir3YDSLO3qZGmAsadnuRQVdg=
X-Received: by 2002:a17:902:d4c8:b0:2d8:f4d4:7044 with SMTP id d9443c01a7336-2ed41854f4emr38856425ad.3.1793958169104;
        Fri, 06 Nov 2026 01:42:49 -0800 (PST)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9ed126csm5080993eec.18.2026.11.06.01.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:42:48 -0800 (PST)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
Date: Fri, 06 Nov 2026 17:42:43 +0800
Subject: [PATCH] mm/zsmalloc: keep fullness stats consistent with
 CONFIG_ZSMALLOC_STAT
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
Message-Id: <20261106-zsmalloc_stat-v1-1-b574f4714adf@gmail.com>
X-B4-Tracking: v=1; b=H4sIABKh7WoC/zWMUQrCMBAFr1L228UmlAheRUQ2m9VGairZKGLp3
 U0UP2d4bxZQyVEU9t0CWZ5R45wqmE0HPFK6CMZQGWxvnTG9w7feaJpmPmmhglJtGAIbu3NQP/c
 s5/j69g7HH+vDX4VLi7SFJxX0mRKPTfkBm9n+s9iysK4f0xIJ65kAAAA=
X-Change-ID: 20261106-zsmalloc_stat-e261d4dc1276
To: Minchan Kim <minchan@kernel.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Xueyuan Chen <xueyuan.chen21@gmail.com>
X-Mailer: b4 0.16.0

The fullness-group counters are only used by the debugfs classes report,
which is enabled by CONFIG_ZSMALLOC_STAT. However, these counters are
stored and updated even when the option is disabled.

Make the counter storage and updates conditional on CONFIG_ZSMALLOC_STAT.
Keep ZS_OBJS_ALLOCATED and ZS_OBJS_INUSE, since zs_can_compact()
still needs these counters.

The behavior with CONFIG_ZSMALLOC_STAT=y remains unchanged.

Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 mm/zsmalloc.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 7ef80e0da626..eb77d7cd948c 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -212,8 +212,12 @@ enum fullness_group {
 };
 
 enum class_stat_type {
+#ifdef CONFIG_ZSMALLOC_STAT
 	/* NOTE: stats for 12 fullness groups here: from inuse 0 to 100 */
 	ZS_OBJS_ALLOCATED       = NR_FULLNESS_GROUPS,
+#else
+	ZS_OBJS_ALLOCATED,
+#endif
 	ZS_OBJS_INUSE,
 	NR_CLASS_STAT_TYPES,
 };
@@ -721,7 +725,9 @@ static void insert_zspage(struct size_class *class,
 				struct zspage *zspage,
 				int fullness)
 {
+#ifdef CONFIG_ZSMALLOC_STAT
 	class_stat_add(class, fullness, 1);
+#endif
 	list_add(&zspage->list, &class->fullness_list[fullness]);
 	zspage->fullness = fullness;
 }
@@ -737,7 +743,9 @@ static void remove_zspage(struct size_class *class, struct zspage *zspage)
 	VM_BUG_ON(list_empty(&class->fullness_list[fullness]));
 
 	list_del_init(&zspage->list);
+#ifdef CONFIG_ZSMALLOC_STAT
 	class_stat_sub(class, fullness, 1);
+#endif
 }
 
 /*
@@ -1896,7 +1904,9 @@ static void async_free_zspage(struct work_struct *work)
 
 		class = zspage_class(pool, zspage);
 		spin_lock(&class->lock);
+#ifdef CONFIG_ZSMALLOC_STAT
 		class_stat_sub(class, ZS_INUSE_RATIO_0, 1);
+#endif
 		__free_zspage(pool, class, zspage);
 		spin_unlock(&class->lock);
 	}

---
base-commit: 21a7f44fd0765fcc5194130b28767786eba1d1e7

--  
Best regards,
Xueyuan

