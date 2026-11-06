Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953652;
	b=wyEVMR1wGf30/UyqpndBPRxWXmBZg3YFX9E7Xd8fr5g6wCxuAnK+Xfu73jiIwB3WMJz4
	 Q/MudH2VbOIGZWfOo24J7qkr5IZpusDa9t7axoYmMruWbD7OJ2ayZjgFdbdpKxKVK+jHa
	 y6IytV3Vf3wdvzTpbzy8xGN1kHuMEJQ3QhfQq08+40j2SjP/M79JzPP0+8HgKCt0BTjr5
	 4IVnaWHZkZo0j7EUpj/PPP4q4HFg/q80X/kI7pXYNQBtWzGwIGXva8SF+ipot4KIT4paZ
	 CSxcq/7vXNh78LYXDa3MmSI63wyYAGfUyvGfybQUo+R4EmkSrTmgEJRm/cM8IfN04OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953652;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=V2wYRQpevpCb45SBy3n0W/fgsH08qxa9cpiriaBTcOI=;
	b=jS2wsuTj8Tln2EPu7pulC+94ueVlfW0bgfqqx1w8tiktTQJlQ1K6F0o8LARybJsxUJEZ
	 22u74G3R6HdVwqbK0MRz6oJ/3V4dHiM0R0/hcVZyLPjJhx2XN4S4U/QwBWMy4JwCFk7V3
	 80ggnuYPMo+Pq0TEE/pcUUARxQ1ZwEgU24f5wAJ50zUBgkKlTVkrozlkA6Nxz55liS0q1
	 LjN3+LAzCDlOHZ9bkF7KuSKbk+ORxZ4/nkJpfJvWwesL6Cmbc1fjNw3YOGPmGhO4vNTPg
	 ys+e+T28Mzw8/cZUwBHUEXZfZDL+4j1bPBP1mho2xRiBiYkB4PATF3/5UgUCfyn5oFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Husz4Ph2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c8rLLhxZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB0F606A332
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADB0F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Husz4Ph2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c8rLLhxZ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R6lE3243860
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 08:27:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V2wYRQpevpC
	b45SBy3n0W/fgsH08qxa9cpiriaBTcOI=; b=Husz4Ph25FxvMw0OcQN+Bo5d0ho
	eL9lvD29FR5ZRPzyWGSLodCVGDtBzNjTatbO+Q6ac8XZZPmoBVbWF42KrWz8k/9H
	KahRA/gOJNG8rpNvRdNRFHhyXvjWE6gzSDA6FBRXmU/Kf5rrqdCR+4VLppJVtinm
	dADOptrucQHoBxJ9YSjkuI/TTgsBfNCHMY/VVnPg2W/c5RKbccUxVIviszFiMr0t
	25/u4dtpcIKSyGNbEITEgzA0Z3TIQLAyBdnilweP97gCG/gkiadwrL8oYwnW5IYp
	ZjIV4jLpHRqM33oahqpZmFrgM87G/iE2h0H8m/Y2irnwVtv5UsDOrNiKEQw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa1tyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:27:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b07b06027eso632026a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793953650; x=1794558450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V2wYRQpevpCb45SBy3n0W/fgsH08qxa9cpiriaBTcOI=;
        b=c8rLLhxZLEv/uX+vz0ovzWDe61AOGwHyBYUl+DIGSymgnxUy/od/+PXPt3zLgaR5K9
         iMSga0CwZQxg1wbybRpiWblAuTOQx4LaXxqjL9+dVaNrnpOZIfzS1FIpgfmQGFGZSzR3
         RiSgqtWwHAlNaaKtG6f6Y+Vd5Oshiua0546oR+S9XAYILH/+F8qRFVikEKP12fFa3cKX
         F+1h7bY74J9vZYgpUTnjWzaSiENLsRX43uFqz2H3SPj0a4ypuOZiAK3VYDXDA15hL+0j
         Rw07oQxDk/EfB5bhoyZCgfyBzZBg3zZkxorU2FGHdd3xdaPczwE7VPndumuIXhzhbHjX
         1kYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953650; x=1794558450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V2wYRQpevpCb45SBy3n0W/fgsH08qxa9cpiriaBTcOI=;
        b=Px20Lah3XLb1j06jufrbNycC1cYlxmBIGZKoq6xQGfy6C5Q6K+UzluwVWqf/4ESEsf
         grHNEbptrhk27rBmuJyd+PDavrLp4WkXi6nbBTWb4ZqRki2S0hbAoi4hWg6dWrXxLR8Y
         1P4s8vB/ep18IS1XyAk4K73rf7jv9gZVi4kVUz38Lg9b03E6T/vpACZPclfzNjGJgOvW
         sXkeBm+18LWTX/siYn4vy6Buf4vwtcys+ysv/uSsecnV++qaOEv55ssK8L1x/bwLC3L3
         qyE5xIfbhtQBzIiX2CRWXD6G8xeS0RJKxXTBDFeQyMZi6KVWPpxZBpuh0qZkl/amurmk
         d+cw==
