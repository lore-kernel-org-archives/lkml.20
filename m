Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF3339150B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788195442; cv=none; b=kh/KE4OSdT0GGySuPvBEyf+yfLliBYgGD2QlKxz2o3uD5KrIenqG34r5j+fSO83c/8a/kCfI7pOMN+UGwEU3dXxP3r/KLOx2KhZ3OleK7SUhNdGaIp8jiHVFkUbV5udIF9cjhj5QigekTIjDH/f9kDKoATR+T+k+Kg+UB0nixxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788195442; c=relaxed/simple;
	bh=9sJ3LHh0ppy3ORuD+EnBWwtGDSG1TYbkTaHvnUa/I44=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RIaYEmAAEDfQejBMqjpyev2CORR/Gp673rlBnZWPxHVZtkUJVdsJlUppQosExlg3H2z3YKLqqcmZhuCX+brLbG1vwvHI9/2sGwocK0039mQDkekJIF+vHTLxcuNm3D50zzvJr7IJxN/oUHy3BawEgQ3WKZyRTwF0+3Fxbo/JWzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pgJNu5a6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S5SqGW1+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pgJNu5a6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S5SqGW1+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VFppEC3477044
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=E/yACU3TUAL4r22NGDhbPP
	Q0l3DgkjOaXh2agjXQ/Yw=; b=pgJNu5a6+ctL2e5lYoI8PKXc1rGS5TkkJzR8VX
	dUp7CyZgi2k6+Zd9IXS15rmQtqxPmL2CImR77XafuuwvmbPO+J+ufampR+5I1gPW
	V6jCgji+tOucgA69JTpR3LDF+QEimwt/Gn/VyMXCVioVqZDq1sqTs69Xo+CgY1rP
	4gR257NnCfvqVFTr5TsC30McUzIw40vgpulMrxtDH6MmhPJXcc6RlzfD9yAZgpTX
	71j1LobXf/Pr+RU1JP/D7iRsbrUgUQMQB5ib3D7w2HmUG6Nb6oefm+SVelaR8v/2
	JcYy4XDIXiO4XgAkaZR+YSNLgfWY2DeGh3ypFgAc7WPZotIw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6ayj5a4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:57:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e4f946461so614974485a.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788195439; x=1788800239; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E/yACU3TUAL4r22NGDhbPPQ0l3DgkjOaXh2agjXQ/Yw=;
        b=S5SqGW1+57nvgTnNoHlv/PmhE2m57z31EcNTn7avvYKBlbr+oxqy8Bp2Gfnh9DP5PK
         WaHFVXWepdDPLxnvN82sux/bCdwG1bQGqpcGfwEa2IReXlPTVsQHz1OwNuf2zBi6ejVz
         BUO7H1BWWhlC+VjN3ECel2uAWygmZTEC40VYo/4ap9Pvl5TYpFGwUDEF5COZ3xehGCHR
         m+Jq1zs/kYQLVY+Nhp7ffCmuBZM60pjoWQr/YA2DvsmQ/YVhlFIGsT+EvFOe4Mpvd4az
         30yJ15+lx3fa1yM1pVuh987uHzxqNdOJw92Gf8Y7nUeLcDKTI7Cp0u6uH0rweCpmIDJc
         0Nsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788195439; x=1788800239;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E/yACU3TUAL4r22NGDhbPPQ0l3DgkjOaXh2agjXQ/Yw=;
        b=lTPBaU0s2n87vNgNt8fbTglUNNY0aNAqIvVG0DRkmvO8GljhfNt6ZM3QYJB6tFBqJo
         KCZaClyYatNpzzGmqWDb4jrNwb+gLuoyF58RJPvjG8l437wfzWsmPUkdH5Gz5LH6hUq1
         nZ/ePLeiTYZ/BxhwryPau8yz6eM0RSvv32y6cLAMwKWZl1CGxTAXG2bRWoZX9IYt2XGF
         9URcEaUPQTXx6O6+0cp4rJ40IjUJPqUkW2B9z7/XMvp3SGqz2R7U1Y1pUy8zOyz12jKm
         dAq+Accs0wkOoOIpD+Fm4BItXFjzUgy3z7H3FFyUBsTjVbQvRGjX6Z/UEAXjY09ngtan
         IAlw==
