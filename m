Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3B03CB907
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 22:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788733799; cv=none; b=byeXv5u2oj7/ghRu9xJEC5by32HCGTnYPnhCiPKNHq+Q3yoEkODMeQ5YeKrun+djyrhBvnPBpz/fdiZCtpxRa08/b8HEDEGkuXpDcWpyS9I7C20/KHUYakxQ5iL/qJKqHyOOwimRkPVnhlfFgg5zc0jix7e4NMhBTqqjmd0VMo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788733799; c=relaxed/simple;
	bh=HNVhDJW4y3zPfpcfwyZNp9DsCxsecMP4eaj2B/cHMdU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EaX50tMXm7/WTVqmD4dfQ7SPWkjpfDF8ksEuGiWb6lK8onbBQyXtwCCF6mu0QjFyl9LKlPZTignKIxTC6Ckf70wL4y557SP23Q5hd1k4Ti174JEaz+XWALOvyuV8HP45DJmLjI8HnV67ejtO2BCsYfWFApFsZO6obVjQmS7OA5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=laCSRwBy; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=c9LOmlcp; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="laCSRwBy";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="c9LOmlcp"
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 686KSc3L361537
	for <linux-kernel@vger.kernel.org>; Sun, 6 Sep 2026 18:29:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=zPAC
	TqEYoSVTzUbOOOSx8ireZs7IP/+c6pL6mtnNpeg=; b=laCSRwByGaSSjTpwKlTs
	ja+OeW2PgWpCZVeEiV8mB+fzPu+lAl0VDdICTnDSSmG2b9tILZVjbOY7sJNTFmeY
	nD+zjkXRpOiHHXyYGP422PGB5OA3y+k2JQOtAOsIbFoewsYPJkTZhPdZ1Y+0DhL5
	ja7O9xIgY5HB/XX8VVmsddf+li+BIZfAs91AqDIRqL8lA5s4DgCi+CgUzB9K2f/S
	80z4giBZuv9jcmUpcoU7tXw4VUEL/tCDepmWdgNtdPET3iG2eSkrWhIyYt+wfQqO
	fKhaZQV2C4FZ6RoPIVTd4wQ8DoQe/rc372Yeu3RQ40RhrwmqvijcVnAcfqfX82PM
	cQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4ghf7qgca0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 18:29:56 -0400 (EDT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52d33c89a29so72904571cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 15:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788733796; x=1789338596; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zPACTqEYoSVTzUbOOOSx8ireZs7IP/+c6pL6mtnNpeg=;
        b=c9LOmlcpMlHh9uUB6CXTPg+7DnE9w2Rw0jJ2U+s9mpXyeqz8plQF4VQmunRJZWBCmd
         i3En6iT3mbDwnz4Zuk4Nt+ELl3wufszE1xzPn7sHuHf45kt4u+aAKV2j1UStfpfed7tj
         zZwiQhCgfqgQEFgj+Fmn7osl5UJehUMezYSqTdSM2csiX/cf3+EWTGscOq1dIFa4q8UA
         V/XEFTI4fnrwqxkDACQNfDyoKSXsnEct6JDc2VlZNTnukuVQuC4vsVi5xwO4BTW943Sc
         WJrmq/H8V536TnJC5yKLe2bGLebr3/sbZMC/un0/VpRXkhZeG3p/mbTgcofdsp4bWqWL
         Tfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788733796; x=1789338596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zPACTqEYoSVTzUbOOOSx8ireZs7IP/+c6pL6mtnNpeg=;
        b=GUr971rac1Z4pbp2xEJwaPPNNIaErpzxDqBT40Ud10uh+DAS0nxS7d4cG7uwFFIO0p
         VVFiRp7EaXXJvMe1o4oidgyXVEVZz4KhIc3sCuz2u4jIZ76mjBrj4560WS4C2UeESGbN
         F88NROivSFEKHb1NqcZmMySu8pH1fkK7YNBPTaCfG1iWypZaeBNhrphKt+QOwjreCEky
         N7rc95XO4eq66ZTwvJ00lZnbZr7TeiGVjzLNBLgPdz4bjkxOMAYmnjbQ6K0duULRg8ee
         tWFfltTV2wcO4XB920IvKk4W2aL9zSyCQ9IN0TflTsB6ewiA/q+O7ja1DP65haqcio7F
         RPNw==
X-Forwarded-Encrypted: i=1; AKwUvBxIALD0JMQ1yVwYYvkoVlAZkhzfqzZFl60p+2Vn55NPEuavOJP8EQ4oizM9Rw0l4JBzsJKpr6wc6rCva6Q=@vger.kernel.org
X-Gm-Message-State: AFuF++kCO2Fp2qA/EfWirqmzZ31w5n7TCtshQoWxHQ3YG8YQVSUWkeNH
	AX4kx5S6f2anariPGjnf2/Q+5YfPcn8lX6qYVGskpSGGU+c5cUqVwUMO1KvPON0u1DyomjselLw
	c6c6kwYWT7Rn3mZbOICPdUDcOOLUlYE7m/L7Mw+59NSe+NtZ/UgcgHSQG+qYNbA==
X-Gm-Gg: AYBFou1cd4faqmu6YptCddsT91w3ei7+P6FUNMIFU50V+UBjAgetvXotRuMXHKaczMI
	b7IZIXYjaMzRu6segruuwRHqxYcPEQH7V4y+nd2Qb4SfjdFERLli+mQR5IzizBjzYZOjC0oKPOT
	QN/6q+v8XPfO2ElHBSjWRZNyvnro86erDcEZQ8StzYGz6OdsIuOzFvJpE5xYmd+EMpJd9I8fg0y
	nss+DL448WxCtzVAv3/qo4XCmKJMc6pPeOqMfxINKz4C1q4/9BLv/hNMoim2HI64aM9tMxZ/Ra6
	5dLvw0TlzX8YvxdaIji9PCMrcjkEs2BlkEohAOzSPhxhPVPYsFuKQaGFCAL6cuFqZolms9q3xq8
	BU7J8JSvkhzvzI1QImtCafg/M3ZLw/rxQtG/mJoRrgttagoGu
X-Received: by 2002:a05:622a:1f86:b0:530:42e4:f283 with SMTP id d75a77b69052e-53054a26cbfmr248136541cf.44.1788733796093;
        Sun, 06 Sep 2026 15:29:56 -0700 (PDT)
X-Received: by 2002:a05:622a:1f86:b0:530:42e4:f283 with SMTP id d75a77b69052e-53054a26cbfmr248136221cf.44.1788733795682;
        Sun, 06 Sep 2026 15:29:55 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-176-104.net.columbia.edu. [128.59.176.104])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305402a7b7sm73048541cf.3.2026.09.06.15.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 15:29:55 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sun, 06 Sep 2026 18:29:31 -0400
