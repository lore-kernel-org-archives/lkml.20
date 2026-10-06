Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B49E3C1973
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 07:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791273249; cv=none; b=quRO/QIepV9irsELV4rIdyQ5+hXrQi8bTngRQIP3UU8kW6MvThnXYnEtzYbNdl+k5BZs5Z5sBh1EVySP6bC7rj5pVvSCBj5hWVShLMdjeXUpQtLZvynujmykdqqR1GmY/16JHFKasTjT7m3+hhIsXFLOylsDp1zEh489TF7Eu6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791273249; c=relaxed/simple;
	bh=o7XOx+0N/eIwfEV27yXmMCKPs3NpjnRz7568FFeqKSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NK5M1qPihjPi1bM7cYF4dGgYbvIKlAcLhoVFGLFy/WrT06cc5nFfNosskxNUZdw2T7FYTG0zdLr7YYMW/X9o1YZB8tidvvSH4GjhVZAf+TrygN8uuqF8vj6QfDahJNHQFLq7s303inCuE68d3Ykllcp94DtWiLGpNEqugKyFxzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bRhYLZ3w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JSlFmEyH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bRhYLZ3w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JSlFmEyH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966gYfN1045495
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 07:54:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GQirbEcE3MktqOY7DcIz0seaLPIF4Zmwh3AsCZ5btSs=; b=bRhYLZ3wUFlpI7ye
	yjUYghnmNbZT83j9Viiz4Tlz+RQ9gnfooUtMhyAKi/WdXkck3hiOWtPEj3GYVipv
	9wkdA+PMNQ1aWQ7Y/i2T5FdbXEBstQ1eAah5WTh93Cl/S9Y7DPaI7hQCGg9CEG4b
	AovtipeiIi6ifM87lbGuh3Oa+97U57RrgWgCzB3pJiINS3jv1C2cY5mQbUypt71m
	KBTiz5KI9cSbvvtFbDAD0YNAzhC1R/L7oDcCv8Y74q9WMgvp8aM/H4I88NMKrVu/
	diXrr7hl5ZHKtvvugnhQRe3TKCbt5wTQjEOg5Ud9/62aW0LlxJbne32kZPW5o3U1
	yQLBRA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4uy4g888-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 07:54:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb93c874bso441962685a.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 00:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791273246; x=1791878046; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GQirbEcE3MktqOY7DcIz0seaLPIF4Zmwh3AsCZ5btSs=;
        b=JSlFmEyHi0hK0jollFQ+xL2ecFA/7YRXO/hYdfzx50Bn3hubbWTV7zP24uPDavIVOq
         RgNcyXSr2lTXiLQ7aV48Am93VBnxMyRaNucenWF81vM1fs8YOZbXJCMdlwywBFutQgj5
         4A4pWODg2uJv6dQZw61BnSLicvVdJFfSTB57OOK2g/cIb3OSUy++cRgGWwnGfONu2T1p
         TfHcusTtBKKeDpl09q9wPOso/ZP8pSte+Q7Nz9QS08ErbmUCn3ABA6EEBs8KNqqXWB43
         xrcJgAMBLfhjkn3oNjEOaMfpWknNODN708x9P+jboRfOI+UzHli5wzIBG2Fb8KcLfFQJ
         2vlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791273246; x=1791878046;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQirbEcE3MktqOY7DcIz0seaLPIF4Zmwh3AsCZ5btSs=;
        b=WMAbFAhTAMYhDFRtDCDaxj88a8F/IxNJdtcSTLSHJidIp5g9a9NAa/gwo7RNdivr9p
         SyHyfYnMTuhMrioaNqZHjmkUOoVGy0+AOTsHGNdRZBHe/tWbKD+Tz2nEJqCH/D3rY7X8
         XHhiuLOCGRhE7dcQZuxzaMosDmsM/MTTc+0N4IQvx065iWaAkiYdRk2W8ho3+eVi6mDj
         YK/BEGIMQs+ZN+VR871D93SguoHwFKdU82w+lhNTMp4qdGokQKW6C1vhWJrc5o/qjStg
         /Cq5ifD7Zy73ajTpJnJZRXL+HPKtMteqI1OqIbynSQtno9Ev1jV52hDPOOsRatUXTJIp
         /5Wg==
