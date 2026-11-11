Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383580;
	b=ps3TjCgsethpQyyF8lfNRdqWzgEviNNIHXg5/E8xecCd6WoV1ahjlWmrT7wPTiafCqat
	 192+ZJ4L90YrQ8AJJCoiD0jFlFrFwBW5fX08Ql+LzIeRHmDwHz144QmyArI8x9RB4io1f
	 swQX7IhPQ5AyAq2tm2aFPCMsSGycYu5lBiUsMKxIAmbeKjIzYbGCGieWmgFPDD95BwAkX
	 uW50Jcx6Q+7McYxRVDglKM077z2Iv7xLM4TLkC5r71/omeHFwII/joUJDGyiZbcs3FrpI
	 aXnmnv0rPPeOt0xU8ptIwheg28o9uPOuBjlVVkyATGFdztpbd1awObmYQdHKJl2PYFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=HqU3Pl0zqzkcuaNDEwB/Ax9fkH+ammw/qBuPNlSTruE=;
	b=vIOTKj5UieQ30WBReNjAJ6owNN/9ZVtqyIP9uVdS49PURGAyNw+2eOCk3yamZA71tDcu
	 x7mHrGQcxSAgLuSf8XzRRzUFenTntENb7NdhyFiVZ6pUE41gxeFjoapMfuStbr1uaTMRF
	 COUWF0mxCPZqTmT3sdWhNqCUHbMCPvwI5v969EW+NlHN34w0pdh/6UXLP20zcYEmZ/8sC
	 niDT39CapNMWSQ56zKnnHbYD55b/UO2HyxIhenT6ylwiGuOgnGAyrmkdkaKsTqxWmjxCc
	 1djhBHAEyrdRG2H5T8PgCPBMYGcqQrCBQrOKDP979T2/XoC4SFck3Dj/vkKjcHixNsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=i5l4IQz0;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF463606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF463606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=i5l4IQz0
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a052aff9e9so2277314b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794383579; x=1794988379; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HqU3Pl0zqzkcuaNDEwB/Ax9fkH+ammw/qBuPNlSTruE=;
        b=i5l4IQz0R+5YDpgXbhNWm7SdEua7y+JqwkVB9L2Qmr0CchldhP1OXMknep6mO2f5aT
         TKQYC1CHS27Oa93etO0nrex+1MU7CLFaI8gawX7do4mO46mRVW3Hw1yF+zh8bTnjZDmQ
         ageR2iK28RVfCgexgqgAShQZAdFw5WCopmSC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383579; x=1794988379;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqU3Pl0zqzkcuaNDEwB/Ax9fkH+ammw/qBuPNlSTruE=;
        b=xEmajsg8qyFf7Z28CKkq6bf8O+q+/yyCKjzwWWkiucNeutn1NVPNiTtOsjdnq4dqMz
         Y6LnUCTMPRXwEbqWsALCF4KCg6yoOnx0FaIxe1EximBTMYezi8FTX2I9Pc+m2lDs4ngp
         f7NVnSS4Fk8utzOOcvrBb4ZT+AU8hsRfAeQ01m5HrLeWkOHAftEGEFFNtWkY9yea4IlL
         GFgkDycw5DQnXsCfbXhrvq3q51/Tm9Vf99qmq10sLuvJdOnesIr8OGF9KKV4nEJCAu2o
         9dkuPugiR6DoWnNUzr/Bc519s2IUlj286BdtV5Nffshw2yoFZRPwEqUfqCIKk2jA4Y2j
         Pzag==
X-Forwarded-Encrypted: i=1; AL+hErEbqAx9P8tsdm32vZpi3RMmXq0rgxF7/1SWSHHFXukWA+k9FhnS6EwkejH2wlKfyTseq7NX8L86Ql0UGC0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KC9ttxq8ch4evCWM0eeikxbMSTr+cpZGLf43P3gbE74PPZl2p
	GWJX3W4cJPiDaYDVowMroPFO4jOy4K76f4k8gIN1CWfTP/Eunrfn/fempYNYFrkFIDI=
