Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793355990;
	b=W8RE65IJ5qeJMOfNonBrSrm8LifUtCiPLZpCXTknV4xARK4WHHEO9OxXhu/nSeGtL49m
	 O1msfaY1UnudmJty0jsUTZBqGyx6MORgOT4XbJ7xwNK42wgKoHyjTON8AY7x6M/3jh7lH
	 yXwW68qCuZ4PcPSLPUBgyfsf4fcc9fDWKAUvImFmyLFy1p8vGPPFVfPrOMPW+EikL2Kmd
	 LV+EwNQVaAqlDPeYIuIopK7nHeKoNBBGnh70sLOdt1e4eLhpp8MgHJqe6FJlsTOz9beVq
	 IDMbt6dzTxRZ/dpeG3W0uWEdEl05vvKGWfIrPsddnrU4AnlI5FrapuEn5ns7RJjzbcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793355990;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details:X-Proofpoint-Reinject:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1HR2RLdcMRaD9EbSYsw/zZt5bThBAeaFepmhayLTiyQ=;
	b=5f9qrON2EQm9wUuV9i/xQ65x6a7lCv14gushBBNXnMBZZgyUF1bZ0HGAQeerjcZafA3o
	 oiyqzvdhdceXuX5DUh8QaugxS2XTViPTUNKls87uzWWFNfdkjcfCnNfCLKYCZPxxvqKJT
	 sbcOH8JTugBEJTKp2iwdytfmmzHePHZyAWZ/S0D338IULRO2nOvW/I40lAV0FRq6s4i40
	 Cn5MJF7ir3a1qO4C9adxZI9D0aTVve3HrUVQ3MnEkoPs5y5jYyl3dJ+7jynoPIymfB28u
	 t58cgja5n9rP7TVuEOTSmEon+KzyOAKjg7LD2AtuT/52n2vcQ/3n2tVgEum/Cts4Cug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=HhhReTgD;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=HXSidAgM;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B041606A325
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:26:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B041606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=HhhReTgD;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=HXSidAgM
Received: from pps.filterd (m0167067.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UALGCl916732
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:26:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=1HR2
	RLdcMRaD9EbSYsw/zZt5bThBAeaFepmhayLTiyQ=; b=HhhReTgDrLkQruN7aUNG
	DofxGBTMk5hDDO+/pZbH+JBE/apyBBdXryOnYB8oR4t7J2EfAnyzDBURJSJji6xb
	OSHYztc+rKRCJNGSoHZsjBZ8orqhtigfSvtggvopw83LnsDHZ1XStqvl1ZdnLWCD
	hdNgllwZQBMQdw76VZv7SGxHrjTOmFfS7774R9ZSzY97TwhGeuviTb0vSZld5yqx
	RtvrCkVxReibIJM/CoWN7CxzBAg6y7OQC951DmwViBLM3dwrl1Ca3B+9vUDESGmT
	NsFF1swkIa4q2jvlYbnAorCj0eUg4SEf+amLsbxcHQMV/cP4T07vvVat7caZHm7T
	tg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hm661h77f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:51:53 -0400 (EDT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844e383so344833185a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793285512; x=1793890312; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1HR2RLdcMRaD9EbSYsw/zZt5bThBAeaFepmhayLTiyQ=;
        b=HXSidAgMWIUtyX2xnUuiL0B3P6LpcTB+P8jhIEaj7BZgkCg6WHWfhSZjiZExpuMVs0
         x+On9pqHPGjYbZS+MM1BEYmK2M+aSfO4DRlvrnMHZqWKLzVdB8nk6EBPe1lu03t+N5F0
         Th0zeHlb1WIBF8zLwg2HwmoPnEGKKnIWoPNcPRfalGfw1DCn4aiC1ZL/qKfCgp8iMFw1
         G+WtFpGIkGd69QcmCc2B5fhZ/sTxQI6pWahPv5O0LEudCthp+2ZXqNJ+AkONzqTSFBrT
         IrXTlitWAFhaLHf3miW4Ot8pOSXnGZ4G4norLbcDq2u1E80WXP10ceRAZaSg0+sy8a7P
         L+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793285512; x=1793890312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1HR2RLdcMRaD9EbSYsw/zZt5bThBAeaFepmhayLTiyQ=;
        b=Hr1uyWXNfu1bsGLHWM4NkpNAqNAD7sGXht7QvUrxsW97bn4T+d9ML7+vhZiBZBauPc
         3TAiVVN22kE1y0yz3ijho+/rMiRXGUEoeUYNMI846UukGdsW87fGH0cyzLuCBci4FsBa
         i9vHK3Cj/+wjqws+PGC0YNv6rYANQp5RShXu0KUJTcfiq6LzniN4vkkJwYcnpeOrw79i
         C5sOHzPoG2TZP33C0VBK7oqfYN40k/LsyZr8DtvJWAQHkfHitOX2EhSl5c4ptYdoy62L
         jvePLbGWQVif+srhOFKmkq0NpYvDSSXUK5jjv9huq2qVUBiYfQ+Pt0Hwz2Jq5J6vCy0s
         2oFQ==
X-Forwarded-Encrypted: i=1; AKwUvByR2mVLLufred6r/QRZ1x5vojP2gSAQUsrBTKT+vdWndyA8H/fXP1cTDgAJGaWzdXbmD2qgf74R8hQWfxs=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/2X/P297igAw4+51dQoeVc7dOCL+tPJa+fczekCBBc6J9W5SL
	CnF7HRLQb2PZmRf0b+X/3IxkrRVpuMsFceRABg0PN8IAHMIJDC2C0ibv33wnvatcsB2K6OVfNjb
	RWX2B8abQpESswiwdJtZN0x5TxezpffyYBX9SmF296S3Cn+aDeQ4pBzmCio/rWQ==
X-Gm-Gg: AYBFou3lYipdFA/Jk92/ElCkm28sQEzoqPvD7RPEeMW9SxhOLM2H3KiNMfLBZ80CS4X
	o6/50U3UFh33jwpsctrnQxtX5M6mMx3KYuiOvZKtu7HnvSjif8YR8Orfu4tcyimBZctmgpOyxvh
	Gkf+d4oCr3VwDcjud54My7c07zR07w4MviMOqax1upCMMZbCMW4QLLENIGgRJ1ceCBA+uKXH8Bv
	Gio9b4Lb2r5cEKs/rXWldwS/gtYrHRJ9Z6NsOIiBeFLyK1Wim86J3VFyUAv9JfEW0iu0H3cs4lM
	WkEi6nrGeRznwbbdi9xEfRc8FhIgJoYCOQllW/6em5A+znGSXrRWqYzKsJaQh5YrJI9OuftvZ6M
	/v09kM1eIeVIJUcf/2j1nGVnpQhoHELJ3+loiap3iE9szV7oFsHiJGuThR4NGwQCpYcloP2AKAh
	n2/pYyd5eGQxi/yhI=
X-Received: by 2002:a05:620a:29c5:b0:93a:13aa:1b9 with SMTP id af79cd13be357-94408a475d0mr830783685a.30.1793285511944;
        Thu, 29 Oct 2026 07:51:51 -0700 (PDT)
X-Received: by 2002:a05:620a:29c5:b0:93a:13aa:1b9 with SMTP id af79cd13be357-94408a475d0mr830780385a.30.1793285511499;
        Thu, 29 Oct 2026 07:51:51 -0700 (PDT)
Received: from [127.0.1.1] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04723sm78153515e9.5.2026.10.29.07.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:51:49 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 29 Oct 2026 10:51:24 -0400
Subject: [PATCH v2 3/9] ecryptfs: remove struct ecryptfs_page_crypt_context
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
Message-Id: <20261029-ecryptfs-folio-v2-3-dc53f1d47d9c@columbia.edu>
References: <20261029-ecryptfs-folio-v2-0-dc53f1d47d9c@columbia.edu>
In-Reply-To: <20261029-ecryptfs-folio-v2-0-dc53f1d47d9c@columbia.edu>
To: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793285500; l=1031;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=8nNsMMmNdcqVbMlIKq9eZpT/6NpoMNBQA7psRulhB58=;
 b=aH2XlqA31DHhsbm8uLd7YnTx7DS7PIp8H7XgnW3As3CUub2Pr6bDLEmH84ou25JNjhBbh7HeN
 6wXmsvOn6wJCMAlKkBV14GuDxdA0y8TO4mqIPFiP4FL4MSCrsmQxqna
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11949
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0 impostorscore=10
 lowpriorityscore=10 bulkscore=10 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290058
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: kRNNHCTelOB6IqS_HoSSIT4FNhVsOmgw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MSBTYWx0ZWRfX+wktr33wftB0
 RQ+rIw5yhteJIHQ321pFvC2CGW9M5uDifl2QHOTypgHxHwgmNs2wtxRx1INoFndpvIfAMowrAjr
 urJxJNo91RmvodNHVqjglApsN4d8LfI28JwG8MtS9WO/Lquj1cRywwbRbMMVG4ZEdYSMFKAb0o6
 fYafl1ZJEmxo+C4iul0Te0jR93yNpeQ6JtaAGfwf9FtpcCWMqW10aj40KBf7cBMtAFTZuWoia5X
 sfQUleMdJ6oaQPwAIxP45oBVNIZkEXbckAhJVxg3DXzanqQuooajvYmdJrsJy7Pw3Znks0e7PBr
 RUXSiaudMPbMPte3dkHsHhclT59wwkrp1uzQ9PJ0VSp4AjoeaZyA02JE6ZoTKOP3xblWQhpdrJ7
 5fgE/J+eZjSGXvlRc2baGMz/RE4QvqkFE0gFd17s2jbI6hmpF8Bo4vsRgZBXoAzDYjZnr1UOWYP
 PdS59OBaiGn89CQQ3tA==
X-Proofpoint-ORIG-GUID: hm2dTr2zHw83CWWJ7oZ_tFrCgQR-fkeF
X-Authority-Analysis: v=2.4 cv=BKEmP1QG c=1 sm=1 tr=0 ts=6ae470d3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=5seVXgKEpYMQFUWKuG8B:22
 a=4zUkhEILHW4tcmWJkwUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MSBTYWx0ZWRfXwr6Oc1Rq0jLr
 RdfNhLq27O/MJKIMzA7Eb51Kl2QP5Em+2M/d8zh46imG00EqfCWc4gefg7c1fTLy9H4Auqft1Bf
 hdDYXbBcmokvH0CJVGxgENGFZxdMMo7L4XNJyk7ozGkbaPlFq2tR
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11950
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=10 suspectscore=0
 bulkscore=10 adultscore=0 phishscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=2 engine=8.22.0-2610190000
 definitions=main-2610300041

This has been unused since commit b6c1d8fcbade ("eCryptfs: remove
unused functions and kmem_cache") in 2007. Remove it.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/ecryptfs/ecryptfs_kernel.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kernel.h
index 4315c18ba1cd..d828040ade89 100644
--- a/fs/ecryptfs/ecryptfs_kernel.h
+++ b/fs/ecryptfs/ecryptfs_kernel.h
@@ -64,17 +64,6 @@ struct ecryptfs_auth_tok_list {
 struct ecryptfs_crypt_stat;
 struct ecryptfs_mount_crypt_stat;
 
-struct ecryptfs_page_crypt_context {
-	struct page *page;
-#define ECRYPTFS_PREPARE_COMMIT_MODE 0
-#define ECRYPTFS_WRITEPAGE_MODE      1
-	unsigned int mode;
-	union {
-		struct file *lower_file;
-		struct writeback_control *wbc;
-	} param;
-};
-
 #if defined(CONFIG_ENCRYPTED_KEYS) || defined(CONFIG_ENCRYPTED_KEYS_MODULE)
 static inline struct ecryptfs_auth_tok *
 ecryptfs_get_encrypted_key_payload_data(struct key *key)

-- 
2.39.5

