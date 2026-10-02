Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0777B17A30A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 00:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790899668; cv=none; b=bRqfIInnwF6u5I6JMpdkcPzkBYpEgR8K8fNLVUPvr9dLm++DN7EajIqt3x0qdaDPssjcPT7/RN8UgKgT8oqguM/qVqjh4Gcxwdine8t3dXYCt8xDabr/QxMnEA0NxFm4ENZFBQUXqnhITADBfdP3Ts/pWSPy8MBUfgl8HgCxhc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790899668; c=relaxed/simple;
	bh=zBZcmNXuO/NzbVEJ2ouyLzvkw/Q/Q315SZOdwDqgSz8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qJfQ5W8KimG1EVRtcuuhS5BNLDua6/cHdwZnUEc2jcRmhK9+T3TarXvQNiv9iuMAaV2NnUjms8YH9vM+5KPR5/7n8O3BeCXV1EXefU/t18NAjAsoP3g6QaqlFJN7VB+oFAfOdNzKHmdzJtrINda4/vItkpJeEX1Tkt5XW+Owr48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DGYY9l4N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VyueMjFm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DGYY9l4N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VyueMjFm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691NEteZ3622824
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 00:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BQJfU3IjbIoORZkplTaHXj+Q637BAZn/Le9NwQ7gxrg=; b=DGYY9l4Ni1dKF1cr
	nTiRY0j2Mh1V3O46h+ohmBvjRCseYBcrr5rjXL7LXOU+vsCaGHrsJcTsNKIgdS+b
	ZU+tVVyV7JB0ladWSyf6lkbQoi4GZ29GJIA9na/RnbJv+78nFJrzjICJMDlM1nGC
	Jkffn6xR2YvbiYRXjAHD60ahWjaed4PYNowUIWqxZmTAeAakPqp6znphesKyUd2V
	tIE+CwqCpRn4KwlfGq3jMizCFoBNL3Sp6V67/4F+Kqr06KoWEwFobxHP+l/E0cg6
	OGso03e1EuUYJB+pd3Z2AgWOw6XywEe4YdDVxJsj5sPP/PftGBeiH/QMZLjZdrfZ
	fwuM7Q==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1t9a9xgb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 00:07:45 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1438719cc1eso8419394c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 17:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790899665; x=1791504465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BQJfU3IjbIoORZkplTaHXj+Q637BAZn/Le9NwQ7gxrg=;
        b=VyueMjFmTnhLyjGYEOSlTrE7Dr0kTSabq//nll0hNYgwExaDytY3+Gv5y1ydbw/bM+
         UVep01CTNk73funsdordBt/dkGp19BmnF/WlUcaogqsPgr2Lk/e0OGl5YvckoJSzYSvz
         jHyZxVSknNGPom7C2LN/Puwnc2eZ6vRBhS3ANucJEYIDD7LKcgWnSNdunkhcdIzvKkVj
         oS+DWqjtZuEcskvJKEhsq5Kknpd7AxBpNXGLYs3/Sr6wvtVQSf6YgVMiGOHe6yEZZRP7
         WoK/I3WQyK/TA8fn1D1dMWI5qsuCV65BV74Fxr0XygyhN2Cup05Z6GDp1Is81omaosQv
         zoCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790899665; x=1791504465;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BQJfU3IjbIoORZkplTaHXj+Q637BAZn/Le9NwQ7gxrg=;
        b=KO2ZXE1OznTkW1NT8GpmMtlDRs2lBcghkgoLaB9vTjq96bDZkfEMhDpSZxMHD9eBrK
         xx3IZJHC6oQR/Qp1PwNp4B0b9g/mFYajCgY4az4RTJXo4EuoZNAwNEMxGtZVb/yho8kg
         1VRidOLtSGSTvNAjG4yfqji6Xj1bMIa3P1ojGlm9fTAi6Pk2Zhz5nwyazBeGI42OLClX
         FAE3EjCE9+cYT43HEd9GL2cnxHLvWQTsex3IEXJnOWWkCP4x7jTSUUdq7zaPnRXQozss
         XzlEKVFFFiNi2WDzD4Nh6aGrjjEgZ+qunCXyrnNP9oGqEx7qlA3ZXCj1Q3saI4ldPrGF
         emmw==
X-Forwarded-Encrypted: i=1; AKwUvByncFG6nWZIyv+tSLV90VOSGreeGDaGsJ04kIE7dIKwGiSt4y9C0tjI0HaQfEcUi+KbiY77XgxTJQQJ+F8=@vger.kernel.org
X-Gm-Message-State: AFuF++k6hc85PU5gESaASiBC+kTJsLy37a7Wa9hG6a1xsySI6MxBqO/7
	xntl8BGy8GX9xTtDHU5Ox2vx/T5F7S1wRcD4MFPm9EgDpHaIa0ulbbPiIHE2uhcJRPq0cxVmWVF
	syIIqJXOtAuZVudcmg8h1w7GjmdLWRcj+H6EhiYPreN0ZkIA0lT/MdP+GgStLPguUvy6CTnya6V
	g=
