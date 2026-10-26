Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023805;
	b=leryG9fGndA6L6Nnb64lt2Rw7MZEz5JgvfMhyjMpTO8NIRkSlZrfF0p1PYfjgbTQjfIQ
	 jrpD6Xr9MDHTC20YOpSww0rGBcp2w8Dz6KAlHKH3B5riyw48k/XeaKcmasF/pKNPbQSxV
	 Vf6sKkJ1L+xqmkQag+/AJr/5KeoX+ENMAWMA8nvo+q1ah3HT17NaZhxVKUo7hBCpVjKcj
	 NMzHmf6gakhnyVe4A9Hkb3jNBaNZvZaRzRr4HmXpDPWIcpm02ChXPeufwMGLg16oOfx55
	 afP3o+sr6TO90qyS9quj7yqXeeQvAR0QcQuPzC56OtVZPSxabSHwdxNEFQDQTrqA71w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=bK+ZQ/EvBU7KRwa8afyK/LFrCy8A+Duc2znXk3QqQOs=;
	b=RCzVdJMI7xLtXf0cZCQCUGZcKgBAjP5SMjU6lNpT87XojMHeYK0WTuGGyEqN1y9vnf+C
	 cpOPes+yeDectkEdt166w5FCkhf6ZIBHWA9A8ffz1tBTmGraBXD/yFdW4oSpukO0O5kq8
	 VPUKeCysA5iQIeU3pSXOQGP6ABJ6RrtGeiVkUx/5cDi2nj/ohCkQmC1DjUfltkkTkUrDk
	 YGOpvVAxtgQu0n7PSz6U8NtSTLglBakjqQSq/4O9P+wQXbJMaqtRKnD3jVgpXbNja7q+6
	 LrGbZAX6PHGPbsFY5fBwq0UWmdZtkbEz1Op1ClhuVZWxoGhHQd1y7/3stmNpmKXJoXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=YtCv4GQg;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C356606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C356606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=YtCv4GQg
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc502d509c0so867482a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793023804; x=1793628604; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bK+ZQ/EvBU7KRwa8afyK/LFrCy8A+Duc2znXk3QqQOs=;
        b=YtCv4GQgtYbpp0FWtnOdmC45qR4k3IQOXQ5EU8lVqySPMb2rk8br7NleWPFst1vCK+
         FWfz3egqb0T9MZwhgkZXzXL+wKAY5Em4PjdUX9fNx8ZjmMH2HWICkVK9WGUkhKTjVzGn
         kIAdIEp3XfcTHdMO5hZEhu8zzFN+JwLlkte4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793023804; x=1793628604;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bK+ZQ/EvBU7KRwa8afyK/LFrCy8A+Duc2znXk3QqQOs=;
        b=cqvzPFqpWlBvJ2dYrrjj5yCUI3uxiYBaJ7XJvBnOf/qSz9Flru9j3NepOWhZlJVWAV
         oCvKmHtjCFYsnHzP1EtpC0Dgmg3MFLfdPVVg3WS2xa0lJoQgJnsJYqaGGzKB2RbPfs5b
         POcHoYcWewAISfSTlJZDTC1W1uOVZKnutOAaa3UhrfpyC1SlpdPB6i2+FvqLGXa2jE3g
         HNimqxLrBkUtOPooF1PkBCRzpzxFWJ5gHR3DP2C48WgjnhWi/qsjqEXsGiIzJ5WpaZi6
         pSDYG2ZYaa5wCP6y84U2raMhPdRUy1qYvH5F4SlA3Xyp4BCBujEVunGL0nBDYHbUvooe
         mN4A==
X-Forwarded-Encrypted: i=1; AKwUvBxu2fycsLogQJLmV9kaEUeW7pNZA1NjF8NRlQsKgDRPsqBNkgIlyDETDFh0wnDlfgNl7L1YlYma4hmHzz8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK84XaiN8GgyBvnIXm3cUKoTvEoXiGEkwiZKgd5qQAO/30QrS9Q
	Rg0pFoG7pLuR5tJPAMqPRGcqvT9UFDX3c2lDOKAAIDhEqzsKN8Y825zAahlEX+P34As2iqFJZj6
	Gh+P9q0cYfKacz4c=
X-Gm-Gg: AYBFou36atj0eHL4HG0gBEI/sLLBtX1p1ikE+aUchupm0VaY7GCQevotUVcNIWZBtS8
	5hQA3jkg/YA65JhwcHU6VuYxXbZKlyBDIZrB2pajlX1tRTKDIx60YTGahe+Zqa0O54sLRG/zmB6
	MwsHnZkxjDxOZzSd2cO1ux/V1bHvqKadw4arVl1lrxSDQKelzBLtKWOYNJ0Rafb/xeENloSu8KI
	QNO/jVcURQFUN/kCsMILAr1IGpZpKm9oDs5fMM92QhD/1j2OTmdvxArnSiueXRTJfjibD/Qc9o9
	iSPyIAgI/Q0oN4YansxWCyoFxOxg0KhiR28V6QBwHSLf7DY8lIktH+MTjJufoy/PLlNGupHmh0q
	bONJDnMzk2BVOBZrX31+91mRyKhvxfcAOjOtMlRxC8e0HF+xf+lNtZWxYUhY2bAauXjK3Atg0r2
	KmvLK7s97SsHrjfTq6mMDSmnFg4FoUuDxKWSgdRqC62PXOIRXwK0bk/4UJIBHSEzy1dETJSsmgO
	MWTwPy95EVnsAjJZYkdX2FrD5g5GcilQ5kuTMCcnroayBRal4FWe8aXNwQzJ2rtyzT7dwBoAVbk
	SCFV7Y31+9sA5dQAXN9br4EusvPw9+8PsyTH92yTNxilzv1+YadjiTUAlBen6Yr6+T+EnFYL4Ri
	czuFP6MfB8yqj5AWWJ6osw3E=
