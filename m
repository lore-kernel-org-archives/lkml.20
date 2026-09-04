Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FA248986D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524512; cv=none; b=XcT9antlw5qicpU+Snngm6JXf1Ggifi3+xa3vHLCcKi3ITOrsRTFOddRbGac1HmUu7JwrPktt7lRMJKq/vliuNX5c6bFLz5QyNnJYFwoLBWAU/Hvm993aRIRztHmpWHWNEcUTsB2h/CSDNu+vdC2RJFuATE72NVmtrMW9cJqUQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524512; c=relaxed/simple;
	bh=v6SdaWSgxymVKHJwk3EmFa5qVb23IUXi1ji4aQ+Zsbw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y6LmH/1pUXSdl/UiGqdWxmt6gHlautp9JMtIpa5LgRBjtwVUZgV9ngWZLtjX0SI/EsPuRsCxX+4fSh3PzUT7JrDIpoEC59L8ThGQNE03JZviHsg4yUlnBLmerhn4CK1Hj6CH41Sr2+tiK0DDeuxbp4d1qOZH6edLb9y0Gm5L4Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EIn19SdB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LYE1qoWI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EIn19SdB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LYE1qoWI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684AI9Xt2616015
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 12:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JPyvPsBHx45dZepUwhtUfd
	g2ue7cSA7It7dpIU9ph98=; b=EIn19SdBTm7SNKD7CHg5hP+07uC8EaLlFwSp+X
	w4DkCLplteF7KDj9xGmXfsIOrSamTy53ith750zGEYrWHTLqwlHOMu3HvW061J9t
	GYuvE4MzbMRJorZaBKu9TLwzVcmmouIX1gNInGDgcSuO+K0rRD5eFmNVpEYYi8U6
	mVc+0/p4PNJwfPN+x4VjBfMVccoZzMN1aKwjsrpeKaWyyX7jPuNR0AaxtQIVCMtg
	KhAjeZaA2QNjy1+JAKJ6a+CrMaBCkL2kG0wLmJ+2v2X2cAy/PPtS+c+guSx/BVzD
	GXPWROR6Yz8Q6tuxznHe7HoHaLjNkj9xPrzaC5iE303YWCeQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfdyp3dn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 12:21:50 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97cb18cfa04so754921241.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788524509; x=1789129309; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JPyvPsBHx45dZepUwhtUfdg2ue7cSA7It7dpIU9ph98=;
        b=LYE1qoWIvQo8n1+m6wk9YnwM/Fi2WQyEhJMj5zARd0Y7QnweLrMpW9KFqokegIdY6B
         A8gtHj+Fd7dnP1JERx5Vjb8sPl82L7h6Fz8YqY4AZ2M8qmPaNhvvmzMP3559XlEUVlpY
         LNlKUkop0EdWx76jIB4L8BFnrbf1XC1W9XrBwUt/LzaplFsK34E2KQcW6/6cGhnZwVlG
         ldueScHcyvPBOeKTRpBEVoPqEgBr4kQj6CxVkT+9IjQ3l0BcxqGIpmJ0p/dWDnyLY+Ek
         AkYgatCCrcRVU6+Omn7nOhZoELmDylzYagbJlfIMPc09hGOt3Sb40PSt3+P54fKItenb
         mUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524509; x=1789129309;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JPyvPsBHx45dZepUwhtUfdg2ue7cSA7It7dpIU9ph98=;
        b=C8feh+g3meTetpf7Twj8+Cdz1JccAEIiQu68tesLJlblBhWBTdPlkgHjU3dYxN12Hr
         mejk5EOEx4Ng0JHZnJe779dNv2UnT9PKyDiGVsD5W/HvEtI55r0kdn5zIPIYII4Hjb2p
         QywuufFJXeuZzY1NsFZ6T9YQJhhSS55fQBWm8+0U0ML8Hk0Pli/JrvrY/BIr1xxtVg/m
         +ZQM7mDq0PSSHqqhoeWFUp76QztMg0g+GOg7IqqWaPx3rRzqQOFsaY2blX8EtsHKbJ0Q
         unekn/evP/mTHsLUAGz/qjo0MLPtHcmhi3sqKgVmBZO5ixWb6aR8SJEV7g8/XwrCdQTg
         Hi6Q==
