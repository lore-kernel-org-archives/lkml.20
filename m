Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D584CCDDD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250052; cv=none; b=lrk0Mii+e3KIFexJ9tUcMZYuyrFeaEQqFiaCF7EAnNtyw8y1EFw0LE4mUtr57wMp+pP6D92GGWocl6lxNYaYtBeTqK/YeIUJ48mLMbxq8mTnOdKHjONV4f+sJGQHnuUSrGjnT89MFyp7w+G6PsOjNdzszVI3bDQJYfO1J3cx+5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250052; c=relaxed/simple;
	bh=b+2ardxveMsnWj4o/RsEP2VSYMiRa2YAjaOSkYsrcMg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jwBqgkjO6Mo0gHoNKGvVGB4gg9c02gu2Juh6WFtPw1Z8fTMith0Cy2pt0pAM3SuO5VbKe75djnUTw7km0MqP73bPYAdPgS0Ecf1ZcYCAwslb7qNfnGPrIKcBS523zYDiWcwYviV2pzQXz+Rnbx5BJOkG3OAQQqZe8hWYK5wH/Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DzJZGrb3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=agItEyZK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DzJZGrb3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="agItEyZK"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179Fk32561923
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 08:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m70Zod04ICRCdjzQSFGP1J
	7d7ucr2LQUKCZ1g0ilD+U=; b=DzJZGrb33eIwe2dDdOuGA5hYdMazXCJiyckwZI
	Bj+SOZQ4agDkVNg7gn4RwKigmJoofDfbIvVCyXPt9qrMcEMeQCh0R8EUgr4OCjaO
	C0F56IKJTLgs/fBwGe2mZJXuu35t8z101Wgx0Hil6mr0r9XLEn2cc1xo92BNf8eQ
	VRoXhKq4Un5yEFVL7awvlOpSxx4Z4P+l4YwZdFFCWjhIRzMlvnhODKgUK04et+1X
	Ka7abotxhDL6FjLsUFHk/j9b2Ziam5vDYYejmzJg+PKR5IyibrJ7MGojIN7jYhjS
	3KpaZ0fWyNOzU+PIErYbpS2t6VoZrbkFdydSjK7BIkDO3S9g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdeg3b7ug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:07:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-938153538caso117697585a.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250049; x=1788854849; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m70Zod04ICRCdjzQSFGP1J7d7ucr2LQUKCZ1g0ilD+U=;
        b=agItEyZK0qzvIBux8yPcuAAVYACf7roxf2Bl9QUcfqjUvRFK4v2gVYjiEbEry2raf8
         959zyqCVI6EzdWDUnC2R38Lf88ijbKm1YUXEqPquFslbi0G5EJFTA0SIkrDEnRGHdpGh
         Qfq279rrBbUl/7Ejo/cUqUpNQ5ICHIh32VQXp9vr53zpGxr4Aiug/4IAFJB1BEIjl3p+
         zb7Wk1KyhMzkWzmP7i3ozfGxqOgv4KwFl1JjkfekilwYn3Spt94TelBiQj5+ETi3L0OW
         429hbADE6lQQZ35Nkx10aZN4Y88uS+Fu1dShQxlcRLmatZyWj4gglT6TfoI0ZUAAEYnk
         Qi7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250049; x=1788854849;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m70Zod04ICRCdjzQSFGP1J7d7ucr2LQUKCZ1g0ilD+U=;
        b=WM9BBVgiADkts/bEkOtf5euXCzcKlCkOuGXkzdun+ioI3z/OYcLNXC+yIgdtkFxvuU
         LAPiprw92CjxhTSQtrQm1dGfE7FClfCtCrN1EU9Cl5br7tO3VopR+uEgOviypQ297LnG
         qR69hL2n6A8luFOZ+fqoIAppLNPS8AjIyMHfqd8Ix4G4k8NnVMFi1Uc+V5YAuebSCQRg
         S3Fdzgp9KoGAmSI1HqQ6wOp/QCTl2iJw0590PoneiZ8WBXI5n/7IwK3ybPa7uqAKuyaZ
         POFPvvWCPWodOWyIbucL6DkwoYjY/g3+ZoXTcs4f0EfwU8UGCfZ8vIil6YIo7ZtxJU8b
         MKDw==
