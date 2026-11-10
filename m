Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333274;
	b=RU/bwqVLzZIhT7JJnrzhxPlJUK/fGzAYFTV+BbG2TWyUsS6nBaQdySBqKcWTKk096fGN
	 y2bAqzazO/1OrJWjpIPmDSGl0JMFH+dB62o703QHqWto3WdV40U/1jmbAvWhKxOf6Doku
	 /imOQ4QE0XuWjp+lsdaVUGzfHuQzxvfVYX8uCmDbrhfxOcK77fFdHT24T3fhfKl2AhMGR
	 vsxLOWsZSG1O0Wz2pzNbg00q+UPIdUAy14UmvMsDZs8EhVLjDZnXnWCLAHBACUMv4psak
	 14e0I2LICtGKtyB0RoBQcL0fjhmOKdSFrQOGr4HmrJm7nirZ/5f1a/YNc/VBlhAPgIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333274;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vb1oOUA2x88eWBZ8SAz7XP9HXnEvJibhYq8prSaZNlY=;
	b=AvFyNc/kekDwGt1Ei9/ShYZ7QlLc0sb2ZUXxbTY+JML1hEhl1nAnuj1SUiHQGDlw+lCc
	 LJvC2YQ9AaPcTVNKUb24har+9wzu92ml4G60IQEmwlL7I9Me/Zlm4GYVK1kEcQ5K3HQ27
	 +Hd/XebSG3NNE59BqOkOKjQaBk5+FtOzMyFnnTDFk8uuo2uR9uW8NXOQ56Hta3oOx2v2G
	 KRatiQUc8WlcEfA5Kbk+m9S/Lblzjkuoag06NvBlqyvt1hUG1IPjSbNnXhdxYaSU3+99V
	 bZeUHbVcjgzQQllU/3+w8UikIM2+oOg3Xv2FTp6vNMe3iyxxOQZZP5SM6/+igtH5yVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z3SAuxuV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YjM95J4x;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721AB60A2634
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 721AB60A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z3SAuxuV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YjM95J4x
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF0CBG151490
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vb1oOUA2x88eWBZ8SAz7XP9HXnEvJibhYq8prSaZNlY=; b=Z3SAuxuVUo3G1zXw
	gDLB43nYMnW6T2ad+/M50cdCeCVwHbEmywRSsguxUKvQNACz72gnxTd5E7NPXtGs
	RBAVKDEBC0444+eCf7DKA99gYKxr84BpjRCze5JUkT0BbTfxIDJDCgNRfY3GBaWB
	keAJ0j67AY3CfrLtj3uqjYnj+9bon4YOGY/x4UOTszYr+njUU7tEIdoGztBwCbGx
	hMYN0xiKNvd28IdjADHBWp3/NmjHAPvYLMD9uJayUUA5RupMkHkjRMW6rsJDjp64
	2lsN5rr+cEWWHDshiGok0J7vZzvwvGuvh2PcPmNSTXbMwp75OaPRMdo51mEKEDia
	ivdhiw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv4pv8yjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:54:32 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-990835cec5aso1570784241.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794333271; x=1794938071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vb1oOUA2x88eWBZ8SAz7XP9HXnEvJibhYq8prSaZNlY=;
        b=YjM95J4xINORq/oG1WN9q5WGyC5p1TJn56+jEUq6g3CdERq9C8iAZdtXiU6qh2bNrk
         t02F9/37OnnwqTBDGvGbUycDf+OmrcFR2Vup8jc2NfXq3bvGU9WU7cMtNyw3bUdHHXLl
         WnLVfs5uzju2/CeEMU/i9Itnw5mXyjfW8enB2GhQOjcT23gQQfjqsQKlO6pJVzbPIva4
         ZuloL1B3twmDHBOlxHCireHgfkRvw2C/dcZEKW2h+1YebkPAEY92R6/smG+DKLLGfc1A
         kB9EH62JaKu3oUfnr7ldRvZCuvrf/nZtmTVMB++Bojj1eRHzkuOW9fCuWpCf2JgTiaJF
         LA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333271; x=1794938071;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vb1oOUA2x88eWBZ8SAz7XP9HXnEvJibhYq8prSaZNlY=;
        b=oArW9RehLZlXsUKb4rkFxKwJ/ZQTEMwmeLB8nZh9U/bfyM8qvZjqq6SA65jeMMJjOE
         8N6dvLfnMHu6IjGD2IR3tPYJ7jZCHxdIu3InJ8aXegARr1OBMJ/tsQ44bR6Ykv69JEBF
         7zeP781leO1/QOGg2jDuXjqyonScsfBQx+YxmibZ7kwz4Ws5WoDC3sXHDReyLPyDOKhp
         SzIq1AmCpsY/VptWH7CW7G45+GvLDZ5qmsigsUFy/7Wfl3BAKindZWUPXlJAqD5Tg2GA
         TxLAJTnVarxTibzcWyyf5eRaYhNFCWcQ1j85zr/Nsb2zNvviHWHh7cb+M3sUewJbXLqf
         54zA==
X-Gm-Message-State: APuU4Z8f4l0eNJlH0ex3MtLMRt81AMN3LK24b1d3pBpQsE3nmCiYHbl1
	cajsBD3ijlzvJaGrFwM4GaZp9gDuAJg1a4vpYLHrBsCFGXnzf+Z8grzcUmCPJrLvjELYLD+XDVI
	cRUW2yuF4IaYrjJy6WyP6G0sWY4rtIZ+9eM56ML9VbVw+QlUcwRdIjT+p5guD9VPO7VY=