X-Received: by 2002:a17:90b:3c05:b0:3ac:a7ee:6780 with SMTP id 98e67ed59e1d1-3adeafcf072mr5341249a91.66.1793023804351;
        Mon, 26 Oct 2026 07:10:04 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebacc885sm8579201a91.5.2026.10.26.07.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:10:03 -0700 (PDT)
Date: Mon, 26 Oct 2026 22:10:01 +0800
From: Chris Down <chris@chrisdown.name>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH RESEND] x86/ioremap: Always incriminate the caller on failure
Message-ID: <at9fOaosqPC3sslL@chrisdown.name>
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
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

On my T14s Gen2, I get the following on startup:

    e1000e 0000:00:1f.6 eth0: Intel(R) PRO/1000 Network Connection
    e1000e 0000:00:1f.6 eth0: MAC: 14, PHY: 12, PBA No: FFFFFF-0FF
    sof-audio-pci-intel-tgl 0000:00:1f.3: warn: FW ABI is more recent than kernel
    ioremap error for 0x930bc000-0x930bd000, requested 0x2, got 0x0
    sof-audio-pci-intel-tgl 0000:00:1f.3: unknown sof_ext_man header type 3 size 0x30
    ucsi_acpi: probe of USBC000:00 failed with error -12

Notice the ioremap error which appears sandwiched between SOF driver
messages. Without more knowledge of the kernel, and due to the
interleaving of printk errors, it's not immediately obvious to the
system administrator where this message comes from (although in this
case tracing confirms that it comes from ucsi_acpi's ->probe, as one
might expect).

To avoid issues with printk interleaving, always incriminate the caller
on ioremap() failure since we have it. While we're here, also change
these from printk(KERN_FOO) to pr_foo(), which we already use elsewhere
in ioremap.c

Signed-off-by: Chris Down <chris@chrisdown.name>
---
Resending this patch from February 2022 that went stale.

Original submission:
https://lore.kernel.org/all/YguzmS7umfiaSSHU@chrisdown.name/

 arch/x86/mm/ioremap.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/x86/mm/ioremap.c b/arch/x86/mm/ioremap.c
index 12c8180ca1ba..2443f4668d0d 100644
--- a/arch/x86/mm/ioremap.c
+++ b/arch/x86/mm/ioremap.c
@@ -201,8 +201,8 @@ __ioremap_caller(resource_size_t phys_addr, unsigned long size,
 		return NULL;
 
 	if (!phys_addr_valid(phys_addr)) {
-		printk(KERN_WARNING "ioremap: invalid physical address %llx\n",
-		       (unsigned long long)phys_addr);
+		pr_warn("%pS: ioremap: invalid physical address %llx\n",
+			caller, (unsigned long long)phys_addr);
 		WARN_ON_ONCE(1);
 		return NULL;
 	}
@@ -213,8 +213,8 @@ __ioremap_caller(resource_size_t phys_addr, unsigned long size,
 	 * Don't allow anybody to remap normal RAM that we're using..
 	 */
 	if (io_desc.flags & IORES_MAP_SYSTEM_RAM) {
-		WARN_ONCE(1, "ioremap on RAM at %pa - %pa\n",
-			  &phys_addr, &last_addr);
+		WARN_ONCE(1, "%pS: ioremap on RAM at %pa - %pa\n",
+			  caller, &phys_addr, &last_addr);
 		return NULL;
 	}
 
@@ -234,17 +234,18 @@ __ioremap_caller(resource_size_t phys_addr, unsigned long size,
 	retval = memtype_reserve(phys_addr, (u64)phys_addr + size,
 						pcm, &new_pcm);
 	if (retval) {
-		printk(KERN_ERR "ioremap memtype_reserve failed %d\n", retval);
+		pr_err("%pS: ioremap memtype_reserve failed %d\n",
+		       caller, retval);
 		return NULL;
 	}
 
 	if (pcm != new_pcm) {
 		if (!is_new_memtype_allowed(phys_addr, size, pcm, new_pcm)) {
-			printk(KERN_ERR
-		"ioremap error for 0x%llx-0x%llx, requested 0x%x, got 0x%x\n",
-				(unsigned long long)phys_addr,
-				(unsigned long long)(phys_addr + size),
-				pcm, new_pcm);
+			pr_err("%pS: ioremap error for 0x%llx-0x%llx, requested 0x%x, got 0x%x\n",
+			       caller,
+			       (unsigned long long)phys_addr,
+			       (unsigned long long)(phys_addr + size),
+			       pcm, new_pcm);
 			goto err_free_memtype;
 		}
 		pcm = new_pcm;
@@ -309,7 +310,7 @@ __ioremap_caller(resource_size_t phys_addr, unsigned long size,
 	 * tree.
 	 */
 	if (iomem_map_sanity_check(unaligned_phys_addr, unaligned_size))
-		pr_warn("caller %pS mapping multiple BARs\n", caller);
+		pr_warn("%pS: mapping multiple BARs\n", caller);
 
 	return ret_addr;
 err_free_area:

base-commit: 29643f6655dcce5bbc43e938fcee1718a63a83a5
-- 
2.54.0

