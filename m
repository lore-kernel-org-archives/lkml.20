Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794901592;
	b=1Jk70CoUKuBSN2VUbYsj0N9fpHXLD/JScmKPtRvzEL0IVzsULBWKUvkpYsORt3yZ99MG
	 e3qWx1efBoIUr0uE+CX1r56JicUYq6DgnNIz3IgYPKdd7cUnAWKjwfau5WVFM+DTxtSOw
	 gXht06ARZSVeHwZs7Dydr/LWQ/mz8chpvm7nWytg5u7ITzLhi2v959qB9S9rudJZu4ylg
	 P2E9Ykd8FnrYOIwrFctU+93FHCnhTBBC6etnUjI5imH6OvfqVXCwXhAeG06IUwhmZgzEd
	 J4CXZKA6O6LrS4H1dq2qdj3v0VH2N+erwzTRs9IGkKPjSKLAxsi5ljSfEmN0Ai9FJfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794901592;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WZc+/VLh+KD9epaQzIGRgWflK50EfOGmCzfwggbHQ5o=;
	b=g2RKN1G86gs362pssBnAZ1J5bglAKX2MBxb2iC7/VxHBURpDJvbtSYYd47trblxC1ocG
	 GOgF+bKcq8UCZWWVOI5/hGOP1zuIs4tTNZWOxJDLqe8Zi4qrNb1GEl+clb80tXRMd5fay
	 JoBu7JMwAclMIa2XhWrz08wPt4Gv7/blAMJrvtTrprnL4WGx/cXVm35eKg2CxtWw0Q2nt
	 vw7Or+Xl+itt+LOM4YhkmHZ2P7SO66c5FM2Uo0MN8acprYOowZHbHgOycNtquFqeEmI1U
	 fVVBIxAps26mOXD3gl3YZT4F0V116o+UPIllydFADfUQ08GqGHtREYLr0kKM28arA9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b="q/4x+X2A";
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=QvxERfII;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBA9606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:46:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BBA9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=q/4x+X2A;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=QvxERfII
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH7YWLU570067
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:46:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=WZc+/VLh+KD9epaQzIGRgWflK5
	0EfOGmCzfwggbHQ5o=; b=q/4x+X2A9jCg+jJR+cGD12JIosil2bPp9Ov2IqOofy
	CBrVDEK1HmOiTHlyqDIhqwTvc+jnAPr4hHHIfvgkwCM716BHCamG7Caz6N6kcjoT
	5asIJWFfWaf9drQ3r9phmANHLMfPYSYriBLgNbxbrOpKPxmHEZ/hUBMYDVLBG01O
	ZDNKXuwm9rXn82UIrzaBVODxiy50o4RRwe5/BAEpqHEUr3VmcFgZTBR8/YRRSmQ6
	vHO/JRJ7teOfuFeee7tpZSz6mnBiQs+Bq0Tqygvy3aSx17JWTbUZYqO5GXFoGODP
	d051E2h9BrZ3xu7f9VwvwUBooaj4hzQx5hHPrtByi0ig==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j0eb40sf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:46:30 -0500 (EST)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-55d3e7ba879so34791111cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794901589; x=1795506389; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WZc+/VLh+KD9epaQzIGRgWflK50EfOGmCzfwggbHQ5o=;
        b=QvxERfII5JfFe/4WjkuYzTF1Qhy1E84IX3HapJQxULZEcoFO/tZMEzs/8xX3mQnUUe
         /bRxQfJEkX3huMX3dlGt8loo3txKqrDB2fOY8ELfNESkw4ZAqxgXLFCcXH2KM+Bthjo4
         lRUVjkvRYnUTys55CxxEENNGnuUxU7bWywkzd9hiTuyJCs9HMsxl5TfHFOZx4as80TdY
         PBxItikyEyQ4UuMMUKyoWQp5YTN0c7WkmpfUuylhIWf3EGyjBVaL4y8wk3mBlP0xMEEk
         dXu9sSazFAl6ULGY8FYRc812xEbeomN0Pcge+Cl0s5wIXX2aXlh0WW7SV8lSfPXq69c2
         My7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794901589; x=1795506389;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WZc+/VLh+KD9epaQzIGRgWflK50EfOGmCzfwggbHQ5o=;
        b=L1/5J/1htPNe7JAxukBMCOHdM8j4ZNXuo0NyhaO3GcTDMtwT9/o9mJAA+0MiSlhneb
         Q0PJhjHKC+a0tqJKKLuKDRcR0VSm5+T59NWtyWUA5c9MOBDWczy5cDgbtz+SfEACno6N
         L5WWlkbkCZ3b8IopHyJ4oRMHcPoAStUbCboeNqVb03Fy1TnTjrYYiWFjpUKC3PFhqFqo
         97vN1P9D6PpTfvYbc2eHcSfSDzKi5EHvKL5cNC2IsatqypNnr8DlIRllvVrpwGdbyW2t
         duH1y1JYfm374/uTPipsMjBoejSM7nb4llBA3LkDM2O1E8cvfNUb2qM2IMW7Iv71ZSjz
         gqiA==
