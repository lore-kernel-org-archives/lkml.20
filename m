Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521E1522F0C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063506; cv=none; b=lU+RsOB6ouBJeHq2DPodzBQ/2/0G5yyOYZuQRy+uTuacY3BPKwuiu89cuMwgOGUhtFIDLgsxiMmZmuqOIuzHLLU07XqLr8SoiTNpzURKACgqvUSt8qNai5cSjRBJD36gHi69VaoE2Tygm1PS9Hp61UwJX6jKAfOYF5J8w05IWnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063506; c=relaxed/simple;
	bh=EQgqstv9o5vUPvoyrR7USbB+8WZL00cqFkFyvb3/MfA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BvE9ocen/Vzfc7yoPSpyYbsejzMxTnZh+D5+Pojnt/Ji5b/IvmPMC6cvk4VvD5OJgRcx4e8QtHtWGJhBSD0a7eHWRVPmMptgHAVgXZvSLQja1AayeuDDBGht/q3kptsmVj3V6t4pmWyod7n4PFt/5EEpBAegBpdsUbVh4Q5AeHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bMZPqB8X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JlDI7LV0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bMZPqB8X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JlDI7LV0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M6we622165590
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:51:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+CIh4tIaFqUrLEgvjrXOO+YyulO4/MZfSeRcQ+J120g=; b=bMZPqB8XLcv09FSi
	kHF2qghA+rqaYbqRamvdRWkzR5fQO0I4QcrN1MvO4QTSv7wwybilgiInLRUaNSSx
	dIT4/z3gpM/uLm44Pra0gInjcWJtqPLtLjnUALnk//Zq+CibB+f5OO/ezkAR2a9w
	jn4zKO6jZJrvf8Zsdb86qfTfkWIOd3kbRC3jT6uB9ZYgAePZATUpb1Tbbvu914Dg
	hfWly3oZK/C2pyTI1hiACmIFAVi2J+HK8WNAACZnezeX8M5LngS/xhQF8e9wcgjO
	LalZS+JjWBdMAFozFC7B8viQcnYCSctviFFHyYmCzK9d+LOjXrO0zbBO0SDY4fNl
	FxOHmQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xetw4b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:51:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939f3426a7cso749476385a.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790063496; x=1790668296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+CIh4tIaFqUrLEgvjrXOO+YyulO4/MZfSeRcQ+J120g=;
        b=JlDI7LV0k7QvhLhdI5KOl3J+R1Rbx0o2bGPk5B2NDgfgFis/QgYJ4pQ5q0Rzl8KGPe
         Z9pJ6+7JrYXgqynMh7QxAD+Uacfxqz3QTyqEVxq5xmSkn3gN5HIp8VrqNHXUfE4aP/R5
         yez9WaPmf5+QF7su/skYcwvT44Xn7w1VRDvW32mX4DgKMflU0T/PV6xDG5VDLsDZi1YU
         3+btVme3gbHutFsRXCHZhCbVrqnZ9a/xFDaYyaUkQUueNcIhebo0l9SRzayWqjYvUNoT
         5NzP4qsonlDmKQKTCReYYXWlQJHmhQ8Zz/SMDBgO/+MMHrllMwes1t3bkLt+YM+HzmEw
         ZAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790063496; x=1790668296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+CIh4tIaFqUrLEgvjrXOO+YyulO4/MZfSeRcQ+J120g=;
        b=FHxOsthBFu9IO5NjMV0uAvV1BetdAqKuANg0S9vDDZRheKP8cEzq3b5tMN/chYu4C8
         gw+01oU8zhDxDPNWotHA72chOB1ST58W5FmNSeipdZLvyfsQOsS+SINwBikoX5T3gxFK
         5+E/dnhkJWlaoLQFxGEkyzFVtEi0Qb+fOFXj9EZQRD7DvP1VnCRN6/ES3SeNkGPiiGWZ
         2Gzu6Xwhuv5z/OsaSCzbRdgucOFTjrXGZ/JrPVcVRYfx9hdKGbyWAnjvKgTk8kZpTH+n
         fvXdiM25LpnWlpagUa/FRaTQo1m64qw+NaoRlM4vPllc3EnNziQ0/9cKvPEmgZsnWoPC
         D1Wg==
X-Forwarded-Encrypted: i=1; AKwUvBysQfLznSj5C6nUsvexkBdd6PT3RERxHOrUZMSM2lvieVwIjR8Nyb41l+5u+AvsA4tl3K+m21nZuREDpWU=@vger.kernel.org
X-Gm-Message-State: AFuF++nh6jq5wTb2Awg5sYS+6FgR8M60ncZEVTHldoGNZbzMXmSG8hvM
	WjTYI+k3S5ANxNtySz0i6UDpRtk3khYjpW6pfBZmX3E95B4gL+EwxEnkVyh8xGhAYmbeWNTlOb8
	CghXQt9SjMxDwIiVY3VwwPNSZBt8S0XgzUq+DtJ95bL8lQAKUTqLdZkYII3SWOKwUJyc=
