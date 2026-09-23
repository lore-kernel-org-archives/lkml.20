Received: from mail-lr2-f5.google.com (mail-lr2-f5.google.com [74.125.230.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399EF53163A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175312; cv=none; b=Wg+QqqkPuFwiSLw9JoLxlF1yeOlL9jivVl1hCL3+DEcZ6FcNs1xftcyZBpOF6HWTXUBQf23o+4X75wvF1z1WbxBTFLayHCfm7kXwvuvZsfAfOnHDWZs10G8NMCzY2rxB65k8OG7yc+kGmL0ImVcklvQv90+iGzjV0GLmZNm+MCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175312; c=relaxed/simple;
	bh=OH8uQ9VNAZOQyUECZ3dFzXsuD/WJGTQjmmIL/oLjcgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rnk4yc03rKYByntKT+A5dK6UCQEfCfq9W4h5Bi0tYyOG1vll2R/mhwWCtUdAZAs1Nhrk7wceLbwYkpa1tzO0WLkryewuKK19PXCWM+UYPXUnNRg4vvn+y13ep6NJJ1+afXnYu/Ysry7TP2OnArT62hpQ4w8xpqpMrCuOQ2ZlYMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jruNQ0d4; arc=none smtp.client-ip=74.125.230.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jruNQ0d4"
Received: by mail-lr2-f5.google.com with SMTP id 38308e7fff4ca-3a20b70da4cso6239981fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790175308; x=1790780108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KLyY5MHaKq4xCUtb5Tr0mqR1G0KiRq9dtEBuRM3TfU0=;
        b=jruNQ0d4o0t4kq1VdodIRWGU1a3Jsg4nw3PDarne+YrQlEmtSrhn9Jcx/cwmY4rBW7
         28ECWVVLakHnEhLb9/Dlokhg/YYR1n5VGdgYQ6DRY6hNqj9S9HV/aw5aVjDXwZP+p76r
         Qss1QVavzJScNlCzbBHWiYqX9RaHLWPcwFrhf59fbCSPPPoAULU7jPr0yuRP/6yQUOCz
         75SZy8/KVB18ICN86nS5z+RDETpcBGdVnmyJ1ALi976M70WtMlC+wmARaC0xg+ncJ1iQ
         t/87gJ+JLyz1TjHrTY77/WGsFuNVHSHyhnpKy24rKiW70Oe/1T7I2bp3Ir5usU1ouIyh
         NmEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175308; x=1790780108;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KLyY5MHaKq4xCUtb5Tr0mqR1G0KiRq9dtEBuRM3TfU0=;
        b=FeE4/ZppoZm4Tp/KwlRruY3aWSVdUXFLtszfEVKdX7XEx47Zr67BSbBsnccCKkWn/4
         94UuTA/Jxi7mvB5RX+zCcIYBGy+eImraqoCLcJqboAXPuAdFhzIgeWKY5YwItEZn4uVh
         yO+cSl/PMr3FYgUri0mIXh/EDDVt8Ab+7qQT28Hy1+nL7LzugtjNhoqdPoLuW1i7SR+s
         7mkirlLtO2YegV8BWbPo8SCcjEhDipo91rT4+9Dl0hXlRh275YT9mGabTBexz2KwkfCX
         oGKTMNDlrsiu5E/vmx8O/Bf0OCRbTgSdL16EEDkheUf29Gov0TLz2JCNWay29IcsPYaB
         y2tw==
X-Forwarded-Encrypted: i=1; AKwUvByAjR/+EVISf5um7EBz5ljqfRlDknnjn4DJlE8FNkbJ/v4r7EXFBSaahmypGwL3B713VdNpYA0SvalHJZk=@vger.kernel.org
X-Gm-Message-State: AFuF++kqu1ezLOd1+UXFVVfggDWGgM2JFtEi7oOaE/katSjKzufTrEp4
	qq6OBousjBz284rXRzKzgCxEtzOm/G/ySa3Gep1oCJsTEbUXsyT6Wr06
X-Gm-Gg: AYBFou0X27oTOY1OhpFqr8WP9+Qt3LC8275w8GiftIPup/nBuJD3QqTMhwNqcyOQ9KW
	0Y4LloCn/fZm4y66pnysivJoqUgCYzYiTYFk4jXVwQnGK9fkI6hOdcepRMts3sGm0H6lNsHSaZZ
	SI02faNFkrmSkkwZQxQun+7g+Hd0LSL8QLGh5JlNPZF2LCJwve8qfWnsDD0xGXB7L+YnED1Hspm
	OCrsKAO4qwTy6rE8QkkzTZ7Ru4aPw18SXj+YFAuHDqGaMU+rki4scoj7pEM5mNfgNvedZxGU78Y
	XrgOHAS+5MSdOpdk0siDl2USoLh1zPktA2fwyFGydDwq5MRKbLJks0rhpLeiMCBnhK4zYy21XsZ
	PWlidp577Ev8Uug+C+jQHsuus3zTB2BhjAu0Db5/NL37V2I2F97gASE1tGX5Nu3+i4ZJow1GJc/
	AlUOX9/KmQUiCvo5ZOpNttPqOipnSZosIjzVDJjpKJ8sru7XLrMl5GCopRXSZS0E6WZZJZqj8/8
	s0GXCPl0dHtRn09TA==
X-Received: by 2002:a2e:bc16:0:b0:3a4:8510:f45b with SMTP id 38308e7fff4ca-3a630587d23mr6394071fa.8.1790175307836;
        Wed, 23 Sep 2026 07:55:07 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a62f527d51sm7824951fa.33.2026.09.23.07.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:55:07 -0700 (PDT)
From: Roman Demidov <roman.demidov.nn@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roman Demidov <roman.demidov.nn@gmail.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	Jani Nikula <jani.nikula@intel.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Jesse Zhang <jesse.zhang@amd.com>,
	Fang Wang <32840572@qq.com>
Subject: [PATCH 5.15 2/2] drm/amdgpu: Limit BO list entry count to prevent resource exhaustion
Date: Wed, 23 Sep 2026 17:54:49 +0300
Message-ID: <20260923145453.76114-2-roman.demidov.nn@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923145453.76114-1-roman.demidov.nn@gmail.com>
References: <20260923145453.76114-1-roman.demidov.nn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Jesse.Zhang" <Jesse.Zhang@amd.com>

commit 6270b1a5dab94665d7adce3dc78bc9066ed28bdd upstream.

Userspace can pass an arbitrary number of BO list entries via the
bo_number field. Although the previous multiplication overflow check
prevents out-of-bounds allocation, a large number of entries could still
cause excessive memory allocation (up to potentially gigabytes) and
unnecessarily long list processing times.

Introduce a hard limit of 128k entries per BO list, which is more than
sufficient for any realistic use case (e.g., a single list containing all
buffers in a large scene). This prevents memory exhaustion attacks and
ensures predictable performance.

Return -EINVAL if the requested entry count exceeds the limit

Reviewed-by: Christian König <christian.koenig@amd.com>
Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
(cherry picked from commit 688b87d39e0aa8135105b40dc167d74b5ada5332)
Cc: stable@vger.kernel.org
Signed-off-by: Fang Wang <32840572@qq.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
---
Backport fix for CVE-2026-23468

 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
index 22d7b7c504db..ca0d82be5c9c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
@@ -35,6 +35,7 @@
 
 #define AMDGPU_BO_LIST_MAX_PRIORITY	32u
 #define AMDGPU_BO_LIST_NUM_BUCKETS	(AMDGPU_BO_LIST_MAX_PRIORITY + 1)
+#define AMDGPU_BO_LIST_MAX_ENTRIES	(128 * 1024)
 
 static void amdgpu_bo_list_free_rcu(struct rcu_head *rcu)
 {
@@ -230,6 +231,9 @@ int amdgpu_bo_create_list_entry_array(struct drm_amdgpu_bo_list_in *in,
 	const uint32_t bo_number = in->bo_number;
 	struct drm_amdgpu_bo_list_entry *info;
 
+	if (bo_number > AMDGPU_BO_LIST_MAX_ENTRIES)
+		return -EINVAL;
+
 	/* copy the handle array from userspace to a kernel buffer */
 	if (likely(info_size == bo_info_size)) {
 		info = vmemdup_array_user(uptr, bo_number, info_size);
-- 
2.53.0

