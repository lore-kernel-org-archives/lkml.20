Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793701735;
	b=yIlKiFdhJli8bx6+UPkpI0UL1Zjk8ZDyHFY7tKBtNNoc/tT55/mrHWZX6onvIZP9ww4b
	 rgpgAV2jyH62hYUpM+WMXBaIngNIWz7pDeOvAxOYJqnz96BHlgm+EppXpn7NM35lBivhP
	 vKm1/tyZX1aGjhJRdpXDC8LKMA/vIeNNaAnRvKkX1CMtZAhVcxAGB5ZAqbLNGPUowLVzC
	 /ubNV8qi5Ansx/Eh+ob4TC57zOj2dgr73TTu4qY7wT8psoCqDmH9e63iuBE0opWdRhZPW
	 HyUs5wkskG2HPpg1HGrjAFDUv5MJhYkKT6RdUT3FYfZZAWK0YF3wUdSHRt8vNPPaAQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yFvHrJ226gOIeLudLE6azLHSFzqJ0Fej3gicSvLOC2I=;
	b=OuITZ1IujcelT4VPoboSkAR0yrsF+AdsuR7XRLM1U4KUNSb2xNeVgGRJgQfvNhTIs74X
	 63ke1fsVp7IOMN37Bgzj4bo9kkLgGDiRPeXfwqwop92Ti7ED7//DIP63N1+rfSN0OrszL
	 HPE/sfIJo1PdcfDr3T4iJrCSHCzeFBsUFl1X+A1uFWpMsDRE6wa+ypcXJMU3weVy2B+2D
	 acjR56u3YinxP4w9459BbW2IGLUPWzGJIM7OeJluRmhhKiYpB7NIxKJDZj+SdFlMISS63
	 EawtOp1rggZnnSLMrP7bzF7ZwJkod4/fiA4dYJLxL/b5lIYTSqTIquzAg8NAzXKF/Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZLF5Ie2f;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DDD6074A03
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2DDD6074A03
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZLF5Ie2f
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e00eee27dso2043297f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793701733; x=1794306533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yFvHrJ226gOIeLudLE6azLHSFzqJ0Fej3gicSvLOC2I=;
        b=ZLF5Ie2f2xyVVZ02CTWAaM44AP5P/tpCx89DQAuEHO4v24WtrhxFcdf5UCSlEtZP2N
         9lOSAzm1m88H9pLip9TEpiVjjQ6nccTJjeleZgCF8vxdOHoPQ/msF+ZojZJb0byPTVZ4
         ppRH4ScAXnVuZRHtrgOqKNjcMO0XZ00dY7ch4Q142omBAVXtAo9Y2X7VihnKmfwUVSnU
         Cfk6GQEIZM58/3od82Fr3rHe9SorL7X9qH8YpmjwgSF5yMf2RZhOPGylvgbpKgB/MYWJ
         J2bCv/zhgrPsQFD8k3UDENlb4sUkijuYnPMqsf2VX3J211uwQij77ltW7oTg4MhDaMxr
         satQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701733; x=1794306533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yFvHrJ226gOIeLudLE6azLHSFzqJ0Fej3gicSvLOC2I=;
        b=BKnsp/9wdbzi6jWVSN8maqXH3BkgUMPImZ3u2jw3zTAWGpigPlnB77NnrCkU1dYmWp
         4FVhvPEKR5qnUv0PMY9HIk8ibCmYfbNDA69UOpWCAZalqeSceFv8g8EAa8EYwq1hy6Dl
         Mzc1Uw0c/1RZnDNFtGeaFL9OBGQZK0L3D1Zhe89qlUNmsaSP+R+3IILFz6rw384rbTSy
         5QxzX67SBpbBDVTzZ2G/PFTh7Si9jLMGK2mTKee9c7ScOHIGfUHpZP/+WhXMOXKCczot
         GvGM2fqSGUBJUZbb/blrGRzXlaIiWfA/8A+EYhv+NCliEi0fx2mKiLUawBBoMmC28rPm
         mH7g==
X-Forwarded-Encrypted: i=1; AKwUvBy2xyf9itvp1goqTBkQ5sY61faFKtv6CRwbmd7HBpGM4+TTsRwCpg3vs9jbU6YJWzsfCXeWyVm2K/bdSQw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/R3iqAEu3ctBnRh97SsIGX7uF/AwG/RdJdaDuKuvUKQLyYXb3b
	9zApviZqvkNBlPUb9ybiJLVmkeZiByFGkjBfZP6LMVOhl4oHuhF35uPw
