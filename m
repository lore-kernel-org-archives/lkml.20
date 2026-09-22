Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68190340400
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790045662; cv=none; b=JZn/p8TPhdebK6PU4uzzC6gALsSNWrBPrndHEtfoqddwtSGlTUegCXkSHV4OqGIo2/KuZHImIJPyqAJjtS1/IVNHN2ucw1GWgsGzWUWVbZJyg/X2vm18dqcNgLuhg/nQldBWojLw2ChsodbpPE4fKbNcl2E2Ac804YyOLDY6Ti8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790045662; c=relaxed/simple;
	bh=Rd/lOuuBE1fe+JFuRG2/9O0X8Yb9sAGg8AsM4evfW18=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hCkayQ2BdjgiQxBQH7mzpvFCa8sstcCoopeJih5WY2AVVTi+tASrTZHXHhto3hgSUxKqdcvFkRAPN7nPtQxx8P5xKd4VaZIeWIPPOm3XmKD31wkZDSCJvZm16oxTA+yXewDzQDvmm1Ubeknbrjo8a12jr8/J5E6yJi6635Y0wo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=rlReKUca; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=beJrSqq3; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="rlReKUca";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="beJrSqq3"
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M2X0OA852509
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:54:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=o6sz
	vYxzTXRH/nN6ZyC8xHzMIfsKFkaFTiMpK6Zrzos=; b=rlReKUcaU6aGKSA/655I
	zk0AODFqSgU14BhrtVvlJJwRFerd0a1kuvy6ACpotM1KvCo8woFOl2wA7U98Mjp+
	iahxTociNoNlhpYzgs6Gcn4AQZhz9ByXjqHh/cJDIroc3GvBA4faXiR2JPRdq5X+
	d5z4k8aYhqxgHS5ZrAsUobKTLv/5ImSn+ReSajzrj1NRLeleTPHBh4sd1hDqjd0J
	OlmAFT8WL2C1Q0M5bU6LE4J1IzMvpCjbtgP7RnY1CyNctM5MunMoR9R0y37i0DK9
	VQTHhxn2WLpp4xUcpEtr88JATLGjZsvnysQgwi7qoNvZCvfd/zPLc9uTB8BIWvBV
	PQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4guf3vrkjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:54:19 -0400 (EDT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-532c2cac078so26108101cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1790045658; x=1790650458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o6szvYxzTXRH/nN6ZyC8xHzMIfsKFkaFTiMpK6Zrzos=;
        b=beJrSqq3XWnhhrDGtNvwSw4sWsBsjgeDHTJv3G8fqOsiIlJaqU0kNyOV9BO89N3JYS
         r9zg9XqBIWHDZu/rf0mGvD1K1Hcd68DEDUiIQsvYs3l8WTMqfzGaFgybIT3ckHVxEsnl
         KioI5C2OMi2XOdGV40wMrVMqA/2QPbGTWYGfQn9zD29b0phgKUCVTvdirpfsk427UlwP
         RRzXfHLbKxG5Liqj0m2vd0RPNAapIFNtTe03grU0mJUOBQG1i7HPn4A56zrlMJnN8hre
         U5N+2VsnyTJ6Y7Z/X5wRwPOvrtnm4McK4Hyh4nMpHBompWTq1PWjvFjyunUvjg6MpF6+
         1FWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790045658; x=1790650458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o6szvYxzTXRH/nN6ZyC8xHzMIfsKFkaFTiMpK6Zrzos=;
        b=diuEzzP7KPx+KNTZ+F1V38fiG4LuYkVJAtdMvbY/k9TZ/evxUTZ55NOVKg53UGr7CN
         iLjvpwdqEPKLRJ0Ml1uFNgQylS23wfAsIfVO0cEGFAxynqaROFZTwl/7zc/tumi+PcyW
         Qa6ts31KS4Wp3OPRjji9jy0p0HUpWi9iTZSJ+BV1mFZdWA1/UGwRL5OM2GPflmTH4HTJ
         5VrDXCKZ+l5dI5RUgIGow7JtEIQiQpRjj5fRymEhtNuSl+9m/viIrTQXdQ1+NzM3VCIg
         jt3zISthPcJRqqyLzA/Q/ui91MFH7HJL9G0CMlLoftMkeDImuF0LEcLHyYr1WFv8ZhNl
         Aa1g==
X-Forwarded-Encrypted: i=1; AKwUvBzJnbLg1CobdJQT0DSJtN82Dpf/bQETkPRNStDLC2+gI4HpT5CTl3U3LASpsXF9AGGh0Ls6p32AFXLbJOs=@vger.kernel.org
X-Gm-Message-State: AFuF++ni47oB9vrZvEqWz/QTQpfREKvAKBaoeCDkTXFA/6PqV9KNVkM/
	y12v//UCmM6OOgZp1ijVDnT1eF2GYHJ/SQM0qyVTg4gP8U2+PXXs2YPbqzPFxaT5mR/o0uUyphj
	vYKt4W/Xz3B/r/fwKcmmH+gmM0ckhLHhkVYOFD6r7bdCOyck1+oPik1OdWcbZrA==
X-Gm-Gg: AYBFou1ulgY1h2FTIsDOACIcJRFt8yjW/OUe6e+QSoRlRgwgksDn0OAtK2OAhEZqUJa
	sdZaSJZIbmiZ0gqdqPsRkH5G2tzJuUJdF4taCDkb9mGOLfIYKC8twPhTkExUSc7Kcg/JRheztFk
	04FXz8/YLO+AS7rLd+OeyqH8ry6OMhC6fFvBzO/FrKRPHs2+aZlx6R+QRJlFjBBCeJfgmojHHjt
	RGyXtctfkUP9r+PPrTyKmWSDKeQO7gZ3PjHkK1rQJz3p/lIWTFKbr0yfT1/s5oNxiQ3Y7p8FIv8
	qjS0DPCHWxZ5UdehdM9SGHJONDNwh4LiIGg0aDHhgA9KXDwzt5nPZk/rOpru4N939U5tyLAUpeA
	dqNaJA8LgF1i4ZSGe7gHUIKM2xW3On+jy50iseKYKJtW0
X-Received: by 2002:a05:622a:4105:b0:532:18a0:492c with SMTP id d75a77b69052e-532d8cf03c1mr39374491cf.14.1790045658626;
        Mon, 21 Sep 2026 19:54:18 -0700 (PDT)
X-Received: by 2002:a05:622a:4105:b0:532:18a0:492c with SMTP id d75a77b69052e-532d8cf03c1mr39373721cf.14.1790045657344;
        Mon, 21 Sep 2026 19:54:17 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532e18fce9fsm2048421cf.15.2026.09.21.19.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:54:16 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 21 Sep 2026 22:54:03 -0400
Subject: [PATCH v4 6/8] block: don't fall back to buffered I/O for atomic
 writes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-blkdev-fixes-v4-6-e2801f71ede9@columbia.edu>
References: <20260921-blkdev-fixes-v4-0-e2801f71ede9@columbia.edu>
In-Reply-To: <20260921-blkdev-fixes-v4-0-e2801f71ede9@columbia.edu>
To: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Hannes Reinecke <hare@kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        John Garry <john.garry@linux.dev>,
        Christian Brauner <brauner@kernel.org>,
        "Darrick J. Wong" <djwong@kernel.org>, Keith Busch <kbusch@kernel.org>,
        "Martin K. Petersen" <mkp@kernel.org>
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790045650; l=1679;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=Rd/lOuuBE1fe+JFuRG2/9O0X8Yb9sAGg8AsM4evfW18=;
 b=1dWllPo3jLt9esInUtwSLHG5wFx+G8i6GuB4B2qyjpBYRHbZBBbovT0TkA3lP8HjZrFVFvAAJ
 cr2W9fFn1YJCFRQN9D+wC6CR7b/KghRoSP0xBcaShXpXvMHlBfrOXQs
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: 0CI1YSaVrylW2h0fiDlpbD7yCSBPzMMG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDAzNyBTYWx0ZWRfXzfY2nvggAupA
 /JxwW9abpsTK90dUpKGKFBsMsd1yHppHWrkuFbFXNSn9ohHICiXp2kyq8d6cND4RE56z5x+LW5u
 ovngsWLcSoeIijIg/urrJloWUV0URqyfv4DA8cycnR7oZgFi5Z2S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDAzNyBTYWx0ZWRfX0zu7g5tSiFHi
 au0MqAx+JMNlg+Y2PJb9uqdPXrDkxHv5RtxUDW4hZEgeQQqlyeSnKDwJXPKkbLJ2m4G12g0zz3X
 pKNXIL2IIGchpFl8/3+VpcfyvAKhDtkDHWT+9aDL7uiq6q3Sd6BhnS0lbfrX8+8+bc4G3AIYmoi
 KRn8bbn6ReZ4HNy8jN0QIUdqqGOaVPzdeq3Bn5ZJv/OECPCtJjcoq7l9Is257+wtLNwNcvhIsLo
 cTQYL3hvJtWUlh0RlOoo6RxYT4HBC320nlOQ7HqnkkEC9stkT1mmZYiIyRZA2q0BoEBQBEKQAvx
 /yORH7MrmbpIOVpIakR5uBCByI0Ab6aPccZNIjYtaFS1p4N1JK3FkSkohOZStZZa5oTV3mbbhgO
 5O2/Y2ogA4lb2TnpXwTRGVMoSEwbPNarL4tcRiqePiVI/4psT0Wp+jplWxWIfpCWhsp6CABD14J
 7j0Jwybm9KS/6xbQcTA==
X-Authority-Analysis: v=2.4 cv=U/UHnuru c=1 sm=1 tr=0 ts=6ab1eddb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=s8mzj7eOnaliLhoSWqYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: 0CI1YSaVrylW2h0fiDlpbD7yCSBPzMMG
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11912
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 lowpriorityscore=10
 impostorscore=10 bulkscore=10 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609220037

blkdev_direct_write() turns an -EBUSY from page cache invalidation into
a 0 return, so an IOCB_ATOMIC write is retried in full through
blkdev_buffered_write(), with no atomicity guarantee.

Skip the buffered fallback in blkdev_write_iter() for IOCB_ATOMIC, as
it already does for IOCB_NOWAIT, so the -EBUSY case returns -EAGAIN and
the caller retries, matching __iomap_dio_rw().

ext4 has the same fallback and only warns in it. For block devices the
fallback can be skipped before any I/O is submitted, so fail early
instead.

Fixes: caf336f81b3a ("block: Add fops atomic write support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260802-blkdev-fixes-v1-0-a82fc549fd74%40columbia.edu?part=2
Assisted-by: Claude:claude-fable-5
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 block/fops.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/block/fops.c b/block/fops.c
index 90777e8a9a6c..7f23778f6b81 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -766,10 +766,11 @@ static ssize_t blkdev_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	if (iocb->ki_flags & IOCB_DIRECT) {
 		ret = blkdev_direct_write(iocb, from);
 		if (ret >= 0 && iov_iter_count(from)) {
-			if (iocb->ki_flags & IOCB_NOWAIT) {
+			if (iocb->ki_flags & (IOCB_NOWAIT | IOCB_ATOMIC)) {
 				/*
 				 * The buffered fallback blocks on i_rwsem and
-				 * on writeback of the data it copied: return
+				 * on writeback of the data it copied, and
+				 * can't provide torn-write protection: return
 				 * the short direct write instead and let the
 				 * caller retry.
 				 */

-- 
2.39.5

