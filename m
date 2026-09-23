Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBA9480DD6
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790202887; cv=none; b=H+hVIeXxCOTGaBotgvNyG//t8q2O0d0dH2JtgaoMruoXIXbcpYolIwjA8XPRPuPg69b93MmTWpSamtl5k1gZVaZSolPE+A+aw1IWSe5Vw/TkxX5pYUSQQ99PtBNOgM9qlMzEmmatlpQqP5ZuMyf34uxtSqysZ+6JCEq1QcyUXYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790202887; c=relaxed/simple;
	bh=R+ywodY9/HEwLU1o/08HL92DtAFTrUi2XM/5yuI7Itk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=urJ04RrsIROdZ2RtpW58En3XIbY7vw47H3/LnFJ6kaWg1ATTEpufw+PahB8kDR0+Tn3Sg8Q33JPWh0dmLb0USyIrblrTQu9GumgxNtEK9mvhd7fIZp7g34tYzyuOykhIIJrdJNkKgw0J044JzCeTsgZwVL8javeuTszQvyxt9yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DmbRLypk; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DmbRLypk"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccdd7695so552611fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790202884; x=1790807684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PGwW+xKeGyj9qdYgvsjMj0TNagE0SwrpwzZecGCbsEo=;
        b=DmbRLypkKCFHcv7PaYZIN7czeYVwJf/g25pnwhyJXn+yhAAqSywfjJsQKa4/UwF9JS
         BnfZdqOfIQlI6h0j5UQ2V7Vy4eDNGcDaImK4WmdkVzGgjU1+S8EHfHdGzo/1OzRHW5r2
         UgleiNCiqMPLZz2iUmWOkrpe3Ou1Q3En6WAOxvhcHtxw94Zil4fXUXAlL6LQuHkoTNW0
         g8ByDklq8fLzSQ03JSIiy2tkCjGwPrN6f5R60oa14Fc7n6cZWg5vxI8eLGsgBUsD0miL
         OdhjO+5bg1Q9PrGjCv9/qY5+XBeMWmNLR2ubirsqxoQOYr0eenv1EPe/yUrDnLCz0GU8
         9xEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790202884; x=1790807684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PGwW+xKeGyj9qdYgvsjMj0TNagE0SwrpwzZecGCbsEo=;
        b=lkQeuf1xJexzTi0QSZq7sgErMsyOmhh3lK3jgYeALA9D+QeWC9/yc0RWrxp2wLKTN6
         +uNgqVTzrtjTL6X3ygRcvJDk9S57L2lTaU/vSp8ZP7Idvt1m36USeBXI11OTpIzYS0By
         Y/HrkSPG43WyduO5jHEhT7llAcU7usNrifJ/+YxlRmINYj9Ur+xkIHAtycG0LQZ3UiJh
         sCj0y3TVfRG1MnWmU85DQni0VeSLIt+3iO1jn+JDSmAGVWuz4UTRwOoNzmP5qe/YfHay
         OnGsvFgO5+j7BVtP35fKCVYWvIEsGznkAEST+cFTNRwcw3SeULmd0YqeoYf5SyTDc7Fw
         c/4A==
X-Gm-Message-State: AFuF++kIor2gNJsfJ1PJGVV49zEycbnjS9fDv1DDLiXlOp3yETJ4WoHw
	zcj/yql6zuilbZRzD4Vh4aXq0I6+dvFfuBLN1bUYIB/mU9yJO2nTXERz
