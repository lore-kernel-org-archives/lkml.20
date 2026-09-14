Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16E03921F1
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369306; cv=none; b=uuYN48c3ALDhzAzn+EM1wJXMiDtUEXMI/yKOybomdvILeWbEJPx4RWunDyOmHuOCRRF+z5fcDq8ikI30837esad6gFC8fgCUah0D8wVHt/X88zQXRDfSqHjlQSWveOoC2UX5qIWlUwMSZpof5mFVUZOsa5oBZyivV0zL3cP166E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369306; c=relaxed/simple;
	bh=w/b734DotcB8eJ+zd/qBpZneLKAt0Ak16IfGEt4XOKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m0KS9b3i4v/+6B3/Kc2Ypv+Gz95bXosB043ibEnvVu7dVIVwVFhomYItUBKM5DqKBcfkHqjPwyMbR33emQ19s4pbaDitY3MRDk/a7doGlBQbzcBLZEEzrF2zCePT8GdQzgYAdZ8/+aKuULaUYFaHQzq/vjpTHMPVmXU6Mf90Qek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ckUqmnXu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c02dym8v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ckUqmnXu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c02dym8v"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5io323901205
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L05TeUNOOM/WZlMhLZn/mArMdUboXYxvkhmrN6xwMLY=; b=ckUqmnXuoq0xWzrq
	IdXqsBpQ1A7+tFRJ08kfahA7CLTUA+yi9Q8yybHawiAV6hPGrxJjjoLgYyk26Urq
	TSUUsqNPAoO7PaN1d5nEfy7u7Z54964E+a5yN/aUygiUVJ0+Z1djh61tk4LkBKVP
	O+68+RePOv2WMdVFAzMzt9bXXlnEXFRymLUDCrqYFXC8FOjWxfOt59cEVPYK9gnh
	6fDZt9w9OHQgZ99AWsUdFJrfiFT9OAy6AnpWcaoaQX2HNn+8VbzUtMYbCJ+6GT/f
	j0l5Cb08AjGSuuNYXAJ+plpfAoZHG9LexP92JW121XzsYgY9Wc1FgJtD8cJuYJo/
	4KQi5g==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d5d7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:01:44 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-44899f99756so4582311fac.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369303; x=1789974103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L05TeUNOOM/WZlMhLZn/mArMdUboXYxvkhmrN6xwMLY=;
        b=c02dym8vmbIymFI4NbmqBIiQQ3vF6oNn0mWH9wvL5KfQ87PkcCcvM40CHxyuE/7HdC
         PYEEKXw2pMTps26kBNPWbgbti5eZ7eyescTBb3anm0vY02Ie/6IhHmwDFf2ScTfkZBpQ
         Ih8tqbPyXoxRy8I0ynaUba9WcZwrpeufA6W1nEkUw/7+POaiXdSoDwKojS11GJM3eHNV
         B+ZbIUNVQOmVvdFKaUvHPMnDFdqMLgmNs0YCF0+Pn2XuGZHMJfcykTniSM7G8Ncwh1s1
         XotCIxVW9nCztmI4OVbwfIdaBqaezNIbce96v83UP2dzhqkFtTyWqDEIc+JbeY7pM1Mo
         LQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369303; x=1789974103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L05TeUNOOM/WZlMhLZn/mArMdUboXYxvkhmrN6xwMLY=;
        b=TTtx2DjwD+Z6R3IfaA834Pb6LIxilhYCyukBtOKMJBSAklqGIRgFcEsOXnMr5G4kpW
         chfwyGBXiAdyCNDbwy1Uq089zO/sEL1YkL568YU9k/tIa296vDqVNP+3pa8B9I4hJoM1
         KX4yd1I8RAxwrl7duAi760hNCSW9M7YiK5KxDPZ4bm+iNdSq8gxrg2zi6ubMuzdWlnC9
         WtNBmIA+LSDGjplRmniETZI+VG5uEOLF2Cesn6VFNGPW0wPjMxwc6FACnIrNevNEWDEq
         ebO9+HpDB8s6XAfK5EBLlDFCgVzQT+O5+wt5eSXbC0vcwpCCPtiZF48FaJ9ndqfsXjPz
         Z64Q==
X-Forwarded-Encrypted: i=1; AKwUvByLH3U1Y/uKTiCZJiIuSJT+z+NcF3brq9k1E5wQZJDxN6IZlaxDpFKna6oTLXP3aEm4TIBAEaWwJR716RA=@vger.kernel.org
X-Gm-Message-State: AFuF++n+qeQvL3r+vBJVlz4axpcTwYTwRcgkrop6Zck4BCe/VoG5efvV
	zuqyY+zEMjCRorobTOhxIfQyKsXnFe+GT1SrKrTnOd6L1QGiwarlonAcvkbHomsmwRzXjTCfLIM
	KxQYBxhsZfmRXJRDAdMowun1Kt46rRYlhUZVLBYA/lQTAy3aBLC7qXNWh+7yP3N5coYg=
