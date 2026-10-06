Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFCE3C141A
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 07:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791273251; cv=none; b=b89pq12/doWWc7n8M7NcYTbpJKuXN4WnIrF3jTJzchpps4qrVSiDSiIpoJG1fmpeEijU8JvdoQdi2tZs9we8Yzg6Akcmsb5jb2f44uqqg5Mh6Z+cNJcDNX3Uh1+Y4hEKjHAZM/BYIVAEOj96iEb9bVSqPBvuzn5tb6qjaD8/hnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791273251; c=relaxed/simple;
	bh=pGg2RCj+bciAhah3xu19sdYSbvrTR8AM4l3ftISjnnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MtaFaLvot8OdfNDMKSpMbXXgZDRAUYtfHx5yhmF4NRLscxRk9JOuiYi9ATUY05ftITcMseQqP7GFLz+XZMiti5SPbA8K7U7X3hXmxNmzLF6uaqQW/pBreM6CulO2yzKWcoc8Mn/zPlFyXIbYj6/s2Kkd257yQbhNWzepqRf8Y3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mGIGuZi4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gBj5oyHP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mGIGuZi4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gBj5oyHP"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966eAY41083542
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 07:54:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IkCk3UAJBlHK8tB/KMNLfFuY3QwNXFJZwvI/1UtsZbQ=; b=mGIGuZi4GT6PslIN
	Q18GR1q8BtmMzl7IUD56TZseEteYQzkSPo0xqtF7tgYN3lixiBNQ8f2cX/NhqDLd
	p0ywOoZnSLgwwC0O6ASAO9yjvy0qy89B8bYpQni4mrJdbx1IS/zDVXcsUKFS8C6J
	tewe/SlkILUgACgtHGNgAIdo6xGbY8VDIdGQViu1aBAjSCYntPeKGNmRLPuKoBET
	U3ljsuT7fn+J/IgwW3ORdy+BS7RDnyx5jvOvSHOsNDLyOQHzvkwN7i0aWA6VLGOQ
	rJN8iQfpUmA5vcNDmeDu11byQ0tSLArDRLbq/Z9rVoDOgkgfNRoaIoTMQ56ahH3X
	GT9F+Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4cuu3pws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 07:54:08 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9197553d398so31930466d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 00:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791273248; x=1791878048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IkCk3UAJBlHK8tB/KMNLfFuY3QwNXFJZwvI/1UtsZbQ=;
        b=gBj5oyHP7JqPtPKvSNgG+5Wt+DvKFreJme2NgB8QM/WCQ2FKOb47PVLzS+5PhG6kvQ
         ewbsZydoEutk4DQtRzLzjzLSRVcWNvqwbMeUJYhHJX1ozfHZ/Bml1YPvZ3mctsb7zaxo
         pxxGQ3v2zn5XI7vNgR/ussLgkRua+wxCu2bCRpsoAg6HG9x9oTCP6iOOcixQHXyQZLAw
         hOOG/QHKamlYJvncNvQbrQbPz5dh+f9Mrd4M7C/+3Cx7jRWBC48Od4teSla7oc/uoRdK
         JaNWBjAXf+A33w+5GYDsvp+ECxawzqE+d+3PKxNGj6uS694uL3EZYuUCmfRSYpOXoKt6
         brdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791273248; x=1791878048;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IkCk3UAJBlHK8tB/KMNLfFuY3QwNXFJZwvI/1UtsZbQ=;
        b=Koz2WKdNj171C+/BV0oVCikJZNXDusXqlsyUiODtShm26OwZVVDsj3gIq6xvVPcrcq
         KOtrgY2406XIFOajRNZSSs2aAQ4F69ii46qONByXUqYMnzRHaiJ9qtgzts88elFhuSdn
         wk2qA0c8iqwNip4TqcsvfR+99NjS+ZMnPtvopKL776ksruPQUtavGz1iIdYnlXno3y2H
         e7J6s9mBGnmlbDSPZDKm2R4R8Zju5gVFAt9pncvOygxCb5mFoF3nR3mUd9NdG49ga8g7
         SqLzdZIJwNH+69sCjx1yOQxh1yPVWbsoERX6vQnDIjKQwCXD+XO/IBVJxg7/iNqu+IlT
         VjeA==
X-Gm-Message-State: AFuF++kRywj3zG1KRhAf226vQEnVRzIUFn5iOYXDR8zx1HsoxNaetxPX
	b4Ye23vC8RegdbxLzQ87ZWiZyTh2VwZU5fZin5bLH2INcqVeAGiCxm7cxNNM7aptgBMUeX6plS8
	BevM/x1v33kEPXd2POahs/btovelAx9n+crNVe+d34TyFjM3yOh/PKANiZyUMdXvKBKI=
