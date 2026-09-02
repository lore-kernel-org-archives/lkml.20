Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F85C4A9D60
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788365506; cv=none; b=N3XM2/XGx7xv2RNymp7wjtT//b/5GO/P95UUAc1nb6SjUrJFmVSNCEc00UHnLu094qvAxrJzxDzXLUN0bgNGp3gPwM0xhNlwCeKCxDnXmRNxp0lml8aVBHoiXOboKtO+kW1XGIIkXAMNlTMyr811vQlj9I24vemY7nWZ0eTFcMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788365506; c=relaxed/simple;
	bh=S0n7wSE4O7NeGG1xcqPB5bhXLNuF0iPswl0J4cPzvhk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LNideiTIsFytrPxBm9zBxYXkzgrVrCZxi3SK2QxOwx54uyLK6NuuQYM8CmLlUVjIzjS+8CTuta8Nr640cWP4hn8Xb5DwTHwOkctNVOsC8zJ+R5lVYIh2OEblLetRiGp+L3zj+8scpMvL6IeIlmXQqNVWexfgvPheb8t08TbvQOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=dItTNQmc; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=ZT2Xl5ab; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="dItTNQmc";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="ZT2Xl5ab"
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FPl1B901352
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 12:11:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=QdZ5
	SvrzcjsBNQ4Uyt58JDsaQtMYKfICZKuorWvHvLE=; b=dItTNQmc2SQOQxfaZir8
	4Y/JKNnMIeMNId1ZUpTjM4QCEx+AHdO7pUjOLWCWFipRoBqEmszwtv/O65XmI0ZB
	I43hcMDmXpcborETx6wmQZ4EThO6qXDFcC9Bp1lxjBxGhyh0CiiihIFZqaqHAmY1
	vTqHRAI4S0Q88EtBnknnZ8h3nUiHyFFRkiFFUtvzGbejk9/YXXyrBqXDOvYRkUcx
	f3rRoQWfMwt6S4XJq1KJ1/SITPsDVycUq1ZplDCtymHqfP5ehv1eA6pJiqGp+5Nu
	008NehibreJIeJCRy8S1JXEcpDbQN98fvshRypUWzubiOAd9eXnpyVtfo7HzmjCC
	uw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gegv7tysg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:11:41 -0400 (EDT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52d33c89a29so32024701cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788365501; x=1788970301; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QdZ5SvrzcjsBNQ4Uyt58JDsaQtMYKfICZKuorWvHvLE=;
        b=ZT2Xl5abcpJ+M0qIWnXrXr0xCoBJC1s/7H5DfZdOXKwfoud8LMYPSahSKOAvGwkJat
         4Elp95cyVO8+8lAnebKTq2q6XOwJLwrGq7+mE3QSkIjLfYwExACX0teKba+E5X3/nXYj
         aPg0DK6UUMowLH3zUVXpW3VwkqwEDKWOTx7Ysv/ZOcY/1mmh5RxGrc/XLvTW/stgk2Ei
         6eNf82tatQRYsGmhGepOtBXU7d45CwuBvYkZinVBdZGzDaWUKKl+RoXMhjy5zL8ammRW
         AaiaJOurs+PvHhNYJJJPvTkJJg44UIkH3DrAcBjBiWBkEm4oe/DIpxoT6MhPUj/qZL3l
         N/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788365501; x=1788970301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QdZ5SvrzcjsBNQ4Uyt58JDsaQtMYKfICZKuorWvHvLE=;
        b=fH/TKe8IhF2C9h/nLz3tGAL9lM15oBo5YcZtGwoypFgJsrycvggk7kIv60Go3lVwUj
         7k3TYu3zRrdGba3jtxmn1sRRGe03aqGObIN9AonhkWHKWSZ+DWEYXL+dUPrBOVUJ51+E
         8Z1v1mBr7Ffl9KXoth/UDNDa56PsT9/V+Vt/0al0IPZtDi0NAgBpgCXxp1UPwioZUja3
         aRU0kYUVXbl+Am/EsBtAwtHcZRdEKgHOdTCEVD3T3ZUu3okT4mBv+FWbeRQ/v4nH/veP
         p2wPJHm1cF6LMIdkGrnJWw3sk66FgjyyTF5DRvBkY4yAed3dSN3mQi6FA/Dq2GpeJFbm
         HEMA==
X-Forwarded-Encrypted: i=1; AKwUvBxepSoF15cOhr3Sf9EPaHdzApphx/+AswQMF0dO3gLua09DWsGMpfXxS8jiiYP46QQHkDBZ0n+w3cbwg6Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lNG1y00W2ftbT+Pqw60YLijT6Lk3Hsd0ZOgjlx0KCNWuZUNhFr
	Hl/JDTcPNtpWqJPor4hpmnhjz0ylaulnVUkLZNPciUiCKaw8RbkXQXwPxOL+tEhk530KLxo0jyr
	mNEsnTC98mXOdgFkVynfrQBwWjYJ0YEgMyXyXpbefiXdS1R/b0JKKqCQr9Mhx5A==
X-Gm-Gg: AYBFou3RQeD4C1p0ZIiVHp653u7tgNWDJBMwTCCQI7Fw+FZ6gAljUHNTO72PD78P/0D
	dwFX5In2eq8XlDumMBvuhzOxPY2/IvcrE6e793QfNPAAcMFG9nu0KPBO+Itn83BCsAOcqjptTNl
	5K86FRD/Td3jLp+QiMGXzsNMxkQ5rIlGdtNXnsNR+6E2gpniSsXNtgdWiGknef5qkufzHMA7aQS
	Ym+GOfo1gaakdu9xo6u15kYz9moUA/pM823wLE8ldTzhtIKsKCCsqSaGN9TDp4GGgO/5S/skvae
	c4N9e/W0GwR5OA1TME9WmFrOXw1dr9owRyJm1uRH4sRQd0P0yFBDg6g/LmEvWRx8xZ+KsrDoZN4
	ONRIEk2HkY3IF3Wchcr8yJ5Ccykzh2CDcerRe2VC4+L2bljXJz7eqgg==
X-Received: by 2002:a05:6214:5a0e:b0:910:345b:476f with SMTP id 6a1803df08f44-910345b4f96mr1930386d6.36.1788365500485;
        Wed, 02 Sep 2026 09:11:40 -0700 (PDT)
X-Received: by 2002:a05:6214:5a0e:b0:910:345b:476f with SMTP id 6a1803df08f44-910345b4f96mr1929826d6.36.1788365499940;
        Wed, 02 Sep 2026 09:11:39 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-193.net.columbia.edu. [128.59.178.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eec7608sm21172636d6.26.2026.09.02.09.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:11:39 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 02 Sep 2026 12:11:26 -0400
Subject: [PATCH v5 02/10] ceph: wait for pending fscache write in
 write_folio_nounlock()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-remove-wait-on-page-writeback-v5-2-0b512e77e75b@columbia.edu>
References: <20260902-remove-wait-on-page-writeback-v5-0-0b512e77e75b@columbia.edu>
In-Reply-To: <20260902-remove-wait-on-page-writeback-v5-0-0b512e77e75b@columbia.edu>
To: Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>,
        Viacheslav Dubeyko <slava@dubeyko.com>,
        Christian Brauner <brauner@kernel.org>,
        Jeff Layton <jlayton@kernel.org>, David Howells <dhowells@redhat.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Zi Yan <ziy@nvidia.com>
Cc: ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788365497; l=2448;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=S0n7wSE4O7NeGG1xcqPB5bhXLNuF0iPswl0J4cPzvhk=;
 b=cwK7yefdr3CryJYluvGMl9Sw6LnEoVPUHW3gDfpm0zTLAdcffKz4q2aPnImne6kPffRNrV8rL
 aY4bfdekI5/D8IdkVXp82uclZJ8hIiNC7rjAth6TyX00Wugj+gs60Z1
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: _bSBaRUH_1unVHZ5zBQiOFlOW63xptlL
X-Proofpoint-GUID: _bSBaRUH_1unVHZ5zBQiOFlOW63xptlL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0MyBTYWx0ZWRfXzTDjnjU7i6Yd
 S8D7wAXdhiWGFoFn/l4fkICtk3L2OrDcq0FLcvhiXH39dOSfGflULHbks22Vb4EzjOzEUbEXUFt
 zEa9uHUS1ll/eqgO+nU7gUXBA7GHjwJQw/gSpsKcISe0cbiU3Iud
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0MyBTYWx0ZWRfX9eJ6ccETlMvw
 JS+IsyVbMdHePX9p+1kmkJYlLLquVC2j0UC7wUXBJ5lxOzbDnGJDr9sIcNI1bC+IZPIFEbgtPug
 dc/Si30C7/8g3w12GsuGR+8TqC1QG0sBxA1GQMNnQRlupOhoVVPAynbIpoqs2lUW44dQLKxxBgb
 pXIUwjXqbwrboR5hXZDw7UtX25fS5p9NB/RZSS13ARJaYUDESA5bwoEy1h/cBn+V2ox9+F+t102
 64TpGqrC2+6BUKPtVYu74FGn+j40YiGLIAUYJ6NWPtRPVcRJKfjbN/Xwee40BX/NmQOs8Grb4QL
 5pwccrZB0D2aXlwKJT4K9iCtODNfkqqjPrVB2hqjEIwPhJPmYof0eLZb+tBrFM1XSZfH7vlc/A7
 DnmyWSazJVRdcPQicptfO6aSFynbNNM7/2XStqyJx9T/Ruwt3GLoFgK5qJlnMAmhk189p9lkMkb
 10PpZeoKEiCNbVHmSRA==
X-Authority-Analysis: v=2.4 cv=JcCMa0KV c=1 sm=1 tr=0 ts=6a984abd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=XwBYxoxBwSosfWEfMcqm5A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=zYp62tllrndxtlEyWVMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11894
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 spamscore=0 suspectscore=0 adultscore=0 bulkscore=10
 malwarescore=0 clxscore=1015 phishscore=0 lowpriorityscore=10
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020143

write_folio_nounlock() marks the folio with PG_private_2 via
ceph_set_page_fscache() and starts an async write to the cache via
ceph_fscache_write_to_cache(). PG_private_2 is only cleared once that
write completes.

If the OSD write fails, the error paths return without waiting for the
cache write. On retry, ceph_find_incompatible() would wait for
writeback, but not for PG_private_2, before calling
write_folio_nounlock() again, which would trip the VM_BUG_ON_FOLIO() in
folio_start_private_2().

Wait for any pending cache write before starting writeback on the
folio. Do so before bumping the writeback congestion count and
allocating the possibly mempool-backed OSD request, so that a thread
sleeping on the cache I/O does not hold either while it waits.
Add ceph_folio_wait_fscache(), a wrapper for folio_wait_private_2(), and
use it.

Fixes: 1702e7973410 ("ceph: add fscache writeback support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260804-remove-wait-on-page-writeback-v2-0-81f0ab065284%40columbia.edu?part=7
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/ceph/addr.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 28fb76ded32c..5452e73ae11b 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -564,6 +564,11 @@ static void ceph_set_page_fscache(struct page *page)
 	folio_start_private_2(page_folio(page)); /* [DEPRECATED] */
 }
 
+static void ceph_folio_wait_fscache(struct folio *folio)
+{
+	folio_wait_private_2(folio); /* [DEPRECATED] */
+}
+
 static void ceph_fscache_write_terminated(void *priv, ssize_t error)
 {
 	struct inode *inode = priv;
@@ -585,6 +590,10 @@ static inline void ceph_set_page_fscache(struct page *page)
 {
 }
 
+static inline void ceph_folio_wait_fscache(struct folio *folio)
+{
+}
+
 static inline void ceph_fscache_write_to_cache(struct inode *inode, u64 off, u64 len, bool caching)
 {
 }
@@ -788,6 +797,9 @@ static int write_folio_nounlock(struct folio *folio,
 	      ceph_vinop(inode), folio, folio->index, page_off, wlen, snapc,
 	      snapc->seq);
 
+	/* wait for a cache write left pending by a previously failed attempt */
+	ceph_folio_wait_fscache(folio);
+
 	if (atomic_long_inc_return(&fsc->writeback_count) >
 	    CONGESTION_ON_THRESH(fsc->mount_options->congestion_kb))
 		fsc->write_congested = true;

-- 
2.39.5

