Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01599522687
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063506; cv=none; b=NYEvwfBRMHB5pspyBb1Yz4mfP2NoZ0v79HvGWLZ1RXvCmLyIWM+XmGAra2FeK5F6dy8HZUH9/0/X9G05IfxQcAvQ6FR6r7xlJzY1U37FU5apYZgkTRnrR5LgU2BWvKaikrLovr2DwLxZwLRusHSAVVz5MMBF8Uc7LmPt0/gXBIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063506; c=relaxed/simple;
	bh=DkLr6iZir28wyBb4Mt08Yb0a9leNjeOw+D9cX32H6+Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aBJM30nL/OmjlUMJNqn3LWh7Nbvh2oxHxeZu/fFTWnCzq8YWeUsKIq4yigZyNaivaAGPHiQlkrzMT8qTnpXb42eoyOAyB4ubm/xuTBPjaPN7sHYU+ds5THlhCvsT0l7RKXIcnWvbfTnCuLZe5Y7G8UB9t2qqC2BdUjDeI2uqCQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A51AK5Xi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=huiscNiF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A51AK5Xi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="huiscNiF"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M3h65H1842310
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dXYPR7nHWAjeDaFMXwNLe6
	QSNeIOFksPga28ERzlkeI=; b=A51AK5XiJCW40ZXS+oVGRaFtmwBQxKKF8NAG5v
	a2O4xEET1b9fITCcUHYB3Dye88H7pFgecj4edLajQnzl0gNrdRbBwMUNDrUDTlWE
	78BviVQ25EwMAh1WuItXYPdC5FpqJwDXGY65axpMlraFM1JTG25A7xHfUGrfnY5Z
	JESyWn/UvD87QoYBGe0oTcv87TUlrUhhW3Jv/Ic4dpg4hv7RRx/6fE2iRi66NVo4
	JRnmLAMSNgCS7z6Cv6B7Q/ADAwSwk0EAmZAFIqqeYLA2mMUTtG3QqxjeIvpi/YC7
	PMxDxpbyxc7Eor1ZrVAf9YdJlTAfqBxlbbMh/nD/hDw/fjAw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj110uae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:51:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93bfb2da664so598809785a.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790063490; x=1790668290; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dXYPR7nHWAjeDaFMXwNLe6QSNeIOFksPga28ERzlkeI=;
        b=huiscNiFi7Uw29ayyGm0jk0yixK3P4uTeqSNUNgj18xAYtgI1y9JgreYIVD/4PNTqF
         s9qtvCM302L9Pxc1HDFCMS2hDJwbmsVbCO88YdKBFxGm6SjJdD2nQqvEyFvpE5VB5QFK
         4xUboJ498vXCdZCMtWsI0DcKNjWEia80mZczj4P2vX4YzrijQeSqsmSol0xzesHHc8EW
         Dbx35w2AYZM4DBB14ZggFTYW7Mz0NbNOc+1X17acTCK+7+/V6bdx6k/V+R4d9LnVsRxK
         itntg4RfrohNVyXKcK4rU7s800onSK5pLtKXgySnlDz6OgWf4pVufNwydaSv8rOzFjDm
         Jljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790063490; x=1790668290;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dXYPR7nHWAjeDaFMXwNLe6QSNeIOFksPga28ERzlkeI=;
        b=MBJF1IdFa5UWFSGZggo4AFh5rJkJLVqApbNESTmN/KNK9ix5+Lb/H/ipH1uZoOwZuK
         vSDhSiWZhFUlvH6jR6qffsjsbZ/XA2li4T6++fztZZEYEiAYMWib4E6WUBKdjQL1X7yq
         bV00TZS9xqOn46FekBnNvqRMeVKtFbzQZDth1ZAE3lI7pP6WvlQ5FU9qmnInckEjVxYu
         nRG6U9F3r8W9zDeU93BIQAcmR4dnSuXfWbVYEO0YRIs7mQnbLrMIykg0mHCmSn9n/fJv
         YAL7R7KPQK7/SHwtqWfGropfZ2y/5O5a0PJ+foJbAods3YCaSml1lqgrWdX/uv6ks9F+
         lu8g==
X-Forwarded-Encrypted: i=1; AKwUvByngWPCwI7oWRzBybvxhpPVdb2P0d5HR2J+0plS4DYBeNnvKlo7uuijHkpMROyDNU9kjlB4zW+/kRFmE60=@vger.kernel.org
X-Gm-Message-State: AFuF++mybHaExZKvCiZOLsqgK4Gz+o/zU1VgBPVLnWPPhuqqWiyWq4aT
	z+ZEy1az5Oph1BpdsVUEhkimfcBoISt6yXBz6/aU3SBSezf2fKZ/6ybTqwUJ++QjWfuLndT0pDs
	Pl//AU6dPBKyIT7ClbU4OQtez9xd97yJwaVITwhP1t0QVCY7dgdujcfKqhFTTF3CqnNo=
