Received: from out28-76.mail.aliyun.com (out28-76.mail.aliyun.com [115.124.28.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610173822AB;
	Fri, 18 Sep 2026 03:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789701882; cv=none; b=grEtKjYXUOP/hDJnIyDHlw4cRQSzoJOLdS/5HsWfGrO27MmKe6hjKZ9eE7QSfFmefxeNko3wIk3c5mPDPd1iVHzmoKMwVJ5ZUmyMKQFxqurXibZU5UzIVYHgyQ/Q6oatOk2vazMrnD/KVZwU85hgU0VRwScU1OCUQN+nJ84ABjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789701882; c=relaxed/simple;
	bh=tIizFypCeJZYwYT6qcObvyRCdfGYi2RxQcEnBOY/wjU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RB+mdW8CHzY+bqphSrqWy+yLMxhOQC1v8O2ZSqvdZu5M7L/yK6UcJPF24IIZoQXXiJQOVEWBuyU0kVL5D7W+dGn/74wJQQnRO45Hyie4278iR13GaWdHVvgQN4BVLaFJ68Y/XtjxckZDR/zDu2VTlp+dqlt6lsSbUnAX7nvA854=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com; spf=pass smtp.mailfrom=xiaopeng.com; dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b=b6ped7FA; arc=none smtp.client-ip=115.124.28.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b="b6ped7FA"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1789701869; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=TyY1ipN78mPcuxrnHrvagacAsTo5jwWIKhXRPs1+jG8=;
	b=b6ped7FABVgjj5RK0Sqga+XDU0fu3XnWy1I6Mn3N2W+yhQjxBsRmduPzVVzemgwq5CLqf50UMoWfFZqrx82Z9dAk6K9U1EneDkRxPHxZ9iKux84TpLwh+JL+yJ6N1UVp9gaYJnu8MzOBNMz5Ua3o/MpF0RfbDDPyoO0N+Pka23k=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436685|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0245893-0.00271557-0.972695;FP=11238856706199416049|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033032062159;MF=guozh23@xiaopeng.com;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.jGKsNgn_1789701868;
Received: from localhost(mailfrom:guozh23@xiaopeng.com fp:SMTPD_---.jGKsNgn_1789701868 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 18 Sep 2026 11:24:28 +0800
From: Guo Zihao <guozh23@xiaopeng.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liu Chao <liuc63@xiaopeng.com>
Subject: [PATCH] media: flexcop-i2c: reject a zero length write message
Date: Fri, 18 Sep 2026 11:24:27 +0800
Message-ID: <20260918032427.803874-1-guozh23@xiaopeng.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

flexcop_master_xfer() passes msgs[i].len - 1 as the transfer length for
a write, because the byte at buf[0] carries the register address and the
payload starts at buf[1]:

        ret = i2c->fc->i2c_request(i2c, FC_WRITE, msgs[i].addr,
                        msgs[i].buf[0], &msgs[i].buf[1],
                        msgs[i].len - 1);

msgs[i].len is __u16, so a zero length write wraps the argument around
to 0xffff. flexcop_i2c_request() takes it as a u16 and copies it into
an int, so the loop

        while (len != 0) {
                bytes_to_transfer = len > 4 ? 4 : len;
                ...
                p += bytes_to_transfer;
                len -= bytes_to_transfer;
        }

then walks 65535 bytes starting at &msgs[i].buf[1], reading past the end
of the userspace provided message, and issues roughly 16384 transfers to
the bus.

The zero length case cannot be handled inside flexcop_i2c_request(),
because the len == 0 branch there is a different operation: with
no_base_addr set it writes start_addr alone and is reached when the
caller passes buf = &addr, len = 0. A zero length write message means
msgs[i].len == 0 and the caller has nothing to send.

Reject it in flexcop_master_xfer() with -EINVAL instead. The else branch
is the only place that does arithmetic on the message length, so nothing
else in the function needs the same guard.

No Fixes tag. The len - 1 argument comes from the b2c2 driver
refactoring in 2add87a95068 (2005) and predates it in the skystar2
driver that was imported with the initial git history.

Reviewed-by: Liu Chao <liuc63@xiaopeng.com>
Signed-off-by: Guo Zihao <guozh23@xiaopeng.com>
---
A zero length write reaches this code from /dev/i2c-N: the i2c core only
rejects it when the adapter sets I2C_AQ_NO_ZERO_LEN_WRITE, and
flexcop-i2c.c does not set it. The same sequence in i2c-core-base.c
guards I2C_AQ_NO_ZERO_LEN_READ for reads.

The read path one line above is not affected: it forwards
msgs[i+1].len without arithmetic, so a zero length read stays zero.

 drivers/media/common/b2c2/flexcop-i2c.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/common/b2c2/flexcop-i2c.c b/drivers/media/common/b2c2/flexcop-i2c.c
index 21edf870d..6171f7a2d 100644
--- a/drivers/media/common/b2c2/flexcop-i2c.c
+++ b/drivers/media/common/b2c2/flexcop-i2c.c
@@ -187,10 +187,16 @@ static int flexcop_master_xfer(struct i2c_adapter *i2c_adap,
 					msgs[i].buf[0], msgs[i+1].buf,
 					msgs[i+1].len);
 			i++; /* skip the following message */
-		} else /* writing */
+		} else { /* writing */
+			if (msgs[i].len == 0) {
+				deb_i2c("zero-length write message");
+				ret = -EINVAL;
+				break;
+			}
 			ret = i2c->fc->i2c_request(i2c, FC_WRITE, msgs[i].addr,
 					msgs[i].buf[0], &msgs[i].buf[1],
 					msgs[i].len - 1);
+		}
 		if (ret < 0) {
 			deb_i2c("i2c master_xfer failed");
 			break;
-- 
2.50.1

