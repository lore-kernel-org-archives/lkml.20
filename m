Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45143BCD0A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788434559; cv=none; b=Oj5JLWJE4TlmbY8km66Bnb+3MdxGCG0ICVaj8DDTuOTkxI+plzb7DDv+JXotPaAc52HK+naQuHzDji/+NgkPRlyPZFr2D7jPYYdtGnfyMBo/LgsLLMKPfEaEoB2jDFN3//MjrHgEqH7Sr692ViIVN20xkGnwN4y04BuCvau5PO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788434559; c=relaxed/simple;
	bh=PZapi8obVNW5dwmJHh5jYWspydB7QgqalnExU6Kb124=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ew5CUQkp5ah9J7SNW5aOdK6jalVOynQn94DPwVTFsMCq3Cvyw+j0heaIL57fCsUy9K8WZqw6v14yTP9+B+MfYP+aPyuU/q61MxN+mV3ohMHSN4KVFNfBvzLrKcbFPKHTcTQC7aAAY8YXYpssJaNlk0rdivqJt3sGzGIyKyPP7CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NRQNMqHf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XDDwBf+F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NRQNMqHf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XDDwBf+F"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHBqn162775
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 11:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GA6ptIiaRPy12HrgsVTsXS
	YcvjB7F8/6vwFnAwwMsqg=; b=NRQNMqHf0oRtxDyWbWgDEvf24ZENSbV0EYG6is
	7bihJRUJIluhG5MmwcBzYyd14jmSieg5HpwRIlE7fb59m/SQ5nTxsPtuzcUuU+EE
	MzYehIklxKK1HUAwTTpYsT0ES0HVM4vWt9jxJ6/MfNXT24U5oH1+ruO0K/7QTJ4j
	0+iMel1IQ64E+HbPisOzpHGbFDSoCAxu37ytnurCfc7PpEAGPg4b3hD97u7klh1g
	DtRSNIKurq8484eut42QebCg/nPVQgOXjIlW61995LJvj5drzlwvtuFvevovNQXi
	kx+3y1KyFMKqXy4yDwj6n466Ajcr2fujBLpco0SvBKO0dilQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6tx098x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 11:22:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9382f9430deso418923085a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 04:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788434556; x=1789039356; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GA6ptIiaRPy12HrgsVTsXSYcvjB7F8/6vwFnAwwMsqg=;
        b=XDDwBf+FlCT9MCirO13Lj9WxswHwTknZduYM52c6KwkH9W4vje6bccqgqp84KVR3QN
         +KoR/gN0ZD4Q9ErInz6DJQSzTKLDmGCV33cMddxGNYy47uj4a8IEGnWbViq9dvMDFleZ
         p0ylfwPYpl2QdZSek2/AMBYESn6oTdL5Y5TPmc2bbBbsc3Phg0QKZLDVjwxKcGpGm9tA
         uJm0MS2VkL05BSnUVeNpMyI5Ojgp+JesIYjFgY9e76MYfWtJUZGM5nqYumotCgZl3CNO
         j/ZZLIY1n63jHL7XRi+270NMxI7zvvcyS5pQ3bms/OTXBYeljlOpsTnkj0KpDvIc57rN
         z/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788434556; x=1789039356;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GA6ptIiaRPy12HrgsVTsXSYcvjB7F8/6vwFnAwwMsqg=;
        b=fhUIhXwCxAxi61UILjvoN4CAZTqIswaA5oHp2EzFGmWvhKQWxIC5t4wGrTMdmlp9HE
         Axt3OWXvJHUVHh9U8RXFFmTaNbhxEfi1fpiNiRupB4WcVxuMB0rBTwaNcBT+XNXVmhut
         NkpzxOvCwkYkszVrnb4dJ+cBWc1e+HPCXEXG1C9Ip5xNSf08J99nj9xfYUdFnq+wOWm/
         5dGocxKjpBoz0PNj+eGlWYfqb+XZZUMs0cpvUxz2op0XV22PixNISkgUxvqzQSPNQElv
         8kiIKIw5iz219R3CDDB4ZXkk43zirdUK1VHZiSfUbEWeoAczJBs+wUGi5m3dwM8dgZvA
         g6wQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjiEJW8zE7xocflXdkE+Y5j+DO3eQWv1DSQwA82g+3aLMjk6cyqx+ITBQEDt2SgNQ1JD7bnX04Q4Vv7+c=@vger.kernel.org