X-Gm-Gg: AYBFou0bArH58y85/m1zbOE5wsopJZxK3zSRnh1kjjmEU74MMYtvIHiflAWcde6EJtS
	HQY4tG9t0on0WyHIrN55zmDHofR/3DfY5EIbML1qpbEO2myKA4ZyZ6oMMehlu3436+lynMKrJ7g
	Q8td2luyxyyCIeUAzE2s4f9T1tCplNYYy/QfTeJNFJQwJcGBMVxNtIEsPQC0aZ4iCzcmXOeYX0w
	OL+GJxqqPBEhnrKIsPXWGkcO2Lu7QJhAN+mcj6/O5IGEDsOjVaJkOiK8kouWPD9bfnwxD4amhoc
	NcYu+yEKZz7sZW+abAUesV6fZ07vlHDBF8opQaexFsf09LkvSmOBob1vJ5CbRjzIsh430YbE/Dd
	yCogPNu1U
X-Received: by 2002:a05:620a:408c:b0:939:112:d526 with SMTP id af79cd13be357-93c15d92a91mr453888385a.18.1790063489912;
        Tue, 22 Sep 2026 00:51:29 -0700 (PDT)
X-Received: by 2002:a05:620a:408c:b0:939:112:d526 with SMTP id af79cd13be357-93c15d92a91mr453884885a.18.1790063489429;
        Tue, 22 Sep 2026 00:51:29 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862789080sm3046925f8f.28.2026.09.22.00.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:51:28 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 00/13] arm64: dts: qcom: hamoa: Mark the EC reset gpio
 as reserved
Date: Tue, 22 Sep 2026 10:51:09 +0300
Message-Id: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAG0zsmoC/5WOzQ7CIBCEX8VwdhuKragn38N44GexGFtaQKJp+
 u7SevDiQS+bnWTmmxlJQG8xkMNqJB6TDdZ1WWzWK6Ia0V0QrM6aMMq2dLcpQccAg3ItNKJ1Ajx
 mQEJAtbwRLr11QKWpuZGaVchJRvUejX0sNafzW4e7vKKKM3t2NDZE55/LjlTOvj8rUwkUaplDG
 neKV+boQiiGu7jlZFvkQ+bmxD7sPf2VzTLbVEJyrKTktf7CnqbpBTWyYQFNAQAA
X-Change-ID: 20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-0bf57fbd24e7
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=4785;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=DkLr6iZir28wyBb4Mt08Yb0a9leNjeOw+D9cX32H6+Q=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqsjNxRIiky2zwou+H/A7FxiZGlxcTRt9t7ilYR
 +ZzXHdqZw2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarIzcQAKCRAbX0TJAJUV
 VooID/45fnYT5rwVUowEQwjeBHMA+XjFM3OPvX0KDrnedxIqaPALSrYtWNMM813eCu50aRo4e45
 r0ZcBPBGz/L9kpcDKkrjF4bq1WhZKhowq1Z9s+5ND4blGIPdnmgqEhdgxNRMSAH50BuRWyAkO9F
 NfeFy+ItgAH7wEHqRP9vWT1C85C/pF8tzO+S5SQcuO6AoaQWJQAeSrrO2zv9IddD6XCDVvISQ8D
 Ei+QmUfUb9DPjK5QVUT2BwGflsRtySNxg3uSrrGbkuIEFiYkvNz9e0348O84r1ry4bsc1QZBIGH
 03+1eyXAPwCKjuz1TLSg5J95wunzpVwx2amEL2OxUQehojCQBGDe+LKUkajjkyw9AscfnsHyJQV
 ylTGBihtRWlOVsGBLWI0tAGgnbRDGDbwMVNbm4ms1SWT/qPcdQ0yPRUbq4bJsOEkG5eCuRtobc2
 3BSzkWVsnIycagfChas5VDrrhA3xxnFBseNteLiaG5Tt62xvIZInHvKfGHXUOw4eXmxtexbZcuD
 FcDxG2QebSau+H2WaEAQSWAYg6jPRBs7+iY/avLbfSdlNx+Rv8j1n+60vCn1N20BjO12yAYf/eh
 BK5v2DQXy1DpPMp/czHZsZ2KXJZarkMOCzcDp+CZnMw+qjlX35K7ZdLIvglk7MQ2ufq4linrXk4
 RJ2LQEv8a35nGfg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: MifXLMxw66jrnwyovHwbumtQQogaV1g-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfX8Oii1CIxLkEs
 aUcViJ9itl57MWtTwGFeLlfdM0bAR3s2FE8KkDbPK9pWOrligWBa18fAZBJhCCc2O8uzAhP/5t9
 poKh7/x6zMb8/hcYmBNMXIv211ycpf8=
