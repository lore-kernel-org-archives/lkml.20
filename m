Received: from mta0.migadu.com (out-233.mta0.migadu.com [91.218.175.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC99247F3AE
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791961485; cv=none; b=cSkOQcG812/riwa9R00S2ro1Rq8b5NI/P5oHTkpMTNsyC9WoAI8uZT7XKCe+FQ22rpwpFjnX2Ff+ahIJx6CqpsDI2u/Lm04vCq4yMd/BuhyhvW9NHfErUJ4Rb3116GXnE9cchaOzoqckV/Alpz9IJFxe3iwiJ3watx5m/pi5LfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791961485; c=relaxed/simple;
	bh=DYV7gVOeR2CBG2yKmyTc+5ln+eeoHJB5okAWZ+ZFVBY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jHGalIMe0R7FlYmH+z7HoW+PO/50rrtxHYizzxyRyUkBi+pc6vQetK9rvRwu1+Bj+aMEwFLkJb8DZY0VXafShkEDN3jjIPldznR7RbrZCtJXXQIdr7rFycHKe9X5EQVTEgeiyKvpVrLK+dsED6n1wpQq32Ns8+MXkkCv/VGMrwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nfKDW2ep; arc=none smtp.client-ip=91.218.175.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nfKDW2ep"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DYV7gVOeR2CBG2yKmyTc+5ln+eeoHJB5okAWZ+ZFVBY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791961479; v=1; x=1792566279;
 b=nfKDW2epzgA463YsdR1w5II6lfTCPu93W2w8x9w4mUo3uB8ZNO3SU/pTIWRjCcrsQTYDVCjG
 rNeguEovPcnaaxT2nNlZDkXysxlzUG0JzQ72fTo+z+rNi8PpCzG0y/dYhUTaA5TtbW2RmE5i7Hi
 hQk2sl66UUp506kxhrQ4Cl5s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ed275eddc9041163;
	Wed, 14 Oct 2026 07:04:39 +0000
X-Mizu-Trace-ID: ed275eddc9041163
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
Subject: [PATCH 0/3] tools/mm: show_page_info.py enhancements and fixes
Date: Wed, 14 Oct 2026 15:04:27 +0800
Message-Id: <20261014-show_page_info-v1-0-7a68aee0114a@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHspz2oC/yXMSQqEMBBA0atIrQ0khQN6FRFRu6LVi0RSTiDe3
 XS7fIv/LxAKTAJ1ckGgnYW9izBpAuPcu4kUf6IBNRZGm0zJ7I9u6Sfq2FmvDNqhRE15XiHEaAl
 k+fwPm/a1bMOXxvV3gft+AEKOuLNyAAAA
X-Change-ID: 20261014-show_page_info-12fb720e5592
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Ye Liu <liuye@kylinos.cn>
X-Mailer: b4 0.17-dev-39d60

This series improves the show_page_info.py drgn script with bug fixes
and new features:

Patch 1 fixes memory cgroup information retrieval by updating the
obj_cgroup type casting and handling slabobj_ext field name changes
for compatibility with newer kernel versions.

Patch 2 removes the incorrect Page Index field display, as pages
don't have indexes - only folios do.

Patch 3 adds VMA flags decoding and VMA name display to provide
more detailed information about the virtual memory area containing
the page.

These changes ensure the script works correctly with current kernel
memory management structures and provides more comprehensive page
state information.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
Actual results：

drgn -s /root/linux-next/vmlinux show_page_info.py 1 7f17c9ab5000

PID: 1 Comm: systemd mm: 0xffff8d796ab73800
RAW: 0017ffffc0020028 fffff2af04d3aa88 fffff2af04d3ab08 ffff8d794703b901
RAW: 00000007f17c9ab5 0000000000000000 0000000100000000 ffff8d79438fd700
Page Address:    0xfffff2af04d3aac0
Page Flags:      PG_uptodate|PG_lru|PG_swapbacked|PG_movable_ops|PG_reported
Page Size:       4096
Page PFN:        0x134eab
Page Physical:   0x134eab000
Page Virtual:    0xffff8d7974eab000
Page Refcount:   1
Page Mapcount:   0
Page Memcg Data: 0xffff8d79438fd700
Memcg Name:      init.scope
Memcg Path:      /sys/fs/cgroup/memory/init.scope
Page Mapping:    0xffff8d794703b901
Page Anon/File:  Anon
Page VMA:        0xffff8d796b0c0cc0
VMA Start:       0x7f17c9ab5000
VMA End:         0x7f17c9ab6000
VMA Flags:       0x8100073 (READ|WRITE|MAYREAD|MAYWRITE|MAYEXEC|ACCOUNT|SOFTDIRTY)
VMA Name:        /usr/lib64/libmount.so.1.1.0
This page is not part of a compound page.

---
Ye Liu (3):
      tools/mm: fix memcg info retrieval in show_page_info.py
      tools/mm: remove Page Index field from show_page_info
      tools/mm: add VMA flags decoding and name display to show_page_info.py

 tools/mm/show_page_info.py | 68 ++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 60 insertions(+), 8 deletions(-)
---
base-commit: 1fffefb00cc0b0da1f2ae24e3d33364530ea6515
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261014-show_page_info-12fb720e5592

Best regards,
--  
Ye Liu <ye.liu@linux.dev>

