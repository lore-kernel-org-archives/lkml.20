Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1B53E49F2
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788538389; cv=none; b=YsArwuObhjqCnBf70W/8museD/4Qjy0GfKpYVPVfwnb3/1kApWdKgXdC6AHx/ARbMOtfQRpKqPqUX9mZpe3zFUU6dZrbzxRD6w/owIGyjtRM0ph21nQlt60Ytaaov8DNtHoRE4tJf5B/64huGl5oGJpNJf7q3DCAABrAPVStels=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788538389; c=relaxed/simple;
	bh=HgT+KxvfjaddqNXFVkUtKH00CjJliL03d63DeMvCSSM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=frbq1yT1Eis3bpLRxJtDRdfjZWI0hRE3HBGVFVUQCAKF168SkVTL+qqlhicCGyohE/1TtJbBZAyG4z6b7WB/O2Vx7Hf0htgIZL0iI4fncIHz+XFTZje+DAqJLYnRJW334NOv5fDHxQszELktPzCiqHM6r4scm2HlK+DJ2D9mh2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=tOA0oe1A; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=biKXLj4s; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="tOA0oe1A";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="biKXLj4s"
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684GCHUg2727814
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 12:13:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=Dz9v
	Yhdfkr/TPCuaOD6quYTfPSbBDl29YSqczgESR3Y=; b=tOA0oe1Aaiq4vv5URDsb
	1yuqyw+aW1ySE/NHSyi6s7tb9XF40SndhC0T7Ve2hZlJHMvAqxfAHXNHjOGA8EEG
	4qXj2DK7yQMMCJ59GDiU86tz4bmSlgSFyxBjaPL+Mvr/u9sHH2v3IbacCnRz7w5P
	GXbfA5Ba8eTz0hLCsdFLQ2qS5ErQ8C/NpKalYcAw0cFJeW4qFhgRYZqqpG3tOJM/
	QEBTsHWEoHWLZ6z9PA5BlrfC5LzQKOHKZJm1jTlL41WJjNFHK8XMGBooDx+RBenA
	klt1K9Ka0XKesaI9m7ZWdN5iW/8c2T8aPXa6UexTJAU5DZQKhcAADXoAdubfG+zG
	vg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gg0a80q1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 12:13:07 -0400 (EDT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93918756165so280016885a.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788538386; x=1789143186; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dz9vYhdfkr/TPCuaOD6quYTfPSbBDl29YSqczgESR3Y=;
        b=biKXLj4saGmc7yrqxN1oxLq/kdIo/hr6k4gG0iaKmGo7LCbBa8fWGlVr5vfQ7Hwoqu
         ETOr0f/mwnp2QUug+TlTWSoQHAMvTW3vMk4ZyZX8whiTig3t2RMg304UD3vObsnf5vRc
         n9UthXcHWA6U8i+UIZAm6x3AvQ90jqa/fquxuQWLZHwUSiagpc4c8VXm3qXvL6aUVoV4
         a5e1AQRwh5vhJOb88SkSe5WJcGFL3lXJLkLZSgsPxsqIgB0MW22fWmPWuVhbkROEFDI8
         FtMhTjsXtoVSQOl/+ll8cALDC+XVtUudzS0wkjhy2zfT21lw7aYU/dOipGBZHgdOeGzA
         Z9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788538386; x=1789143186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dz9vYhdfkr/TPCuaOD6quYTfPSbBDl29YSqczgESR3Y=;
        b=K6qXJfn1v96xsWlOPY99Dm+2oPprNLqL53ETbp+H7bQPRgcs3xi08luobyqiAhP2if
         lCV3fFWsN2WtpBgXP3KIEKo3eu+n0cL0+s3d0PjVXDq8ouHDiTUG3mzk7qhL5tACBOXn
         drRlpF2W/LspiQT8/XMFLZBaE5IDVknVh/FVUJhEACkfJ2eO/i11B/55XUeFtHBY57fS
         3riFmSb9Hk6/5o6tDsF5OQioB6ORABkNq4HAzj3OdXzt+nochs4073hudb3DnX9NUERY
         43Y4hHZxPThkOnaJ9+VKDDM/KFGE3hkTlJ3efFZCyUkgI2YNh3KPBdcRPXsE2TmLMwkE
         aHKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwH0gCJZnLVMGuSwZCbYpZf4Tf1uYI7aC6/10mJ+XngrQ+R3iU4Fd8GNciEd2sWosDOYJ3+2AUbL4n74qA=@vger.kernel.org
X-Gm-Message-State: AFuF++n6R3TlS0FyEkrGgq6QwzpNcJE0v3XEpuhrC/IBrUs30vaiHjPi
	1l1MRjQu0G0YesnnJIWB4YRvksxLvmVzTHjwOCLmM9khG4SYjuCbapV8BtRceMBcPe+U/j+5bvd
	Mwb7X52pFNfwpgaT8wn7uyq2yjls+dP8dT5qeVoYpc+XKcoPz/WD8w+2DfeDn+g==
X-Gm-Gg: AYBFou2h7YzTzr+h2H/snGdlB7Gz/qvKHM3pULUewg0hgYEDk+KoiXDvMqoDGCH8jXm
	Qq5hd4R8hVzA1g05WxCjn0f9+lMIek/R3nqQCvqRnra0i48GBdTzacrxq8Lia3GbwdApeVOXyb2
	2Qkkm1PfjvYZC76gJmwidnJGdmTlMm+et/Ix+N4/LrblyPhW460py/G/+9+bU0znKldWnUqS3fZ
	k82SXDqiEOskeDLBfJu+EoqUQUqZXupCJMRLn/6OgyAox+y9DPv3p3lwpPxJi/+pQXtVQL5fSNA
	iE7dr1SVL0BKhHeVCcAo0CaXN5/7MkaWE+9c0/R4RLqu5yLdoLFxM8JTteENoZ/NKZJMgjv6Goa
	Mh+Kofcbb7R16BEBSTlr9yxI08JlG+DMidSyJKHsq8tXiJlqk
X-Received: by 2002:a05:620a:1a12:b0:939:57ca:7e0a with SMTP id af79cd13be357-939802f2eb5mr704995985a.7.1788538380934;
        Fri, 04 Sep 2026 09:13:00 -0700 (PDT)
X-Received: by 2002:a05:620a:1a12:b0:939:57ca:7e0a with SMTP id af79cd13be357-939802f2eb5mr704987485a.7.1788538380284;
        Fri, 04 Sep 2026 09:13:00 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-177-158.net.columbia.edu. [128.59.177.158])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fafbd99sm241625085a.7.2026.09.04.09.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:12:58 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Fri, 04 Sep 2026 12:12:38 -0400