X-Forwarded-Encrypted: i=1; AHgh+RpMK7dRm+ML0v4jiAKMGE///vukL7sUjr0osbKbxcCFc3priQDCJFLWvIub5C6wCjy9ThReuPDPdr8u+Gg=@vger.kernel.org
X-Gm-Message-State: AFuF++mWqxhudRyF8x5DYM2ODg6V+FerVLmKSRiaPh5CtyoT4V5M9+sd
	CqJTJoTcuJUfa7rMBaBefrOpqzc3M0XBoyJAuitIU9//U2Dik589nlXSDXkiogd3U2Dk5rilUmX
	AwZDy6ylxEfypHlj2nwZx+HL0fUjulOYQ1QbccIsSAeFPb/NfPipvRT6OMQDIYHr55DU=
X-Gm-Gg: AR+sD110bhii1KHpmeYAY9IfhKmbkHNFbKDVItVHR2naJIu6/JCfKYvjS9J8fqTVJxv
	xXQ7lPTdv0V7r3uhewiErrAu/ZtXAHzFZHN3yHscfqufKDVLVDPHh2LpFR1oRdgLHBz5PXy7E8V
	cVULfM1vLjLUitDnCLJZ62CKrFXwRJSpy+JjBiN9x7mWqzgQwpVDIZY95G/M6rhUVCNViIskc2P
	FTBJuPLaiOheg8Et54IPxUGIgPw6NmKYxl+Ql8WXKBywkns9y1x6TKjuBHU48QLZKU7f4QrwWES
	qoxpNRYIWcZ5ZyqMFDve9E0RMRw//1eShTS4kOT/kQxSj0jTgE+e3fXSWJ5qnmxSVTKe54zqx27
	vruBcR4w7
X-Received: by 2002:a05:620a:a0cc:10b0:930:a26a:fb2a with SMTP id af79cd13be357-939137af782mr2808357585a.2.1788250046608;
        Tue, 01 Sep 2026 01:07:26 -0700 (PDT)
X-Received: by 2002:a05:620a:a0cc:10b0:930:a26a:fb2a with SMTP id af79cd13be357-939137af782mr2808352185a.2.1788250046047;
        Tue, 01 Sep 2026 01:07:26 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm3267776f8f.15.2026.09.01.01.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:07:24 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 00/16] arm64: dts: qcom: hamoa: Mark the EC reset gpio
 as reserved on all boards
Date: Tue, 01 Sep 2026 11:06:57 +0300
Message-Id: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKKHlmoC/5WOzQ6CMBCEX4X07JJSQYgn38Nw6M8WasRCFxoN4
 d0t+AReNjvJzDezMsLgkNg1W1nA6Mj5VxLilDHdy1eH4EzSTHBx4c25ADMTTNoP0MvBSwiYABE
 B9fHO0I3OA1e2qq0yosSaJdQY0Lr3UXNvf5oW9UA97+zd0TuaffgcO2Kx+/6sjAVwqFQKGWx0X
 dqbJ8qnRT5TcsjTYe22bV9ioQbw8QAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4476;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=b+2ardxveMsnWj4o/RsEP2VSYMiRa2YAjaOSkYsrcMg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqloeqsnyCY+MdHAPbs0lmlg6ZPSmPdiqstnJG5
 gpHBAb6zkqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapaHqgAKCRAbX0TJAJUV
 Vo/6EACOP/dlFTht1vBupYGXd2dhyti/8+jEH5Fq/Ue8iYTZjpJdbbbmJwBnG+1yqoKZm4+/lij
 /r4Y0pJ2ote5KJku1f7k0WICKeWp1XyoQs5HPVjtwfkdcxTK2GJtJDShFMLwy+Xgv9htBqDiyvx
 prCJyXX6CDca3uCCk5M3n+M/G5aet7Wz8zH0CN2Qqp2sX/JRz/lvXYFsaA0gfWtEKBAyuCfYx3Z
 W336YFn4NP4e4KXr4cP0jVG43Y0j1c0A2ZgvOqSvl7HcmDazWaLHbNgpMUV2oB7jhIsxBLO3nn0
 6fNxv7scsAuNkrr6ezy/g1cm7V5LbEta1IYkok9kumfmnCWI9sWlYYyB8wZikGpy55ceBtgCJJp
 EJvlGOcZWvvmFJCZcvcIx6s6itvVrGioXpLV5hWBH3vlPSbzaUtr+xObK2w0L6ePJSF6rJM1qvJ
 CtsImA6OfiSmhOYEzHktaky6rddNIU20v7AAZBweSz7Z3m8+uvJAmzgG/PXr8r2cvupos9Yc7kM
 7t7FAgt8hREqb3s/IP4djAypnOehKwE9vbKSUNR51zN3dDZjRiv7RKfcHjujhPqxpKqGOCPE6eX
 ePt6S2UOTCcjeVyyn+aiXSMt2B3XyEfsE0KMbovW1QHyjTWqAmqwC6832YxDc82txooAPTuUCpa
 LvNFL3Rk6STAqpA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfXz9+G7Bep1+9k
 asd/fHbk98magbMbUNIwV5BmwqqRughYaoTSxCR/rLa1hKL65fwiII9ds9pI9FneLW+GHZsV0EQ
 9kwiPi0nDFAgQ44rNsNcDKtUDlDUOb4I20/yVDvaA/n8sslCSHgJOLFoG6It0w0WY+vPogH6Df7
 y0PMaG1sDXCE8qZUdgTrZUfz0xUfkv7AqoWiiYJnCj532HbMfyUZYG6R4yvaWP++opNduEw2ZAq
 BOF0Pbsda3odrMFTQJSJGVp/ptyHEJkOhGQUDzDItPzcw4Y2dQUxw0++O4pkcwW6SqUGfISvlhs
 /ZzUZq9S5YiFNUU05/zbjOEktLHm5Edu2ihVWUCVTrSRFQekV8aAG5J7cBfM2KfjvKE4Pt/MGlW
 DCC5xig4utRmX6MaxolFOZq0MspRZymus8fcrXrQt4eQL/+JPCdRQQ6k0lUG3z+qVE/B59cfKRg
 v8vGFklUZWEuzrn0UFw==
