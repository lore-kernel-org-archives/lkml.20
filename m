Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1174CF47B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792177888; cv=none; b=D4+HgcEGB4JqeNMdfP3KebeNPzaTNzcAYyOvp8YJ8879KP5eX3KL1FsBvtVj2HE+XZ7AFdOfJpezVP8FUESF3kencHwxtrGXX/t6N+RB+wAB4v2kJ/dLB8bTzMaG/DvIyeSCPpURlYBQFut8ukRcEKJdZVU1A4SVUw5kXvW10zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792177888; c=relaxed/simple;
	bh=nDIdtsCuMVXU3GquABIfjO3wcSwZRZ5I7/ij7MqIM8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ok3QIXKAjPMQSgXX3UfMeY6WiSXcwfnLoDMCctMXy9hbDsdKX4WhOMCftqfwGQxrRCdwfeRBsjQKKFC5XBBuuhm2kc85hNyjPLB17ci6jXa42SslPbBGFjad7RLTG5Yr8pEmL3THzlZ1E2wcbeaHVyK628wAFA8rxNyPXcO3d+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=m294qtaQ; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=dm/CCtoP; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="m294qtaQ";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="dm/CCtoP"
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GIc2CI872500
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:11:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=z1PE
	0307Akf9zgigB6zaioTQsjGQasVZfGnAbLPrtbc=; b=m294qtaQreGvJxTSlTuI
	vKz+37b2p48iCYANBzc4rcxdjVqbFgGXNUmGFzBfLgI7VhCIrCh/px89J18N+RZV
	S/vKJ5H+alc1a+8NJVo1Xhrhpb4PlcZkdMuOV7l15ZH2feT+dtwYg9VuSEU30/yg
	6h0O76CPvcaiFfkEPGv9b6iCSbn7TX7TychWM0JJHrP46Q+t5b2zb5MAXqOnHM5k
	QVe+xIYuU9Lmskz8ojHQhhILaF+/1kiwTtrpjpeOgbcSisGVVl1uvSYH7SHQWdGx
	7ku+7gyULyZMQ7ygaUUYOCGgsV03hUnMHioXmOvYP6rVzTzcD/Avji9NRWM9ZhfY
	JQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hbhuavcq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:11:25 -0400 (EDT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917b7dd3f1dso6021816d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792177885; x=1792782685; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z1PE0307Akf9zgigB6zaioTQsjGQasVZfGnAbLPrtbc=;
        b=dm/CCtoPzbMzWWSU95xecO+FtBRnDgcpi+lPfuZwuCy6rhdxbaFZ4iPKKvWABcCngp
         ppxlEdjLv3GJihbJ++k/m285u66hLi/h+cXez6llhO704LwLW4SgGvO2WIorU8+MTC7C
         vOGp/lWmTzMj7hLT66p1jV5SYk9V/1x1jXxRMjH8BvZJdcGcg9q8YeVFspGf19DB9FoB
         53QJHTGvghIl5z0xGVvvv7NLGGuuzvBqpVFlarPI9Dbw0at9qRjlNBh5+0NR77Yr5XFi
         cLUpA5ft6TvhAOCAn9YEzW0qYVH2B6FbqZMtS5tcZuDSd9xBPQRlStEJeu2Csq9fyxI/
         +Zvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792177885; x=1792782685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z1PE0307Akf9zgigB6zaioTQsjGQasVZfGnAbLPrtbc=;
        b=fIcDUycdu36/YPWWbUTJX7OGjex1hDfQshpI3Az8p5p7SI2jTv2p66iyp0ExvJB/jq
         +L8Cm9r2sU6G6QCZMv5akH90E3AKVlONcMGLZq9mouUN8xVYsRbfUuu1sy9EGeAKx+ZS
         r5+QO8seyTHTAeKzUeTqDty27gFQM2h9HfEwHQDANqkpwa+UeNjvgjTXufirVFJUPNr3
         4mTr+IPyrAbvBWvsCnfXka0H8o3MwiQJznQqrIP2MuiDX+Wp/Im9LE2Q15rvUA1kR7rT
         ikJNjNf77UsmWF0CENyJ7ViYeapGGpIPCCBmUdkBYkWbleFmZcPkNUyW6Q42WR6RWYwV
         IGow==
X-Forwarded-Encrypted: i=1; AKwUvByEwJO2fQOmvmpyAthFsKLP0rJoSBVmtLCu17XuPsTLeuF90RIbSlHo/fEHi6RJYzQswYRGyCDpHa/ioZw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIS0A8bCkm8Eo8lSU2cbhUVVZAc3lgwrQsNitLKshD7rPYVJZDp
	WpOsNBk/nAnSJ6D91ZJ2iW4bFIkh5IKw/wEJMO2CjBqPRicBqUJcvr8gppEKs5QoBkSA1asKDeP
	X6vmw2L1VNCZdZcSa8txf1yscA+Mv95z0pShx+WB4u01YgPZe7Tf0SgfomuuHoA==
X-Gm-Gg: AYBFou16TzpuMRoF4LG/oseRhhej6+BHDA9vNCZHGuLBh7qaxKCi7EIoHoFwUgXGPTb
	q2vm4V5mPo0v+RSAFTjVQXpR67Gw5QBWf2MKA0yLCmJFXJmbGdtKlposu8I1Cy2a57wGWJNTNwx
	Q9vaBixwgoL6jWiHAQMMvLW23O494/sBgC2Dl3UFy+4grrfFhlIG6vPRJo343zQlaYcEKtownOW
	cjstG/IBjj4MhTzKyPlzFNz9TWDdajCSbzDVP0F06B+6ecU1hCvZyBOgGRznA0gMLBT/1rdIQ1/
	v9aJy0cPnQcSJf0TR4CHc/QylYr13JzQ/p7oayzyjtB57vWXGkc2hMcUyPgUOXr6g9MImCuXBIU
	+mfvpGobK2IZZtrOL02/SzhpAR8HWuCKxVgblZVtCltVYlGw=
X-Received: by 2002:a05:620a:46a1:b0:93e:6709:bc7f with SMTP id af79cd13be357-93f29cc8c11mr146642085a.15.1792177885045;
        Fri, 16 Oct 2026 12:11:25 -0700 (PDT)
X-Received: by 2002:a05:620a:46a1:b0:93e:6709:bc7f with SMTP id af79cd13be357-93f29cc8c11mr146638285a.15.1792177884556;
        Fri, 16 Oct 2026 12:11:24 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-241.net.columbia.edu. [128.59.178.241])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb4f865sm29707776d6.37.2026.10.16.12.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 12:11:23 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Fri, 16 Oct 2026 15:11:07 -0400
