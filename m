Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4114B66D3
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791825486; cv=none; b=JIgoGn4MqX/h5vNtsYl57FwwhCU1oys7mCF5RDLyGvaRe0OhY5PuIr1ajnBcYo8TKl37UypsI7QLYYLw5dOUrVtrfQYYJ+S+4QKLfoL62Rm+d+JSIXNSuxkKR+v4ZgoBsYYQlP+xF+/7aSN15rjaXIdFEM52VGGIea8tT0wHw8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791825486; c=relaxed/simple;
	bh=q4uoRFSF58GpRp3uOtRFOwVzT/xHulFohw37lU8PDrg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lBGHWIiwKw9nXG2BjuQIxvk7ZNBVMnEiintrfELcTifP2WWMrdcHINt9sGjaIwB5z7Ii7GPFC//0fQWFviJmumo8I3MFjYkA8Q1fUViYaTiO2SCpDqxc4TF83ZcjmCfK3R4Q9z4Jh4pWsqss+ULfG6zMUYe9BQ4tzPJK5DoDFW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Oxc+dy98; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=3tzUSwnD; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Oxc+dy98";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="3tzUSwnD"
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CGcE1A1160331
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:18:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=Cj4I
	PCNzq2NySFVKs4csvRqiTj50jw4uLChrhjAwWmU=; b=Oxc+dy98buPUjNc6rtmM
	vQV0bbTnvTyCrC4Y/Bo58nfwImwsxUGgAKOv5a4F7iob+fwaSS46hFEoE+IM3I5k
	OgH4y9BSVzLYpI0PEc/bXn6LAF7L3kEPz8vmB6vB0nr1UvwpfvvryzCUmwmCiUMA
	sOYcLrHPdT0z+AVMy8X386JIDIqbmSLUxfFX5scovrVuZ5Ls7IT8Ac2wQCbrLUC5
	1ab+tQTOSH5fr5Bm6nRgU5FD9J6/e4uH0k6lQV6tWSt+Ccsg82fYwV196Y2l5i6W
	TtTVJR07Iyb9ai4XQB7WSucyct6KZ0Jlc0R3TNGEU07gZ+dVPNCdi1qwV+DovaFE
	oA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4h91sy9fcv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:18:03 -0400 (EDT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5339739b343so47504151cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1791825482; x=1792430282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cj4IPCNzq2NySFVKs4csvRqiTj50jw4uLChrhjAwWmU=;
        b=3tzUSwnDKqkw56noT4Uwe6M1eeipR4FPN0H2vOlkfqXr3T3POVTKZWpWtRQi4Mzfyk
         uUjt2PvCUYn7+15iCYkstFGU5iDCKiLhYVwUsMZrfTt7m2nOxovHUAIsgdtWWf/VLv6T
         sMFDvLsM/cZUQu1ihlBIWkIlwCNGHJXpQrvHk5ro0HAMGfx14F2lNV8N9haEWds2aXBi
         X8pydQx2lksGvk7cqCJ/ju9hVrB7iBV2K2pz+nWZDaFXmIYY3k/nSERqgYqL2R81TDZe
         pyTuxtHVT9n6b0htYrqOzQaqeSm3g6G7/t3uQx++VxLtt4uxMXLIkSrJekhzFIJsa2Ti
         rqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791825482; x=1792430282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cj4IPCNzq2NySFVKs4csvRqiTj50jw4uLChrhjAwWmU=;
        b=Zo3SB23Nd5+wWtURZkGxO4g6ui+jutN82GVywBxW6Af3E4m2b5QOJeU+FZznOjvVdx
         SB2K4wTyt60OmGelOqIFw3IK0MK491K868Cnc/G4PDsgLQdjpvwBXbShjgoZRyap6tyP
         eeLVrR4iu1IJYOb7q+iLV2QNksBJPYHN5OuMUf4Q49p0xuvll4MQhtVoSO8OsOg18YOH
         EvbQoJw/hxQBD5H78T8KgdNic5hVssfI16oaHYLDD3pXswJYdywZunjlGW4gaov1McQ9
         fPt5kmRPn/m3W471uMylPxNn2kU43UsiZCfAqJ7nPe9ZWUhrTCbgRziPY0dqls/M2z9z
         rDDg==
X-Forwarded-Encrypted: i=1; AKwUvBze6/enQ7OS+tP5ZY/+nKS3tPD3iLYF96lcNop7QCUZL2OJ/b5VG+mdPRRC/8o2lg0nS5ElcNWYQ9H8p64=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOCbMPZ854tEjjGi4nbgn75ZvRSGoAyeD/AY8riOaCTGDEwI1Z
	4oWrtOK+j8Y3Iye0+i/2F37LKA4JKKUDqMf8heNlhAXmFFF3NMUAzpRfFdNN1Wfr22guKTiWbPo
	DBFDXeGFgqPgoJmJfJxhW7qKBYYogL3nLIhNXEv+4tCCW5YwvN6NjuJBEAB4/8g==
X-Gm-Gg: AYBFou0v2xECB0zwFidFjDVkIjXQAfK+tGLaJqGezPcuenG9Q9irUjrqojIeGTIuxzH
	9qYAAhs7oHzCtd8CyDM4SO5uIIAO7uaEUiSqE0dNI/0uFXiFfyaU2GmAf3V0PzBQRZNIMa3/SOI
	8BUC5Ps/4rBl7UbB3+6hzL23DM4WMikELp+RyxhGnINLGMGYU+8fxg8jU+7FjxUFAdNuYWIvxVR
	j1IrW2nC4Xa646xWkC+aBVTd1iTn2avt6RG1q3k8jTRQEqK1BtZUlWDgHtF0zSt1h0dIctKCXPQ
	kQ7Mp0GtR9cnKKncBx8nYE66ideK1mdW6Er35/PCy6B80bWy7kRoAiIBLZXef9VUHpyfXYEf8WP
	06uT4ZM+B1OQovpZ57Mi6B2zCx2R8c3ltdyuFE6zUCW+5hgU=
X-Received: by 2002:a05:622a:4c08:b0:530:42d4:4c9a with SMTP id d75a77b69052e-5359fdaa13bmr173319641cf.44.1791825482523;
        Mon, 12 Oct 2026 10:18:02 -0700 (PDT)
X-Received: by 2002:a05:622a:4c08:b0:530:42d4:4c9a with SMTP id d75a77b69052e-5359fdaa13bmr173319151cf.44.1791825481943;
        Mon, 12 Oct 2026 10:18:01 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-231.net.columbia.edu. [128.59.178.231])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b79a186sm84105241cf.20.2026.10.12.10.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 10:18:00 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 12 Oct 2026 13:17:42 -0400
