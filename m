Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3EB4AA405
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788365514; cv=none; b=H19yuXIw8QJzWHR2UIWAd2duTaYO/Z8FYGbs3NiZoSWDRQ6W+5r+pqQWTP7Bk5awubJWuXrkYrgbILcbfx7fYZiDC7ezuVgbo3RoHR1m/I4OJBF7I3Ue0b2zj1jGeV83DzwpaPGIJk9VbSR362Yjczv6pS8mkf80lX7AhU8xDOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788365514; c=relaxed/simple;
	bh=2lPL6DBiy5ViqQHXL9KoCWheVc7nxPoqgGpcIqZXOSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hJgrO1AXy+0FIMbNT46RHGDwCHgb6pQgcUsdCypekp6DLgQttJVbg4AEXlsK3daakwFBH09zZFMd/Uboyzgy27vFGQbTPpWSaWitiZI8RKnt8MVcE87EaqTWITsH9JzdqWfx6Zffm5RXHk+B9W2yiw2sXjEjjM6KdCCnApOQ3xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=CBNDpnr5; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=KZMhDHum; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="CBNDpnr5";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="KZMhDHum"
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FPYkI463002
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 12:11:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=dgad
	/qXN3FU0bHbIChJxYYiagsTq0TACskwb2AqYmrk=; b=CBNDpnr54Nhiyh8dLCHN
	SulsREzvUF3nsMRRsQPObJYAZR1g2bc/OzacPuTev/uh2tTyCrpCLGvNwP140url
	AWII7RhOezzPXAW28NEVI8jdRS4rlqd1S/W1eV2EwDTWOLp0C66WNMvM1mFzgICX
	ioee1yGa6KGbS8MNCS8W7w0u3o/P/3VIxUmEjY/16GjM5M97xpovXwLV89vruu8x
	7HNTyleU0TqolMeiAH+gMemXy/0Z5fYpLudgWKdcYr05UMgMwixvxE/aAiJUseDv
	dCU5oVP6YrTGC+TpK2EHHnrg0RUaJn7ZATag8Xadu5gUyxJ1Bi2L5oZ7XET4rIj6
	7g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4ge833vy93-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:11:49 -0400 (EDT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e7db8d191so23020786d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788365508; x=1788970308; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dgad/qXN3FU0bHbIChJxYYiagsTq0TACskwb2AqYmrk=;
        b=KZMhDHumrfestCzDf8K3kIHR0Nq9n+SI8FZqA7LL2T3Bj2hRuv6P2WSg3d4XbAHZ3y
         Z0bIM6gQJduAy9wp5CJED03ed7l1R44395HQ/OOqNCKNeuOVa0rDNig6IULuUBNPGBsh
         tHRCi+l33XP2vCTP6ZBkZAvLR2tbafCQg0xMQv6lk5KKgs+oJBF58F80NKOYuiZHgGcy
         QibvFsdIOKEvARVnBlltDKOVVQqXJqQz0Oc0uFOZ7yTSdD0/ITNNU3MHk1u91N7YOLCB
         HTtdAGdpsTK/2rFJWU7rQI/uttTrFL1bRW8YIN/mVP1IveQRZd4i8LwnKZwj39mJste0
         vOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788365508; x=1788970308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dgad/qXN3FU0bHbIChJxYYiagsTq0TACskwb2AqYmrk=;
        b=ocShQpJCpT/tk+pPIn2/V+UBEQ8XtbsZQPUskc9Yi3bQYIHvB9MHtQTj2GPOFlCEes
         QaBdPJfgKtdTuWX4KUdYmxEaKiNiCqLP7VTgDT+tllYoqjxAX1uOi9ExgRux+8telR0W
         t4OL7RVX2/RRqqA/EuMgCEpHaG8YnCB7lhUITlZOgfcED8GYNr2BIqxaKVYFwhta/Wrc
         zWzi5UH0e1B7Z5dBe5IRhfXmCdQ6DeSRCNhDn8F81PudDeMaDWh4A6qkiDyn+Ul4JGqS
         KIcYhth+clPieNGDSzoVv7+UG1Oa9Zl5Uo8mYuR/xAMoBkyfZstyfs+cChLdrZaIFQAZ
         ERdA==
X-Forwarded-Encrypted: i=1; AKwUvBzgN0Pj9+ad4dP+4m1g93rlOEJopP2fEzw6B/2K3PXUvpstLcN40KFOIukyaMAmvyLiYLKUh/xDcfdpDWs=@vger.kernel.org
X-Gm-Message-State: AFuF++kv7B/LsKen6YwPw81nXLAE526QqPBkQuUCUSP7jnS/EX6KvHF2
	/JdmvX39hMJMbQTWmeUX0xlO+DvmKC44UM7fXp1v7Uh5M1S7kye/ATLQio21VnJ5Rf5PftswkAy
	FDIW6x/plmwk7MuhIBtbZlyfj0X5DKjQffmpHdnFuuC3m8uOcWX2C9q5Ql3xvgA==
X-Gm-Gg: AYBFou10mkYNeDC+lEuz/59R9DK1TmrJud0K/ubIUgmLUYljxQItgczCVv0tpzYYRHF
	xjgJHAFBjLYui9OkWn1wtB1/6brUBoLkUgyaqo6U+UOpDx56fnY4hbczJ/gV786qvuJrB6XiMl5
	uaJaZTI8D14iDnoWapvW4QnjXHjiCnfc8RHkNmHZbeXwoRBkuD5L30HTJxL7w7Rqr6CqBF1pdb5
	NZmIbJtTIAxZ38ND3dtQGFWgaYIBaKHGbJ1ZNDQDBdWDl9PleUexvF1qUwUvYzTaKkfgS8Rf37o
	3FEMeaMatjOe4KJSrTOemDfC1DxQn4vP5K0sLYUN9dAZfGRgj1zrjzubhsHgZtcWZu6TclmHH76
	oWR/bIRtCcaqZNmYNbYLoRVsHOs2gFLoyI9uMtHKYhMgmN+xpMPZrqA==
X-Received: by 2002:a05:6214:23c6:b0:90a:9683:841c with SMTP id 6a1803df08f44-90ebb005291mr73869726d6.6.1788365508096;
        Wed, 02 Sep 2026 09:11:48 -0700 (PDT)
X-Received: by 2002:a05:6214:23c6:b0:90a:9683:841c with SMTP id 6a1803df08f44-90ebb005291mr73869126d6.6.1788365507580;
        Wed, 02 Sep 2026 09:11:47 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-193.net.columbia.edu. [128.59.178.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eec7608sm21172636d6.26.2026.09.02.09.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:11:47 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 02 Sep 2026 12:11:34 -0400
Subject: [PATCH v5 10/10] ceph: rename ceph_check_page_before_write() to
 ceph_check_folio_before_write()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-remove-wait-on-page-writeback-v5-10-0b512e77e75b@columbia.edu>
References: <20260902-remove-wait-on-page-writeback-v5-0-0b512e77e75b@columbia.edu>
In-Reply-To: <20260902-remove-wait-on-page-writeback-v5-0-0b512e77e75b@columbia.edu>
To: Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>,
        Viacheslav Dubeyko <slava@dubeyko.com>,
        Christian Brauner <brauner@kernel.org>,
        Jeff Layton <jlayton@kernel.org>, David Howells <dhowells@redhat.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Zi Yan <ziy@nvidia.com>
Cc: ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788365497; l=1302;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=2lPL6DBiy5ViqQHXL9KoCWheVc7nxPoqgGpcIqZXOSg=;
 b=5Svcd+z4vOklbudyaTG/eXrDhMVN4LO/KLWZmClx4iVjTaX3O3tCR042tmdxd2wEURDy8Rw7o
 3JNnTPOPLTkDbFe2B/EDgcj71/6DPCQ8rXaTsb0xoKu9lYk8ZWgl36t
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: CRnlsxa6jLQ8jsNDHafT6U51lGIX1sED
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0MyBTYWx0ZWRfXwgKrEmNYmoK0
 ekqoqG08X+ZxEqvrIJ4pt7rME1mPSiYv2+4b1RZTa4h4ke5z3LZqpkf3+VuvKNc72ZZrBr5m1hT
 M2V09XCogQcmUa4YuEAn5ZLcxSA9rbdK8dgnkpsMxLPAmrGy0TTu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0MyBTYWx0ZWRfX7ouF37ZFIHb+
 nJz/mbPIhCs3rkYwGKAzBqPu5Cnor61yUmZy3YvGdMMaNp9TQEi9Z8oFuLWVVoG/YQYWU6jjC73
 U93U8w4C9KQMKcZdPjjO9eLZLuVKW7SM6NVwHgRzJzy9UBZsxtXSscg68Cip+6GMxuL89Q+/WMa
 hhBJjjuBnjNfuzdFd1gAbd2iK81mWIhw5QLiQN9GQo0pb4AqRye51kFkXSVNN0njiXNAhUiVwYv
 97VZL0gG3gXLjn6Uejo26HElvPIgtkGIdHwBBntTmqPS32fMeNS6uCM+rvQrsx6KBQ2sU0JKxoB
 KMmNlPTwBycZR0jRkX7Iu/qpaQfUBVaiDx8RHtvAc8mBn5fEYeUjHRhlNPmS64LXR1v8tY0ljyg
 iIDE/a3+g0J1gx/4sbgc0YhIasueioGupaPUbl2McKdXL7h2oJuDae/nXWv5b5JUn0BF25BmG34
 JTSBLPDfdSSycLINvsg==
X-Authority-Analysis: v=2.4 cv=ZpPd7d7G c=1 sm=1 tr=0 ts=6a984ac5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=XwBYxoxBwSosfWEfMcqm5A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=j2JPeL-98-LFiXJzl4QA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: CRnlsxa6jLQ8jsNDHafT6U51lGIX1sED
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11894
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 impostorscore=10 priorityscore=1501 bulkscore=10 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020143

This function only operates on folios, so rename it accordingly.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/ceph/addr.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index f9741812e8a9..8aa60e79a669 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -1172,10 +1172,10 @@ bool can_next_page_be_processed(struct ceph_writeback_ctl *ceph_wbc,
 }
 
 static
-int ceph_check_page_before_write(struct address_space *mapping,
-				 struct writeback_control *wbc,
-				 struct ceph_writeback_ctl *ceph_wbc,
-				 struct folio *folio)
+int ceph_check_folio_before_write(struct address_space *mapping,
+				  struct writeback_control *wbc,
+				  struct ceph_writeback_ctl *ceph_wbc,
+				  struct folio *folio)
 {
 	struct inode *inode = mapping->host;
 	struct ceph_fs_client *fsc = ceph_inode_to_fs_client(inode);
@@ -1359,8 +1359,8 @@ void ceph_process_folio_batch(struct address_space *mapping,
 		else if (!folio_trylock(folio))
 			break;
 
-		rc = ceph_check_page_before_write(mapping, wbc,
-						  ceph_wbc, folio);
+		rc = ceph_check_folio_before_write(mapping, wbc,
+						   ceph_wbc, folio);
 		if (rc == -ENODATA) {
 			folio_unlock(folio);
 			folio_put(folio);

-- 
2.39.5

