Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793711885;
	b=R8k9DAHisuW3rDRohW7eK2ER29/LRnhQFl32US95ou9VBIBln8P1jv539b7gsqCAjAXP
	 u2sLDH5UBQBlFxcJwys5A/i8vi+QC1FVwzmZfz/r/wtEkji3OWeyXxmbsQuCx4nJC3uv8
	 eISo+xfYCAf1wBzNcrxWvmXuBGI1W8o1Yw8E4gr6l5ogM+bpRIpz94TyJfD6swpDKCBrs
	 ZnE/pT9/F15hwQ1VB0f12Zwtrfg/MTkde8fdA0VBbgQ35BjJZyMCCSQu116xLKaCOX6Iz
	 usr+vXG2En5DuArMcW1mxioJ4/s9Ufmvw1UrXmfnqxNW7r7+Fd3v5yWJSlVBPE+kY0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793711885;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QcMkqJGjkszTyQdVq7R35F4GbKXXDIhqNMkkT+7uwYs=;
	b=EAu50krGMBYy4zWeFSj8qabRYe3xdGNcbLi2XFd51oLiPqiBkP7G46gRfCxdxOEwu38a
	 8ZQHRlvmG9/GKwVh607814VDz16CAm+vI7nqtUpo2WCPuWnbxnYwQCYLMRgtQYWadv3qC
	 AyPG44cpAo7GMdlIHxj8ET6pVi63F8p5kCbPc7V0nJfRzlD6rvU2l79JdeljtgDSGu4V2
	 ly8pRz8hFJHifH7TeAgI1FhnyBibwbxEPFPdV7OoarREa72jkxA6wBWTXlhGdYLndJKxk
	 v9Kj/uo/WNRHEU7KnGdplzadjK6IgecHaUdTfVkdRNMKvc7L0QBp+bD2ZfdkIcGgsGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=lOtsduXV;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=OiNd8OLE;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442876083613
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 442876083613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=lOtsduXV;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=OiNd8OLE
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3BIkcc3444723
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 08:18:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=QcMk
	qJGjkszTyQdVq7R35F4GbKXXDIhqNMkkT+7uwYs=; b=lOtsduXVFUSdlANRr6bH
	DLyJ2ghCjKBa1lBxhvbjz83R8YrrnRtFlkhiV0AFHb3lzwYe94lI4By5BWxQIXAK
	jiJAWOXOTHfHQnHOi+3L+eHGqgtOCZrGENwr8o5zCPkHmt7I22tMc0pb0MZaVqrD
	Gf7BXrWRCnPcP9M41El4O/bCdWvzyDXmjetubkXltB7einguWRfE8TQt5i8Au3mg
	v2FjBkXbeqd/+mnvByhlPWRD1Y91eOZcaYV24ticJKOBanPAgTrrozEbUpJYZPXt
	wtBL6ZP7/Zxg0ZVRdcBzSlch5PHFj9lxCzWbDQgCT1LhdZrKLKngXWNwCpUKPao1
	CQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hqem8rrv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:18:04 -0500 (EST)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb71b1443so861463785a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793711883; x=1794316683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QcMkqJGjkszTyQdVq7R35F4GbKXXDIhqNMkkT+7uwYs=;
        b=OiNd8OLE83Mtjs1EwOtstfHW3U10X0FDJHBiAvRkq2Kb6jOSZVXWqcIkjllsMKST1a
         a+GHyiVIbcg4beVpEmmX23dRlNfuYyHPv6g2f7lT2e649L23XqyAUkYBRgE4pMCq7KOa
         hm3ZmyEB83uq83BQYxxykYmm6akiXJLuLNnRuQOIhOz6cFjyE3QwmkLjXGcML5LgPq6B
         umoKm5R+4N2DKK2sQBI3l6JvSGAdsjRvh2IaSTyKPK4hyospybpV7gEUD0nt6jWHOjTO
         YSgMKjlARAJIJ3iCD7h8lELMeJYm/AxGl5dzP902JQ3M+uaB2KVTbQoKec2mOZ01dcc6
         sXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793711883; x=1794316683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QcMkqJGjkszTyQdVq7R35F4GbKXXDIhqNMkkT+7uwYs=;
        b=hMwCXlPa57cmCgXedJnzyaZiigD4GFGgGt54JJ2jmiMBOgCnzYYpTmWhec7Y0mWzdE
         f4AMHxxoeUvjmEQrEUB9C3HOfmDRw6Yg9rHweXKSBqufbV3ErV65XGVgfezZdat2Baih
         qJsTGJVmXOaPl86slTId6PwK+1x6Ue/dp+wd6RjIahhfAxn78lyyDtwbjFC++hWLO6wL
         J2/agXFYyGVLyyenG8J1kKV9v7PtNdepBNbLJHwDYr5QPcEWmXx+aBtmhF1wIx5VUDmG
         BwzLUFieZucL+59kSyXR6bqaE+w7ijnXqqYP4QubuusW0DGz+U2/g/HvXJK7dx0LZXqJ
         LDCA==