X-Gm-Message-State: AFuF++kbNBJFL6TuP+oE8Skhong8/cIRATVYlo8ybtuTKQIlQQkijq9d
	oyXS4uLokg4m6I0AKsCzS7AgFAoMMyp4MEuuqnR7OZpwJRIr52kznhRMDTVDaAhuO3wE3r93x0X
	EA29CiDXl5NcozR2HpIYvC3LXjZYhMwSDbAK3L8eZGrYqduXfeZ2FJ6QlcUCZoSN/PXY=
X-Gm-Gg: AYBFou1eKV+M3ZnvOfhcWyH89sx4xys64+zJnjLTfGKNU3+USof1zW4LSlUSOnsioL2
	heNfPetfm2EC/0S/UGw8AL8YcfrKfZbU49rcvKSA2Nd3zoHGsdopgphG/WRrZ7ysnAMISbSu5wo
	hlzIOi14U5uXW87F9Rl0GHacsZNlkCjb0NT9k9YEqbyU15sEkYqlSCftdzxgngY1LEplZuRDW/d
	ZvyNgl0I4i+a6824n9T+75hFlLfmv53QnnJYGx7fJ/EiL0yJp9ssXIB/RklCjw3OvDdEUArlodh
	+CKsZprgd+bQa1tki005L+4zprxcKWHL8WmGi4MKMKaUwCBP8HekGJI1EEAQiL2ADBb6RGpgJp6
	aaeIguQ==
X-Received: by 2002:a05:620a:29d0:b0:939:78c0:a496 with SMTP id af79cd13be357-93978c0f4bcmr148521285a.38.1788434556013;
        Thu, 03 Sep 2026 04:22:36 -0700 (PDT)
X-Received: by 2002:a05:620a:29d0:b0:939:78c0:a496 with SMTP id af79cd13be357-93978c0f4bcmr148515285a.38.1788434555458;
        Thu, 03 Sep 2026 04:22:35 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eeabbfsm12529991f8f.31.2026.09.03.04.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 04:22:34 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 14:22:25 +0300
Subject: [PATCH] arm64: dts: qcom: eliza-mtp: Add support for SD card
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-dts-qcom-eliza-mtp-add-sd-card-support-v1-1-25c906b12707@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHBYmWoC/yXNQQ6CMBCF4auQWTtJCxGjVzEuynTQMUJrpxAj4
 e4WWb18m/8toJyEFS7VAolnUQljgT1UQA833hnFF0Nt6tacTYM+K74pDMgv+TocckTnPapHcqn
 sFGNIGS2dmp6sO5q2gxKLiXv5/I+ut906dU+mvNVhXX8782JAigAAAA==
X-Change-ID: 20260903-dts-qcom-eliza-mtp-add-sd-card-support-1c73fc1a506b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1400;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=PZapi8obVNW5dwmJHh5jYWspydB7QgqalnExU6Kb124=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqmVh4RTsEILVDAJ90R4JBxV2+jjEDHGdXDBXhy
 0KZgFhY/JaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaplYeAAKCRAbX0TJAJUV
 Vr+/D/9jK8nW+pu7huBOL/zxbahkrW8oO+ufFZQL/jV7UspB3kidny5P4739FjPPDog/LqvhWwQ
 +l/zzTQT0gteibFShoxmEmp1wo1EALjB1wOS337TPOv6wpKOOKIi8RwJeQwfufCELsUsKeN/u2q
 Dl/8jQUqIEhX6OicRyzzFvRSoch+9v6h9Oyb6sXVMGHtjf47Sq5UkxlTgPnlwnLP4Pu3V6rh5Yo
 phOVihoGKmYS8CyXlQxOm7xIhqbYhOTEp00IoSX5hQCTRFqOQXvRPEJBSOsg5t+nVAdx2yFmDtR
 axDs+ZOC8pC4fqeWbrn96jvLEO1NJiSFBF8fKP2KvZ+DOJ4Z6hmfMYHh/D2wNF4VwdCd4fvFj2u
 eg09iTWWUYgKt0AhisO24gOFAG/SNjGgom/QzYNIjxmAr2qwrZgxwHCUJBys6EdsE8emm9HBO98
 repeNaWSlcCGsjwJHbOAyQ/xsbX6tXLZN1bPWM45JVB9jsuDPVrbjjcQQL9slIzKzQLr66hn0rR
 rA64CKb0HmHLBEPLX/mGrm2ynue89moBqrQrpyvK5+CDYFOvqK7YqjIQBtAQ0ZE9DtaQ4qH7RCy
 q8v4b0cxu6rna6Mx6uleMi8wKr0PKIJxFc1sRVVCpg01/7uqtTm/rfdUqBTa4oeuQR+2axmGo90
 ttocgARwE329a2g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: jZiE20dRGu-x_HSd2nYQ39-Cj_ezFZuS
