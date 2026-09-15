Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A015D45C6EA
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789463628; cv=none; b=ugw7fS9gG20fMrdaEw1g9fCwN/yXUWAGWQHBYQptg5awgZsaUFEk1iqFH2RpWuDN8VPedmwPerEGVQWh3N3pu/wP/UV1YlrftnGrnQwIPnZMEGWBwkMscjie0lSZbyiQB9CipBeiXpwmStBg9/ap91mKRH7WTgkCEDuwqvnCals=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789463628; c=relaxed/simple;
	bh=sFxi2PMQBGmj2gAwvOG3Vv4w+1qE9j2cg89SuV9ziBQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bm+lrUx4FLjE1FgdOruaH2BR1TdrFAZxlQbRnQl9TrfQUHrX9am6j6EOxWLoVkQf60od/y90Ek27gd7fTofGknFT+wjMjj+YQADIUefXi0gAE55xDuIfO3PSZfiWiOGeY5dvAtP4YewB/HegLBSSrnhZoydbmYPSl+/kNq7QRBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MSDoXLJX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AYj7x8Is; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MSDoXLJX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AYj7x8Is"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZWTc3316585
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9dwifGImnX4dM8K8VZM7oe
	H8+hHXIPklVooVtSjSum8=; b=MSDoXLJXtfHD95LFbdeuC65BOxXc7vVXiwlUVF
	FnHQpX1S2gAXO2gSywnPGLWjgAeA51jmZxCisUcOZAE+upaxh5L/jJTnrM8uq/vm
	j9qRA75VAeZjVuPkNbk1pEDu0pxHDGqW6R1YD8eb2FS9UkPsfRGbUOB/RDpQGufJ
	8c3fri5s4imKk5/yw4l6WZX1HxWLxG16N1HoHX+IzH+xtwwIoHllCnAY4EiLAcDu
	pDO7aREUgG5qdqxgRgpyHJoDWr33aDzs9XvYTP8q05YUK1ZageSOBTMYq730N0PE
	g8bNhGf73oRAeNwNPlROYAlxZ2W5rSvg9vwi9FcuuCX+Seiw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyux0wv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:13:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398bb9a6408so1140824a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789463624; x=1790068424; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9dwifGImnX4dM8K8VZM7oeH8+hHXIPklVooVtSjSum8=;
        b=AYj7x8IsVWL9kgtn4rsi2FrcwaP8+YA2IZXP38Yro80qaxD4JXDpU1BPidzDITgH7C
         dweE7J1r/V+FjRFANcMNq8rwT06zlTm06fJKolsOdj2Slyzynwq10NS/4TDpC3QKZeyr
         eYV9VAkj9JVzyRvz7nQ8D27KztAuXYS33FnTrN3Tgq4SzwvnN8TJ6rXC0dr7XiVkdYac
         jNSxjCF+XR44f9c08HIEweIf8bFQ9OFrpc9uHo294N5aYOxFGbvjuX6Wizq5X+Yba3Uc
         hegSvdxnOBcPO2a78ZcIplwiZ+R2kTolyC1BsA53A4wKIM8grzwpROMmoJojHzNc9H4N
         RJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789463624; x=1790068424;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9dwifGImnX4dM8K8VZM7oeH8+hHXIPklVooVtSjSum8=;
        b=YXQGM8UOAPTQ7BLXyYL3S1OspjjcmT8wClWTqBCV/5AvgHjBaQBcs5bjMkW3Z7sqH9
         SlwRkY0Li0LslMAJ9+SBSREILqBAhwko83+xX1IhCwxrGT+PIb5SkIRCVwkqen9U5xH2
         Wz15nmaUXHoVCak8tgV3nUQPopeYX5UKl07g82YHHRhMnSPeSwmCbSdRE+I1etMvgZ1g
         oeAa0TtAjivHKGuXgIDHusXlhHGZ8JFzCpPzIUstNLzcPqTy5aNvCJLqLoxvKpNmiaCR
         E1zJWWz0GmOoFbERKT0ndVjJPS8d4YryFZ92qD6ridORCSJtIzW7NFvzhf7dlPJ6gjkm
         /+Aw==
X-Forwarded-Encrypted: i=1; AKwUvBzCnRLq6ViPfFbP8JTvVMTvMu+vI2pIJq5+W+fYEJPpepiWrWOkqJ06JQ9bakPecW+PSV/eXmdVZ3h7lCU=@vger.kernel.org
X-Gm-Message-State: AFuF++lriwMnSpOaRAtAqzO4Lp6kx7neDwwzr6h02eykHSD1E/EMTHDp
	JONDEOJNtAM52jjcRpNNA+SpeKLdjFHAhABKm28VVzLzXHi4OgFHZ91f0Y17PQix+wIZQ8Lzx2m
	5kJuSX8XeNQBzDLQ5x68j39BiTimh7/ChQFchMH8/2i9gGlIlSvXPXqjIwORX1t8FFcI=
