Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A50B3FA5D4
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787821620; cv=none; b=ho6xbkyAPcNcpAiXBbF+giEfpQiy+fOemv9fDMdN/axAc910HI5X7/LHB52SNqnXTNAzmUJAsfjvGMHWthHW3iI8kki8l9SSE/ME4nZh3rLeerHa0NtLaLZbICnTk1PHK6UFfPuCeDcVcLds/Edf7syq+tepQTgTqlSMxFbb/PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787821620; c=relaxed/simple;
	bh=Dv5HfCA1mSh6i3Acx6oZ4tgPaqHqwItmYmm43jb19IE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XoeogKmtQMyl+aNnxjeCkXDLwoa+O08qGIov/Zgwwpv8QjMmavJaT7O+yF3qSKBZK2iDbp31WBhBm8BWfrct99JI8ZsRFeIiphIbwfYX1hWwbsZhjO+AZPr/iy5VV/36UOG9mvC+5Zfve0/Eczn5j8mvkUh1bwR64eNWcZLi1BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e4z6cNlw; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oYjW2WBg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e4z6cNlw";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oYjW2WBg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787821605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UnIBDxp0KwBLclKxiCvoL0emivWc8/d/qvxTInSqzl0=;
	b=e4z6cNlwkhkpmHov3QS3aIc4xb3Qp9+XWalZTysRqdkhFIhcaI80uKyxYqGY7iOtetBMql
	r/QqYF6KXwwM6OohpJs7Ccd/dsmdpVZLOxz+e3Pova+YwHEw7QvFpCdLPMocl1mR+MpyI2
	weN0wtpJAGqskC8FCNXC+haybrrXjOQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557--KwsTIZ1P4-7jFP0xx01wg-1; Thu, 27 Aug 2026 05:06:44 -0400
X-MC-Unique: -KwsTIZ1P4-7jFP0xx01wg-1
X-Mimecast-MFC-AGG-ID: -KwsTIZ1P4-7jFP0xx01wg_1787821603
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4997b060af8so10402105e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787821603; x=1788426403; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UnIBDxp0KwBLclKxiCvoL0emivWc8/d/qvxTInSqzl0=;
        b=oYjW2WBgwaPCifGU9A71LJ3LNtT3IRqfjNBW0EzIJpXU3VRDAu9QmknI+ZrTvwLIHf
         +iKPhzarcZosnU80dN2Qb0B25u2NIDnC0Lql5EnPzoRycyrCOB9oVmuwC+NL8/M/8a5T
         CFo4bWwYJ8jQkgBdfQ1Q9S5/E3OC9sZpBuT+hYXcFODxjVicy4JUmJ4ktrwd9qyduG8i
         e12VaLHpT45UawLrcQcQ7pwfi++OdzXd0yy83lHfcUmc8kr1/XiB4tJt7Vn5crXZIGjh
         40pipkaMmXPk7clzG6R4iLnmTzzT4KWmYANOUu9lc2JrFLn8k+dF4m5zvjdxQf6u4MM7
         UkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787821603; x=1788426403;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UnIBDxp0KwBLclKxiCvoL0emivWc8/d/qvxTInSqzl0=;
        b=bpIqlL3MIhJvZAxFq+XCy46dP1ivyQzdSKHQm1VyFIAo5zc1bY3QL02IaUHrOjH4bC
         rwzdn3G2Sg6tN8wzG90xZjuyvCHn2KCW3MixFPOCJtYuXFEjJW4nGmaB++Ul2szMelPv
         V0Uy9tKK2MqOrZRbgoHwwDxaQTRDNZmJfCAvWUmbQzKzKfYYID1PdnYNqjTvJuORlYWf
         Dcm46UgvUPSI1Q7zzUWoE8E7FVgx7TrNmrldovbgP3cXmThRNRE/f7Yz3gBvG4SRH+iB
         YyBF3dhL9JRXltMx41QgkD1m9Lt/BM+0ObdiECUEJDmQPnqMQU34TK8h/Sd72R4t5cM9
         DNig==