X-Authority-Analysis: v=2.4 cv=TqjWQjXh c=1 sm=1 tr=0 ts=6a99587c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Cnn_6jVlNAuXgEeX9hwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: jZiE20dRGu-x_HSd2nYQ39-Cj_ezFZuS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5OSBTYWx0ZWRfX3jV/Hq/xlxhV
 Lly+I0IoKP/A54AAKHltwj0BqZ9gBGjdpX69sk+Y9xorj6arDp+97ScOb4FIPyFh+k2RNNDkV45
 n+fO/yS7U7lWVsulbTqIZYL6F05uEJJ5EhRKDpbSYiwuTiqR/W8J8RxLvXokdpv4UxVMdNrwHfi
 Jak+otDTJq7UPoxFo2KKVt9G4zf6+AjRJ66YepX8Tr8lJe34Euk8xMCjRnP3nbVyNmhbLzLOooF
 qk9DVL1xnnWFPYQiWgHR0aOA+jrLdDT00o1RMsXHzr5bmAC9l50mhYOctr01jOBiNGUUU17ra2O
 W8oVRm4R9ihJT/1pw7CHfOBkS5CmGewm5j7fSOWUMstCXuTRrHrf4Q8vseSHx3si36kY7AJwnqW
 lizVy3RxB8BeHpK+cAAhrbrvoPasYGiax1I9z/grxeHry9sEraJcOSL+IuiKj+mCLHkvvT3RYZV
 Rg9JUxHmUeVynumJCHQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5OSBTYWx0ZWRfX6b1GOOjSW9n3
 QSAdWmrUIv9jzxKyjNKtgxriLHxia5gkon5Q9FO42ao7XVdj1ffPHCgvmRB67S4Hevje620CV28
 rdavlLPgTqeJ6Oi93f5JHRmSrW1zY9A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030099

The MTP comes with an SD card slot. So enable the second SD host
controller, describe the card detect GPIO and the board-specific supplies,
in order to provide support for the SD card.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index 9ce41ba4da55..266a6a526e63 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -492,6 +492,19 @@ &remoteproc_adsp {
 	status = "okay";
 };
 
+&sdhc_2 {
+	vmmc-supply = <&vreg_l13b>;
+	vqmmc-supply = <&vreg_l23b>;
+
+	cd-gpios = <&tlmm 58 GPIO_ACTIVE_LOW>;
+
+	pinctrl-0 = <&sdc2_default>, <&sd_cd>;
+	pinctrl-1 = <&sdc2_sleep>, <&sd_cd>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
 &spi8 {
 	status = "okay";
 
@@ -542,6 +555,12 @@ mdp_vsync: mdp-vsync-state {
 		bias-pull-down;
 	};
 
+	sd_cd: sd-cd-state {
+		pins = "gpio58";
+		function = "gpio";
+		bias-pull-up;
+	};
+
 	ts_irq: ts-irq-state {
 		pins = "gpio13";
 		function = "gpio";

---
base-commit: 32b6ef9a5d0eca44f9cd91f52f4faa89f145a0de
change-id: 20260903-dts-qcom-eliza-mtp-add-sd-card-support-1c73fc1a506b

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