X-Forwarded-Encrypted: i=1; AHgh+Rqgn+GCn7K3TGDdtktjJpUzGQ85AniNLfp40Ol2J1fvLp5OF5dlh+jGaDWLL3WkVTBmoIb3XN9o3Wysz8g=@vger.kernel.org
X-Gm-Message-State: AFuF++klE1sE5lnEOZaI318xdzMlr4eutj8wiYtJgFw0FgS8Y+kWmuOW
	esd0LisvXyl5UYefhtZsQ9ofHS14mmV+xMwsHJV1jBFxmaaGs9EPKdq9rmJ5eoNPzJt9XLvLnrm
	A+cHe3M50yTk3pkhghtIOtY2b3/gIhxVp6Sq8jTOr9mAIY/Go78hfBFkM+JoLH2OAgcA=
X-Gm-Gg: AR+sD10Eq0Puyq3iHG7Gx2AZqni6lHDbEJ0O7CAEedhnbDPwCMeYpii/XcQ9StdVeuf
	SW0gspZpYBS92CrY1lwQ5+0M9eZ39ywcVrmpkjVYiQL3xs6bOuXevVuVQcA9NBUDZbjKCM5s4/4
	30UKIf3Z5VtnpXfS4j6C5SWVN3ytWeJhroTzj8iHzQdecs55pzP49ALT+SDNAh7VV4QjyWzh0dk
	T9H0cOQR6wjtObxQHk2zZIqPeKr0Zk96kpn4nIHBb1lrARYpTXdKVu311fustY4wU0lRp9Tyk4w
	PJUwZ+3bfbgzOHWGv7eR/hs1PU4aEw3s/ThxGLG9yp6Zq/IJ6WLoy9/sU6pK2nIGbftR073X4Bs
	YAZZhLQ==
X-Received: by 2002:a05:620a:27c7:b0:937:6d2e:d023 with SMTP id af79cd13be357-93948156bf7mr388653085a.30.1788195439272;
        Mon, 31 Aug 2026 09:57:19 -0700 (PDT)
X-Received: by 2002:a05:620a:27c7:b0:937:6d2e:d023 with SMTP id af79cd13be357-93948156bf7mr388644985a.30.1788195438687;
        Mon, 31 Aug 2026 09:57:18 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b955e7906sm248426785e9.1.2026.08.31.09.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 09:57:17 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v5 0/3] arm64: dts: qcom: eliza: Add CDSP support and
 enable it on MTP and CQS SoM
Date: Mon, 31 Aug 2026 19:57:10 +0300
Message-Id: <20260831-dts-qcom-eliza-add-cdsp-v5-0-dda8af2d2920@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGeylWoC/43QTW7CMBAF4KtEXmNkz8Sxzar3qFj4Z1JcAYE4R
 LQod69DF0Vq03Zj6UnP34zmxjL1iTLbVDfW05hy6o4lqFXFws4dX4inWDIDAY3QsuZxyPwcugO
 nfXp33MXIQ8wnLsCYNmobTABWfp96atP1Lj9vP3O++FcKw8zNjV3KQ9e/3UePcu79PWWUXHAFi
 rTSDtCLpy7n9fni9qV8WJeHzcNGeOBALnNQOJKkwLceg4QFDh85XOawcBZJamqMRlN/51bVPxm
 vUIEQ1jYUF7aqv7Yy4peb1YVrnbJoDVJtmh+4aZo+APNbiq0LAgAA
X-Change-ID: 20260714-dts-qcom-eliza-add-cdsp-0288fd79c8c2
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1708;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=9sJ3LHh0ppy3ORuD+EnBWwtGDSG1TYbkTaHvnUa/I44=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqlbJpPWyvVjZwx3htyDrg5OlRbOJ1WFU3CjB0d
 OiCjwF6eJaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapWyaQAKCRAbX0TJAJUV
 VjkMEAC+WRQYgyj2ySZr5F1bPciUKyaSPN7dGSmuYd30DnXzEWB5y4Vjm/dUrDOMou9NIdozNNj
 fInZP/iYNgoWFdjq5KWJU8vVhsDbS8nPgQyyovsopS4b3TnoUUZN3Tw5LfSmdkrl4Q94SBA+f55
 Dfs+Ho0kVLnup5OAEIKkvGA3Ud50QVNdwT8MVWxXhP7I+DKvT23ukR1+hXwVpugOWxIocWVE1Mw
 GuiuzzktnMxO9JUUOvjNKM3eK5WCFzQkak8Da3nGbgLRgOE3zp7EtDCYmPUtlgWivThV7JHuMDz
 yTtcgMHt6BSwqTjgydiJxMgZhUYwUuJam0mgcwVM8dSHL9/r59FNT37TlSoawH4e0Yr5EhILskU
 WnHc0q5WR3avVv0v/nsELGWGJ0l0RIa6JuG6YWyBbWha4QNR8F1dd97FJTwMbKCucjhMi9K5spk
 ClFsfkPVvWuGERaa0GTLjPi1h4SJ/oXCfyYyw7aOqLS7GDuNF31+RFTHo+rRYaVK1QFLHHUUH2t
 nnfeDmnN8pjiErF4ojwf5SvsRrY0qvQ3wtOdLh7m/1vTyX2QyL51REEYBbjkQa2bZgT1sbB+XAJ
 oGr+SRspVhLqIXf+ohSTDbv5pmdaxMnfPYKF8eBBTW+fEH02KJtf3RO0Q7i7tcOi9HtMUsTUklu
 kwa694un+TS6AqQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE0NiBTYWx0ZWRfXzuqHP3Y0gkGG
 4ZHYyNiPAzmAFra4LJB8O/f76yWcaKGJLDgC0Wzdu33lzcyKgptZIQ/1ASNhe99GUTioKZsJa5v
 NnByejcRy0PHMwZ4z1t8aZygCge+nJo=
