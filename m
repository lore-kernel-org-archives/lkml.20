Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB09488D9C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790585309; cv=none; b=PDNZyg+qynm5jT4xaP7SHWTpNd37TaxCYeHk01erkbgdrxetr61mS8QY+cSmFvFvyaEQjRAkj9S7/0IhDF8fb9bqBI863tOgUGXJmhrIxtTNJqdomXLK1ydwgn9vF02Q3I3b4b5A6NlUp/jgQj0T7+Bf6/3mRyucEWwMK5twmbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790585309; c=relaxed/simple;
	bh=4+YaRd+w8CkKUy2umZb5rtfcp72agIYLGB21NcbX/fw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Qj7o9kfGSgL9dU5ny4mZpY54zM2egFkAg4ecwoaVm+1U5sS2q3LA3Q1qvPb13UifZdaR8X96Oqe4pq04z8J/o4UCBZXs4Jqr0xKu4lQXCcd5tdj13tBeOgIDKDGgVkXdkS1cuUoIRERJqZbg1xq2b+GP6I0f3HseZcpCdKjJIC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hxbySvb0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hxbySvb0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 852CC1F00893;
	Mon, 28 Sep 2026 08:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790585306;
	bh=yLabRzTUqOUXQwgBjet8vKJDfT/Yj93lFm/f0NXf0fg=;
	h=From:Date:Subject:To:Cc;
	b=hxbySvb0c5U1ddRxETp6cq1wU7L0alG6fj7LX9jUThAcqHAP6DklVfNDAiFMmhBTp
	 oYhLfiJSG/U1KguJ1+fjQ1sKb2nDYsIbQWrj7F0SFh+zcmju3XcpqGm9ACxlqzVh81
	 imPv3oNQC+NcUOKqwhnoyuXoxws25H6N/Md7YGEKNNT5LgJWkHODd1WsT3oLu5XcFK
	 5BJ3edJlelICi0L81sA+IiZ+qG4Zr46Bwm3HWnhXxKOWwiW0fzHTC89ewFeVFtwAuE
	 lzP9GtwlYiSi3CIp1y8XdnhYJU+nefUAKpLOTJYcK6OoeFYkVsdj+EM9GswkdWZXVU
	 m2+XfPvh4HSrQ==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Mon, 28 Sep 2026 10:48:21 +0200
Subject: [PATCH] vmcoreinfo: export SECTION_HAS_MEM_MAP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-section_has_mem_map-v1-1-4129f6ba2838@kernel.org>
X-B4-Tracking: v=1; b=H4sIANQpumoC/yWM0QqDMAwAf0XybCEWFLtfESldjZpBVRo3BuK/G
 7fHg7s7QCgzCTyKAzJ9WHhdFKqygDiHZSLDgzJYtA062xqhuKvj5yA+UfIpbKaxWA/RYUA3gpZ
 bppG/v2vX/1nez5eW9wrO8wLuHPfkdwAAAA==
X-Change-ID: 20260928-section_has_mem_map-6205dc90a09f
To: Andrew Morton <akpm@linux-foundation.org>, 
 Baoquan He <baoquan.he@linux.dev>, David Carlier <devnexen@gmail.com>, 
 Dave Young <ruirui.yang@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383; i=david@kernel.org;
 h=from:subject:message-id; bh=4+YaRd+w8CkKUy2umZb5rtfcp72agIYLGB21NcbX/fw=;
 b=owGbwMvMwCF2/OVpCdfQ3ZWMp9WSGLJ2aV7fJiTZsbSSO9P1lYho1/1HHhtNdlb6H3vYUZP+J
 +f3l3T+jlIWBjEOBlkxRZag4PsGL1+uq61242OGmcPKBDKEgYtTACayQJqR4QXXg8p2FVmmD+xf
 /1VOKCn4YyydI6+dI+7/+OBywXu3JzIyXHwUXzzpx8kM0yyjE3OuRL6x11iz8KDcx813VNtro9Z
 xsQIA
X-Developer-Key: i=david@kernel.org; a=openpgp;
 fpr=1BD9CAAD735C4C3A460DFCCA4DDE10F700FF835A

The crash tool currently hardcodes SECTION_HAS_MEM_MAP, and makedumpfile
needs similar information (although still relying on
SECTION_MARKED_PRESENT, it should switch to SECTION_HAS_MEM_MAP).

Let's just export the value instead, so tools that work on vmcoreinfo
will not have to guess.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
Result of the discussion in reply to "[PATCH v2 00/13] mm/sparse: remove
SECTION_MARKED_PRESENT and further cleanups" [1]

This patch can go in independently. It would be preferable if both
go into the same kernel release ;)

[1] https://lore.kernel.org/r/20260921-b4-sparsemem_cleanups-v2-0-54d81d65e125@kernel.org 
---
 kernel/vmcore_info.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/vmcore_info.c b/kernel/vmcore_info.c
index 5a417f8a922a..7833a36064a8 100644
--- a/kernel/vmcore_info.c
+++ b/kernel/vmcore_info.c
@@ -182,6 +182,7 @@ static int __init crash_save_vmcoreinfo_init(void)
 	VMCOREINFO_STRUCT_SIZE(mem_section);
 	VMCOREINFO_OFFSET(mem_section, section_mem_map);
 	VMCOREINFO_NUMBER(SECTION_SIZE_BITS);
+	VMCOREINFO_NUMBER(SECTION_HAS_MEM_MAP);
 	VMCOREINFO_NUMBER(MAX_PHYSMEM_BITS);
 #endif
 	VMCOREINFO_STRUCT_SIZE(page);

---

base-commit: 57e4ac91fc62d75d84b5a03827a19ceb4094ecd9

change-id: 20260928-section_has_mem_map-6205dc90a09f

--

Cheers,

David

