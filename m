Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2120642F709
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791788521; cv=none; b=F9R2Iyl6MeHOinkDZUu9S6uQ9Qj3mSyp4OZxGWQsORuk9fin8UQLRN34euR/43FxrFciidOzs8oTgVmZgTL/O35BFiubdj+QTDRF1G+lGos2SfhIpX8eP5fqFtN1AsyPcZmVBByJNy3xmckx7C3Rk8tPNeIeNn0U5MC1IXU5zQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791788521; c=relaxed/simple;
	bh=Mt5WDCiD8tEdJ4CbcXjRX0Q7cR5vFljDaq2NWFYbikk=;
	h=Mime-Version:Subject:From:To:CC:Message-ID:Date:Content-Type:
	 References; b=ojsTEjBKisBTYPtHCpBPxSAyqgkaBAmd0fVBwM7GgNXpUPU8jrNojqcVvhUQh+6Q060wZIwIWdJsFaXj6cX/z7/ZNvdrAq4S0eW2/YufvuIBAWxozkMg6Fm9gNjhsTjISMseS48HqF5txDRRgt24fyV/flwOtPzP4mAV1dpgKZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Ayab69z4; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Ayab69z4"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20261012070156epoutp0211e7ab63502bddb05381b56ef2ef3881~dtimb2POl2435824358epoutp02g
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:01:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20261012070156epoutp0211e7ab63502bddb05381b56ef2ef3881~dtimb2POl2435824358epoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791788516;
	bh=7SLteVdjPiEHdE5sddmk61hF6DXbPHqRUJWK2W3/8yk=;
	h=Subject:Reply-To:From:To:CC:Date:References:From;
	b=Ayab69z4B8bLubdHG2lTd1uRwyoPUHGNP8tt7g3tGU9u2eI1g6/JFc5EfknA433Z1
	 jHstcRNCUcaIaWxbsUSe0yZ8cgAAFzqdDr7bkCVn5OfCegVjNwBg5erPqFLPwsCl/d
	 JEIYJe29jWda26RI2ozRW9GyRBrn0kcKZBsrorW0=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20261012070155epcas2p3b98e22081fb305528e3e2113cdf58680~dtil3xUgg0609606096epcas2p3R;
	Mon, 12 Oct 2026 07:01:55 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.38.205]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4j37gR59V3z6B9mD; Mon, 12 Oct
	2026 07:01:55 +0000 (GMT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Subject: [PATCH] f2fs: do not discard valid segments with
 discard_unit=section
Reply-To: keosung.park@samsung.com
Sender: Keoseong Park <keosung.park@samsung.com>
From: Keoseong Park <keosung.park@samsung.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
	<chao@kernel.org>
CC: "linux-f2fs-devel@lists.sourceforge.net"
	<linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Jinyoung Choi <j-young.choi@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20261012070155epcms2p12175ed226bd55689c386338460be6d9d@epcms2p1>
Date: Mon, 12 Oct 2026 16:01:55 +0900
X-CMS-MailID: 20261012070155epcms2p12175ed226bd55689c386338460be6d9d
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-223,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261012070155epcms2p12175ed226bd55689c386338460be6d9d
References: <CGME20261012070155epcms2p12175ed226bd55689c386338460be6d9d@epcms2p1>

With discard_unit=section, f2fs_clear_prefree_segments() widens a run
of prefree segments to section boundaries, but only LFS mode checks the
sections for valid blocks afterwards. In adaptive mode with large
sections the widened range is discarded as it is, including segments
that are still valid, and their data is lost.

Check each section whenever the range was widened over large sections.

Testcase:
- mkfs.f2fs -f -s 2 /dev/vda
- mount -o discard,discard_unit=section /dev/vda /mnt/f2fs
- for i in 0 1 2 3 4 5; do
      dd if=/dev/urandom of=/mnt/f2fs/k$i bs=2M count=1 conv=fsync; done
- rm /mnt/f2fs/k0 /mnt/f2fs/k2 /mnt/f2fs/k4; sync
- umount /mnt/f2fs
- mount -o discard,discard_unit=section /dev/vda /mnt/f2fs

Before, k1, k3 and k5 are lost after the remount, or the umount hits
the f2fs_bug_on() in __check_sit_bitmap() with CONFIG_F2FS_CHECK_FS.
After, they are intact.

Fixes: 4f993264fe29 ("f2fs: introduce discard_unit mount option")
Signed-off-by: Keoseong Park <keosung.park@samsung.com>
---
 fs/f2fs/segment.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 794e0d99fc7..2e1502c5571 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2325,7 +2325,7 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
 
 		/* Should cover 2MB zoned device for zone-based reset */
 		if (!f2fs_sb_has_blkzoned(sbi) &&
-		    (!f2fs_lfs_mode(sbi) || !__is_large_section(sbi))) {
+		    (!section_alignment || !__is_large_section(sbi))) {
 			f2fs_issue_discard(sbi, START_BLOCK(sbi, start),
 				SEGS_TO_BLKS(sbi, end - start));
 			continue;
-- 
2.43.0

