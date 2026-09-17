Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA643A1E96
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789617654; cv=none; b=PMYfdV+8rfueQD4I8JGm99Xtyi6lyKgiOb9rDsCn9EGwiwC9bQ8kJLTchtbM8gvu1DwfeN4U2/VVBpdy03FuZiol47gqG1iy7gNaCiCmQDb94btpi3EpRTbb4D9GCI0rNbxLN0VK6kG1hod62reSWZ525C2n07Z+qqO08ySKqu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789617654; c=relaxed/simple;
	bh=ZPOc8twdoJYnvUc7fRjG1xN2c4tNuhM2PWHVMpPgEr4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RXnBepP4jsDV2+6xI7RW0BdF9mBGGNEcFx1TzwTL5CU/VXI9rv0BqnrqRaYRGvAQopmsuqM0EZDn35dFK2RGprOi9OSf1ou9aNQWXuqqux3yg82hLhl4rVEx9T8ViGnauUkodG7Df3s8BOhHrRuqAlzyPWmQOL1I+/aNnakl+Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=aP3XNQcb; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=V0V2/tE5; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="aP3XNQcb";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="V0V2/tE5"
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H2YAkv1938433
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:00:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=Z75e
	wDbISR2PJ+Wj16J7HvLLuCXx+W5s4xQMYYFw36Y=; b=aP3XNQcbiU5L9MmssMz5
	VAo4YbqpIV/7CYx3YsRhOjqQHScQoFK+6UMGybCQG7PzUWgrO0Y0g1+qfGN3DYps
	tsn3DrWWzxcJ+rMHdeFnQAoUFLSNA9F/wMbdauPOqEQqn8HP/spvejewV9Em5PuZ
	XPoddc58nGpFGnjlDevmOM70GlnkwMLhVK2va4BCkQcK9CBMtaolqo77tvhtNFUs
	wxTYGYiSGoKRp4eegXd+5Bvws5lhsa/0zd1ydVieR+d35gYLBr3DKBJ91PKENFuN
	tHvfQfcTeq+N+Ma/0EE/lMlG+bw6rftNEeXVIAmgphNRj2oucvBIENUwbtOhca6S
	6Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gr33qssf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:00:45 -0400 (EDT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90c8da50f8dso10673596d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1789617644; x=1790222444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z75ewDbISR2PJ+Wj16J7HvLLuCXx+W5s4xQMYYFw36Y=;
        b=V0V2/tE5I1mkmraAWtyOb0DtiS7fl9QFOGpQXF6GQrqATIufJBAl3IleLvbKWIpG+z
         d6FZdQkrJhpqtT63SdGoOGM4wsL3KSPI9+ONX87GcyEYryTQFxviNAVG7LiomHzFKw+q
         v+76kSW+JW217JoNRj7i7rb/5jd8GFRN4Oh/rxO0c2ldz4bLb0LLOimQCPxA9xoh7mhj
         YYsQjlVhjtu514waLeZT1B541GgSb6ZDwocU+ld2t44WX0uqjKRWm//36UI/k4fGOkkm
         k0mYGL/onQu8qFUTTzMfbYcdNEQf/O/ybAPeiwU/dh6pOFhweJRu3+OX9xuA2J6JxQQL
         jQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789617644; x=1790222444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z75ewDbISR2PJ+Wj16J7HvLLuCXx+W5s4xQMYYFw36Y=;
        b=esYHfSFUBJ5x5zwlRJAA33BKhc3wMrD+BObJOJQaUjyQ8mV1xDYXuhyyacaHr2PLJm
         bN3kqi0A1B9/N0giiWgvTLKj2oyjrfv+IqmY8wx/F6qZSU0zzpJBUhMj6v8N+V3bsYRu
         F2VNcyX4LZlW/ikNOG8dc29JdIYHlX/laxD3tSzar7/ZKuY7j3DACDyiwZtSowtO6aYy
         URVsHHzQQB+p9T+zCUVdpi81MjIQp4h1vtf/oELYrG1X0aTlhiwWRtwFaHZv0nxlbizL
         a4H+8gBf1mAzGOvkmMc0nJpAl87NWiNHXbMoj0aCIvRe1nlhRRYtJUfWh1W3iuIMGpWs
         8C3A==
X-Forwarded-Encrypted: i=1; AKwUvBybaAIiZBXBmIPvVBIfyGoKku9bTTwZYmZd+KY3NidYQh58xvG7B8YXdFC1Bpf4Th4nwo291TkoRCLf5Fk=@vger.kernel.org
X-Gm-Message-State: AFuF++lHfTFD0jwBSUl5zSoA/ryuqM1R/V8bceiy9k2CZRoaYqR5xASI
	/cWPAZEEukPcGGOpN93IODMLPRMfwnK0/1Gx3E422PZSIpWL40nGK0PQqHyUptoW+BUcSQoR53D
	kCmmYOvv0mno6oI+X0l8dlTXdc5nEeSgnQC56m9hvP7Wle6xnX+7qZvl78onopw5ZSuDfyg==
X-Gm-Gg: AYBFou0NzlaWkHr3qfIBmfK9SC1EFs42YuWjY5ozZQBgkr59Zy9qwgapZb3AHMEmsNk
	v2z0DrwWY4knwT9CcIEZT44IFSJ2xkdcwhzcJSspmDkV3jLDnvOdt6Giu9S/rnuSO5ukg0UeRY9
	9xYukThnVN3E5bC6mZAtjlwfbBM47UvALR451PPU7VseLWOA9zUl5OYF/SzIZ1+OHk/U3+s8+OR
	Fhq+bQmHiBsRsbngSD2JjvxiSTFV7KvaNH+YbDIbZS8OtE4p5DemlKVoZ3vSsvrsph+EkNXbsOA
	9zusZUokr0XQwmFQ9cLXucZZgLKTZ1GlFiyhcJEstEzrqkluhVkaGyJo+TP30gIzSLrxKqr9cF2
	ZJuvgMXDpj7fl2bO7IBUpweXsTyMgCDysFzdKyblTAotNfQ==
X-Received: by 2002:a05:6214:2d44:b0:912:35a6:3bc5 with SMTP id 6a1803df08f44-9123d7ad39amr105291196d6.22.1789617644295;
        Wed, 16 Sep 2026 21:00:44 -0700 (PDT)
X-Received: by 2002:a05:6214:2d44:b0:912:35a6:3bc5 with SMTP id 6a1803df08f44-9123d7ad39amr105290576d6.22.1789617643858;
        Wed, 16 Sep 2026 21:00:43 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123beadde6sm41748766d6.35.2026.09.16.21.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 21:00:43 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 17 Sep 2026 00:00:13 -0400
Subject: [PATCH v3 17/17] btrfs: remove TRANS_JOIN_NOLOCK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-btrfs-remove-v1-space-cache-v3-17-10ebde03b96f@columbia.edu>
References: <20260916-btrfs-remove-v1-space-cache-v3-0-10ebde03b96f@columbia.edu>
In-Reply-To: <20260916-btrfs-remove-v1-space-cache-v3-0-10ebde03b96f@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789617622; l=3141;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=ZPOc8twdoJYnvUc7fRjG1xN2c4tNuhM2PWHVMpPgEr4=;
 b=jfup3H0MxW0SR3BgpvfgxVCp/Fl6/Fw5j8+MGSE2EPYtLP6QaEDhbiYnINB44R0Qcz8djKYlZ
 yG7M0cHyO3UBYnZ3QWAeyHiEvhL8Pq8X8LQRqSzqkaudYn2Mz4KsXU7
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: GIKhMDLGk2ZON8v71lFvVNMdzVkFAac3
X-Proofpoint-ORIG-GUID: GIKhMDLGk2ZON8v71lFvVNMdzVkFAac3
X-Authority-Analysis: v=2.4 cv=O72sLx9W c=1 sm=1 tr=0 ts=6aab65ed cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=bdDZCe7T2lofFMgrKTwA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA0NyBTYWx0ZWRfX5iTp2wW6OmZc
 hq5afrxZXDOOsupOieSwpgHb0xxQUWEL/ilr8Vn6HNtAWm+qCdVpksp+BppErTK6S7IPmmasELs
 jzQMeIylBbyd+UnBBcoGyzhElm1W6Hc3GAJx/L9a5Pnh9+CaK8m/efM622xLakyf+TEufSPhADd
 PWRvYeBjaH07gjjmLyv9ZZ0Ko4v/I84qMl7lrMdernOzfEyNRk7q32JxFtbd+FqQiYFpET/R2Q3
 ZITE9XhBmWvbYNtsR5uIM/PBG0zZY7RAP9nU3QnY8sugb3B9AQB+kU4yK0b7Ex6b6a8EubhEtfx
 GHdLDSoiZvcQvlh/nIIg9XBiB/YD+xu/uojnRnhqmBlvf1ChyaFU5JYjK5GUIcz85u3T1zRX1Nq
 16jd54vTvKpNa7N+Ce0mwTWSyA7yDON86+paFy0iiIV1JrRHoLCKA4+hGsApHyiU567nFb5Pfsd
 vc9fW/+3IjVNHSdLJng==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA0NyBTYWx0ZWRfXwQdYP79/sWxB
 fZUUdK/IYHf0A10bPaWU90jVCVUNMxAW2addmZlZ4axFG7ShJyd5wAQvxRfGWZoDDc2M0C6s5+3
 WVddqv67EWvdKtzkpce61TqVk8hIAt5UTyoYLYyJzAU3zIy/N4Ad
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11907
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 spamscore=0 suspectscore=0 lowpriorityscore=10
 priorityscore=1501 bulkscore=10 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170047

btrfs_join_transaction_spacecache() was the only user of
TRANS_JOIN_NOLOCK and is gone, so remove the join type, its entries in
the blocked types table, and the special cases in join_transaction() and
start_transaction().

Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/transaction.c | 17 +----------------
 fs/btrfs/transaction.h |  2 --
 2 files changed, 1 insertion(+), 18 deletions(-)

diff --git a/fs/btrfs/transaction.c b/fs/btrfs/transaction.c
index fb026d81414b..e96dd99ce623 100644
--- a/fs/btrfs/transaction.c
+++ b/fs/btrfs/transaction.c
@@ -125,17 +125,14 @@ static const unsigned int btrfs_blocked_trans_types[TRANS_STATE_MAX] = {
 	[TRANS_STATE_UNBLOCKED]		= (__TRANS_START |
 					   __TRANS_ATTACH |
 					   __TRANS_JOIN |
-					   __TRANS_JOIN_NOLOCK |
 					   __TRANS_JOIN_NOSTART),
 	[TRANS_STATE_SUPER_COMMITTED]	= (__TRANS_START |
 					   __TRANS_ATTACH |
 					   __TRANS_JOIN |
-					   __TRANS_JOIN_NOLOCK |
 					   __TRANS_JOIN_NOSTART),
 	[TRANS_STATE_COMPLETED]		= (__TRANS_START |
 					   __TRANS_ATTACH |
 					   __TRANS_JOIN |
-					   __TRANS_JOIN_NOLOCK |
 					   __TRANS_JOIN_NOSTART),
 };
 
@@ -310,12 +307,6 @@ static noinline int join_transaction(struct btrfs_fs_info *fs_info,
 	if (type == TRANS_ATTACH || type == TRANS_JOIN_NOSTART)
 		return -ENOENT;
 
-	/*
-	 * JOIN_NOLOCK only happens during the transaction commit, so
-	 * it is impossible that ->running_transaction is NULL
-	 */
-	BUG_ON(type == TRANS_JOIN_NOLOCK);
-
 	cur_trans = kmalloc_obj(*cur_trans, GFP_NOFS);
 	if (!cur_trans)
 		return -ENOMEM;
@@ -709,14 +700,8 @@ start_transaction(struct btrfs_root *root, unsigned int num_items,
 	}
 
 	/*
-	 * If we are JOIN_NOLOCK we're already committing a transaction and
-	 * waiting on this guy, so we don't need to do the sb_start_intwrite
-	 * because we're already holding a ref.  We need this because we could
-	 * have raced in and did an fsync() on a file which can kick a commit
-	 * and then we deadlock with somebody doing a freeze.
-	 *
 	 * If we are ATTACH, it means we just want to catch the current
-	 * transaction and commit it, so we needn't do sb_start_intwrite(). 
+	 * transaction and commit it, so we needn't do sb_start_intwrite().
 	 */
 	if (type & __TRANS_FREEZABLE)
 		sb_start_intwrite(fs_info->sb);
diff --git a/fs/btrfs/transaction.h b/fs/btrfs/transaction.h
index 6b0da4eaa0fa..556c094eadb9 100644
--- a/fs/btrfs/transaction.h
+++ b/fs/btrfs/transaction.h
@@ -106,7 +106,6 @@ enum {
 	ENUM_BIT(__TRANS_START),
 	ENUM_BIT(__TRANS_ATTACH),
 	ENUM_BIT(__TRANS_JOIN),
-	ENUM_BIT(__TRANS_JOIN_NOLOCK),
 	ENUM_BIT(__TRANS_DUMMY),
 	ENUM_BIT(__TRANS_JOIN_NOSTART),
 };
@@ -114,7 +113,6 @@ enum {
 #define TRANS_START		(__TRANS_START | __TRANS_FREEZABLE)
 #define TRANS_ATTACH		(__TRANS_ATTACH)
 #define TRANS_JOIN		(__TRANS_JOIN | __TRANS_FREEZABLE)
-#define TRANS_JOIN_NOLOCK	(__TRANS_JOIN_NOLOCK)
 #define TRANS_JOIN_NOSTART	(__TRANS_JOIN_NOSTART)
 
 #define TRANS_EXTWRITERS	(__TRANS_START | __TRANS_ATTACH)

-- 
2.39.5

