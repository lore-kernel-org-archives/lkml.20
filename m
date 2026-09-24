Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0EA48422B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251807; cv=none; b=qastOI6ZfMZ4jmrYNyvHOgAPMcs80Y2MhBEJce0TshWyfp9WRkA1/PxSgq/3KbCUsyaMPnc2/swoBQ1ykK42uVNZlENQFRxdrD0wfo5EXfvATyocu4ZJvvDuixmvroSfGL8PRwTEE95wLnnWgphqPdk4muc8QxafxUL2KrpiL6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251807; c=relaxed/simple;
	bh=M6bUUW+Us8s4tlnoGjcgnGEWGKM+cZZ+vYh/2H6Y2aI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=md6y5BnYOXOWoKQusyKw0rFPAAj34ofSYPkP/9asIa32KQPbl/NDDLpLVSL8HuLZDrQ05jllYGOrmMe/9d1cco4fBIjAOUCyVBjSXcYtYeyCnJqFhOPUk4z3wrsbrAwHtFnvOvafWNCAD4waG5/OB/FYgHyXNgzLBrJY1KciBZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fA3AHtI4; arc=none smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fA3AHtI4"
Received: by mail-oo2-f40.google.com with SMTP id 006d021491bc7-6c2613d8157so1060565eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790251804; x=1790856604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+reEzqlDosNphymAGhKvKF7gaiTMd0YIMHTRa4Wete0=;
        b=fA3AHtI48mzNg3SrkvBXLIltTFaVElackw79mHdjWQNWk9Cx+pGoxSUZwFJKXa17qo
         s4k9qdxoRTfecuHh7IEcI436d+kh/XnOCAB2PLUO5rAOGacGXRhjD4dC8Kfesyi6uUfW
         VSI0MykFFQHX0aJz5HZX1VD/zAjF9LjQ5V68uV4oLH1JF+wY0qpCS5ucyeEhvZ+IQaEZ
         wAPTRdz8QfKLzqq82Ad2XuepVOpODljuZHrWsXISGStPPIF7R61ZuvqszMPAZpSMa00m
         pyF5GwT+RD5lCb6YBEFIopxSHrf99a3Db0D2Nanr2bqiB3pOgQrMKxguofXqGWewg00d
         19pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251804; x=1790856604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+reEzqlDosNphymAGhKvKF7gaiTMd0YIMHTRa4Wete0=;
        b=SX6bCgG8YyzRBj6kCsw6YZ9RX6H80M2CH3oV7Hc+SYhd5gOj2kPyyANRRFVdWAtbEY
         vUrzs2J7+nXrKY+t7C1RbvHrVMY333d4q3uh4aekRw72VpVZ02H4OwQ38kyhyyt14cwM
         px3NMOW9zCByKzycZEwbYJFyKgkx07gfRgnjZ4yqZEvIEal2CkJHnCLmjOZMMYltYqXS
         sNfxOhHMdBL4fMHcfDb/DdM6fe3WE0i0qKcOMXGag9Nxk44dti/Isa179dNO+pd/c8XS
         Zpf5pUTHma0yRuudlbzMXVxWGEjDwEE57r4ZQIpzQ9qCYWXYSRM46H/bOH3VHvT36vN1
         LpmQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/KC2feivwjZJl3DE8PVNXTZSWN8XIbZU0daR2txaDXkUlW8i4MHLSui4uQsQvdgxZlnsqZWMr8ZsMaXg=@vger.kernel.org
X-Gm-Message-State: AFuF++l5L3qk1D0cGvgbSxLkVSDj3aijb/E4czmUOrNgR1xP2/CUOxnp
	aEdrpTWY1Z5eORG7uWYFh8P21ae7M854D7obTWGknG2EDeTXDrdhjR81
X-Gm-Gg: AYBFou1/+UWaGazw/MZYbZIJzbDRHjSmjSXWcOIWlkwB20Xi7HumUjw4I3jC7RaPbVD
	mTnM6QQ7rgX4oPKbbqM1OZvkcI2lOoXl2sVZUZvUiDhcKO1pKrjjHQ6HgL6D9/sXDhQYNKpQKsB
	cF8fNFEkZmCrpgir+7DY0Iwf/iK+KSabyPAi4vo1LHyNz5eW4he2C9i3j15z77pZCOSLgogrTpM
	STs264MJWCoSvMwECvcvqkAYpM/V5KUMluWmlftD1vFBxrEEO2+t1lIzIubxf063BqqnasA0mcV
	sGZuamDqb65YfTgF6f4hcRlOP9F2IgmSzJ28HXjx5q5XIQxgsGYPfqlWaFjTegUvdx9pjG6LymP
	n9z1m2pEF4beuUmMhiNwI0kbVh97TjTRHtvduDsPdo9rd0XQ95jWTqiOkpjJZYOqoFgrZdaPf/1
	hHtwsQwt05t3u+TxPyO0BMsMt5CmJRM2+PfVnrLnnVBn+5f2haPyFCyqeBzAe7PXcJjgHkN8vG/
	7owbhIJmtMGosnXKHXcS5CR9mVgQRyAs+6sB4hH
X-Received: by 2002:a05:6820:221e:b0:6cf:c878:2b1c with SMTP id 006d021491bc7-6d43f89b70cmr2173148eaf.33.1790251804550;
        Thu, 24 Sep 2026 05:10:04 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d2ce763f94sm5018070eaf.8.2026.09.24.05.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:10:03 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH 1/2] tools/nolibc: fix verrx() and errx() message formatting
Date: Thu, 24 Sep 2026 07:09:57 -0500
Message-ID: <20260924120958.23698-2-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924120958.23698-1-danishkhateeb03@gmail.com>
References: <20260924120958.23698-1-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

verrx() passes its va_list to warnx() instead of vwarnx(). warnx() is
variadic, so it takes the va_list as its first and only argument, and
the conversions in the format string print the va_list itself and then
whatever is left in the following argument slots. On x86_64, for
instance,

	errx(1, "int args: %d %d %d", 1, 2, 3);

prints something like "int args: -1699009032 1 2", where the first
number comes from the address of the va_list and changes from run to
run, and

	errx(1, "%d %s", 1234, "foo");

crashes with SIGSEGV, as "%s" takes a leftover argument slot for the
string. errx() goes through verrx(), so every message with arguments
printed by either of them is wrong.

Call vwarnx(), as verr() calls vwarn().

Fixes: 9da0f529c089 ("tools/nolibc: add err.h")
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---
 tools/include/nolibc/err.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/include/nolibc/err.h b/tools/include/nolibc/err.h
index e22ae87a7289..61978d537ed8 100644
--- a/tools/include/nolibc/err.h
+++ b/tools/include/nolibc/err.h
@@ -60,7 +60,7 @@ void verr(int eval, const char *fmt, va_list args)
 static __attribute__((noreturn, unused))
 void verrx(int eval, const char *fmt, va_list args)
 {
-	warnx(fmt, args);
+	vwarnx(fmt, args);
 	exit(eval);
 }
 
-- 
2.55.0

