Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793711865;
	b=uV9BHmh1q8vTr7Op1C7uWK0JSIoQgjvxuRblVGYIA7b8oB+q04/qcDhNlEkUTiLvk7VE
	 tWWSk6kSESxzhn7LoOqNE7HFR5JNWvPuLFDdI+g+B325yppsAjPfstEzW8INZ/O6z7jXw
	 YgBCzvUb2wheu1v054/yTvrPkJ6EljGLHArOMxfkakYEfFs2DDjrnFhsuiv3naHgTeCNF
	 VOS72g7VG4qQad1Y1XF8KDIcUVbaMcrLzNAZzPZlrKIuKpfN/ypM7mvm85kAs7FTNFQMu
	 jq/0TfoYZVh0LPGbuGbsqyEFFPxrirM4rYqtfFcrQwH7Txyv6dIQlgfGH0uByuMTyxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793711865;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Evq2lpNudnk1p1TXZ3KYNxtYQxFdhcIBXD43g9ybkPQ=;
	b=2zj8jT8J25vfAvAigeYHOgw2nyyzKc6VVdC95w2KJeGiZB5XhjDsKSxYbl8b4+5X4P+F
	 HhxzPMqx0XkTqd5PVMt11306KfuzBYO2aggyoEA5wnTVjpFedNFFk6OF8EgrV9b+rtkLM
	 C7SGn1dbkKhQeAQdcUZki/Utx3pOPLWb1MBiOd9ur/oXWG+fAtgvugBmozw7pQls1L30f
	 sIA1wiF1Ocr2q/GKq0I3I+GvoeAQngEBW0s0b9TsMmzG7OmP1XsUNjP+5czixEQi1723P
	 zqhKCPa2ckisAilqRpVUtuSQmbU9KaAMnj16wuQjvVMEByCOwgslURIoLsQDAU+Y9tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=nrxtbiu0;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=w9Tueeiz;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCAE606A33C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:17:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DCAE606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=nrxtbiu0;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=w9Tueeiz
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A39rXan430928
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 08:17:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=Evq2
	lpNudnk1p1TXZ3KYNxtYQxFdhcIBXD43g9ybkPQ=; b=nrxtbiu0L3sL36qsWerf
	TiI+S+hg+IX4wp+hOozVrm53VOCF1Z5etVAXYqkgF6/BuEnAddqWwRnZFkAtG9Rr
	7+41Ku+25TSE9mSbj+BEBywSnRWdo0A0Jn7zN7bgBFLdEE8a1i/4hpqECUsOxP12
	fNFSFFMzG6cKvMkTOFQlYWLzcmee1VFNJhiOlc2pJq0WKXN3QE0PnEpHgp0gBZMy
	A0SxcHk4ZklS1xsI9yXGsY6zYgTNbSO2zP6GVIvusLYISpCM0j3BLBipxmL+Ybcs
	6CjruEg2+CcTEWJCELTl+xXAwipcllYo0tvsAwmQLVS41xd2Www09zf+1hxpx2Ql
	aA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hq1ufmg1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:17:43 -0500 (EST)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f32050e72so606533485a.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793711863; x=1794316663; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Evq2lpNudnk1p1TXZ3KYNxtYQxFdhcIBXD43g9ybkPQ=;
        b=w9TueeizAdhhqfm4n1YBFn1m6fqAWFVqENEQwc3xLbWC4UxEVrUPi0JiZRgB8RSX+A
         dqnlB60B9umIl5+fr8trOESHLK7BgC1Koi3qdg4Pqb0y9/FWdQgnxn7TKqTop447w/yd
         yCx9Kaxo32lXS3gn5qsYt6wAedaRIpdgLgZvAgCVkgIBLPBoNtKUUNuLoSHHulXhhtXk
         34wkfUsIyG/+0RJYCWt0NDScYmEI3gPV+lAb8m6wU3XAQKlbWnm80XSWA8f8tSLAE4k/
         mGnhZ62w2GWIAZ1NVYs76MuX0eBkFyADYxx2WeMO7S1B+AetI2Bd9czT9dY/sn04k+gn
         0RGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793711863; x=1794316663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Evq2lpNudnk1p1TXZ3KYNxtYQxFdhcIBXD43g9ybkPQ=;
        b=k8jqPNPApo/J+TippPdmtPoxA535w+WjOJmNFrKa1WWN/dflVowfBK6T7wXP1hN0wa
         g4DN4uf/WSB/NzGdDWnS8TwDXLwNSviyN1bAMCRKNgsl9FKdFoQ9HVpqvpiEWa9v0fL+
         c20mb0XvQYGeFmn1i0E3D5QhHV5xq9TGPGrGyEUGtlPA33C3QIye+CFcr3JAg4vemJWY
         /m8ixqzNGYyjbeE37HsN56U+m95xslLVpRQ66W+HCTk4hEzud7Rmanp86+/JjneYUvQm
         z/Z8O7SaWLAb1t2XXJqHajJfpcRpqEUdnT7f1q+xsIhz8Pi+/HDTXG3A0qduSpIv65I5
         k0ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4g1IPzZvnBoouJXF8URduwh5QOdu+twa650XmRGANSmD1Un/+IwrPot5HvNI7jGCwVFIhiNnDki2yPz0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+v7rBW9bidk4xaEO5wRsPFNoa6OEHUZZuXi/AU5YbY6aPyw6V
	vtUA8ZB8WXsgvwOYXAnxCbKzX3ShjrI6kMkAabxwwgPbF3+4J7xaDO97bPzVaHVJ7tDPumeFl3L
	iUe9Js+Qto3ZNh/r2Kx2KRjcLS4dwONiMzWZyotRwnMRbXUpcHNUwEHeS3zdEjw==