X-Gm-Gg: AYBFou2uNY9GZIuUpPZ4aTjLcpNldiYhG4N+/T1EpaTFdhjiSZLye5ety6joWlTb6Ha
	4ofEsP/1J/5F0PfykA22Gja7S3yGiMOep2gcdwTbxJwWSts4oezfjjJsC7AqBZI55y+oIX75QMy
	mqE4FzVawngkVlztjfycDuN31AIEkG1T4ZdaIF4mCQDW0weX/+zzrMuTWkqqbRaVIveIQDGbCUu
	M/dIRWq/qnDmsEQc62xnNWXWozFC2GcGVLvU3ebiVeQpwB+A1oAMEzrK1Woac6NYRs2n75AFUwN
	XUgIDGNILzpJbtxbFM/3Y3lAYI5+eXG3H5Ms5dsAZFZdN+VLcIbUsVEkm9G5wdGomBI6S0kQMXM
	b0d+KPeOwUU88MbE4xtMfoc9MUOjV3mDHyFcP2w==
X-Received: by 2002:a05:620a:1b98:b0:93a:1b82:4962 with SMTP id af79cd13be357-93e51058549mr1675043885a.47.1791273247905;
        Tue, 06 Oct 2026 00:54:07 -0700 (PDT)
X-Received: by 2002:a05:620a:1b98:b0:93a:1b82:4962 with SMTP id af79cd13be357-93e51058549mr1675041285a.47.1791273247439;
        Tue, 06 Oct 2026 00:54:07 -0700 (PDT)
Received: from localhost (ip-78-44-132-10.bb.vodafone.cz. [78.44.132.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53997sm80934305e9.12.2026.10.06.00.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 00:54:06 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
        Zong Li <zong.li@sifive.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: [PATCH 2/6] riscv: hwprobe: Report Zicbom and Zicboz only when available
Date: Tue,  6 Oct 2026 09:52:59 +0200
Message-ID: <20261006075303.205216-3-radim.krcmar@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzMSBTYWx0ZWRfX3bgInomWa8uX
 DlA1bwCtIolwqACg4yuHIX+Z6NqpsmhRr6vR3LwZXJv1pXMl2i1Bwff0UQV5EnmF1czquLsvozy
 95vL5vyzcLCPQMpqzr1ZxGMs2yZJz0M=
X-Authority-Analysis: v=2.4 cv=aKRlOr9m c=1 sm=1 tr=0 ts=6ac4a920 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=kVq+qqu7synz0czdOrlqmQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=rRaSbe_MlDQN7V0TPG8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: lCqWNWdIuKPtCYRF9AOgxFTRtzxxBfMO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzMSBTYWx0ZWRfX/CXWQgGW+pju
 URKId/6ABqnKlrmbUtWElDSW7MgoiQzMo/MZ4vVqEe7vb+g+5eiH8FhhS/Ezt9r4spzVjaxsG8p
 4jnfWCaYXOb5O6wv43d/W+7O5SQXk1ihGMvZaX6ISaRqQRL/5rZYyf03vAxeF3i1aViKxEPB2z3
 pN99Ks7q4uG2MuCXKcC6gd+LE9ipnvNzUK24SyAKJUuawJhCBXRiKOMghgn2ehogyjGqiH6g89A
 eFKHhNYMYqnQ35C/8GZMycmpym8DX6Y2G0ePQykizQM59GMtVsumaQMBsPcI3GCP5QbhBkwagwI
 j3vYQvruNEmfRGrj5MHCDLRkTXBr8/WD4akPcqQbJ64reJfkiH+nJqkBBuQwbQJ+OyultArsYq3
 PDxwCbk1HbIk1bKAuhtXOTJGbSG80WH1bOKYpwZ09dgrPQz1/UMu8fNf8wQrvKJNWdADhao7ttR
 fY8EiWJl6PbwqTcoaCw==
X-Proofpoint-GUID: lCqWNWdIuKPtCYRF9AOgxFTRtzxxBfMO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060031

User-mode use of Zicbom and Zicboz requires senvcfg.CBCFE and
senvcfg.CBZE, respectively, which we set only when all harts have the
extension.  hwprobe reports the extensions from the per-hart ISA bitmaps
alone, so it can advertise extensions that are always disabled in
user-mode.

Report correct environment to user-mode.

Fixes: 1b57747e978f ("riscv: Enable cbo.zero only when all harts support Zicboz")
Fixes: eb1003970940 ("RISC-V: hwprobe: Expose Zicbom extension and its block size")
Signed-off-by: Radim Krčmář <radim.krcmar@oss.qualcomm.com>
---
 arch/riscv/kernel/sys_hwprobe.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index b57ccd116bb1..c74e36e8fcdd 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -91,6 +91,12 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 	if (has_vector() && riscv_isa_extension_available(NULL, V))
 		pair->value |= RISCV_HWPROBE_IMA_V;
 
+	if (riscv_isa_extension_available(NULL, ZICBOM))
+		pair->value |= RISCV_HWPROBE_EXT_ZICBOM;
+
+	if (riscv_isa_extension_available(NULL, ZICBOZ))
+		pair->value |= RISCV_HWPROBE_EXT_ZICBOZ;
+
 	/*
 	 * Loop through and record extensions that 1) anyone has, and 2) anyone
 	 * doesn't have.
@@ -120,9 +126,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(isainfo->isa, ZCB, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZCLSD, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZCMOP, pair->value, missing);
-		EXT_KEY(isainfo->isa, ZICBOM, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZICBOP, pair->value, missing);
-		EXT_KEY(isainfo->isa, ZICBOZ, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZICFILP, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZICNTR, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZICOND, pair->value, missing);
-- 
2.55.0

