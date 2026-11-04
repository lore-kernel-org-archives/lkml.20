Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826546;
	b=kLOHdmxnE5Xbdo10ba9WA4zEDP37L04zDEvaqZgKSsflGLuqVKbgpAwzXm9pxsHwOtFC
	 pQdWTjOtfOT8EfW/QslKtfyuruqtG3DVuAkmW1o+BbQ2IO0xPM8fpgytAD1XfMqlrslcH
	 VFOG7iHTQ5EXKojUII6RlVUkz9PrDOQPNutrX6HCfeUqQana9q4hJM8/UcOiNo9mNsqy4
	 XqpqSKQ1ve6ihihMUiI1dcAf7Vq3lUFcJwz/rMLaChbD6EU/8JWqtJ47QofAow4z3BHXx
	 BuTwhOI0K+0jvv6aF9sr00n/mEGs3qS/ep3XuavOwjqvnT4iBFo+wlDWPHr/nIsVULg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+BAJiaHT9SMjEKcOpf7f607KYh+We/BKby4YKSOmSes=;
	b=y2GpNOUq+UqwSV17S9qsP2k9RSAmvKOauP72WRP7y1MKzBThtAYxv/sGIpO/LYklx90q
	 rVlZR7AxxJskD1qDLgjlxRHDjNdg7DfNVgNotRGYHKk5fYzmhRu5NX7Narzh3HRHAA2BH
	 VfBYgZLrGipNwHk5j8imL/OCPKGW4+Zf0VjR2F5WkuIylRmfDkEv6M9b+mD8YCS7lWkMH
	 xmdxZEkX8uocC1M0keYn5G7aF2+VGWMCcdkfKYclMPdRtuSPgE/43zQfCF4UIr6ezLeyk
	 TA5vy1qsrb9lN0vBvLTrZbu1KmdvuQuXsIwkEhJS8V2GWDmQyb0Kfee8LQOktVKm2YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H7fUPbcN;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C25E609CAFF
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:09:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C25E609CAFF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H7fUPbcN
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e6eb21a8fso554337f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826544; x=1794431344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+BAJiaHT9SMjEKcOpf7f607KYh+We/BKby4YKSOmSes=;
        b=H7fUPbcNiBtA9vwbtM3wZKPmxv7HQZ9VU0ZRU1v1mVB441glYnt1BQC/BjaOrJqUvY
         XrMhTpnk5PhH88y57oP9KaCi25Hdx8QcZ7ocyObi78xLA1mzMB3vWCM0PFHY/tSxSJAj
         rKKY/GQ1DoFUzku0ALQDKkAfn3GaiS5DTvDydQmqebSVlZlu7UAMo/BNfta4GniKSDND
         1vIilRJMDtCPLZuf+thkbCkHi1z+90tugs1Sh+oZkndLI/XQtl/rH/3Ha9WqZiCqMsXn
         uxEDU58Lbj7j29GgXnKut8IwanKlnKD+ocY+lyLKxZ0tdNj0pbvHw/xV2OQSqk6y7OhB
         Z2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826544; x=1794431344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+BAJiaHT9SMjEKcOpf7f607KYh+We/BKby4YKSOmSes=;
        b=1SzMEPP+232ALpsiKmQZHcpNj/+Tb7B7iq6FIo42gY5CLmTgO6ZRPfwGtoKxYaRoDI
         5FaIyAYE4PU4M6Q2Qynu8OsRfPU9xET6qmcSl73t1ee/JxsVvTEkjFnLfFSfEabYSBhA
         HJl9ZvsqyF2dYC+D0gfKRX2fbCLOjB6d3LbcANilaMh1Danw8FAlKZ2mYQ5YSbi2DiUH
         3U5yXpMfpVgmOQBlCRe76y9rdH89S122A69vqWW8EyGA2bOUhd6ERjKoo3ZNtcP698qD
         zBd02orvpGlX2BNZ7rehrf0Z5XtQIxekvrko62WDdu/239DLOuk2tnyfBBvQJ3HK581a
         R+PA==