Subject: [PATCH 04/10] btrfs: convert btrfs_compr_pool_scan() to use folios
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-btrfs-folio-conversions-v1-4-834b9d7b06f5@columbia.edu>
References: <20260906-btrfs-folio-conversions-v1-0-834b9d7b06f5@columbia.edu>
In-Reply-To: <20260906-btrfs-folio-conversions-v1-0-834b9d7b06f5@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788733791; l=1065;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=HNVhDJW4y3zPfpcfwyZNp9DsCxsecMP4eaj2B/cHMdU=;
 b=625wPx93iQ+FvGpQaBFiEcf5UodB2UC0eWl+7/eYt0r7vnM8bY3i9CocWWWlOHGijAK/PTkB3
 4wzHQH02fjoBnLIF+IBkcwo1GZqm5exoOwO7IvDdL+cmx2wPopLTBqf
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: FEABTKmxFys8-tkjXeA6tp2pkyG2Sror
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDI1MiBTYWx0ZWRfX98jnrHKi2BCj
 GYJpJtc20qoC3oK+Uw6sO4ZwcByEqBk2jQHGr6zOnZZby6OpoQNjO+2FhIbdBBPG+/MwU+nvYA2
 quLwuoas+XBRggXmyxPdzh36GXiqgX0S4IY4h3tuKNhuajXkMqMh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDI1MiBTYWx0ZWRfXz0TWa3pRjoHz
 X22gOVEqK2iF6nxl/v3VzPq4HCe8PQMvwsmK6CnFXJDtzpu4mnydtBiMjQZIw2LjQKvXqozIpp6
 jTyA5ephrqP+RgAbQQjduppEK2UAANgtPasf7BRjTDUSOcDOlDIMsizsTBt1FoWnvVZVTHIVdW2
 dhzLm6BMZzJH9jnHkVym+Jmthzsjb0sKHJIxL9qbFK8VRd0Jluj1uwykafB54VQ394FpUwEDHGl
 9MHh605TAJujn24vDD9ZNGUcuXR0ZjtX5ZqFPubWuPM1u+29GkAisfgNmytAHogH/8V+oNgaN1/
 jTFxaI0v0Sjtnlhr9uWy5IF2pE7nMX4c8RIompMscJLyRLGqH1C7LswRCbwL1MJIJlPdWl4Skgp
 48Qznd8CKmg9lBf6Uyzzqg6Qt4WW8MOdB2ENlLtIv/Atwnz5qeLoOz31hyLfEZMnh7yfKHhvuUL
 uxnDMOd01+dxPRTfnxA==
X-Authority-Analysis: v=2.4 cv=N94Z0W9B c=1 sm=1 tr=0 ts=6a9de964 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=aNLBvxxoObQFLnBXsbaGlA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=Us7um2Mp8MJUFct2N4IA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: FEABTKmxFys8-tkjXeA6tp2pkyG2Sror
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11898
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=10 suspectscore=0 clxscore=1015 impostorscore=10
 malwarescore=0 lowpriorityscore=10 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609060252

The compression pool holds order-0 folios, but btrfs_compr_pool_scan()
walks it as struct page through page->lru. Walk it as folios, matching
the other compression pool functions. This removes the last use of
page->lru in btrfs and saves a call to compound_head() per freed
folio.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/compression.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/btrfs/compression.c b/fs/btrfs/compression.c
index c62b5148d5ac..979b2ffbd8fc 100644
--- a/fs/btrfs/compression.c
+++ b/fs/btrfs/compression.c
@@ -168,10 +168,10 @@ static unsigned long btrfs_compr_pool_scan(struct shrinker *sh, struct shrink_co
 	spin_unlock(&compr_pool.lock);
 
 	list_for_each_safe(tmp, next, &remove) {
-		struct page *page = list_entry(tmp, struct page, lru);
+		struct folio *folio = list_entry(tmp, struct folio, lru);
 
-		ASSERT(page_ref_count(page) == 1);
-		put_page(page);
+		ASSERT(folio_ref_count(folio) == 1);
+		folio_put(folio);
 	}
 
 	return freed;

-- 
2.39.5

