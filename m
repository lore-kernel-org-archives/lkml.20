Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794008751;
	b=Y3S4KBPdg8yyeY1wSiTJzo2JGfC/VADhTU5yUEANgMln22yBfJdM9zxnkBhG94XU5ZhG
	 5BEMpLE6WXq03lByI2LxJj/LcImdDbbtCmEylwIcUzkYIzE6TylmO5WDP/G794Wlvpa1R
	 AmAqTFyte9pIoFGGW7DuApu7wC3AX+pe0O9Mm+CUqWKNvmTZ0PrLnVcxPAEga/OupNyD7
	 mTaTuBK+pvSbK1Xinb/jF65xo8p8Rd7jU9dAv/cZLhva+t8QfDkQUPCWg3DrnDM6yUY3s
	 Jq8CSxt0nBVcyVrUI+Xrif+TX2Rib6FESg+LAlCdKem6VtYQ7tmxICMdFkeToKSceCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794008751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OoJVINX8BcnNTAIBKSuno+iiYgSzX4Li9L975jdSWfw=;
	b=ieQcCsvDVR7BdD5dvoFrTu+FAeeuzu4zFIum3XcPywzoYoDQdQ4ouCAGPA+f3us6zVNi
	 EPfJPTrhBaMtsxNOlMUVDa0hNWbSgFccwm7XFQuYuq0HX/6BMwayAprN6FklEd5lLdmOc
	 yk2MtfHkE4jgpclT7DZPTvtniVhoaL21TagTTNiNI3CKnATuxHFGEFKS94g57gtnHRHkv
	 ATrBVD3yf8SAzHACMUqYnrfAbc77BmTDZm6+Xk4DdjgNJnTaG9+GpBfGS7o0Ti6KRFbyl
	 cKZtTlqwjAYHXGb5+VNfGU/V8jZrxPoTVca9hz6059EeGV070/mF/OaJxVvYMKWkQSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=viendsg5;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D78606A333
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 23:45:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66D78606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=viendsg5
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso85410a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794008751; x=1794613551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OoJVINX8BcnNTAIBKSuno+iiYgSzX4Li9L975jdSWfw=;
        b=viendsg5RXb/88nl+LLv/gEVDv1+c/Gx1H+X72dv0mCQteKScyaClGWtcYx0/ePyPG
         GJ5sRLUDyxov2hL3TtI2Q5zJ6894MYAwHwu3K8H73X6MZaxlm0sNqhF5QHRhrqMTdEgt
         S4EMLgY/WtV6Hgd7OPWcXd/IDZy0eoGgfAB1lzQr6OiKf2DuMNDf/0JYd9aW/gK1VrGk
         ZFTyCVdNsphFv3tN7FRhngbFR0OKZXLQg+o0Fx3HfQ5U4Nc7m4Ozi/sebiernxS3IH5L
         Jc/bgv7vZ0ySsd1R+34wBMIlgNQETsHAIh5ikODOAD8Yt/Om0wvvZzv44R54nnHdQ1LK
         kVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794008751; x=1794613551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OoJVINX8BcnNTAIBKSuno+iiYgSzX4Li9L975jdSWfw=;
        b=aOGACC+ySNpoO9x/QDobLiMdvt9660UcwF4vX93KNkd6Nzyx1V9dg+azcOeslQMMVK
         y1RCgmx2uou69AJ2wXjUuFW9DKqmP/2PoSFqLhz9bqqrhw0O/cS8AhAd7dlLf1UvxXlp
         2RwrzNCFEl2ue7PtM9nS9j30BtjoGIjZj2xXN2/GhuRYORv4XiGsjHuIU6WnDosBRfxf
         KmqVGPuUJN9PQD7uvd8K0VrA1sVrLNdZ0JwhRBSpPQ0XSd7yIM3obofQIF8gPpGX5qOo
         fb0Z8RUMLh0F9IzrVXwDND2QqpFxMjQPIYeASNwwfUODzLzo1vWUvwld1KkHuQQ3Xt0c
         6XWQ==