Subject: [PATCH v2 1/4] mtd: block2mtd: retry if the page was dropped from
 the page cache
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-block2mtd-folio-v2-1-8280c99e55c0@columbia.edu>
References: <20261016-block2mtd-folio-v2-0-8280c99e55c0@columbia.edu>
In-Reply-To: <20261016-block2mtd-folio-v2-0-8280c99e55c0@columbia.edu>
To: Joern Engel <joern@lazybastard.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792177881; l=2157;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=nDIdtsCuMVXU3GquABIfjO3wcSwZRZ5I7/ij7MqIM8g=;
 b=lGgrJ+GvKY8uGGSteHYmSdbD2jEVf9nl9zZ2AjqleznVwi7Zv6mSIPthqLdNsA8IAS4mEVMHJ
 i1vPqlmfW73AGtTUvuPKUv2Yzi+NZSKrWT4+Z3YQ/y0fpr/kGX3sOlv
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: YORUuc90lluN3irgvjI-2woGM1wBGV3t
X-Authority-Analysis: v=2.4 cv=LbSpeTfi c=1 sm=1 tr=0 ts=6ad276dd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=4lNGE6/ihKpdiDSMgFMHRw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=JGVunZi7BP6-TY2bbWoA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA3NiBTYWx0ZWRfX4LkW7RhlcoJD
 dAepxM7tgEi1afNGN8fnWmbbt0FWDUynyCDOoD5YI3PAQrqbP/wDuXHMmdlvi1OlH0MjsusUYTE
 ANSN4UJlYToxCrKPVbu8vR2ZPNoLoYn7ItvBS88tcRC6XyYSm11i
