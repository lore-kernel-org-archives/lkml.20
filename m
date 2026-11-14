Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678897;
	b=Be6p0WIAgdAr6FH151VQIQT9BgyS0nhwXCwMpGN1/sH+zz0tATwXJwXVOhmHYA5gDDvb
	 imby81WsSRK9l13hCCag7hBAGRMAIDmItqaPReruDVT+KDMcT/L6wpoI1KB5khgMZimza
	 R7ZfEx4fi0Xwz+2rqRAl4gcpJd745NvlFSRBYzpHvZcllgbhXW/1Gc2nPnFFkqSHNqxNw
	 RnKvyq3dppMuerIKvEkcyYetZNxTbAfB/RvxeuBswiDP+sTS6x/p8NV9EHABW8FxGRkcr
	 JwMzmz448kMMEdTdmhQ/hYdZfAMZ1OiBRDu8Kv4bmQ+rHcHy/cDaUe72qENG5Yk68Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678897;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=T9jAmjlpPJzKEesHQGiR1/l1Z0EuOSLOuEzosz2QsKs=;
	b=T8DQfQRTDy6EB61Rrkc4SPOLTOi6u4u6TQWFPyvdTsxfycz9A9y423b7YekWR5PfIIOT
	 OwXvGGrnDtp8COtfC8xaXVu+b38RzNK1jF4zk+QzWVdx0cm1s17Tii4KWLkZ8DGMhVunW
	 8ZOLQ9LIoaJMGRfxPPumdwvsW9QgQgggEAK5DcqRs9zzh35Za/uPRFqyzQ2iogXmvSZUI
	 pa/ln9GVlsfswqb/z9953C2RhERsMusKd52Dy9/qYacsMFs8FTJYytEdkOiwEVO8QsaNQ
	 R3TgQQoIcFpVSi9HlPfBZGLaPLNGCczwwc9YiVp3ZG2BNkAL5YcW54W3VgmMtuU1eFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E4AOo+dk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CSjUWNad;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29588606A89D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:54:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29588606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E4AOo+dk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CSjUWNad
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEHpCpg4135587
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T9jAmjlpPJzKEesHQGiR1/l1Z0EuOSLOuEzosz2QsKs=; b=E4AOo+dk9HBpmuCZ
	PCk3NfaPzeok0qV1FH4OUSz93vxqG/od7b6ejpk3HWu+wvReYZ6qR/7g/ZkafhE2
	x9jqvRNVN5NF83HdV8X5v/jrkaAVJXXoJqpUeTU0pNS1YSOltNyGvJvxBXtu9h1f
	hx8/PuxCSn9Byh3bRCkhhE8S0vyZrqzQFC9uLco4GpocjgAevLQSiYWd+xCenFWG
	nanQd3KN9t37qIJ2SuSeNZ5ee34+6qH0FuitvHPhfbd20iYxTfOXG021OW65xkdV
	pK1RbOswUGRern29wfkIwABwIvNM34k48sQ7WdnWlhs/DYVOA3gsV/YjUX7Xi6Ci
	wJ20yQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhkw9ag8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:54:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb7f9bb86so506071685a.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794678895; x=1795283695; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T9jAmjlpPJzKEesHQGiR1/l1Z0EuOSLOuEzosz2QsKs=;
        b=CSjUWNadyNmpjxmZTM/yUNP3ITznnFQWKBXvz/tKx5Gz+GEiEccxcrkxy97SAoKj26
         Ch+NqLSoCQ5XBxZKFr0d0IunNPD0gdSEW5wZqHFSGC/wXe/wq8Z8FQ/W3/ewdWeJd9Ps
         x/bpZhZrqA++cmjEUqRzHrdYFIE4cPOjtZp+gz009roERVuoOENmtgt2+bXQ1bpwNToE
         PClptPl8aNVZ3OREwkz2JDpv5LHMRn2pEWh2OReb03m2MYr4nJwDsCALIuwqjGKx5O2O
         uZngGVc+NHi2DrAAeYll27KkBKD1mRsJukfhg9Q23wkm0Zhrx/+YbkIKSUA6ygrUD4Ga
         xs5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678895; x=1795283695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T9jAmjlpPJzKEesHQGiR1/l1Z0EuOSLOuEzosz2QsKs=;
        b=w5lugKWm45zxCb3m337shoh+13nmxVsikRZzJfzzpR8Ek4AKZ0+zkSuivz1RR3Q8CC
         K1hzw+ZYppjzrS9mdmeRli3H7YQkDa/awiRDgcEsRg8DtYjTVT0linvWdQqma/fuP4fL
         NGlMo1NECVHT3Fj+/tVEC6NyIvaDlnqMgzdi8q0iwBi2r0I6dYVdXWtqp8rJfgUyXUhN
         iPEXKrZDrou1PrlCg/zZKlqkcjrPFsuuAKDj7Xgt9zbdzypGg9TBq9Ef2KR2EtSrJVpY
         G7H59CDX44cwX6k2xEDGfyEOtzslI3YQnTHizx/2LfqB30NZWVVAlAt0UXVgHOW7AUtC
         s7Ig==