X-Proofpoint-GUID: KLmfHLG1Gv5Z_zdXJLDkDYtkmpt1qjpV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX6l9I5yjVkgZs
 YVNtoiNcGsBZIc/H1jQhUDjsU0FUuahXEDbBE+SrxAXpFZ4ulyfpOK+vMXS4E6cveyW/GpSTxpn
 ln/6vTRPDGq6MlVJpoSgd9RDLL6Pgxw=
X-Authority-Analysis: v=2.4 cv=NZnWEWD4 c=1 sm=1 tr=0 ts=6a9687c1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=yDUiu3_GAAAA:8 a=iLNU1ar6AAAA:8
 a=gxl3bz0cAAAA:8 a=X9uYJ1hcyrHnrYopOo0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22 a=gafEeHOdjwYkg5oUpzAY:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: KLmfHLG1Gv5Z_zdXJLDkDYtkmpt1qjpV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010071

GPIO 65 is confirmed to be connected to the EC reset line on the CRD,
QCP, XPS 13, and T14s. The same wiring pattern appears to be shared by
the remaining Hamoa and Purwa boards, so reserve it on all of them.

This prevents Linux from toggling a line that can leave some devices
unable to power on until their battery is disconnected.

---
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
Abel Vesa (16):
      arm64: dts: qcom: x1-crd: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1e001de-devkit: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1e78100-t14s: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1e80100-dell-xps13-9345: Mark the EC reset gpio as reserved
      arm64: dts: qcom: honor-magicbook-art-14: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1e80100-yoga-slim7x: Mark the EC reset gpio as reserved
      arm64: dts: qcom: medion-sprchrgd-14-s1: Mark the EC reset gpio as reserved
      arm64: dts: qcom: microsoft-romulus: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1e80100-qcp: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1-asus-vivobook-s15: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1-asus-zenbook-a14: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1-dell-thena: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1-hp-omnibook-x14: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1-microsoft-denali: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1p42100-thinkbook-16: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1p42100-microsoft-sp12in: Mark the EC reset gpio as reserved

 arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi           | 1 +
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi            | 1 +
 arch/arm64/boot/dts/qcom/x1-crd.dtsi                         | 1 +
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi                  | 1 +
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi             | 1 +
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi            | 1 +
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts                 | 3 ++-
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi  | 1 +
 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts        | 1 +
 arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts | 3 ++-
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts     | 1 +
 arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts  | 1 +
 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi     | 1 +
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                    | 1 +
 arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts    | 1 +
 arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts       | 3 ++-
 16 files changed, 19 insertions(+), 3 deletions(-)
---
base-commit: 89c07d98716a13454ec3fd9f97689e812cc71bd4
change-id: 20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-0bf57fbd24e7

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

