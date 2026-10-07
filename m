Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C997486417
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 12:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791377043; cv=none; b=fZMt0KXS9Wp4UCJweIlNvjF+Rz13uTma1N9XGOMbC7BY/m17B5TDPcLRmGkTnRTCvB+eLuF93wwZ7Y/Aa5VPt6VRKvWzB/q0vl9jHXIAXAKGxHoJJuEoBeqSuf7zSo896ahhWCy4vU6vYUAyB1xxlQAxLRsC/UB8WAgq23+EWiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791377043; c=relaxed/simple;
	bh=ti8tCeK59NnVT6ZgdMt1nmI1QkUPgRpOvJOJIvWc1Ys=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=d2S48dJGft14Qn/wlUsFh3qZsRjRqPlH79asRUhKyal2eVlU5SSItgMZgCcrH0LKWuXT8t5E5sj/HxOQVhWSzYEnJCNUTd8ygTfc4RWGz48rpZ22x4bnwcZ5s5KH56lQgY9l/FsN1ZhSqlZed6AP79x4AvvnMOQ7YnDxi8vj8Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LWiMyYlw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V3bHpMQ5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LWiMyYlw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V3bHpMQ5"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BVKDI4178563
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 12:43:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ge4UsmaaPXwMQSgwmlgfa5
	Y2DzK0kEKxxkf2gt3s19A=; b=LWiMyYlwaOxhzcNy+70tglvwlWuXd98z7dfN20
	8BRFMj7t8Y+eEsUCzz7nqb0pVpJKKkuXowxzQXj8gByMp0Cg3+Y1jnRqe1nJDe4e
	EDNrSPaCn3+0FIgK20uGlPsGwfSsEKPsUCOtrE90DXy+Qa665KUKmbvjEuBjH7fm
	sAdJmAI7n2Xak8TAUkdLrKx5JZFY58DyHpRs5/iaxnKLdGzM3cPINVa3WHtqbKBr
	b8qVUPQdbwmNumd1LTMcSt0bYjhnITgfFZ6DRrRQVCFMnqfWJMqMYjiygvUQAMOZ
	odGgYEOe3TjLlX6PgduO+C5xC1ZrMLIDDzF5Y0YzNp8sLTPg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c60a4e2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 12:43:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dc7337e2a7so40874545ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 05:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791377023; x=1791981823; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ge4UsmaaPXwMQSgwmlgfa5Y2DzK0kEKxxkf2gt3s19A=;
        b=V3bHpMQ5QKQ/AXE2qbGQjwlQOaVru0/5VbduBmw1ISJVrwXw3bFG9rr8/aL6bdgJA6
         2ijtXYxK4cNdKK5q3UAykXxYPczJf60Fah3qSK0kdjD/FLBmHPGPHOZkKQRDauA0lLqr
         a4E0LP+Qv+QUi7efJLN+pPNR4GxbTDT8NrYRzKz3rXUXgu/82Tyu5GKypEb4GOq6s1uU
         1vbVu+c865i07UvxJdUfwHi3vRNWBcRErADb3Nf6yw9Cyxi8kta0WSzFORb4GVdr4bbx
         ACUFwUwUqhvO5+uT7nDishQEzHRJDoGW4tKyV5GdAZ1zjQUmlzEw01x3unNCEcTLzGc9
         niDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791377023; x=1791981823;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ge4UsmaaPXwMQSgwmlgfa5Y2DzK0kEKxxkf2gt3s19A=;
        b=HpkNDlpErnHAkPw1Wfkt/BaM4A/EEfFrzfhKbw2xS2Joj7GM8j+LmZU5ZCtEySj90b
         U5is8d75rdrZILXVrgnEHLxJf/ZWc5T/GL8eVbCMl/aqgGNcArBTuvaI3UgGOIvmR1Vq
         mcYAUjmv4o5adY5rD+lHwgl9sQ/D3Plkjn6nIXYsBbJJOY+tOJQX9UQLuBzEfNkjWznd
         ++SzpREMgVxqWcdI2xQ0MRiYdat1SjhshhJzwEma8kbNEMMSb60mHPVG8mSpIAvmp0gZ
         vtrvV5lh0Vtrq4rRXjxafXPEe2G275k7Xbq+3uyTOP0ofOaINAyQFrV7C7fz/jkxbTJ/
         S7lA==