X-Forwarded-Encrypted: i=1; AL+hErHa8YkCiGWzOzDjTm0RrTHDlDm4Bi2UIu6WRxX5Y96RS5dMw1gy4xV0GDd257b+na3taL3spieEOjHgCj8=@vger.kernel.org
X-Gm-Message-State: APuU4Z94STt+8wfFgneHiaK7fBP1+sg8S1ADJCWzNBb8Y0trhecq5qaP
	GuI98PldvcFv2DvUNiqxTSlTgxzsfoxKBCAo9KTLGVQHRZ3HQfm/IqLVWJIG7+qiCMMXYnH6w9q
	2w+jUK1pozMSMeEjyIUOptnLBEnXf8uZXcqGFdJWErB0BJ890zmRGqR5dGho4U02WA0s=
X-Gm-Gg: AYBFou03BR4uspZK9g7jFDK5Ov8RwKbCFBG0iGxGukU5mrplZBa9HltOzdeek63fDo0
	nYLeOVYlfxNeiryRxzExgVi5Rk6bzue+3uDfzR4JdN8ck2mAbvByHj2AknK3/5/rnggA6P8wxbi
	Ip4Z/IHrp4sIYTO2eC00+vDAK7rc9LvSO5urbWoGUvWPgL0NbtTmzH18ljbPLmR4xd73pdFAsbs
	sIxpKNWPD3r4SjTk4NoxMuUGO+oBPZ0udpk4YxKGMV5vrJOkrEFn6ytvwaDUlSx1VgrXAb6LNny
	pQiMJKjdoxtxttafh77NT3PpMHkaqb+KtCDOJjoqN2KukEMFFFiYrLMlwUj/FDY5COW8od7+RPi
	UHe1zn8AbOdSHKf9tfcii/zzg7LWx0QYxhqlSTUPgAvfX0hR4lgnw8m9NYlkCHo/8b/xLFn/PLC
	Ty9A==
X-Received: by 2002:a17:90b:2b4c:b0:3ac:4e18:2390 with SMTP id 98e67ed59e1d1-3b0db5f54cdmr2023395a91.7.1793953650341;
        Fri, 06 Nov 2026 00:27:30 -0800 (PST)
X-Received: by 2002:a17:90b:2b4c:b0:3ac:4e18:2390 with SMTP id 98e67ed59e1d1-3b0db5f54cdmr2023366a91.7.1793953649879;
        Fri, 06 Nov 2026 00:27:29 -0800 (PST)
