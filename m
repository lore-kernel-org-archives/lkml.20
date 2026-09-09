Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22CA583AB0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 16:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788971557; cv=none; b=mbkPiitAfrVT3A++WUYeYysX++CsOPoTLUlb+eWNtwTuz4oSaCouZKD65nuhPbaGTtkdAr3YJBbVaNIO7f8kT40zoOoV/AZMiX5n/GpXDPkeVLQ4yp2dKGJLVspN3mbYTp4mm2yCISQeYwaIV4IIMcpbJZVsP0MjyfPeeUIaoz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788971557; c=relaxed/simple;
	bh=3yw28iVcq5k+J+M7mY7eeePgOPQVc3pxRbGi7Y6OLOM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XPurycvoaz0LoYnlh1KLAkWAOnWMgQBBPND7lIA4jX0l4IK4yLwgFOYnIeVqgSfBb9TB/IgddqjXiv3OrS6rIUeodis9k7H/dAU8TB+V8ZP1ekI27Otpto70H6iPzqTog5KJ+IrbrkSRw0+oihBhGyIN5wknhsruFczX/6Jf9G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UxF3lZxB; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UxF3lZxB"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7f6617c7536so2754665a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 09:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788971554; x=1789576354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pVXEIU1yhRw/bbhmjo7A0XK8nTRQ4MeU4yLdlyk7vyY=;
        b=UxF3lZxBwpA+uU3/Yp2F4okGh9WpNLXSDTX+pPpVMw7M3kQfWGC25Y9jvCZPeuT7eA
         OPhXM9HYURsDY/PqillJSrqedE1RrNK7pSuT1wOVNFuTZT4mqHITkDP1AELXH07sOnGK
         rUDcQEx21hgs82Tz76FEDsnAulTi5H9G7THgUl9nKOJVn2XZ/NqcsovEg166Xit2SEPz
         UrF1K6YEParpqDmrV8KX7KUb+FG4DriB4mRZtFQMpe2TGdksterpL7BckOuHgLrSI+Gr
         qdqU/uJr0LscmSbjSHzZjMdKRIg9JLs7ZN/XrEw8AXEx/eK8Ti7aaPq12IBdQezhGSst
         ouIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788971554; x=1789576354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pVXEIU1yhRw/bbhmjo7A0XK8nTRQ4MeU4yLdlyk7vyY=;
        b=AXygLxtSgSGK3t8bfUmnY92vX8ty3KS6cwFtUuCjEw1ozewnyF0pC++QY5WgHpQhXM
         LQD85eqSKZZos8WnOUFHqdK5lBIU1OwO84ZdGdrWi2MNoHk4VnjGQr+9DqXjdS1c/uiY
         AWE7T7GkXDRSspSwPO2POym/nriCI4AqCu3J6d9YQEk8Tg9b0kM4Nh9PTeHxXzZLLL1i
         WTc9tPP8OgBBr5XMmUE3Ytk4/sh9k+msknSdTfVrBPH2Rsn+GR99vsQd8JZL8Vn0bNun
         qXEwz7wFTLHSKcTfbh9MXDtjSXjT2f+ujWtMAlcNNQWtZ0mTwt952sn+IoEfd+xxte3N
         QiIA==
X-Forwarded-Encrypted: i=1; AKwUvBwr4aNmrGsbs63/7atgd2OBgYMsFXpkku4ZHX//XR9QFbjc5jnGXrIMFGOKtqgezFUGE2o2jIWoih+f5eo=@vger.kernel.org
X-Gm-Message-State: AFuF++nIlyu29tdx2tAg5/m3rGmPjJpUUVsohYqNFr/byXhw+VvEmDLM
	ihIEvGmU/gpMrrzshVs72x60OXlUwZrLoTJo7Kv1dXrxEStf1tibmrHJ
X-Gm-Gg: AYBFou2gPyhTOBlGyLhcf03OPwxbGcm9JWjY/sUlz8BMLw9+k2J9SAaPNxW3s4ZZLRq
	aDxwy/uvzBvTG7mMobFhlGvczcAUct3nu5iJXYa9Vxlds5ru4kDx96rsyIO8b9HLfuCKyIHjrkx
	pPPHJMAWOvPkHY8qnztmMq6uyHBmLjgzDCsgQgGi0i/L4ptLVU8VpZxDpM7S2TDqT33bq4Rp/YL
	7/QMRLptdrd7bsGLqGs8kSlWSb/JFgm4R/PSW/wWbC6GTPNGvDmEYKmgnAFKX9hcb1tuJvXJx13
	sGhxg07ctTVaBmGXDAYTsn2Xd/YAiY15Mu9AUFHlICsX7LaaU0H5LhI2EQlX+1VlKRja2V88h9i
	85Slsz+kXcuJGuTCYHbBy69et4nr2cF4gmYv08yX82uknj0EUGLdfENuhEIVMSSeIvuv4A+zDl4
	8Q+7wNuIQc+9cUamYAWjE5GYtpZbRcZNjWm1bj1piy7t/Khani4bQiVKU+ECsd71FDUu/VJwK5h
	ouOiVw=
X-Received: by 2002:a05:6830:6686:b0:7f4:c88c:7b10 with SMTP id 46e09a7af769-7fa20de79b6mr22398088a34.12.1788971554406;
        Wed, 09 Sep 2026 09:32:34 -0700 (PDT)
Received: from fedora ([2a0d:5600:4f:22::11])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f9f6794e22sm17115595a34.7.2026.09.09.09.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 09:32:32 -0700 (PDT)
From: Safety 1 <git.userk@gmail.com>
X-Google-Original-From: Safety 1 <176830914+JokerPython3@users.noreply.github.com>
To: kees@kernel.org
Cc: joel.granados@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Safety 1 <176830914+JokerPython3@users.noreply.github.com>
Subject: [PATCH] fs/proc: avoid unused ctl_table entry in init_header
Date: Wed,  9 Sep 2026 19:32:14 +0300
Message-ID: <20260909163214.245399-1-176830914+JokerPython3@users.noreply.github.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The entry variable in init_header() is only used by
list_for_each_table_entry() for iteration and is never read. With
-Werror=unused-but-set-variable, this causes the build to fail.

Use the table size directly for the loop since the entry value is
not needed here.

Tested with: make -j$(nproc)
Signed-off-by: Safety 1 <176830914+JokerPython3@users.noreply.github.com>
---
 fs/proc/proc_sysctl.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/proc/proc_sysctl.c b/fs/proc/proc_sysctl.c
index 04a382178..ddc510def 100644
--- a/fs/proc/proc_sysctl.c
+++ b/fs/proc/proc_sysctl.c
@@ -206,9 +206,7 @@ static void init_header(struct ctl_table_header *head,
 	head->node = node;
 	INIT_HLIST_HEAD(&head->inodes);
 	if (node) {
-		const struct ctl_table *entry;
-
-		list_for_each_table_entry(entry, head) {
+		for (size_t i = 0; i < head->ctl_table_size; i++) {
 			node->header = head;
 			node++;
 		}

base-commit: 893e11787f78e43b534e252249ac3fff4d1333f8
-- 
2.55.0

