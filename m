Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794866913;
	b=NJtnFY057B/kX2IIPu8KD5SCm5HNj+CYqLkl0WZPaSCcSRqi7Rr0413xhpRb7aU8vt4G
	 kuBxBl6ZWulK0t2b8uPnDd95XsVjHNnIizsuBOz+Bk/Tgn4mTgmy0rHnwbqx2ROl3sKa2
	 u5FNvSwNyootXnkZs8kBjSWM35sAH24dlyAUHHe7eynld4Ew9HyAkkzV9SxG0kEWjPhsk
	 PNTEdB2O7cSDzxQ7m9fDEYCpOeTAfV4EJykJ96IWA3L98OT9yNlIA8qabM8p2qyL+/q1/
	 yslmYOoPzBnSH5GkPW3Avu4ToYnSUQykp2OG+VG0U5FjMROcBebGQuBIH4A+wJ1I0Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866913;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MfrodZ+vmY6ItwdAcNnP6Ro7yOb/7bLr9QT5eCmeHrk=;
	b=f073O5fquiH+xC4RaETrVTU3M+27Z+hhIhOgUSdTazYFJQnP2yySkEnLyI5GWyrjywu8
	 TcqlKIxqUPkhQ9BtADKXaEZA1G/nMrrabGoOeso2hpZ9MQWyxtEXSk5OHNz6uzFMCvYkj
	 WvTSutKqnDiFztk60vSPujNKMcPoCXPPCQLA4WeMWSrKwtkOa1T1YX01T3g0A6NIlfgDQ
	 hqniHZiitp858sMSP7QzCprQ5G9i9kZRYPR9Y32L/HjVT7+EkQXtDdqQB2ly4EHtXTn+v
	 BIqgb6q2+22KEcWV+dFkwZ6iVqEhVuhw+/Bd5qEm/zDXbYgkAszUxKH7639D2SXls0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=P3o46maC;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=D5i146Wt;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546E1606A331
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 546E1606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=P3o46maC;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=D5i146Wt
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGLYsRx1009603
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:08:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=Mfro
	dZ+vmY6ItwdAcNnP6Ro7yOb/7bLr9QT5eCmeHrk=; b=P3o46maCptDLVSaglNtF
	ZFD+eLMB3MiByWj684Uuj1ssfn1z+Hhwmu4s7PPFAxxeAQu0lbhPAbD2iiP7iBh4
	lkN36EhE2DSTs5LCRTMTUpVODAuiRdz8+X+zzaMkjFNYHg2grFDCUP1bOzS0S16e
	DRHx/l/c6bcxDZmH43n1UUytG6IYTLfbQ1RKP5TrtaN5I4URfiL+biQ0yPN0ecmS
	YyMCIGe7KDWoxzKIKP4A5+90V+vHpQ5ojfbL0fb0nX1XfE8pG2dmxuA2MF5RBzdC
	YWVkLPOoKsHgQNYEvgsHElUMiGx2hYNRsdKiwKL3TqcTPYLOsDgN7/+FZFU5mFCx
	Yg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j059qu893-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:08:30 -0500 (EST)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-92101559a2bso415906d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794866909; x=1795471709; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MfrodZ+vmY6ItwdAcNnP6Ro7yOb/7bLr9QT5eCmeHrk=;
        b=D5i146WtoByJ1WjMGZww8vAA6AYWgHfFz4i5BCC9/8YLijKhbR9Vyq6HUSGg4rg387
         q0bMJlO2OCsgtJuA9RELykax1mRpI+cNPFKgm+SgHNZV6lD6QV/lWJN54IX4drFcpqEA
         MHWvSlrRL9E11rpPJm3dOskw+uj4ASUJg0GM6eq4pCLRzx+GQO9CnpZTwdVX3R8AA97t
         XAOUWsmTNXmFTV0vXSFQSIizImD9QpOlmT7girnDhL2WUdFyfa/6EAlkIK4UQIgPZdd0
         0Hk5iJoP657Qe+MyUS2nvrVsxCoLtcI07ZjFTGQ6dv7MG02WZKsDioM21ar0KVuQsUli
         iaOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794866909; x=1795471709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MfrodZ+vmY6ItwdAcNnP6Ro7yOb/7bLr9QT5eCmeHrk=;
        b=iuQcsFKrLewGrrndnKO5eC5+KuEoHQanydT5ZFJC9pUt+tJ8358weB8F4CjlwjKEfC
         53L1RJSP0sHA7eJPVUQc5YLcYx2YBQeHry6kxfduQ8bKSDW6fXD244psrM84Qj86GMxp
         pZyFn1cBQPJf7NWhuQsHpHvtK6jxHo0e8zp6aQOOc0dM6B8Ordixjg4cFdbWCMyMEmGy
         oYov87qaqEGT00yAKFN/+bc1EmtFloEJ8qpR1EU5YClHQWqtt0CfZFG4le8PAuckt9xq
         T+jp5kpR+Jkx2L6qvKroW4mHth+t11uwvZKs41fhEMTmNp6l4RQ7lWgMMgO1yC6b868g
         LVkQ==
