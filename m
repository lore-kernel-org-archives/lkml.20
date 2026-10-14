Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FA2563288
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792003631; cv=none; b=EGkf27+tVVy50TU8sq7llQvSKjPYvACzR9FYCGWx7FOlJrs2qN/s/2epoaVQsw8gMBBF4pI5Pv6MpPV8LdeWRNq+TOVW/XiYaqU6bomoAWA85e3xBlqCu3AHeLUelZ0F1KrDgGr9xn6mgJjGwtbg+I3mHKgZXxZM2OQPsVuPOQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792003631; c=relaxed/simple;
	bh=suiRUnyroocuk12grD5LSkD20Wp++sZxWYm4G3hH8zM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IAi88EHTfc0EMCW9ciAhx5fdHfrW27yJmWUm0GIRyEmmVIQbympw54JKww6swlQ+4aYHq2ObnOGgV3YWkAKjnhUTLCnEPbTGBpB9RhPCk/076qWm2AYkgJh2ATeX1kAp/VBlvsZRl6QEmF5K7Car73czbSmcmNJOoT8d0VbThYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=FPIOsqjv; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="FPIOsqjv"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6cf995766a3so3599529eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792003628; x=1792608428;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ud4UQpU7GXwKVtHEzNn/aXQljAT04341tSRIlnW7qwM=;
        b=v6XdRlylHTK2BMaBvjhNGU2cfq3dMXdgoqzo6V5li2U+JLKRNhtidfimxR+JjBUL65
         Ua9ZBRSKD2mn/pfMgDohwgpvZy6BfYKNMpo/PDyBNDnin1bAZ+TkdefDec3vVajX/5vK
         B3Spz/cevCeyOVugBnGWWEB77chZwdSjDak/Ge1AtHT/JoXlty4E+v3mPyO65UMSZBXT
         hI8jYIwRENVBUwSoUDvPOxUTTf6vGHVxPpq4PfPgABBLcz9/tHeDyXwj+j1dXRFav6Qf
         SIAwrMY2WPIw/ygoAC3srVIYacIYLSUzQmrtyFJL6VBa2SXtg03y/XDS4sDGRESHK3Ah
         LYRA==
X-Forwarded-Encrypted: i=1; AKwUvBx1j804nvMRDtGvl7TPqWDptCv+Dp0Sy9f3APDjENRBxxSIWtrkWAhEze5h2GTnWPNMW/f67mHDmnmqhbE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLV9jh0He6PtEG32xuLOpOwcp382OjdRj9lnLYmWUQbWnlpYaZz
	oh5nmWojGW6iAbE+yCra/sGzdUGaUdtNGYgxJo2BLwmc9+MTeNyBlYLh
X-Gm-Gg: AYBFou0w7qtmNB2pTVNXWb1JdXnHYlyL5cyvlMf82r5QHU1bLbIUsc/oly0g3zxyl8v
	nHaa+fDdu+CJ7nJYN5DX/5DN6/OxVBbs18mwKfflNqsVUKqhzlmQk6UM2sxbkEdUkeV9FR7k02A
	ptcjur+KEmSxNeVEHsvNpWxqY+eh52HWwz6gKi1LJ5IzQlC00N76oCPw6laNwbL49AgCO8tEoxx
	9XmAc2mmoS625Li71dzvgwL+ZLmZR17SLL8QA3VLNBuApr9oeNiBXChOChaNjT8vq84DZkFjRCU
	GgikXYB1C75ZtJgz90r3rT0Sxjki3WZgi/cb1iq3GM5RBL0sn4zbhawaTBbbZ0J9tbB+wgubPAd
	gb2t8jh2DQHrF0JRomRS1JdwwYjLZXejVHY0iV9sHiaCpz2z8egGy02Zx/fJ9mBZRcg8hWZb0rd
	SAEWF61dUPI29HxobttyVQUUKnwTG5ITydJVWy0aZhc7DUPIysCuRtqw3TmvLH95fv2BXjBBlNN
	HTcfHNS5vXgPTAMLSPKheP5m8v54gbdQ1ECsfWgFrebZu8hLy6f11awVga4C0Ohf9rY7TcR4gkh
