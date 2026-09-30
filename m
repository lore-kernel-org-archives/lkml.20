Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74224CB8A0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766967; cv=none; b=rT2SKSsBQqDDgcYW8HXEhSSlFpcK/TRA5PBKMLfuzOFtmJHZS22JgYZw8oM2vJzLCEb6vVpozzN96u/rUwOoQCq49ZpO7MnGBugE9x1m44f0re+1Xv1BSJY0JDIJGJ0veEcIHQh+225Q91sAqu/UPn/Q7PysVdML/ZPdQdq9+FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766967; c=relaxed/simple;
	bh=0hQRs2xRG7NPJzTOafhw45zfeq5NW8yRnvd1+lnwKkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q4du0zpDeudV8iK0rGzS+ofs0i+eYue51IT7Aa/MEW8mtqSQWxjZKC1lzVx+Dll/PfhJWurgMHIVGvPERH/a4zeZGl7IEDSv8JM4259kUroXyngZUKojFU0b5BPd7v8oOHl3qGTjMBuv6FduGLXVJiScw61uOkOd2M0Mznc3a2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D79HbAv9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=effn/QRy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D79HbAv9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="effn/QRy"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB8VpR3796684
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:16:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hd4j2gbQvyhMt+LqmRcx2Ghva4EWmXI+0WoX5Qjs2rk=; b=D79HbAv9X0sjHkuL
	n/rb9aW6L7Av+4Zrw0h57XyVbotm+owJ9IrcAp/4l4NtNzhX+o2/phpv5xKVF/PF
	cc/4b4j3PyGYtsJbdUOv3mzsZ36euBzQA39i5J6JGqAS+Vv1XiK7PqZRUt/74fR1
	q/vEAQNJ/1P34/nHt8HUNEa2Hvty/Z3paB0ePXSuIlmerZB58BxbunBEq5XXCvOh
	SWop9NV5GHpehJwxrgPSqK5OgdeAIU51QpWP39jCL1aKHpXGCgW36wTk8mObJhCT
	Ez31wDZ9pf8QsVMDNUE4u8ic8MkvXlUwGQwTWeQ4vETq+cS0oqWDMevKETAJuRTM
	9CLuFQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0nm3k35v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:16:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d7443e0f0bso71376985ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790766964; x=1791371764; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hd4j2gbQvyhMt+LqmRcx2Ghva4EWmXI+0WoX5Qjs2rk=;
        b=effn/QRyqob09ubm2GkdquDV4lxhD46T6NiUIRTcTQrQDOkTZ4+QFgT+mTWe42NnN2
         FW0XRGlagTtogXoFd7DfnrVTq054I1g7A289ZrooWBwdgnOOgxqHD4j66dH1iAEwimNX
         ROGjhuNrw6aWrhJZNkRodPqYFYDO2Adh7SYCt3usEPBnyV/G1FgCVOazWYTnImW584dM
         4xd2cvPgCf610U2KdzhJurmmMpbAKcm70bB2qt5LrKnT2ixGZfID6qOszo0o+2LMgPYm
         8zZa6g0OJYm1/OgLDDh4BWHl9BY2CHpe2qyzW3st8Ds8ep0CMbMyuZG2bH6yNKe7u0iw
         R/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790766964; x=1791371764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hd4j2gbQvyhMt+LqmRcx2Ghva4EWmXI+0WoX5Qjs2rk=;
        b=z4nGwhNRK7oa5HXh0hb7Gm6kt4wUwE+UZPDxRY49nKLMPteegvy2Q73wdIQG/OgBFF
         OFY4jHbwtfVP3W/mcL01vOnTkVz5AV+zLUgKsawovKldQFyWUOfzDEKAXWxi537kK4cq
         nQdEpEilpBPlX5ztxcx0TZHRWEaKiIUin0nEdlNVveHL2iyGVFxSVEBTag+q1E0o1eD4
         /yz4wWDII/eUiX/VMNKCIFjP1Y3Gq4MmCVqHctgnudFRKqm+ywiUWjhV6//ZYKOWV9Y4
         ECErpZfDSDBcQOt8UHmmzH2ekdwL++s7HTp1qDN8ZwoHwVAzU3h1SKKIE8K40hIhNWq6
         cjnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMGFYf/qLlNtTI8KHq5CTHvxxOJ4bjkYqej4gnd+io0UEbfplJ0pN/ev4ZFnY+dGNnO93TqumwXhXM6Vk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiQwbhEV9E3zIMPaMPw/ROWQv/2EkYQ9vWsomz5ACBt08M0WwF
	0r/mPp6NBUDFiMgHsOUIaDnwlK3h4uGsPo/ZBPxqTCRzmY6fKRJfIE5XXt3iGts0F2nkwn7c8Lc
	JsYZzGYw6FEOB/InctMYJIP8uFHb8KzDQxQi4U81GcPefGpdkj4byNybL/GOE2wbZJTY=
