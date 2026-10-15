Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F36C213E9C
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075410; cv=none; b=hp5+IDER6eVVmxSslRySpRNBnCGIN+QekzWl28zs1Xrc2E6Gd3eT0V/Fo8r/3JxVFgLXlGpnMoG4YOyINsn1KH4NtZVJHvty+4ACMPGkaZ4/GTzq1cZhMtJWHk3JupLjQk7qLd/uO6DLgCd1bMOVjHgGjPg9uKkdml8yq3VWlUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075410; c=relaxed/simple;
	bh=l1msu6fUGlXDLbzJuF3G7A0YIGm5a6dwtgDp6hECOck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Il3dwrhMLsf10HeHJKcQMlpbxtHEqO+Ue6U3iYKUAKv4/K6e0qqxyDbSztJthg6mnrX9vXTNvMBTZv9JuVrbrxI2Wm5vfqn9CynQmiorszoP5lS8rU92MXY9fEE0ZLqnAbNaKaifEqKmjt3XU8ILPtwpjLXTMmElTP+nzFxsekk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=fuO3v52g; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=ecx+IkK0; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="fuO3v52g";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="ecx+IkK0"
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FEYhZu856445
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:43:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=r+qM
	MTrVdByCKG2VkdcgIflOX2Lqg7MaKcwpptJUaBE=; b=fuO3v52gF2kAyaBD4OqH
	kF2yxgx8lgfNmnAp8fkiW4jSMcvFGHxHWU/4APrXFse7QN+jkDQC6IDScJDoFSvg
	FL4tFUWwHm2DVTO52SZKkYjMNoXoRXzetlFKlla/Chy/mZclS4sHF2ymi0LbRS3S
	jWHosz99sj6OuCuaY7a25ygij4MfwL9U1UlV4fOPeU4wznJdP83flU59QpVKHTNE
	gdhbRJm71XejNeGI2bOEWChqiw71BLaw6FcinesuzNBB1Ig5GT2dCCpqcKYPxP1w
	b2eMg7uPIghUHcrAXYCKS9OJAXu7tzuOFVtnpllmyrJ4QOEXzOPjifDoH2GGKGyI
	Ow==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hatthjc7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:43:28 -0400 (EDT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9196b477c4cso1214326d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792075408; x=1792680208; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r+qMMTrVdByCKG2VkdcgIflOX2Lqg7MaKcwpptJUaBE=;
        b=ecx+IkK0Y9MvSy6MZQpSXkrj85cBdtvtGiD+NoqVLZWEQ9ollhKTYpUjp+YygsDq02
         +3D2SnLK+P4C1V8SyVLFweiptuHvisK1U+P+DDVFuBjEswEyfwzMN/h6WBqdK7e4Za2w
         ObAKtkOltVQrZE/pqaKJzz0BcGefXEqpyFHFY7GnH8txzmvRM9DLZsYUri2cpQi2X6lg
         NmVqbxvRtm8M9xIdkmAbwynsbgZ5XELGpYuyHgp17Rb3tUfXZd3mnCMgDNcCiYXfGe2M
         SKm1rop5M5j38U5/Q6w22lEJax4sJekpFZJt1eiIiUQNYKN5yJdhUKAl639XkEUFCNT+
         5LaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075408; x=1792680208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r+qMMTrVdByCKG2VkdcgIflOX2Lqg7MaKcwpptJUaBE=;
        b=Apui/X/C+uWQ+S1BNzC1jYnEkEo+KFx6pv750/GHcZd6IFyexIaOgIEEP0+S9Rs5w/
         axdcRQrQ7LJSXjCFlnqbfQOPyFjep31VprSgSx3XLjD0kIxX1RUPHGrTywQ8YTCBUP9n
         OJzl8E058zjjoTzmvHfHh3SVRZQyGNtFi5FY71h6rVuAj2/sT9LYn86yk4zfRNrUm3co
         GOEy6xrRLk9mivWPGw7f8RO7iaLMECJ3AvfIf0uF3xpv3uKHdBVgIc5G4QSmAh4dYJo2
         RNU9R4Jn9IGOqTgBSKst2cNrjUnzhWDoFphpaQ0w72I//k5us0UP1pgpsqe4XpTFGHX+
         Ln6w==
X-Forwarded-Encrypted: i=1; AKwUvBwgCSPYnpdKWYRe5KPlmv2LHX+HSEl1bLscbVu38U4Xt781+I7+74GoKzuzMWsPeypvvtCoiAM1yVob82s=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrsq4Qovjs1JPLiX+ZYAGVEUeUiCObwuC50a32pFJsQ2prSvR7
	rW1MBMWzwbiojeMXSv4wPpBXNZfI4HTORbk1fyzozl1tQrS1AE3kxp6Ae+78cGd6Bksjp9pXn09
	MXMflqUfpgHUGA0i64hhe+UWF8ZbcLKrGT7wRzmdJAT+aae5LgXbgG+ZaSr3V0w==
X-Gm-Gg: AYBFou2RMNMMnz4xVtFxc+S84ToQpz3fwhxss3y3ecp5a1fImgacPhYccBHlC2weulC
	8rYuGGCkoxTrOqtn3crtVLGNSc/4zMtUmPmFaiZ0C3XG9r6V7VQ434iCoftBck26caUqvdHerwc
	DPUICRCPU8wf1HrInhVI2wZmZbmoT3B1bR50ZTtixO3FjuEhASwZ8XvAWyjrLKRYawGC2He7uas
	wYxA1Nj6J+Hv5fWlxKTN5KGVzg6jtO7H7q7lEHu1jAu3wseqJIjbFvcRHehLWkMMWBq/nnEfgUb
	MWjwJF8xgnT5SF3KisEO+iK42fcAAf2KTRAh18hpA2t4fVHJA4DKsrpftJOzfkGkoYpqX4vynYr
	9i0i5ft6lalB7zmNaKle7f9vWaix4uI8TtwykXuERDz0c
X-Received: by 2002:a05:6214:29ec:b0:919:5e97:76b7 with SMTP id 6a1803df08f44-91bc962cadcmr4703586d6.18.1792075407760;
        Thu, 15 Oct 2026 07:43:27 -0700 (PDT)
X-Received: by 2002:a05:6214:29ec:b0:919:5e97:76b7 with SMTP id 6a1803df08f44-91bc962cadcmr4703096d6.18.1792075407148;
        Thu, 15 Oct 2026 07:43:27 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-176-51.net.columbia.edu. [128.59.176.51])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b5f323sm83026476d6.20.2026.10.15.07.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:43:26 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 15 Oct 2026 10:43:14 -0400
