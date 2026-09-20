Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DB754704D;
	Sun, 20 Sep 2026 03:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789876291; cv=none; b=mLPAoWfIrD6YuTCpa+Nyjh+PZcVoAMVoe12o6xxORnIsAV+oDMnqZkhy+b/PFK9laOmMNNAJkA5XA/CFbYzBtGNfhBVxvFwiOyN3nr5AEmn61GLSQyAX6JEjELhxzl5eANaTQuKKdm38c+y3MRbF+fRHzP3sQGOx+E3A2oqv/m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789876291; c=relaxed/simple;
	bh=ZzqYH3jaQS125xlS0mr0YhJ2PVTSrKAPIPMoKyD2t3w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fJp33yn4VpCCwqGxiJDEP/A5brEsHkxiM+jsz6f7V0gEn0GGz0TFJSwbX7RrIJt+s5Q8KNVT44T08hUZmq468WqTV9htWIa+zFHCTqjh0a7Qjd/7kv4o4Bt9bjtQSmeL8KmSpxjtKIvdl5xmNhmPHE6U4pEaHceBvtLNQQXswAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=W73k+0Qn; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="W73k+0Qn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=WI
	5CArvdWHJdA7UsMzI+ZNW29yfu0T7+qo+4NRVfDqk=; b=W73k+0QnRpxYER3CxP
	szl2ArucQiK8S6bRVjocuCzHdzWa0JizIEZPqQzTpxrccNyProIoj1L8o9yViRHl
	dEXCcELxL3JD5hOBEmiQ+uvZfS6auXr0U0ymcNvpWnw1wRnM0TGT7WC3JKQXZrVl
	RYiAtzDe8ZLFnRZGjYFHbtYF8=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wCnAW4tWK9q44szBg--.526S2;
	Sun, 20 Sep 2026 11:51:11 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	hppiscas@163.com
Subject: [PATCH v2] media: dvb-frontends: ds3000: validate firmware size
Date: Sun, 20 Sep 2026 11:51:07 +0800
Message-ID: <20260920035108.20086-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCnAW4tWK9q44szBg--.526S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kry7uw45Aw13Cw1DKFW8Crg_yoW8Gw4fpF
	ZIqa429FWUW34xtFyUAa47Cry5t3s3XFy5Kr9rXa48Zr1S9Fy7Wr18Ka4aqw15Gr97JrW0
	qrnrJwn7A3yfZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRT89_UUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7Q+ncGqvWC-JTQAA3D

The firmware diagnostic accesses the first two and last two bytes
without proving that the image contains two bytes. An undersized image
can therefore be read outside its bounds when the diagnostic is enabled.

Reject images smaller than two bytes before the diagnostic or upload
path consumes them.

The issue was found by our static-analysis tool.

Fixes: 09ea33e5c696 ("V4L/DVB (13493): TeVii S470 and TBS 6920 fixes")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
Changes since v1:
https://lore.kernel.org/all/20260830124034.95459-1-pengpeng@iscas.ac.cn/
Include the tool-discovery and coding-assistance provenance requested by
Jonathan Corbet; retain the two-byte minimum check.

 drivers/media/dvb-frontends/ds3000.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/dvb-frontends/ds3000.c b/drivers/media/dvb-frontends/ds3000.c
index ce7ae424b27c..9cc97ca7bbcc 100644
--- a/drivers/media/dvb-frontends/ds3000.c
+++ b/drivers/media/dvb-frontends/ds3000.c
@@ -373,6 +373,9 @@ static int ds3000_load_firmware(struct dvb_frontend *fe,
 	struct ds3000_state *state = fe->demodulator_priv;
 	int ret = 0;
 
+	if (fw->size < 2)
+		return -EINVAL;
+
 	dprintk("%s\n", __func__);
 	dprintk("Firmware is %zu bytes (%02x %02x .. %02x %02x)\n",
 			fw->size,

base-commit: 518e5b794c06c0f0eb40df3e202274a66202c137
-- 
2.50.1 (Apple Git-155)

