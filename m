Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747122E736F
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 12:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788611277; cv=none; b=D40SZ+bxZstRlWMVVpvfiPd2qPVGpmaUgmR5+Ric0GXV/AhiEu+UQ9TGfXKSfOFEB9MYaFTmVSKL7g+Q3cWCi25kfWt6kSvsA2UrDBCRDQslOKpj/MQiHUN7N1RVzjIYwTiE0QV/5g5DPSpqQPoAG4FXmeDL9XPg4t58JW+HV4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788611277; c=relaxed/simple;
	bh=YS2PFBtPYDs63eo930+d89nki8D8vcJ6NjzJW80Rf6o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f1A/c8H2kqR3BacF0ZZX6+9NbGLK2z5vKuf8E0eeaAJ+W3TSxrPdOf3cY7grUsZ+XF4Lv8JtqRYeapOAutn5wfR+sc32Nmy7ttiHVQG8ERenn8nCO9s3Kiol5yVpYoiczcMbl+liIwEKfjiAfmHr+P8f5KlpbQ67ninLdUlBaF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GgV/L0oc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PMJkxOeH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GgV/L0oc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PMJkxOeH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 685BWBiG1710785
	for <linux-kernel@vger.kernel.org>; Sat, 5 Sep 2026 12:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=64Dm8Bs0yNx20mXVjg9RzuzASblCKGVYMw5
	l2uvS4q4=; b=GgV/L0ocVxL6qJqSA/3LD13V7j9Fy0OHydNntpaw02/LE1+jK9a
	PzccGEskt8dAbAxmhelaKfF4BYu65iTCmRtyt8uaal6MAYagKkAXF7BkjFJx2nKv
	jIJbnZLD6K3lztzpS8SwIvg/d0XfPVEazwJz50/9eeSol/nuS8G60rs5rLnwShv8
	bHhh++6VjWMKQuE7f5k6nDoPDJGPfWyVy6WjvHCkeYL9U5FrXRkjv7Q/jEyMkLG6
	p6VN0IUYKMwMJVmsOe09yY5cgq8K6Q22JCUXHVcSB/RZ7mP5wHSNoi6e3/WKrGYi
	kDFO0YnEMWjkGiQYCtpzuvqx4BkgpvKardg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggbuegwnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 12:27:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so321299585a.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 05:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788611274; x=1789216074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=64Dm8Bs0yNx20mXVjg9RzuzASblCKGVYMw5l2uvS4q4=;
        b=PMJkxOeHGB+N4nRr2qXdj9gF1Gv1s4VKvPi32/PLq4/UeaXV4ndE10vsAVlIfc1ZEU
         +/Bdgf6FexoCzNF6DBF6HNB5o2BSAsKTlMZaWSRl+iwMrRft7ZEuWlPFIYVgje1KxN4p
         PFn7CXuTpOq7Ng7KfvD40slmDVT2ERXFOBNFrYf3JQGPswW2/OhtKhUKYGYg9NwGA+Ta
         8qnh4XKm2sGYbRraQPEMsxfEXKVbHEiZZoVIy7cbi2uDMee/cmYp9mpGy1YuG2QYh+A+
         yjaw6mlpr1nj99PqjUkmv1xKpDmfftaQfyDOm3uGXy06srvhs1ngNi6TLACcWfACSUnm
         TCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788611274; x=1789216074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=64Dm8Bs0yNx20mXVjg9RzuzASblCKGVYMw5l2uvS4q4=;
        b=hHPGRzz4b8x3hT1CQ1Dt6Ilox6nBnRPnEU32O5f+R7WFaoJHXrE+ZjoMp1pmrHBRyv
         6NUy+37VXwUyxOTa5nSkCiAcvcXxwjoIioLqc19bZmi8gmAI9bOgsceBx0yIPYUOzrl0
         2pWaR4FICnbTLjQbAzJRSDIk/mSNzElZfPgam6lgjYD8N/9Rbrcr5a24A0ygQ/Jh1eKM
         20xw8tCKxdMEPMh6siwNeQjd93cQZa2netJEfmF3tSlMURJFDnZ+IraZT2PWmBZJzoNP
         D0sBtZYlLO8+koQwCbpteU2JwWrLpM//U7uM5XWivz8e727/mVicZlvHAnFGi6JciWEM
         Yz9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzur94GNM6VSdIXLKqYm3+F41+yMVF2jz7sY/1Valf5gRtex9LgcghjPrj3qI8VP75vF2i5GPTDyy+xgM4=@vger.kernel.org
X-Gm-Message-State: AFuF++lS36v7h7YG4+VOriUVOu2qP/3pD7g1pzEnydSeeXOor8NV/UZ0
	9FVb97cSr6nwmlyOAG/Q+s/2uG+p1HsxNCc92glPiZLOV9FVSc+fh2IEiXKmD3LaCSZnkDS1AM4
	9BfUBsrF861Xw9OxAFxmD+xZ/VbEpn8joaHYMM/JghL+pvuYWlU2AugZlrco5g91AuTs=
X-Gm-Gg: AYBFou0CKPbs57P63k079XbTAdB7W9fBWj4BfmI0cavl6+JcJCR4jz6ldKPjNfgEeO6
	ceHJuWANew1sFFxAk74useo9wKx/JurvYNhiwUYl9UAuxKaSvnYAAtuDcRe8pFkZf1tnyDvhWdz
	aorFgiYlFJ/fU98Lv2Hnc4x+GCAQiKnYs/MHtqA2VSVe6fqaFlMEdp+b78FIYMkhtJA1nvWpsRv
	z1Jtks8snRnAOUk3q4VzR9vsHIhen7aH3KQqpaqU5d814tDhuzmbXfd+R7PYzo71DLxUdKp7GVZ
	fnF68dn8Ttm7pEK+BHWeMuvpKHAeqMd7bF8bMFkaw35x+5CKGf5cdVNgPdQQDDBZmdEv0DxDFKO
	CJSd+w+r1LE7JHmI=
