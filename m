Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA204DC557;
	Thu, 17 Sep 2026 15:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789660356; cv=none; b=MjXeoCTZfXq6qoGV+0oBK2dd3ogtBfQICKPo3sjMHBUn1aDxc+ypJozIsR1d7QQiPmJcADIQSH6x8owZ/yE6beak5YxGgEhgNhfuBnQUbPkiQ5qyvCxRW5pDMXA/30BwouKaRB5LZTYMZxynayHw8cptj0V+LzLmGgqc13YZmUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789660356; c=relaxed/simple;
	bh=St9pZs9VJ0+ANsFUdpwr9oNDHPZBqi1nYt0una1XOdM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PApiGWTmU4mt9Zax5+OnIVnvvdZgutDDDgOytFkccchmjySZuvbGmcsu/1nUPQ9sh8P9WhB4qUpuXevPqYzpJLfLNfXx6fCjya4RrQW43SdUEgane0lj3wmTddXgeYXdC3TqK0a7+V8SoMOpClK2ElCqySjFZ3a3xf4+eMS62ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowADHMTy_DKxq2+WDCA--.6131S2;
	Thu, 17 Sep 2026 23:52:31 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: YehezkelShB@gmail.com
Cc: andreas.noever@gmail.com,
	duoming@zju.edu.cn,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	westeri@kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH] thunderbolt: Fix tunnel reference leak in tb_dp_dprx_start()
Date: Thu, 17 Sep 2026 15:52:31 +0000
Message-Id: <20260917155231.2161107-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowADHMTy_DKxq2+WDCA--.6131S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur13XFWUJr1fWr4fZF45Awb_yoW8WFy5pw
	45G3yjyr98KFWFyFZFqw4UuFyak39ayay5JrZrGan5Aw1Fq343Jay5GrW8Zr45ArWkJw12
	yr1rtrW3GrWqyrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUB0b7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4j6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWxJr0_GcWlOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq62Iq12xI8VA0II8E6IAqYI8I648v4I1lc7Cj
	xVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8GFyrJr
	1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4UJVWxJr1lIxAIcVC2z280aVCY1x
	0267AKxVW0oVCq3bIYCTnIWIevJa73UjIFyTuYvjxUF_MaUUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAINA2qr9nA1YAAAsS

The extra tunnel reference taken to keep the tunnel around while
tunnel->dprx_work is pending is only dropped in tb_dp_dprx_stop() when
cancel_delayed_work() reports that it canceled a pending work. For
tunnels created by tb_tunnel_discover_dp() there is no callback, so no
work is queued and that condition is never true, leaking the reference
on every activation.

Only take the reference when the delayed work is actually queued.

Fixes: 67600ccfc4f3 ("thunderbolt: Fix use-after-free in tb_dp_dprx_work")
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/thunderbolt/tunnel.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index f38f7753b6e4..696a7e06d940 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -1078,15 +1078,16 @@ static void tb_dp_dprx_work(struct work_struct *work)
 
 static int tb_dp_dprx_start(struct tb_tunnel *tunnel)
 {
-	/*
-	 * Bump up the reference to keep the tunnel around. It will be
-	 * dropped in tb_dp_dprx_stop() once the tunnel is deactivated.
-	 */
-	tb_tunnel_get(tunnel);
-
 	tunnel->dprx_started = true;
 
 	if (tunnel->callback) {
+		/*
+		 * Bump up the reference to keep the tunnel around while
+		 * the delayed work is pending. It is dropped either in
+		 * tb_dp_dprx_stop() when the work was canceled, or by the
+		 * work itself.
+		 */
+		tb_tunnel_get(tunnel);
 		tunnel->dprx_timeout = dprx_timeout_to_ktime(dprx_timeout);
 		queue_delayed_work(tunnel->tb->wq, &tunnel->dprx_work, 0);
 		return -EINPROGRESS;
-- 
2.34.1

