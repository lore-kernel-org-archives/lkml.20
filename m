Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0813A4BEE3C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 21:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789163607; cv=none; b=sMqx00bl1mWMM19VIa5KldCoU0lXGsTuVFMLIDXeTuQfD7Gjp0kWGgvEUoeJ73DSoQVYPLw1eF24hpT8Dh6tEx5unetBSxbMzRSOzjxTybAIJfgGEiKokYIgG2laybF3FRwA5rBsKxLcv+xnAvEIs85Syetyh9q6WFjDleajzlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789163607; c=relaxed/simple;
	bh=QTAAvVo+D7Wnc9KGN3ZO+mOdZs3GkHWnL/npgBHGXy4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kc/yZlIjP9kwYwUZZ580Z+DyrkiMYH5bKY0rGo2p8aQndYwgHBaK1uHtDCaTX/DJub8UikipG0luTLB3xaB+UUcPoiM7TBfK48EkmX6DiS5mmQvvnwxOW9TFT+jM0q5sA5qsCMrMK6+kDaTlU8zdcUAuE2oJ2AdH3LICbTNgac0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=llWp0jX3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QxIYNrd4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="llWp0jX3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QxIYNrd4"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BHWO68810126
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 21:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=B7ceDK0YYL2iC58PsLjwpIR2KHifRP2AdMv
	tXE1Mcqk=; b=llWp0jX3cIf3nmN3w040iOOyH2DoQUiIVWUMGPHD7xvNgEBWz6r
	8aBOFWXOIq60JMJ2+yUX/8tix8JIxcdVj/WdmWA3inMyc2MnYicr1a5bvnPr3kwg
	LmN5ra7vLGRHwLw3GGW6JBFusqyQOHn2nyztRMDDGdKTI3NGSOaHcMuuXpwU5Ap/
	ZJHjYftaYKaw9P6rOoQCUvTkuMuyZFjgYp8Xi8nC73ZIYwfDGqxRtLpBAZBSzuac
	bY2k4aFcVFSH2Pt28JBNgjgqu6EvXNOqQtlbkPJ2GJVrQXVCmg3cT68e92fYdZkJ
	xsWZ+UNNdO3RmaH6aG/RAKwUHkph1aavltg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmnv20y0c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 21:53:24 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1b80835d5so1681498a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789163604; x=1789768404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B7ceDK0YYL2iC58PsLjwpIR2KHifRP2AdMvtXE1Mcqk=;
        b=QxIYNrd4DB/3cu3wJhqBG3UuVMFjN89TwxlHTKLO5tRNfPvRhAK4AAVuyRQTbBhtcu
         rQoyqutUPY69RGL7cWyodWiCVkAYBLab+No8JLzmILwnHr7CiSOot7kOqvv+CFyvaIrU
         FPL4t71SsKWlU3VNOANtgp4adLqrwnwbyMumG7PF9S2m4QQjSThKp2FPxoPXbIuqLxOF
         uptthC7ScYZ3Q65EYZVaKeNQFB0tzGzkX49y3DxuIbpRuPfNpTwQNYS20hZWs9JtngGn
         BTZdFezoZ/X0eRb+OO+S7GpB70ujHxhZ0QIGFu11z+J/cLuLILPvKaBwQPbiQg7fzU7o
         CgYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789163604; x=1789768404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B7ceDK0YYL2iC58PsLjwpIR2KHifRP2AdMvtXE1Mcqk=;
        b=tKBTRUPtol0RvugUtzZ/PX0WpKoM0Qis1bhGQmz/amQe41oXmBY4/hsEN3mH/VYFQo
         TFRIee+Lps6e61wYzycKTseFsKa5bBHdWMczsQ2JTgrvDjtErgZADU1Aeux5VAmVt9mT
         ilPLRY+TiY8KNU5hMztVNNUoXEfdSwoclC3aOdv/VCqoP+ouqkD1lPlK9rNBToc91e+B
         9Dcz3TwgQPmWENBdq+/N5wERMgTvk4ZVeBXXkeR0/sVIKKF6YbAQEilrL5MuPSOnaW9h
         qE+uobjSd/hn4R8XJKmNexpOObvAwJAiCTGiumk2YHvj8GIGlcDEsytRjvx3cSHEGrQc
         yH/g==