X-Gm-Gg: AYBFou1LyqxyNYezy1NY6NE5aUUkc+GxP6daTHUFTSxKxZJPeLjdWy4htO0NVHxlBQF
	joVhFmccHvRUIn/brVwXYDV8gQa8tKfj+3cYG8UoNVtw3y2q+ZvYfAZBYB3ndbFQr5D49GHHf74
	u/rg/yLG3A0GnkeNhGmuvmH3oEQdhvHY2l18ZZQBR/6AVR/ll2nMATos60vJdzNQ183xm+WO0AX
	r/c3k+YbyotHGVaLhYrneQMl0x8rweOz9T/XxA3qFgx9dkvCjVcYrjePuBlHUSrBgC7gIJeoLGQ
	UxRSeq7hI+Zeu7Amj0qxzTrogV6LhMJgjeTUyZorq2KnuK57Q8b+JVN95yRt+kBtO8wsPVtylor
	BA+eRnBkqI32sxjqiyiaKNdb6Dj4Ez5O1YQhrwyyYd5mlxl0=
X-Received: by 2002:a17:90b:2742:b0:39d:e1f2:3400 with SMTP id 98e67ed59e1d1-39dec24fbedmr8677785a91.5.1789463624485;
        Tue, 15 Sep 2026 02:13:44 -0700 (PDT)
X-Received: by 2002:a17:90b:2742:b0:39d:e1f2:3400 with SMTP id 98e67ed59e1d1-39dec24fbedmr8677722a91.5.1789463623817;
        Tue, 15 Sep 2026 02:13:43 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14390c0be29sm3493044c88.9.2026.09.15.02.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:13:43 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Subject: [PATCH BlueZ 0/2] monitor: Fix heap-buffer-overflows triggered by
 HCI devcoredump
Date: Tue, 15 Sep 2026 02:13:19 -0700
Message-Id: <20260915-fix_heap_overflow-v1-0-8fc39dbcb303@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC8MqWoC/yWM2wqDMBQEf0X2uYF4hfSxn9FSxMtaTxEjSbWC+
 O/G9nGWndng6YQe12iD4yJe7BggvkRo+mp8UUkbGIlOCm3iXHWylj2rqbQLXTfYr8poUhq2Rhc
 pgjc5htOv+cBtmHnH8z/7uX6z+Zw97PsBV7L1CHwAAAA=
X-Change-ID: 20260915-fix_heap_overflow-4e93e9ed9063
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Linux Bluetooth <linux-bluetooth@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Zijun Hu <zijun_hu@icloud.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEzMSBTYWx0ZWRfX/JqKdPqXgjhE
 huu4HzP4wR2JK9OPzQ/XCoX4ioFbV0PngJAFSDKK80zCTmNITMwCRdZ3p2+koULXueNZ6HaqrhF
 HBm9cYstVttQAoT5QacHOt1He3RQP+ZuulwzQ8/m+qpkF+17/DWn/DYa3PIPglcPCUEBanD/XEv
 SVLHY4PZ1Bigx8758JywY2u4vnJTQmW6tNj8tugghOeXjb35346Arg4MtJBGW3SXjjwZszSYzCK
 QFl/g3JrTRvmWHRmUmgoOZOGhrBkjn88EDrREJBK4A0AifHZR1Lb7igp7bixY+AwCR3FwquBnDm
 nwJ0uo3v68hyJCIldkBrplL3RuKJnN/hOTPml3XcNDCW1DIib62KcIiBMQnNyS6zPUEVaL4uP5m
 Cf6J+m6GgI6gu4hqloTsAFedK1kv0bxXxr+G0qhDceZR7J006Tc0pc/K2K1unubvgZboAALFI/3
 nzo7OePL8cxtZ1QsCZA==
X-Proofpoint-ORIG-GUID: TzqaQRGrQuLDVl5FH_N9-hqPEmMDGRQK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEzMSBTYWx0ZWRfX44yWILhwSlb1
 PF6DWlCEBstB9S8EsPJ4GYnwON8Phf0DBz5TvOLWx1xm8Md7sw0Rh3ilq/bAteMd7XJsDFVkOxM
 76WWp+D7l61XwxIdzp2bNyUd64pUjk0=
X-Proofpoint-GUID: TzqaQRGrQuLDVl5FH_N9-hqPEmMDGRQK
X-Authority-Analysis: v=2.4 cv=QYLzLcbv c=1 sm=1 tr=0 ts=6aa90c49 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_JzRFIxVR0lBK_BtMuYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150131

This series fixes heap-buffer-overflows in btmon and btmon-logger
triggered by HCI devcoredump.

---
Previous discussion link:
https://lore.kernel.org/all/20260913-misc_fix-v1-2-558c1e4028b9@oss.qualcomm.com

---
Zijun Hu (2):
      monitor: Fix btmon heap-buffer-overflow triggered by HCI devcoredump
      tools: Fix btmon-logger heap-buffer-overflow triggered by HCI devcoredump

 monitor/control.c    | 3 +++
 tools/btmon-logger.c | 3 +++
 2 files changed, 6 insertions(+)
---
base-commit: c8e2b951b07fc9b84fa7f3e70dcde2b61aab3ad8
change-id: 20260915-fix_heap_overflow-4e93e9ed9063

Best regards,
--  
Zijun Hu <zijun.hu@oss.qualcomm.com>