X-Forwarded-Encrypted: i=1; AKwUvBwmPSHD1xVTBDT8wg1IgM6zQfPPK9Ql26Jkbab/aWoFXsFEpDF+Mk17940pTe6i086OIN2P11dlKenI11w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/d1NkOa0GqNteqtKk0JTDsnn+FFlq/3lk8gTLRD+93r7Nokk28
	88ioqYff/XiMPGCalHuBFuEbuTlI8u+Cy5rIEBrMDq5RhRbaUwNluM4y5nKZ6HWEptaU7dySVaK
	LDaIKN2Uvv9OlaA3sQrAdiGCKPCE2IsNS3qSMOxDVlJSRTMRbGY6jD1W+D2HdzXSMuFrlaA==
X-Gm-Gg: AYBFou1VEnwL7NnMq6aR8yWiHjlOduX0X7a13v/nCZjeGnRB8sX9cr/jY8e9O49yd1X
	fuJTetlxEfSVS57gmJQN9QoRyra5VYlSebcsDlQJjWmIrnlsstO0VGI4M2gRxG07Uavgk3nfDft
	s7T0IskJ36sNShYMxLVl2jMLvnUqu6NmWsTrrlYrhe/Sx0SZvfZf0RUzzw/3EEHj1duR3ERFFsg
	DHs2n6ocOuIgN/mYFmRsYr62GT6c8i3Kvl5U0HVCWcTx5cE0sKDMEL3RPSldcjfnbGJ3Ku9NYwa
	iBPTnBgv3QAotpKCN8yXjPQf1aPykVMkc3yfxZotfGPGRpnDllsJzhXc1G3s0pT6B+xqu/yF0X/
	ajZRZardtt2dsWiZROSHOoKpRF6+9lh0bSg52hSJ+/J/bRaIGZEBNYEn5kT0=
X-Received: by 2002:a05:620a:2987:b0:93e:a8c5:132f with SMTP id af79cd13be357-94421744f15mr2158234185a.29.1793711883443;
        Tue, 03 Nov 2026 05:18:03 -0800 (PST)
X-Received: by 2002:a05:620a:2987:b0:93e:a8c5:132f with SMTP id af79cd13be357-94421744f15mr2158229985a.29.1793711883021;
        Tue, 03 Nov 2026 05:18:03 -0800 (PST)
