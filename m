Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793711883;
	b=4JFrKif1JTG8sZn5Leez5M+oTZC8rLaXQft3iCUDjU0meikRS9LiT+4DJgsguoBrk3Uq
	 fQ+eEyTnBHUeiq+j+j3PP1Mugll13V6FwlzOq1OtjOaa3PK3EUdUB5wdsxhfMunogDHdp
	 rqGJ4EwzuRXT/I1ezbLq8YUxUuhpAYJbFHju8JZ6ArvrcLq+VcE9UkS3bZusxrVvvzBQf
	 dUeIeomdGOMfTilvGxAHVCJdrvqxg1UrPzPME8yC44zIniQKnHJw2qVVd9I9Q0WdFtS8B
	 b0VUTAGFMJtYKpDwNtwlOdoQR4jxcpuCQUZx91oysIw6VZmp/kTnLk3vLLMYqFNrdyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793711883;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Rr1tlQBq7U5BwiX6vEMfxqxjghMI78EhaK/RzdUs+N0=;
	b=uauog5myx8f8nijez0m/A/4tjM7gfmr8t5NPIFC2PsadafT6wgzrIbJVB7OSL9RP/fX6
	 gIRuGoetwocBOqxd5CwPTiIDgTpLCTrwvIWrvk4YEbiBaKkgKVr0SvaF5ksw/bCsE3n2X
	 1t8Yh/rSZ4+bm7XY+xvC5pRWnDbZDLVbEWap/yDRSMUG9U62J/jI0nVZoGAF4meynYt3e
	 SBwv/XAd0SR8X2f3wyZ1GR6YNtlKXkUmS3kbGY2+tzB2fX6tuB5mm4FhIpkoDpQWLOemf
	 gm2wmeMDpprG1M9FKFsmmtionxCXXhNB6b5uQCVSxF25EBwnAQwdxisRk5hEipGqAbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=U11wCzAS;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b="W/jUhAvK";
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104AF606D823
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 104AF606D823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=U11wCzAS;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=W/jUhAvK
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A38uC1x3725194
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 08:18:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=Rr1t
	lQBq7U5BwiX6vEMfxqxjghMI78EhaK/RzdUs+N0=; b=U11wCzASvuEQml4u4QeO
	+jBXlVJIVstcSTBEX9Fj99rI97gW/cu1hyW4P918UiQVWpHj+kV1mUIm5CVpkenM
	KvX5NHCiNBCx6p92ZNxuKlig5ZLX6GhhCJK3CBVyuvAcT95ew/giFSwVrcEDvpEC
	IFm7RAowR0w9BGzddPxdmhzfFBjK+1fb+sl+RF/+v+z4f7Mm8tkxVwu4xVsbXF0g
	XYXY4O3injzejLR8tATGIrOWRiGTwhO6a8SpqFnHyx0OtLQVlSEhlFQFFPMMe3Tt
	l+FoIz52Q7GbdBrMHVHBGT1k4DuwK77KJ2Ln4a65lV5bXLzWH/c9KJIbIZzRVPfx
	qg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hq3693gq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:18:01 -0500 (EST)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so755983485a.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793711881; x=1794316681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rr1tlQBq7U5BwiX6vEMfxqxjghMI78EhaK/RzdUs+N0=;
        b=W/jUhAvKF3iXQ+eNPijTfFYJANECHUju3msVvh5fx1AcpdxN5mms8h2+Xuw32Gw358
         L/8jxdceRZCMiXgF434xYXnBR4m3stqy13m6UsicJXkssKW5YK90YFFP6koeUY2JeRI0
         4nlnY5alI/GahzDr61c0KWYTD2xQk0GU1wC+UzuInNnwzqgmXGUTY5541XL9egxtH6Dp
         82aHWwxJuIRXuYUzWN742IQNEi4VSTTaq34mccTtIur/kXj+1y+IpD3hrbhTIjIDW2/c
         LHz3ZA+gQ1rXvNMp1jgARgFcLYcqQs6LriLPXxwhXXVU5flM5sJmBf5G4aPrdMBfNK7+
         8ZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793711881; x=1794316681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rr1tlQBq7U5BwiX6vEMfxqxjghMI78EhaK/RzdUs+N0=;
        b=0LfOO0PqfaFCFI1WXBovSiHVN0U+/713g3xTjWfifJFA3IPfe7DeS3pScFJJKHUJiH
         nzecvBYVlbZxK5EJx50U76b8inwX7uHO7YBHUjhMscOsIW0Zy2PLH/QchvyrE/tIQBwu
         I4prcAw5AGW/NTaZcYXRyh/QV5kpYCE3cmB17SMrWZpQ8Mb4IMZi50vUk+PrpojrxanQ
         Gpi+iL2mJM7PpvwVBdKaJ2JvS6wDPQ7oADrfSkUF8UCziXo9Ltpj0FAQS9BYUy0ebsYx
         KsmrdWAgTNGBsQE9MYetY6/B0Bbr3LwY3JqsWx2+R544v/PgLEm8LHBDmzyet/QStHtM
         ku4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxTm33XbG/HEFvdnRw5xBWoHTu6pk3Yk+4Cec3gOlcEzyX1aVm1WhIUjuzMf0Fb32k+43jeMj0HW3iB++Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/O5+rnM7ERMbqQlw3uo37vzn4PPWzWVXBfdoV58SOWTz4nomXh
	7EZvxSoupNxVQUait2OyEmXnQIcyKB36lwdZ93dfxPNkrmucU4pE6WFi1Na1kRf9R8COtLDCuNr
	IGHwQuAKYzfWthEu6MBjxPBLdywILP1UQ+aCjfdI3MGmePjg6DcBoSCPkw3KpYw==
