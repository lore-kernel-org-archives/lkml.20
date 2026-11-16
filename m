Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794866909;
	b=bb5uFj/WkZNhhekFpiAPD3bbOw+d+/n9xOZUmj2fErMmi305TJAIZkkM7eAlP7cFw89r
	 XXY0Hc37bw1/63Q+uHrLNtDNap79WvS+97ksZ3Dd4Q6cF4mUqH3NS1/JhrZ69DzlH/oa4
	 xh90BY2DyUtfmhEsselhGsMPn4SnGUpUs3QJvy7n4zMHn1Q9jyNAfEOU5BSDi/DWlVxoh
	 Rji4zYSQW75QSRPoYEfqj06HX/Wa5ThnXHXDHfkIIY2Q0JKUorJSlIN6fhxU4soxM/aOH
	 aWos91tHPzdlA+MWgl57wKtiXqO9+2DKch9Cdj9Ld0l7HkGd+nk1yeLfjTjGKbKLKCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866909;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GJ5b+6wmoMaOFvcGByrVJwisKvHFAIIDntUfxnLnHrQ=;
	b=k87s8OGiJvjnAqOJVRGDyUt/iaiaUkfJcIsOzgjRF857e3r74yW5NSTBaEhBfHQQbkPr
	 ehNoUbKPn2XiC+Z0CxOWwLvoXTj0hKf9V12HtckiphJMq3Oam6jxR9YbR7eOvlJMv3T6K
	 SymuZ7E9JTCqagd+R3quYvn5hk0SDXeiikIfIBjSY0B8tgGmabPDLwvUjqbFcI1UeQVrf
	 LScmM8h8umHJMerAaOpfpq3ZUVq9usZ46N17T6WXvJkpAX5cJI6GohDOs9Ka+ZSqv3hDG
	 A7HrcN+pP0GACNej1Z6Bym//XPHH/HEn9OvJ6/VoT3Ia8GWVOQvXBjQcnq2cy9h6l+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=LNO9rj1g;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=rtKkYSYm;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033B960A2617
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:08:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 033B960A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=LNO9rj1g;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=rtKkYSYm
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGLYouE3930056
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:08:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=GJ5b
	+6wmoMaOFvcGByrVJwisKvHFAIIDntUfxnLnHrQ=; b=LNO9rj1gZc0/snOrs1Yd
	ZhuU8buOzqnNHthTEsF5yivVdkx0FDLxB5twFcb0Y2TA9NJMdebjcNKSNXfPedBy
	fpNR7csrycmEOwhJsTS/494sJsjsJKgNKZBnkLF15fCS4ddty3I1a35ammoL27Q5
	5l+bKwjCuKQF8DwYtKMPYr+v+3kGNcaEW0JAO5BAJ/K+avC6rkNrSwqUE4e8oLYY
	QkcrgZSt6YZaOx3uBV1BGkfN4r6j/b6eM3VTjRKlJlrdZP6pgV3Qyfx24UDlGzDM
	PM+iCurx0Fze5C91KhQysgaQ4nOPhWwFw0yIY7sjTQuT9ldZRdGTiNsAUzH23gVB
	Hg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j059au92a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:08:27 -0500 (EST)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f37c94ceeso54516285a.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794866907; x=1795471707; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJ5b+6wmoMaOFvcGByrVJwisKvHFAIIDntUfxnLnHrQ=;
        b=rtKkYSYm2F78Q+cKiyuYMV11pzVqcFCYbUBmxux9uwppvbuBIsFFkN8DDDWQOgl8+P
         zEa+ZIS5vVz638LSKRtupn+7V9ep8fcp4PFROuJiYZQUjxSvdRAEMumVNfTGkWLF7GUZ
         8nstlbX1scDwl3BaOSgPsIDY4bl+ghgWEBXktYPJ3cbQ2UMC1R02VHy4KIFvD2+v8n2v
         0ajfnDlXofbqlT1/HBPd4uwhAsUuxRuBYA3x1hkko4t0dvMJ3oBA5wqAF4lyzkDAtt8r
         AJ0nHNxkITHvfZcPs1HRnRhAeYeYsFlhV/uQQfbXvHKoKtPQsGWAK7VNpOWp6iUALSF+
         ArfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794866907; x=1795471707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GJ5b+6wmoMaOFvcGByrVJwisKvHFAIIDntUfxnLnHrQ=;
        b=dSY4VXBy/fJxaLfSpUWbmzheyTNbIbw1/BK0tCnRT9d1K42rK4a0tOkRTLE+VWT4va
         c6vL63+p/IDPg6dK9aUmWRYdeWeza1D15HhTf7kwKUV3cetlC15fi8reOXIYrEd+pruA
         PvRlrwsb5XyEidNXlZvXngGJE0OVhWtlG2j42ms5GdB/1vtjW8/DlVyEcj6qIhOBlAK6
         1wuvdp66+sJX3tUQ5jz3NOx7KNpgXTPfscn/0TemDzmVUb16YiJli4nD9L4mP3uUetos
         /FpbGJLubSxnmKAPVrWhmYFsFA+knP5QdFn75N+mBKDmqK2/nZsjbPeB/ALsmWYGAmva
         Xsqw==