X-Gm-Gg: AYBFou2VlntL9CvL2aQiqv0kRdOG8XMEZwlgnavgCp1qxrgPseIh1CwvVLAMevB59gl
	vnVuyL/sedJVYuy77HHm6pj1FwtS9ZSDTq3yf83P71Bmm/y2cIKbqIbRVlDBPHohL6DCLxue8y4
	tMzFA2PsUSNaYPaRKbijYuh3QflOT0WZl+unJ5DdVDU5XBLFPlsVEga2LAGi3gH1E/e127UUJgu
	/DU9h7g+WSQvNC4vPMQyhOKlvGPiNTOm6Wl+YUAZ5p6Qt0OzJfZNa0mXUdaMIK3/xF1Br0j+aIV
	bb5Yn8wH8KIzs/Yr8Xc6gHGfLQ9eO5JYeep/rmUvUll7Xu3icFyeTivzuApWxjwlJj/LCqRbFpl
	LSvQga1wwnQQWdlNdmeJhuhHgG/dSBwFTK9PXz/5wYwd+Mq2RiqlQ3Vi6WuTTZcA5Gkk/xlNW2r
	QI6tgLHfZNP/yUd+nSTVmM+2i3I9E9dfCOOsr8oJvt5QhdDRpM2K3wKbmlp31HzJfIZKjLaK+K1
	T3Yx2lrV9GiT7vfK4/zqo3H1SXYBJKrpIFbMbnsaFzpmIM8YPDLublGazJJqp5fjh4krhcrTnwX
	+PKXc1eBInWsfw==
X-Received: by 2002:a5d:5f89:0:b0:48a:f0cd:8712 with SMTP id ffacd0b85a97d-48e6e5004c1mr26768734f8f.50.1793701733040;
        Tue, 03 Nov 2026 02:28:53 -0800 (PST)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b7815fsm24941003f8f.22.2026.11.03.02.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:28:52 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Peter Xu <peterx@redhat.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: [PATCH v3 2/2] selftests/mm: add a uffd test for re-registering during UFFDIO_COPY
Date: Tue,  3 Nov 2026 11:28:36 +0100
Message-ID: <20261103102840.68903-3-azpijr@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103102840.68903-1-azpijr@gmail.com>
References: <20261103102840.68903-1-azpijr@gmail.com>
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

Re-register the destination without WP while a UFFDIO_COPY_MODE_WP copy
waits for its source page, then check that the copy fails with -EINVAL
and leaves no uffd-wp bit behind. This covers all memory types.

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
Changes in v3:
- open the source userfaultfd with O_NONBLOCK and check for POLLIN, so
  poll() waits for the fault instead of returning POLLERR at once
  (reported by sashiko [1])
- add Mike's Reviewed-by

Changes in v2:
- "all memory types" in the commit message
- rename copy to result

[1] https://lore.kernel.org/sashiko-outbox-194303@kernel.org

v2: https://lore.kernel.org/20261102081140.201987-3-azpijr@gmail.com
v1: https://lore.kernel.org/20261029221129.89068-3-azpijr@gmail.com

 tools/testing/selftests/mm/uffd-unit-tests.c | 105 +++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
index 298609544445..e811ca49bb83 100644
--- a/tools/testing/selftests/mm/uffd-unit-tests.c
+++ b/tools/testing/selftests/mm/uffd-unit-tests.c
@@ -375,6 +375,104 @@ static void uffd_wp_unpopulated_test(uffd_global_test_opts_t *gopts, uffd_test_a
 	uffd_test_pass();
 }
 