X-Forwarded-Encrypted: i=1; AKwUvByLupBUfNvVdNSpFKPWAngnfSCCXaIf4jhNRSnN5y2HiMBhUJfsnkp1jiv32Xln2/zYMeEauSad/n7xS9U=@vger.kernel.org
X-Gm-Message-State: AFuF++nGrdFjSjrjUJI7WughNKix4C69h6I6LKaOcrVLwe8yxAMlAZ2+
	Vlk2oiGKqvUSQoax5A+mWRmz8SUmOrTTHGaCftv54EMhyL2Kc4x1odFrpoIFfqTDViRgAEE7sau
	UK7Jd7w+tF/8t/veEtC4eIQFiyKcRlsdkzyG+c2WJuN8J6Iq9pjC/vMLHVRXU5pm3IJg=
X-Gm-Gg: AYBFou03I3La8rdbPY+XMmHRdgAqHXJvCj7oTYAhOQtlCLqusQ0CJgarDNZttytpE9E
	GjvZXc9hQL7X5K3jTbcJBxGxvTG0OiLBLFTmEn7S2N7EnvPvmtiv76lDme0D1W8WErd4yG/ZGs8
	zvVRhzfXAUlHEGFXUf9fyeCL8BGKgbNs0cwe3nOFwIBPGMn9Q5Evg7tXFAXxBNlX8/WJGSgWtBl
	eUNLpSYD6kaqLyK+cjjyMi/V0mlVdp7ngp42ROua8buFDKeTJrepr4Lj+YaNnIoPfjlxtHDROk5
	isJb+hbpyuDzBt36aJHIWjIX0fF7GgJml/2Eqq9yztwzrbw4ZDPhfoaTqfHrNeUc4kcoN9fR4gW
	wQ/0gqw==
X-Received: by 2002:a05:6102:291e:b0:77a:7620:81b4 with SMTP id ada2fe7eead31-78a4a839bd7mr1800468137.4.1788524509174;
        Fri, 04 Sep 2026 05:21:49 -0700 (PDT)
X-Received: by 2002:a05:6102:291e:b0:77a:7620:81b4 with SMTP id ada2fe7eead31-78a4a839bd7mr1800448137.4.1788524508640;
        Fri, 04 Sep 2026 05:21:48 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5927b68sm195686665e9.1.2026.09.04.05.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:21:47 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v6 0/3] arm64: dts: qcom: eliza: Add CDSP support and
 enable it on MTP and CQS SoM