X-Forwarded-Encrypted: i=1; AL+hErHp89APHiERn+V0+oPdixhts2p7zlxZJSON4E93rCgRFZC6zW5WpK3VH9pXSSozl886RspS/6r/BaZ6/i4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8c+mi36JtqK2SCmu/zvUK75CJYZQqwJ3jFsVjmc4iVHqHVgK75
	Nfr7bbwIMQnqxSgFBMqIq0G5qp4w/R11FVaWJD/O75KTnRVzktx89tixXqUb8fSLmQ/eB7P7JNW
	yu4gA72S7zxTvmM6jRucLdRBu13Fh4wtAy76UI+xpt+RUyXOqBWhfJ9l6NwuCMA==
X-Gm-Gg: AYBFou1Ri2pSt8r/DQ+giuT2ldD4IvvQIJCGaKwJ77oCuRdJ6nQ8sLPK8zi5XBxrbG/
	kCD6LNqyA6KGDI/ylsRoX+YqevwOp1v3SgTD8G3iTR9YVPY+6p6yWZ1c+l2j/e3bD9kBnz2PYsg
	Eh3utF6TVDY/GNYCi1i6dTrQyYP172SFl6rX+lpRaDCbcYQfjfBok5PUwWik6a/YD4XIvkwCC5D
	Q65qLMKnUYeyHqBsDH8DVabnXh2BM6nz98gCmhwuRY15wNvl/iQ/DxmigU7Ezlff+cZ3YMAaSWv
	+dwcxfBG3j0lxuhj0eYL75ean6RruZG1kB9sO11lfmvH3zh/rkBtjbKMH8nGDR3kprWkZMnptUn
	TLTjs0V4YUjBHTiDSZRoVD7ky9uBKTTC4hAUGKpf5MqE8Mi5x1K2tE0kgIhP2TCCOkA6WglXNDG
	5QdkmC04xZbA2ZAxdZU4gF
X-Received: by 2002:a05:620a:4414:b0:93f:17d1:9428 with SMTP id af79cd13be357-9498b7a98e5mr162041185a.14.1794866907409;
        Mon, 16 Nov 2026 14:08:27 -0800 (PST)
X-Received: by 2002:a05:620a:4414:b0:93f:17d1:9428 with SMTP id af79cd13be357-9498b7a98e5mr162037185a.14.1794866906984;
        Mon, 16 Nov 2026 14:08:26 -0800 (PST)
Received: from [127.0.1.1] (nat-128-59-176-174.net.columbia.edu. [128.59.176.174])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c86c946sm951838885a.25.2026.11.16.14.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:08:26 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 16 Nov 2026 17:08:12 -0500
Subject: [PATCH v3 06/10] ecryptfs: use kzalloc() for the header buffer
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
Message-Id: <20261116-ecryptfs-folio-v3-6-1aba8e620eda@columbia.edu>
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
        Randy Dunlap <rdunlap@infradead.org>,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794866899; l=2395;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=DAdtTEUZtFUeBHnOkeUrYySm2NLUFnvIrS8WFRdGNlU=;
 b=2Gur6D1IhzZI1dG2RB+f56W6Lxau5cLBMNZrXaK/3t9K3+X162zSFS7g+mRXxaQ+KX09DnJY/
 VCpT6M96z1zD1LWP0JBdYx+y1vpm9602AVxXCx+cYewqMgd+PtoDxB2
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: z43AW-kJs0DMbGV6BDfx96gxbhq_I5rD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA4NyBTYWx0ZWRfX9BZJPC+6TYYH
 N0zWXFBL0moqt/HaK9x7YAszjB/o/2oQI4wpVLp3ZS+WKWc23lWEGHvv07NWJfu3jIm6LuTyloq
 dqdJ9waPmzEFFDXjmyxOn8fUe6pZksebZ91u93/3iPbUCAOIxReY
