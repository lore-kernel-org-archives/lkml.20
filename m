Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794866905;
	b=Ssa6VIgqUP1Jwd6UBVPJVkuUBSrh7mQE47T07Y646w5q2dlxE3LCCzcaBlwFbmo6F7QP
	 I9bqNAdWVrhjJvclDbbalpC8eyyN2SiJ4dGJtN1YLEN9dLaWKlQVhJCPjFwWWhTfiUvlJ
	 Du+C/xz4LL0/U27j1W5rNve8lJbnAvlQreMowWQJIKS+vaAPOKEpp+i3XhkhSj4gWTOtH
	 psihnFVMLU0h4z8wZD7hqoKstF8QikRWOw7YcorGcSxlN/e6uYziLz4WP/RXTnIsNPky3
	 uTRyCAajCtBcJFBuGJ3aqGIt+YCfIZjX25com3uQX9we8t1qe8hyVE7aGRbMBi38SrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866905;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+BUUSRwCH/JdV2kxSN0x89NUf4xI3ym93qQBVLdW8AU=;
	b=fAH7F6KoSefKJK4MXJejrvzXBHo34A1vEDq/ivxeQjKIJEOvHcPtZ55Zj8mnRDmWfgNL
	 nAcCEqzV27jltGA+TZP3TPTMtLuMfN3wL/yUW8wR7orPe8C+zYiOT/rKHA5AHN1kM7FOV
	 GgFMDLhUF/lxF6e8SB6EyLsvzjf8DptBG4n1gxfBe2SIVSfRQaKkmTFNI3TohG53PtMco
	 CdNyMv73YlTFAolIYY/lZqOxoVh0zy7T7vjDvs3EXnrJ5TPHdNW23/0S5WU5PfUsQoYBE
	 DlVUWiBCBb9zBPz/6SaOJpDFIeiplNJOjUqpKHmB/M8c4qfRLjq7cO7csXxHEER1uqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=XCfCoTmS;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=RZHzNF76;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F44606A88A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99F44606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=XCfCoTmS;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=RZHzNF76
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGLYnwD3278818
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:08:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=+BUU
	SRwCH/JdV2kxSN0x89NUf4xI3ym93qQBVLdW8AU=; b=XCfCoTmSY5EFYB4UlYO3
	80KSJrmAjvpCy13G/7eRM9eEXwpIlRuFzA4kHNFsO20yTgGsDX5QMA5i5OSPcnmG
	qhny2iVdJOhrv+AUOEannZXhta/zsceJI8wJmWaA+onHIlxCnIAN9Kw2j5hBPEdC
	2dznpzvcnDH7fk6rjBjQuawSp/HKgLSLMJduBGNbw8OnviEitOL/2ix5f9ItVZFD
	ZQbGQgl2EMCJkapkA+2vHjy5b+uoUP+EvFRIsM72S/2PM81B5MZRRmOkFKn57H1H
	41kPqEZmb9eV4lwpj5QErk73vRRmX+aLGn1Uldy4be1zMyfUJMfDYJMTrwStNDXw
	Pg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j059sb7fb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:08:23 -0500 (EST)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f32050e72so1111672785a.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794866903; x=1795471703; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+BUUSRwCH/JdV2kxSN0x89NUf4xI3ym93qQBVLdW8AU=;
        b=RZHzNF76vicFbD9HdD3cNyFfDayJNjPNAPA+hdOgJn/PM0eKjHCwhQaMuUTp4B5S+U
         r3q3Azj8VK/Uebbl0Kp6VmEU2JQl/TRSnxHCGd57nqKAIi9MO128FfcEqVOhu2HBznN6
         37IhREefrt+Rdn8nXmuoIbxn0tT1RoEkHyhD0Q+yazKfNsAoikgLBJ85OWQUucU48imM
         Sti0AQgiYTfANigQd5PMOdihtUPg+NQ41dmdQ+UZ1/3buSafeUiNmI5I2m3/btjYBOhn
         HKssHx5XGp1QcaxY9/Ql+SbVln5V0D15Ofz+AoTckst9CQhaCWNXzOtIMi429affJDIJ
         67wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794866903; x=1795471703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+BUUSRwCH/JdV2kxSN0x89NUf4xI3ym93qQBVLdW8AU=;
        b=CI8YiyenHoF59bheGmZDvh3ykLLYvU89tFR5JMUvzRSlMFwmlkAoWv+a5G2JY9Qgtw
         WplkLSZwmFIxliwFmDRuEjglrY+z8IkONuNzPayRNKUFRC6wtw+LoOj3wccquLX9ow7e
         3P9QiorH6NHuPEBDiWJHtKH7ZbZ6zRgxox1ZvcxfJWcSgaU5w/Bv9QPDJ+dgVC8sngNY
         7mTFJlMODzoYyXiTXZmo9H7M1taU1H7yFDcutXsITPWsxiAmwXROS1yVqceA//Vg4era
         Vvlky6QSfHKy2CPD6YqoxQu/WD/+b2uDKhv/EkHFVi0P2FfEo8TfnnqGg4G0/TRZmFEn
         mDeA==