X-Gm-Gg: AYBFou0YP2TP9SBPtGw8TgtDxw27Gxo3VBJl1Q93Jdg7t3ZUhTSEcKwW5pi6vqo+MrX
	hommhXHGhHpFBbC2HD5QMc9VvvsvapeSAj7dFutKlv5Jcwnp/NAI8pTTGZH8jR0CChNHh68yO9j
	FJQqrTUnWbzd7Psib1hYwsq/iWk7FKOBu2VT4N9Cxc8EMxl/EzTFzsTV2zTmHE9JGB5QPz9tPUP
	WPZeO/IIcauEhiIptK9FfkEG+K66cKE1p2BGngl90KA1D7t3ca/RemepVywIujpyJl8oPydgVbe
	Vf96S1Rjw2nodvqYRadOcn/UkIvhxcMuenb5g6dENfueWmVx9W+OwGbUpu27GT14sIbSYO0SrPb
	2EVB90+hAitrLbTtqa/eCu5VTNO7AFV3X2D4GIvBOspk4LVEu6d5x2xPSrW8jsowDim51Fjlbw6
	JvoS5QNyUy6Tk=
X-Received: by 2002:a05:6102:f0a:b0:7ce:645a:139e with SMTP id ada2fe7eead31-7d494e743b2mr79479137.23.1794333271482;
        Tue, 10 Nov 2026 09:54:31 -0800 (PST)
X-Received: by 2002:a05:6102:f0a:b0:7ce:645a:139e with SMTP id ada2fe7eead31-7d494e743b2mr79460137.23.1794333270917;
        Tue, 10 Nov 2026 09:54:30 -0800 (PST)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba020485bcsm73494005e9.11.2026.11.10.09.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:54:30 -0800 (PST)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
        Zong Li <zong.li@sifive.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>,
        Andy Chiu <tchiu@tenstorrent.com>
Subject: [PATCH v2 1/6] riscv: hwprobe: Report FP extensions only when available
Date: Tue, 10 Nov 2026 18:50:43 +0100
Message-ID: <20261110175048.82208-2-radim.krcmar@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261110175048.82208-1-radim.krcmar@oss.qualcomm.com>
References: <20261110175048.82208-1-radim.krcmar@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XqZvqlF9 c=1 sm=1 tr=0 ts=6af35a58 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=t9496tuAAAAA:8 a=EUspDBNiAAAA:8 a=h_pWu3sd9Bhu3AQz9iUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22 a=4wQ91nGE5lQcD7eh5OX0:22
X-Proofpoint-ORIG-GUID: CpCd7UcSvCJubhaCBEfGXSbWzUkZOXis
X-Proofpoint-GUID: CpCd7UcSvCJubhaCBEfGXSbWzUkZOXis
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfXzRJEAiZSXX+9
 W72vqS5DSQai1hAS0nyVJz7TE+iaILMB2z/6XNRcuwmOdgALdg7SRR08HZjWjWIqFsxO9wMojtO
 6mjNfe0Gb4nDnXo3Xbtu4qL523aqjhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfXwtobh2IU34TI
 PkDAEn85mdiJLDm8oCiwEagf1WDsiwqINQeLOnkLey6lEKBtVJk3qWGs3RKXqZp2yvpEi6GCxEe
 P5KFG8kzz51OVeSdAHRjGW4KbFVxgTFbS11zs8wgxq8eeWQjwuBx3Ja1zFcIJCXpSpBgcqFoQSy
 TibEWwUQuVq2o+uu4dLqNQ9lpC/o6bZVKV2mH4wz7yAasyZonMIPLAGrhOEsiAOcWS3xIHC+6RO
 whHN1IrtVY/8EXmrDwqugCJ1BgnyNeJnDhe4/jcileHmRQMeN/8+y6gKCd3Gid/5HEJzS003IxJ
 kiOP7YoufWmM1EFcGKyEqINnQOk+dMO+raRJiXDywVZ4CzJb907DyKejbpuC6gB7O4hcmNV721v
 7faR1Mxpa+blOleg3QaYtr/2/kqU9sLzEsQDvYe4E9q5+4opv8kvf+/xVsVWMJIU8I7C6mDwJ8k
 501w52qrxPm/+JqNsyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100071

User-mode use of floating-point extensions requires non-Off sstatus.FS,
which we set only when has_fpu() (CONFIG_FPU and D on all harts).
The vector floating-point extensions require non-Off sstatus.FS too, but
hwprobe gates them only on has_vector() (CONFIG_ISA_V and Zve32x on all
harts).

CONFIG_ISA_V depends on CONFIG_FPU, because V extension implies Zve64d,
but has_vector() only requires Zve32x, so has_vector() doesn't imply
has_fpu(), hence we can boot on a machine where all harts have Zve32x,
but not all harts have D.

hwprobe currently reports the extensions from the per-hart ISA bitmaps
alone, so it can advertise extensions that are always disabled in
user-mode.  Report correct environment to user-mode.

Fixes: 2e2cf5581fcc ("riscv: cpufeature: add validation for zfa, zfh and zfhmin")
Fixes: de8f8282a969 ("riscv: hwprobe: add zve Vector subextensions into hwprobe interface")
Fixes: 5dadda5e6a59 ("riscv: hwprobe: export Zvfh[min] ISA extensions")
Fixes: a4863e002cf0 ("riscv: hwprobe: export bfloat16 ISA extension")
Reviewed-by: Andy Chiu <tchiu@tenstorrent.com>
Signed-off-by: Radim Krčmář <radim.krcmar@oss.qualcomm.com>
---
v2:
* added one more "Fixes:" for bfloat
* hopefully clarified the commit message around CONFIGs
* added r-b
---
 arch/riscv/kernel/sys_hwprobe.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index cd7cf272e6e1..feae40466e2b 100644
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