X-Forwarded-Encrypted: i=1; AKwUvBx1/A1RcOituB99a9Qu2+otaYGiULL95OxFr/rsapW3YPePtvi5zFJDidAXsI7D44Sofm3aaTWmU6LRtq4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Oa6iSBrMR9hx7R7gBTu5XJUXgytpG/rP1jiz+9lCpPS+nqKYo
	iijM2Bo8e2UgWDgxj9WHveAtLmyN5228nBFtFoarJbULM/mI6+R0QHn4
X-Gm-Gg: AYBFou245fd5esHF0DVLWxKicXGm9HieA7y0Tw5+5m/tvVLoV4xvh6K9JDoefSf+nzM
	TzlJd8wmCYwJSlNg43nu4ciUl6J/Og9xkWSmIMcYZibxQJ1fwSXL+17Gp3PCsAib+wCCN1LUFMr
	comderqqlcSQUqlgnKcMhDC/GFRTD7HsahrMSWMTqMA+V4LQDcvsFFJFs3SpR1+HlB3zAuyXaIg
	4bSaPNnvMCR7gRyz70sQyQVBWeFvKe6h7ikEEzGN/MWE7PKAAUjElHeP6sDMvBNYbmodAgknOIC
	BXn8VZsom/6ncr6YPSSPpK2rNEPZJ1Y08vZvsNHEFKlD3Ojzf6eTxIMDAp7TQIhLAqSJ3In2mz+
	YswSiAcZXrcWO+i+9wSxIQL4u8uxvlel+P1ODwXKAox9e0VsLb6VJT0YFwy/Iw8wsah3KF3y6ZH
	m3vHslL8LIkbcFnyoi+V4MHMU3kOga32B2qbQrMzRZ4yoJJtjn3WwKIcttErcYxrP3pw6V2CR4E
	4jmlANLHDiI3WIWjZB1g8kNge9Wh18OV4hIlLlTG8HnKziZWJ0iYagfKoC0mqVt9iWT9oGt/8ye
	Yj/l0cZkt4mjmFhQS85zdvl4a//LG3ivUyv+tKDUAB3h9FZZUsSolA==
X-Received: by 2002:a05:6000:420d:b0:48e:7508:bc12 with SMTP id ffacd0b85a97d-48e7508bda2mr36374736f8f.10.1793826544040;
        Wed, 04 Nov 2026 13:09:04 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed08343dsm5986455f8f.30.2026.11.04.13.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:09:03 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:08:52 +0100
Subject: [PATCH v2 06/27] selftests/landlock: Fix the reported clock tick
 rate in fs_bench
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261104-selftests-refactor-v2-6-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

Since time is measured using times(2), ticks per second are obtained
using sysconf(_SC_CLK_TCK) instead of CLOCKS_PER_SEC.  (c.f. times(2)
man page)

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/fs_bench.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/testing/selftests/landlock/fs_bench.c b/tools/testing/selftests/landlock/fs_bench.c
index 78d1efcb2d20..05082562d272 100644
--- a/tools/testing/selftests/landlock/fs_bench.c
+++ b/tools/testing/selftests/landlock/fs_bench.c
@@ -32,7 +32,6 @@
 #include <sys/prctl.h>
 #include <sys/stat.h>
 #include <sys/times.h>
-#include <time.h>
 #include <unistd.h>
 
 #include "wrappers.h"
@@ -206,7 +205,7 @@ int main(int argc, char *argv[])
 	       end_time.tms_stime - start_time.tms_stime);
 	printf("User  : %ld clocks\n",
 	       end_time.tms_utime - start_time.tms_utime);
-	printf("Clocks per second: %ld\n", CLOCKS_PER_SEC);
+	printf("Clocks per second: %ld\n", sysconf(_SC_CLK_TCK));
 
 	close(curr);
 

-- 
2.56.0