X-Gm-Gg: AYBFou2DfpP0dEtEr3R3MOfMizZaWpjc6hujVoWbQGVSLcTYa88MZJguhEYE2ZPBikU
	qg08rh1YSCnJOwD3Inzs57cRRS63DnvVklVU29FbguLBmktTFCA1yOG7cwpW1g5Y1a9TlD3mrbF
	gjcskKfjGbXMFCDKqo44qIdD7mqB3it5OkMCqnFmJ/6HrH5uYLr9c7qTPqsgjQ2F9xUeHBGsyoE
	mt1Ftn0M1D8FE3lGn66tbW7UGHiQLekRdVleCTBx1djUKKt9dYMuu5GtArcZhO7YMIP9eK6FLsB
	tattUekhUhVPCAkFqiu0SLrFpXXXr9jUHHT7nwPcVBY4fXUrvKQASyufLFithN1VCFsfQEAWFlS
	58CN1HRdPhNaQF5lwoMkoDo//JKyBZajAHZGxOIq2DmkJA3amUWRLQviF9iBCw8skP4uiwhYswx
	6tGQ3wWwK4Is+Q3trGmjSiNTc3w5jM/0b0ijI26o8t4/9o7dH0qOpi+lQF3wSI5N0GRJ0lIBez5
	hTt89mmtnDxic3fWhct9cYjx6Ez//wHaEXdoG/lvSUde5h22bxt38qPo/255rJNczFD/RZFJvjd
	rFi6j3M6P5VHb0UwRcNOrP2wC7CGVSoHDj+T0rEk2EIcKAU9vHi7FaZIVbmSKV/uw38/xpXLJSD
	G8PLP75QZwg86ipB5lyzv+l81lrRYxKOpcli9D5mYmQ9HSW3o/QWaPSp4wXSYtjhqXh1OL+setl
	0yZXf5Iij6rxFQY1RnJy3UcDWnzSKRCHGz8YYkcJWmfN8iUq2iKFLx
X-Received: by 2002:a05:6a20:431a:b0:3e2:47ab:6a25 with SMTP id adf61e73a8af0-3f2fe3d4734mr1995928637.46.1794383579151;
        Tue, 10 Nov 2026 23:52:59 -0800 (PST)
Received: from localhost ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa86e030sm1861501b3a.27.2026.11.10.23.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:52:58 -0800 (PST)
Date: Tue, 10 Nov 2026 23:52:55 -0800
From: Chris Down <chris@chrisdown.name>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Breno Leitao <leitao@debian.org>, Alexander Graf <graf@amazon.com>,
	Baoquan He <baoquan.he@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, kexec@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 1/9] kho: Reclaim the metadata page left reserved after kexec
Message-ID: <63ca64c004b296a998a3e531f8c0c4964916b70c.1794383544.git.chris@chrisdown.name>
References: <cover.1794383544.git.chris@chrisdown.name>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794383544.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

After a KHO kexec, the new kernel keeps the page holding the previous
kernel's kexec metadata reserved for as long as it runs. It only needs
the page once, since kho_in_kexec_metadata() copies the previous release
and the kexec count out of it at boot, and nothing reads it again.

Free it with kho_restore_free() once copying is complete.

Fixes: 76aa46b9e404 ("kho: kexec-metadata: track previous kernel chain")
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 Documentation/admin-guide/mm/kho.rst |  4 +++-
 kernel/liveupdate/kexec_handover.c   | 10 +++++++---
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/mm/kho.rst b/Documentation/admin-guide/mm/kho.rst
index 902d171a780a..f9d2cc5999ee 100644
--- a/Documentation/admin-guide/mm/kho.rst
+++ b/Documentation/admin-guide/mm/kho.rst
@@ -120,4 +120,6 @@ stabilized.
 
 ``/sys/kernel/debug/kho/in/sub_fdts/``
     Similar to ``kho/out/sub_fdts/``, but contains sub blobs
-    of KHO producers passed from the old kernel.
+    of KHO producers passed from the old kernel. A blob disappears
+    once the kernel has read and freed it, as ``kexec-metadata`` does
+    during boot.
diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index eeec298aa9d6..3046b89e5db4 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -1808,6 +1808,9 @@ static void __init kho_in_kexec_metadata(void)
 
 	pr_info("exec from: %s (count %u)\n",
 		kho_in.previous_release, kho_in.kexec_count);
+
+	kho_debugfs_blob_remove(&kho_in.dbg, metadata);
+	kho_restore_free(metadata);
 }
 
 /*
@@ -1885,14 +1888,15 @@ static __init int kho_init(void)
 	if (err)
 		goto err_free_fdt;
 
+	if (fdt)
+		kho_in_debugfs_init(&kho_in.dbg, fdt);
+
 	err = kho_kexec_metadata_init(fdt);
 	if (err)
 		goto err_free_fdt;
 
-	if (fdt) {
-		kho_in_debugfs_init(&kho_in.dbg, fdt);
+	if (fdt)
 		return 0;
-	}
 
 	for (int i = 0; i < kho_bootmem_cnt; i++) {
 		unsigned long base_pfn = PHYS_PFN(kho_bootmem[i].addr);
-- 
2.54.0