X-Forwarded-Encrypted: i=1; AL+hErHKqtVmEG8ClT71b7AGE+NyU5+b/V2Vfg+TwP8c0r3As2d3yL73YS1es58H8T3IUPodvDsU3n0G/jHOEDk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1mT2cuSQC3pz9Jg9nzEd0fBlevrsj1GANUwKfiTPk4jyaeEWO
	a6wcuiDPE48prs5fD/dKJXXYjazq7Mi5HQPjx+IeUavTeY0Efnty49ejbXdOTt54bZekcrbNjlx
	Eyr/sUQl3Hafh3vEajQ0Ty+GhgaCnT+QdM2mjigbu0RCwyN7YAPyiO++eQw5eAQ==
X-Gm-Gg: AYBFou2Bqc+2gR3o4Ojwvn4ChGuB/6xOa6nFvSgEymteLdH4SbOUk7fCILL+R+9DISA
	dB82uLytd+/FqYCVxsVw5hXEGEp7MC2zJp+4hQwZSuPzIa5LWZ2JCiJjEmKaEtxgf6uzPaaNCrZ
	hBRiHJbcmRweJxHmaCOKIfkQl2rn3EqLd5bQg6FJ0tMkn+B+QLMZ0CxuT8/0SeDDI+xrvzud3T/
	1zlEKkE6c7aBD2HVI3150Vm5lp6XxjhVldcuNxPFaisWYG+Uk9lx9imJPXEEgroHAFZJBZKlZnf
	Y1SH5MD65VzZk6mx9HozlaPYrxP1qivIdQs6S73GwboF8nVXk7HpSAGd1Sak+QyYcJsqIWbmu5S
	byVldHUZVsDKCwmfwWzSjA5JXtkyZzrudJ/AV8nLRW+gD+7gRsucH1zNQX+eYrflLk67ESd+ebB
	bOiXEaLc1INtEuHwEU6HtB
X-Received: by 2002:a05:620a:90d3:10b0:949:744e:12eb with SMTP id af79cd13be357-949744e1528mr716581185a.65.1794866909614;
        Mon, 16 Nov 2026 14:08:29 -0800 (PST)
X-Received: by 2002:a05:620a:90d3:10b0:949:744e:12eb with SMTP id af79cd13be357-949744e1528mr716578585a.65.1794866909227;
        Mon, 16 Nov 2026 14:08:29 -0800 (PST)
Received: from [127.0.1.1] (nat-128-59-176-174.net.columbia.edu. [128.59.176.174])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c86c946sm951838885a.25.2026.11.16.14.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:08:28 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 16 Nov 2026 17:08:14 -0500
Subject: [PATCH v3 08/10] ecryptfs: zero the tail of the last folio in
 place on truncate
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
Message-Id: <20261116-ecryptfs-folio-v3-8-1aba8e620eda@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794866899; l=3672;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=YU2D0h1+YiZ8zzlfyo96f+8NuGaYq6vNDpSn5r/Qj8Q=;
 b=3t3nFJecH20Q09ngSn+Y1yZUNXrl006bAUIgBb32KB9oci0ZPGg6emOGeeuYivABA+XnZz0LG
 vsKCdt1VuSkCKis2rlEiIM7Yz8A8rWs1nS9PZZoEONgCvshI/w+xQKW
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=L/qI0OT8 c=1 sm=1 tr=0 ts=6afb7ede cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=KPY1cyGZ6h6m4ASiENTC8Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=Qm0qsxP7aFY2tkT6R2MF:22
 a=dGUJCdGidsCb5_L8LY8A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: tPR_gkM9LpoEdEkYOYol66G4srGsJYrX
X-Proofpoint-ORIG-GUID: tPR_gkM9LpoEdEkYOYol66G4srGsJYrX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA4NyBTYWx0ZWRfX5UgvAbfKab5U
 X4sfskhuXfCDW3+tN/i0X13zH5i0JuxmD8xArh0DaHpJW70cFLM4gYOVrIMkuftcnm6oERygYKA
 CvBO9S7J3HZf3eR86KAqDTFzCCsU8WyejfHfFuZdMEKJ4iSRQDl2YvkZRnnHt5XJTDzIh112Eok
 zRiNUVmuzgGZZbJa2WOsanPyQe7ShfHAlWwBcHi3dUVl2eX0EiX+y0fyZEoq/61trH879TgGrZQ
 6EdNVn9iBm4EiOxD8agbMcKuTpsVs2xyoAPPxf9kOkRXNITOqPaqKjtki/gtFV6pkOBW0MYh+Ww
 L9gAalndCqJJbtegXYGaNscJ8Po2ZVC8tlWOf3UG/0RYUiWdohScaqUHZA0nBmh+R3dpD4aAZKV
 hhRSiFqrz/q81iyvhgJ5Asbci3b+dMT8ldr0GPeSKtPw7mHq2oMj/0+V3qlRJ/P7TohxxLKys8q
 CXcmNHDsTbjX3rAR2xA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA4NyBTYWx0ZWRfXxVa6BthFnjnG
 rX4oUpX8wZw2PLLxwJPDUSmEcFTdb2GYloEJKyDKQTZIiKZp46q0B1OpXGppFjfx1cW1ymgaf/F
 QVvCPsxFaBM4f/uhq/MV/Kt8Rc4zbSNIXuhfFnsQOJy8cWoLnnY1
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 lowpriorityscore=10 adultscore=0 priorityscore=1501
 malwarescore=0 bulkscore=10 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160087