X-Gm-Message-State: AFuF++lINSGLYKeGOfMIK5vbjHlRcPl1Qypwlfk4ln04SiqzZmysnoD8
	3WUY5jg/KxcAf0lS7CE2xfObGTETVMSKlopDrZ3LuLB0hq9QJFYQX4Q+lnpJbhCnTBOypzpmzTz
	zXaK2R6oVT390KbDCaTjeYXoJ3eGjr/9lanAfBud9gv8cw/lTfIm24DFKqpsXv0eYwxE=
X-Gm-Gg: AYBFou1kX3eEmYdoaY5S+9iOv1iZe942T1OMpJ9+VyAj9EHj+DpiXoBTYQLZMYAcjsM
	PkUOpdsLKOYMihcDLbi5M6Q+8OdVLzSWS1fE92zpCLV4Xqmi8/S5A/G9ZGxLYH/WBkrqXVTbcyz
	ckMNbMyrBfPI1oie1nbTSE8dqyl4z1bypCWfKD16YWg2En+xDrovfEyNM+C/MDfxcljRT+7fkHc
	Vc0pYfH64rWA4A7NqD6QAeGqDZhFfmYdIea9vYzQAek8r6qSmwZs3igCpMueD8faZ8LFL0KINId
	W4026uuZ/XK8rTws+vtOj8WShxcioh3wGrfPITYlkwfDMAXmck4/vXQt494liyhjoIdCfL0vcka
	bfuJKwlUJACt29ZgTWCLrwlaqjyCiDTVLz+oGfg==
X-Received: by 2002:a05:620a:4686:b0:93c:b895:6109 with SMTP id af79cd13be357-93e85ff3d03mr369081585a.9.1791273246001;
        Tue, 06 Oct 2026 00:54:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4686:b0:93c:b895:6109 with SMTP id af79cd13be357-93e85ff3d03mr369078285a.9.1791273245483;
        Tue, 06 Oct 2026 00:54:05 -0700 (PDT)
