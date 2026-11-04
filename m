Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=219.143.121.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759819;
	b=PpvgCYv+2ebz3FKa5VeaqATr5z5fOulPg00FtgRKNTmT0ODe0055JsDu9ZKbA76vxpw4
	 nomuuYkl6mDDT7nG3bc/1roDoGHsWhRoOxfk7mXULbFNk4KO0/lqUzp9WwCD3lbG0hG4p
	 KPvfszXZO+GcfEw0BMp8RfbVvD54rb/30fnrqA+ItK2v+DSc9t2v1iGo0V4Jw7e3ianfT
	 tPUKsBuxj8XldK87CqSxqGCAjLAADBf4lX616WD1grS2L4IEZNlCxsj2Sr0JDnZQtSiM8
	 2PGKcjflPD6XE1yaXWgC0cxQ5YOoBzqASeftK3U12KQe3UwRM5kmAgIAG/wZpd/XBow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759819;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-FangMail-Miltered:X-FangMail-Envelope:X-FangMail-Bounce-Flag:
	 X-FangMail-Outinfo:X-CLEAN:Message-Id:X-Fangmail-Anti-Spam-Filtered:
	 X-Fangmail-MID-QID;
	bh=e/08WZ+ldn9sCIKHO0pN4HbAw+pyxJgudHgZhSYps94=;
	b=UDhI7EGa/fUqCbsP4hObusBxQ4tNA0cES+/V67LzGhXKEACWRnLpV/IoFrQnNgvMaEc0
	 xNtATVAefU7Yq0C4q/UnJq33IWJh8yQiYeVPGAOjdulVyRsZG28bHZtkP3mc7t/YXQlHP
	 SoLVdej7Vv142XFF69yCylp12sjwMmlN/mSNKPgrHiFfe5h+6V3Y9ES9uTMXWBKlBXzoY
	 +TPepg90Pn+8DGwZDgFhmW6wBbja8LWbAN92zb7Tqdf4ilEAiyqSUsVJazpr7hMYpxi1C
	 DZwPxmG/39AHLWgOJxKTRYgJOjjwrvDo5VL7TqCOQnFVrnrdxj95FEih4Ce4AD57bDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=isoftstone.com;
	spf=pass smtp.mailfrom=isoftstone.com;
	arc=none smtp.remote-ip=219.143.121.9
Received: from spam.isoftstone.com (smg.isoftstone.com [219.143.121.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6CA606A31B;
	Wed,  4 Nov 2026 02:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE6CA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isoftstone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isoftstone.com
Received: from ldzh.. (unknown [221.226.109.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlzhangak@isoftstone.com)
	by spam.isoftstone.com (FangMail) with ESMTPSA id 4jK8hz217Jz22V1;
	Wed, 04 Nov 2026 10:36:51 +0800 (CST)
From: zhangdaolong <dlzhangak@isoftstone.com>
To: "Daniel W . S . Almeida" <dwlsalmeida@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+e9ce4d4ff55ba65e3980@syzkaller.appspotmail.com,
	zhangdaolong <dlzhangak@isoftstone.com>
Subject: [PATCH] media: vidtv: fix NULL pointer dereference in vidtv_s302m_encode
Date: Wed,  4 Nov 2026 10:36:50 +0800
X-Mailer: git-send-email 2.48.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TLS: YES
X-ENVELOPE-SENDER: dlzhangak@isoftstone.com
X-SOURCE-IP: 221.226.109.28 unknown Wed, 04 Nov 2026 10:36:51 +0800
X-FangMail-Miltered: at fangwg01 with ID 6AEA9A43.000 by FangMail milter!
X-FangMail-Envelope: 1793759811/4jK8hz217Jz22V1/6AEA9A43.000/221.226.109.28/[221.226.109.28]/ldzh../<dlzhangak@isoftstone.com>
X-FangMail-Bounce-Flag: 1793759811.6AEA9A43.000
X-FangMail-Outinfo: 1793759811/6AEA9A43.000/4jK8hz217Jz22V1/dlzhangak@isoftstone.com/1
X-CLEAN: YES
Message-Id: <1793759814.6AEA9A43.000.4jK8hz217Jz22V1@fangwg01>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AEA9A43.000/4jK8hz217Jz22V1

vidtv_s302m_access_unit_init() can return NULL on memory allocation
failure, but vidtv_s302m_alloc_au() does not check for this. When
e->access_units is NULL and the encoder is not synchronized with a video
encoder, vidtv_s302m_encode() unconditionally dereferences
e->access_units, leading to a general protection fault / NULL pointer
dereference.

Change vidtv_s302m_alloc_au() to return an error code on allocation
failure, cleaning up any partially allocated access units, and check its
return value in vidtv_s302m_encode().

Fixes: f90cf6079bf6 ("media: vidtv: add a bridge driver")
Reported-by: syzbot+e9ce4d4ff55ba65e3980@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=e9ce4d4ff55ba65e3980
Signed-off-by: zhangdaolong <dlzhangak@isoftstone.com>
---
 drivers/media/test-drivers/vidtv/vidtv_s302m.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_s302m.c b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
index 3c08e442b2d1..83cac8464a4a 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_s302m.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
@@ -176,7 +176,7 @@ static void vidtv_s302m_access_unit_destroy(struct vidtv_encoder *e)
 	e->access_units = NULL;
 }
 
-static void vidtv_s302m_alloc_au(struct vidtv_encoder *e)
+static int vidtv_s302m_alloc_au(struct vidtv_encoder *e)
 {
 	struct vidtv_access_unit *sync_au = NULL;
 	struct vidtv_access_unit *temp = NULL;
@@ -186,16 +186,25 @@ static void vidtv_s302m_alloc_au(struct vidtv_encoder *e)
 
 		while (sync_au) {
 			temp = vidtv_s302m_access_unit_init(e->access_units);
+			if (!temp) {
+				vidtv_s302m_access_unit_destroy(e);
+				return -ENOMEM;
+			}
+
 			if (!e->access_units)
 				e->access_units = temp;
 
 			sync_au = sync_au->next;
 		}
 
-		return;
+		return 0;
 	}
 
 	e->access_units = vidtv_s302m_access_unit_init(NULL);
+	if (!e->access_units)
+		return -ENOMEM;
+
+	return 0;
 }
 
 static void
@@ -405,7 +414,8 @@ static void *vidtv_s302m_encode(struct vidtv_encoder *e)
 	 */
 
 	vidtv_s302m_access_unit_destroy(e);
-	vidtv_s302m_alloc_au(e);
+	if (vidtv_s302m_alloc_au(e))
+		return NULL;
 
 	if (e->sync && e->sync->is_video_encoder) {
 		vidtv_s302m_compute_sample_count_from_video(e);
-- 
2.48.1

