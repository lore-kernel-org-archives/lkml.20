Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793711877;
	b=qJ+Nbj9MtAOP8GTV/1xgtLC1vZXDGT5C2g9EwJ0J8W2I1f47/CZm+s6uTxrmHRTcPSBL
	 rlhK+eiN+DBQWTxD1+rcopgyW3zljQ66eQe4GZH57TrWXZRHFj++GdqmUlsxvV5erWMC/
	 hpxsCAjvMZUHpv9/ZsLQQmSV9RMbQmOzy7EH79m7JkwG98JFlchUBcEplRL3L2mT5lLWO
	 liDUkkN+4jT7Q3F7a7MsYbijBhMXe0u2qA/msK/trsU7dnNf7KG0vqbidfhJ6HGGpZz0j
	 XraBUXhmnBNTYyS7bt2V8SrRRd9qxqKHeGxNYsVg24Cg0zNt5N3kzBKe8fMIhq9iaWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793711877;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=eXDd895Lrwplt7+NQ9MqaxzvFVwb3SBaY9P7Ikgu9YA=;
	b=zx0/PGfGgAh2hy23+nSi9hwplt7xBejNmJP2vnH+ViXQUEUAXpNvFWkF+ddVXSnSiz3z
	 1b74IXv6ytUcen07mor7tHA5ZJJ2TCJWZD31yFVo9FQoi18+w2Y/zzDlxF7bPFQ/fETLQ
	 wJ+awNWSat4AuNR0uB+LzHBHdhH0mQn+qMamtfGBr+afm/kY2vwRcLIeiSMmb7r2qWVNF
	 C45eAJdhfbjLjjY+26WQw+FOHTG98m+TOFYgmluob0Z07up5lUtcOLPsuhkBKVt5I2TTs
	 wHgToAQwQHfj54JRUn+5QFPfbofkPkRdYtgUhREVpe77rSXku9y07XhWkIaibtRVo7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=BWP5imKv;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b="OTa2SQO/";
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADCB606EEBE
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ADCB606EEBE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=BWP5imKv;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=OTa2SQO/
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A38SGmu4083639
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 08:17:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=eXDd
	895Lrwplt7+NQ9MqaxzvFVwb3SBaY9P7Ikgu9YA=; b=BWP5imKvcn+F4+dfv0y3
	21bnm57gQVhyNhGsCX+GMxhLwGpsSPggT9G4AgvKtiXcs2eeVcGwyAXekaAQ2LgV
	C7SccP2wB35RPvWjvJ82QQFgtjVU3PCHKCdmnGVKjh+M0m1Vf4ATm/QSqwxMudva
	5klp0aPwPb0olULhAYteI3l2ikX7HruK/XcejBEagJPcqfduJXi1DBstvZlB29Cn
	ixyFxOSeJCJ9aaEyQXVCJeL1Up23RYPLrwyvIrmgEbDINPc22AJ3y+Uau1QxjYnM
	Vh62V8h5SSBzhxjdkh17D4d3sui+dVJjxMe0WOugy8lT9kWa3tZE/MVnYS03iTyo
	cg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hqawfsedr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:17:56 -0500 (EST)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so755961785a.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793711875; x=1794316675; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eXDd895Lrwplt7+NQ9MqaxzvFVwb3SBaY9P7Ikgu9YA=;
        b=OTa2SQO/DT2VARhxG9tALHDP/sQyTBUcBg4FMae9aXtemeH7OwaTVI25ht60ucOZJf
         E/VWbdim7PzCgZRzhPAAoGMualRS+7obHudDq9lrGFxIJDgIt5QGVSJUfcqYH5T4itr9
         48er/YiCYu5W74s9EGOz4GO/2N9SZMub3r/1J+LSK60gKRi34a5lJaV8tSFiwYfr0sdG
         fqeo4fGNHzn9CbvyPQGMjkLuYW8p9nNfp65oc5vaxqlun+ttwJg+tex+WMb4VYPKSNO2
         7ZHx+3QG4AEaw/pnJTFmvK1rYZoGFdOsoPlA+dAxHH7KdRBNXU0HHQ90J71LjHLFMTRs
         /gGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793711875; x=1794316675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eXDd895Lrwplt7+NQ9MqaxzvFVwb3SBaY9P7Ikgu9YA=;
        b=CpBOT1sUefkoy1mqBlw9w/+yKwsRUK0R3p38PIqMh49v7HymW6vbl5kGtApML6X5TT
         X02YfQkvLJIlsuz+dc/dmhlPE10FSonwGv0G2jacagY0xt7wwRUpx9ppn4wWaqqg+XJF
         baSte1Kvgy+1+7sFFREH2i3D4UWkMglRrgBTOxwWQsYbfGNayCIw6o507JHdp6LySIJ4
         fKDcZ0/cY2SlnnXlhtFxvV5BvHYeB/edB9NUGP4RnxCJ5HAwANPn6SqSw3Y2BJj4E6qq
         JR9+rSHdkFC+L/3LBMPn8iUXazpqxdJSN/aMaz7+pit+R4M551NLLi47Qs1DHjkZLHC3
         /61Q==