Subject: [PATCH 1/2] ceph: fix writeback_count leak when a bounce page
 allocation fails
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-ceph-writeback-count-leak-v1-1-d41b070bac9b@columbia.edu>
References: <20260904-ceph-writeback-count-leak-v1-0-d41b070bac9b@columbia.edu>
In-Reply-To: <20260904-ceph-writeback-count-leak-v1-0-d41b070bac9b@columbia.edu>
To: Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>,
        Viacheslav Dubeyko <slava@dubeyko.com>,
        Milind Changire <mchangir@redhat.com>,
        Jeff Layton <jlayton@kernel.org>, Xiubo Li <xiubli@redhat.com>,
        Christian Brauner <brauner@kernel.org>
Cc: ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788538376; l=1796;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=HgT+KxvfjaddqNXFVkUtKH00CjJliL03d63DeMvCSSM=;
 b=4uDw3wmZBIHvepJLtO7dmYBt+aLMgbDTQesBy+KkR2tX8jiJai4QqJJhIELSRmBLt30RPEmix
 k7PDvtsf27HDY2vGnyuFronC/utpfhy+Tn+PlG4U58XEIEpttirSAUD
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE0NyBTYWx0ZWRfX70ShGfhl8OxX
 CvTs3o6y5oBQOyFPvfDqJFWlMGgEKPVk7/3U3Xt1tAu/iNev+AO2QlO63fnPrbgIlVXg4QQsz9d
 oZl8osGglGsMJ3jbVVBhc6jUWbTGpKUGdedYlfDTyVdz90rz0gHV
