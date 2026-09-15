Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFC645FFDE
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789460509; cv=none; b=G5FhOCqBU7dGaP4lxV5wvy7LyuNRIs2RKf/4M7DFBvp/0KIA9YFgyI4Jz+HxVwHFPIy4bqSGjaOuztV7/8FWdJ8/K1LugCvCDGBXKlIEVd8PhgioF3h18DASY1efiXz2n4CvzgiwWe4H8Ks/lWb1vk/7h4arTuatRzxZsCBOqPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789460509; c=relaxed/simple;
	bh=cND+RiZNkjQ+dwlMeG9oNBvkOgJOikAyD5PNuNPDeDA=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=ZNfpEBx28cTOhZfrQh50HDLT9r4LC/Ckpztjc1z7iMgO0Bo3PaBcmYFV3Wx5BgYBAk3fzrmhvdMFVuTnyzbtp1IILilZH1tupKrN/ULws7VX9xuB93gtaZfIkvFpvrkXG5SEATIKyIV/KJ5vzVGGEYHXhMH/UXaTcajE6BLabxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=none smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=B67SJOyv; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="B67SJOyv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1789460460; bh=kghpB7ZhQGmJpX7jlJk8goCj8FvBODEx2R402a5MjFA=;
	h=From:To:Cc:Subject:Date;
	b=B67SJOyvNBIlhbB9duf6n++ztK1spw44a8+/cuOUUJHb/J6+9m7ew8TCqWBsHFCZr
	 Hsz+0z9CaDMt/FzMDp1mu3l4DdsO/QiW8Rt9+Ysc0YWE4JUu8Q9Jzi2tuF0XYJaF4+
	 rk/9GwMBiKQzfK87jL//z0UXdyiiKLIqGg+QGSpo=
Received: from XJSH01426.meizu.com ([210.13.72.171])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 53A1DE2E; Tue, 15 Sep 2026 16:20:58 +0800
X-QQ-mid: xmsmtpt1789460458t5126i1fs
Message-ID: <tencent_034C6FC23D4817C40657E5F17F64E260A009@qq.com>
X-QQ-XMAILINFO: OIkr59++0f4Qwdb1R8aaTM4CMnXSO09OXLLfl94a8ORKkoX/XuVweVBECR2FHc
	 wh5UawVPgSnceDR1fyBoJR6ZsgjM0VKZXyNluXAa9ak+/hP+nJl7fN9FPppGgRKhJfwwuANuTK7/
	 n/hkMEDcdWP1O6qi5uiLNWOesjiphyBUzxdC6iDmzszt3hKeQQppiaz5Z7HsZe1jg2tYig/JBB8x
	 Iq7DINVJOaXtcLzAglZfPD8RjyXK3gxY/TBb8j1EqpeLq1iNDTjMUuy10+DeE7h1h86dJjyfsDJj
	 HcKWhPXMnfRrju1iA87It6/nekkah0jdMWk60065ZYM2/YNCahjXtpDTBV6QgIxawsuEzTnGx85p
	 cdwHx5emRHOT5xwa4PTgW0u/pL47B2O2wQfHTOmFyiNn+kqD3EiHBqpx3DAt3stOvdRCZGby63Vg
	 g2/+XYLhnlbf7JOFq9fegDbIfdDKVumxsetFfmmZwfTB/ROENp4ty3gHFXr/MTyfeTyDZ7AA97PK
	 dZIgyBFyxhwr4sjws3nKLvCLIlY7aMEEsZDbV+WVPUOqRwpik5xOxbV0WcPO8HKNOTHFre4CsCje
	 DfKuGFmDBoWeAAnfGElfz5s3BK9G7fpVlpJCHna7dRUfnrdRwnIqffb+PhFQFSmqh4VCDNeZsvVV
	 4v6U8wi56AlcwbKRYJnZYiq5YsivHHFgqY4a6RA5/Yl1pjRS1hsLJL3DdrU/VRTfxHwMTE5aCmY5
	 zdGQm8qDKX1EJ9O3ATLKN8MEXEJYs4pwGIYzZP+MXf9d9ZM7xqADqI4zcAztJN5eIpkzvIUTT7s9
	 wAdAr7M2fhzPYBtEJSSD1TnpLqPuMTJRlQ7sKXVdNPEQcSqJUW4dzXjhBlEvAweg+OfkPr1s3PrR
	 3OqO2GyTZfL/z+fXjpE9Hoav5kn8olPXvHccmkWmkCqU+YM1B/dtq5paJENONkDSXic9Df20kAKq
	 yjdZGoke0d5dlSNCjhDpmRzaery/QrdOvjMNkPsmYTX8AMfCrl6WPwembe45GRlxVlOP04EyZCIe
	 fY6wQN+hjpL7qkGQYP1csXFPusle63in61Q7FpX8i8Yf/K9ShNbJF0JZag13qheDNM2FyOSGe6Nz
	 Po33Iy7SwzUaYZv9dQS7Amk+j10X7Nkas94vCDm/APhTlV8ke4vGtDgJysT51CH5jzj1o3Ag+bLt
	 U/dLo=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Zhenghui Hao <zhenghui.hao@qq.com>
To: linux-mm@kvack.org
Cc: Zhenghui Hao <zhenghui.hao@qq.com>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm/hugetlb: fix misspelled parameter names in comment
Date: Tue, 15 Sep 2026 16:20:29 +0800
X-OQ-MSGID: <20260915082029.65309-1-zhenghui.hao@qq.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment above hugepages_setup() refers to "hugepagsz" and
"default_hugepagsz", but the parameters parsed by this code are
"hugepagesz" and "default_hugepagesz".  Fix the spelling and also drop
the redundant spaces so the comment reads normally.

No functional change.

Signed-off-by: Zhenghui Hao <zhenghui.hao@qq.com>
---
 mm/hugetlb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 4f6f58bf3db6..68b97893a376 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -4268,9 +4268,9 @@ static __init void hugetlb_parse_params(void)
 
 /*
  * hugepages command line processing
- * hugepages normally follows a valid hugepagsz or default_hugepagsz
- * specification.  If not, ignore the hugepages value.  hugepages can also
- * be the first huge page command line  option in which case it implicitly
+ * hugepages normally follows a valid hugepagesz or default_hugepagesz
+ * specification. If not, ignore the hugepages value. hugepages can also
+ * be the first huge page command line option in which case it implicitly
  * specifies the number of huge pages for the default size.
  */
 static int __init hugepages_setup(char *s)
-- 
2.53.0

