Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832DD3E40EB
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 11:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.180.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791284836; cv=none; b=ED6OAIP3Yo/ha0iuNh9WKQgWz3r4M2XerNS3o6tBXXYrrkzP8Rs0KROzcFo/EtDN4pgf9LEgwKxSNizurEjwqtOOs3z3mP0uZylnaDB9CRQCQWKFUY/3mvcw8xsk2S5Qej7Qj2PAA6PYtXvt4yYbj1m/Uz2jPkn9jYqPOf60ZSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791284836; c=relaxed/simple;
	bh=3nhZfXo5heb41pnfB1a8sdD8K7IduU1fbMVXZcm/0IM=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=ggsNguBPfA6CVBe6WkmQjIYVyUqFmWHTbHDMAg2pc5b3r5SJciQpkF70agI+VSxKyK6Y98yrRLa7MaCd4TDURhk3dqyeEi6JR/u2wzvQkrtZ6M4eysOsoVqeKNFHN83hXXYpEcm+YIGpTg4UJtytZII8yefpWwpw8tCx9h7qzuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=PD7kWjoh; arc=none smtp.client-ip=185.132.180.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="PD7kWjoh"
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696A6F0i1789230;
	Tue, 6 Oct 2026 12:06:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=dk201812; bh=BHeFL0547uIwcPh6b59O/21
	1jEa2gY7m7J42DWOkKu8=; b=PD7kWjohYJTSbjRW6tfOj1C+HyJ10vSprkemDiv
	vbYh4mvH1lOrh5rsorOTunRnOjcQuUybECq5nGSb/1EzioYaYUmgoyklzFzFnJM/
	C9cIgcXeJ3Wth464WZqYRSLHvbTOFTcB0IJsuKCTJwgvbveBMgFDWsAJQnJMrZsI
	EsPuTvouqPk37OQJZ7obPZ0+jAv/I3iwC6RPDF2JouVZcSNh7tnnkcKqPXZEVyLu
	Wk1nEGxj2L0bhDdtejsc+ostNZeXgzlqsl20ELqQY3lC7nqQIiCJ+0pJrb1gIiIC
	+7eht2v6TMY8YpnOmMG53Wz5FrWBdO21x5OiC2Qb8Eylk7Q==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4h4brugugn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Oct 2026 12:06:52 +0100 (BST)
Received: from [127.0.1.1] (172.25.5.23) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 6 Oct
 2026 12:06:44 +0100
From: Alexandru Dadu <alexandru.dadu@imgtec.com>
Subject: [PATCH 0/2] drm/imagination: Miscellaneous improvements and
 utility functions
Date: Tue, 6 Oct 2026 14:06:36 +0300
Message-ID: <20261006-b4-utility-function-to-rw-regs-v1-0-a9faca685c4c@imgtec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADzWxGoC/yXN0QrCMAyF4VcZuTaQTlnVVxEvbM1mRDpJWjcZe
 3erXn5w+M8CxipscGwWUH6JyZgq3KaBeLukgVGu1dBS2zmiDsMOS5aH5Df2JcVc95hH1AmVB0P
 y3kfnt3sKB6iRp3Iv8+/gdP7bSrhzzN8qrOsHmDvLh4IAAAA=
X-Change-ID: 20261006-b4-utility-function-to-rw-regs-0777c17380b9
To: Alessio Belle <alessio.belle@imgtec.com>,
        Luigi Santivetti
	<luigi.santivetti@imgtec.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sarah Walker <sarah.walker@imgtec.com>,
        Donald Robson <donald.robson@imgtec.com>
CC: <imagination@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandru Dadu <alexandru.dadu@imgtec.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791284810; l=829;
 i=alexandru.dadu@imgtec.com; s=20260304; h=from:subject:message-id;
 bh=3nhZfXo5heb41pnfB1a8sdD8K7IduU1fbMVXZcm/0IM=;
 b=Cno7cnecRrhqkn3KC569JCdlvqrI87ptXYarc/t+k//gZirPTSvaNLyRHi1krNGkS30pCu1h5
 ZBmqj7oEheBCW2e1n2dBz4ibEeVnTtKBd7aQbG5IcSGCV0ZsYNbhIP0
X-Developer-Key: i=alexandru.dadu@imgtec.com; a=ed25519;
 pk=FU07SyNrYGwhahqSxbWEuzyXlUh47xBXvLvOR7UA6+U=
X-Authority-Analysis: v=2.4 cv=FNOOVOos c=1 sm=1 tr=0 ts=6ac4d64c cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=Vfs-8JXWiL0A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=wUyF9Ky_tyQg0tXWGVYA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0NCBTYWx0ZWRfX4zpLF9oZckwq
 jRrKkGrF1VOSW+4nD6qMvFHXJd8zd3s5P1O2jfiBTyEGqx7zv6SNcUGOuBjkRM0yH6LNJbeRqma
 bE6Z/nkd5wQT7D3UXGJm0SNudfsMCXA=
X-Proofpoint-ORIG-GUID: wLxU2x4XdHhjHRmvu4aPzRaae1MdVJ5S
X-Proofpoint-GUID: wLxU2x4XdHhjHRmvu4aPzRaae1MdVJ5S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0NCBTYWx0ZWRfXyS4PFd0QZ11d
 mYQarnfiWNOC0ywqyjfmMuzxR91GPAmYBujwe176pLlMW2g3S2oHA3SFeUVoi17qIjDFXIJtd4B
 XFbJMg8hcLKitLBBTrp/b6XIMkvmjPSot3rEe93SS2lOQ83FdGL7lOjN3t7Jk27YFUxxx5ktJ67
 GfWgsJsgeOhdwZj33xwsW9MDyYZy0aOQQ1EuUINLUju2dRWQn8aK/6a+hRSyqZ1UwFHUJ7JN05y
 Ur6muBmPuStW+ZFdglneRKIn/u+ts9SnAWIAcx+2tqp9Bo4KeONm3WCMmWvC36knWY5vd9NW2r/
 RYSvgUMJHLzqVw10BaT0fic1cDiVfLFr3ymk+vJZvb8VfJCrJQw+hqFRLl9ndSfdR23Yw4ie4jX
 cnUnQ0eh8OfA95OJhBxAY0zw+Mq2YtqHMO7AJrQJxtOMuhjmiMiVaC9MEjP1IKzr23osKv7Yzb+
 1uKpXYJd+hf76GhwilQ==

Code cleanup - wrong soft reset code removed from startup.
Utiity function - added function to write and read back registers.

Signed-off-by: Alexandru Dadu <alexandru.dadu@imgtec.com>
---
Alessio Belle (2):
      drm/imagination: Remove wrong soft reset code from GPU start sequence
      drm/imagination: Add utility function to write and read back register

 drivers/gpu/drm/imagination/pvr_device.h       | 28 +++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_fw_meta.c      |  5 ++--
 drivers/gpu/drm/imagination/pvr_fw_startstop.c | 37 +++++++-------------------
 3 files changed, 39 insertions(+), 31 deletions(-)
---
base-commit: 6e375de99d0c420169481fcd36064177ab55b09d
change-id: 20261006-b4-utility-function-to-rw-regs-0777c17380b9

Best regards,
--  
Alexandru Dadu <alexandru.dadu@imgtec.com>

