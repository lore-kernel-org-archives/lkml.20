Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793711862;
	b=Waxz/TdAcGDaQ2eoZGouImDlDXHGSTP1ff8BTxwgYmsdXaRNldcbFocBTF7h0cDssNka
	 US2gGP4eTUYhE7WqCninP9dpss+5X2taXhC5DqB/qKQdSxTtRaR7W6921j/pCCY0E68Yi
	 OcqfnNwSmuzqAx43o86iSu4YG9pImL9dUNfTPbjJ8wmL3Kg3FVKx3p5eP5BRA/5ehY4ek
	 U2STJEgHcATYNvjamqQtX49ZJkbrE3onpU7ybtT05rY1ImODFBWJ1u6YMwIMGcUcyZVOo
	 jQXdL5zuL4NIhV4yGsWQsW/+OBJ6vA8ig5YhF4hJ04pm/HWWFgm5pYp4kx7PmfZ2zQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793711862;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qYI5N1Flkd8JRRpQlVhcgEfC+ya+6nG6wXr75WPBIUU=;
	b=swlgCsEdzDgofxNMEJ5uSJyspA6/iY1L6cn4sCzD7Pf4DHafY8gHkQoopaFu+h56xDQs
	 3WYtpkcROUBB+4Q86ZD/UBmX8Hf7+Zni0A6QVYWhyQMUxCeWUmpCHq+dAScMUjG3HMqAE
	 42TJ1FtvQXCdPrwvSHNp1vPp6QSJQxqCQLnUKGJe4giQgloD8YociZFFaLSuyegzlnz9t
	 FK8NwryYJQmWXvDN7AcVgiZ43XDq5aWkyAlSC1GLSRRy202eQ7SVKXjrtRGOzh6g+xjPA
	 JPhGx9NOUMwBtMptoKMb/krPRSGM0qhknEoFaIn7dKP/s/PrZZSqXnJ+kGfZJrbvIvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b="V75C/Cxf";
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=a0T+a1Nn;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6C4606D810
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F6C4606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=V75C/Cxf;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=a0T+a1Nn
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3Aa7n7514371
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 08:17:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=qYI5
	N1Flkd8JRRpQlVhcgEfC+ya+6nG6wXr75WPBIUU=; b=V75C/CxfAtAYOlDpXVQV
	UD7aVElSkty0PAF7CTKJE78Trcs+NENwQZI/q/3RUSyuhljDiZmv1mAv0PLiy9E8
	WzhUkBqFzHYkuXOByYnx5t8OpMigxfZp9KMnx8OYGaFaemC5UX2jl+B52v1iGciG
	GHXnHQZwpuiB9bgo3zOC55fITPw1UZcGQ+KYc307OdmSCWIuR0NHX/cWqqGv+CX7
	rxePi7PmqY1hKnZHFiUOtJH3ekdrj89Hm0vksHNdLdfHCon5j7YOEG5EhTsitNYE
	YNnmZNq3XsFEHthxkcaYxS6LHeMP+6UoKDvFbgB0GEcqLqvi1qXC41nn6/AiX3VH
	Sg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hq1ufmg1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:17:39 -0500 (EST)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so755910185a.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793711859; x=1794316659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qYI5N1Flkd8JRRpQlVhcgEfC+ya+6nG6wXr75WPBIUU=;
        b=a0T+a1NngoBlMeddQpP2v71WxqC/DGkhT/a20pCebOie+48+yjxKEvIQmoqqydzHyO
         knR6Jhgn+JTHulYciPat8ineA6fdSYz2sSt3a0f0t0H+/ugR5pPgL1XpR4f5k85t2wyq
         BSmyeW8dp6qqLZuHKMOUT+LaUs25n5LZNRvujfOlql0Ah9W7+Kzr9aS0RnpZMabCHq9I
         RHjGWUo5K+OAitkKMvokB7HohMqxU7UWae0ltDRKbVT/pSeGBbvMVC2XZRaEQO/+Lzl5
         Wv6cZElPMWn795SzDMXuEV33nDFHTq3OJZHLodQ2/dErByTtYhnRgRxtPuIvWN5sBbVk
         Bw1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793711859; x=1794316659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qYI5N1Flkd8JRRpQlVhcgEfC+ya+6nG6wXr75WPBIUU=;
        b=2A7IzsMXwnz5uNdFKcqb68zd9YBHttIuyuxa9mFtTRr8eFNM56KXRBkukCyv3NsYRO
         rYD5JHyoO9JkC5RE+G0D30frxpAsoi0bbBnugqMXTKVRtJeN2Sl04F5vgP1bpqzx/HeD
         M+rjlMFlnBP23GWb6a2SQn5RmiCXFdzPlD0W2jgozVP7kakJeOFfI5k8CL92ubzZji1D
         ysfSQkqGoRf8qsJTQeehDtaxScpOThCRzJRA2C0TGbuxqeoADGAGmOaUEDe61aq9ToHm
         +rs9QdHYixC8Tpu2v+/Ew4t9bYDXSsIur7CdOEXLw8kLVrjICt2DII3/OW2ULsfR4iQ7
         RsYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbOEgA4UIxTrL62A7UP4v25j5XurdlrfnfLcK35JlYHrf9+cwxTwIiMwh0JKwHa90UZ/KGMOOKddhOGI8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qB/d/I2y8JQrqulFlFNVanRIu9TZxqWGM9zwpYtLKaKDN+Uza
	Hm/HOAY78rialHJInCAXiogsn4LMKutbbNIOJUcJ3eVpEvPlehJyphsFnIZEhE7Br+c6YAcQ0fY
	kRz7uyCgHQAdc2cPTkFqlE/ivL8h6Qhk55zcVO4Soc19oUS0XFimJpFTx0p5ljg==