X-Received: by 2002:a05:6820:c2c8:20b0:6f4:ae96:c59b with SMTP id 006d021491bc7-6f4ae96ccdcmr6553693eaf.5.1792003628127;
        Wed, 14 Oct 2026 11:47:08 -0700 (PDT)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6f47500ae30sm9548549eaf.1.2026.10.14.11.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 11:47:06 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 283216061E;
	Wed, 14 Oct 2026 18:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1792003624;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=ud4UQpU7GXwKVtHEzNn/aXQljAT04341tSRIlnW7qwM=;
	b=FPIOsqjvI9KwWd8TDkBUXyQASuIwYvkymEHQbt7eA3vYTcc+QbYh7fpFXA2/SeJxafJZBR
	GH0srJnkwqT3w9MGG/AnWN8R7TzJNy63q76UWYHjemYZ2I3zvJrLqJQiktQGgOeppwuQNE
	fC9R2T24tUdjYBOSe7RPPbih2dytIgLjsq50IzNB7mVtUrISDQBn0JD2U3S1/aml8H5jzH
	f3iz9SHZ7TICCUk8Y8Zq8ZF7BKNuCy7ro6pJdUQp7fdNchflAtapa0RePn3gwoKKx25O5V
	Aqeyrw5iu3ur3zcR5BFZnoEcRSn3/VGrNTuREDwAIw4pxK/n6TyJoVeOrdX34w==
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
Date: Wed, 14 Oct 2026 15:46:46 -0300
Subject: [PATCH] selftests/mm: mremap_test: Validate the preamble region
 before mapping it
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261014-selftests-mm-mremap_preamble-v1-1-2e97f501cb56@marliere.net>
X-B4-Tracking: v=1; b=H4sIABXOz2oC/yWMUQrCMBBEr1L222ATtahXEZFNu2lXmrTsRhFK7
 26qX8ObGd4CSsKkcK0WEHqz8pQK2F0F7YCpJ8NdYXC1a2xtj0ZpDJk0q4nRRKGI82MWwuhHMqd
 wOWPXuJIHKIoyBP789Lf7n/Xln9Tmzbk9PCoZL5jaYasm4Z7TPqJmEljXL+N+uOGgAAAA
X-Change-ID: 20261014-selftests-mm-mremap_preamble-5f98ad625f93
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792003619; l=2090;
 i=ricardo@marliere.net; h=from:subject:message-id;
 bh=suiRUnyroocuk12grD5LSkD20Wp++sZxWYm4G3hH8zM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMvzTA1Be/AaPv+icYSQObP6ZSepseS099c1IS7GWL5yRAlaiDjRXKqF7qK+kLROsQ0b2JWSCxZ
 Qwfn01UPNwg8=
X-Developer-Key: i=ricardo@marliere.net; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g
X-Last-TLS-Session-Version: TLSv1.3

remap_region() checks that the destination region is free before mapping
it, but not the preamble region placed right before it, so mapping the
preamble can intermittently fail with EEXIST:

  # Failed to map dest preamble region: File exists
  not ok 15 5MB mremap - Source 1MB-aligned, Dest 1MB-aligned with 40MB Preamble

This happens when the kernel's heap ASLR (arch_randomize_brk()) lands the
process heap inside that unchecked range. Confirmed by correlating
brk(NULL) at startup with pass/fail across 60 runs: every failure had brk
land inside that range.

Fix it by including the preamble in the free-region check.

Signed-off-by: Ricardo B. Marlière (SUSE) <ricardo@marliere.net>
---
Hi, this sporadic issue has been found in openSUSE CI:

https://openqa.opensuse.org/tests/6270334/logfile?filename=serial_terminal.txt#line-6760
---
 tools/testing/selftests/mm/mremap_test.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
index 131d9d6db867..8d4fa3025a9d 100644
--- a/tools/testing/selftests/mm/mremap_test.c
+++ b/tools/testing/selftests/mm/mremap_test.c
@@ -1006,8 +1006,10 @@ static long long remap_region(struct config c, unsigned int threshold_mb,
 	if (!((unsigned long long) addr & c.dest_alignment))
 		addr = (void *) ((unsigned long long) addr | c.dest_alignment);
 
-	/* Don't destroy existing mappings unless expected to overlap */
-	while (!is_remap_region_valid(addr, c.region_size) && !c.overlapping) {
+	/* Don't destroy existing mappings unless expected to overlap. */
+	while (!is_remap_region_valid(addr - c.dest_preamble_size,
+				      c.dest_preamble_size + c.region_size) &&
+	       !c.overlapping) {
 		/* Check for unsigned overflow */
 		tmp_addr = addr + c.dest_alignment;
 		if (tmp_addr < addr) {

---
base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
change-id: 20261014-selftests-mm-mremap_preamble-5f98ad625f93

Best regards,
--  
Ricardo B. Marlière (SUSE) <ricardo@marliere.net>

