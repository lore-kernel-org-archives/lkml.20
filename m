Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BED61397
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 19:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791402440; cv=none; b=BpGE5CYXD1qJPuBjVtcllAK9Ovbg5zYrr/GWla23vlZp0ZXC6I2hNez/uElTjCDAMDiX1LIWiJJUHf4xjCbG6/tox1QWcp+/j1Dnp90QMKn3DC2ZuIgciJ8ohE7088DguNhsbj9ikjRsirMnQ53rOiIfizk3dNuu6K4n0h17L8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791402440; c=relaxed/simple;
	bh=m0XhmCSiJtu0hpSVs+qEnvJ6VgU5AZXusEwTJEt0ZFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iIVmiao0OySFrs8Ue/ZlAU6YWBga+9KGBFbEavrPDZ1kWGlfz9fLZOzeZgiaDmE7VzqC4tLdK6kc+87HriyE3uu3nLKX5LlCUcIxQpyWykgH947sdnl2wYK6F09ugV98atijkor9F320YauXk6Yg6ZufwxOg7FN+xeG/RJukvts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jwoxdyyo; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jwoxdyyo"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so18955685e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 12:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791402437; x=1792007237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R2GHJQFkiFJ5mQWKvTUQeafsQByOk6PW986HTt8vXuo=;
        b=jwoxdyyocB9Wg6H9cvOLjJ9nSSBBiuaGgIrQNtdFHbycydHShrZ/8TnPs513sh869p
         p0LBZbskRiFu+LlVm5b7kEI6ADeJAAhNdhzVYe+FXBmRJ86zVM3c8VKJpTK3qf2XFRgG
         OLENncb24pIggG8XrbNjw/tQGW+DtWf0pTL8+eqJwW3j+AXnVJI++oBhobHdR1X86jRo
         ocj2DzLEyEblrh18ZqxaQIfYz+zri19AJai70He8ou39NshHjR50dQKLDUYAXz3Wcb+b
         OAtigvXTk3WXNvzSRsUC6qxkaOzA4INNsmbTUlSp0Ytgl/m066b/liI/cMi4HPXqmqca
         tIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791402437; x=1792007237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R2GHJQFkiFJ5mQWKvTUQeafsQByOk6PW986HTt8vXuo=;
        b=A8FIjYyLDLGyMHJxxHwDr5oR9zt29BaisIDRd9EixRtsvqpCsmREFhpIJokriuKNF/
         vfUJz+Ulm+C/LDHGzkYyKjL6x+08JS+jnrCW6yiT+q9RIcm4vLg3rZztxr4LQpTuT+i3
         TnwQZ/D/H7aSM88wwbWlBbk9WFtJUxK71PZu1sbJjnrYUlLJI6eDWH3l1nzRzKyVZuLL
         sWBB9a/+lNj0QYTfxZIoWKVyQN3tkB4wh900JvrfMgO+62t9TF9aVtjmATo6iFwdSW3U
         mW4hoTrjRUtjKRME2TJfC3laGsvfJpkSay9KfmgVeRJ8r/BHLfkgFP4icGrxdLIyumt3
         U/fA==
X-Forwarded-Encrypted: i=1; AKwUvBxBh779hvkLWe4umt0cJlZw0LSpdwDulFQKAOb1yWUuYevA4JEGBjNpAPiYTJPQNPem4LuKh3FsLNhVUXk=@vger.kernel.org
X-Gm-Message-State: AFuF++nwnJj3sZqvnfAZFcSntwXkr17/Se8agwF75QRyusPcp2AK31Wp
	T4wXjJQ1YwNkWYc3ISnMcLb/q3ZU300A/6EY/KVyldC1dawAzKgqh2ab
X-Gm-Gg: AYBFou15PQI2ri7O+SkB9+73Sc7ec5K9P3MIUOh0/nd3qqrUyuOdZ/fXnKFxXgQaL5N
	8Je05BKKCCrmJYtUfHOqi2Xi4YTLWXLaUWd0qo+MuSvbnyjvm0123r2hYFfuC+CGlG/eU/m1l30
	hzX9u1T4OF0EnuNUS4VEvhliRNSt+27PFzh0V9k02grLTI3E2ezK5Xd+IHJWbz4fnkpwt7qlkeM
	SR9qm/gA79qc5kfdGHg6ejrsWT09IV+7zNXbnJvQT97gpQTHLN4vkibrb59e+cFB6OYBVsXgaF3
	JdcAI0hVaINM7VCf14iWI8jIKo+LEZRNa7EiePI6/U8gBS8ediyNJGD7pcNCCklFIp7hr+K4n0M
	c3ihnfwZJOhdX+kFsScTvDcvklculNH+ObHfLc4NEH4B8knNKqoV1xZN14doPIEbxvrfmr4YjXY
	nJbitFpiI9Dh+cfUjLM1U2WFXgwIqrDqMcE/avUYKOHlUg3ZixDmUXVBWzpbtc5HxQ1HncKrarf
	Vt4noUBxQ==
X-Received: by 2002:a05:600c:548a:b0:49e:6c11:c4fc with SMTP id 5b1f17b1804b1-4a180313b7emr52167125e9.7.1791402437226;
        Wed, 07 Oct 2026 12:47:17 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.178])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1843b5a2esm13117835e9.11.2026.10.07.12.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 12:47:16 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Oleg Keri <okerixx@gmail.com>
Subject: [PATCH v2] mm/vma: keep the unlinked VMA off the file across unmap on mmap hook failure
Date: Wed,  7 Oct 2026 21:47:08 +0200
Message-ID: <20261007194708.2009-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007101800.58d50b1b20a10738e630bfd5@linux-foundation.org>
References: <20261007101800.58d50b1b20a10738e630bfd5@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 2ceb21171dd9 ("mm: consistently validate VMA state after
mmap[_prepare] hooks"), the mmap error path clears vma->vm_file only
after unmap_region(), so free_pgtables() unlinks the never-linked VMA
and drops i_mmap_writable. Once it goes negative, every later shared
writable mmap of that file fails with -EPERM until reboot.

Clear vm_file across unmap_region() only, so that free_pgtables() does
not unlink a VMA that was never linked to the file, and restore it for
vma_close(): when the hook succeeded and the validation failed, the
driver's close() still runs and may use vma->vm_file.

Fixes: 2ceb21171dd9 ("mm: consistently validate VMA state after mmap[_prepare] hooks")
Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
v2: keep vm_file for vma_close(): with the hook succeeded and the
validation failed the driver's close() still runs. Reported by Sashiko
via Andrew.

Seen on next-20261006: one refused PCM mmap probe from alsa-lib left the
device unmappable, so PipeWire could not play anything.

 mm/vma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/vma.c b/mm/vma.c
index dfa45c64222c..531e4f53fdd7 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -2616,12 +2616,15 @@ static int __mmap_new_file_vma(struct mmap_state *map,
 	map->vm_file = vma->vm_file;
 
 	if (error) {
+		struct file *file = vma->vm_file;
 		UNMAP_STATE(unmap, vmi, vma, vma->vm_start, vma->vm_end,
 			    map->prev, map->next);
 
+		vma->vm_file = NULL;
 		vma_iter_set(vmi, vma->vm_end);
 		/* Undo any partial mapping done by a device driver. */
 		unmap_region(&unmap);
+		vma->vm_file = file;
 		/* Only safe once unmapped. */
 		vma_close(vma);
 
-- 
2.55.0