X-Gm-Gg: AYBFou0AuCnue3qY9DxuNxBHlv+TnDbD3cbWmLL/YnK30uojwtN/zumVeY/gye1DAQV
	vYGsKjPREQ+jwg8/+OzZJv8tOumORSOlyL0uk6qggC1UMVroUsHSCU/fCyrGnVbPKWF73AeXLDO
	wTGHZOnAVJ8P55gMQQ3IPNqZzs1xhWXROLDQzE6JvwyEIOjthrOsVX3KgHCDcEuKfO90qXDTKgI
	CWxkUJWnDUzRw05ri5if45tWHfcy3/1pT56nel3n0DyDvguXXF9Bnnk9/cAvceXDeYkhFkUJ4cL
	S5aS/ukkhGweYzYxq1ma7Gp7EY/HR0mOptLibjCeoku+avDRSz5/bU/7ltxH9oPMY6WJ1P6BNWk
	b6cjmWt1G
X-Received: by 2002:a05:620a:2949:b0:93b:d7a0:d9dd with SMTP id af79cd13be357-93c19a67345mr236497785a.55.1790063496250;
        Tue, 22 Sep 2026 00:51:36 -0700 (PDT)
X-Received: by 2002:a05:620a:2949:b0:93b:d7a0:d9dd with SMTP id af79cd13be357-93c19a67345mr236495285a.55.1790063495756;
        Tue, 22 Sep 2026 00:51:35 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862789080sm3046925f8f.28.2026.09.22.00.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:51:35 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 10:51:12 +0300
Subject: [PATCH v3 03/13] arm64: dts: qcom: x1e78100-t14s: Mark the EC
 reset gpio as reserved
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-3-fde7f8a53382@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=EQgqstv9o5vUPvoyrR7USbB+8WZL00cqFkFyvb3/MfA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqsjN0DO2HECJJrAYgNrLEuaFtDNg83a2Q8UDwO
 6bvfn1xu5qJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarIzdAAKCRAbX0TJAJUV
 VkpDEACB3pGE5ImWDk6cbxKS8+QqqyBQTsxJLavY1womKY6fhp7+PX6D+s/0PF1zX2F53B+3KPD
 yw/9EpA1imRupW+o0qSV1w+bdSitNOnqTWtmXD3WfhHE501uS+0W+lO4S4tK0Vi7fLWKKQdVefO
 jq3VeVt78QsMLvr9ZbnP4jj8YwerXADV2LtRQ/dtYMYah0rmcXD2tETUt0a8mTfyvAlTW16cRRV
 WJjowQpvbg0rbdmr4z+w7kXjILeObgExSYHjGPx3C3CQfErRrYOBHaqo6VQkBepG73MANsP8cCu
 Qb5aZ9NcT+z3gJHwiReUnTNJWb9rmSLNoDe+HHpDfUmDA8qVuLKssKjMn0GH9LqXYH8XvH/HNwH
 +LNCklMmGwrjDznzUz0doXIqTm7yAjE7zPwh6BasmtuKyfKqquY0i/TayfQc+CEDjnu0sDIXz1k
 L9u/6md+iqT60btemaFp2G+lQeX8WYY3SbVxSlZsyvVKBz4QuDQp/tJb3jpTSclc7KDuhMK1Kr6
 EmX5HXmqqoTSR8rqMlHqw4Sgx3uJrdqdpArcdf/7VLK+/HQb42G3aZzsBAm9FR6lNuhDSyrmxCO
 Zwu1oHfkF5FFVsH+H1Ufi4UEDZq9vup0wxznE60nHu3DrnUYGRgsfyOIb4/HoJ79cDs+CMt5Vge
 b3KdoxHQtd86Ezg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: faiGnAAvCdLa4t2hQrKB5QeRcc1AJgLm
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab23389 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: faiGnAAvCdLa4t2hQrKB5QeRcc1AJgLm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfX37ybQvJUvk6X
 Z+eGeyor3hhhJ8HnkkWBpSP2E61VPx/y0SFg5tG0vWrMpCxuh/tbcJJYf7uyAbvWw1Kmhby+i7f
 Z4JVBhl92KXExxEsCvJg0Rlfs5Vn73bwuid5uw7yzIbD8IpmyUrsOWG5lErOgpXN8+o+f/CEkTF
 gWmo0UbIySH23idhLzETKIK+yZq07Um0k3a/wAVYV0whY4Ugzlo3NsqMknfUBUheNo85iBD/xmz
 o1/EYCR+34OEB4t9OBA6q/PIhkRzDYF2v0yHB19o6NRcg8e/mGPTr3881TDmMJxsHiJyQ2nPYoC
 oyHoUOYrrJzV1gkgHjJWL5AaQwdeunsccTGU2Ov7DDN+gMtQlAMmEw1/ls7ZMdrI+QMItaQMAbQ
 kgpf43o6Y/TR0/Ei335e4GPQ7et14ZxP37P+ZAKzFZel5TF6H8HxAWmQZuvYPo7LC8r5O96wpCX
 Iw8BPR/M5bZQF36vBpg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfX6D1ZMAQ7gdJ+
 aJ33gkEtI+1Lp9u1D3ZxJclxraSdWDsnWy4kdDcjl4Z0WW4wUjNpUsrR/KREno+2/ykNIOswKMR
 AnNIcxzE8KPmfzLbwHvA9CPZk8h76j8=
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

Fixes: 7d1cbe2f4985 ("arm64: dts: qcom: Add X1E78100 ThinkPad T14s Gen 6")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 75ad74bcb042..93c7e3a02041 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -1406,6 +1406,7 @@ &tcsr {
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <72 2>, /* Secure EC I2C connection (?) */
 			       <238 1>; /* UFS Reset */
 

-- 
2.54.0