X-Gm-Gg: AYBFou3aGu8f4LcvUB6qMElcjeXA+3UmsaBurXvYQ3Yboy+JP8qh+0lDD5Mwcg2wHSi
	0FcylpPI/5eZCuXB58Bj7NnbKfaDj41yhe1j5RqZdRyuomQVMVU0+NDkVy0VeU4VArPNXFoVJyo
	dwON1HfSexg364PIzvy77A8cmdQ58Xzuh/myEgz/IDkEJa6qYETqCQPRSHLnQMQLWgvHJRlKVoT
	/pzpJ+Tsn8eLeqa7wUHXLXq9hZu0vx3ALDJ4Q5Qvm1fYb1rW/Z3Pf4TeHIkinUNZcLJi0O8ZGgq
	IN1GCarDnGzPA54Z75anDax2YDB1ITtkl5KqgbUJYErgcitnErgLyHzBuHSLHcppymW3pHqLtwf
	dlNqzlNqWAEr1DBc/MwMlJUzx9hibcnScGnVHAk//VzAVtzMnZgt41RhdoCQ=
X-Received: by 2002:a05:620a:1a24:b0:93e:c12c:43f8 with SMTP id af79cd13be357-9442171aac1mr2090451285a.69.1793711881042;
        Tue, 03 Nov 2026 05:18:01 -0800 (PST)
X-Received: by 2002:a05:620a:1a24:b0:93e:c12c:43f8 with SMTP id af79cd13be357-9442171aac1mr2090434185a.69.1793711879097;
        Tue, 03 Nov 2026 05:17:59 -0800 (PST)
