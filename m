Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794449865;
	b=YWp3nWsqIdUIDZzclPwl0WS2iiVWkQJXH7ouVYgBKlbcVn0+smz0JYxQPOA9dHDy9c9Q
	 BSSyzDNRiokZnbzooSKILMdKlL9FieBnnG2y9VfZE8wEOpwL3GgLD2MQGEa1bIxkt8poB
	 GsJ4GIkMxFprDOvCUwTlVbon4wxOZx3kUPocAbn7dJAfWF6RtW/WSqOY5WLspbpbI4J4H
	 aQcqdS/0fuGdNvjCE/rOnQpP5vH2ydSYsPyfBR+qDQHFqFLbTWTaJNAPhQTFVAQ+wvDqB
	 KkxEn4EXZDHszQD6HnvMTMof1E7D2hhXntbg+CCpqnkocTm3fnSKRbpvJaRwyO9aDXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794449865;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eNrLn59jam5c0VemG10EqIofE4QIArLNVGP54AO69YQ=;
	b=VTbCt4OUS/48gINJLswJIib/T+NsW0kicYbPLY2ipCGyvM1DfA4fTEAxt1GxR0R6JmRK
	 1mBn/G3Pe3AOMioAeVTEf9e9Hn4ld3ODwZINWcJNrk3EQyu0LwFr8V0xD3HONkbax2XIl
	 xd969Lq/MBYNjTgWc6Or0QCBZooYxEFsk/6anUm0IloWG92cRGziXY7DngtyJ+fu3Lo/u
	 749Tk45FcvsY1+yTTwj2MxRrULA7Kvz4ypQB4APwfk4dQ3IPGcofzNvvmiL0IDmv5tWQi
	 jNC5qsCtZbFTFLFtTdlaqIzoGfmyjaOwdMwCa7v8kyT7SrM2rZo/L7YSuzotBw6q5Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=oQjPat0A;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4583D606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4583D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=oQjPat0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=oQjPat0AWV/TassFgdImPbiZIgPkf+m5NZ+FFEZ27MHZ5gb0t5G0EjgBmoyVVYzVoOY51DQORErtT
	 rLaG8k0XgvbEEMfk+18XdZQmgVPRin9ROmHnKu0V9S/pUgExhcI2BivkixyBLWaHkYTQKCxE/Xz90M
	 WR8X6vpVjU4ea6u8=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86af521c61d2-7c435;
	Thu, 12 Nov 2026 10:17:42 +0800 (CST)
X-RM-TRANSID:2ee86af521c61d2-7c435
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86af521c44cb-ee7e0;
	Thu, 12 Nov 2026 10:17:42 +0800 (CST)
X-RM-TRANSID:2ee86af521c44cb-ee7e0
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: suzuki.poulose@arm.com
Cc: mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH] coresight: Fix fwnode leak on failed connection add in ACPI path
Date: Thu, 12 Nov 2026 10:17:41 +0800
Message-ID: <20261112021741.1803-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
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

In acpi_coresight_parse_graph(), acpi_coresight_parse_link() takes a
reference on the remote device's fwnode and stores it in
conn->dest_fwnode.  If coresight_add_out_conn() then fails, the
ACPI graph parser jumps to the free label without dropping that
reference.  The failed connection never enters the platform data,
so nothing ever releases it and the reference is leaked for every
failed link.

The OF path in the same file already releases the reference on the
same error path, so add the missing fwnode_handle_put() to the ACPI
path as well.

Fixes: 3d4ff657e454 ("coresight: Dynamically add connections")
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
---
 drivers/hwtracing/coresight/coresight-platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 93c2d075c..6b7a87680 100644
--- a/drivers/hwtracing/coresight/coresight-platform.c
+++ b/drivers/hwtracing/coresight/coresight-platform.c
@@ -718,6 +718,7 @@ static int acpi_coresight_parse_graph(struct device *dev,
 		if (dir == ACPI_CORESIGHT_LINK_MASTER) {
 			new_conn = coresight_add_out_conn(dev, pdata, &conn);
 			if (IS_ERR(new_conn)) {
+				fwnode_handle_put(conn.dest_fwnode);
 				ret = PTR_ERR(new_conn);
 				goto free;
 			}
-- 
2.50.1.windows.1



