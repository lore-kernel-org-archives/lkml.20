Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9CF4A4F0B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461927; cv=none; b=BgtgqzJG0kNB1uo+E4bbb7MOiFhyAM6bQcndLsBHBQdMNaLSuex586f+sQSKYYVZUVO2LLm3uHGN7XHykJHUj2oHvxqmNIOkVsuGgom5bC8x804ZmbXSZW+NIWtx7Q9VpYF1JZphIhd6mmryTQkTK6b7t1hLQgVy5EK8+nbl1Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461927; c=relaxed/simple;
	bh=Q3J41mm+ZqUAksOkXZqLDwbuyNuywMKNfO1hxOd5KMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IrKnjQvqcUpj1yvTKmCSGFNVA56b7mP+7bi1Xk8YQz1RK9+ITWDSSDuFvdUjSYkzfaqwFcr0JCq4uUbN0GBBuw2CUv6N0yIlRcZRmT6Ems/E+sNlFKHZXMflscVpZaVVjHIUrNWmM90Dxk1eoxaNXxRwQJr+JfqeAbNoyVSFKfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+vHZ0O7; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+vHZ0O7"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso4207203a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461926; x=1790066726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZPulxtgNfQy4/3bCHGD/xuJACMbrjO8dHwcnzYT6xEk=;
        b=Y+vHZ0O7Rsm2Ly9QIZTug7lmcaiYkFYDcNJK+6+mUHiEslqQze8N7cSTwzwSS4XDW7
         /Wzpf30wiZD+0KI5om+tEh9cnsuel7BUSsaSKWRn5CzQnfztHm9BbaAtb+WIezJY6ous
         QacUHjibvY6KqCvLFntogX1MdxwYgctH0mVFj9It455nImCFHQvKtwG5XHUOTtls9gOS
         EHIbaMjxG7tZE0PfhLbbMIE33LDEtbGMp8wxSIEN0X7ocgRxrUMkSN18WQQaPXc0sEK7
         oCAKD6fBARz8fAxlGYFqzg2ChzmeGqWIDlAp5+E6H7/5766D44e3TifGc/X78Udbc8RS
         JrSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461926; x=1790066726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZPulxtgNfQy4/3bCHGD/xuJACMbrjO8dHwcnzYT6xEk=;
        b=sGeB65dE74x4u4EZquPLyzOqBdwl3Vq6lcxggWNH5DMeE7rhNHwuZULxGV9fLR2+7Y
         9ItiUbT/E9Dw75PkbUwdmUqSDVTkfg+i4E+VurE06GBD2HTrtyAMJXE0ltUDKJd3MR5S
         Z+ecs1dXsdobeT/pLkylRCc3C9K4X63074RgYFM/R9acKKt4aB9/tvqKO0RTHdFrwz7R
         K5MgO5UOkfzypmqZCgm+Tha6Rcs2HQQ1JY4GGb4Ko9fZgnDnONzNuapQvUq+bgRkk4FA
         1HRRb/f1uo6MJ6AgIoPVrJgEF+plVYU3R8jPODhj0T/F1f900ifmxOaEeyR/OAw83GnJ
         fu7g==
X-Forwarded-Encrypted: i=1; AKwUvBzblpkx8mnbZxUg+WV4r2zBitR8kbKMnGwaKPc0BCj1DDr/e96xUcLMvgR1rCTfVRsElAVVApvWOc7lflg=@vger.kernel.org
X-Gm-Message-State: AFuF++niHIqHUKvfpXjEgROB8bCDw2DSTFH4QI/9MNtX/QHcTGodrN+T
	3WhTPJt55hS2r/912jjxgXMysYoefL86tcNmd6zLnYseoY/x8DtY4rYR
X-Gm-Gg: AYBFou0HvQXI/xOgsYjY3Hgw3sK54INq9DsQEub6LY/lVt7AJEklF7AOPjCiP8AC43/
	jRqpeY0uWH9wrEJGfO7LlSDa6iovH4hUHhdUufMZnW2bFhKsU3NiekJYzIC7pJMTdX6oMGWZrc9
	2KcgCv0yADi54dLKXlCixCcOB6+IzIDvS75/V34/xxPocsliUuu0oyhF7fkJd/ch962dP37nxw2
	i/TY0VDcZDQKb50PxfVD3KG8LzB68jmyiSyiZyjJbDK8AY01jdcbJaW2F+smUziraDN46aXmYIy
	tzWDpsPpPr2Lj4BMhqetf+2el3mb5jBg0jTqPorm4aIKPnd+/jDsUrFthRIeJFyLLXeIL7j6VMG
	yhN9jVIXYwU27GdMZtxfQvfn1WWsVn8wErN4thYWhxi9Zt5N+aLQtvDhtxB2dw6wtOLmn0AY5r1
	0br/pJdYZ0EF/ecWXYTcyXWAG0WKJSnL1GxoLaXflmT1pzq42nXSP8X/rmwpwJI3YZUnhRY5y89
	A7ZNg05CPtcuMOz18q5FmWwlg==
X-Received: by 2002:a17:90a:6d97:b0:39d:ec42:d61a with SMTP id 98e67ed59e1d1-39dec42df5emr8639965a91.3.1789461925707;
        Tue, 15 Sep 2026 01:45:25 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:45:25 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 20/23] ALSA: rme32: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:21 +0530
Message-ID: <20260915084424.1007757-21-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260915084424.1007757-1-hemanth.selam@gmail.com>
References: <20260915084424.1007757-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling mistakes in comments. No functional change.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 sound/pci/rme32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/rme32.c b/sound/pci/rme32.c
index 454a30a2c07e..1d5390621908 100644
--- a/sound/pci/rme32.c
+++ b/sound/pci/rme32.c
@@ -8,7 +8,7 @@
  *      Thanks to :        Anders Torger <torger@ludd.luth.se>,
  *                         Henk Hesselink <henk@anda.nl>
  *                         for writing the digi96-driver 
- *                         and RME for all informations.
+ *                         and RME for all information.
  * 
  * ****************************************************************************
  * 
-- 
2.48.1

