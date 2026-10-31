Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793469163;
	b=yz/cmN4o3SfcDtCcRk2p3al7hdToYFacWHIGmEF4xNdIZ8w4Xeyrs0FOzAHdVFLtRrQ6
	 IeoU8HYXHWK2AQve3lSweiZ2RxseFQTXSfIOnwwuDJXiij5+1JOUd4fiNiH7iAL3cD9gq
	 +jn3ReyZFE+Jqfxlt0J7Qw+Xp9/jCZdKNsJbn5CSd3+Eyhh7+H6ITqwtE6+8nIgCUA7Le
	 oIwxi4IFAT7AVPtIJTn9PmXUwC0Ib2EVznT2gU6FCEceadMfRlUlYXJIQ6+6NmUTqO8YI
	 A4q8VfgsmEYmi2CZ7geVRGAcWXti3aHeEKXfh2/iY6LglPT25sCBjEuLXD1VcBeET7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793469163;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PV68I91KKeWspn/QO5cHP4XcwhAjqyzgD7yiFdKEI6w=;
	b=T0myiCT0d7N36G4GM+muDbMF5OKZRQTlH0RZwWieAVpEWNMkwhecYldt5skT4IsNhvXL
	 FKEGmppRmhJU//iJ3YJeQHbDZKUlq+Qh4jFI+zJ43c/bAFaVGqfjrHxV+n+f7ry6ZQb7+
	 xYA2ZM0idX7Fx52vfVSYjmK7ioaKzuEprk35AeKw3JmueKEElxhMsbZSdEUYZP10c0v4l
	 B5GupE+4B2Pdyoja6F6azXZZ/Y7AcEdHR6WVvqO+kpJRjYsJtRAeyre3lLsga7HIYlPN4
	 49akw//7S2q9qLR+Y/4wvCWOGMvVgKQqmW8ln0EWvPA0mFNqxky9A0SO7xH+x/QWlPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=Kx6xGzpD;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=lI5LNGGg;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475FD606A327
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 17:52:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 475FD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=Kx6xGzpD;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=lI5LNGGg
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VDkDno3860906
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:52:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=PV68
	I91KKeWspn/QO5cHP4XcwhAjqyzgD7yiFdKEI6w=; b=Kx6xGzpD1BZSx5LYmhHZ
	PKcsV2yB08K15Y/Lm62zbY6EsHEfWYGBBVQFDP/KKwA+WuKJv4rEbtZXx1tAJPSv
	de8lCz8BQ+BhwCPTlBfN+YIbz60qnGT7kIXnmp0Hk39KkHnoxNcyoNaRld+vDnOa
	z+ZWUH9dpGkhZwGjtNC+I65yur+xxrIMi9LWPaYI/PQtEJkQYR/Xq5UEFMGPL8SN
	uVtAfjC26nF0seMYDuxWBTUkofCeg9+yIBoW39Lu3PxqpST0mDUMFyDuFxbANKrP
	gq3blYeeOFp1Ki0iBNcj8KWs1Ag3f2l1FHzs2+TIHqjdoX0d9Bd25S6qmNZQoWsG
	cg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hn9eqtv36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:52:41 -0400 (EDT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1f2fafeaso210690485a.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793469160; x=1794073960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PV68I91KKeWspn/QO5cHP4XcwhAjqyzgD7yiFdKEI6w=;
        b=lI5LNGGg+RVi3GP4pUODg621ONvKfUiTMh7nFIzj01olg2auJR+EeuSjlAduQ6FBn2
         aqSAT9mrXPBbLmaFDhMiu4+Oxf2UPOcPkQ8pscvDY5W67vGzbobtu7kEl3eew588OGdJ
         hwVY0ZIqRpke/FPCqmAuD0ivp/7Z1Fp03i8+CocT8qRNx7jZRXlA1z36fvgSykAzhQVE
         hxS09IVyQnNU7bZyguqPL+uJZppjnthi2lWoA9RZcdnuowyQNmXEy8mxhYTe+ucvDE4H
         RgXdDD+kquJmy4fcR0OrlJ7XuPJXn+wfFYeMlCc8dpOcy/V/PFAfOA9XliDS5pRogg37
         z9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793469160; x=1794073960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PV68I91KKeWspn/QO5cHP4XcwhAjqyzgD7yiFdKEI6w=;
        b=kkadiRP09afErQt4aMNClGAf+3ib/Oj/IcFYjRYfuLym6GeieN5nBeZM8H6Hpx6fqe
         K9t3jstJynPWgkSPqxaPYvoK/Zqf2yTIVsQ75+1L0TXrlpTfRix3zBeD7RMG1PaUnucp
         lzAzd2p0kbvVJX5/zGFM3oq/zcK0cO/FWzSasXk+xVACNej3y4KUlf7cnOEuqq709RXP
         M9u4RnOOUs774oF7c2AsVdsiHQa5F9JKSAtzqyxuxrIofdHOFwNDMzIZTuoSKN45jJ6X
         nE5srkliRMQCzdqrwYJIZnZWfZOX+cGMUFlK5Bb7OD1Wh0UAIrxjBGm0M2gsuvm+ZLBw
         cDsA==
X-Forwarded-Encrypted: i=1; AKwUvBwycaJPZUETJGVwYLmcPpctT0fnOyul3ONqZYmNWgn+1lnzaruNJVpbK++mGBPaBVVB5ti+mpi5pkQvpQ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvRAAMi55mDO4Qoav7ysEM9WNk3wb/3EQkfL2ecwQ8KHzQYgiT
	d/nnP/PO9UAKRvgJnPE77TBJgwGaqHG8f/Y80tomlh1ZV2Wt4Z8k8cypSDnaiCoZskIFLT39Rq7
	0FSdpgg9+pdDgsUiLW7CP9u2GtV+/exrdHPwoKglxw7KupIjJmSpsv6MrGRgQ4g==
X-Gm-Gg: AYBFou3GpUoRcERr+vl0mkf+EBFjwLfLTckzUMJB5lBnNSA9UsF6FYJ8+xFjoUhUfpc
	uzPuP/m3P1b+wkG4GbKJoEAwmgJO4jCsaSrgUrdkQk5dE9Hjo0kOkVxluNKN3gOkOhA72+ARPgb
	hUnFTF0eVsOqw9tX+24RqCMENBkWK3FVRk+hGhuPtsahTJrPwRh9QLVcJd0ePAPC1iYL+6eKUUN
	ks6NF7K1ZwVHcKvq4W0vzQn+bGo/dtW1gqkxrWDcwWTF5g8ETs8sG9VJNyJ4so/rcBXFPiPbvya
	C9kJcXKvIgRxq8POz8S/N0/ZWvXErEGBM95H52r1A0Vtyd5vVyFN0duRmHtCzYXsQOeTive+L68
	AJwbCCsyg2eoD0oAf62c0wgrZrpn/G01FQyU9mENC75cNLiWs0ppzFfh6Ag==
X-Received: by 2002:a05:620a:45a6:b0:944:6d8:9c52 with SMTP id af79cd13be357-9442171e25amr971141285a.57.1793469160562;
        Sat, 31 Oct 2026 10:52:40 -0700 (PDT)
X-Received: by 2002:a05:620a:45a6:b0:944:6d8:9c52 with SMTP id af79cd13be357-9442171e25amr971138585a.57.1793469160095;
        Sat, 31 Oct 2026 10:52:40 -0700 (PDT)
Received: from [127.0.1.1] ([37.142.159.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm249158315e9.11.2026.10.31.10.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 10:52:39 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sat, 31 Oct 2026 13:52:09 -0400
Subject: [PATCH 2/2] platform/raspberrypi: vchiq: mark pinned pages dirty
 when unpinning them
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
Message-Id: <20261031-vchiq-unpin-dirty-v1-2-632d3f1281e0@columbia.edu>
References: <20261031-vchiq-unpin-dirty-v1-0-632d3f1281e0@columbia.edu>
In-Reply-To: <20261031-vchiq-unpin-dirty-v1-0-632d3f1281e0@columbia.edu>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793469152; l=3712;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=vFj4hKFrhWMRoV0kZRRhqDRjKJ27bx1QEz2GfvQc7us=;
 b=yGrjFPBXLe0lK6TZ8lPQ7inx8FHEWC+f9pn2UE4L7Ecdduwmc1oit1qQp/D3jLfTflf6booZf
 rnY5IBsKL8OCNv+KTHLjMpHETguaaepNNhfgBNORqtnxJ7RTaEfwSJO
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA3MSBTYWx0ZWRfX/YdowxUDA1re
 MkRNpteEUTiGPIGvGsD2iWslmsVIzIOorYpRVPlhH0zvXbd7tDy+VUPUMk3iFdUssgi254buHkj
 x6NSGOs9FkmVvz8nQ5Evk+m6pflg28KJL6HIGc8H4nms1lgQTlJDw86m04t5gB+FWtJX61e+8a3
 TdkS27kx7/w88RXiIpVLdt+qEXX+R3pfmJWffS1VtNcVhwkBpt4XN6tbxM/6n+MzcSJOS7dsCde
 zZG8/bRz5UV+pU6XcUTcga3pD6L5Ma5aj1mXxpQhRvjWqZuI0b5m3lpb2i3pXwle+rMEZdG4fUB
 Cp1s9HR+sy9nAV6IRaHjG5AlDLx7CEoJGKRsvHUO9fj06sGGyWkDLYQYbiAKBYH+KMk5ZU6Q5/K
 LxM0A2D+KjZ3U5pJXSnKwhkm4S+R1w0bXGBp8BnX73bWr2p6b4jiwbS5HfrljytWDGB2nakGKA+
 ifuTRCblscsHzsvLTsw==
X-Proofpoint-GUID: Dl4t29Lqw7vxu0pNBsWPBZxCbWu9y6Am
X-Authority-Analysis: v=2.4 cv=YM0KWhGx c=1 sm=1 tr=0 ts=6ae62ae9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=P+xgYyhW+KadpqoI50EQPQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=Qm0qsxP7aFY2tkT6R2MF:22
 a=xRIeBTzNsUtmvBibuAEA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Dl4t29Lqw7vxu0pNBsWPBZxCbWu9y6Am
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA3MSBTYWx0ZWRfX5WIJBFqUgo6O
 0gPJowvMGa4JVcI3NA/FMvbTE0nNC5dXsyx/fTajzXdiwpe1gejZbupRXalrWFpFQrN1Z1T7gz5
 EInAc38kRVlPyTPk8e+Kmxv9DZBtr7H1rTd+URPgn9YoM0gx+7w1
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11952
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=10 impostorscore=10 adultscore=0 clxscore=1015
 priorityscore=1501 bulkscore=10 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310071

free_pagelist() dirties the pages of a completed read with
set_page_dirty() before cleanup_pagelistinfo() unpins them. The pages
are pinned user memory that can be file backed, so they need to be
dirtied under the folio lock.

Pass a dirty flag to cleanup_pagelistinfo() and have it unpin with
unpin_user_pages_dirty_lock(), which marks each folio dirty once and
drops its pins in one go. The error paths in create_pagelist() pass
false.

This removes the last use of set_page_dirty() in vchiq.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 .../raspberrypi/vchiq-interface/vchiq_core.c       | 25 ++++++++--------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c b/drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c
index 3ae4ee2973de..931feb54d6ea 100644
--- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c
+++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c
@@ -1456,7 +1456,8 @@ poll_services(struct vchiq_state *state)
 }
 
 static void
-cleanup_pagelistinfo(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagelistinfo)
+cleanup_pagelistinfo(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagelistinfo,
+		     bool dirty)
 {
 	if (pagelistinfo->scatterlist_mapped) {
 		dma_unmap_sg(instance->state->dev, pagelistinfo->scatterlist,
@@ -1464,7 +1465,8 @@ cleanup_pagelistinfo(struct vchiq_instance *instance, struct vchiq_pagelist_info
 	}
 
 	if (pagelistinfo->pages_need_release)
-		unpin_user_pages(pagelistinfo->pages, pagelistinfo->num_pages);
+		unpin_user_pages_dirty_lock(pagelistinfo->pages, pagelistinfo->num_pages,
+					    dirty);
 
 	dma_free_coherent(instance->state->dev, pagelistinfo->pagelist_buffer_size,
 			  pagelistinfo->pagelist, pagelistinfo->dma_addr);
@@ -1578,7 +1580,7 @@ create_pagelist(struct vchiq_instance *instance, struct vchiq_bulk *bulk)
 			size_t bytes = PAGE_SIZE - off;
 
 			if (!pg) {
-				cleanup_pagelistinfo(instance, pagelistinfo);
+				cleanup_pagelistinfo(instance, pagelistinfo, false);
 				return NULL;
 			}
 
@@ -1601,7 +1603,7 @@ create_pagelist(struct vchiq_instance *instance, struct vchiq_bulk *bulk)
 			/* This is probably due to the process being killed */
 			if (actual_pages > 0)
 				unpin_user_pages(pages, actual_pages);
-			cleanup_pagelistinfo(instance, pagelistinfo);
+			cleanup_pagelistinfo(instance, pagelistinfo, false);
 			return NULL;
 		}
 		 /* release user pages */
@@ -1630,7 +1632,7 @@ create_pagelist(struct vchiq_instance *instance, struct vchiq_bulk *bulk)
 				 pagelistinfo->dma_dir);
 
 	if (dma_buffers == 0) {
-		cleanup_pagelistinfo(instance, pagelistinfo);
+		cleanup_pagelistinfo(instance, pagelistinfo, false);
 		return NULL;
 	}
 
@@ -1664,7 +1666,7 @@ create_pagelist(struct vchiq_instance *instance, struct vchiq_bulk *bulk)
 		char *fragments;
 
 		if (down_interruptible(&drv_mgmt->free_fragments_sema)) {
-			cleanup_pagelistinfo(instance, pagelistinfo);
+			cleanup_pagelistinfo(instance, pagelistinfo, false);
 			return NULL;
 		}
 
@@ -1739,16 +1741,7 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
 		up(&drv_mgmt->free_fragments_sema);
 	}
 
-	/* Need to mark all the pages dirty. */
-	if (pagelist->type != PAGELIST_WRITE &&
-	    pagelistinfo->pages_need_release) {
-		unsigned int i;
-
-		for (i = 0; i < num_pages; i++)
-			set_page_dirty(pages[i]);
-	}
-
-	cleanup_pagelistinfo(instance, pagelistinfo);
+	cleanup_pagelistinfo(instance, pagelistinfo, pagelist->type != PAGELIST_WRITE);
 }
 
 static int

-- 
2.39.5