X-Gm-Gg: AYBFou0z8fiYWZVDR1KDtiZ8Pg7uGjsvtGJQkWhNtL7BE6e9Cz1aXHeFVo/6uw0795E
	Piwca4Vi4vBhM2pkyNRoj1KYIsmh0ul02wom5MQ2JE/JBmU+Qucymd31LZF73smfmH6hIEU8pfS
	9dVyyyjt0lKA9mIA3TMHOp/7BKNcHpMZ3fec3qIH7L3GXQNolIeXg+MT4PU4OiurMGxABhkJndV
	uV9A/J4spVAThuxACaLqAHXX/h1jErWvSa4TS8EPJ5pewQo+Hk7X72Grlg/S1GOprBKC+alwkwn
	TK+ixYBjSqCauCZhtE8zn9dkB7iEOz06OKEn170x1EiydAtnHmyOphTkm+uqzXUDrniKgQdVZqE
	KFj/07or+dLI5N+ONc+MoJBbkDhYQebBd1Or9c+jsLKCVnGG9tUSP5A==
X-Received: by 2002:a05:701b:4509:10b0:143:2967:c0b0 with SMTP id a92af1059eb24-14f5bdf1a6dmr871491c88.24.1790899664534;
        Thu, 01 Oct 2026 17:07:44 -0700 (PDT)
X-Received: by 2002:a05:701b:4509:10b0:143:2967:c0b0 with SMTP id a92af1059eb24-14f5bdf1a6dmr871441c88.24.1790899663730;
        Thu, 01 Oct 2026 17:07:43 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f660f1sm1561300eec.13.2026.10.01.17.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 17:07:43 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/1] usb: dwc3: Clear SUSPHY before issuing core soft reset
Date: Thu,  1 Oct 2026 17:07:41 -0700
Message-Id: <20261002000741.450793-2-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261002000741.450793-1-elson.serrao@oss.qualcomm.com>
References: <20261002000741.450793-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAwMCBTYWx0ZWRfX5AAFGl1s6oha
 oZyYIYesXXsw4bmBVGOXP/mPyWUuqGLCPk4qW6xa9uAF3D/HToqbvJuqK/Aw6CyxzuWYV79Pqaj
 78zKwWGdNRfrXGKIb0UrthaWXcpmNqM=
X-Authority-Analysis: v=2.4 cv=N++8hG9B c=1 sm=1 tr=0 ts=6abef5d1 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=08aMs1y6DiTsec35tm0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: ziUq3EfIYwyyJdMq-ZOSrqPkGF6LDbur
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAwMCBTYWx0ZWRfX1BzreiigXedc
 EXk1xbmHn8RqCLCAILay4igw3hcmXY2yX8DtxiJS9tL0GogFOqKgiHqsDmPqpsiKDtbZbmDfTC/
 qWw6vFcxRVoWnKyzpVAyjjKBTnYT6jDwTPLQQnTLLGvLgvpij5p7CgaA+mKzEgHg3KDV5XJ/HY6
 Ffrbbl9Rtfowf6/a5rIiGy+o2FsdZtxKWfe5kNHctWSW7fP6GgNfBjk+quBUh37OD6dgnB7fAF9
 ulCgIGnfFpbmOqTMO9/1Tvim8EAjnQmtILV92L98Ryj3/Icxndc9r8VA41ICxHiz6DWvZnDZMYH
 eiafTCm3mSJnSUf6LpNQesGC0+voDtuQ6+dYgQ2oN2eRWrmDRPA+BmX/+iIz47W+MdBrVmjALR+
 9HJVirPip6zsG1VTDlIYDWdU3C7r7eyWKsglILxdG/NvHr4GoUCNClXLieFWdrEgDHbJJm35UKr
 Fy2lZNKNAe5iRnh2fbw==
X-Proofpoint-GUID: ziUq3EfIYwyyJdMq-ZOSrqPkGF6LDbur
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_05,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020000

The controller clears DCTL.CSFTRST only after all required logic has
been reset and all PHY clocks are active. If SUSPHY remains set, the PHY
may not be fully active during the reset sequence, causing the core soft
reset to fail to complete.
 
Clear SUSPHY before asserting DCTL.CSFTRST to ensure the PHY remains
active while the reset is in progress.

Fixes: cc5bfc4e16fc ("usb: dwc3: Set SUSPENDENABLE soon after phy init")
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/dwc3/core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index fd5c2cd36c59..282a853c364e 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -332,6 +332,13 @@ int dwc3_core_soft_reset(struct dwc3 *dwc)
 	if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST)
 		return 0;
 
+	/*
+	 * The core clears DCTL.CSFTRST only after all necessary logic is
+	 * reset and all PHY clocks are active/running. Clear SUSPHY before
+	 * issuing the reset so that the PHY is active.
+	 */
+	dwc3_enable_susphy(dwc, false);
+
 	reg = dwc3_readl(dwc, DWC3_DCTL);
 	reg |= DWC3_DCTL_CSFTRST;
 	reg &= ~DWC3_DCTL_RUN_STOP;
-- 
2.34.1