X-Forwarded-Encrypted: i=1; AL+hErEM3k4lSs+MSogRs0rRW3NykeVLnpu2EucxtP/Yxe6zV7HK3+7fRuAKj47qyEqI0Crx7UWyyaHu5MIYHcU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vjkugO9fX4SxRL5At9HY1p+wGz3C+qQDMG7/IgYKK5AsPwzr7
	V4pNCwp+NsiSDUT2PA0UHNvvc/5j91W/Jzt+QGxoy2X77g6faIKZXVjtqEipcAyzfMkgPo7QAvV
	Q6yXfGyqpxvZSJpEK8O3Hlau+eRbIqCf4yc/++6JN//iFncj7p5hFGy67N09taptmusQ=
X-Gm-Gg: AYBFou0dzXBnbVG/dqXZH6zXexo8IINFRxPkgAFiyAdchDu6izoTpQF+M0V46lQZ8aa
	AQDRzqmj23AvDAOj7NqTLlh+wW2NoVGS+7FU84rFnNnwSsgRkUtnD9X+6GUabaAqzVh7ZrMdLE3
	XpqHknZ0IVB7xBSIFeGIiaBOI8NLxxQP6DQs7E92I81Y0kLo4Nn2KdmowQNItkYEEYpwCuy3t3p
	+nuNVienT6v2eLroT943DZVRh5kHpSS6Y3bkktCYYQ6HitE6pa+J/o0/Gw/wtgrZTpr+B/24X3r
	9qzosPCE97TUpWBxB2Qp/JhBSUmprF7YT/jj1qAOZjE14KQ9fDTsMlRPkWdrd7BxATRlwXIQ7tP
	Ut5HiML1gePl+AWCYuIOxp+02GwrUlQTS6sYxLazo88EF0rVQsfZMYyE13EzZey20uNem/w==
X-Received: by 2002:a05:620a:4152:b0:949:6e5f:7395 with SMTP id af79cd13be357-9496e5f7ecemr179563985a.79.1794678895418;
        Sat, 14 Nov 2026 09:54:55 -0800 (PST)
X-Received: by 2002:a05:620a:4152:b0:949:6e5f:7395 with SMTP id af79cd13be357-9496e5f7ecemr179560385a.79.1794678894960;
        Sat, 14 Nov 2026 09:54:54 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c888b90d4sm11060292f8f.9.2026.11.14.09.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:54:53 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 18:54:37 +0100