X-Forwarded-Encrypted: i=1; AL+hErEibGLDMPlmdZZ4WCUOol9V55miKtHxjV8RMqoqizX/fzDmpmUgWFws5CLDdQ/M8Vnst7fxydVuciK15NE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DlGToTMgIB0PKqhekWn2BDLwtEunolT2qg3jMyp/nOO60p5SA
	J4qouB7zRp+vltzOUyYeXwpUI5xzncoR3n6uMgIRlvbO3088pfI9c8udlltTCRjZcWllVxHvpYF
	yAfL2zw5w9kXFQ1AIdbqWVa6G6XGleox1L780qT9s4MP6SI13GOH4n6vijFd0Zg==
X-Gm-Gg: AYBFou0SKNUfEEdYjnBU86uXSjKVQTIAavuExeZqmMZzpfsaFBpGPvmCD8k0mv+qKm+
	YWoY6RoM3+MSfHfPOsaf3Ibj5uAkXzWaB2TElACG67EakjJW8mONIaJp2bNAX2zyJhC2ri5ngMW
	kZlUb1Vdoj9M3WIMp4OHrIkz07kJshZZqv2x2OPYzTuFJNG9VEk/S3XmfBKRBpyy3BSz0OxdWqb
	D9o/SxNbZYNSz+LvJOK/q6+W2GCyYERvKgf1n4/xROhV6Ch6OQh/FgW64rr6QIZTuS5CYyrR99B
	+oTSEUSkqEnFxlr6fENFkP1fR8BJXcUkYO8OWq5fMyx1Iiav7GTI7cU+mweholzk+vKCF57CFOb
	+pK/LqQ53iQpd48RK8tt88bRDnso2SvGpOwwNIEMaF0NidsNZrFq9bWi9UjrXGy+ey7jURoMBb/
	VCNXpV81LK8Woj4Hq6Gg==
X-Received: by 2002:ac8:6f13:0:b0:55d:3789:8c8e with SMTP id d75a77b69052e-55d37898ed8mr93778561cf.15.1794901589460;
        Mon, 16 Nov 2026 23:46:29 -0800 (PST)
X-Received: by 2002:ac8:6f13:0:b0:55d:3789:8c8e with SMTP id d75a77b69052e-55d37898ed8mr93778451cf.15.1794901589048;
        Mon, 16 Nov 2026 23:46:29 -0800 (PST)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db0f58sm105632286d6.39.2026.11.16.23.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:46:28 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH 0/3] gfs2: stop using struct page in the log code
Date: Tue, 17 Nov 2026 02:46:25 -0500
Message-Id: <20261117-gfs2-log-folio-v1-0-35db3db42e35@columbia.edu>
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
X-B4-Tracking: v=1; b=H4sIAFEG/GoC/yXMTQqDMBBA4avIrB1IQvyhVykuTJzEETEl04og3
 t20XX6L904QykwCj+qETDsLp61A1xX4edwiIU/FYJRptdIWYxCDa4oY0soJTWddb0PjveqgRK9
 MgY/f8Dn8LR+3kH9/L3BdNydZAQZyAAAA