Received: from [127.0.1.1] ([37.142.147.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa5781c9sm62076885e9.8.2026.11.03.05.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:17:57 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 03 Nov 2026 08:17:10 -0500
Subject: [PATCH 12/16] squashfs: step squashfs_readpage_block() lookups by
 folio
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
Message-Id: <20261103-squashfs-folio-v1-12-7b0fd4d20882@columbia.edu>
References: <20261103-squashfs-folio-v1-0-7b0fd4d20882@columbia.edu>
In-Reply-To: <20261103-squashfs-folio-v1-0-7b0fd4d20882@columbia.edu>
To: Phillip Lougher <phillip@squashfs.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-kernel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793711849; l=1326;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=zikxS48M0+5fO8GILkX1/eMIE+dh/4snik9D38v/Y4Q=;
 b=NzUFDr2zz+q6PkDHSjwTE4sPdHmdJbocZMd2REy+NbPVknvPJ/NaCfXWAxWJ2YSNWbyDpfkxt
 kQOwxGHoMxkCRtsHsbK4MoHzc1CbIag1jTSbu/ztG9dU/edHPPVTF1F
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfX4QzMbuPHKjOF
 x9nWXSfHAmM89xseSe94ESSffJVN6KZheQFpW38v+Dg/kPrHiuqpCtqw2EMG2au/usNkWYpBbQ1
 tjbpgM5f3KVmj1k30R4KCFPbZkqp8ZmbHdKh1SjynC2DLk2kqRqODgMM3PI7Hax3HIOT/1dIBsT
 fmwL3LwwQde9h6vHTFcJ0tUJ34JlGf+/X8LCOBFEdXXfBK9SjyX+OPYtgAM7LnFYnqYzd4IXPNJ
 zrr7hwci7shs9zdhTIVpTN+tRK5mR7V7rfJzcXpu+ZpQV95FPVl1ZwGJDt4z16ggJgm+pt1xU3i
 JIHp20OnOCKngcIUiuIUkRG86nIH7mw9SFqzpPNTJPmroh8gj2cMozo4tlp085f4vnpTRUF+Ulp
 LvhPHgcIJ6Vd8ZkrsdPlPoaqp0AWmfdW8P/YNUmMa5QiZAviDgeRL6SijKbKaTOW9vUEV9J5PW/
 zb7X80G/kCKxrniWslw==
X-Proofpoint-GUID: WMR-pcCkT6s6qMIcmYfwqTnONzktovYf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfX+O1gslCltgJY
 8HJ2EyPnTUKbXOE4QFMjGi3y8BP6sknJJjvtdEzeK7v1S/VVrRgy4c3tMKk129yW7JeyjOwKcGF
 vrGwQ+tiMCOEsFLJMNF8xTUGSJp8zGWRjv7c73e6yHiMRq25UiXh
X-Proofpoint-ORIG-GUID: WMR-pcCkT6s6qMIcmYfwqTnONzktovYf
X-Authority-Analysis: v=2.4 cv=RKEmjIi+ c=1 sm=1 tr=0 ts=6ae9df09 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6RgaMXXTExC6Yw++yBnrug==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=Qm0qsxP7aFY2tkT6R2MF:22
 a=zldF832PNz7HvlKZFzMA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11954
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 lowpriorityscore=10
 impostorscore=10 suspectscore=0 bulkscore=10 phishscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030052

Have squashfs_readpage_block() move on to the index after each folio it
looks up rather than to the next index, so it grabs a large folio once
instead of once per page.

squashfs only uses order-0 folios, so no functional change. This is a
step towards enabling large folios.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/squashfs/file_direct.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/squashfs/file_direct.c b/fs/squashfs/file_direct.c
index ef522923e6a9..110a5b14f9c4 100644
--- a/fs/squashfs/file_direct.c
+++ b/fs/squashfs/file_direct.c
@@ -44,7 +44,7 @@ int squashfs_readpage_block(struct folio *folio, u64 block, int bsize,
 		return res;
 
 	/* Try to grab all the folios covered by the Squashfs block */
-	for (i = 0, index = start_index; index <= end_index; index++) {
+	for (i = 0, index = start_index; index <= end_index;) {
 		struct folio *f;
 
 		if (index == folio->index)
@@ -54,8 +54,12 @@ int squashfs_readpage_block(struct folio *folio, u64 block, int bsize,
 					FGP_LOCK | FGP_CREAT | FGP_NOWAIT,
 					mapping_gfp_mask(folio->mapping));
 
-		if (IS_ERR(f))
+		if (IS_ERR(f)) {
+			index++;
 			continue;
+		}
+
+		index = folio_next_index(f);
 
 		if (folio_test_uptodate(f)) {
 			folio_unlock(f);

-- 
2.39.5

