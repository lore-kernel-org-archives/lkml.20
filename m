Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794479965;
	b=BpYR/eMJqaPvBuJ/HSkDbcCorQsatBJ+4IMN+2OqVvWMfHrpGMBMawixitBiLbphZ/Br
	 /rMGpF6afwvdHq7qOkQ+YiwbFVX7OBpFkXJP3saonqV9kwEAJVekhM7YhLCmdeSpNybl4
	 ALM6rXBH4WyctCAr/WMS6uEDlLMHNk5Ux2YpjspTQ0zRI+65LUDksmjx9DeIBsDy2uy6g
	 lXovklWooHAt+eoSvFE/nOVAXY0d71bH6itBo8y9GH4LjZDj1/s2AQkXt/pXW0ZLDM3zm
	 8KjrtRA7U3MCK4EdJDBd1oyK5/SqAzBHzKcRKxkpSkfxkgItGHz87PgDPjF8Q4ygurA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794479965;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=cz2r/Y2RPzkO+j+uVzXdreXvdepgECgH9EKrVQJEg7Q=;
	b=HTOdhgzymx5BmnD1vkLXo3Xkr9Q0PtitXr361axR5kZKjwaW+7ujmMddqxqQr89CO7Y0
	 VPIRDpe6JmzV35z0UthpHTawUH+ZcGIum483unNCdXAr/zcDbwaFh8uIwtgmelTJlHo9W
	 lG0rEVe5ItNd/izgq7k9BTdbMxmdCCwxIWHlNxg5xaS1FStqqUnAnYwXZUv+t0dSCfvif
	 6KwuUYdz7REU8Q+8XDzQeqMVEUQrW9qZ0CVBDbpvEZeznOx+UAeiX/J2dJTPeHqiY/17H
	 QJA9w1N/jVdOooE0hmxi2v0RC5+IEL9cvVVPrdYDgSKmYFpPpRfsF+GwFBQx9krwcpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aM3mzmKI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E331A606A339;
	Thu, 12 Nov 2026 10:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aM3mzmKI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32A6C1F00A06;
	Thu, 12 Nov 2026 10:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794479964;
	bh=cz2r/Y2RPzkO+j+uVzXdreXvdepgECgH9EKrVQJEg7Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=aM3mzmKI0GmlyxQCwRqIdTeDtT0/EkcRgXJqO8ZBSxOztx0GD3kM7pxCxTvuI6bWL
	 MAKSxVbRYHVhlIvlXkKUKAAfZyvvr+Ydf0POkAqRJf7LOKPxy8YakB9NQK4bUKrK90
	 vTfKz89aFtB9W2vtJhdgPijQChR/2aNFBgW0zCJ58q8xOyLwnNLj9Qcqy9FGSacTy1
	 DpUmPBZEEqnDVIu9K8UwDTpwAiycuDEh2XnUj+LHjMN/vWv0HAu+Akq6EIQUbHtG8n
	 aSlHPG19OlhtCa8az5aDP76zrHzt2H+/GoUaj0qUBw+C2HWU9vCt48hdNRe4zjs0BJ
	 cDAuDWQHAJFEg==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Thu, 12 Nov 2026 12:38:57 +0200
Subject: [PATCH v3 5/5] kho: docs: update description of bootmem regions
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
Message-Id: <20261112-kho-bootmem-sizing-v3-5-f0c8d00295d5@kernel.org>
References: <20261112-kho-bootmem-sizing-v3-0-f0c8d00295d5@kernel.org>
In-Reply-To: <20261112-kho-bootmem-sizing-v3-0-f0c8d00295d5@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>, Mike Rapoport <rppt@kernel.org>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Chen Pei <cp0613@linux.alibaba.com>, George Guo <guodongtai@kylinos.cn>, 
 Kexin Liu <liukexin@kylinos.cn>, Randy Dunlap <rdunlap@infradead.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Sourabh Jain <sourabhjain@linux.ibm.com>, kexec@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
X-Mailer: b4 0.16.1-dev

The description of the boot memory regions does not mention the low
memory region and claims there is always a region per node plus a global
region, while the low memory and the global regions are not allocated
when they would be empty.

List all types of the boot memory regions and describe when they are not
allocated.

While on it, fix grammar and split the description of the regions size
and of the CMA usage into separate paragraphs.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 Documentation/core-api/kho/index.rst | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/Documentation/core-api/kho/index.rst b/Documentation/core-api/kho/index.rst
index e78a2bbe2be1d..ce2bf9cf66514 100644
--- a/Documentation/core-api/kho/index.rst
+++ b/Documentation/core-api/kho/index.rst
@@ -52,17 +52,26 @@ allocations before during boot up to the initialization of the page allocator.
 
 We guarantee that we always have such regions through the boot memory regions:
 On first boot KHO allocates several physically contiguous memory regions. Since
-after kexec these regions will be used by early memory allocations, there is a
-boot memory region per NUMA node plus a boot memory region to satisfy
-allocations requests that do not require particular NUMA node assignment. By
-default, size of the boot memory region is calculated based on amount of memory
-allocated during boot. The ``kho_bootmem`` kernel command line option may be
-used to explicitly define size of the boot memory regions. The boot memory
-regions are declared as CMA when page allocator is initialized so that their
-memory can be used during system lifetime. CMA gives us the guarantee that no
-handover pages land in that region, because handover pages must be at a static
-physical memory location and CMA enforces that only movable pages can be located
-inside.
+after kexec these regions will be used by early memory allocations, there are
+several types of such regions to ensure that all boot-time allocations work:
+
+* a low memory region for allocations below ``ARCH_LOW_ADDRESS_LIMIT``
+* a region per NUMA node
+* a global region for allocations that do not require a particular NUMA node
+
+Regions that would be empty are not allocated. For example, there is no low
+memory region when ``ARCH_LOW_ADDRESS_LIMIT`` covers all memory, and there is
+no global region when ``CONFIG_NUMA`` is disabled.
+
+By default, the size of the boot memory regions is calculated based on the
+amount of memory allocated during boot. The ``kho_bootmem`` kernel command line
+option may be used to explicitly define the size of the boot memory regions.
+
+The boot memory regions are declared as CMA when the page allocator is
+initialized so that their memory can be used during system lifetime. CMA gives
+us the guarantee that no handover pages land in that region, because handover
+pages must be at a static physical memory location and CMA enforces that only
+movable pages can be located inside.
 
 After KHO kexec, we ignore the ``kho_bootmem`` kernel command line option and
 instead reuse the exact same region that was originally allocated. This allows

-- 
2.53.0

