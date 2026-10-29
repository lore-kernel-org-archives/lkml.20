Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.59.177.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793246328;
	b=oS7elJgAdmxxwwxV1Qbr0JcSPML4SILvodcn1yIwNps3jRH6fYog6Fq3RxA4AMlXhLn5
	 Ee5JM/DjFz2wymmFTFdnMTucG844qk5gRiQcKHF/Q9I1e96IcwgZwGd3Euq30YFX25cNZ
	 8J5fHie1zYme8nn8y6Q3gf6beQizTwJbUfpSpwYsRt+iApMOj9as1wtTibSSAD1JuDc2m
	 ZVfg4LMUiJ0n8Bs1IzJTC0ZEHaSefCTqnjn+3BlfzunxSZNWnFNQiDCrolPkCRrGrjhJT
	 GyYcM3G6a+9+/xlIWjIkvmwroRV9+wxRkX628rczzx/uyaldQW+cNkrtOdiv2v15fVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793246328;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=DJZpl59cJtp1p4y0v6aKsk3gCDFa8O+6KMUjJ8oAZiA=;
	b=2TUiuwVPmW75w8OE2e0JcNR08KX7qOfB/ZxQJle9OTSZztmb5o7YzGlFuIYq+B5wY9Lk
	 CS4uyNUCmLJ+n7iBR332CpZKQbIr3BtczwxRdZk/CbFHqj31Z/v0k5Rq/9RW1g9dZHCYo
	 hCAWBuwHPxaFU5a23P4UlQt9EjQ/mxKEWnP1Z3t3NWLlGBKoInRaTKkYG4/Hkf2m6W3QK
	 g1EkJGUPEZI2e5Mrw+da4tUFprJR0DnOqlDu3fEmxniNajIgNcHI4nAiJI6XhWjYoTMk2
	 m2LwFphDVqaqO/+5xuf502qr6BXcBs1OzIO/okBegaukvwWneH5jIqCi71P5sgHiVBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=radxa.com;
	spf=pass smtp.mailfrom=radxa.com;
	arc=none smtp.remote-ip=52.59.177.22
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4E760A2607;
	Thu, 29 Oct 2026 03:58:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA4E760A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip2t1793246304t005ba238
X-QQ-Originating-IP: FkErso0NFxfuXEZcbLVkMaMvSJ4GntrL66mINmaJ5vY=
Received: from [192.168.30.244] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Oct 2026 11:58:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7970526447326229405
EX-QQ-RecipientCnt: 17
From: Xilin Wu <sophon@radxa.com>
Date: Thu, 29 Oct 2026 11:58:09 +0800
Subject: [PATCH 4/5] media: iris: Preserve timestamps on error buffers
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-iris-va-fixes-v1-4-44a2783f782b@radxa.com>
References: <20261029-iris-va-fixes-v1-0-44a2783f782b@radxa.com>
In-Reply-To: <20261029-iris-va-fixes-v1-0-44a2783f782b@radxa.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 dragon@radxa.com, Chris Obbard <chris.obbard@oss.qualcomm.com>, 
 Deepak Sikri <sikrid@qti.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Loic Minier <loic.minier@oss.qualcomm.com>, 
 Jason Pettit <jason.pettit@oss.qualcomm.com>, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=sophon@radxa.com;
 h=from:subject:message-id; bh=jwcZGZwdpb/2rlMI0dYb/XJOnaXddwYu73i5FYa2O6w=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFmPjgTNab65YusSfo7ch3wHTmRL32J5dKz3X5DZgs0mB
 yPim17LdZSyMIhxMciKKbIoxDPMZa/MvfZUrFQPZg4rE8gQBi5OAZhIbR7D/3S5R5umd8z90nw2
 YVatSKdj7X9m3+rmr1VcD1TuZLXVyzEyfDtwPd7mbunt8oKVugUpXAdqToaGrV0XEnXPJDZnY+F
 JXgA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MiKCDQn4b3+YeVoDRz5Dr1Ma6tegqZxzVIUfLkHUwViUKNzLu8/MWYyv
	i7hL6cdiqcXxSVU5L6Leeo8ExOqcBNwUpN3gSjUlto2XCC18Nuf/RYUltE73Ul++I27wEaT
	vB/cdIZOiNDvPqqlTkUjW/tQXodiGzBCWM5csDhwDJeDLyjhn1rKbc7iNCEvQANRyaSbChF
	7RYC+1QqyBlhYJ8p3b7RtipqI5HgS/CCzA0mG+cttS7pFvfmtQVBlaglXSy7JSx+s4PVeKw
	8HTiQC5tKGXbJE2PMlL6mc03yEmtnJTZBK7C0+nPeMXmu/XsVeyUK6mlPQl3ACzwIjIqVy+
	6Ean0Ve96cPLfDASQ3sqtaJJbqWew2ZBKN2Dv7Kqh6t97mXWHdHX7OOkd2A7cMKoGKinDYI
	fCh1K4du6SL9s5q33Mpw8YndU5jEyLBSKSgQbERchAGyPFlPsfITDrlLXze8SUA7sf+9w59
	5U9ClH+tqlEHBfsUrg1vivgyopGQs/9TJ7k8sahqyHmkHtfbix/GrS9OVvsGHFLgwY8zKMV
	yt7VKHTO4Ch4wqkd6bT2Mn6pLeK0MfVP/QW2WSrsk9FoKC9cj+rCaE0vShE94FN8YC2kLR+
	lAevtrU5FOAxfQT+kppByeSIGqTqADCbqYnYicOiQgoK2WOJt4BjS5/lOC6fmmMrmKqQCGz
	aFmtHYvRnIkJBztChI8T8/lnaeRELeKWJXfv4C6hLm85Mc57SR4eSde+aGAMb7ztyNptrVl
	0M6Z7F6WVnx/bSgkfqXrKHaeOL/wSFtWXlJDArK34E+8osW3MUbRnxH/6Ze6mO1+WnR6qb5
	G8HuyX9ywLhCDi6men1RaAMqjjo+ia1w/Ri+AhHoHXCHpHgL8Tv5p82C5Yf5oXHHtb/u2+n
	lYO0M/BPbnTtp5XsVGCbPGtQmRL3jae6UVUttMdu6WkR3NbldiNT5h8WR4xZOlk4b/0n+xc
	J3qvi92EqPztP1LsIYeKOVB9XcXhbC+YD9xq5C+mDPnN7cT/BUyQOBuHX851en9vpzeaZAA
	ZD0Bp+H4N79UwNDZEVaGr2ST3htD1xjxsWJ41WgWXJ2Ko5uimeUeVDdEyzdjz4oU6tV81jF
	g==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

Clearing timestamps on error buffers prevents clients such as libva-v4l2
from identifying the failed picture and can cause synchronization timeouts.

Preserve the firmware-provided timestamp when returning an error buffer.

Fixes: b791dcfcba3a ("media: iris: Add handling for corrupt and drop frames")
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index eb8de60c1177..f790483d13d4 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -899,7 +899,8 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
 	if (buf->flags & V4L2_BUF_FLAG_ERROR) {
 		state = VB2_BUF_STATE_ERROR;
 		vb2_set_plane_payload(vb2, 0, 0);
-		vb2->timestamp = 0;
+		/* Allow userspace to associate the error with the input frame. */
+		vb2->timestamp = buf->timestamp;
 		v4l2_m2m_buf_done(vbuf, state);
 		return 0;
 	}

-- 
2.56.0