X-Received: by 2002:a05:620a:4857:b0:939:5d22:d1f0 with SMTP id af79cd13be357-9396dead4a3mr1206549185a.2.1788611274585;
        Sat, 05 Sep 2026 05:27:54 -0700 (PDT)
X-Received: by 2002:a05:620a:4857:b0:939:5d22:d1f0 with SMTP id af79cd13be357-9396dead4a3mr1206547685a.2.1788611274089;
        Sat, 05 Sep 2026 05:27:54 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5952560sm238334095e9.3.2026.09.05.05.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:27:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: monaco-ac-evk: Drop redundant whitespace
Date: Sat,  5 Sep 2026 14:27:47 +0200
Message-ID: <20260905122746.72952-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=815; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=YS2PFBtPYDs63eo930+d89nki8D8vcJ6NjzJW80Rf6o=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqnArCJQEz25Tbvuxh3RdG3ykTADbGRSspiPX33
 wbHJ3MJlvGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapwKwgAKCRDBN2bmhouD
 1yJtD/0aSZniX4+o1wi+yeun/hPE5ciMO2Iekx0JWN+4ROYuL6K1yESzjC/JyCVg2uWbPBvisKM
 NJAzWmlv91FlHQxWOLnqSEUrMvu0pjFppjr+omE1mGC6bIsg7S26fHxaj015tYkk6fdftkmNjq9
 WvDz0RnOzz1jiqacLCdYLlf3IZmCRb+b+6lIGF0+ek3EWDZJrQCmT6hENPwE0HeWDK4WligL92A
 pHh5gh9e+aR8rTT2DMP8P2RL7swnlD4oVFrA6xZeZ8fFAEcaiowq5OQVMZE+bol0yaPySPvctaF
 cCuG0MTnMb1JTLgPG4N/x26PbM/Pw0SvvIPuK9A6LOxLz32cWArIq7PUfkIaBAyFu1HejnLJXbo
 mvV50XJ+DP2C7dhE1ElpBLrfbY5RVEvM1XW0QLOVh1DGdNpUXtVzWIXRtaB2iCJrKB3ny6TlnMC
 rLfkBMHCHkJIE8rgLasJQqGCNbYseycQ9kNvKMxDsosKJIwD3f7ELaTkz50qmvmmwEE62dxpbQD
 6v80TwbdEE1DY2P6bklMEl8CIaaWcNwInGqUwEdLh02I8JAxgC15wzuKsTVKPuzB0rLAE1DmwOk
 nbAbQs7dVyOKmriDmWyISHswpJVgFrP+wgpbZOihaV2F3dvRU7j1Cc+MUGWrzfrSNRXRZcWWetH Z7W8Lz/P60vlZrA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDEzNiBTYWx0ZWRfX4M3Au1hR5tVA
 znPPgk0b7Z6af8OpdUCeHZqREbfn+UufMpKujme20hft3HGe2kNS2MMuPvX2XTLl7sypg//UE+6
 wnMhqo40p/NyyaNwPWeI4vGl7CCbr2UHYSbhcwvex9A4ju2tEo0vwsdm4wF6RvmlFqkhTjcm/PN
 t+AmaLEZmxzj1ODMDrAQWpBHHKtWaIMVvTjc93l/Je/n5TKiO83sEbmNorTww39jmldJBpfK9+E
 I5LJ8JpRpBc7dJH3s2q+btWWofAaqflEqM27QKDnDHeJ565l+YqGn+yqlApBJktDMuFDj4yASpu
 wXGQCxbBwb7RGPmiIja8D6eD8QUdGd910NOzMphWo89dSuAYdWqdNjUP/8J3nCFTiu/vniHdXST
 bLOobC+2q2AWwZcoCuEqye0vSx3Xy1d38Q1mB/Q7BzYBqD8tLFqMOHBGwps3klsmlOtXHw/Zlz1
 6aJ6IYD+1GOJ2rwox7A==
X-Authority-Analysis: v=2.4 cv=P8AKQCAu c=1 sm=1 tr=0 ts=6a9c0acb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=iQ17RmGla2tzZZFXTgAA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: jvZumtR-zCbiN2-Wvo83Wba_Tzm4o5F8
X-Proofpoint-ORIG-GUID: jvZumtR-zCbiN2-Wvo83Wba_Tzm4o5F8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDEzNiBTYWx0ZWRfX4m5dRRneBYXk
 8e4201FtHQF0acsgNjeEGsBbGvud4pGUX4tjiKvaQhAF8WW0tKaiu9+pdj7Xrr5nF+cM8n/iexm
 TF2i21r9QRNiNNw8JEamIFSU14rVsqw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609050136

Drop duplicated whitespace after ':', as pointed out by dt-style-check:
  monaco-ac-evk.dts:825: [redundant-whitespace] extra whitespace after :

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-ac-evk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts b/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
index 6f3c3ffefe34..f3d41f738440 100644
--- a/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
@@ -822,7 +822,7 @@ expander3_int: expander3-int-state {
 		bias-pull-up;
 	};
 
-	expander6_int:  expander6-int-state {
+	expander6_int: expander6-int-state {
 		pins = "gpio52";
 		function = "gpio";
 		bias-pull-up;
-- 
2.53.0