X-Gm-Gg: AYBFou3ycvhAzkA1smV1DD+azmIzSco9ph+WRnBziskYkm7FKt1Snv+Qz8DjtzBRZnO
	H+wTac7hE2xqa/6pp2RcpjduPPt7JbT0Z+yhwIu1KtXQbcZ/eZ2TZIBS4GELHP30XFfGG54B86U
	ASnWEei3KNm9R4sRZc/KA97oIRRo6kGl3WbphktCqVa8+Kgj8s9E7QtEd5qpe7mkuEMKCO19d1h
	a8LUVvmeUYd9xxhfRbIZNJcuKObQ+kz/18NouaFIcrml+qDxnH5qmZzSrm9r9TntuIs5isYK/Kc
	9ji73pk2usd5Az2uP2ksznMAFs6mLm9zYN8TKpIYwWli1EulsrmRZJpxiTywNrJnqWLq1LoOMyp
	OVVqSga1uTIojUNYBoAj6HIYPlOw2MtzmiUBknJAJpqpmQQ3OLibGrDtKX/WikUQwZzik24n1e1
	2CWLGjqK2wj4Y5xtSJuTNP1Iu/bqZbg18IPJKl2vzZTlw0BVTBwY3PYX7/XPVWIIRDBQeaxRtZ0
	ZY+/FxiSv27Tuf3ReT0bllWgpZrTBbKme3vqyw7vkvS0fp7E/ZyMK+KVZ/qGt1hX/oD8slNpbu0
	snlcJvTG7qoMAbajCoc=
X-Received: by 2002:a05:6870:6107:b0:48f:e0e5:a1d8 with SMTP id 586e51a60fabf-491e7549be1mr695793fac.45.1790202883955;
        Wed, 23 Sep 2026 15:34:43 -0700 (PDT)
Received: from [100.82.231.29] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-491ee1ac486sm559401fac.16.2026.09.23.15.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:34:43 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Wed, 23 Sep 2026 16:34:27 -0600
Subject: [PATCH v11 03/38] vmlinux.lds.h: drop unused HEADERED_SECTION*
 macros
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-dd-cmap-part2-clean-v11-3-9b6c217fdf2f@gmail.com>
References: <20260923-dd-cmap-part2-clean-v11-0-9b6c217fdf2f@gmail.com>
In-Reply-To: <20260923-dd-cmap-part2-clean-v11-0-9b6c217fdf2f@gmail.com>
To: Jason Baron <jbaron@akamai.com>, Shuah Khan <shuah@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Jonathan Corbet <corbet@net.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
 linux-modules@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-pm@vger.kernel.org, 
 Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790202874; l=1428;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=R+ywodY9/HEwLU1o/08HL92DtAFTrUi2XM/5yuI7Itk=;
 b=bxDPb/z9jo7UuiYZseWaAwvUnLu7CVJN5jFaB5CAxvuhf0/HXxBBnanpsfVCx/MEPxG7FcGfB
 T0f9fVvRuRvBztk1ewVDGy9dmRJ/jHW/tyMzmWs2igmZUy5YtAh60po
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

These macros are unused, no point in carrying them any more.

NB: these macros were just moved to bounded_sections.lds.h, from
vmlinux.lds.h, which is the known entity, and therefore more
meaningful in the 1-line summary, so thats what I used as the topic.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/asm-generic/bounded_sections.lds.h | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/include/asm-generic/bounded_sections.lds.h b/include/asm-generic/bounded_sections.lds.h
index 8c29293ca7fb..268cdc34389b 100644
--- a/include/asm-generic/bounded_sections.lds.h
+++ b/include/asm-generic/bounded_sections.lds.h
@@ -18,19 +18,4 @@
 
 #define BOUNDED_SECTION(_sec)	 BOUNDED_SECTION_BY(_sec, _sec)
 
-#define HEADERED_SECTION_PRE_LABEL(_sec_, _label_, _BEGIN_, _END_, _HDR_) \
-	_HDR_##_label_	= .;						\
-	KEEP(*(.gnu.linkonce.##_sec_))					\
-	BOUNDED_SECTION_PRE_LABEL(_sec_, _label_, _BEGIN_, _END_)
-
-#define HEADERED_SECTION_POST_LABEL(_sec_, _label_, _BEGIN_, _END_, _HDR_) \
-	_label_##_HDR_ = .;						\
-	KEEP(*(.gnu.linkonce.##_sec_))					\
-	BOUNDED_SECTION_POST_LABEL(_sec_, _label_, _BEGIN_, _END_)
-
-#define HEADERED_SECTION_BY(_sec_, _label_)				\
-	HEADERED_SECTION_PRE_LABEL(_sec_, _label_, __start, __stop)
-
-#define HEADERED_SECTION(_sec)	 HEADERED_SECTION_BY(_sec, _sec)
-
 #endif /* _ASM_GENERIC_BOUNDED_SECTIONS_H */

-- 
2.55.0