+struct wp_copy_args {
+	uffd_global_test_opts_t *gopts;
+	char *src;
+	__s64 result;
+};
+
+static void *wp_copy_thread(void *data)
+{
+	struct wp_copy_args *args = data;
+	struct uffdio_copy copy = {
+		.dst = (unsigned long)args->gopts->area_dst,
+		.src = (unsigned long)args->src,
+		.len = args->gopts->page_size,
+		.mode = UFFDIO_COPY_MODE_WP,
+	};
+
+	ioctl(args->gopts->uffd, UFFDIO_COPY, &copy);
+	args->result = copy.copy;
+
+	return NULL;
+}
+
+/*
+ * UFFDIO_COPY drops its locks to fault in the source page.  Re-register the
+ * destination without WP while it waits there: the MODE_WP copy must then
+ * fail instead of leaving a uffd-wp bit in a VMA that no longer has WP.
+ */
+static void uffd_wp_copy_reregister_test(uffd_global_test_opts_t *gopts,
+					 uffd_test_args_t *args)
+{
+	struct uffdio_api api = { .api = UFFD_API };
+	struct wp_copy_args copy_args = { .gopts = gopts };
+	unsigned long len = gopts->page_size;
+	struct uffdio_zeropage zeropage;
+	struct uffd_msg msg;
+	struct pollfd pfd;
+	pthread_t thread;
+	uint64_t value;
+	int pagemap_fd;
+	int src_uffd;
+
+	/* The source fault comes from the kernel, so no UFFD_USER_MODE_ONLY */
+	src_uffd = uffd_open(UFFD_FLAGS & ~UFFD_USER_MODE_ONLY);
+	if (src_uffd < 0) {
+		uffd_test_skip("cannot open a kernel-mode userfaultfd");
+		return;
+	}
+	if (ioctl(src_uffd, UFFDIO_API, &api))
+		err("UFFDIO_API failed");
+
+	copy_args.src = mmap(NULL, len, PROT_READ | PROT_WRITE,
+			     MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (copy_args.src == MAP_FAILED)
+		err("mmap() failed");
+
+	if (uffd_register(src_uffd, copy_args.src, len, true, false, false))
+		err("register src failed");
+	if (uffd_register(gopts->uffd, gopts->area_dst, len, true, true, false))
+		err("register dst failed");
+
+	if (pthread_create(&thread, NULL, wp_copy_thread, &copy_args))
+		err("pthread_create() failed");
+
+	/* Wait until UFFDIO_COPY blocks on the source page */
+	pfd = (struct pollfd){ .fd = src_uffd, .events = POLLIN };
+	if (poll(&pfd, 1, 10000) != 1 || !(pfd.revents & POLLIN))
+		err("no fault on the source page");
+	if (read(src_uffd, &msg, sizeof(msg)) != sizeof(msg))
+		err("read() failed");
+
+	if (uffd_unregister(gopts->uffd, gopts->area_dst, len))
+		err("unregister dst failed");
+	if (uffd_register(gopts->uffd, gopts->area_dst, len, true, false, false))
+		err("re-register dst failed");
+
+	zeropage.range.start = (unsigned long)copy_args.src;
+	zeropage.range.len = len;
+	zeropage.mode = 0;
+	if (ioctl(src_uffd, UFFDIO_ZEROPAGE, &zeropage))
+		err("UFFDIO_ZEROPAGE failed");
+
+	if (pthread_join(thread, NULL))
+		err("pthread_join() failed");
+
+	if (copy_args.result != -EINVAL)
+		err("UFFDIO_COPY returned %lld, expected %d",
+		    (long long)copy_args.result, -EINVAL);
+
+	pagemap_fd = pagemap_open();
+	value = pagemap_get_entry(pagemap_fd, gopts->area_dst);
+	pagemap_check_wp(value, false);
+	close(pagemap_fd);
+
+	munmap(copy_args.src, len);
+	close(src_uffd);
+	uffd_test_pass();
+}
+
 static void uffd_wp_fork_test_common(uffd_global_test_opts_t *gopts, uffd_test_args_t *args,
 				     bool with_event)
 {
@@ -2403,6 +2501,13 @@ uffd_test_case_t uffd_tests[] = {
 		.uffd_feature_required =
 		UFFD_FEATURE_PAGEFAULT_FLAG_WP | UFFD_FEATURE_WP_UNPOPULATED,
 	},
+	{
+		.name = "wp-copy-reregister",
+		.uffd_fn = uffd_wp_copy_reregister_test,
+		.mem_targets = MEM_ALL,
+		.uffd_feature_required = UFFD_FEATURE_PAGEFAULT_FLAG_WP |
+		UFFD_FEATURE_WP_HUGETLBFS_SHMEM,
+	},
 	{
 		.name = "minor",
 		.uffd_fn = uffd_minor_test,
-- 
2.56.0

