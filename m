Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAB53CE4AC
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 22:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788733804; cv=none; b=o1gEIu3rA83c5DW30RrkqNtUlF8w6+7Rh6onvP7D7E8vW+pfgTCEgw7nPh+MGdJ4mwwxUfexF7ULiO4uU/f/0qRnSiO00LQSDbV292NLpY4b5v80R5L2ibtsc/68PCmhCwAz9yyOdc1pNml6d1ci6w3O8KZIDiJ+BOXjIUUiAtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788733804; c=relaxed/simple;
	bh=CJnstd+kkeK8rQHvGFsaX4UzZNSv2sQ+ooNQiOqyXWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pcT6gLsz3PV11AC0ygIDas9FwDTynhDM9Tf825VHIBWiyqUJgQ1X9MJJBJbJ8g5Chq6WRCRgoyT6Y7QehJ+3Lawg1KhLaP4AiJpHnYXpoKbhdA+59uYnxNKEJVZmYP7tHmOOceAppjDGwFTs1KsDgTX6tnjBOyp/xFb+PFT2oWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=VeVhcdbM; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=lA5XFPAB; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="VeVhcdbM";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="lA5XFPAB"
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 686KRFcT358671
	for <linux-kernel@vger.kernel.org>; Sun, 6 Sep 2026 18:29:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=CfC9
	I79u0yHSazTNK3oQEllakS5tB7xZvD5W+HI/8UA=; b=VeVhcdbMErUB3nR9qYBN
	DcGug7nWorR80yaGbRyXmoOn6kV+HUUYuMEmUU0jiobSCQH+AoqWLEie3C5AM9Hg
	upqH6I55pH3UFfQV0uUfE92ipi3hvu9wWCD2F3tXy46haTGLrOvErODMv+PqnQ+3
	1hoQTmuGDxfN7/Kr6IObxwy9VORIoSxrF4kA1msJK67IvIiZYqHUK4A/v6z6iC/5
	s/8B4hHNF2rXXOmTAg+WqACxOpJF+Wmj2+ubIrytpyr/2aWro/vf0QWXket243X0
	oaNZYsurdDHn4pRD/1M0abSccelnTTLjebDpOmt5rAzDnVsuFUc0iU3l74S8BwaB
	bA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4ghf7qgca4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 18:29:58 -0400 (EDT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52f64c48bf2so53485341cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 15:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788733797; x=1789338597; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CfC9I79u0yHSazTNK3oQEllakS5tB7xZvD5W+HI/8UA=;
        b=lA5XFPABt2dx37tDBneR3VTl0iykwdlt819f1wSNdae5M9skytNzNlujDynTfn3Ed9
         0DNpBAne51b1tXtO+7lXL239mKkddjkwklxzo4zQiRszgFRb/fVvhAw/SV0PqXyvYxYJ
         uXig5GmVqm8JYxGIeW4ZREloMjVW6n8LU93y00xDC7J4aDDS5j2pwBYP6HAhRAheTvqv
         0fM6d+QvpTz38dRxT3bkuvTho5G/mBz/aWVJtY12YtQy0rziCq2rEPEVYTagU+ICyaxq
         Z42/8bqnvu6mbqqNme/jkRwFBt37hgfpBfaZqBhMn1UoosOm9+lysXBMH+yjgjMXyxOy
         MNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788733797; x=1789338597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CfC9I79u0yHSazTNK3oQEllakS5tB7xZvD5W+HI/8UA=;
        b=G0Y/160zjucmu2ZIhndmxA/9EcioubbJ07wXxSbr/PAnBRuHiLz+MshdJIDUMzqzH7
         CZBWlZdAGAyB+R/tISBFzIrtXSz4GX+tO6sB8To8YqdHK1qBW5XKsLZePbvNnSgspzH0
         Uyx45MxNJTZsPKif2rqcHBHGkZgNMkqeRIDRHY/h3iJyTZv1ZX+HV3s7OyA1IlgAdWhO
         kfXB57GQoxCIDYqtekWPsYcAE4qeb3DA+72RZ29CCNgMuGwxSSfeyx7DLcpKT67Xge+f
         79KsvSkYGFcBnrC738J+T17ZnU/ig3VWdkMw9iUbr7vHb7ELFyYcP9YBjR9EMannT5tP
         RXuA==
X-Forwarded-Encrypted: i=1; AKwUvBwFOu6C/V1OA3b5W5RHn5ESaRoKn12NJG6lJXVkpKuhQqheGKJNBSD9qzv4EF7wwuH2eln2RFKa6lcHL2U=@vger.kernel.org
X-Gm-Message-State: AFuF++nbfSqtqWv2tsXhxAUZV/T/lvW3czWWReiFqQOALAHQDoALNHaa
	TRTpzdKQt8YOG10rJepm/HpjV45uLCOWxXWgAM1V3zxFz7224Bc5qvpopQUdRdxc3Q6yvxeU/kK
	cDfYnFGHz/BCXm5BWkwnVJNQRTQXNnVTnn5KRiR3RdN5iscKd4v+xQIKVtJKO4g==
X-Gm-Gg: AYBFou3kxHmJNFGFcT+Dcx8A2R+HrJJK/SZr8RmKYYJleBLdYrUkgNpYbrha+gFp4QR
	jLsD478minzXCDMGrvKFIfKpLsZp2wRSHbxe6ufcRB5XfkSa7pWJJseLNpS25q0BGrBZpMiyP3x
	qMa9MTQRbkT2bW8o7ah2N8q+XfB58dybQa7piYgfepdFyzd4jMzEZ6cpwyyRJuc4tntTLGgVEQP
	RFGPkUSEVkb4oGaW7LYP1kUNMBlP7EV3m7ah4QcD/koS3wE9EtuB1Cyxmf287iu7CT0NGKdPddn
	kR+++EPVEhP5bDpAomOJfHbx0swNfM8d8//IlTiX0F77Q2UQ6y0KZxM9lvbCvK6jF9cWeeAM2yT
	q9CI3vpbaKWiMDw+0dCnILNiwuAGzOaM9Buo1vjgCh1qRAYbu
X-Received: by 2002:a05:622a:a05:b0:51c:fc4:a144 with SMTP id d75a77b69052e-53054800802mr226686461cf.4.1788733797687;
        Sun, 06 Sep 2026 15:29:57 -0700 (PDT)
X-Received: by 2002:a05:622a:a05:b0:51c:fc4:a144 with SMTP id d75a77b69052e-53054800802mr226686061cf.4.1788733797246;
        Sun, 06 Sep 2026 15:29:57 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-176-104.net.columbia.edu. [128.59.176.104])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305402a7b7sm73048541cf.3.2026.09.06.15.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 15:29:56 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sun, 06 Sep 2026 18:29:33 -0400