A shrinking truncate zeroes the rest of the folio that holds the new
end of the file by copying from the zero page through ecryptfs_write().
Zero the folio in place with folio_zero_range() instead, the way the
truncate helpers in other filesystems do, and encrypt it to the lower
file. This no longer bumps i_size to the end of the folio and writes
that to the metadata before the real size is written. It also removes
the last struct page usage in ecryptfs.

The folio stays locked while it is encrypted, as in
ecryptfs_writepages(), and is marked not uptodate if that fails, so a
later read goes back to the lower file instead of returning zeroes that
were never written out.

A page-aligned new size has no tail to zero, so skip it. The old code
wrote out a full page of zeroes past the new end of the file in that
case, which the truncate then discarded.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/ecryptfs/inode.c | 55 ++++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 42 insertions(+), 13 deletions(-)

diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
index 525297c7ebd8..ffab685688ab 100644
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@ -718,6 +718,40 @@ upper_size_to_lower_size(struct ecryptfs_crypt_stat *crypt_stat,
 	return lower_size;
 }
 
+/**
+ * ecryptfs_zero_tail
+ * @inode: The ecryptfs inode
+ * @pos: The file offset from which to zero
+ *
+ * Zero the folio that holds @pos from @pos to its end, and write the
+ * result out to the lower file.
+ *
+ * Returns zero on success; non-zero otherwise
+ */
+static int ecryptfs_zero_tail(struct inode *inode, loff_t pos)
+{
+	struct folio *folio;
+	size_t from;
+	int rc;
+
+	/* A page-aligned @pos has no tail to zero. */
+	if (!offset_in_page(pos))
+		return 0;
+
+	folio = read_mapping_folio(inode->i_mapping, pos >> PAGE_SHIFT, NULL);
+	if (IS_ERR(folio))
+		return PTR_ERR(folio);
+	from = offset_in_folio(folio, pos);
+	folio_lock(folio);
+	folio_zero_range(folio, from, folio_size(folio) - from);
+	rc = ecryptfs_encrypt_page(folio);
+	if (rc)
+		folio_clear_uptodate(folio);
+	folio_unlock(folio);
+	folio_put(folio);
+	return rc;
+}
+
 /**
  * __ecryptfs_truncate
  * @dentry: The ecryptfs layer dentry
@@ -739,7 +773,6 @@ static int __ecryptfs_truncate(struct dentry *dentry, const struct iattr *ia)
 	loff_t lower_size_before_truncate;
 	loff_t lower_size_after_truncate;
 	struct iattr lower_ia;
-	size_t num_zeros;
 	int rc;
 
 	ecryptfs_iattr_to_lower(&lower_ia, ia);
@@ -788,19 +821,15 @@ static int __ecryptfs_truncate(struct dentry *dentry, const struct iattr *ia)
 	}
 
 	/*
-	 * We're chopping off all the pages down to the page in which
-	 * ia->ia_size is located. Fill in the end of that page from
-	 * (ia->ia_size & ~PAGE_MASK) to PAGE_SIZE with zeros.
+	 * We're chopping off all the folios down to the folio in which
+	 * ia->ia_size is located. Fill in the end of that folio from
+	 * ia->ia_size with zeros.
 	 */
-	num_zeros = PAGE_SIZE - (ia->ia_size & ~PAGE_MASK);
-	if (num_zeros) {
-		rc = ecryptfs_write(inode, page_address(ZERO_PAGE(0)),
-				ia->ia_size, num_zeros);
-		if (rc) {
-			pr_err("Error attempting to zero out the remainder of the end page on reducing truncate; rc = [%d]\n",
-				rc);
-			goto out;
-		}
+	rc = ecryptfs_zero_tail(inode, ia->ia_size);
+	if (rc) {
+		pr_err("Error attempting to zero out the remainder of the end folio on reducing truncate; rc = [%d]\n",
+			rc);
+		goto out;
 	}
 	truncate_setsize(inode, ia->ia_size);
 	rc = ecryptfs_write_inode_size_to_metadata(inode);

-- 
2.39.5

