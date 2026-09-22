Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C854B522681
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063530; cv=none; b=n7B39lJB0MPiJ2CorRACBmVCQpFz/66v60cgIuyd894oieOe93psV5su3h63S1bZ8fnumK5iiV9i3h/ph5B5gRUJY7TQ7x8yRrF9m86rGhnFh0VanN7ghICLWnOJxujLwTv4jSHcn37duYIGLJXQ0WyaJ9nUB+SeMM8oFK5YzbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063530; c=relaxed/simple;
	bh=5MriEpSRKYNwPj9p19ge8q90xW4RsCO8w5i8Sb641cM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=inFeIUFlm5EVU5+ygkmNf6arRIcfjS4BS/90EXjyzQ1kXut/L52L7y+VzeLVg1DE9EBaVqTrV1/0xR+sLNSsdyeXAlwfObeY6bX8udtzdDph6dJybhYo4NnKj0WZu2mXzxmt/Npxjokj6R6dLayr9l975NEEoBMXmhuqwjkp/VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nns24d9a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UJ++p540; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nns24d9a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UJ++p540"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M71PDA2165616
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iTZNR9qzUixaW1S49AOyWbL3iItA6Icaji9iAug3A0A=; b=Nns24d9aGO6bmjnt
	v+AyDR0royMOA63wh1eOr6hYwB8okw2UIYHNzfsHJwOLiZTzEkHErG5T/UDZ2pg1
	W8i9N5MNhVtgMgjqOgh/1kGXukalvQurd48PKNLU7Olk/SfNe8paIqx1kd5SZOrl
	KdlGu9puhR34h1q5BHqNCENz3Hca3Ru3rXn1Gn6GjUN7OadZtHfV8hILkOFmOpiG
	M7Pep2yioZjUDFfIQp6a6fhqq1AYSmPvktBg3TgMRMCBZF/7wY6jvAxeWezMkYqf
	6a60mc8OykpxMvt67LGm2QNLvjNZBtCZ0tD7UEE3pMQhYmvXGq+rOaMzrLr+nvrD
	dUqmeg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xetw6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:51:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-530d206e2b4so81004921cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790063509; x=1790668309; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iTZNR9qzUixaW1S49AOyWbL3iItA6Icaji9iAug3A0A=;
        b=UJ++p540r8EkSrlCAnsA+ybNlRkOTyD09JFGMFUtPS/tjVSGNtr815VqK7fWOqO4Pe
         QTU3uwsWjSUpJfZwHrQ3sJyE1DLHVQnowk65gK42JVEBsHc5a+GQ8wdtaKmzWSYH6Kye
         035dtSeWlYLFI4Grf1u4q1BkWqL6sKmEpdhJlLhreJOq+ANrAeTnGArbmBuwAcs4+C6g
         m8E7FoZH8QAWtcP1x4xh7K6xDt97vswm4bzJe0+lNSf7QM5LRibRtd/DzZr/SulNYqhC
         K9+uylBVIKZMuBJ4VCNhU2KZyq1HZPaFXNLRglass85rUZqbVJpq/shUk/gLS+72OM9l
         /1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790063509; x=1790668309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iTZNR9qzUixaW1S49AOyWbL3iItA6Icaji9iAug3A0A=;
        b=a6qFmDeUuYygHKMOT0wEVlD3WUs3aVmnvY3ya6mUVpV0LDI+c16edyuMFk2rduj0VZ
         qwMJqrfmEm1AQPL43TcA/V4/wkeK3CaHxi2csKiwtTav4cP1KDJ2cPffSLXGwjUrg8TN
         qEY0Z7MIIl6s7pWp3vRHeVnAG08G451vSKnyKqNDdINQ4a6/nsVomXzjRqPyurzAeW85
         5hROOZk9Xm7IfmEQ13nm1lSUzTY04qn7rTBRIWJ/7dD2Ra8juYy7ZY6bDmcqu9Ie6JVY
         4iykm+BoEBoABj6n7pe2dsiAi6to4siOAei0DlsfhHPZXdRDZY0fL3+MuCmXNnQQcsjD
         UIzA==
X-Forwarded-Encrypted: i=1; AKwUvBxjhepQPxTnMi8IeU/rRueoRTUiH+kUdnpeWFi5ZIyL9m+oAcAX7RVwyYrsKB+cPWtYujjMwAlguN/35tg=@vger.kernel.org
X-Gm-Message-State: AFuF++mED50RJvE93LBgQtve6nokAIEu+wh1VCo429COPnYBNdhR635Q
	YL8WIbkkcaTTlpG0N/17IL9QjG9o2MWdDLriXtya/KKX0R4IL8RHq7zXfNKpi+0Hk2hlVABDaEw
	5YZEO1yBViu2KeiPgbbEMcWC/q5ADXUuWLxEOo9bD94OY4fGMJvzh9KpQJa952EJLazV9BBiV4H
	s=
X-Gm-Gg: AYBFou2zfDyZ3jadGB8KlyAsdScUUkHarFIucffoU8RrsaG0NtLVuXmGz/KG+MwzKNh
	RoA49lickcayiyCJ9AkmoNOt1Nv27ApZeZDPd2pspIct/xwytwllAfr1e7vMs1l8DxTeAJOxdg3
	IDMtHlClYQrJrM8aAWD1CgC5UzTyF42wb8npF6jjPJ6A3WCswhQqEpixBT1lKo2Ard1u8uaumuE
	uKH9ufQBIcc1DBR9VZHYEl92Xu7fA6JpAQLbHgNSA9CkRNdL0excreH4zYVkuYMuYOC7pSPZzu0
	wSxNbNNJ14hnnikti3AwZLIUR8bAbobFRmFKYatJjliy1oHc3eWD31IcdUivem2YyHzRaGxYahc
	6jtxTy9s/