Subject: [PATCH v5 01/19] btrfs: drop the extent maps of the written part
 of a failed ordered extent
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-btrfs-remove-v1-space-cache-v5-1-6b31347d9998@columbia.edu>
References: <20261015-btrfs-remove-v1-space-cache-v5-0-6b31347d9998@columbia.edu>
In-Reply-To: <20261015-btrfs-remove-v1-space-cache-v5-0-6b31347d9998@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792075404; l=1368;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=l1msu6fUGlXDLbzJuF3G7A0YIGm5a6dwtgDp6hECOck=;
 b=DMD8OvzP/ioXtpq5AhK9LPvKupQnfJP46F8KBx2gZrxrFCkp1/9rryjuvXVJdBAUjdyKc0Hbt
 gsUyAtAEO73Bm6rf2Wcb3sF2CBansT4yC7yQt35VOqMWrDLOD5ptOMC
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: QU_Ynb-av4NQArU1ipvdgtRqiHw7vLul
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX8C98fZJhZosf
 yBudyCecPwUIq4ZpekUcPRNaCDeSYz0SB86cLNEbYJPLegB01Ay/YDXjjCh62e1PmXPS8lopxDC
 Z/lkDWdPlINzpy8qDF9ioWf1XFKKD6IlgKvqmI0ZwuiiIw8G8RRD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfXwzEEpuTpLgsn
 RZgul1neZkSKAHfNRr1Fe3+ad/PpNsSp4nxfpxUsfXiJFQzaWHX0Mm8o/5ssw2luTMUpMjw1MXs
 TCzmmRjIszA5OYziITYUn+2Ko9C8TS31BeC+TpRoxoqdGtbCKTc5XSB62kbWYeuDUPtjQxlun2K
 z2iS4ryr2pXxC/TZcQSD6WQiFoTJOGyoMRKlzaVduc2wps+qgQA1peWYIQMTLoRudZZxZiW/9rh
 aBL2ivamApTwMkNQaZws/HKI6bdFiBliRWRVPIO14Yr0o3t6yE/Ht8nK1XIeV+TmPvJsdMf0PAs
 5oDR9EiN49bIYw34VwI+0VO3lcMA/GJBKYImdhsdMOLtG9SyQlCeXpQdw/BsMqv998h8XgKY4x0
 9pbclc0znTbzJ2069FhooquTIWj+Wt0Hk8zBjEVwq14+1872JqqCeQHjA4fPylIWDjqcB+BbL0N
 uAvdp8HiEoh+inRStGA==
X-Authority-Analysis: v=2.4 cv=WJvqzXsR c=1 sm=1 tr=0 ts=6ad0e690 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=NKoNGjn6KhAaSQkl0TXC/A==:17
 a=zFgV0_0DlQRWwMvk:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10
 a=A0y_DWxS2BwA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22
 a=Qm0qsxP7aFY2tkT6R2MF:22 a=IbTQtsteKuFIr66F210A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: QU_Ynb-av4NQArU1ipvdgtRqiHw7vLul
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11936
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=10 lowpriorityscore=10
 bulkscore=10 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150057

If a truncated ordered extent fails to complete, the extent maps for the
part that was written are kept while the extent itself is freed below.
A later read can follow them to blocks that have been reallocated.
Drop the maps for the whole range on error.

Fixes: 77cef2ec5484 ("Btrfs: allow partial ordered extent completion")
Assisted-by: LLM
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/inode.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index 343b6402bb35..271f6024b72b 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -3390,6 +3390,8 @@ int btrfs_finish_one_ordered(struct btrfs_ordered_extent *ordered_extent)
 
 		/*
 		 * Drop extent maps for the part of the extent we didn't write.
+		 * On error the written part is freed below as well, so drop
+		 * its maps too.
 		 *
 		 * We have an exception here for the free_space_inode, this is
 		 * because when we do btrfs_get_extent() on the free space inode
@@ -3405,7 +3407,7 @@ int btrfs_finish_one_ordered(struct btrfs_ordered_extent *ordered_extent)
 		if (!btrfs_is_free_space_inode(inode)) {
 			u64 unwritten_start = start;
 
-			if (truncated)
+			if (truncated && !ret)
 				unwritten_start += logical_len;
 
 			btrfs_drop_extent_map_range(inode, unwritten_start,

-- 
2.39.5