X-Forwarded-Encrypted: i=1; AKwUvBxndzWG7IoyLIsuilazeqwP1P3avEl4mJifM+OMMEOkj/zYVZRnYkk1OEHI/6b3ykNrIkRRMZm3YWHe2ng=@vger.kernel.org
X-Gm-Message-State: AFuF++lWJ0RO7r3CpcUFzQJurlGwDGvvZUj5r5Wtsv/+gz9Kgu6P1O9m
	f0pu+jyL/cVyXogm5veZ6Q1/S0o0J/WN6O9z0gGCli5NHjNQEVLXpeQYI9FXiiHZKjCtFR5w0uf
	AdOwgIUNvQJc0wVWo2g+qR4McJcA7Dv/KWzvodtuqSnxypE2QzpPct9LxZWp0lES/1f8=
X-Gm-Gg: AYBFou079QubSEhsCjwAEbnDpPTHiGzr2nPLJNKZtumu2Vzw45anAg6dLrypZ69/jjD
	UI+EvGO3niE3B6bbQJZsh4/KFWY0rMafKzqxH1KLHl/OPNgBAO/izM46PGB6BxEWaXiBjPbsrgT
	jgFLInydIxjMJbJVX3cwsl+in8VMrB45OsaDeJgP/rU8lYmnsrU0SgovJnZZzL5JgHazKyA/Sj7
	xir9WSAj2P58B10xZ4qz688Q8ShVtB7cBjj3LDipdJxU67LHhVpJGu+S0/aSmsJfcAUlyomK6BX
	jRbqzHiXwU7CWX/W4Pl7Ij7Xnv36QHpt5rS1sNpGfqhRCatJFA9e45AGHoRZoouTCUmaB1iafVu
	YD3DdIAKR10mwBJMEHcuc3T2FQytvAvVfFB6c0geLO1tCoJX7YQ==
X-Received: by 2002:a17:90b:3850:b0:398:9be8:ea69 with SMTP id 98e67ed59e1d1-39d9c36187amr9706300a91.22.1789163603683;
        Fri, 11 Sep 2026 14:53:23 -0700 (PDT)
X-Received: by 2002:a17:90b:3850:b0:398:9be8:ea69 with SMTP id 98e67ed59e1d1-39d9c36187amr9706262a91.22.1789163603274;
        Fri, 11 Sep 2026 14:53:23 -0700 (PDT)
Received: from hu-ashoraj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f739b5sm9100610eec.25.2026.09.11.14.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 14:53:22 -0700 (PDT)
From: Ashok Raj <ashok.raj@oss.qualcomm.com>
To: Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jic23@kernel.org>,
        Dave Jiang <dave.jiang@intel.com>,
        Alison Schofield <alison.schofield@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dan Williams <djbw@kernel.org>, Ira Weiny <iweiny@kernel.org>,
        Li Ming <ming.li@zohomail.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Ashok Raj <ashok.raj@oss.qualcomm.com>
Subject: [RESEND PATCH] cxl/features: Ensure that count is set before access to end[] __counted_by()
Date: Fri, 11 Sep 2026 14:53:04 -0700
Message-ID: <20260911215304.1816467-1-ashok.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDMxMCBTYWx0ZWRfX4t+1vXEDByej
 3Jxz6qLi+1tyKcif91jeJof2Lwg4UUZmlkBu7CVT2/7MxWUPLyZuwlBpZmYZJHfy3YhiMIN9HOM
 18z2GMSxKYzyMbZPunygwauCcZlaKuE=