Subject: [PATCH RFC v2 3/3] ext4: don't advertise atomic writes for DAX
 inodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-ext4-atomic-no-fallback-v2-3-c4b30c60e500@columbia.edu>
References: <20261012-ext4-atomic-no-fallback-v2-0-c4b30c60e500@columbia.edu>
In-Reply-To: <20261012-ext4-atomic-no-fallback-v2-0-c4b30c60e500@columbia.edu>
To: Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>,
        Baokun Li <libaokun@linux.alibaba.com>, Jan Kara <jack@suse.cz>,
        Ojaswin Mujoo <ojaswin@linux.ibm.com>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Zhang Yi <yi.zhang@huawei.com>, Christoph Hellwig <hch@lst.de>,
        John Garry <john.garry@linux.dev>,
        "Darrick J. Wong" <djwong@kernel.org>
Cc: linux-block@vger.kernel.org, linux-ext4@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791825472; l=1770;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=q4uoRFSF58GpRp3uOtRFOwVzT/xHulFohw37lU8PDrg=;
 b=pqzdVoU82abKus8NPYExlPZk+xRiblaHpuqxXj3zR0h7FSfEWr1BnScVZYp/JL9utwUifR43m
 YWekI+OTEm8CCnnwq9uzdboC0VgpA7Oz4uMdlb7Yyv9RQTImG5F4KwO
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2OCBTYWx0ZWRfX6ctGwyinzKe3
 VF2Ud1DITZoXbMix4khGL7HyUXyrIce1KBHaMc2Bi6VY+Dabji3Ogu6ix4A1l9NnWZAMDqAoi4t
 HkdJmfmEsFCmydhDZy2o73IKkAW1fSWLl00th6JiEfuvuhiohkp7