X-Proofpoint-GUID: YORUuc90lluN3irgvjI-2woGM1wBGV3t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA3NiBTYWx0ZWRfX4eubEMCJngcE
 jt21Wkp5EwY71fbVxvwmJMgGrH54kpBWh1B6A3rEcK8rVfMY2yFVwCoq05YlNsw1oo+FE/klg3W
 6FGmIKryCFuybE2/6n3DSecBORuNeZZoOhc6OLEIWIKic3bit7IeEcfpxFtYBEL6yqPyiNZJf4U
 AIDXu6nsxoWC3CIzC58yz3bIvL6h3wnoBC+SWd2bcO/mYyoD5N+IdeYF2j2t+NpQQ+OCzlkf9oq
 F64wu7nyy8DQZTmEa63KAb6SvUjT/KtatiqVIN/yNKYIwnb01ZE7zA4KmJt17thVPTeMgWwBzcr
 vDzmfTcLIcFyfE8vGdWOjmN8NtB8JL4N/VY7kSf2XHDz/+bZPpqvSjL747MHw2XVbEFYkrSgpna
 dd9kNpGC8XKEY+4F6X1oukv6VCNVgEOvKd+g7fVqSlPclJB8Z0IEHEF/vpb9dA0CmOAjlvkbfu/
 w5DRAYov3tfqDkaQWXw==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11937
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=10 bulkscore=10 lowpriorityscore=10
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160076

_block2mtd_write() and _block2mtd_erase() look a page up, decide it
needs changing, and only then lock it. invalidate_bdev(), from
BLKFLSBUF or device removal, can drop the page from the page cache in
between, since it is clean and unlocked. The write then goes into a
page nothing references and is lost. Check that the page is still in
the mapping after locking it and retry the lookup if not. The page can
be a tail page of a large folio, whose own mapping field holds the
TAIL_MAPPING poison value, so compare the folio's mapping.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 drivers/mtd/devices/block2mtd.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index 03e80b2c4f5a..ca72110b07d6 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -63,6 +63,7 @@ static int _block2mtd_erase(struct block2mtd_dev *dev, loff_t to, size_t len)
 	u_long *max;
 
 	while (pages) {
+retry:
 		page = page_read(mapping, index);
 		if (IS_ERR(page))
 			return PTR_ERR(page);
@@ -71,6 +72,11 @@ static int _block2mtd_erase(struct block2mtd_dev *dev, loff_t to, size_t len)
 		for (p=page_address(page); p<max; p++)
 			if (*p != -1UL) {
 				lock_page(page);
+				if (page_folio(page)->mapping != mapping) {
+					unlock_page(page);
+					put_page(page);
+					goto retry;
+				}
 				memset(page_address(page), 0xff, PAGE_SIZE);
 				set_page_dirty(page);
 				unlock_page(page);
@@ -152,12 +158,18 @@ static int _block2mtd_write(struct block2mtd_dev *dev, const u_char *buf,
 			cpylen = len;			// this page
 		len = len - cpylen;
 
+retry:
 		page = page_read(mapping, index);
 		if (IS_ERR(page))
 			return PTR_ERR(page);
 
 		if (memcmp(page_address(page)+offset, buf, cpylen)) {
 			lock_page(page);
+			if (page_folio(page)->mapping != mapping) {
+				unlock_page(page);
+				put_page(page);
+				goto retry;
+			}
 			memcpy(page_address(page) + offset, buf, cpylen);
 			set_page_dirty(page);
 			unlock_page(page);

-- 
2.39.5