X-Change-ID: 20261014-gfs2-log-folio-274b84f5cc07
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: gfs2@lists.linux.dev, linux-kernel@vger.kernel.org,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794901587; l=1803;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=tlhF4A7EMIMf6AAglL8ZpZxXbchaA9cld4o5Pjri+58=;
 b=DjO+3wYuNu0XJp9/o9HcDi4gqxeDxmHt7BUTgW7DFr/6WqSaIs9rIcj+qGMzuvR7vkJHBcyub
 JfTil81C+AlCVIVYbbaH8SVDSk7fAR4XcQd+uUqmdXgixHW98xS0d4s
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: MdfFtQ-t_0GTq4Ma_GBNp0fcwmidLtzZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX9Yjt7+tvfXyF
 qgGrI0npX6MttFrmLg0JQiTL7M6ZgDeGA+z9sn0xIGQ8+8gCZTM/ikvJ5zPuMX/WcVqJ9hQP+OZ
 fzK5XrhJjfSaK/NFHrbDrFERv60QLh+SKAbAQTVdxsgkUc1QeOt4
X-Authority-Analysis: v=2.4 cv=As57T+9P c=1 sm=1 tr=0 ts=6afc0656 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=zUfmlPF-26W2JwXOGS0A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: MdfFtQ-t_0GTq4Ma_GBNp0fcwmidLtzZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfXwu5tBnzQgyJW
 KieoZR27+cPOal9xy3jAkxHpOw3/zYeKMPGq1Wr3ASW4HmdkNmtWkQxbThJZ5EHrRhSO9fZG9vh
 B8UKztm4hPK7MVBy5kQXQNIrjO0LV4KGHX+9RgjX/i4eevu/38warlFATWLJgzPf86kppQ8+RGi
 WD9qugs5oCU+tJSdWam2EWWhq1IP16g4X1Is7P1rTuKgSXFYThUO5IE/R+fj+SnOFFblW/HdUAU
 VM1Gxd+f0R/sTHhI8p5xMO0Gr9zb8ZHHgrej+NQc1nxnPPua4fuv10zMewJ3sCimFfHAZ0vV119
 FTlOohcY8Q16NA4YXcflR3a5Aggz8j+szonPXW/GmlEGYi4eny0I3EZjxIn36rCQvR2FMn4KHxn
 tFClKZ6wzBxQbGdrDJNxaUkGT1ph5rBxmnFAgr4XXTMG2sJx4TFA8etxN1c1wgbPQS6Ztmle2r3
 nfrZbty48HEb2d/u8KA==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=10 spamscore=0 phishscore=0 suspectscore=0 impostorscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170029

This series gets rid of the remaining struct page usage in the gfs2 log
code.

The log headers, descriptors, revoke blocks, and escaped block copies
are allocated as pages from a mempool, and they end up in the same bios
as the page cache buffers being journaled. The completion handler then
calls page_folio() on every segment to figure out which kind it is
looking at. That won't work once memdescs land and those pool pages are
no longer folios.

Patch 1 moves these blocks over to a kmalloc mempool, with their own
bios and completion handler. As a result each descriptor block is now
submitted as its own bio, so patch 2 adds a plug around the log flush to
let the block layer merge them back together. Patch 3 cleans up the
leftover page references in the log code.

Tested with fio 4K write+fsync on gfs2 over virtio-blk and null_blk.
Without an I/O scheduler, patch 1 adds one write request per log flush
(196.7k to 229.5k for 32k fsyncs) and ~10 us to the p99.9 fsync latency
on null_blk (41 us to 51 us); the plug in patch 2 merges them and
restores both performance numbers to the baseline. With mq-deadline
nothing changes.

---
Tal Zussman (3):
      gfs2: stop using pages for log buffers
      gfs2: plug the log writes of a flush
      gfs2: remove the remaining page references in the log code

 fs/gfs2/bmap.h |   1 -
 fs/gfs2/log.c  |  19 ++---
 fs/gfs2/lops.c | 221 +++++++++++++++++++++++++++++++++++----------------------
 fs/gfs2/lops.h |   6 +-
 fs/gfs2/main.c |   8 +--
 fs/gfs2/util.c |   2 +-
 fs/gfs2/util.h |   2 +-
 7 files changed, 154 insertions(+), 105 deletions(-)
---
base-commit: e3280ea8b73964efb447f396fb09401a31373136
change-id: 20261014-gfs2-log-folio-274b84f5cc07

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

