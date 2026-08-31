Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDE540488C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170719; cv=none; b=VH94j55A2UM1NB+1Q5HdB8PrDPxqcVOPsbKHdohB3LQeeKOIbV69wdepgwoDYCFnTf7AR0e3dvHDIKzNpTDKG80SJIssSPTz+a/hRm9+4CiW+x2e26LvBG/ZhLDbotBwWStgGwFieVO5BHCidgrho6up7COtLpxJoAQgSyynadI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170719; c=relaxed/simple;
	bh=1UZu1qAv5CLmfBpbXSSF3amQ0tmL/bZJkNX8biA1VV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TjgJEthZzznhv2HZhUGa/a0lRWyYhvC5Gf894XQO8L3jjMe8mtDNuBRCuv53IxZQFmQBi8jplk3Dmz3BealZRSM5B3TqHcOslgPLubkQ6VKd8L08ADIiGmwQTTwZABcWuWvrR4M9MTI5dAxlA5QYDiDn/MYz3O7lUlx4FXwNs/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a6tzMLNE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YdbEaVDG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a6tzMLNE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YdbEaVDG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V9A7783182578
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wH1S9pJ6EqnPz5z5goKUHgqcZx8crYFjW5crdUNGvjs=; b=a6tzMLNEA9yDgyTv
	kptmtWkxU46Qr58peRRbihY77WN2ah0EcGdICkLFt6wlED/aa+3rwH4x7yqMGl8M
	WoYJ/xKQQKSnjkhICtnXn9h56x062KBaGCOWTzf2OYnnYV1sPgit9mCw+YhTQmY5
	MVr97ldhg08FeBtFPxmqXKRKRzqYYLdFiAgRV9CS6LOwJsegIGA2cUMX6cZhvKff
	/CtQK9dLc10I0NCj7HF7ThqcMygmHFExtv/6kjxFkzxnguRTrI9vHN1Wgfze6EbL
	S2FS+np/dLo4jcONdyC8pzzAwF8pGwi5YrKwsu+lbRBlya6w8jG35xnU/Wq6ahue
	E1SgbA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6rb8765-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:05:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9375d92d8cdso585661585a.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788170716; x=1788775516; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wH1S9pJ6EqnPz5z5goKUHgqcZx8crYFjW5crdUNGvjs=;
        b=YdbEaVDGv2LzcE8V9hhbbJSTAtEKJlRPgn9SRzZCAX1Ft0/JhBPiNJgYRpMjxVwKGa
         l1IPIlHB614Lzrns4wbUTPhevgYRkgDZVo9Zdv3/G9LlFV4QoiuNTi6w+PQ5DzkDUBTw
         EzNDLqADM9YcBBPdVMstLyJ3l6ivsxjEG/5PN4tRnNEDqHnNYBSHE4eag7CmIBfDP5UU
         C2R8Tn8W5F1x+MUjvKyaTfL9B/uCGsdSa0uUSfP7QpmvHWhC9+cGiM4I7PO/upoUdFka
         LorEYkRlXtI5CRnG7KkL5tLWO+P8PfYIhiTgANTu1KF1g/10hz7FR8UM9kEDXNDr4u2N
         OmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788170716; x=1788775516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wH1S9pJ6EqnPz5z5goKUHgqcZx8crYFjW5crdUNGvjs=;
        b=Sk2vQOl5sg7u0UP5fza0Y0K1YPQpuNW30N1SiRcqg3b9BTor9jZ1VheOPcx7I57OmB
         S0BBItaIawq8otpUzIYjWLUzMkh2Pp2WA2Cl7b+4fctd3suR5Mb5weTHUQcxxxNc1/IX
         UfW54xvZDC/LLb2/zfv+XUzRntSB94jnzDWjy9gms53iV1yiFLw2JD18oDtVxB9cOxh3
         iqnfTi1Qt5AMEpXpStPAVMros8WpimU05xDgAY7LJ4RdM1bMuKkimM2fhS4Kc8Vr1zCz
         bZSPCPopoXvkkVTk1RJF8r3NRlr0mc+JyWKkr1D4wz5/9joFjgmPphX9+FCXgN13z8q1
         ZoLA==
X-Forwarded-Encrypted: i=1; AHgh+RqlTylHpHx+8A2petBNGa1L172sw9N8YiER25BMbO1jqQ10QEqbOdNJ7D+zXEjBBFdPujYhanClFmhRHJ4=@vger.kernel.org
X-Gm-Message-State: AFuF++nU+UIDQTQVJZfkYY2sQlY5emlrfl9fffSrRkmJIpWtLy1xIGhO
	IbZK33gsqQqqvB8xaRAPVMCZa9CLr58FzkCOFFmKjtPg9C9tQCZFUrrH5Z5nlaMpM1ZA3pStWUi
	vCOWWOKdkPfbD6LjTKZIxqMU10mybhMD6J1r7rILZNvyXIPrev6tit5sW6fA5PwraofE=
X-Gm-Gg: AR+sD10QbsX6BhvR+lJyf9ex5HgZFzyZyI4fvuK/IhMMjsUDrT3VuamHpc6j/FzUmTC
	vpstB0atXj1SNChIHe7EhRw59AnU1cmAuigBC/fJIeJoSAgK3mH3zurDXPsZgByt//ZYAAl0utw
	r6dSaZY6mvEHt3NkM1OvAsV7qVwtMmTeWUxAC/LzJJIX694xU2rdrtgZy7XMQjd+BgXTtIo5+ga
	1qim7YZs2orIAwK8DGy+iDbGg2/ry4UOT7Jy1h15VAcpwgBhvolG54NH1czBvjCoU/RhMORj4hb
	dpqCOnQAiuwg8UAtbOnmYRwgTelwYwuGSws+ADXifSjFyDWKnQQqY+81wPDAWdVNO+RsP5wL/+9
	8vMDIPw==