X-Forwarded-Encrypted: i=1; AHgh+Rq3Ua8cdPiVKZBQpFw0CMzWvZP0uO2vuxE0ofa8VpL2LU3kkEvH4ozE17Jyw/d/YYqJSg4u6gKaxAyeE1I=@vger.kernel.org
X-Gm-Message-State: AFuF++lz1+lG+60dRVMEnymTZoWlv4pIwODGeM60ixo6PXEGVRqwJY74
	m4veAVw0zg2wmmNF2BXmyDeV926sV23+96QaOePjAmQ2K/fDBiOf2jDM7Jaczqy+RV9/Esd1Ch9
	3E5JooGx+SLgWxU9UohGvUiiRFExE1oHIO2//+m/XV1di/Z9s908PPJWIDQPbhrDjdg==
X-Gm-Gg: AR+sD12P4J/ZgsUpcZK78Z7iNh6mn9syrxiHTYy9S1XmeHbsY+Nk1wdLlvhVWChbv1Q
	nmh0n7bvzSWPOHyjItZFui+QigquDptW9jLn3afCZCZUApyirliV8n6HtApmo3jdW/tIKJTPUP6
	oDDfQa9NEyXxZqri7lYXsjQ6P4xnZCfAJaaeSuXCW6PkqxlOInDN5rg/oCNHfANaAbGwZg2II6G
	HMBW7i4FXZlPJJrUSTY55kVdJvRhXWRp9bv9ZFlQVh2vFxdOhDqKKBblhJ9MXia5XiAWzsp+cBe
	lPFRea++ic1KJ3Zjrt8SDHXSIvePsh4cPUS6PUo6OQKe82p7XivyX30G+bmfrkYaCstHQF4+GNl
	nu2rmQ/FXMwo9LRz2
X-Received: by 2002:a05:600c:37c9:b0:49b:2796:be30 with SMTP id 5b1f17b1804b1-49b2796c07cmr65580705e9.11.1787821602720;
        Thu, 27 Aug 2026 02:06:42 -0700 (PDT)
X-Received: by 2002:a05:600c:37c9:b0:49b:2796:be30 with SMTP id 5b1f17b1804b1-49b2796c07cmr65579825e9.11.1787821602271;
        Thu, 27 Aug 2026 02:06:42 -0700 (PDT)
Received: from cshulyup.raanaii.csb ([2a00:a041:e223:1b00:cde9:6812:f4a4:646])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd55dd4bsm54770655e9.3.2026.08.27.02.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 02:06:41 -0700 (PDT)
From: Costa Shulyupin <costa.shul@redhat.com>
To: "Paul E. McKenney" <paulmck@kernel.org>,
	rcu@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v1] doc: RCU: Fix typo
Date: Thu, 27 Aug 2026 12:05:06 +0300
Message-ID: <20260827090506.1172620-1-costa.shul@redhat.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=true
Content-Transfer-Encoding: 8bit

strategem -> stratagem.

Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
---
 Documentation/RCU/Design/Requirements/Requirements.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/RCU/Design/Requirements/Requirements.rst b/Documentation/RCU/Design/Requirements/Requirements.rst
index 8101fe6229d5..b10e0484ae13 100644
--- a/Documentation/RCU/Design/Requirements/Requirements.rst
+++ b/Documentation/RCU/Design/Requirements/Requirements.rst
@@ -1442,7 +1442,7 @@ periods:
    corresponding CPU's next scheduling-clock.
 #. CPUs mentioned in the ``nohz_full`` kernel boot parameter can run
    indefinitely in the kernel without scheduling-clock interrupts, which
-   defeats the above need_resched() strategem. RCU will therefore
+   defeats the above need_resched() stratagem. RCU will therefore
    invoke resched_cpu() on any ``nohz_full`` CPUs still holding out
    after 109 milliseconds.
 #. In kernels built with ``CONFIG_RCU_BOOST=y``, if a given task that
-- 
2.55.0