X-Gm-Gg: AYBFou22g4PRvFBP3osdlaXSjUF2PcKpp4EwUSorzHucyq6HQNvUG0Yc38VCC57auH0
	v61gh0Zrhbxd76wI6Yz6uH/lgggLytCtpzSyElTArYHFGjpfOVzEd/t3VLmCbxfCqEdTGcg0evt
	lZaTGK7ej94FThRmxJEE1dDt8RKohXKBi0N36btQFWR8RO+EjfrNJpf5HwNpKx2dKBH+17XhlyV
	7JnlyUYKFo+aCtt5rgCm+DI1ShSBlDXIn+XO+UnzMR1lVh4cClSLzMtJyCCBMfTwmKDTV/rtMy2
	S58umnRQ125RtaxF/ArTdxJeRXW3ZSg65myYSk0Wp8VrQeY6bqdAMYRLA1p7AGjfJH/6eQ2KNYL
	9ku9GJFp4p+9v208eDikLwbhSuV2Dc8yXD20WVHdt/stETIGHbuqUFw572AI=
X-Received: by 2002:a05:620a:2603:b0:939:fde0:a71b with SMTP id af79cd13be357-9442135c728mr2199586185a.0.1793711858776;
        Tue, 03 Nov 2026 05:17:38 -0800 (PST)
X-Received: by 2002:a05:620a:2603:b0:939:fde0:a71b with SMTP id af79cd13be357-9442135c728mr2199581385a.0.1793711858224;
        Tue, 03 Nov 2026 05:17:38 -0800 (PST)
