Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794898623;
	b=A/Ug/ZBdyhjDGA5EZLcvICxYX/PI+FG6MbhXAo4KZJu1E6mOkJ3DnxQpeCWD/t3MPsY0
	 IN8alADH4sMdTgQ53b0eYHxRRIAhdgB6nYmOppAjE2a+sjxjzvL2jzX/8GTWheT54FCo9
	 aHr28JUD/yi1VJaqfClPKWmsaPi/NDzF620h/dCud5KX2QRlyIfUc5r/BpmAxP46vqJgu
	 N9N96hYZ3D3oW30JjNICN/1cNIN993D/fxzVM4YnQ1zFZq+0S0501ilAF0d4NT378Qwmz
	 6jucLbWHbQN3o4WtamIkwp2gUSFRRX/haz6nKTOMSi8sdFNS+poc8+BCI5+msMSCiVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794898623;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pzO+V84c/OGlvURpsSNmc8TcBqYA5AT4ai98MMYMkf0=;
	b=VmLiiPvhUmnL1ar4vy6+sU9fjO87qp+IG1qJHkGAPTf4h9CrCTkvYuYCy48r6xLKHIPd
	 4ugmp+AzsTdmi2wqi9kHH/TBOAE7T+RCziXkAZoM7SGo9BgDX2MUfVtUKADMK/p28VwfF
	 qhz1k9BMuHGzBkngXeEgRse/Gaq3kyxHkZIux+XiIHT74brN3CBxBQEPC4NmVOG0wL0BG
	 lBTHINgHDOISzxwCwAR98x5BDSYM2NKuJqGm/KTuZARizdbqRJeVu7MRvUo7QfAEik7ik
	 jRN7InKI5tHxEqhxdXxnvALVHaPFibLAA5osZJsDk8HgVyC+d1pxzXFlCTsQaHgoQVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=JgLg2F8E;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b="jPu/4vVo";
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AD3606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0AD3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=JgLg2F8E;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=jPu/4vVo
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6o6n21097022
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:57:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=pzO+
	V84c/OGlvURpsSNmc8TcBqYA5AT4ai98MMYMkf0=; b=JgLg2F8ExuBaV3iqo2Ot
	iJ4qTJll4NDgkba3VHMyMEX+6qjdpKuFIR3j2DqUjo0ld5pE2woye0/GlDUtOFHB
	NeuroFOeFnH7i2eYM2eMk13tDDqLtTe1Ipi7mI7sRdJahgiHkwDT9SVUaPJrqcZA
	hPihxzKpTOdHsFB7i/A7H+aspWRVtoYbjD3GH7c+GtY3wOn6JjGUjMqcsOYa451e
	6Fhz+gS65/8KzkQ2anzYrn2P1nHZ1+fAhzGfX2wVLzHGopqxqs1c51yxqfJJgtDS
	JEKlNOECpbPVUJ1KYsvNlWwvcm9zp1pHbdOouSh8ciE+arA0kvANK4ks+LN9OG0K
	Ew==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j0598wjx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:57:02 -0500 (EST)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-920ff6971a1so6790766d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794898621; x=1795503421; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pzO+V84c/OGlvURpsSNmc8TcBqYA5AT4ai98MMYMkf0=;
        b=jPu/4vVot2eNJDJikpG0CL8ESmxgPOhnAWLMiCcNnAbylyezf6L+/QjlnAsrl1uatB
         3tyxNIMrO7QWBkhJix8yHXlSLDydZNqH3weWCeFsWkNgv80tLEHQ9yTMco7ntrvCcFBm
         70rfD0IeAXVC3HGRYvL2t/Sr28bsjEbtHbKaXApIAfB42+GVEuclPQ+AGNTplMz2OTkm
         J4vuL6tUtSnd6UOZG1ljPPccMlce+H7Y5QL0BGM7zl5lYoq3qya80CTi2SaOBRStcGRo
         Z+ht4DGYw0Ymdtej/Y/2PuxPy31IOOjdatq7aVWAWp+xQ3P/ZYoylVziGB8hesNoj604
         C6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794898621; x=1795503421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pzO+V84c/OGlvURpsSNmc8TcBqYA5AT4ai98MMYMkf0=;
        b=nC0CzXAs/Pnf1AA2DmmqjcYViQr5x1fRXIdiHaQGU8OfCJ/dT1urarzdbF+9H3KWZX
         kqmGJCgH+JWW/uZGIsCvP8KYB2U9PNosCr3R4wFJIpmFsQVq4OXj1ukYm+Tk+zfGZgGD
         zJQ6eCG7f3uh2KPeI0dYtVvHixLiQWLUBRrANuUve2Mcwo1pjUFELvQIcPhzUgwHUzKg
         77k/ZraG4XQp5//wVJZVyOkv499Yhy9ROZlkiMtiyx9VDq+la3PQ7dgYF1mKhsn7D5cQ
         XAyB9y0kHI6ll2TpKcU2Ts4M2oJZFS7T+eGKI/iSib7gKHTR/j+ng12FCzNdPWhLvR5e
         95Eg==
X-Forwarded-Encrypted: i=1; AL+hErE6dlzl2pxoZzShwDop35GZ0uH1I0X9juShZhINkh/tpQQtFUjvwDnrVi9PvkZ/AyykltxrJFbu89CW3wI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hXSE65XgX7wzf5T15W2yBls0722FkmX+v4RkpwGfOKQbNXhu3
	sVtbWecmtFIP1FVdbRiVpffQOiR7de2d0kq5PZPxUQslYgpdA/b/XnJIXrsj6EDtPmYOpduXOw3
	y4CkLOp610JT4Q5CIvO89V43qTvuWAq6V6U6X/AWQOgik+pquBPAH+b4jmTopFg==
