Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187400;
	b=HCiEiFDjmnxv8JTpwSf+SDinrxoF1EEusS+ElFhjQAgA2Ze18A7yI6W8aO9+OgE1Z8+0
	 iLHj/T5w1XdAo6djnvS2h3ltOYlay0SZMQ+zUIunr6zo1ySR2XnDkOPISDm8GvgIOGL+H
	 J4mZMry1mwb5jb/1UKeoLq90/HRNq3vOK1t0xX1ePk9T30wJwT7gpMdu2CkGXCctyGSdJ
	 jcn0W54qsomE70Sw87dztHuzmfx9pX0Bntcal+CuuKSfvETJn3l6MaDkvj/h8ORiW+qVo
	 6W0+UHpcTPhphnRZ5wTYdRpJHT5xChNAb8V5Eedoeo580MqdIoOkxuxo24Rrp79Z6UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=fjbxQ6n0Zk6Jx+X1WZAh0zL0QQQS32bSK2pYlfdDiyw=;
	b=zi+p01yhjjDRqdOCz41lVvZN4d420EUgwCVx+VQshhVRLGatcpLWUu+Aw5Q159L/yY/8
	 aqRD2LkG0lQ9m47ojXgX3Uxmoy/K0fnPQlY3aH/v0PeY6Qc/91L6cT4UgQ1VwFoF68ALi
	 4nqg5xSJfxKzBkF/E0+aIbv1CtFVGgrZibX1ELN1ssQfqqx8/BOeux+lhPrtrrL/HlTsu
	 RsF4DdI9uZUABP3+hxXOSOHifRcG5ubzrP7n+o+I8J+8x3vPVBIjoTCcpJuBOMFNTwWKa
	 40LjUykPNJCCFPDjrIEWeZ5y9IL7/XslDLdZv2RwaIYyNtkx1c62d+2mF9iNYGBpFwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ASbsXd5v;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CC3606FE9B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 01:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96CC3606FE9B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ASbsXd5v
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-170135e43c7so469743c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 17:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794187399; x=1794792199; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fjbxQ6n0Zk6Jx+X1WZAh0zL0QQQS32bSK2pYlfdDiyw=;
        b=ASbsXd5vptVY7r1J5dOkvhmj5G97jhirKhnpXabNrRRYcaXrSmAafoj5HisfZWS1Qk
         9CBegw8w6Bv/GC81m0zRAiAx58/8qxgWWg80BsCzENG+jKRPzli7Vz+0IleO3uIqUKV8
         qb+fNKm3Y2hzaEoiSBSkyDS62VSQ30HTc5Ak79aUKS12YM2NZFU7lFEsKfAQNF/adHR/
         e0ECf64jMpI5tJ1Kp6NLHg3e6YuEXw7kf4aiCIHC94DvHuyt+M8oQ+d/cJF1MWZjaocU
         AtqF8Zwi/vdhw8VC0OWJEHvRjM6QUcaZ2i5q7RFo57tCFaHCvWaSWUyPj/91jr3s0aja
         bJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187399; x=1794792199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fjbxQ6n0Zk6Jx+X1WZAh0zL0QQQS32bSK2pYlfdDiyw=;
        b=nXjoyzIUoiR3tTNJvOIUyqcmeU/fecKtZ9ZU9ylaqJ8nFzDBObNaf9bvI3OZf3LAXK
         66hR777Wq5Q+MoMm3e+6bRP0PCo8XNq+r2+0s0ifMTGLIm3NTucPGJWRAmmnMaYNSEFa
         KsE87MuTlS+C6geguPQm0kiE3kaNff1Hks6wxtELRf/fGK1mgnMyfpbGziV0OFkO03eZ
         WxB60rMmxhD+UhsSHX8C1DTO9EkBTR3p2VX+XrOtw4Sa6Ec8d3lPR6EZnsxyb6NlmxZc
         HyNhfDJfLH352zz/zVI2x7K2rs2xwjX4TMSyWrazx6st4TvsGvPveHyHGl7hEg/bTLSM
         fEqw==
X-Forwarded-Encrypted: i=1; AL+hErHDFoRmpxpeknc5Ot03DLayA7fu9G8B0GiqBiIpGD65XO3Q9wmC4R/bri9vb3YPotrpXSTyyMM533nsegk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9B58K08TD50YhfsQ1DfSUNQ/3jR6qPCGgd3UGVLNgTr1WXogYr
	MCQLeaLYbgkfqgnMnHb7NyQ7MA66ucy9sSyl7Gagh8MrfvFA2WgY6tYK