X-Received: by 2002:a05:620a:628a:b0:93a:10f5:6a5b with SMTP id af79cd13be357-93c15e7bfaemr406534185a.45.1790063508743;
        Tue, 22 Sep 2026 00:51:48 -0700 (PDT)
X-Received: by 2002:a05:620a:628a:b0:93a:10f5:6a5b with SMTP id af79cd13be357-93c15e7bfaemr406530885a.45.1790063508202;
        Tue, 22 Sep 2026 00:51:48 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862789080sm3046925f8f.28.2026.09.22.00.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:51:47 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 10:51:18 +0300
Subject: [PATCH v3 09/13] arm64: dts: qcom: x1-asus-vivobook-s15: Mark the
 EC reset gpio as reserved
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-9-fde7f8a53382@oss.qualcomm.com>
References: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
In-Reply-To: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1051;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=5MriEpSRKYNwPj9p19ge8q90xW4RsCO8w5i8Sb641cM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqsjN69WU4K4ndx+6WUBfeaH+7a1/latgKQbAT8
 wTAKKz7vECJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarIzegAKCRAbX0TJAJUV
 Vr5bD/0YsNhk6SCbFmARtD/ylA3qisXz46/s+LxF4cgsXtvTTMKb4k1KqyV7TfuqIeGZxvx7erC
 XyD1Jps0ZgkgdRxKj56Kc+74sPCvi6VEw58bcIm0hqroz3mqcN2h5ZiNc4Ay9X+N890x8dkuFop
 hpB/an27Si6CsX6n3Q0P4RpBIidy66OXeksPtR06+8LOBkJDs30fvGImKQ9d278fotTj9tNwdxY
 dG3KLGpOCa7GtW1KTnGco5s/J2CStuJqDzYqMBsIHyCFugRFy9R+ym0N0R/H1pGPxyAtpgyB2s4
 KCi4bqfsnRwQ/UqavvivwtkY5T7J5MSxv/9NNDhGfpX+XJaNKwqvEwAMfrAMexNYRqRQzhR3p15
 86bl1hd7f8mTa7eMTujC0DJtKIwX21cRJfEzPi/54Ubw4vo2bvvw+EAp5Np3zrhMrkgRgMoZnov
 J80YhFYOVIVMLt+NGm6GeRdJj9Ln34VcHGTjK03/i+CjEc4r3q23OUqo8v0r7r2jRrk9U0i2HmB
 wUW3irutmJ0uVhlQYMsSVKwfHu2DtQXPYo9bqBbkJTuoEd7f0CU5Ru7nyA/z+JoZZYG+9XAYYM9
 0Q6+XmjFl9I6TCEF71JiBSW7Txe3LlWtb8Io1bDPh6qQp+sq5H1X6y1xUpPim8y1dKUJBBhp5jz
 HGQyAO0K3QMMtdA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: kT2zGY-x_1Mbl-RlVdtoYeeImaK55DSh
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab2339a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: kT2zGY-x_1Mbl-RlVdtoYeeImaK55DSh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfX5Wz+3Xw2TpLf
 q19aycXUiwjtg62DA6dTZ3TUsuBGNpD6t1YmedaayiZ9TNzOXZXFV/owEohBEoLr/K6wvROy8yz
 F2g8+o5kaB/0hm3iI7XQ2pn7hJY9PPdtNaUwnlbUzGh+RkXcNJwY7erTEu9PsFYOURMA3q2q+5k
 kPiWK21jSRKiKPF4jYXtG+YfUM1Bi+LuxqvsIFwivzAS6u5U1YEYD+nyZbRofsKRvHBs3MF8gFc
 AN5zwYwxaSez6nC3hrKaIQleILpdHuVv0p0dIOgvZa2O4xjJHXDYFE2Daha5hsgwFSBVMxofPlZ
 UBsREjWgE5UFu7Bs95QibjbjQyGGw6l1f+tNpd3ZyRfB+r+8DSh6LTn5etQDSizReVl5cSsNZs6
 eMuX2szp1SQnuglJGyjT+dQB6nqMemgIZpg9nTpmC/kD/IseAyWf+k3BCLNrzvl+tykEDk5ujcK
 Guvfiaoetd5cIn81rLg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfX5c3mjP7BFXb9
 USzlaJgNtbYZ8cJCbUpVqH+qQEqR6aSLe75wV/JlxVWHgi8PYm2Ujp47/6g6BVGcJFhbzm1JLPC
 Nb9fJR/xixz1YU9y1H57xSPuDxBF4FU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220111

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: d0e2f8f62dff ("arm64: dts: qcom: Add device tree for ASUS Vivobook S 15")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi
index 6bf12d8f0431..7ef682e928f9 100644
--- a/arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi
@@ -1060,6 +1060,7 @@ &tcsr {
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <238 1>; /* UFS Reset */
 
 	edp_reg_en: edp-reg-en-state {

-- 
2.54.0