X-Forwarded-Encrypted: i=1; AL+hErF1tusPpWFN+UGoEdkQj1gD/15MPT+3dvPilCzDs+QfUqLdJ4rJUL8ZaH9uszMv2izhrttIbSHJh3iJKHw=@vger.kernel.org
X-Gm-Message-State: APuU4Z92ljUOWld43JhY/WMz2n8RLh6J/yNKaHEVn+VaYL/1mrrWJAZE
	cGT0cF1V9Kbk2QyVbTgDyfSy9L4/dHzoFJx6VF38zLCZUdnZfEjjyC1fIZq4qZCgJUjH2l7EZ79
	JNalhUEdph3bqY9DDvRlAm8h7htJQV7LiKO6fhMQ4F4okmhHwS5aaZ830mq6d0g==
X-Gm-Gg: AYBFou1KlyiKguyHx+ny3leIQ+DZhrteSoUv0Kt9/pKj2jGpISgDqx3Opwa2M0LmVVi
	AjTuVUU0fpAHScwKewoDp8F+ZArgC00xBfYYT1M5GtO3xgibULj7XBpW8S2JPz5bHqTCLRpqjjF
	WpvxAkap2RGDqINloi53YxuEUEz5UPlCfjB7aFvYJscyDI4BvQaeVQr3JPDGdZL6zQyZDL5OTox
	/vGB4tSOnQLDvJ2AeJKPK66dwAYgr1f15qTWhbMnrnvvG4g28yYIewSP6C9ZEgX1vU//F84Cedm
	AelTkYd1UevwyVvH6jF8OGMv7ImcKA71nUz9YOD6gPBGKS7H1U8+lTs7cK5o7aVFuuA/ysq97Tn
	xVKUU8rHmQt+ZOByPxZxJSAiyjoYC6xFzhcuY7pl7Nddx9zMldTT/YyyzDNWtCq48VC3tII063/
	lUXCFmVDmJgTNhyLSK+4KJ
X-Received: by 2002:a05:620a:199e:b0:93f:26f6:6bab with SMTP id af79cd13be357-9494bb76ff3mr1959301485a.18.1794866902800;
        Mon, 16 Nov 2026 14:08:22 -0800 (PST)
X-Received: by 2002:a05:620a:199e:b0:93f:26f6:6bab with SMTP id af79cd13be357-9494bb76ff3mr1959297085a.18.1794866902376;
        Mon, 16 Nov 2026 14:08:22 -0800 (PST)