X-Forwarded-Encrypted: i=1; AKwUvBwDbcPMJxGJ00B/OTpgrKaoAkk1i8vDY5k7I8qV/+oD1l2pJra0iGulvJv+/twzhyyNofhDTA2b3VcGNng=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhQMQLwmW+xaJD1ierK6sCCrL3LXZv7nHCyosSLZR8g6nHRr7F
	CGc5qJcC6DaA/6VbactcWpER+Gd8FlsfrfZSEqJYeUpIAPtQi6oexygTJlUBF0QMua2zdYVss7D
	uWsklcgrIFNE0Fefdkxmwk4u1nnX/RX3De87H/wwx7ttsFJCwnnFR20VNG7VoVWP1zyU=
X-Gm-Gg: AYBFou0vgCVKP9W37nHlMxVhfJu1iNMVzrxUU/axyb8DV6QHEtjdV1q+tCYmeNuO0Lc
	YEZO6FwS5TsjFkCfDFaVl19JDgyOa65R6aLvqGiKYo1anWuTUqyF866QnJBC0Pk6Y8AuFI1g1i8
	D1dVL1eGZNh4xrH6oOOwCp0pmA8Ps2DiZTiHlBP2Khv3XXtl10tQHERagSLzZX/lSbP+MHa2r8h
	wjwTuwLeFNtMZXwqfuU1++z5L8AxfGez4Ehhda0rC3rLnTIAhTKuSHKpD3klLL12jYlE3Huz2Xt
	tmUBxjvTO/7GcJnyp5TZnY1jsem5l2zqxzFuZ8Xmgtk5Nw7EKBt848ycLzy2WmM73JRy9XQb+Zf
	7kk2i5cJjRrx4iFjCWs870Fvb
X-Received: by 2002:a17:902:8b85:b0:2e4:a338:365e with SMTP id d9443c01a7336-2e600536b45mr13501495ad.42.1791377022927;
        Wed, 07 Oct 2026 05:43:42 -0700 (PDT)
X-Received: by 2002:a17:902:8b85:b0:2e4:a338:365e with SMTP id d9443c01a7336-2e600536b45mr13501295ad.42.1791377022316;
        Wed, 07 Oct 2026 05:43:42 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e604437bb7sm9680245ad.1.2026.10.07.05.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 05:43:40 -0700 (PDT)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Subject: [PATCH v4 0/2] Subject: arm64: qcom: shikra-iqs-evk: Add LT9611UXD
 HDMI bridge support
Date: Wed, 07 Oct 2026 18:13:25 +0530
Message-Id: <20261007-master_lt9611uxd-v4-0-5eac97965ff8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG0+xmoC/5VQQWrDMBD8itG5G1ayJNs55R8lBFlaN2rjuJFkE
 Qj5e+Q40EJPvSzMMrMzszcWKXiKbFvdWKDso5/OBci3itmjOX8QeFcwEyg0R2xgNDFROJxSpzm
 frw56dKRlYxxywYqsN5HATuPo0yIcrNXK1aY3ClXnHOeoRKOJt2i1kAU2mrt2WKTfgQZ/faZ5Z
 1my/bqLc/9J9nntxQp0mUvU9KL+stxW/zFcWmFXI8Sj/woGXIK1dYSsAKElM2jVGqS63U0xbi6
 zOS1GmzJ+DnAN6z8s5AZygQglBEoxWCek+ivd3+8PPW9l/HsBAAA=
X-Change-ID: 20261007-master_lt9611uxd-b0de647ad012
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791377016; l=2210;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=ti8tCeK59NnVT6ZgdMt1nmI1QkUPgRpOvJOJIvWc1Ys=;
 b=6JiuUYs7MQe4Hvrhi0t+wwfyQ1kHu5VKZ1KccibgWMiCmz//qIzYEDw0LXYXZrU3xDUnfig4L
 6UlQJHkmyZkCOZcR4niBvBRHWLIY8EI5roQ8dlh7xF1vsqMWof5Y5pR
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-ORIG-GUID: jZMjEPuPr_Guqi2SSBe76u_SVkwDttNl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA1MCBTYWx0ZWRfX/fS1TMvpGa8l
 g7WZ2P41P3fwsAbGsov8Lf3tmzpiUpYOJ/4hsakmASNvj+a5PxC7YtYyfrk80hj9JEpt31T1uSm
 4SKc2xzuYCllLN3iZuIlNZQwJLOivj0=