X-Proofpoint-GUID: ihVJuWewkpS3Q1LApfPFsOYxNoIjLVPh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE0NyBTYWx0ZWRfX09em00IJ0MFX
 2KzLgcV/r0F7myHCabPpQcPHo+/Yds6pgvsoJ1D/Gfykr5X0O55FiP0Jz4P1dmXGO3KrpN5PyNU
 h4uW7bCH4049QUVMy23h9bapQc8GVxDVqjWFzqQ3ajTlmCIm9KehlO99Fwn0z+7cd2quEgXq4pD
 aeLwAoBWw9dbwDT/eZ8PhTKKkaNZg1IKgOqTR3QbZnW+3BKeq5M6IdF/pZLdhkp5Twr4tongnpC
 a9c9cng1XNYHz2T00VaYEzdsFcOBWnxGX2mh/2P2skEKZwWiT8eat04mfYsEBus7Q9YsQngiRYL
 07nvnY77MIXVoa8yVL0fjwjTFeoUXIU3dPfdXlz5tMGOiaYTJR1dIB+cCp/sPN6UOddD2dosXN4
 LvlG2jRHlTHO3atyC5c+otxZIEIWcUuY25LeI439c2OtQbV69+A7AAqy/snAF6X5zV2fDaMWmsa
 ickZZbe4ndMmnnHOcFw==
X-Proofpoint-ORIG-GUID: ihVJuWewkpS3Q1LApfPFsOYxNoIjLVPh
X-Authority-Analysis: v=2.4 cv=MZpcfZ/f c=1 sm=1 tr=0 ts=6a9aee13 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=tLges04aSNaZGVAfhBIy2A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=usPcmh10W0ubT8QP8_c3:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=Ga7MZtB6ZCvbnmRj4ugA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11895
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 spamscore=0 malwarescore=0 phishscore=0 impostorscore=10
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040147

ceph_process_folio_batch() calls is_write_congestion_happened(), which
increments fsc->writeback_count, before calling
move_dirty_folio_in_page_array(). If the fscrypt bounce page allocation
there fails, the folio is redirtied and never makes it into the page
array, but the count is never dropped.

write_congested is only cleared when a decrement falls below
CONGESTION_OFF_THRESH, so the leaked counts set congestion early and
eventually leave write_congested set for good. Every WB_SYNC_NONE
writeback then returns 0 and background writeback stops entirely.

Bump the count only once the folio is in the page array.

Fixes: d55207717ded ("ceph: add encryption support to writepage and writepages")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260902-remove-wait-on-page-writeback-v5-0-0b512e77e75b%40columbia.edu?part=1
Assisted-by: Claude:fable-5.1
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/ceph/addr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index f1404664c97a..69f2c4c8498a 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -1457,8 +1457,6 @@ void ceph_process_folio_batch(struct address_space *mapping,
 		boutc(cl, "%llx.%llx will write folio %p idx %lu\n",
 		      ceph_vinop(inode), folio, folio->index);
 
-		fsc->write_congested = is_write_congestion_happened(fsc);
-
 		rc = move_dirty_folio_in_page_array(mapping, wbc, ceph_wbc,
 				folio);
 		if (rc) {
@@ -1471,6 +1469,8 @@ void ceph_process_folio_batch(struct address_space *mapping,
 			break;
 		}
 
+		fsc->write_congested = is_write_congestion_happened(fsc);
+
 		ceph_wbc->fbatch.folios[i] = NULL;
 		ceph_wbc->len += folio_size(folio);
 	}

-- 
2.39.5

