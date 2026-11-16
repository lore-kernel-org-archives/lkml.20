Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794866908;
	b=D4sJyNU1n5vcqVq4IWFdAgohlbAqmoEFaPcNOV8xJ01431cF7MyKAxi1qGaHOTzTRwge
	 hJwda8dCNrx2yZuyGgBAI46uINMrqBDwbygqH1c/zb9WtccvtsCygBhP8EAirc9vCi47+
	 zwK8wtOm0LhF/hSTTkHO9fWKAcmJDROJ3xgzECLndT4Tsp4BNCBXb3w+PDAaPW21GUN1E
	 r7Ci6zb0swXw6nfwdzC1/Bugw7ijdBGPeyndfxm3envRszEN553zeyfWUHvliXaWfOGRE
	 KvgLXRwtOMvFfqBDVGXAtEQrjFsF+UZfHx6Ls1sjyJCRpEifCmi80m4/HqfU1B+5g2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866908;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=h6qrbwrtZcljA9LFxH48MjMm43hAmKf2WKcXHUtxuwM=;
	b=d/XkVGvUEbjzUmEJbeVgWQi+oNc1+QtuOayFVN8yHetSIOSmGuf6yf42l0JcHaE109fV
	 LGccPtHWznXQ2YqnbtoZvKpFe47QFyEbbEmqcgqDSV1/D7C1h4iRl7ysaVoCkZgaE/1Sx
	 TqDZaH2ryoFp1S4oEtoV2k95QVgjz6UZn3HhHiV31K4XO1iCXwzNwq3m+M9AtBFegO//S
	 p+rWDQqRbcQHmWtHncKlGL0EXGovp4TK9Mt2AfztWxLUxJveDfxPFIe7jZEW3h2D29BRw
	 xOZZ5rKDtcLQKRoQBXnRVuDZ4Ke5g3FlMEmNZnmQkLhVFz4+rTU1zNgfl50BjTFSRZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=EqkY1e8n;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=CpB4E3BN;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61783606A8B1
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:08:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61783606A8B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=EqkY1e8n;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=CpB4E3BN
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGLYiTm3929958
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:08:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=h6qr
	bwrtZcljA9LFxH48MjMm43hAmKf2WKcXHUtxuwM=; b=EqkY1e8nl9siwSYWqxWc
	fXDu4bAwmICzw0lkk6ZWt1HZJgyPXFnjBeDFvAFsnDn7b2A3zkunqNyJXcCCHHzT
	aqY7VLLURX7D0+OBCwkbtCf4TFr02d9TvN1pATqhk59RkH6Btw2AI4iEBN4MJh2R
	sNExPuSdkM/Pogz+Z0J2PQakS+/6HqKitSWTVaZ7kCWAYW3VempY/CDd+M+4j02j
	vBpQjnTwG7rj+jPdm5/ytBHAGU1kb7NAizD82Fm1sM6NgV05wA3wDSY5l0KdLYDa
	Wkr5A/rjiWzrKMOPY1RQPR+I/LiquTT0rBu8cmAJlWs5FIYspjYCTBVLBJSldaWw
	LA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j059au91u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:08:25 -0500 (EST)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91ebb902eebso32392356d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794866905; x=1795471705; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h6qrbwrtZcljA9LFxH48MjMm43hAmKf2WKcXHUtxuwM=;
        b=CpB4E3BNygdOQILjiRMQ1O6LQDRnQ04U/pVgu/Ktsvi7d3FQBe7GbG5dfxh4EaVFbI
         v4T+Ice04oXXbhsuXGcpgqlD/TDAnv+2s1dL6mHnyJR+RGih4Ma2qYx5A+tOpIk7rbcr
         5wVJHLy2IaMBKVQd5jf7WR516SDyA+zmkNHUygvAeNe8xuPvl8GSp1KY67pyRjTwheGV
         au+7JCIsXPUcZqLxUkJI1mresjN+Mj0J6Dg7YbzN89kLxvn5kyu+rhCg7jsp1NcD5DiF
         mqtsTRw72OoMZxfRG/xaFJRYRPw44OUxejgrrGQtHW1QiNgYVnVRz3zAV3nv/qYaJofm
         k9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794866905; x=1795471705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h6qrbwrtZcljA9LFxH48MjMm43hAmKf2WKcXHUtxuwM=;
        b=lovi6SMW2q9QyfFnayEOjc/6XJgmMPJimPPy4BFaV/q6pz6h5plq0GEBZpiKlP4czF
         x3Ho5qmj0Gxo2MTyLwAkHHLjNwp7BIxUqZHFZCEYPvj7gHgsoaTSE7/qHVPOYNILXGb1
         laIJ6ioU36XVtN6B1ZEyNLjhCf0PD67mD3XG89+m3JZ20tOl0C6Qj58MVBnQ61Bg5F8m
         jC9aWW3mQZZVmkNn0ijXV4PnDHDHlSywcciAsachFnVxpYDMCmPEoz3Jmrz04N/fZvo/
         /XGS4i+yFMdMN19AHIDK6CWq47v6lVskKO1gsQlKF8d7QNrC70wYdRi5NYkCwnHQDlrW
         43lA==