X-Proofpoint-GUID: wHtRzKSJEqd0elhl_-6J9oHq6NYdebk0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDMxMCBTYWx0ZWRfX2n27ln2rD+NW
 hpxcY6RmeyjUEztCtYT1PiAoLLI7ntARXfmpMmm8YlhZL85e9iQkMz8jckPB3851T1kK3CblAIj
 SP/TOxsxmRibqcBCSy8FkhRLexZYPNR3agcKEAAz69V00/ifSd5wdNU1+nBi89+UZV6PfjRm7VO
 UQIY8pFHJ/D+165kb5NfD1Sg+7DCI26TyRuPdQK1wvwWyGBrEkq8TAovc9z0WaIn5eRcmZfdVj4
 csv53W0vJHBbdTsxtCxNQtSZcPkeV98qydK/zIlyLESyi7VmVdvzaeD/jdp0WddqFusP+J0IYuX
 hBZku88R5C7nbJGpfwGVppQYnD79GvXcRp5Ywwwh9YGOacWuFgRgn8LQ2HzyEvIvYwGag2ww3MC
 KnGx1znZYAY840IpkYG/UkU8RGgTQR6ZiUPZvTvv759rI8LBjQTgso/9Y2Dl3RwUHj8F8o3vpqJ
 IB2hcbxMpIgFmdMaRow==
X-Proofpoint-ORIG-GUID: wHtRzKSJEqd0elhl_-6J9oHq6NYdebk0
X-Authority-Analysis: v=2.4 cv=XvdvqlF9 c=1 sm=1 tr=0 ts=6aa47854 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=hVXjItmcbegfcmPrdh8A:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110310

get_supported_features() assigns entries->num_features only after the
memcpy() loop that fills entries->ent[] has already run. Since ent[]
is __counted_by(num_features), the compiler's bounds instrumentation
sees a 0-length array during that loop and FORTIFY_SOURCE trips on
the memcpy. Set @num_features right after allocation, before any
write into ent[], so the bound is correct for the whole lifetime of
the array.

This was found via a fortify panic:

 memcpy: detected buffer overflow: 384 byte write of buffer size 0
 WARNING: lib/string_helpers.c:1035 at __fortify_report+0x54/0xa0
 kernel BUG at lib/string_helpers.c:1043!
 Call trace:
  __fortify_panic+0x10/0x18
  get_supported_features.isra.0+0x4a0/0x4d0 [cxl_core]
  devm_cxl_setup_features+0x84/0x120 [cxl_core]
  cxl_pci_probe+0x254/0x5e0 [cxl_pci]

Same class of bug, same fix shape as commit 6c9d2e87df40
("cxl/fwctl: Fix __fortify_panic"), which fixed the analogous issue
in cxlctl_get_supported_features() but missed this one.

Fixes: f0e6a2329bf9 ("cxl: Add Get Supported Features command for kernel usage")
Signed-off-by: Ashok Raj <ashok.raj@oss.qualcomm.com>
---
RESEND: Dropped the mailing lists (linux-cxl, linux-kernel) from Cc
by mistake on the first send. Resending with proper Cc.

 drivers/cxl/core/features.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cxl/core/features.c b/drivers/cxl/core/features.c
index ba6d2a5acb74..754fe5eb4b76 100644
--- a/drivers/cxl/core/features.c
+++ b/drivers/cxl/core/features.c
@@ -97,6 +97,7 @@ get_supported_features(struct cxl_features_state *cxlfs)
 		kvmalloc_flex(*entries, ent, count);
 	if (!entries)
 		return NULL;
+	entries->num_features = count;
 
 	struct cxl_mbox_get_sup_feats_out *mbox_out __free(kvfree) =
 		kvmalloc(cxl_mbox->payload_size, GFP_KERNEL);
@@ -174,7 +175,6 @@ get_supported_features(struct cxl_features_state *cxlfs)
 		start += num_entries;
 	} while (remain_feats);
 
-	entries->num_features = count;
 	entries->num_user_features = user_feats;
 
 	return no_free_ptr(entries);
-- 
2.43.0