X-Authority-Analysis: v=2.4 cv=Ta0DJhQh c=1 sm=1 tr=0 ts=6afb7edb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=KPY1cyGZ6h6m4ASiENTC8Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=JWifYr5Owm72-P8M7WcA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA4NyBTYWx0ZWRfX0gJaXEVcKgXn
 +zkP4qbZjDRm0BV83wfzSBbQ+rAJxHt1io7QTpds8QSoF4FYmghmAfeJsyd9dD6XmfHaBL7TNa3
 0FVxetPHfjS8O+3sYM5zvBsxSkqjlqNNXyguB3GaIDLKxmaQcWlD/pPHHFUmdJngAlZ4JhwU2ay
 lh7+llgdSUdCe8e3RSi8r/0r15qAFtzaIbkmkVMli2z9htk+uf6suhEu4F5FsREUyQfk9Tx/E83
 TkWBm60H7cksqgFd/ePIia0tQ6vDIYeKbi35Soc4U2ywRqTJEZCZXLse9mW2VdqsXcBBqUXrOUD
 wfVWFN0jWmSc5ELhz75ydCvLc3EEjNPKwA3FrOfn0e6AXaQTCUodLQt1GlISfvPkbjd3a6nPk09
 tCImA3HOXGY9V6w7dUnCMNXQs2Yv9KH0Yp5+sQyobRkT0lb9q3NWMRUz4Wr1URVvr4T9yy5Jd4R
 oGY9tES4CqwpEnArAOA==
X-Proofpoint-GUID: z43AW-kJs0DMbGV6BDfx96gxbhq_I5rD
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 clxscore=1015 impostorscore=10
 phishscore=0 priorityscore=1501 bulkscore=10 lowpriorityscore=10 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160087

ecryptfs_write_metadata() is only called when a file is created,
where ecryptfs_set_default_sizes() has set metadata_size to
ECRYPTFS_MINIMUM_HEADER_EXTENT_SIZE (8 KiB), or PAGE_SIZE if that is
larger. That is an acceptable size for kmalloc(), and the buffer is
only written out with kernel_write() or as an xattr, so it doesn't
need to be page-aligned. Allocate it with kzalloc() and remove
ecryptfs_get_zeroed_pages().

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/ecryptfs/crypto.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index 9b8b0c5a81cd..6a014872e919 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -998,17 +998,6 @@ ecryptfs_write_metadata_to_xattr(struct dentry *ecryptfs_dentry,
 	return rc;
 }
 
-static unsigned long ecryptfs_get_zeroed_pages(gfp_t gfp_mask,
-					       unsigned int order)
-{
-	struct page *page;
-
-	page = alloc_pages(gfp_mask | __GFP_ZERO, order);
-	if (page)
-		return (unsigned long) page_address(page);
-	return 0;
-}
-
 /**
  * ecryptfs_write_metadata
  * @ecryptfs_dentry: The eCryptfs dentry, which should be negative
@@ -1027,7 +1016,6 @@ int ecryptfs_write_metadata(struct dentry *ecryptfs_dentry,
 {
 	struct ecryptfs_crypt_stat *crypt_stat =
 		&ecryptfs_inode_to_private(ecryptfs_inode)->crypt_stat;
-	unsigned int order;
 	char *virt;
 	size_t virt_len;
 	size_t size = 0;
@@ -1046,15 +1034,14 @@ int ecryptfs_write_metadata(struct dentry *ecryptfs_dentry,
 		goto out;
 	}
 	virt_len = crypt_stat->metadata_size;
-	order = get_order(virt_len);
 	/* Released in this function */
-	virt = (char *)ecryptfs_get_zeroed_pages(GFP_KERNEL, order);
+	virt = kzalloc(virt_len, GFP_KERNEL);
 	if (!virt) {
 		printk(KERN_ERR "%s: Out of memory\n", __func__);
 		rc = -ENOMEM;
 		goto out;
 	}
-	/* Zeroed page ensures the in-header unencrypted i_size is set to 0 */
+	/* Zeroed buffer ensures the in-header unencrypted i_size is set to 0 */
 	rc = ecryptfs_write_headers_virt(virt, virt_len, &size, crypt_stat,
 					 ecryptfs_dentry);
 	if (unlikely(rc)) {
@@ -1074,7 +1061,7 @@ int ecryptfs_write_metadata(struct dentry *ecryptfs_dentry,
 		goto out_free;
 	}
 out_free:
-	free_pages((unsigned long)virt, order);
+	kfree(virt);
 out:
 	return rc;
 }

-- 
2.39.5