X-Proofpoint-ORIG-GUID: MifXLMxw66jrnwyovHwbumtQQogaV1g-
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab23383 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=yDUiu3_GAAAA:8 a=iLNU1ar6AAAA:8
 a=gxl3bz0cAAAA:8 a=X9uYJ1hcyrHnrYopOo0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22 a=gafEeHOdjwYkg5oUpzAY:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfXxW3yOEWTLI0N
 L/OaiXx/w6zHn4v0dsxYRpyBxt/q4hPO9Wx2Bn+rLauHNLEY+tWUsj8hF4KNESFe7ZwnYVbEw2C
 J9OzL4UK586Ht1AXxs1uO8v0muv0jL7pB4G1bNdwdAxY5x/im7iKtkuF034HKWjuFyVRkRoIUOX
 aKg7SuwaNCSPid/fM8ssOF/DcZf4b7QshG4eQbblxpzzRywXwgAfm3LCl0z9H2vxvu9vd38bsby
 jbyvqXqe+ZIWSKj0+MDK/xN+mzGZe9BnK2+1rNlx1HFzHT1G5/Z0c/UCUDHvxvJFVwpvk2FVdML
 rYBfe34/Y68UqCv9MGUOQSmdjVWofi/JQY5vHdkx0IA5nuOlLHJuliLxjj9hh6EBzGiLZEZ+a0S
 kqNBT8gsIvYuDYGHhuuFt6RTUqzlKEZKRivDUOlEMAM365nFS537cC42h+63ljwxM59oyHbGXbR
 XGiNCm6dVi3+WQcXVoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220111

GPIO 65 is confirmed to be connected to the EC reset line on the CRD,
QCP, XPS 13, and T14s. The same wiring pattern appears to be shared by
the other Hamoa and Purwa boards covered by this series. Microsoft
devices are excluded: GPIO 65 is needed for touchpad operation on
Romulus, and its use as EC reset is unconfirmed on the other Surface
devices.

This prevents Linux from toggling a line that can leave some devices
unable to power on until their battery is disconnected. On the CRD,
asserting the active-high reset causes the fans to run at full speed
during reset and leaves the keyboard non-functional afterwards.

---
Changes in v3:
- Rebased on next-20260921.
- Dropped the Romulus, Denali, and Surface Pro 12in patches following
  Konrad's feedback about GPIO 65 on Microsoft devices.
- Updated the CRD commit message with the observed effects of asserting
  the active-high EC reset: full-speed fans during reset and a
  non-functional keyboard afterwards.
- Link to v2: https://patch.msgid.link/20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com

Changes in v2:
- Rebased on next-20260831.
- Included fixes for all remaining hamoa/purwa devices this time.
- Link to v1: https://patch.msgid.link/20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Rajendra Nayak <quic_rjendra@quicinc.com>
To: Abel Vesa <abelvesa@kernel.org>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: Marc Zyngier <maz@kernel.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Konstantin Shabanov <mail@etehtsea.me>
To: Srinivas Kandagatla <srini@kernel.org>
To: Ettore Chimenti <ettore.chimenti@linaro.org>
To: Georg Gottleuber <ggo@tuxedocomputers.com>
To: Xilin Wu <wuxilin123@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Val Packett <val@packett.cool>
To: Laurentiu Tudor <laurentiu.tudor1@dell.com>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
To: Dale Whinham <daleyo@gmail.com>
To: Jérôme de Bretagne <jerome.debretagne@gmail.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <quic_kdybcio@quicinc.com>

---
Abel Vesa (13):
      arm64: dts: qcom: x1-crd: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1e001de-devkit: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1e78100-t14s: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1e80100-dell-xps13-9345: Mark the EC reset gpio as reserved
      arm64: dts: qcom: honor-magicbook-art-14: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1e80100-yoga-slim7x: Mark the EC reset gpio as reserved
      arm64: dts: qcom: medion-sprchrgd-14-s1: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1e80100-qcp: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1-asus-vivobook-s15: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1-asus-zenbook-a14: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1-dell-thena: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1-hp-omnibook-x14: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1p42100-thinkbook-16: Mark the EC reset gpio as reserved

 arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi           | 1 +
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi            | 1 +
 arch/arm64/boot/dts/qcom/x1-crd.dtsi                         | 1 +
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi                  | 1 +
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi             | 1 +
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts                 | 3 ++-
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi  | 1 +
 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts        | 1 +
 arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts | 3 ++-
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts     | 1 +
 arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts  | 1 +
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                    | 1 +
 arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts    | 1 +
 13 files changed, 15 insertions(+), 2 deletions(-)
---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-0bf57fbd24e7

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