Received: from [127.0.1.1] ([37.142.147.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa5781c9sm62076885e9.8.2026.11.03.05.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:18:02 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 03 Nov 2026 08:17:12 -0500
Subject: [PATCH 14/16] squashfs: use folio_pos() and squashfs_block_bytes()
 in squashfs_read_folio()
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
Message-Id: <20261103-squashfs-folio-v1-14-7b0fd4d20882@columbia.edu>
References: <20261103-squashfs-folio-v1-0-7b0fd4d20882@columbia.edu>
In-Reply-To: <20261103-squashfs-folio-v1-0-7b0fd4d20882@columbia.edu>
To: Phillip Lougher <phillip@squashfs.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-kernel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793711849; l=1619;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=KvXYbXIl1bitI56u4IygcTLa1kTzn+LCpLW0mwHWXOk=;
 b=CzYGAlt5UsoHAvV94EF5/Xe3vvOXbE0+Ml8MhU+z2uq8coxS9ReCnEF7o1fObecVqiG07QPyv
 246Vat1fIBcD5YXGwGK6+aGh08eu9zgI8TYYgMkIDYdU97oDdMweD/v
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfX8GT1Y/VuClaC
 gFj77p6z2qpm6GrzSOKgbFgpsidt2CyqAoQUMUggodB2vVnRFeoicZ5Ab0cPE3+sbSIIMJcLEly
 oSnAQ06xutuUFbsO1klSNYJ7qBE6Plp4GVA3DAxRB1G6hgRvhtEp
X-Authority-Analysis: v=2.4 cv=VYdir1p9 c=1 sm=1 tr=0 ts=6ae9df0c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6RgaMXXTExC6Yw++yBnrug==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=9xQ-cJTzETJqhcJ4HlwA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 2DnC8hY3FacDeskpzQoyhntB1_eD1Q2T
X-Proofpoint-GUID: 2DnC8hY3FacDeskpzQoyhntB1_eD1Q2T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfXz+o/kJxVHJfo
 aFShwCCLIKpGmWoeFjKmuwqfNAb73xgCHiCaFHN1JYs/OrYiWAA8L8LZ2QnyXdMbq+LtrfInOHC
 OU7zRLXmsKf4gKxBQMQF/gz2efYVIRDrtxtWG6g+5bddiEuDGpan96WDDQU1MwQbcZsbM6CVvMI
 J5tBzKj/Ub2qtIoe8Sy+kbgyMy2qS8j1iM0zP6hE3K0+NzBXAEPhvRxGzqxUWYFwC/XKPefMx0n
 eHply5anvWvhgnxJ0tAowmfueapKn0Z31h9ncExyWHphKr4pqFbbthd1IVtCLoCVIGQ0C2llSvZ
 T0YLyjFv0cSy88MFjZkh/dKF+8m98xUWxxskcrhjx9xZn7P4iyeyHVQczrHTZYJqeO+uqXAa96x
 aTpsIksMbRLKNuAa/wJXzYMb7i/59Pm97ufiCBpf1hgt73b+MWWiKb9MJ4uI3svXPGUqCk3urNs
 Kj4Hoa9pYohbeW+u/ew==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11954
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 lowpriorityscore=10 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=10 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030052

Compute the block index and the EOF check from folio_pos(), and get
the number of bytes in the block from squashfs_block_bytes() rather
than open-coding it. Keep the block index and file_end in u64, which is
what squashfs_block_bytes() takes, so its comparison doesn't mix a
truncated index with an untruncated one.

No functional change.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/squashfs/file.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
index abefe9c3cbaa..a6ca783c5e04 100644
--- a/fs/squashfs/file.c
+++ b/fs/squashfs/file.c
@@ -476,18 +476,15 @@ static int squashfs_read_folio(struct file *file, struct folio *folio)
 {
 	struct inode *inode = folio->mapping->host;
 	struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
-	int index = folio->index >> (msblk->block_log - PAGE_SHIFT);
-	int file_end = i_size_read(inode) >> msblk->block_log;
-	int expected = index == file_end ?
-			(i_size_read(inode) & (msblk->block_size - 1)) :
-			 msblk->block_size;
+	u64 index = folio_pos(folio) >> msblk->block_log;
+	u64 file_end = i_size_read(inode) >> msblk->block_log;
+	int expected = squashfs_block_bytes(inode, index);
 	int res = 0;
 
 	TRACE("Entered squashfs_readpage, page index %lx, start block %llx\n",
 				folio->index, squashfs_i(inode)->start);
 
-	if (folio->index >= ((i_size_read(inode) + PAGE_SIZE - 1) >>
-					PAGE_SHIFT))
+	if (folio_pos(folio) >= i_size_read(inode))
 		goto out;
 
 	if (index < file_end || squashfs_i(inode)->fragment_block ==

-- 
2.39.5

