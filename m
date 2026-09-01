Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C594B441627;
	Tue,  1 Sep 2026 03:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788234063; cv=none; b=DRPR7sZI5XekyJfBKpUHcpsqY8NPnXzlyDdTQJM6Gn5ht7hm+mDrgSLaIyD7nTuTGFeUZubMatL3WcezRl5IMB4DCPbcuCBlRr1K+jPf5mdXYldTQNtFHQil9TDn4EDKoOjisLAmoUUxMLKbJ41D9L162tFhZiYPAxcCuhQi1iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788234063; c=relaxed/simple;
	bh=nkByA1r4gjkR3HF6zklMff1Gx5SyVgG29NUZgJN7jc8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tamK6ewhVsVTEohrpvfa1MAa7g0kADg6SOGv2MCaN8pNYE8p8WREoOTsXEH13TgET6ZUAV5eumAg6UPpsySBl65NaEl7zeluuYXsMYqTc9hIvxtGYPZiVjhmsW+mkU2ypsEut1UTzyzKbRJluO/squ9h6NMWeuXRxEp1o6UOL2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=UeSGXVnI; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="UeSGXVnI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1788234031;
	bh=E8HSDbsGb0zr2iSQZgHfVNDBgCi9DtDRDd9u7kKI7CA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=UeSGXVnIrxm1fBB1zD5sCkLHlAwAnv2LkvIGSxzzpDI3ixV9ty9AOMc5DUZOUNAsO
	 cmX/PghiWu65uIu15BOPjgfA9bctilJxi9F5ckZTzxFqsob45w7azhB9cb9Kg/KBL6
	 rPa3F+9wlPOVAvm0/aBC9B6OHQkCOqZJXqrRtLbw=
X-QQ-mid: zesmtpgz4t1788234027tdb9f2fec
X-QQ-Originating-IP: xMAN3R+10bbpDGzNDYA7agbZ7iP3diIMvcNS0aCvI9I=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 01 Sep 2026 11:40:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 1679389079701470201
EX-QQ-RecipientCnt: 5
From: raoxu <raoxu@uniontech.com>
To: perex@perex.cz
Cc: tiwai@suse.com,
	raoxu@uniontech.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda: restore MFG widget enumeration after core split
Date: Tue,  1 Sep 2026 11:40:24 +0800
Message-ID: <44809B8FF80DCCA2+20260901034024.2407783-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: M4+GqYRlc6iCzUz0JzvHcpyaf81MoyVyvXEa9Cu3y3cOoo6eDvqIIDGR
	1cY+5kCo57dcbT45WsZRkWMn/lZW9UiiUXnLZepkOGx4HFx4g89JaAdia1LEe6R/IU1oNYI
	ti8La8HKj5UIP+xb1qQjc9RuYTYZTd1AZ82txq7b2tt+pqGH1w5hF1eDU8cBmwaKTRqx4DF
	K5FmiPQrsIzEfmsgYg4G08DWLyFDkcszL1Lk5M78oBlAaSZGPPAYkXeRTJf/Qs/jKaoR8rG
	KnnUfD46Mj6GDwaCmAk9Epl5IrBGaCVnbM9lMHdAvH2mF3jQiiNNgPZUE1/WLJkrNRY8q5L
	TNlvO5iZdYPESDNjiAT3qcnEWhq3gKhZPBPb63rm8ylKfslL3fAtXPzeDtpA9RE44ciiiqX
	Jw9OzGbtFGrKJx6rUI30GzIru+4qMp11YrhAIU3gt3icrt2zIiLjm0N0IR9IJnKEhvrfasE
	CGCTKTUpG3T8VeZhF9/QKyJDfaPl/nd8sAhEhx0pULBgLyE8IBFAzQunAncL6lE6mLDnkIg
	TpPNeg2cc/ORsY4Tqvxig1HJLxaHNrd1J9FfX+p/Ef2Mmd7o1NHwHxsvKqZLEL8kEeRbJiS
	twnZzh2zoEkpMwXcU0QpBpRNZ5N0MhcVZBmMH9DEy1mlGJHL4KU4JQLB0nQSlOSeKmMbglD
	a+Retd0wiI/AmFDNFA9jmWiKug3zeiFNZBkNQJKTUjf9SuJ4xMrul9HDj/ecbZfwjV2Qu5+
	8cSbOYHOngY/c7vNASTqe0TDO7rWoXL8jJDrQnp55Ufhn0z+AuLeA3T3dew+ZMP+TeTp2RZ
	6U4HkHNNnQkVV15SWofciRz2WBgsardLNdn4KQ7S1VfFlyokaHOzan+nfnx9Ix8i0XuSnBy
	kvQ7DQ9aPcfo93J5lh+gxAP+lJjOvAfdp/krs8BkbpmO27VigZAMMeknhzX9B1zU2eFlfOo
	BUENjF/55WFIqfOju57LBEY/mdfuEh6KVQI0o34mvna8BzlKTcBSMC/b7qXR7rhjv0OKQ79
	uooiGiXIrvNXVdp+q6ErlJegcewv0=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

Before commit 7639a06c23c7 ("ALSA: hda - Move a part of hda_codec stuff
into hdac_device"), widget enumeration selected the function group with

	codec->afg ? codec->afg : codec->mfg

and read subordinate nodes from that group.

The core split moved this logic into snd_hdac_refresh_widgets(), but
hard-coded codec->afg there. For an MFG-only codec, codec->afg is zero,
so the Root Node is queried and codec->start_nid/num_nodes are populated
from the function-group range instead of the MFG's subordinate nodes.

Restore the pre-split AFG-or-MFG selection.

Fixes: 7639a06c23c7 ("ALSA: hda - Move a part of hda_codec stuff into hdac_device")
Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 sound/hda/core/device.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/hda/core/device.c b/sound/hda/core/device.c
index 160c8d0453b0..ebaa106d0f01 100644
--- a/sound/hda/core/device.c
+++ b/sound/hda/core/device.c
@@ -404,6 +404,7 @@ static void setup_fg_nodes(struct hdac_device *codec)
  */
 int snd_hdac_refresh_widgets(struct hdac_device *codec)
 {
+	hda_nid_t fg = codec->afg ? codec->afg : codec->mfg;
 	hda_nid_t start_nid;
 	int nums, err = 0;
 
@@ -412,10 +413,10 @@ int snd_hdac_refresh_widgets(struct hdac_device *codec)
 	 * widgets array.
 	 */
 	guard(mutex)(&codec->widget_lock);
-	nums = snd_hdac_get_sub_nodes(codec, codec->afg, &start_nid);
+	nums = snd_hdac_get_sub_nodes(codec, fg, &start_nid);
 	if (!start_nid || nums <= 0 || nums >= 0xff) {
 		dev_err(&codec->dev, "cannot read sub nodes for FG 0x%02x\n",
-			codec->afg);
+			fg);
 		return -EINVAL;
 	}
 
-- 
2.50.1