Date: Fri, 04 Sep 2026 15:21:39 +0300
Message-Id: <20260904-dts-qcom-eliza-add-cdsp-v6-0-d4f38936902e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANO3mmoC/43RwW7DIAwG4FeJOJcKbAiw095j2oGAszK1TRvSa
 FuVdx/pDou0pdsFydLPZ8u+skx9osweqivraUw5dcdS1JuKhZ0/vhBPsdQMBNTCSMXjkPk5dAd
 O+/ThuY+Rh5hPXIC1bTQu2ACs/D711Ka3m/z0/FXnS/NKYZi5ObFLeej691vrUc65v7uMkguuQ
 ZPRxgM24rHLeXu++H0JH7blYXOzERYcyHUOCkeSNDRtg0HCCodLDtc5LJxDkoZqa9Cqn9ym+if
 TaNQghHM1xZWp1PdUVtzZmSpc67VDZ5GUrVc4veDwzs504WL01rcQwcFvJ5im6RM9k1aVWgIAA
 A==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1924;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=v6SdaWSgxymVKHJwk3EmFa5qVb23IUXi1ji4aQ+Zsbw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqmrfWpO851SkbKqdcOiPD1Yhu3pxrzJZzJWlui
 FSgVm8WNHCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapq31gAKCRAbX0TJAJUV
 Vhw6D/4t2zxJJNWWVjzNqv5MFfj69K4VEqmcTXKZ+8ZNsfBqt5ToxH5XDMrmBlkLShHHNf1sCZZ
 XGz1G8L6iJHOjA4z1YUhalUipRS+gici+wYjdpdx+FFojPGK21561UKe9yOGC9GQJbrE90dQgFD
 s2sn1QQ5jAtFpo/KWDKUz2v7AGR9W9bAQMFGDeqvgAAYE/yxk2F0DYVEQHjxImSLJkqww96QR1b
 FhnQY4drM7lusO7f/l46MnMIHVhrpDCx5aH6tu4vXGZaPeRPF3U9H+h7UzBIKT5Sly1BdYt8/6q
 q3bArs3xkbReOvezc89hL37gbl/CEe8W0Coqpk7HZYpJ+JKiqtxIhilf+djMGhwm7PqXC6Q1YjZ
 s4GKFJUd3U7Zb5+BfEzNyRP6yBemXoGuWxFtUCZNPKHwKVLDkAqKIcajGgNQeTNn/lLojjXHg6p
 3IGVS8GdhDs8VZm+samdkwblLGR4/jPKZhHhazzMqUbVrE9lKNd+mY+7B2Ij1IaL7wWDX6NwvcG
 A5iwMjdLcYKNDtqVjBW0ejdbYrlaI9xs7FEMdrIHlWoNciNZl5xXGrrxzURnUKz+Pde5bXhpGgh
 cEbox7TzQnIcrXWYnu4zuaVip61/AHRXgYPHdubI633YrkEfe1EAw41u0E8drIsIfCfXI/ZVKx7
 rhC9lmJCbawRTqQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: U_zxjBchs1ZDlc9NC3R4nPlI-G4NA7oV
X-Proofpoint-GUID: U_zxjBchs1ZDlc9NC3R4nPlI-G4NA7oV
X-Authority-Analysis: v=2.4 cv=Q5XiJY2a c=1 sm=1 tr=0 ts=6a9ab7de cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=LR_dMP8fg7ejCj7yXwoA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDExMSBTYWx0ZWRfX6l/H3+4aBs4X
 HNsPUVZN/wEInrCuFkeO5dhAnKjS2jvHa+g1WKt2WnPhI+Qpo30HtA8Jxz7d1psZy5PCwfKXq6P
 eXMrDSCOobnmdYlCX0aOi0NDtGmzp0F32I+/WADWwBuDfSsxqEF9b0nqU92cnaGW99HF+8rgcYB
 MaM58tqZHzK9gGxBlYKwvsa0JhYbihy2gKB46Tq1xvsjbgo/43iHo/eXcHE/HgMrG6RGb5f+OMR
 Yf+u21Xo2kYvCjYi/ewmh6qY39nOWqbgY5VF8Xkyx0hEO+74xVyV/EP/i4HYupa262rvxaOQl5s
 d9umrIQyHp/Px4WEcHx57EiCkkdwmbE1JgweoEenFta7RcStj7IM8NlgJD8vwsHflKZn5hPdxCz
 iIV2sNebx7jZLTCRgfHkJnJ6HLuht5BG9enZ6vC/TPiHtW4y3wTeCn3AtJl66eTWVpUMlwXhnVc
 bMHT+yLnwUHl7p718Pg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDExMSBTYWx0ZWRfXxDqW8GygKtXj
 bshXBf6MddSTnwB5clduxRIWaIcCXMGFva2TIkCulO6wQWtcF8pKgQ2V4iyLDYOldya+G+3ycog
 ul6nn1HQhDDD9+vrCzaMHsDxUxQJLZQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040111

Describe the CDSP node, the glink-edge and the related SMP2P, then enable
the CDSP on both the MTP and CQS SoM.

FastRPC node will be sent later on, along with the ADSP related one.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Changes in v6:
- Rebased on next-20260903.
- Fixed conflicts due to GPU patchset being already merged.
- Link to v5: https://patch.msgid.link/20260831-dts-qcom-eliza-add-cdsp-v5-0-dda8af2d2920@oss.qualcomm.com

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
base-commit: 9d80aa4617b32f5054c5aa471d06b66704854935
change-id: 20260714-dts-qcom-eliza-add-cdsp-0288fd79c8c2

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

