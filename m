Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794542484;
	b=oFgbtsuKHkp30fk6EV1RkkaKTqs6NZDl37ZZzd8PAfnLZPfJ9PEpMC5hdMEVWn37/sd/
	 pmYuLAlSOkxzhJQIeJxosmmH407xrnZAfmzK0GZn/PdSvHzDh4RYr88oEVCwlhiI95JbK
	 5UGTMwn6YiXKfiIudjK96A3jLfyOs1JHf+OACnqXD9Ee6n2fbV1+wHbuh9O2oEwVnn0K9
	 sxnUW6AXqmIfclzmgXTSVEYFW/ZcN4IaQu3OaBnpT7aUZ7oJ4NoJKiKVXMKkEx12ZgiB3
	 WkLD1vlgBDrspsa+8li2SBv/XLahe4pf+0ZQKvpvKoI3SjMH44CeEfZRUssmacDd7ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794542484;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=c7E91ugUUXL2RSD7YVbBkOLNFCGTuw0TRMQRMDFJplQ=;
	b=iz3LVHbJUBgetTEsshelRPWncrW/q164RofK9QHVUfGfMOzDj1pfrekyis2zTxLcVBW2
	 jdKr7vn5QKUA5VUaGippyY/G9apvuw6jhraP2GIDE5Q6l3nPmP6SVuOGktCKTkKteCno9
	 ctPN7oPnXPJrW/EoQbIj26uaWS3ANbbgccb3R7J+cq0pDYqbNW00MfJ4Je87ppq7MIuz2
	 W0VdhfulMcbx2848ZIeE9CgSnt41yZgn2qMOwKGtfagdfpJdQYTuBH/QAB7zrBl/v1XuQ
	 BR7BpI/uZiVEU1wtkerH0jVMSnJA4DSf3jyfSQc5hUHPe20DizjDbCTUASpD4buIcWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EXQzKGRg;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5534606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5534606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EXQzKGRg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794542482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=c7E91ugUUXL2RSD7YVbBkOLNFCGTuw0TRMQRMDFJplQ=;
	b=EXQzKGRgT12xbz6+OtkZMC0vUYRRv9fJlHWSYi3dWmXsJKoneK4+tR86C6Tgzze8irCmR3
	qAEVTQkhv/T5hJRR4TbvhMP832OY8kwoD232984S8hM0PxmrWliJBFC11GnUBuL4IYTX2P
	TRlIftYtrFYSsx3AlrJpw72WP/R8Avs=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-102-6EZoidn1OrOslF0C3bpmWw-1; Thu,
 12 Nov 2026 23:01:19 -0500
X-MC-Unique: 6EZoidn1OrOslF0C3bpmWw-1
X-Mimecast-MFC-AGG-ID: 6EZoidn1OrOslF0C3bpmWw_1794542477
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CA9A818005BF;
	Fri, 13 Nov 2026 04:01:16 +0000 (UTC)
Received: from jocolema-thinkpadp1gen4i.rmtusco.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DF46430000E8;
	Fri, 13 Nov 2026 04:01:13 +0000 (UTC)
From: "John J. Coleman" <jocolema@redhat.com>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: zenghui.yu@linux.dev,
	akpm@linux-foundation.org,
	david@kernel.org,
	liam@infradead.org,
	ljs@kernel.org,
	mhocko@suse.com,
	peterx@redhat.com,
	rppt@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	audra@redhat.com
Subject: [PATCH] selftests/mm: allocate nr_pages based on pmd size for uffd pmd_move tests
Date: Thu, 12 Nov 2026 21:00:45 -0700
Message-ID: <20261113040045.1439391-1-jocolema@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

When executing the uffd-unit-test, the "move-pmd on anon" test will fail
on aarch64+64k with a segmentation fault because the initial allocated
memory region is too small.  This only happens with the move-pmd* tests
because the architecture base page size is still utilized even though the
memory region is specific to the size indicated by the pmd.

Patch 9f5c2aec3388 ("selftests/mm: fix uffd move-pmd test crash on 64K
base page systems") implements an initial fix to the segmentation fault
by skipping the test if the allocated memory region is not large enough
for the number of pages x page size requested.  Since this will skip over
the aarch64+64k pmd tests, this patch is intended to resolve the problem
with 64k pages by pre-allocating the memory region with 2x the pmd page
size (for area_src and area_dst) for only the move_pmd tests by using the
uffd_test_case_ops pre_alloc hook.

Link: https://lore.kernel.org/all/20261103202049.499206-1-jocolema@redhat.com

Fixes: a2bf6a9ca805 ("selftests/mm: add UFFDIO_MOVE ioctl test")

Signed-off-by: John J. Coleman <jocolema@redhat.com>
---

I initially included patches V1 and V2 through the linked email thread.
V1 and V2 modified UFFD_TEST_MEM_SIZE contingent upon base page size and
a multiplier.  However, sashiko review observed alignment issues with
powerpc64 with 2MiB and 16MiB pmd sizes as well as 32bit type overflows.

Subseqent to sashiko review I decided to make a significant change hence
why I created a new patch rather than continuing with V3.  This patch
leaves UFFD_TEST_MEM_SIZE at the 32MiB arbitrary value and utilizes the
pre_alloc callback within the uffd_test_case_ops object to set nr_pages
based on 2x retrieved PMD size divided by the base page size for both
source and destination test allocated memory regions.

 tools/testing/selftests/mm/uffd-unit-tests.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
index 2a97ba1d6feb1b35d6281449fd1917793a64fab1..0846de62689f710bab320e399d0bb5849b9408ff 100644
--- a/tools/testing/selftests/mm/uffd-unit-tests.c
+++ b/tools/testing/selftests/mm/uffd-unit-tests.c
@@ -2226,6 +2226,20 @@ static void uffd_mmap_changing_test(uffd_global_test_opts_t *gopts, uffd_test_ar
 	uffd_test_pass();
 }
 
+static int set_pmd_pagesize_nr_pages(uffd_global_test_opts_t *gopts, const char **errmsg)
+{
+	uint64_t pmd_pagesize = read_pmd_pagesize();
+	if (!pmd_pagesize) {
+		if(errmsg)
+			*errmsg = "failed to retrieve pmd page size";
+		return -1;
+	}
+
+	gopts->nr_pages = (2 * pmd_pagesize) / gopts->page_size;
+
+	return 0;
+}
+
 static int prevent_hugepages(uffd_global_test_opts_t *gopts, const char **errmsg)
 {
 	/* This should be done before source area is populated */
@@ -2259,6 +2273,7 @@ struct uffd_test_case_ops uffd_move_test_case_ops = {
 };
 
 struct uffd_test_case_ops uffd_move_test_pmd_case_ops = {
+	.pre_alloc = set_pmd_pagesize_nr_pages,
 	.post_alloc = request_hugepages,
 };
 
-- 
2.56.0