X-Authority-Analysis: v=2.4 cv=PM+aavqC c=1 sm=1 tr=0 ts=6ac63e7f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=spVTYJvaZBYa3VVWI6cA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: jZMjEPuPr_Guqi2SSBe76u_SVkwDttNl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA1MCBTYWx0ZWRfX8SiWVXK8/2k2
 bsQji3URyuOn5E1ZWe3jptKM2tav0QZBNs0+SsW+nZpKkfkZDyz7GLKrR63fasjlnk0U2rF5s4C
 SPXrux/2yL3QgoUd+BbhUbgsnY/3cMpqL/X+Hw4ujNAGP8uTCFXcK5qWdn224IX0SGycRLt4/pb
 K5y3ahRbPgRX73ArOncxsKzT1ZAdeE6uddn/sNuKavaG97ByitYTtaeQXKEt1andF1NqHeG1v52
 UfNYbMGbVNMlDjhCsko46zC+BRofk4QpfQXZ0duxA2syYtB2veiGYcnFMWuhe0FwPOWRokACdts
 O45dq20EUBnQGILRVdd4RhqIJM6iE99KQe4v7lIoehDsno7vyySlCuBYE4ijnaUJsYo/Ph7WnbW
 8AcNYdYTXgJxEb41KUCiHIfLcJJo7WkyepYfihH2yVjmMcyF+DA4ubGeYYT+hLBW/EeJI5LY7OX
 fS+VwgxbH7ghhEPSnAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070050

Add MDSS display and LT9611UXD DSI-to-HDMI bridge support for the
Shikra IQS EVK, and enable the LT9611C bridge driver in defconfig.

Dependencies:
https://lore.kernel.org/all/20260930-shikra-dt-changes-v5-0-8eaf658a0e38@oss.qualcomm.com/
https://lore.kernel.org/all/20260916-lt9611c-v7-v16-0-c65042fcd245@oss.qualcomm.com/

Changes in v4:
- Rebased on top of next-20260929 (linux-next tag).
- Only two prerequisites remain: the display v5 series and the LT9611C
  driver v16 series, as all other dependencies have since landed in
  linux-next.
- Rename lt9611-specific regulator and pinctrl labels to more generic
  names since these will be shared with other display interfaces in DT
  overlay.
- Link to v3: https://lore.kernel.org/all/20260728-shikra-work-v3-0-e08c322596ac@oss.qualcomm.com/

Changes in v3:
- Remove superfluous comment from pm8150_l11 regulator node.
- Link to v2: https://lore.kernel.org/all/20260717-shikra-work-v2-0-86ae8552259e@oss.qualcomm.com/

Changes in v2:
- Removed port-select property.
- reset and irq is aligned as per driver.
- Rebase on top of shikra-display-v4 series to pass schema check.
- Link to v1 [1/2]: https://lore.kernel.org/lkml/20260627-shikra-dt-changes-v1-5-449a402673d0@oss.qualcomm.com/
- Link to v1 [2/2]: https://lore.kernel.org/lkml/20260618-shikra-work-v1-1-dc30381263f9@oss.qualcomm.com/

prerequisite-message-id: <20260930-shikra-dt-changes-v5-0-8eaf658a0e38@oss.qualcomm.com>
prerequisite-message-id: <20260916-lt9611c-v7-v16-0-c65042fcd245@oss.qualcomm.com>

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
change-id: 20260618-shikra-work-ea756b564b2d
---
Mohit Dsor (2):
      arm64: dts: qcom: shikra-iqs-evk: Add LT9611UXD HDMI bridge support
      arm64: defconfig: Enable LT9611C bridge driver

 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 109 ++++++++++++++++++++++++++++
 arch/arm64/configs/defconfig                |   1 +
 2 files changed, 110 insertions(+)
---
base-commit: fcc65d3aba5059dd1105276e180c624110761d8f
change-id: 20261007-master_lt9611uxd-b0de647ad012

Best regards,
--  
Mohit Dsor <mohit.dsor@oss.qualcomm.com>