X-Received: by 2002:a05:620a:44d3:b0:937:75cd:4627 with SMTP id af79cd13be357-9391395431fmr2638032085a.32.1788170715687;
        Mon, 31 Aug 2026 03:05:15 -0700 (PDT)
X-Received: by 2002:a05:620a:44d3:b0:937:75cd:4627 with SMTP id af79cd13be357-9391395431fmr2638024385a.32.1788170715143;
        Mon, 31 Aug 2026 03:05:15 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9281772bsm131001555e9.1.2026.08.31.03.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 03:05:13 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 12:54:47 +0300
Subject: [PATCH 7/9] arm64: dts: qcom: medion-sprchrgd-14-s1: Mark the EC
 reset gpio as reserved
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-7-5b202de8c74f@oss.qualcomm.com>
References: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
In-Reply-To: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=961;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=1UZu1qAv5CLmfBpbXSSF3amQ0tmL/bZJkNX8biA1VV0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqlVAGsC0vu0lqpGX+MxHUvnN9GCIPXqx0Uef+j
 KMeMXcoh+mJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapVQBgAKCRAbX0TJAJUV
 VgtaD/0YHe1qdTO/Q0CyGuAwuHh7INUBJ0TxaPNyR0p0Aht5000C03Zr1GyqmzVNh9pB+tBQDd+
 ilkwP3PVMJAhXHxE70Vee0Pyyv3s/HDcpLMMmRHiXG3QlDFyyjP0iYJ7JMjBvpLEz9hDvdv6HzG
 RiAwYw18Ce+TiOlrLjDtTNjNeYPXtyxgk9BDgRs7TAymMIiqd4V+PWXMH+NNUCSpV5g3ZLNYGRh
 IhcSunlv6ffT9VqaJR7HgyfH22kJ2XKQp+5XhwEK8rbPmR2aJRxd6ZuS75yFgYmhl9HWEXug6Xk
 hp5uoQkH7kDR3LBuex7ozuSvl13NthU1Z5kEd7MUIT3aW1X5kdOSI0Q4l9275DqM/DVT5wUtDsH
 wD28dpJoE+aB7TiZ/J3EarQhGryuawLoiGRzKbrj1YVlwpv/1flSfSbZEe5mniHz4oQ+KHbruQ0
 6Nq6yUlRB9XkJmuqQ0HP28loLKw3m4RX/ZSwezJvZuWqo4BCL5BGjErkxmC+E+zy+Owtf+C2Ktr
 q26Xgca8io86mFBon5yqxS6ExEaNQtfl+HuKporFVPnSIjNPuHwpFL3NhN8nifpyxvi41+FZ7Mo
 Syh+Q+D16B7g8bJbRYx/wbZ5iZ3YKOfpP5k9hPZqOB3NfMBEvAAljdq7l1+aV6DKgjKEeqjtmBW
 qYICp1Ys8Jq1+jQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: l3sg0kHrSAZWu-nz3GDQIIsi4AlwgzcY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfX31c9wdkVReXJ
 pXxm7fiLVqCD7D+dnUaGLvfwrVi7jl5/4qHxSOKismgtd5oRMRIe2TBX/P6MZFKCogk70grTsdo
 169SLR8TFLbM1Pa6kAqJl97urPeLMfAdggQaqethDtqOI1oM5hGJ9Qa46N1BhwjftjQeCJ0Dv/5
 Nygik1fKNC95wmuAqaMU53UYQ7eqj+7sSNLg5w532q0FX8vHXjCHKLEZNt2eK9mpd1FDkju5jHT
 TLoiElnFQzFy2qbwHzd9M8Pt5vlHVGsz/11K8ezeyhntrAMn15IiNaqGqWPhv0YKZ0ydye16OZN
 Q0tkUUwtnnwqtDPgoD3YfP1R70RMJVeYYI6jJTFknLsfc3tJgUzjfYtbK2aFP7bPRjaU/OvMRZ/
 6mMNjK2IRVCFdMPDyOxBS7obdj1+uwg3G6WajbAzwNSjbxLm/7Zp5stBleZCPlSjscLJQuiWFPI
 5UTMnKFE3BugaFI8qsw==
X-Proofpoint-GUID: l3sg0kHrSAZWu-nz3GDQIIsi4AlwgzcY
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfX+X6OKbKbRiE+
 2qSJucGz4nYHyWftU0TbTXBOoY7hgcGmVP0bK4xaoT9oSru17hA6YuFrAoHsRVuUHNiSQ2M68s8
 UTyYCADUYO6fqaTaN1gl+gUyAxib848=
X-Authority-Analysis: v=2.4 cv=d/fFDxjE c=1 sm=1 tr=0 ts=6a9551dc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=CMvFW3PhXCOqgS_gPO8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310086

GPIO 65 from TLMM is used by the embedded controller as its reset line.
Reserve it to prevent Linux from requesting or reconfiguring it.

Fixes: 8cf65490cdb0 ("arm64: dts: qcom: Add dts for Medion SPRCHRGD 14 S1")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
index e4a0b86847cd..4b45f293e167 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
@@ -1251,6 +1251,7 @@ right_tweeter: speaker@0,1 {
 &tlmm {
 	gpio-reserved-ranges = <28 4>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <238 1>; /* UFS Reset */
 
 	edp_reg_en: edp-reg-en-state {

-- 
2.54.0

