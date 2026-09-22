Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F673ACEF7
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790046760; cv=none; b=eqaxKNHtVRoiX2KtAtk1KpghiLx8t8bnDL1CqUdw5lTMC1fMiIcrccdwm1FiXoQdlFb0VMzAIBx5hEm+WnXHk1YqtVKajrXuikKRLz4a6PJDFWoP8EJxJvcpIRJZFIMGlJhJsb+DmrQ8u7wMlO1/fgp2gIRHa3q5fnLmQ2nwR8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790046760; c=relaxed/simple;
	bh=+BQj9dbyCL42y70qF7AHstEBCEOID/J0N1yR4IQB6CY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=suE5wbUfcMr89oI4Rcsr4tHWGeOIm8qeAHGye0iOT5BRSAnV1T+Y/9heV9AnvmUg1cPcHPmLvZWvoLlkgBvfMQQJyLaEBJi7AdHdeWrFizzbituAGc9tXjtMHRlYbJYKVhTB8myirhexKQcYKUvgMro8MRmSo1C4Dex9yZa7rDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIEyAP6f; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIEyAP6f"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc750a1482fso544253a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790046758; x=1790651558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZZY0hZxTWnQbFcNW5wJVS19aTr5JPFXzLhgUi2a2b4M=;
        b=jIEyAP6fuE3vc0pRe2ORyhuMInX+gps2OLyPEcjhNQ5SoLaYwoxCgOJVjZBCdwlzwC
         1sJ8/appFDd4WvM/mvirjJ1Mj22Hya/Q7a1OgDa8/HszEqsyeXVj8J8kEHTiE+YyjN+a
         jid++Qm/v94YyImlubjiLGWTPUeL7NeB3Jlq/XzUGFWv/AKBljJ2mLkHaYAmrly7GZLd
         a7m6i9e4ZHsbHqogDuyL/cTIJ6AFMYpPzY7ObfbDkn5TD1YXyF6J0afsuaWywFN0DrSb
         paUkM2S/YjQQYXka784WvMZVrzLPe94i6KWbrhG4nRO3QuosGe6ESF5zWzE/uZyaAO9H
         I+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790046758; x=1790651558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZZY0hZxTWnQbFcNW5wJVS19aTr5JPFXzLhgUi2a2b4M=;
        b=Ykb7lU+hmcz/j9WohYRmJVrBQb0Ns4JvDP3lO7gm+fN6jqtk44avhu9S2FaWPqToQe
         i6RU984rkzJYNwYQRCyL+0JhXlb/tUYRk2C6NVgA4usgh0lbIvd01x0OCrOwqyRvE150
         b+S7BPb0bTlySqJcZqkRQcTqOuo2WtfgGFpflSDn8DOeXYvJxfgam4zAYS7xYtOMsA4/
         eBKHM2J7Ls6w/AfAyPeeAlW0ETyoUuJQU+112eNIHkmZiFMHZd8l6BuVIl0BmVnrV/PD
         WcNVwB+24uBEBI/b5rR7qhHcA/N4LaePRcGAZlqJdDR0gMox802NfGNNagsxEoFi7Wcu
         Nypw==
X-Forwarded-Encrypted: i=1; AKwUvBwt6Fkvmla7oiPqtP6QKkBwECucbCBkGMzfe0eUlq9NC0caH6zi8mH2P/cJ4tX89dDlKG3P40LrwOvgZOM=@vger.kernel.org
X-Gm-Message-State: AFuF++naVRq891mvOjnNvkw1fWSHBGoN1CDxeridM1S1AIJXwgUnE4+0
	3eXiUlRSmt2o130m2OuSLfBwf3BoFUKdqhvBVW32As8KsO97NIXizBfd
X-Gm-Gg: AYBFou3t9sja9XfoBYPgXIb8VH0UM8XO4OZeus/IKTuKF8f8/U1A33m2izoCZKUJQz4
	2ARERBOeQUkFWltghufxq5M4s3yJAzMuHbbIhQ0hx8e7jb94K7/eHB+qsJEq3jWb8yqMqnIue4F
	ScZqL8DyAY9yKwffI+SjxUvOmpbYwTSvj/XDwEcku1C60jCiBSozfqGS3+ALgQZN2xAqMT3vC37
	MG5F1QheoFZA/JZHcD90vICPwzO22JaVS4qV6sgnzPN4k3u80h9eR6kggUDRe5maJnkK6xLo7XY
	ddZC1f/rWGvEP2NOcSqFUJexC4Pv0RTA/HAY9ZHJFgT82MWsglLCxnqp6GDIWFyk1BDbe4u3zbu
	HuyhL3f+keZ5A81ELlo/Pe26y+ohoNGYFMsqmiMUNnBMLO2wS2lL7bGLeGetgD/fEJVDrfesHIS
	9E69N3+4uNv2DSNJr3KlJ6p45B+SWJxGBDr54d+Kria+YFMq7wR1uzn/6x86O13v4gwh6hNLXAh
	zvuir2HNjltkQs2rwEbsA==
X-Received: by 2002:a17:90b:4ac6:b0:396:65dd:4093 with SMTP id 98e67ed59e1d1-39e54c01efemr18486080a91.14.1790046757934;
        Mon, 21 Sep 2026 20:12:37 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06cbe3714sm294627a91.0.2026.09.21.20.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:12:37 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: kees@kernel.org,
	joel.granados@kernel.org
Cc: kuniyu@google.com,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	zhanxusheng@xiaomi.com,
	stable@vger.kernel.org
Subject: [PATCH 1/2] sysctl: Negate before converting in the int read path
Date: Tue, 22 Sep 2026 11:12:27 +0800
Message-ID: <20260922031229.2300283-2-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922031229.2300283-1-zhanxusheng@xiaomi.com>
References: <20260922031229.2300283-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

proc_int_k2u_conv_kop() reports the sign through *negp and the magnitude
through *u_ptr, but for a negative value it hands the sign-extended int to
the converter and negates the result:

	*u_ptr = k_ptr_op ? -k_ptr_op((ulong)val) : -(ulong)val;

With div_hz() and HZ=1000 a stored -1000 becomes
(ulong)-1000 / 1000 == 18446744073709550, and negating that wraps:

	# echo -1 > /proc/sys/net/ipv4/tcp_fin_timeout
	# cat /proc/sys/net/ipv4/tcp_fin_timeout
	-18428297329635842066

Take the magnitude first and convert that, which is what the open-coded
version did before commit 2dc164a48e6f ("sysctl: Create converter
functions with two new macros") folded it into a macro.  The
k_ptr_op == NULL branch was already correct.

proc_dointvec_jiffies() and proc_dointvec_ms_jiffies() are affected.

Fixes: 2dc164a48e6f ("sysctl: Create converter functions with two new macros")
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 kernel/sysctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index f7b75985d542..38597f26b34c 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -483,7 +483,7 @@ int proc_int_k2u_conv_kop(ulong *u_ptr, const int *k_ptr, bool *negp,
 
 	if (val < 0) {
 		*negp = true;
-		*u_ptr = k_ptr_op ? -k_ptr_op((ulong)val) : -(ulong)val;
+		*u_ptr = k_ptr_op ? k_ptr_op(-(ulong)val) : -(ulong)val;
 	} else {
 		*negp = false;
 		*u_ptr = k_ptr_op ? k_ptr_op((ulong)val) : (ulong) val;
-- 
2.43.0

