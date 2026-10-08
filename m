Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95143AEB29
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 16:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791477655; cv=none; b=HS1RqstmRLVGaIM8ehkcgp96SF2TJjV4eM2oGaSkLQy1GWj1LudOlHQwly3RMPKfqRFJyJNRR+ofzMKqn5WpFKdARvYV14I826M3Fkld5A8+WvEpfpTXUQEydZceNY6LBl5xvjVFpf11qvgNo8LNE6nb/YZOfEVjKdGNaqfyNRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791477655; c=relaxed/simple;
	bh=TbHXL5XflxbSzilJyxaLHrSNth6sSZOOxsGKAQPnCLw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EF4faSYMcBOba3JkPqRALiQr99a1B+CXmotiF+DLpMZUccbPGY85YO9aoJlcCHrIjQGt4f0XqhCutrairoukCeth+eTFOMohl/2VoFvyo0eH64DtepYbpuc53L8lLSeEUi0U1VBbEXwxw7aBi1elYdnIw6hLusAl/u63WnYeGso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qYLfoAI/; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qYLfoAI/"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-8256106635eso1639158a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791477653; x=1792082453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9MC7qaWcROmES00Hk96fpRE/Vor1YORtZHWPl0gQA1w=;
        b=qYLfoAI/bXau7CJkOLKtgdo9ltU52ALqhUve/qGCzHpUHhBV1jMcrmmk6JmO98nlqR
         kDBhYXsvE8VP9ngigT4JdtQlB18GAn+nkvuf9P9zRqICGjMXBCI4rSTlX2/cCMe3jYVH
         FYeHwXOJEOqzsmHB14KBI6PXcunS6ZeC3EacNBbKvMa0iJJOhE2uQ3OurkjcrjMbNEFv
         7une0vAdhLcLpR6UWfGEABdlE7nOLpc5uNglq7fvhj+77aTfNPejZ/b7oO0vvBDCY6md
         KcPQjtKBHYRFpzeoTxoH4Jd+0wAanih9IDPlzZqJ6HZBGbHxjlyn1Lj/KpVljeVTbQYk
         mRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791477653; x=1792082453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9MC7qaWcROmES00Hk96fpRE/Vor1YORtZHWPl0gQA1w=;
        b=uJagk0J/bGJGGyM1LhqCOJEpWlplb+HtthwTvxWEn0NKUnzZxZ81/LjWZSq95FBFSW
         /VHI7s6fmoU9M+lc/LTbJu5/pnRNBKC/9gRRhEDT2WutobYNlP9rjl6+qGNqsBW/8D9s
         eHtnn4Jyl3Im0nFHzucS+iUW9f4LXVX96zXZGgtCx1+IfP2NPH71jlKufqXfo4VvwHI2
         f2eWaiFdV1o5qoOCc1OBJKUugy5Ax2vYudfQ0SIkOIG/ZOYWDimEoBJQy1Uzode4MGA9
         CyybyCxd4OxOzeC1J8V2XYtTcoW5gkDj3JaMbFVheObFcdn4kbNZLu4N7aS2H8EMTKwW
         uhVA==
X-Forwarded-Encrypted: i=1; AKwUvBzP7VIRMvM/QlTwrtFCf1ns8jGJKxqW0fghabhqEmFXElgF2fxTurWL6oB9Es7R4GURoyqxE2q9wvujzaA=@vger.kernel.org
X-Gm-Message-State: AFuF++nrLDpvkh+aZjoaRP1PheI0AuiggqnItB5HZHcWU2JA27P3EXQU
	v8Avp9csxUBSVuWDu/4CUKirqMrEClHMobf5QH6FF1xdrWvceFEwqF/s
X-Gm-Gg: AYBFou08hr2u9eYVbd8q3bEs6ZFyVTjxAWaLJlgCROIZak6k0pqRwJ2G5SlpQ2OoZye
	ERsCKnJxfg8lGB7d2liki+6VXiHzjQeuxWSQpCZFYxObxaYiILIZXcKXDGCgWO86ZT3SqPd3gWx
	a6nLHHfccZ5jWGRJUlc54CS3IOsHksLEdvQqNem33R0m0gig5MWsVDwbElSfbeLjdzJWmtd9RC8
	tEyIV0LrY6oXfKKuZbtvwXzhDnX2RXsI0WQKlHOU/FfyUYGyb+okzpC8krmIounm7jsubOHCxH1
	FIyUqumVz1qPHA3pO/AVkfQ6fhppRFK2NeWlhag9vPLTwBzJUTl9zyc7QcQ6HdoKC0X/EF7wlis
	3bFjx4/Yh45KNkqzrU6U2oC3s+EIgO/BMfxxZeve1FnRY+7JXg6y70uygYT1JDqBOfNZAw5spkr
	d1gbuRsgJ9OzZo/9pntksvc7NaLaA2UgIzzXVpW3u5BWh0hyxwf8QaRHQlKjuC+hrtz96qUbOgX
	d2PR32UI0zB
X-Received: by 2002:a05:6820:7089:20b0:6df:ac2e:85b7 with SMTP id 006d021491bc7-6e7a8996551mr3648031eaf.15.1791477652571;
        Thu, 08 Oct 2026 09:40:52 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ee7a7d8f63sm45928eaf.9.2026.10.08.09.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 09:40:51 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rostedt@goodmis.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/8] kallsyms: do not call qsort() with a NULL table
Date: Thu,  8 Oct 2026 11:40:30 -0500
Message-Id: <20261008164035.3668885-4-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261008164035.3668885-1-lzsx618@gmail.com>
References: <20261008164035.3668885-1-lzsx618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

link-vmlinux.sh runs kallsyms on an empty input for the first link, in
which case table is NULL and table_cnt is 0. Passing NULL to qsort() is
undefined behaviour even for zero elements, and UBSan reports:

  scripts/kallsyms.c: runtime error: null pointer passed as argument 1,
  which is declared to never be null

Skip the sort when there are no symbols.

Fixes: c442db3f49f2 ("kbuild: remove PROVIDE() for kallsyms symbols")
Assisted-by: Claude:claude-opus-5-5 UBSan
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
v2:
 - Use my real name in the From and Signed-off-by lines. No code
   changes.

v1: https://lore.kernel.org/r/20261005104050.1786222-5-lzsx618@gmail.com

 scripts/kallsyms.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index bd9e9ce20e..9300e10ad6 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -390,7 +390,8 @@ static int compare_names(const void *a, const void *b)
 
 static void sort_symbols_by_name(void)
 {
-	qsort(table, table_cnt, sizeof(table[0]), compare_names);
+	if (table_cnt)
+		qsort(table, table_cnt, sizeof(table[0]), compare_names);
 }
 
 static void write_src(FILE *out_bin_file, const char *out_bin_name)
@@ -822,7 +823,8 @@ static int compare_symbols(const void *a, const void *b)
 
 static void sort_symbols(void)
 {
-	qsort(table, table_cnt, sizeof(table[0]), compare_symbols);
+	if (table_cnt)
+		qsort(table, table_cnt, sizeof(table[0]), compare_symbols);
 }
 
 int main(int argc, char **argv)
-- 
2.34.1