Subject: [PATCH v4 2/4] arm64: dts: qcom: msm8996-oneplus: Disable
 disconnected DSI
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
Message-Id: <20261114-display-msm-of-graph-v4-2-b8de044c6c1b@oss.qualcomm.com>
References: <20261114-display-msm-of-graph-v4-0-b8de044c6c1b@oss.qualcomm.com>
In-Reply-To: <20261114-display-msm-of-graph-v4-0-b8de044c6c1b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1033;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GCFRCKJTBF0tDduwhG+AEpuoFlapsyUUwKoJTS/2B/I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq+KBiwypVbiB/+sME4U5cLI8rqkqaraxGTw7XS
 AfLuhR49AOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavigYgAKCRDBN2bmhouD
 1wE2D/0bw3W8hvBUayS9i62tP7e+l38ABke7P4J+I+RrzXqTv4qtL2nDYgDgCdSaGdxPJAGDerh
 w2VaQ9FXPoE4vbgVdEnaKxlQmrWVj5T/8SXLJBHqj8lr0y2eUKseeMXf7lpcIsiF/ZY3HWaK8Aq
 YuzazYF/QkL7BHFWp/LmhrAAI88rJ6tg7WIqu8tgpoV60niC0JZ7/65Crz+ob5wgqGQC+wQg7+L
 ZmINWEkF0uGLGqWN5FcnoZiMDBpeeqFRwojEeYLeJXK4Bou7uQGD9EsK6J/qL0yV5tFgzgofyrQ
 ExiJ6q0yYSIGvHEdrM5ickJejK/QM1s7zdw7FnWwVc3WC6qjiMJDcP+OGCJIZr4IUZM4WpyMMay
 WZh8l8eQXdKtOhdjZPLFX6KolLmnThXTztldaiyrNV3CKI5epagPQ1sErtlsXQcuZZMbw4eJ5/B
 w/3e7y0oSekT/4DTdeGkGd25ZjLwsjKo2t03kREhnXdnUWZ+GJQUHYSQjTJLaf/Tbz+SKOFJkNt
 70JiMBzyK0vi9MOMrtD4ew1od/Nt7ffKgEXNUI6F7nkBjx+IYzPx/HjKEmoCuBcudPQB+xHYc+N
 JKX+XCiAiDct136ylo4tPlwzVu3PW+ALvv//ANwlq4G9Awn5SBSFIya9mzbHgynvCuX44RzB9/Q
 PPyp6kzg0WUSvbw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA3MSBTYWx0ZWRfXxy4HmkoB/e4X
 q9THnq7kJJGTSacu43Nvn2/ueE70EUsXMYYrY44dVIqOuWntIlvhR6FwqYwYV8HjjkKCXE3aTXT
 qau0BctH6HntNZmNIJ75vjiU6dE/KvzDOzVzLhG+I/4flfKkakDqiBMj2maMUJycnNHhCmBxfRv
 X4HWVsBI6kIykqCx/0e8EVwJGZ4PBfszZEhjLU4ulHuE0ckXKMwOV0JZzg+HI9eNZU5gpW/oK9v
 djyCWA1r9lu49CjU73nqzDitg7fUDQRf1gena7qyQwOYeH/beHVNs7qwjWcn+DlehMK3IZNik45
 MZskIUhgxu9Gk/qb/59y1ZHfhRlBoIYbmb30GmQ52IYolnK0YB78cpGCiYukRy+Bu844YVS1gHM
 jAOJOEfcrkMeXQv7+rQJ8UVEWuYjlhe/w3wnifpYLqtbiaOEcRRpNuD94Z0iJuPEkdlWNekk3Rz
 kY4QGZQiITLk/o+8uYA==
X-Authority-Analysis: v=2.4 cv=YPYKWhGx c=1 sm=1 tr=0 ts=6af8a070 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=eMlgcxtRJz0w_Lr9rQYA:9 a=4tUkUnfIpJ8A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: P5G97S2xHZmods_EPMfGJGJR1mT3SEhM
X-Proofpoint-ORIG-GUID: P5G97S2xHZmods_EPMfGJGJR1mT3SEhM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA3MSBTYWx0ZWRfX6VBDB6DYDSOL
 ZLQ6pDQXvli8c+Q+oy0vX5ux+2rdIZvm2P2dOVe6A2fy0Xzke++m6nrWGtyUtEglWyAaWqsHTFp
 aS2oY58xO5WPePtpc9ZiHw7KNnMdb4s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140071

MDSS DSI and DSI PHY are useless, when nothing is attached (no panel
description in DTS), thus should be disabled in DTS: no bridge will be
registered and no component device will be bound.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
index 7a3f8afae22d..9c2cef11e7a9 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
@@ -189,7 +189,6 @@ &mdss {
 &mdss_dsi0 {
 	vdda-supply = <&vreg_l2a_1p25>;
 	vcca-supply = <&vreg_l22a_3p0>;
-	status = "okay";
 };
 
 &mdss_dsi0_out {
@@ -198,7 +197,6 @@ &mdss_dsi0_out {
 
 &mdss_dsi0_phy {
 	vcca-supply = <&vreg_l28a_0p925>;
-	status = "okay";
 };
 
 &mmcc {

-- 
2.53.0