X-Forwarded-Encrypted: i=1; AKwUvBwaR2tf60556eDxSj+UWLDp2NFhOucXTz/SRcpgLB8oVKcBh0cDvFGHp6QWqLF4n4N2gfKfbYefUGWg600=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ivSYo1/jV9v+wyCEumNbguFREbhixPHMyDjhq9FfWzPC5GDxu
	pJf9aV+Y0EwQURRy2ILhrApyXLjDpoj6QO2qG2yS2s+VaPrPm2fsaxrKls6XM6hypx7/qkRQm+x
	+R9ujg3SplFIolg8Cet4+ecyFCXnSoUztemK/QL9xkG0Bqw3J8w7McPZ2lbvR+A==
X-Gm-Gg: AYBFou3FaDAGc9yyP6uQQx2YPsf2jBv01Ei3+rcWDyGKZm7eIJX2eI6G+tjGRtGL8bp
	47/SwvH2BBxEnu6oTq+RJP9xZ1WaPyru1DD3gdZJFJpFtqL50yduMbga3asVI7P/Bw8tQ9h7jbF
	no2iceiF6oTXCbxy2d4PtyEAb2i3MeXsi54BHK9xWJJ5G2jIRoe00CIHC9E7uVMkm9/pZ5C4FqD
	MIYo2NIhfRhyLNhI2oyIa0CVlcPAbhs/+krwmAQ39inL0NREL+YSC9nXynv+k5hIza2JVKPTw/r
	SgiZfNV2XCSFYMrQZl2iYq4BZzPnM6nvS57VA1Jo526q7U1zZkTWuWkr6tkSX31HWmMb8nyg2/9
	SoDhlCghjhP6wBmHdgdzaeE52gyhdqq08Faq5AAvxBBflMqqb9gL5euGPeaQ=
X-Received: by 2002:a05:620a:318f:b0:93f:633b:ee1f with SMTP id af79cd13be357-94421617479mr2171230985a.28.1793711875260;
        Tue, 03 Nov 2026 05:17:55 -0800 (PST)
X-Received: by 2002:a05:620a:318f:b0:93f:633b:ee1f with SMTP id af79cd13be357-94421617479mr2171226585a.28.1793711874627;
        Tue, 03 Nov 2026 05:17:54 -0800 (PST)
