Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA363ACF04;
	Sun, 20 Sep 2026 03:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789875624; cv=none; b=I2SWpNrYNag+KDKkaskibfzttNRygXCwR9mlNrnrO+UBHlt9eK7QuElX5WkluqNVD0djQGeYwsCPJNSeKyIM8M15GehRQmLpIfATPe8KaRn2WEDZy5QCpJzTFc1885uo/RchO54uNUwjAOZyHqu5hgYiSwaLYZhhIQTvid+3ZwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789875624; c=relaxed/simple;
	bh=sJ8GO7iO32v65BhxKHidpqg4vsjwUSBGRmnVHvyBBoI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E6Rp/3w0MHChQeGiAb5v1ddUATD+WiOzUBXfj5uDMOF78523VUCScaaIY0oA+ef29f9t6Bg+csmQzMn9JJ0kjbNtP8E5a00vuM5+nlAdzdRe8aIyrCVdMKR9gIurHclJg1bQvAPpzWNq+9c0RRCDX67Dc2fh8CG8NriXj8oxj+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=mAHq7ihv; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="mAHq7ihv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=eS
	jqrhAxmhRkD+fLHj9BVqvfyKRvI/XQ1Qo/8Er9tsk=; b=mAHq7ihv7+ATfWGJSd
	6xCVgDk+gVEU5FIbxIB862RtH0cLoMdu4GbO3ClxSWLs9gegpwWET1uFuwEFbYaG
	+CJwqBpw0hJBKqHym1niIkgPHKBz9WANbGMZS7RvtSEyX6m4jdlHT50NLpR1Yx6k
	cwmI9mEMdgSU3N7Z1EFL6TnqM=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3X+qcVa9qN0J0Bg--.1052S2;
	Sun, 20 Sep 2026 11:40:12 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: hverkuil@kernel.org
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hverkuil+cisco@kernel.org,
	hppiscas@163.com
Subject: [PATCH v2] media: cec: extron: clear response tail before dispatch
Date: Sun, 20 Sep 2026 11:40:10 +0800
Message-ID: <20260920034010.15060-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3X+qcVa9qN0J0Bg--.1052S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw1UXr4fWw1xKFWrury8Zrb_yoW8uryfpF
	Z5W34DK348Crn2k3ykKan5X3W5Xws7XFWUWry3Ga1kur45X3WxuF9akryjga1YyFZ5JFnx
	Jw1UtFy3uFs5GFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U5739UUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7hwDy2qvVZyVTgAA3t

The serial receive buffer is reused between responses. Terminating a
short response with one NUL leaves bytes from the previous response
behind it, while the dispatcher also checks fixed offsets beyond some
prefixes. Those checks can consume stale tail bytes.

Clear up to ten bytes at the end of each completed response, limited by
the remaining array capacity. This includes the terminator and covers
the dispatcher's fixed-offset tests without adding a separate length
condition to every prefix branch.

The issue was found by our static-analysis tool.

Fixes: 056f2821b631 ("media: cec: extron-da-hd-4k-plus: add the Extron DA HD 4K Plus CEC driver")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
Changes since v1:
https://lore.kernel.org/all/20260830130356.159-1-pengpeng@iscas.ac.cn/
Use the bounded tail clearing suggested by Hans instead of per-prefix
guards; preserve the existing nonempty-line and receive-buffer limits.

 .../extron-da-hd-4k-plus/extron-da-hd-4k-plus.c    |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
index 3c6ce6f3d93e..1f8ed7ff31e5 100644
--- a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
+++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
@@ -847,7 +847,9 @@ static irqreturn_t extron_interrupt(struct serio *serio, unsigned char data,
 			return IRQ_HANDLED;
 		memcpy(extron->data, extron->buf, extron->idx);
 		extron->len = extron->idx;
-		extron->data[extron->len] = 0;
+		/* Keep fixed-offset response tests from using stale tail bytes. */
+		memset(extron->data + extron->len, 0,
+		       min_t(size_t, 10, sizeof(extron->data) - extron->len));
 		if (debug)
 			dev_info(extron->dev, "received %s\n", extron->data);
 		extron->idx = 0;

base-commit: 518e5b794c06c0f0eb40df3e202274a66202c137
-- 
2.50.1 (Apple Git-155)