X-Gm-Gg: AYBFou2/mvE5nwmyqN0QRN58Jv/UCupDQkV0KL6ika1cqtkysmw5wgry/R0hY9U+0Kd
	bMYu0vBRKQf6sk48YW4aNhgRtFiEGmLTFF6yFSiw/JxBIfKBFen29rU1ViICBfWTHoL/gpvsOPq
	5W2yfTBN+SrGDq0NFmOzs6Pc9fd99rTfDyd/9AP3nGNB2xX2qx8UYHscYbh/2VZ8T1PpS/EGHc1
	0yXewBYdLR4n0PfBadK0w6WQ5lJPJDGtqUMaFRyiWAO7r5ULzL+UKi/TPsV8gyDJbYSXCd59VLs
	k5IgEXrpKZOAzlRx0j6ijY0IUQfCNYL68pyr3SfVo0SW0wxAZ6geRIGGQiMuhXXXJ8tTpm29Omd
	Uqc7nDzRXRzE1wEPgG/cixrTkK3gMBuXshbP9jLdyIaElCnkWpnPKeQAzV6rheGqY+efSYS72Rs
	uVh/+iT4zu2Y+2l3S0tXggAekzdZMJxoWfxgaWfueIJx5wIeI5U4TpVM0vPjacCnJ3yx4yEp/QN
	E6oiJEd0RnZlyvQPQiNKQGseUrDQh1iLISPbaulkH0SoM9sF3vqvCqzGg5oRB14yeUzxQguumTH
	P0/VmPfjZGDFeB8THYN60djS3/t+7BxCIGrHSj9j19+/Ug==
X-Received: by 2002:a05:7022:1701:b0:1ac:1343:fa54 with SMTP id a92af1059eb24-1b39fec8a94mr3868482c88.14.1794187398555;
        Sun, 08 Nov 2026 17:23:18 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771ea85bsm9428226c88.18.2026.11.08.17.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 17:23:18 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Sun, 08 Nov 2026 20:22:53 -0500
Subject: [PATCH v4 4/5] selftests/mm: move waiting for KSM full scans into
 a helper
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
Message-Id: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-4-86be8fe77e7a@gmail.com>
References: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-0-86be8fe77e7a@gmail.com>
In-Reply-To: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-0-86be8fe77e7a@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Xu Xin <xu.xin@linux.dev>, 
 Chengming Zhou <chengming.zhou@linux.dev>, Stefan Roesch <shr@devkernel.io>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

ksm_start() enables ksmd and then polls full_scans until two more full
scans have completed, so that any merging that can happen has happened.

There is no helper to wait for a number of full scans while ksmd is
already running, so a test that needs one has to copy that loop.

Move the loop into ksm_wait_full_scans() and make ksm_start() call it
after enabling ksmd. The count is now read after ksmd starts rather than
before, which can only make ksm_start() wait longer.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
Tested-by: Andrew Morton <akpm@linux-foundation.org>
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
---
 tools/testing/selftests/mm/vm_util.c | 31 ++++++++++++++++++-------------
 tools/testing/selftests/mm/vm_util.h |  1 +
 2 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index caea045fa7d46..8184691211acc 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -992,35 +992,40 @@ int ksm_use_zero_pages(void)
 	return ret == 1 ? 0 : -EIO;
 }
 
+int ksm_wait_full_scans(long nr)
+{
+	long start_scans, end_scans;
+
+	start_scans = ksm_get_full_scans();
+	if (start_scans < 0)
+		return start_scans;
+	do {
+		end_scans = ksm_get_full_scans();
+		if (end_scans < 0)
+			return end_scans;
+	} while (end_scans < start_scans + nr);
+
+	return 0;
+}
+
 int ksm_start(void)
 {
 	int ksm_fd;
 	ssize_t ret;
-	long start_scans, end_scans;
 
 	ksm_fd = open("/sys/kernel/mm/ksm/run", O_RDWR);
 	if (ksm_fd < 0)
 		return -errno;
 
-	/* Wait for two full scans such that any possible merging happened. */
-	start_scans = ksm_get_full_scans();
-	if (start_scans < 0) {
-		close(ksm_fd);
-		return start_scans;
-	}
 	ret = write(ksm_fd, "1", 1);
 	close(ksm_fd);
 	if (ret < 0)
 		return -errno;
 	if (ret != 1)
 		return -EIO;
-	do {
-		end_scans = ksm_get_full_scans();
-		if (end_scans < 0)
-			return end_scans;
-	} while (end_scans < start_scans + 2);
 
-	return 0;
+	/* Wait for two full scans such that any possible merging happened. */
+	return ksm_wait_full_scans(2);
 }
 
 int ksm_stop(void)
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index b5d59729d4327..7e00030077d2f 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -162,6 +162,7 @@ void *sys_mremap(void *old_address, unsigned long old_size,
 long ksm_get_self_zero_pages(void);
 long ksm_get_self_merging_pages(void);
 long ksm_get_full_scans(void);
+int ksm_wait_full_scans(long nr);
 int ksm_use_zero_pages(void);
 int ksm_start(void);
 int ksm_stop(void);

-- 
2.43.0