X-Gm-Gg: AYBFou3KbUPdVugo7GdtHqQQLq0XV4nq0W4V1hHhIa6WkBueCC/c1+Lw9fAJi2up0Sv
	C65qAqKPQ0P30OxCAzBRAHn1Cc9AyW2t3tbLFRyL3InP5tSkJlOj5FWsdwnrPsHYlZYGltAzTAO
	J4pl4Xvfswt5Qv1HD5vfVPgI71dEdn+UUxEQYlSPysQWeNV5WL7VH2p2vVSzi6J8GSGU0uQM5TT
	wmaijPhcqoS94Ip8NZcE+V/jCrgyRcREpLiY4P7siBoO9Qm7TqHfyFd/z0s4H0G/XvtTWNqMfRx
	nQ5/UrwB9rLmMnjQ+kNc+sw7jRfrwZWwhKSeh4qBWrdAbqifJZLBa6Ns0t1/VwQJ7oDSK4P4rPz
	75KTqiMOikf5wOzdn0KGTBtLTkeE=
X-Received: by 2002:a17:903:984:b0:2dd:c100:a5e5 with SMTP id d9443c01a7336-2e2e4bb6096mr8422975ad.57.1790766963692;
        Wed, 30 Sep 2026 04:16:03 -0700 (PDT)
X-Received: by 2002:a17:903:984:b0:2dd:c100:a5e5 with SMTP id d9443c01a7336-2e2e4bb6096mr8422745ad.57.1790766963057;
        Wed, 30 Sep 2026 04:16:03 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2e5c1b136sm5505465ad.71.2026.09.30.04.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:16:02 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 16:45:14 +0530
Subject: [PATCH v5 4/4] arm64: defconfig: Enable ILI7807S DSI panel driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-shikra-dt-changes-v5-4-8eaf658a0e38@oss.qualcomm.com>
References: <20260930-shikra-dt-changes-v5-0-8eaf658a0e38@oss.qualcomm.com>
In-Reply-To: <20260930-shikra-dt-changes-v5-0-8eaf658a0e38@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790766920; l=893;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=lDOzypBaoTVXWGcGUw8VEJhqSmey1bwy/9quu36cvXM=;
 b=ON1jW2Ivgae7Lw41ueUA2JYEeK1//Cm1XVWXXzYb8w5pQBB1dhUML6gjTBTMCrhGdyTO0UyFX
 LBNyD5b4/YODfdnGLvZdhkx5iit99TxvgOxO62T0i7F623g/y6JV2Lq
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-ORIG-GUID: 1gwWm4kv6mp0p7CpLkGYKP68COKmWCfn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfXzTYtzGbIBKpp
 Pzz7jXEojqTfOUGNcia8H/tFLR8gsidMJ1+iolWI4OoKXOgKiNqwMyoA7sTv44FwN0TDs3SabJX
 TTXcbiB6Bxn27hhgGFRr0lw8eWY35I0oCD3yMJC0Bt+s2WpXk6SvL/wRR6xYDuOq7G8BGRu2Z9+
 E851Tl1/maJbOTIDINCFwYoeErTfi9OLdqlqzywuUJSuiPr8XYJTMmbzqec7SNFULIqpCpaQknT
 I0LuAYcFTB+DJPFlVJJ5+nmO+ksJuHj2zGGBLX1ZOGp0+1PYW4azCi76eaN3LrwaOpboSVR3jlm
 5pAWRpml1fVrmpiHr7gPPa/1wKTbs6YbBEGOtVJJwlgSLii40BCx0yI8/wNT7jQ14vJGiF+5c5X
 EWz68dWKym/0uGGK8djivOv+nDxQxbisDzs4CYWAxQ+I4xQfWStBwB992OBZnkrDwmIDnT0GKca
 PQOOIfOCps7vNIxDlSQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfX08+cS4AWS2F1
 wyzX7+TKlxgw0BW1HxZy38ufLp5y0BliI6hWYuXqzb9OCiwCspcAgBwZYSTQWyZJ0W8hEeBCkqU
 lc2Sxa/V9c/SKFWVlWvm0PcbB5DGIcU=
X-Proofpoint-GUID: 1gwWm4kv6mp0p7CpLkGYKP68COKmWCfn
X-Authority-Analysis: v=2.4 cv=fqxJ914f c=1 sm=1 tr=0 ts=6abcef74 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=aMhaXRkMA95IrCOZcTgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300044

From: Arpit Saini <arpit.saini@oss.qualcomm.com>

Enable the ILI7807S 1080x1920 video-mode DSI panel driver as a module,
used on the Shikra CQM EVK board and CQS EVK board.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index fce418fe6ff6..65fcbbfc1601 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1026,6 +1026,7 @@ CONFIG_DRM_PANEL_LVDS=m
 CONFIG_DRM_PANEL_HIMAX_HX8279=m
 CONFIG_DRM_PANEL_HIMAX_HX83112A=m
 CONFIG_DRM_PANEL_HIMAX_HX83112B=m
+CONFIG_DRM_PANEL_ILITEK_ILI7807S=m
 CONFIG_DRM_PANEL_ILITEK_ILI9806E_SPI=m
 CONFIG_DRM_PANEL_ILITEK_ILI9882T=m
 CONFIG_DRM_PANEL_KHADAS_TS050=m

-- 
2.34.1