Subject: [PATCH 06/10] btrfs: fix stale function references in compression
 comments
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-btrfs-folio-conversions-v1-6-834b9d7b06f5@columbia.edu>
References: <20260906-btrfs-folio-conversions-v1-0-834b9d7b06f5@columbia.edu>
In-Reply-To: <20260906-btrfs-folio-conversions-v1-0-834b9d7b06f5@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788733791; l=1276;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=CJnstd+kkeK8rQHvGFsaX4UzZNSv2sQ+ooNQiOqyXWc=;
 b=wNakc2lD1D1Qxekt9Elvfw9A3rdleSrn6O45KjMVHUTXImAdH+dOdQInotuFk1LY51uR7P3r5
 WjB9lAd+kaJCEFk5h6e2zb0n5nJvu/JKtFtKQ9a3f0LOXwgQSpSSsn2
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: K_QYQQS2_tEK-xPRrEvZyHbXZb2DowsT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDI1MiBTYWx0ZWRfXxMok/W8WFgaw
 uKoHQcUHWthxVrC1rchc+IPCzoYuFNp3dMsGnBqz8SCL1rHLkEsiLTHoYCpRYJ7iIE19KzZuzIq
 Zo1kSSk2mQMkd2UKmV/n/CQLPvbPD9MgZEDJJKGVYXyxCQMCio31
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDI1MiBTYWx0ZWRfX6AKc35ETXZwR
 W4hGnAf1+D6G6n4Qi9KRJNFELF0K8UUdN/GXf+SwqkJLv5glZHRYfP1tcdYqjj7ZYDLkhTElWYR
 pWTMlC5gDtnSb4Oab5kwORnGKMxRc3Qhca8WtCUFd5LdXMvIAf80seVq9rvza8BsjmE4to7u18D
 5XgpEIsWplu3qIiXhD4p3/rVXaLTWdPsxzvAE216OLbkIjNZtqM1DuxkDK5r5AOOcwPNi5uLpVF
 r2ai0LYtcGJqbgmE8eKELJD4mcD2eeInY1Z43KUKzOrDb3ZXwv0TIN8PfCf8mucO49QxJ9vva2n
 cuWyhsJJDE1phU4tv6AYOp5qDhd7HENd4ybYl80gPNqcaW2onuBQ8jhss9Q3UYZliSreFVYmdhU
 sSW2/XuH/3AOKtkcIcl8PrUQP/lWdcU2UIbh8ZgY3nMHhkg7UOeKAMMi5ksaMBigLLLKDaeXdQi
 k3nPEoz2RikgmZdQjvw==
X-Authority-Analysis: v=2.4 cv=N94Z0W9B c=1 sm=1 tr=0 ts=6a9de966 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=aNLBvxxoObQFLnBXsbaGlA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=wS94dJsgKqXJMQyBkfsA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: K_QYQQS2_tEK-xPRrEvZyHbXZb2DowsT
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11898
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=10 suspectscore=0 clxscore=1015 impostorscore=10
 malwarescore=0 lowpriorityscore=10 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609060252

add_ra_bio_pages() was renamed to add_ra_bio_folios(), and
btrfs_compress_filemap_get_folio() wraps filemap_get_folio(), not
find_get_page(). Update the comments accordingly.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/compression.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/btrfs/compression.c b/fs/btrfs/compression.c
index fa8b92592321..20169d028961 100644
--- a/fs/btrfs/compression.c
+++ b/fs/btrfs/compression.c
@@ -431,7 +431,7 @@ static noinline int add_ra_bio_folios(struct inode *inode, u64 compressed_end,
 		}
 
 		/*
-		 * Since add_ra_bio_pages() is always speculative, suppress
+		 * Since add_ra_bio_folios() is always speculative, suppress
 		 * allocation warnings.
 		 */
 		masked_constraint_gfp = mapping_gfp_constraint(mapping, constraint_gfp);
@@ -960,7 +960,7 @@ bool btrfs_compress_level_valid(unsigned int type, int level)
 	return levels->min_level <= level && level <= levels->max_level;
 }
 
-/* Wrapper around find_get_page(), with extra error message. */
+/* Wrapper around filemap_get_folio(), with extra error message. */
 int btrfs_compress_filemap_get_folio(struct address_space *mapping, u64 start,
 				     struct folio **in_folio_ret)
 {

-- 
2.39.5