Received: from hu-taparana-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c42a72sm2433951a91.3.2026.11.06.00.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:27:29 -0800 (PST)
From: Tapas Rana <tapas.rana@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Esteban Urrutia <esteuwu@proton.me>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        prashanth.k@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tapas Rana <tapas.rana@oss.qualcomm.com>
Subject: [PATCH 1/3] phy: qcom-qmp-usb-ss: add shared SS-link-state submode contract
Date: Fri,  6 Nov 2026 13:57:14 +0530
Message-ID: <20261106082716.128968-2-tapas.rana@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106082716.128968-1-tapas.rana@oss.qualcomm.com>
References: <20261106082716.128968-1-tapas.rana@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aed8f73 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=LeDc4IpKX6SiiW4862oA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX9NkspHtqodDJ
 J+J6DkhpwaWKSFAAzAG5N74lMZcHsQcJyzwy9zdPKxsLh6+tfG2CTRLfF2q5CEY3PgmgD25582V
 o24krNn5Fz4UlU0F8G5agXxoJWJ8C1I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfXxGLJ/Cy4o8F/
 eIFlHpMCRQ8m0Dp/xans1aknIKqGTJib/nbalDXLKQfYtuZBFPT50s615cPbYszA/0NYltBooO5
 51TCYDrWBViNYUgjEXg8cjhlb3JVZ2UsZ/8HVj4G0jkaFbZ5aAayNu9jW2ctvTJtr2VUPV+/tv8
 3lmpQaDc8rQh8WIguMRZHD3l3c5yYpeyEnjKptjfZgo0FzPIXa6YAtmwQ6H3Cbn0/uEUcpeHT0I
 l2V5gbwRAfdzymlCdzdwREn7OETBmbySm4Q2tS7yn9sDLGS24CXNXM1sy5STMiOzmNEEj8GdJWi
 qZtSli3M8J8t+0IJSqsab9rF+qASmMYos6dR5nTVhFKF/A2Mj9TdbEU/mr+qmW0AbpdvIOmnj4X
 basWwEuwLOqdvWc3wVPD6uYafpohbBGJYVOGrXuDwuomitUKNqfcK3qmKwzKSmFu/Ku0zcMh7b+
 FIxXBKz67aX7NczKKPg==
X-Proofpoint-GUID: azj350EUzOjw37ID_0NbbtNS-kBAGJ-Q
X-Proofpoint-ORIG-GUID: azj350EUzOjw37ID_0NbbtNS-kBAGJ-Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060033

dwc3 core only calls phy_set_mode()/phy_set_mode_ext() with the base
PHY_MODE_USB_HOST or PHY_MODE_USB_DEVICE. It never passes the
PHY_MODE_USB_{HOST,DEVICE}_SS/HS/FS/LS submode values to any PHY
driver. However, QMP PHY drivers need to know whether a SuperSpeed
link is present to select the correct autonomous-mode wake interrupt
mask, and phy_mode alone cannot carry that.

Add enum qcom_usb_ss_state (UNKNOWN/PRESENT/ABSENT) and carry it
through the existing submode argument of phy_set_mode_ext(), instead
of extending enum phy_mode further. UNKNOWN is the default so callers
that do not yet pass a real value keep current behavior.

Signed-off-by: Tapas Rana <tapas.rana@oss.qualcomm.com>
---
 include/linux/phy/phy-qcom-qmp-usb-ss.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 include/linux/phy/phy-qcom-qmp-usb-ss.h

diff --git a/include/linux/phy/phy-qcom-qmp-usb-ss.h b/include/linux/phy/phy-qcom-qmp-usb-ss.h
new file mode 100644
index 000000000000..4da4d71e977d
--- /dev/null
+++ b/include/linux/phy/phy-qcom-qmp-usb-ss.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Shared submode contract between dwc3-qcom glue and the Qualcomm QMP
+ * USB3/combo PHY driver for communicating live SuperSpeed link presence
+ * at suspend-entry, via phy_set_mode_ext()'s submode argument.
+ */
+
+#ifndef _PHY_QCOM_QMP_USB_SS_H_
+#define _PHY_QCOM_QMP_USB_SS_H_
+
+enum qcom_usb_ss_state {
+	QCOM_USB_SS_UNKNOWN = 0,
+	QCOM_USB_SS_PRESENT,
+	QCOM_USB_SS_ABSENT,
+};
+
+#endif /* _PHY_QCOM_QMP_USB_SS_H_ */
-- 
2.43.0