X-Gm-Gg: AYBFou2Df9NtExqt+lF2Kl6JyshSPNp5mqu+0rZEf/UJbibjmSzaeabcl9LR99F7D1Q
	51471O8UyK7T320WKWy0bJSnG9RKwnD1TUPyx6U1smjEIT+McI0n3Lpl/O9oyafXqKhFS9i8YrU
	eiyUlJ8y+OYaTST4PMYrQvRODxWp7Vq9KS251qRe1uLcXXLpwCq13KYG0cNGnVaHWRSent3a9Dt
	MNgbAGz2MFIWj2lZjiHarNObAoFdppgHZH/kEhU64l8/zUCdzv+8JcFCVnrEOKv4f4A1pbnrwD3
	RWZ3iVErnXvGANB1n4uNJlGlG/DXYB1B2nVmXWzzpjno7AD7lhTKfCmy0KbjFpN8AqnOJhj6lxE
	8Vt9JvVqMARVJUeJ/Aq6zi535/0NC
X-Received: by 2002:a05:6871:2b06:b0:475:e235:905 with SMTP id 586e51a60fabf-481fa35c94bmr645213fac.35.1789369302960;
        Mon, 14 Sep 2026 00:01:42 -0700 (PDT)
X-Received: by 2002:a05:6871:2b06:b0:475:e235:905 with SMTP id 586e51a60fabf-481fa35c94bmr645167fac.35.1789369302570;
        Mon, 14 Sep 2026 00:01:42 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:01:42 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:55 +0530
Subject: [PATCH 23/31] arm64: dts: qcom: msm8916: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-23-660c31187819@oss.qualcomm.com>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=1489;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=w/b734DotcB8eJ+zd/qBpZneLKAt0Ak16IfGEt4XOKE=;
 b=Z7i1zGwGgXwp547HldAafpO4c8NsnpYQizqQevLpZMjLISWO9vwtBy213CGUp84oeCgWo1B+I
 zy+Osim+KwpDmd6/vgapJvx1UiSw8W2z/ITyY7i54U5EGqWBpGHpRJD
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfXzjalN5S1MRTA
 wCFn0nIWjqHmsy4qXOWl3bLTvpn3zd9vPS4vnGa3qE8ZgLUfs78gnv49wPS6xIHkjqNOu/m3/im
 1kStb7KvHUeYlrls0S4w14HeiRVR9oI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX9fX2puQWxKNN
 RIcrUSSfAK6SN10EpTRnogMNLNEorgRtn4ZrtRUWb6yzkPG9NM8w0JMUrAT9TiLf5btrevilRqo
 YkKbJFvmzDeRcVaiqWUwtdBiWGJNkPzHFOP9pV9TA/gMRRnMA5mmema6AnK1IPySs//WcwJunhH
 eXtm6TgJb1jx9Nlzs9+likq5I80Yw8XBsQ81Ot6MDjmH+zeZE9653rqIVFl4wX42BSmU8yKs42f
 HavMIqjNPzLJFOMjrjaU5SwV5TBh2LxqYAomgm6TnN9cpj5loTDrvII4mC1VN1K75aA6ZfuKUcL
 apcBUTNlTTKyi6Eo+hv1JFhzbLnnsmI27TaPUXj/sOyfRZLcrD7GZn1Gdkh5fzTuz14KSjBunem
 EsgqAHF+/mz80ZzaNyqa9nsHdOtewoWS+DgoDhs5S4Uco7cdPdIjA5CK32VLFktnuDN5QRJJdiu
 8Tg5Fb8ASZZp17B1zig==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa79bd8 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=G1H7ZIpW-Owx5wkvfsYA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-ORIG-GUID: xUth9Jlo-359U0_I7v4nsNsTrAXIcg-j
X-Proofpoint-GUID: xUth9Jlo-359U0_I7v4nsNsTrAXIcg-j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

While at it, update CPU idle state names to match the low power modes
they describe.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index e39743e22043..89b78e96bf49 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -205,7 +205,7 @@ idle-states {
 
 			cpu_sleep_0: cpu-sleep-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "standalone-power-collapse";
+				idle-state-name = "cpu-pc";
 				arm,psci-suspend-param = <0x40000002>;
 				entry-latency-us = <130>;
 				exit-latency-us = <150>;
@@ -218,6 +218,7 @@ domain-idle-states {
 
 			cluster_ret: cluster-retention {
 				compatible = "domain-idle-state";
+				idle-state-name = "l2-gdhs";
 				arm,psci-suspend-param = <0x41000012>;
 				entry-latency-us = <500>;
 				exit-latency-us = <500>;
@@ -226,6 +227,7 @@ cluster_ret: cluster-retention {
 
 			cluster_pwrdn: cluster-gdhs {
 				compatible = "domain-idle-state";
+				idle-state-name = "l2-pc";
 				arm,psci-suspend-param = <0x41000032>;
 				entry-latency-us = <2000>;
 				exit-latency-us = <2000>;

-- 
2.43.0