X-Forwarded-Encrypted: i=1; AL+hErH3J7GjoRIYfHz7/1U9eRBFgPoTnJmS5Oc8FYb7VAd6TvqQHdS3uFrAJb6h061tNU2YrBmU4neaF2sCiEs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jUYXJlN/m3XaLpEyG9ox1PdO+5n0Um4tA1XABMa+DEnaQg5ie
	4jpjCexvyCtaG/7HrcFYTrAYDAcWL3sY7kNiixm1d5tYgdxEvljRNv1oMf2O+yPfKYFqpyBvSbW
	ZpZmYVfFYH4zddSGklDl6GHStUIkET/e39vRDZvXN4cXbLiCHJd0isMfRvGDKpw==
X-Gm-Gg: AYBFou2HQUaG50WUuIRv0KcIQzrMrN+DMkBe1eUbkYpIDGRXbrN7tPOA3+3cFo9Nozq
	qePK8tm/FPzVBtkEwSxBRZfDAeoRB+jWF0vFNmetAPLk8X65uSUZvLe98bQt5R5eXwKUONxryP5
	BYS19DcUFvtXUSp35HxS0WJsTWQB0JZzV2bSCgyHAAiBODVKM+k1gs63r0hLgYKKZd0NmFnsPHr
	kg6rf1hk3hJTgrZ14xvzfQbjs/h5fJxxOLbM58rXGhS/sgvkxV5VbjgBBVQUrMpjDP+ODx9BQY9
	GGtKFmw0uyGsGDhQkarEEDFKPbgofDD+CS6aSzdC9F2vLv/At6c6yCeMoJTqJDdJyibNuLtBZOa
	yZ4SDZNedqwMyK/ujAB3SGJqf1OAJU8B8mULgSTi5TwkRyAvO3tRBVTnk5BHMtYMXH0ZGKuTAar
	wb3N1+AXHSle4CRwb5anzG
X-Received: by 2002:a05:620a:46a6:b0:949:72f0:cc12 with SMTP id af79cd13be357-94972f0cfeemr1134765585a.64.1794866904846;
        Mon, 16 Nov 2026 14:08:24 -0800 (PST)
X-Received: by 2002:a05:620a:46a6:b0:949:72f0:cc12 with SMTP id af79cd13be357-94972f0cfeemr1134760885a.64.1794866904447;
        Mon, 16 Nov 2026 14:08:24 -0800 (PST)
Received: from [127.0.1.1] (nat-128-59-176-174.net.columbia.edu. [128.59.176.174])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c86c946sm951838885a.25.2026.11.16.14.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:08:24 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 16 Nov 2026 17:08:09 -0500
Subject: [PATCH v3 03/10] ecryptfs: keep the folio locked while
 ecryptfs_write() writes it out
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
Message-Id: <20261116-ecryptfs-folio-v3-3-1aba8e620eda@columbia.edu>
References: <20261116-ecryptfs-folio-v3-0-1aba8e620eda@columbia.edu>
In-Reply-To: <20261116-ecryptfs-folio-v3-0-1aba8e620eda@columbia.edu>
To: Tyler Hicks <code@tyhicks.com>, Erez Zadok <ezk@cs.sunysb.edu>,
        Phillip Hellewell <phillip@hellewell.homeip.net>,
        Badari Pulavarty <pbadari@us.ibm.com>, Theodore Ts'o <tytso@mit.edu>,
        Andrew Morton <akpm@linux-foundation.org>