X-Forwarded-Encrypted: i=1; AL+hErHsDEKtRhkHB1xWL+9lNLHUtWECCKv0Ae2MKsTWNtqPam5NnJ3dzCpBeoh2bYEGo4MP+XteLWl3Zz4MDq4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/12oRgLj4xWJKXsdtX2g4qSf2FTBXB7VI047nbuY33iYBiUHbD
	WRq9usDYXW5w0OihD98dnIBDJzT/+tXirNtD7APAHLIjL8K21jW4s46AqlkQVg==
X-Gm-Gg: AYBFou0AKpKaHXHn/Wxs0gPtHuazdqqHSnuZmPTG5bFpZDRGq6b7+dbdySVBUgX7DLL
	l+t1LUtmUtAQ5X3kCvB1+VQP2LsaMv6OFmfeitnNApHctx/R9jP2FpZlBPkij8zzTHng8PlvfAQ
	fujTx1PagxE6rxYwX5DGPmZJ34EL6g+HRl9+k1xnCBv2EfTPhcReK9cMuxDgxKw1sX1SL3UQM6d
	3wvIKfz4DyKD2LKVCm8VbCmx1EQ29CU70eC9jPXm3rDqzD68bgC8dY1KeOhtlLQwUeqL+Gce03H
	ay92K9zL0R8ZTOd817ZaGtRSYT89ql0siR1WmwVlCtPcpFqoysiCEVZRwymWPd8kCHaKGD8zWHt
	MVVMq0wBLBzSVzrdNAQYU7qcbnFsz44NdoRhpZCmmSg5CvHJg0HCoRdNjDabThGDuFB8hU2hsEP
	ndBaVDArpHbdRQ1MjQI7rGwjpgRg9+GJohI4gCBzNlhx/Xb/8mdSqkQ1J7Q5LXDBITFgoYJGVC2
	YWu4J+SE4NKmLesyWkiP+JceDv+QAnN2wSBocFQCuGaDsVbGkU0FFGZQ+z2OcfI2dni0fbqfpVm
	Y/aUIPsE2dSpyYdzBJOl
X-Received: by 2002:a17:90b:524c:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3b10608181dmr328100a91.8.1794008750759;
        Fri, 06 Nov 2026 15:45:50 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1058d3310sm715972a91.15.2026.11.06.15.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:45:49 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH 2/2] arm64: errata: Fix Falkor E1041 Kconfig name
Date: Fri,  6 Nov 2026 23:45:41 +0000
Message-ID: <20261106234541.1474324-3-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106234541.1474324-1-takano32@gmail.com>
References: <20261106234541.1474324-1-takano32@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Falkor E1041 entry in the arm64 silicon-errata table names
QCOM_FALKOR_ERRATUM_1041, but the symbol is QCOM_FALKOR_ERRATUM_E1041: it
is defined in arch/arm64/Kconfig and used in
arch/arm64/include/asm/assembler.h.  Correct the name in the table.

The E1003 and E1009 rows name QCOM_FALKOR_ERRATUM_1003 and
QCOM_FALKOR_ERRATUM_1009; the E in the erratum ID is not part of either
symbol name, so an E-less name in the E1041 row looked consistent.
QCOM_FALKOR_ERRATUM_E1041 is the only Falkor symbol that carries the E.

The Kconfig symbol is correct; only the table entry is wrong.

No functional change.  The change and this changelog were written with
the help of an LLM assistant (Hermes Agent); I reviewed both and am
responsible for them.

Fixes: 932b50c7c1c6 ("arm64: Add software workaround for Falkor erratum 1041")
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 Documentation/arch/arm64/silicon-errata.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index afea5e57ab95..f554fa04662c 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -360,7 +360,7 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | Qualcomm Tech. | QDF2400 ITS     | E0065           | QCOM_QDF2400_ERRATUM_0065   |
 +----------------+-----------------+-----------------+-----------------------------+
-| Qualcomm Tech. | Falkor v{1,2}   | E1041           | QCOM_FALKOR_ERRATUM_1041    |
+| Qualcomm Tech. | Falkor v{1,2}   | E1041           | QCOM_FALKOR_ERRATUM_E1041   |
 +----------------+-----------------+-----------------+-----------------------------+
 | Qualcomm Tech. | Kryo4xx Gold    | N/A             | ARM64_ERRATUM_1463225       |
 +----------------+-----------------+-----------------+-----------------------------+
-- 
2.53.0