Received: from localhost (ip-78-44-132-10.bb.vodafone.cz. [78.44.132.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178daa115sm53604975e9.9.2026.10.06.00.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 00:54:04 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
        Zong Li <zong.li@sifive.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: [PATCH 1/6] riscv: hwprobe: Report FP extensions only when available
Date: Tue,  6 Oct 2026 09:52:58 +0200
Message-ID: <20261006075303.205216-2-radim.krcmar@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzMSBTYWx0ZWRfX8xcMK8jlprb+
 vs2KoiynU9rJuwASthYp1eEZbhXcT3fqqn8XVuuA6oWIFRV1vs4vvxn9b17onJKelxCw92ORWwo
 k5IqwHwWlhjXgMTw7u5ZFbREyWSTe14efSpE0rdvUhQSrEhYIWSu9Jwa5Dud1XnGT6/clKZFzAW
 SAcCaXXbv1XeVIr25MLlC5sMVlvzLMBI3zbP+GU4N3Z5srjZOEh2kCpfNR6HKwEEVR2J6zjaeo/
 cn8oW9YxtcyCZZ9PsdN1XUMoT7JRVZ5hmFF7EDC78PUZG9+T9tSJbIZPWF2SFIr3DrKdSsKKM1r
 0bzA1XkYoqP9lJ03xdpmMOjFFujyubZ9Ntwu6l4qIwGVOMZdW/sYPDDvDeRoNSs3E41RuHHknIS
 NdU/Wx+FAJBS1lZH6jsVZI8ErHbyP4Wk+PapbdjCMOrz1mZ9Ol0eaIJjxAeFqUxIbSe1qgRtQbN
 PvURLnGGEJndzSrlXBA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzMSBTYWx0ZWRfX5AqPjQIUHnJZ
 HCozsV7efYMerF1I8znZHt+GPTr/9Nto7VRFkCdXnuf0bbbak7LJCTZxfsTkIpTJxzJuGD0+RTY
 U0e1e/PasabSVKAsYdK82LPqKAb+tIg=
X-Authority-Analysis: v=2.4 cv=F97C5ahN c=1 sm=1 tr=0 ts=6ac4a91f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=kVq+qqu7synz0czdOrlqmQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=6k3ItfHtZ7OA1SFZEpkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: bRieqRkROXH1nwVz9az6UtE4PimiYH7U
X-Proofpoint-GUID: bRieqRkROXH1nwVz9az6UtE4PimiYH7U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060031

User-mode use of Zcd, Zcf, Zfa, Zfbfmin, Zfh and Zfhmin requires
non-Off sstatus.FS, which we set only when has_fpu() (CONFIG_FPU and D
on all harts).  The vector floating-point extensions Zve32f, Zve64f,
Zve64d, Zvfbfmin, Zvfbfwma, Zvfh and Zvfhmin require it as well, but
hwprobe gates them only on has_vector().  hwprobe otherwise reports the
extensions from the per-hart ISA bitmaps alone, so it can advertise
extensions that are always disabled in user-mode.

Report correct environment to user-mode.

Fixes: 2e2cf5581fcc ("riscv: cpufeature: add validation for zfa, zfh and zfhmin")
Fixes: de8f8282a969 ("riscv: hwprobe: add zve Vector subextensions into hwprobe interface")
Fixes: 5dadda5e6a59 ("riscv: hwprobe: export Zvfh[min] ISA extensions")
Signed-off-by: Radim Krčmář <radim.krcmar@oss.qualcomm.com>
---
 arch/riscv/kernel/sys_hwprobe.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 7818e1d32622..b57ccd116bb1 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -146,15 +146,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		if (has_vector()) {
 			EXT_KEY(isainfo->isa, ZVBB, pair->value, missing);
 			EXT_KEY(isainfo->isa, ZVBC, pair->value, missing);
-			EXT_KEY(isainfo->isa, ZVE32F, pair->value, missing);
 			EXT_KEY(isainfo->isa, ZVE32X, pair->value, missing);
-			EXT_KEY(isainfo->isa, ZVE64D, pair->value, missing);
-			EXT_KEY(isainfo->isa, ZVE64F, pair->value, missing);
 			EXT_KEY(isainfo->isa, ZVE64X, pair->value, missing);
-			EXT_KEY(isainfo->isa, ZVFBFMIN, pair->value, missing);
-			EXT_KEY(isainfo->isa, ZVFBFWMA, pair->value, missing);
-			EXT_KEY(isainfo->isa, ZVFH, pair->value, missing);
-			EXT_KEY(isainfo->isa, ZVFHMIN, pair->value, missing);
 			EXT_KEY(isainfo->isa, ZVKB, pair->value, missing);
 			EXT_KEY(isainfo->isa, ZVKG, pair->value, missing);
 			EXT_KEY(isainfo->isa, ZVKNED, pair->value, missing);
@@ -163,14 +156,26 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 			EXT_KEY(isainfo->isa, ZVKSED, pair->value, missing);
 			EXT_KEY(isainfo->isa, ZVKSH, pair->value, missing);
 			EXT_KEY(isainfo->isa, ZVKT, pair->value, missing);
+
+			if (has_fpu()) {
+				EXT_KEY(isainfo->isa, ZVE32F, pair->value, missing);
+				EXT_KEY(isainfo->isa, ZVE64D, pair->value, missing);
+				EXT_KEY(isainfo->isa, ZVE64F, pair->value, missing);
+				EXT_KEY(isainfo->isa, ZVFBFMIN, pair->value, missing);
+				EXT_KEY(isainfo->isa, ZVFBFWMA, pair->value, missing);
+				EXT_KEY(isainfo->isa, ZVFH, pair->value, missing);
+				EXT_KEY(isainfo->isa, ZVFHMIN, pair->value, missing);
+			}
 		}
 
-		EXT_KEY(isainfo->isa, ZCD, pair->value, missing);
-		EXT_KEY(isainfo->isa, ZCF, pair->value, missing);
-		EXT_KEY(isainfo->isa, ZFA, pair->value, missing);
-		EXT_KEY(isainfo->isa, ZFBFMIN, pair->value, missing);
-		EXT_KEY(isainfo->isa, ZFH, pair->value, missing);
-		EXT_KEY(isainfo->isa, ZFHMIN, pair->value, missing);
+		if (has_fpu()) {
+			EXT_KEY(isainfo->isa, ZCD, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZCF, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZFA, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZFBFMIN, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZFH, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZFHMIN, pair->value, missing);
+		}
 
 		if (IS_ENABLED(CONFIG_RISCV_ISA_SUPM))
 			EXT_KEY(isainfo->isa, SUPM, pair->value, missing);
-- 
2.55.0