Received: from [127.0.1.1] ([37.142.147.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa5781c9sm62076885e9.8.2026.11.03.05.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:17:37 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 03 Nov 2026 08:17:00 -0500
Subject: [PATCH 02/16] squashfs: don't read an extra block when expanding
 readahead
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
Message-Id: <20261103-squashfs-folio-v1-2-7b0fd4d20882@columbia.edu>
References: <20261103-squashfs-folio-v1-0-7b0fd4d20882@columbia.edu>
In-Reply-To: <20261103-squashfs-folio-v1-0-7b0fd4d20882@columbia.edu>
To: Phillip Lougher <phillip@squashfs.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-kernel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793711849; l=1041;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=7gpCHCwCo+muFfMibjrrfkk2Zdv8dKA+klfs7Kd5R4g=;
 b=57bFHAZlLcPHqgOxs6q1cU+WKH1QzvShEsH1ccGq0BdtfIBHflLRiVu1ZVs6a43OlOGpmKorC
 YEQEu2tH8fZDoGDjsZkTOuNPNnb+p3f0ZOg3mV2SfBpzXhELvhxO4I9
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfXxgNzIn7As1QG
 90dHquKNqYFXWnYwcjoFlaeJU8IvorcVTEsWanfoeNg1mHWgyDK+zkIto0Y+dBD1GaWSBtN4w6+
 Y8PQdIZS5fuww/ikDgQiZpHtjiOl2BURKsNjv4bSV6/zLB/cvK1ISmaSEoI9oXaYkP4yUzTrlFl
 dH9HGpoKrqMsVAswF4TBff7hVf5wFlo4DLH3k/XehKHF3+HrwJi+Dqv3e+DG+WYfeV3NfhgjgaG
 nXLmlrP5ASJKCi3dxap5MFYvY92YZzav5t0dF1S4kOCQjYnrNOtHoVi8+6RjgY39EvoBA0OnXVj
 /rdzSWljUr4iGVRDSZ3Pi9O5X9cPrimUXQDAjVRwjkehCuOGxwwuryJrAMTm9i26k+Sqtx+nTax
 fdBVgijZBDSo9vq10+tLUtZPUgmei0X/NPzeNWDVvrXE2poXa3Js41brkikdJOvI6QiAxPyYDEO
 OnsM1YmnpmCMiU5pnUg==
X-Proofpoint-ORIG-GUID: fsvZPlaQ4elUkKM0NVNBUry8XCJ4ojJL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfXwqZxQgtSZmuC
 Unuf+C3hPrIE11IICTm1lIlhRFea+94uQwiztzH8IMYoQEdozt2fq/FgCsJlUJM6hvIBkSYemLW
 puezxDRAAlsUBXdpMzBTToTdQRGdMPjJzQ+K2lqUaIXqz5pyr4R+
X-Proofpoint-GUID: fsvZPlaQ4elUkKM0NVNBUry8XCJ4ojJL
X-Authority-Analysis: v=2.4 cv=SKfXx+vH c=1 sm=1 tr=0 ts=6ae9def3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6RgaMXXTExC6Yw++yBnrug==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=fydmV8-Uc3tVrXcnr7sA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11954
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=10 spamscore=0
 phishscore=0 suspectscore=0 bulkscore=10 lowpriorityscore=10 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030052

squashfs_readahead() expands the readahead window to whole blocks with
(len | mask) + 1. When len is already a multiple of the block size, that
adds another whole block, so a block-aligned 128K window on a filesystem
with 128K blocks reads 256K.

Round len up to the block size instead.

Fixes: 8fc78b6fe24c ("squashfs: implement readahead")
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/squashfs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
index 9c9a437ab118..12263ec8494b 100644
--- a/fs/squashfs/file.c
+++ b/fs/squashfs/file.c
@@ -587,7 +587,7 @@ static void squashfs_readahead(struct readahead_control *ractl)
 	loff_t file_end = i_size_read(inode) >> msblk->block_log;
 	unsigned int max_pages = 1UL << shift;
 
-	readahead_expand(ractl, start, (len | mask) + 1);
+	readahead_expand(ractl, start, round_up(len, msblk->block_size));
 
 	pages = kmalloc_array(max_pages, sizeof(void *), GFP_KERNEL);
 	if (!pages)

-- 
2.39.5