X-Authority-Analysis: v=2.4 cv=JMSuIMKb c=1 sm=1 tr=0 ts=6acd164b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=9fnr1hFzp71kSIFw8uYQYA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=WDUyjk1rXllw49Jjrx8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: _0lqLcOgqNtqqCOlAWo54iE9P9JWgRq-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2OCBTYWx0ZWRfX80noRcnIoPME
 5vCtA/TJpEKkj0A0zSu5tYjz8wBTjn/LyIbf3OheJ0s071xumubXSF7rYPqXVobE/4BC2sgGaVd
 Et3/LCVEnJbDeM7oJLDHgLqA1gWlYb3zrlpAx1v/UsmvVntivno8wiVU7T8jPpQhVP1Ob94cBTU
 6G9V3xNuijRjXOYdvOebc/zQBRWD32vdxpxplAJYmXUOxoBzMBIYti+85PeMRb7qF6t1QSe7BLT
 9Mk93ArjdMTR2My4q+otUVHBQZuBWJQpHLAlzHdZFIrSeUxZaHK/HS5a6CWVV8SWb949pML9Py/
 SrYV8Yxhz8UxjVCjYt+jgvWQpMPTmGMcSSp+NsX/ess6MRDntuJybqqo1vp0PuwVnIbWjm6tuHQ
 48HIwmv8TR1KYmqoUehGaQJmjDCIRi+KH4WjIebIk5TL949P4G5kDN1/yff//8oer/AwfUhIge+
 zR4xwx7Dc532AP5MYoA==
X-Proofpoint-ORIG-GUID: _0lqLcOgqNtqqCOlAWo54iE9P9JWgRq-
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11933
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=10 lowpriorityscore=10 adultscore=0 bulkscore=10 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120068

ext4_file_write_iter() hands DAX inodes to ext4_dax_write_iter() before
any of the atomic write handling, and the DAX path neither checks
IOCB_ATOMIC nor provides torn-write protection.
ext4_inode_can_atomic_write() doesn't exclude DAX inodes, so on a device
that supported both DAX and atomic writes, statx() would advertise
atomic writes for such an inode and the VFS would let an RWF_ATOMIC
write through to a plain DAX write.

No DAX-capable block device advertises atomic write limits today, so
this isn't reachable. When XFS gained its corresponding check, Ritesh
Harjani suggested excluding DAX inodes in ext4 anyway [1], so that what
is advertised matches what the write path can do. XFS does the same in
xfs_inode_can_hw_atomic_write() and xfs_inode_can_sw_atomic_write().

Link: https://lore.kernel.org/linux-ext4/87a54e4cdn.fsf@gmail.com/ [1]
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/ext4/ext4.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 5115f067a9f5..1520baf581b6 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -4060,12 +4060,13 @@ static inline int ext4_buffer_uptodate(struct buffer_head *bh)
 /*
  * Atomic writes are only supported through direct I/O, so an inode that
  * can't do direct I/O at all (journaled data, inline data, verity) can't do
- * atomic writes either.
+ * atomic writes either. DAX inodes bypass the direct I/O path entirely.
  */
 static inline bool ext4_inode_can_atomic_write(struct inode *inode)
 {
 
 	return S_ISREG(inode->i_mode) &&
+		!IS_DAX(inode) &&
 		ext4_test_inode_flag(inode, EXT4_INODE_EXTENTS) &&
 		EXT4_SB(inode->i_sb)->s_awu_min > 0 &&
 		ext4_dio_alignment(inode) != 0;

-- 
2.39.5

