Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07267480DE9
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936058; cv=none; b=a+L45ZLS+yYj0+5u7dJUguaAdHtMzRqnPcnrAF6eCuVfKTwvrEcCwbbjCwIXQXPKov8cRuBFS9NI5JhaMXcp/jif44ez27SH2BPbnFMJ4fLw2F9G/YnFf4DlmOjTUR7hHRW0rWHPmsS3CYWZes9lmQMV5UPcIl1heRg9o2dlnCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936058; c=relaxed/simple;
	bh=bQ2VJNz85yTDUPyqufpo/KoAj24VVw/EB4ZsZkLst8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uirOFZ5DvBpTbP21jNJ00xnG/V/LYNYt8AgR0D3qorEYxHoLhrRGi4Jys0teV8I/jGVuT/QDRWQCw+uSqm6nuvk5WcZd/lTuO52vOsBcETl6jV9hSROGCRY7sqokNw4+KK27iQTmLtmOrlzZp0oYftXQNAO2mAkLHlL3++6Rjzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E3ftYu5Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E3ftYu5Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F22CE1F000FF;
	Fri,  2 Oct 2026 10:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790936056;
	bh=704o1efPMbOJQEadnU5pQYbte47NkjF4oh2h5K648uQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=E3ftYu5ZbFJBdRRlUt+D4XEWXM6Ooc9eVTT19jiIggK3TJi7ggRSaSnXpue3wO7pC
	 5SovfavtppTGsnCoUcT6hPVsg575YZnBZWC2OPjMi5QAVWRQGKeXjaym83vhaQN5o0
	 AQ0TeVDwWbGOmfb2dAYqmHDNoUKac5TN9aMk5+SeDbThDiiOQU0tpVuSQyWYOKz2B9
	 dFP1a4mic+MnxgxB22Qxl5cZCuCj6cLUk1mudtmfzVvZXt3Q0haXBQJr66XvbS+gyC
	 uE045+1JV5GOIx168P3AtVirxXOHUYkxEQaN1RYi7xeNlkv/xNS3l3KdwC4P6aBix0
	 Z73OXwSAjU3Vg==
From: srini@kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Kees Cook <kees+treewide@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 4/9] nvmem: core: Add const to pattrs allocation type
Date: Fri,  2 Oct 2026 11:13:47 +0100
Message-ID: <20261002101352.1084447-5-srini@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002101352.1084447-1-srini@kernel.org>
References: <20261002101352.1084447-1-srini@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kees Cook <kees+treewide@kernel.org>

In preparation for making the devm_kmalloc family of allocators type
aware, we need to make sure that the returned type from the allocation
matches the type of the variable being assigned. (Before, the allocator
would always return "void *", which can be implicitly cast to any
pointer type.)

The assigned type is "const struct bin_attribute **", but the converted
allocation type would be "struct bin_attribute **", which is the same
type without the const qualifier. As there is no general way to safely
add const qualifiers, take the size from the assignment target instead.
No change in allocation size results.

Build tested ARCH=x86_64 allmodconfig with GCC 16.2.0:
drivers/nvmem/core.o

Assisted-by: LLM coccinelle
Signed-off-by: Kees Cook <kees+treewide@kernel.org>
Signed-off-by: Srinivas Kandagatla <srini@kernel.org>
---
 drivers/nvmem/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 0556d140170a..19edc9ab0282 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -485,7 +485,7 @@ static int nvmem_populate_sysfs_cells(struct nvmem_device *nvmem)
 	/* Allocate an array of attributes with a sentinel */
 	ncells = list_count_nodes(&nvmem->cells);
 	pattrs = devm_kcalloc(&nvmem->dev, ncells + 1,
-			      sizeof(struct bin_attribute *), GFP_KERNEL);
+			      sizeof(*pattrs), GFP_KERNEL);
 	if (!pattrs)
 		return -ENOMEM;
 
-- 
2.53.0