Received: from [127.0.1.1] (nat-128-59-176-174.net.columbia.edu. [128.59.176.174])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c86c946sm951838885a.25.2026.11.16.14.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:08:21 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 16 Nov 2026 17:08:07 -0500
Subject: [PATCH v3 01/10] ecryptfs: write from the right offset in
 ecryptfs_write_lower_page_segment()
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
Message-Id: <20261116-ecryptfs-folio-v3-1-1aba8e620eda@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794866899; l=1534;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=8Nz9Xv25MqfERbysf6jE5yhp7runCvsoFyhssOE8ZqE=;
 b=YSWHWjqVm/aXu2+0BIhr176Uk7LNmJVnPY7NZOSaiXT1hUctM7vw3CitrApYmY74EL/cvlqEl
 8SEBxp2ZeMtDY1Z8YUKXjcIoqKArtu9zOTlq+hKxZQCfnTt5OmFC1nW
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA4OCBTYWx0ZWRfX71ZEqmZ9227R
 iVdxQEGgI6RCSq1xqUqtFl1n3/A4MASXMhr2WLGvA2K3EZQFqM7jSwLpx1or2CvAYgwbgPdFjUg
 6bb6m02+bwPro2ackgcOjHO2JMpzvuuiG0G2O+0ilLYDmPSf3qs7rB/6bvpXn8oTmM2sIiHk76B
 2oOHH/3LH+wFZi2YnaWfANALeTA6dlnBHlzRWLsUqJDZQwSNjI2kwJIQAygZzoxg8ejOXSUxIea
 fVfaHQbt/nYo2Lea/CA576QAUBiBp/1TloUhmf4qcZUPeOzWLyP6VgzylhIq+wNj1dzLYki92bY
 2EOFQW3HkeWmOUlGWr9CULMjGQkMX++caxXZASodF7XNY5Cw6ooHTH90JDDVEL8OFR1VfVN7iKo
 0dwCTJi56XkrIMt0NfaNApl9ERlspQXt/NVtm/dh5fUHlNYYlW+UjftU4o4GY8/jv8tRPVX0KGP
 guuHTEx0+idLa0zLMbw==
X-Proofpoint-ORIG-GUID: djbGKbkiWl7g_BpJ3j8tC26cwMJ9pMr2
X-Proofpoint-GUID: djbGKbkiWl7g_BpJ3j8tC26cwMJ9pMr2
X-Authority-Analysis: v=2.4 cv=D63SufRj c=1 sm=1 tr=0 ts=6afb7ed7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=KPY1cyGZ6h6m4ASiENTC8Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=VwQbUJbxAAAA:8 a=w15lwMz24VFeALwmIwgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA4OCBTYWx0ZWRfX7pIpFhiBvjqL
 xi8sb0oyd0E89+Mw7Vquir3usO3+4j5lihECfJzGAG0QQUntq1W8xB8qNzXdfVVYTXmJIP6C91d
 r2nl25SgYdKqJnW5uQNC4TGlGOvuPs8/NzY0wx1B5FCJWRBofXzm
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 priorityscore=1501 clxscore=1015 lowpriorityscore=10
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160088

ecryptfs_write_lower_page_segment() writes part of a folio to the lower
file at offset_in_page, but takes the bytes from the start of the folio
instead of from offset_in_page.

ecryptfs_write() calls it with a non-zero offset for a file that is not
encrypted, which is possible with the ecryptfs_passthrough mount option.
For such a file, ecryptfs_write() is only called when a truncate extends
the file, to write a zero byte at the new last position. The lower file
gets the first byte of that page instead. If the page already holds
data, the last byte of the file reads back as that data once the page
has left the page cache, although it should be zero.

To fix it, map the folio at offset_in_page.

Fixes: 13a791b4e63e ("eCryptfs: Fix data corruption when using ecryptfs_passthrough")
Cc: stable@vger.kernel.org
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/ecryptfs/read_write.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ecryptfs/read_write.c b/fs/ecryptfs/read_write.c
index b3b451c2b941..e7319216a2f1 100644
--- a/fs/ecryptfs/read_write.c
+++ b/fs/ecryptfs/read_write.c
@@ -63,7 +63,7 @@ int ecryptfs_write_lower_page_segment(struct inode *ecryptfs_inode,
 	int rc;
 
 	offset = (loff_t)folio_for_lower->index * PAGE_SIZE + offset_in_page;
-	virt = kmap_local_folio(folio_for_lower, 0);
+	virt = kmap_local_folio(folio_for_lower, offset_in_page);
 	rc = ecryptfs_write_lower(ecryptfs_inode, virt, offset, size);
 	if (rc > 0)
 		rc = 0;

-- 
2.39.5