X-Gm-Gg: AYBFou0jXmaT+V/a4ItoFJXW6Pzgqsd6x/VKZ0n3b/MebX62dSVCTlrZG/e1ypM776H
	a24SVmNfwhXItOMViDnPZYA8/BY1DoUS/ck3O2V7k+Ncu/VTPiZAMy37aJ4huNslHlg52Cn5GNz
	qIrCXSMOvjCneDNTIH/tfkMWF42KjCCQqRHBHWRdpIFT3hMeRZcznjQ2QumPvoOpKfd6M53Megx
	0yGTMCYLL0ZEa6eNKAguPLUuQt0PXedyqItYYWmGDdJ87E1rh3tEd2g+WhyOywW8F7UKqwtZemL
	+VeYvRN+8+exayTHQtEhbbuSlqcga4WX0Qa2hf+wjrmR6RRfAvhRXwyMSHj0iJNdbYUfGQFBSEB
	sGtuxXCIHjFSMcc/ocT5VTKP8CRZRuXwMu4tNLgrjHeO8aB4r58vFicnj0Im23oUfjWQ0oFQtkB
	FuRg7U7p9NZD34NDyAtQ==
X-Received: by 2002:a05:622a:1f0c:b0:55d:339e:1f90 with SMTP id d75a77b69052e-55d339e25d8mr114660501cf.32.1794898621131;
        Mon, 16 Nov 2026 22:57:01 -0800 (PST)
X-Received: by 2002:a05:622a:1f0c:b0:55d:339e:1f90 with SMTP id d75a77b69052e-55d339e25d8mr114660391cf.32.1794898620516;
        Mon, 16 Nov 2026 22:57:00 -0800 (PST)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad0a2006csm98408871cf.10.2026.11.16.22.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:57:00 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 17 Nov 2026 01:56:18 -0500
Subject: [PATCH 3/3] jfs: fix the read_mapping_folio() error message
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
Message-Id: <20261117-jfs-page-leftovers-v1-3-2722918aacdb@columbia.edu>
References: <20261117-jfs-page-leftovers-v1-0-2722918aacdb@columbia.edu>
In-Reply-To: <20261117-jfs-page-leftovers-v1-0-2722918aacdb@columbia.edu>
To: Dave Kleikamp <shaggy@kernel.org>
Cc: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Christian Brauner <brauner@kernel.org>,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794898606; l=738;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=KL76FNN+nN+GOKj8i6z+gZUk+xWwZFLe93l4w03zOzs=;
 b=C2AVGqx4TEOPYZ8ZIWS9Gp6yBM6qRQmaJhsyXYyR96P78n4w3G2q27UJJKRjhnQ3/CtWOzqWy
 HBZTUoLJYiXBW5fRgfs2LcWGpNKN4y72F5uzeJuGGu/FwwOfSLl3IHB
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: Re0-QR7t2SALJ5t0w2Fok0Kv2_lURhrp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNyBTYWx0ZWRfX3qKhuZUarshN
 07zASctZ04AcGxIPfwpZFmamGiI/aBqD40+ooWtaqg+KCBjf6N0C0bwwA7AHRj8tOxC/Lf1tBSf
 yxAiIEnJACrR00XhNcmi5jYj7cKmCBzNXxyp2ApYmdpPoGm85uGz
X-Proofpoint-GUID: Re0-QR7t2SALJ5t0w2Fok0Kv2_lURhrp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNyBTYWx0ZWRfXxX/35opClqeI
 sdciNYJNWPXsTx42NP1/0xtnYj1R9WNhnHrm3Q3tz6t2W/mNYBTcbc5vzMqNr7oq/MhpsUOOAvG
 gZ82f9F3ovSRreYwIJ29wfRz2KWu5mDB/OrPE4S55ePKqfVrkx4GowqescjXEORkocBOZY8T0IB
 c89csUKdKJBmSeqfoJ32mF7toENuiifcipqU8+hotblAiACT7WqRkLwK+xVe3JeDFDRx5ChdABN
 U9dECVl1lPRTOGV79cEOT4KlBZW1Vov9HrGiZtL4s7IDv5Nq09tH+MXsQN76r/AN60PjtxZJyOX
 vmg6W5yL3Ub+wNJ/mddyHqP3jaZaXWPoodVcbOqvP+ZDoRutBXh1lbS4GFXZMDKYTfQGRlcyYGp
 +T0hPcvdUhg79FTjojHhNMpvReVAHZZksv2k3wWdOLqlpeVlg/NLHIHKaMglWqonV2LAIKAspkM
 LSxJivm62k+mi+yE3Jg==
X-Authority-Analysis: v=2.4 cv=ZOpCCn7b c=1 sm=1 tr=0 ts=6afbfabe cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=usPcmh10W0ubT8QP8_c3:22
 a=UBBe07d3wXFQGX0fkxYA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=10 bulkscore=10 impostorscore=10 spamscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170027

__get_metapage() calls read_mapping_folio() but reports a failure as
read_mapping_page(). Fix it.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/jfs/jfs_metapage.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jfs/jfs_metapage.c b/fs/jfs/jfs_metapage.c
index b483c8d4d999..79f5d0c7f0cb 100644
--- a/fs/jfs/jfs_metapage.c
+++ b/fs/jfs/jfs_metapage.c
@@ -724,7 +724,7 @@ struct metapage *__get_metapage(struct inode *inode, unsigned long lblock,
 	} else {
 		folio = read_mapping_folio(mapping, page_index, NULL);
 		if (IS_ERR(folio)) {
-			jfs_err("read_mapping_page failed!");
+			jfs_err("read_mapping_folio failed!");
 			return NULL;
 		}
 		folio_lock(folio);

-- 
2.39.5