X-Proofpoint-GUID: TiOjhut2zvALD3YXT6LbtP9xKicWI8zO
X-Authority-Analysis: v=2.4 cv=CYE4Irrl c=1 sm=1 tr=0 ts=6a95b26f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=LR_dMP8fg7ejCj7yXwoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: TiOjhut2zvALD3YXT6LbtP9xKicWI8zO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE0NiBTYWx0ZWRfX5eaVlXwIa9HP
 8MaR4Sa5cFvy+Kx0OZyY4zxdZWUoFtoLBRwhcdE7G8Ic0fAk+OglJpmWwvugwMwysIuUFDD1/Fu
 E6y0yeUqcHrv+emmKG1Mj/NmJ1f1SDjJr0ifZV8kEsYvA/Gh7mLS7csipcWeX+RPjV6r8Acu18p
 7r4S+0wgGqne5ToNkb5J5VpDi8hkOd9lZmFHtvfkKMa1jA2GyD3xlFqRhYvtT9BI7S6YITC7Jdg
 AUXdx1anY0myLlmjllk8rg5JMMm+iXLl9s8UG6XixZdVCumA9XELBF42ZK9Qn8TByz+RlzWZCqi
 Zo7wJ7pdLr1Il0PSykN6gkW7nWKmfA16+gkkBndLQ9BuNViFV0GOEeWkg47oiWgzEyaqZRnzC8a
 o2ZyiKEXSVTSItAtLbq91xs2gjvoymN/uRXK+8BUVRpMv3u0gyEKPLBOqyePqo90pP5i4XZukuM
 Gs0/i6lbCICqeA1hK4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310146

Describe the CDSP node, the glink-edge and the related SMP2P, then enable
the CDSP on both the MTP and CQS SoM.

FastRPC node will be sent later on, along with the ADSP related one.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Changes in v5:
- Rebased on next-20260831.
- Link to v4: https://patch.msgid.link/20260804-dts-qcom-eliza-add-cdsp-v4-0-fa593983e486@oss.qualcomm.com

Changes in v4:
- Rebased on next-20260803.
- Link to v3: https://patch.msgid.link/20260723-dts-qcom-eliza-add-cdsp-v3-0-b535200996ed@oss.qualcomm.com

Changes in v3:
- Rebased on next-20260722.
- Picked up Dmitry's R-b tags for MTP and CQS SoM patches.
- Reworded DTSI commit message to suggest that FastRPC will be
  sent separately, as suggested by Dmitry.
- Added the GLINK edge node.
- Link to v2: https://patch.msgid.link/20260721-dts-qcom-eliza-add-cdsp-v2-0-e1e52bfb3c12@oss.qualcomm.com

Changes in v2:
- Rebased on next-20260720
- Picked up Konrad's R-b tags.
- Link to v1: https://patch.msgid.link/20260714-dts-qcom-eliza-add-cdsp-v1-0-525e757a23b0@oss.qualcomm.com

---
Abel Vesa (3):
      arm64: dts: qcom: eliza: Describe the CDSP remoteproc
      arm64: dts: qcom: eliza-mtp: Enable CDSP remoteproc
      arm64: dts: qcom: eliza-cqs-som: Enable CDSP remoteproc

 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi |  7 +++
 arch/arm64/boot/dts/qcom/eliza-mtp.dts      |  7 +++
 arch/arm64/boot/dts/qcom/eliza.dtsi         | 75 +++++++++++++++++++++++++++++
 3 files changed, 89 insertions(+)
---
base-commit: 89c07d98716a13454ec3fd9f97689e812cc71bd4
change-id: 20260714-dts-qcom-eliza-add-cdsp-0288fd79c8c2

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