Received: from [127.0.1.1] ([37.142.147.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa5781c9sm62076885e9.8.2026.11.03.05.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:17:53 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 03 Nov 2026 08:17:08 -0500
Subject: [PATCH 10/16] squashfs: walk folios by offset in the page actor
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
Message-Id: <20261103-squashfs-folio-v1-10-7b0fd4d20882@columbia.edu>
References: <20261103-squashfs-folio-v1-0-7b0fd4d20882@columbia.edu>
In-Reply-To: <20261103-squashfs-folio-v1-0-7b0fd4d20882@columbia.edu>
To: Phillip Lougher <phillip@squashfs.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-kernel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793711849; l=3031;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=mMnCbeooKrnCvJRRMHT7drzS1qonasc+CddLfFrZSN4=;
 b=61kzzAEezfkDJdv0nQLQZYz9z9zOAiYcP2PN6I1HHUm2uqHMZjl8bhYj/j+hIcXCc8TE+nThv
 uedpdjpdFTtBXSLeq5sdf+NFWBDMajhpmac2Aw6X38hD2gSYSb23Bvo
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: sgLka0-b_M_EFVJNcx5PL54JHLhozdXP
X-Authority-Analysis: v=2.4 cv=DsXDa2/+ c=1 sm=1 tr=0 ts=6ae9df04 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6RgaMXXTExC6Yw++yBnrug==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=8RdLy8_qIiOmrIqx_ysA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfX4kEvKTT9vmjf
 xqezmuU5wjoCxGPQZwBpk/an81M/boEwhc5fvPtICpdVO5dpGkJjs88xGlqn0gPZQjgRJEjfuSW
 +Vsa46x6AjAYA5IR50iPptnXnjMnsYryYmErPF40mwRnYRogJZWO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfX4BpfVhNkt0Bm
 WO3ig+NcDY6U3Zp4DwiwleH2sT8Xi4JEqx7G0nn4HIum6Ez1fzLClTdt+Lu79gR7LB2LXniP9HE
 lDLPblLzhCu52fZsM1OrIqOwexJ44npuFUlYgBCWomAw3tli706DncH+TtfT8x7Zz5gYNII1fJR
 g0JGnLQD1qOUXdrsVq8JGlXVVAC/WWg8M8jWp7ClZNZz0Grsm0IBsi6aHLZB7Eu9JOM6ddhppef
 MgMKZw8Y8mxJGZ5UGdQv4uGlQaF6Pg4NC+bMO/Hdrxmfg9wysAgn4UoMVLEOiMbpXtuduv/82Ud
 IVXITrQiJjOIoitKiVaUtBZJMrpOcIH583cpezlq3Nt6ihd/VDdkrP+e8vgI5NdPURUSy+iGl4R
 aKK2Lp2ol4kWxXTviSibfyR+JE2CuKkE3yWhYu6/KVi2eMKb0KGTo7er43LIFeCi2exuhe/LHQy
 ApQj2ksqHx9taWSfPZg==
X-Proofpoint-GUID: sgLka0-b_M_EFVJNcx5PL54JHLhozdXP
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11954
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 bulkscore=10 lowpriorityscore=10 impostorscore=10 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030052

Track an offset into the current folio and map the next page at that
offset, moving to the next folio once the offset reaches folio_size().

squashfs only uses order-0 folios, so no functional change. This is a
step towards enabling large folios.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/squashfs/page_actor.c | 26 ++++++++++++++++++++------
 fs/squashfs/page_actor.h |  1 +
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/fs/squashfs/page_actor.c b/fs/squashfs/page_actor.c
index 185365c1afda..3ecf83a5cdf6 100644
--- a/fs/squashfs/page_actor.c
+++ b/fs/squashfs/page_actor.c
@@ -62,25 +62,33 @@ struct squashfs_page_actor *squashfs_page_actor_init(void **buffer,
 /* Implementation of page_actor for decompressing directly into page cache. */
 static void *handle_next_folio(struct squashfs_page_actor *actor)
 {
-	int max_pages = (actor->length + PAGE_SIZE - 1) >> PAGE_SHIFT;
+	int max_pages = DIV_ROUND_UP(actor->length, PAGE_SIZE);
 	struct folio *folio;
+	pgoff_t index;
 
 	if (actor->returned_pages == max_pages)
 		return NULL;
 
-	actor->next_index++;
+	index = actor->next_index++;
 	actor->returned_pages++;
 
 	if (actor->next_page == actor->pages)
 		goto missing;
 
 	folio = actor->folio[actor->next_page];
-	if (actor->next_index - 1 != folio->index)
+	if (index != folio->index + (actor->folio_offset >> PAGE_SHIFT))
 		goto missing;
 
-	actor->next_page++;
 	actor->last_folio = folio;
-	return actor->pageaddr = kmap_local_folio(folio, 0);
+	actor->pageaddr = kmap_local_folio(folio, actor->folio_offset);
+
+	actor->folio_offset += PAGE_SIZE;
+	if (actor->folio_offset == folio_size(folio)) {
+		actor->folio_offset = 0;
+		actor->next_page++;
+	}
+
+	return actor->pageaddr;
 
 missing:
 	actor->last_folio = NULL;
@@ -112,6 +120,7 @@ struct squashfs_page_actor *squashfs_page_actor_init_folios(struct squashfs_sb_i
 	struct folio **folio, int nr_folios, int length, loff_t start)
 {
 	struct squashfs_page_actor *actor = kmalloc_obj(*actor);
+	int i;
 
 	if (actor == NULL)
 		return NULL;
@@ -126,8 +135,13 @@ struct squashfs_page_actor *squashfs_page_actor_init_folios(struct squashfs_sb_i
 	} else
 		actor->tmp_buffer = NULL;
 
-	actor->length = length ? : nr_folios * PAGE_SIZE;
+	if (!length)
+		for (i = 0; i < nr_folios; i++)
+			length += folio_size(folio[i]);
+
+	actor->length = length;
 	actor->folio = folio;
+	actor->folio_offset = 0;
 	actor->pages = nr_folios;
 	actor->next_page = 0;
 	actor->returned_pages = 0;
diff --git a/fs/squashfs/page_actor.h b/fs/squashfs/page_actor.h
index bc4f44122ddc..e188e807350b 100644
--- a/fs/squashfs/page_actor.h
+++ b/fs/squashfs/page_actor.h
@@ -17,6 +17,7 @@ struct squashfs_page_actor {
 	void    *(*squashfs_next_page)(struct squashfs_page_actor *);
 	void    (*squashfs_finish_page)(struct squashfs_page_actor *);
 	struct folio *last_folio;
+	size_t	folio_offset;
 	int	pages;
 	int	length;
 	int	next_page;

-- 
2.39.5

