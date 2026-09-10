Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6FF489FD0
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045025; cv=none; b=AQZmkA+dYbuZHBndqKh2LiwTU76K1NjQQ2U1FMAaxThj9zkhLTv35kgM+ReE6rH1Fczxcm14o0c0txvm4O8wGz71kjGTTLqZhHhvxrbSHEucUMwHe2YCgy8Yc3B871tTTbDjj9/vE7aoEulKiBFhl0MmQS4xlIow51uwtAaB2PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045025; c=relaxed/simple;
	bh=gFGy71C2eoTN3BD7btjLcX7mhlzhINqXiE6srCYAltI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DNy2rPUNiq4y6z18p0Z5Pykw0ay56pMjCYmUtzbl39y49eKw803i1DnXJ2dNOX2Ly0hBT6XGRr0iIVJfp0dr/VaS8i0eWdxiU9WrUw3DgJrxNz3phmGZcPRDTXmbqkmvEBaoDB0xHxMJi2mP45GdgizeWIcwnifEbjxuKaXm/C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J8+gHB5w; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J8+gHB5w"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-396a51b2605so2892790a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045023; x=1789649823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6mRdG/Kt6hS/eZlSBVQMx/QTMGuDSPWApxK45jZ1fD0=;
        b=J8+gHB5wwAr6//E0BhOL11YFPxdzUJiarVII9E3aM9VU64ickEQigEnEZFVDgRfjnS
         EQCGiyP7CpG75IH0k+aqbtEwrlQLGa4t7Xp+NahfAa6ihKy6m5GWYd4OprDvFFVL/zmr
         VAA01Y8uEQPhGGjIUwfSGlIN3YUjZthzX2oi7QHJUWfXzrTpW8mODBhNCCpMlfApGsxe
         rdUuNPiLUVYgF+uwq3lZAdr3+PGGMymrbtKk6H7DT2AHYVM1+iK7NPzfyZ9dwuffeRos
         YilS2cwL91tKDRAztHVFNh3Nvb1PT8+ehULBAhSXnY/Eed24t0KJHuHxnEsnSK3L4/Aj
         xTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045023; x=1789649823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6mRdG/Kt6hS/eZlSBVQMx/QTMGuDSPWApxK45jZ1fD0=;
        b=r9mPZX/VFbDfE9CoB1+OwVETAw4pz2HQWkSKRgBYbYJ+Np4AvIEaNTSo+qFpNMpaxW
         G3sLu988jXZln4r2oAIPZrHJdy0GJSfZOwcEI4V8jPiCaUXMXVAkvSU/VRs4EHwa1PnX
         HyazMItSrlsuCe6RpQsqiFr19r4f7MqwgMWFKlPAf57CJV5BzqVBokiYMNgAom5F4lA1
         DRoVI9vmaK1y/egbNmZ1E3LgIngd/bQkoo/re0KEgyouVRSFoIIXZ8XSDRbgK1Y2phYT
         pByeijxAKMF0a9S9o/72Uz13gWOv8i2m2aIwGe8SOppMmsbVg649T3NV3ET3cDcgQFQg
         yW1g==
X-Forwarded-Encrypted: i=1; AKwUvBxUvEu/0I6qzDxtn71cFJ7wYALs2p1Eiqqm2jcIRvQD+bZwc8fmSqXkZGPWQdNdNJzLwc+8AZoxtPc9/s4=@vger.kernel.org
X-Gm-Message-State: AFuF++mJ1kaRccCE+Qx/sOls0UAGTtlybiaIeXT+TLb1OIaFuGi7XvY+
	vyZhHUWR9scvRbHyuQnVn+DwIhelIYhiQ3yavQUOFxsx6vdgKsB2A+On
X-Gm-Gg: AYBFou3GQN3GD3miDxVXVA2NztWd2VvIcHS0GBGe1Yum5OjQUtbGrOHvb56Ua2PVNRa
	caFeTX+NKiqpN6E+RXqowQZ7OfwcbfGa25RA22ZmjlFnBHULDlY7HNGg2W8aoTnRuIbx4/Mc0hu
	tC21xOh5LRHfhDQxuHV0jG39AqfWFY2O2MA8eQRcfTFQWDaEAJddNUL1xa3f/vKOjOvMcrXNbxv
	ws51RsbmA37oSCMDewewGlRRWZALieyfosIIi7PfTefkyjcynT+ZivbNU7UrM5msM1EoCcrjjCi
	V8H+rHyJGz/yXmh5fAgkuneNwR0waAfeLtwYb2DE2OXysNmMWQNTzJTSxu5oYX9vthdFWIwwyRu
	MzBmVSEVjqE/lOigB5s3oEYcPO4Ueim5M+r6toQTXkMb9qXEyytGpU0XUAI+yH+XiIfeb3zSWQ/
	YIjdmYeihRVhSPguxG4qEpCYKi5ADcjCf3ACMdGOGCKmkFCbrVg+7JnOSSRw==
X-Received: by 2002:a17:90b:2d0b:b0:398:c794:ca26 with SMTP id 98e67ed59e1d1-39b263167f7mr60407420a91.25.1789045022916;
        Thu, 10 Sep 2026 05:57:02 -0700 (PDT)
Received: from fedora ([69.5.53.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e9014cbsm4800488a91.16.2026.09.10.05.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:57:02 -0700 (PDT)
From: Tianyi Chen <diannaaav@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joel Savitz <jsavitz@redhat.com>
Subject: [PATCH v3 RESEND 2/2] selftests/mm: Only prepare ptrace_scope when memfd_secret is selected
Date: Thu, 10 Sep 2026 20:56:45 +0800
Message-ID: <20260910125645.285866-3-diannaaav@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910125645.285866-1-diannaaav@gmail.com>
References: <20260910125645.285866-1-diannaaav@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyi Chen <hi@tychen.cc>

The memfd_secret setup clears ptrace_scope whenever its test binary is
executable, even when a different category was selected. run_test() filters
the test invocation, but it does not protect the preceding setup.

Check the category selection before entering the memfd_secret block so
running unrelated categories does not change ptrace_scope. Keep the
existing executable check and the behavior when memfd_secret is selected.

Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Assisted-by: LLM
Signed-off-by: Tianyi Chen <hi@tychen.cc>
---
 tools/testing/selftests/mm/run_vmtests.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index 9e62ab4c6775..9bbef9410ccc 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -370,7 +370,7 @@ CATEGORY="process_madv" run_test ./process_madv
 
 CATEGORY="vma_merge" run_test ./merge
 
-if [ -x ./memfd_secret ]
+if test_selected "memfd_secret" && [ -x ./memfd_secret ]
 then
 if [ -f /proc/sys/kernel/yama/ptrace_scope ]; then
 	(echo 0 > /proc/sys/kernel/yama/ptrace_scope 2>&1) | tap_prefix
-- 
2.55.0