Cc: ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Stephan Mueller <smueller@chronox.de>, Adrian Bunk <bunk@stusta.de>,
        Michael Halcrow <mhalcrow@us.ibm.com>,
        Randy Dunlap <rdunlap@infradead.org>, stable@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794866899; l=1484;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=+0JDVdRUE29ZtFD36S904yuUFtAM/8d2U5cw8KH4emw=;
 b=896NCJBFn2QUG7q/8PyhplXhW/jFIKw1a8o86pCl8ay8pwvPpvf3Uq0Vzog4t9ZEUN6zm/Wi3
 jSOLkYe1/rTB8OEWvWcdSl4xYgP0VnKO63WgHwu20sJ+W0w7VApqsEV
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: 71qkrd868jPAKombf6nKDymHpcChsIHH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA4NyBTYWx0ZWRfX5MS+wYpIrSDr
 jLmowBY4holHj6rxNpPvAAGOAXTAtIPwJyrPSa1Ayb96H4FEpijOMeyxj/A8i9LaqXJNuTInu3X
 ZMW14Ouk+FjVvuBC9s5+QgibpZT4B0hdg+2z41TVtisRwtnvrHg0
X-Authority-Analysis: v=2.4 cv=Ta0DJhQh c=1 sm=1 tr=0 ts=6afb7ed9 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=KPY1cyGZ6h6m4ASiENTC8Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=VwQbUJbxAAAA:8 a=6Pv1HT1Rq6VQGdSdbEQA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA4NyBTYWx0ZWRfX74IWro+95Ych
 rg/8BcQcZocdkh+vkSMoMOC+iygZhWCtrcbAWpDKTZUKl2+4xdRVK6jDMs1bZA6kXX7bXKGW4U1
 31T1GYRfmovykvrbiMRwA9HdT3vK/qZWpz+C6tViIblCBHJc2xpYYWFXCXT2lmZp0ocfDopqEya
 n0DR1g+LYaDzWFtEc3wNt/BqIO0dDjr9tqEe1VD0Z+scV84/edkb+QJ8uboF4unMqFuGV7I8lsv
 cu+1qal+q8ef9kCnKCHliAtTvwWbZA3tfi7Gc92WH3VjH5EGqFMIBrzEyVn6jJYJBV7cQGBJQ/G
 ieyAbwe1coCPj/FsLiv6mjUwUmcMbjfNEofp26Rsujd4ko6fk3ST8IADGIyz0XDtQj759TVOFTv
 Q0pK7zjuCwXXy/bAcvKEVsiXp/+UkPsyg2Tsh2oduzSf8gpxjJgcA4H49yWvqAjxfuYuwyT5HFU
 YWvRh0rxfSRyWpJuk1Q==
X-Proofpoint-GUID: 71qkrd868jPAKombf6nKDymHpcChsIHH
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 clxscore=1015 impostorscore=10
 phishscore=0 priorityscore=1501 bulkscore=10 lowpriorityscore=10 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160087

ecryptfs_write() unlocks the folio before writing it to the lower file.
If that write fails, the folio stays uptodate with data that never made
it to disk, and reads return it until the folio is evicted. Keep the
folio locked until it has been written out, as ecryptfs_writepages()
and ecryptfs_write_end() do, and clear uptodate if the write fails.

Fixes: 16a72c455a67 ("ecryptfs: clean up page flag handling")
Cc: stable@vger.kernel.org
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/ecryptfs/read_write.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/ecryptfs/read_write.c b/fs/ecryptfs/read_write.c
index e7319216a2f1..0881945da99d 100644
--- a/fs/ecryptfs/read_write.c
+++ b/fs/ecryptfs/read_write.c
@@ -166,7 +166,6 @@ int ecryptfs_write(struct inode *ecryptfs_inode, char *data, loff_t offset,
 		kunmap_local(ecryptfs_page_virt);
 		flush_dcache_folio(ecryptfs_folio);
 		folio_mark_uptodate(ecryptfs_folio);
-		folio_unlock(ecryptfs_folio);
 		if (crypt_stat->flags & ECRYPTFS_ENCRYPTED)
 			rc = ecryptfs_encrypt_page(ecryptfs_folio);
 		else
@@ -174,6 +173,9 @@ int ecryptfs_write(struct inode *ecryptfs_inode, char *data, loff_t offset,
 						ecryptfs_folio,
 						start_offset_in_page,
 						data_offset);
+		if (rc)
+			folio_clear_uptodate(ecryptfs_folio);
+		folio_unlock(ecryptfs_folio);
 		folio_put(ecryptfs_folio);
 		if (rc) {
 			printk(KERN_ERR "%s: Error encrypting "

-- 
2.39.5