X-Gm-Gg: AYBFou1UZlNVePXOH/VUYUVEbcKbyzwt7iNobTZpm9mPGHey4zbYkIb/4OB9S+nl2WN
	3/fT7pAszDzKZPUOqGA2xxmTjeZ8ybEycrOif9SJTaalD/9/JFmclzA68ULYT2K9J2GSSB2KYaz
	cWYew5IULo20NrFurIEgrwVgqK6ctLSbBmTxIltS3d1xx1UFX2O4HExDV+9jwG4nZEcCml3BLHG
	1dHvdf8p9++nAGuLq417KgazaXo05JybCnnuGYb5v5h/kYGtx8S6sQqmGzxRAm8GpmLM9DX6Esf
	B1/h1R3VwZ1+/U/3U2DKLdtjMEpaBUURYj5pThZJZVG2fYTO8jlelAyrn9DdAtJ+skjIMbUP6Zf
	GS8HUVP1VWi2Lql8t9rlCK3ob/J8Y0+ji8luQd5vUZ8MiNGwdVyu0RCA7Eck=
X-Received: by 2002:a05:620a:4554:b0:93e:c12c:fbbd with SMTP id af79cd13be357-9442173e18dmr2154157785a.74.1793711862789;
        Tue, 03 Nov 2026 05:17:42 -0800 (PST)
X-Received: by 2002:a05:620a:4554:b0:93e:c12c:fbbd with SMTP id af79cd13be357-9442173e18dmr2154152985a.74.1793711862287;
        Tue, 03 Nov 2026 05:17:42 -0800 (PST)
Received: from [127.0.1.1] ([37.142.147.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa5781c9sm62076885e9.8.2026.11.03.05.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:17:41 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 03 Nov 2026 08:17:02 -0500
Subject: [PATCH 04/16] squashfs: unmap the current page when a readahead
 fragment copy fails
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
Message-Id: <20261103-squashfs-folio-v1-4-7b0fd4d20882@columbia.edu>
References: <20261103-squashfs-folio-v1-0-7b0fd4d20882@columbia.edu>
In-Reply-To: <20261103-squashfs-folio-v1-0-7b0fd4d20882@columbia.edu>
To: Phillip Lougher <phillip@squashfs.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793711849; l=901;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=JdHbbHapsRjUb5jusXJZZoQo9MvBbLc8LAh8m6v74RQ=;
 b=5iRCbp9B4ykxXTywrUiB38L2gtu2+iVHmfeoTyfkUFQClJmi2FDW15t0i37VVE9/xBFprrGpm
 Gv2Yq0BDJd/BYaRDrjOIeYW34fEzPcWO8x7021uSJ6KbOr+5bPy7orM
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfX0NysHfeo5DzD
 o0xSMxJl7XAcMBaO6xaHa26WXKUgeA9ZU+CYyS65hJbJI8kxtVbGA8/Zq5oOu220syWJf0bRVb0
 Qe08ElLX4FhaSnk2S9PSHLFr5BPJ8x50c8NEBAQ39/jDcF/XGNQEy8CTzDS+pQLLrIK2rYsr1kJ
 kQMe7OCARY4y3QKnm7qGw58MBCRHOqEnyrHgg+LRJ6SKm+3KnXxrUdV9E8ofnGt1XboAgvSCxqd
 0jgRUzJhmwYqo/rxHKL65CR3HSfxycgQHidkO4gPQlM8nyb9pkcFDMJZ1vmT7/y4K0xQIm2Q7Lv
 +GBA840vHT3CUQDUsmwf3cFB2XcHWm/rtK3Wtoglqw5AXTt97mZuXW/RhMfX0lTGkqvzIJg9zG5
 LDHrlB5ZuO18L/pLIpQ/BWIGNHgbPASfqbqI3OW5IZxKP/PgtF/OaSbiYiBbi97/MtId5E7HtXI
 Z69pTG/HcpEQUOpK6Rg==
X-Proofpoint-ORIG-GUID: j2Xl1-CvJsGVwXh_nzNNRLjMmJawjzeb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfX1MOnXMLH2OX0
 I03FOYi++nybMiAae0kCW3bgzSaQKhmBZES/P8XwFfTNwuiM64XM36c6RVZ/pjyG73Shkumgsbd
 Y9TTmHBZF04bHfx26rHuhQRREy/sxSAeYyCWw5MvU8yNYB6f9lIE
X-Proofpoint-GUID: j2Xl1-CvJsGVwXh_nzNNRLjMmJawjzeb
X-Authority-Analysis: v=2.4 cv=SKfXx+vH c=1 sm=1 tr=0 ts=6ae9def7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6RgaMXXTExC6Yw++yBnrug==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=VwQbUJbxAAAA:8 a=Os-_f5rAaVhnqpJF2OQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11954
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=10 spamscore=0
 phishscore=0 suspectscore=0 bulkscore=10 lowpriorityscore=10 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030052

If copying the fragment into the readahead pages fails,
squashfs_readahead_fragment() frees the page actor while the current
page is still mapped with kmap_local_page() and never unmaps it.

Call squashfs_finish_page() before freeing the actor, like the success
path does through squashfs_next_page().

Fixes: b09a7a036d20 ("squashfs: support reading fragments in readahead call")
Cc: stable@vger.kernel.org
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/squashfs/file.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
index 12263ec8494b..39142c4e08c4 100644
--- a/fs/squashfs/file.c
+++ b/fs/squashfs/file.c
@@ -565,6 +565,7 @@ static int squashfs_readahead_fragment(struct inode *inode, struct page **page,
 	return 0;
 
 failed:
+	squashfs_finish_page(actor);
 	squashfs_page_actor_free(actor);
 
 out:

-- 
2.39.5

