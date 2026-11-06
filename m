Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956900;
	b=37tvnaeWY9QJUPYQ475mdCEoU/DxbNCjuziyp3D/R5mzhscEuE1CQ1uw4IbB9pRAFOdd
	 nYMfH/ti4VGyDmDdAUKOTfFW7jgqmC3PLjLFEc0J/44a/pfUtvWZ0uL3daehP7SO0FXju
	 hAJWIUgoZ0NG5Br0T6TtfiZKtWURO3OPKdLgF72R6vjVEvC3IZwqIzFbRQuwnVQJBfi8W
	 XnxERVG3PT7tx/E0yacz3W3BU49c5p+2AfwPMyXdPnhozZtjcWOe0umXAgqdkdj4xEFRr
	 ZeYeJxMaFaIUMiEe57yoQpRaniNRL426fk+iWUc6SSokHNBK0Rp4pcYz8AxImcl6VfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956900;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RLhFsKpGVdDUz22uBOONq88nw9FaLv3xRMNg7yPljNY=;
	b=xbhuNr5qzeHiJuulKRm73tmkvkJ4a/peD9k4cIgclW4HztBkg7fXy+h+hyHpK18cVMZZ
	 jKfPhg/5cdDHqpAlVGJcqfDSsKURmijI3k9d1JBPd1vqTRqnadL+2DzGiCSOH3hdBYb51
	 Le+eTJrv1sS5ZlwPZHt9YcsQ1IWXTGjTRewKpc2dFDqMsMK+XODbMLk+cZkcPNs1De4tL
	 ck5B1+DpuWVcKR9JGBqNI4M+gTm1M1n2FX2eX7cDZ9fljUTJZMWG0mSeAq5XDoTM8HxGH
	 RFso9V1P9MPC7Ek1aFM4Y1QPeLRWhS7uP0CDH+CoLKn6niG8YBn0DT6HJstBdCc3Ybg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bvR65mQq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PQrjFSYe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AC1606A335
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55AC1606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bvR65mQq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PQrjFSYe
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R3Kw129003
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 09:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RLhFsKpGVdDUz22uBOONq88nw9FaLv3xRMNg7yPljNY=; b=bvR65mQqcln0yVQd
	oZRk47zerB1kOC8k1e779bDptbL3O+WP2Ft94Vc23/rOrZ9xfT6iOSksOoWXcxVU
	4AD5PIwgD5lVexJUuWzqAmPkHv0jDaDNy8zVjc8EiXctd/qtWfODL7Ayq9/pKaxg
	Lpx5M7YXFnAl6qaW2DELZ8HSdhXOherNGe36ETtsSqBZoopjl0pS0pe0a5srtFcs
	Zzk8i8UI4GRLaxW3uTaczA7FwpapFkM+wAkXjmXlT11cpcRl6GlSL3Syxyver1PF
	mdKBmMzW1nsOmRgt1MZ7itGej6EV4aJEn9j7JprtE7fVE8ztDI8SF6tYQL2yszZ+
	DHuN2g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9t3fq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:21:39 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3700be873ebso261686eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956899; x=1794561699; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLhFsKpGVdDUz22uBOONq88nw9FaLv3xRMNg7yPljNY=;
        b=PQrjFSYeGXsE0PI+OByUVaPY+nkILvr7VieS2rV04u2jmaJElxI2TuIgobPpuNqCus
         DFhyZNlMBQAsKS+nHjupcNl7Zgf0ZVFTMwtkuW9JSxK1SE+ZYzQw21hrRUuqDbvGNc/u
         8zZzpEIlQTnraANo1rYtRpSHNvoCpsNJq9zSGFj+qtAu3M7o76+dlraeC034fZ36n6XW
         DvbnEmaSa4H7GcJ7ysDP7MqgHCz2rH35t6ogHBjKKkLInFUoFSOhHPM2QAsMdRYdFd8h
         GNXdWSAkXMSa3HWH6eis+l5b/6OYmyqe7jSCN8xmJW/ufsf8pfUMjvzi3SNVWmD4/263
         cePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956899; x=1794561699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLhFsKpGVdDUz22uBOONq88nw9FaLv3xRMNg7yPljNY=;
        b=VE4yzW6oty4Ri833WCh7Vwc67DwRQmjq8Xq4aFAb+kW7uSICZ6uCIV1VVmHFAopsCP
         FKH45w5NSX4flxNPdEorJxUCQRdGyPZdozXiAuvVjwK3ahsSBTbpL7tOT6xuFXDqTcN0
         fvUVqO5uocT0Vrfz1G2iZb9pMyUKdgWZNftKR7kw6pWSdxB9khqr+D3ArO/yXHsnYLtF
         e8YYh8aJrkCjXz5hXhCvlriGm/0hriQJBy4BxzWgFfIu33jMEB3EK79gk+Cmw0Z4XoKf
         L3qFD7jCb4nTNbK0i3Fusl4CC8P0KwVK+odMjE4hu8Qa4eQZPbqh7nc47vy7i+YejqkW
         ++Xw==
X-Forwarded-Encrypted: i=1; AL+hErHD+cyOArbG2SnLrkQLTP3txkrxEKR1C0pN3Grczt1mLKvJtbhh4Izr4NSEOMYyO6HOK8Pen1XVGSwTr/Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Uh4XJt2liV/oMQnwIWBDqUMczbCGo93QYZnFHF2YUbZSNSl/a
	F9ateQDyKd+gun6hQ3NxlTcmzZGrz0wvXc7o3g3gUYoNW7KkJ9Ps4Nfc0mdNprD8UCxEoCiXo7r
	4/TCTUZ7NYESMVyRqZxvLAOnL/Xi2WcPCGkJpn6kMTbJxw28k8teoQ+jxpBLQcmqmUKk=
X-Gm-Gg: AYBFou1TZK/fhoZwkN7S0ejs1HQCwTJfVe/zWVp9PBCQaSYgrQpaz+u7PP3o61qig8T
	I0TULAy5zkSu2UCpUjUr/gnpz0xF9fJ+y8e96MOyikHSPCuNoIhy+7QLJlSnMuF7F4M6Wi6SDcL
	Z69p7Er3ko/8lzdxQRmdr+TN/WJEujFNG96S0hFFqinkmiHO/7MEcFTFTbfiBKCPCUvojKdNGxQ
	R2w3IJqS98K7lTq9SgKjOSdXRVeIL9qD9rpmUKZOErBJVpusY6MuWmjunzYqRLZGAwtQAE7z9lG
	XxFzwBK1VQ5zlIO+yofzEmN+A1Y2sJVnVnP3xHzyDkUbtKzbDsG0GeE+3Nc/AQy58+hsRMzGoNT
	LV5K0HWjcMNZlhKBytzujFal8UFIfYwOfoj86EqW5zqvARCjV1a+glgPtYjVYK3jIlOgjf9dVcy
	MDWP+vi0urDXlgke8pAgLyWjIZVq8UAPlyAeisd3kJ8TblmrniWjEeZoyUwL/dK2ehQHVnErE/a
	Y8obw==
X-Received: by 2002:a05:7301:b82:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-36de5f700bbmr7371006eec.6.1793956898837;
        Fri, 06 Nov 2026 01:21:38 -0800 (PST)
X-Received: by 2002:a05:7301:b82:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-36de5f700bbmr7370963eec.6.1793956898292;
        Fri, 06 Nov 2026 01:21:38 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa96fe226sm4903912eec.12.2026.11.06.01.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:21:37 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:50:56 +0530
Subject: [PATCH v8 07/11] arm64: dts: qcom: ipq5210: Enable download mode
 support
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-08-dts-v8-7-d91401955039@oss.qualcomm.com>
References: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
In-Reply-To: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX0+einxL71V+u
 rpJhFAUx6Eao6lYwB+kjekmAHCRhFMrixB2TEpSOlZhXd5kgsgUTwt50k/yd6IDzj5Wt4c6f74D
 a0NLIB8LNnKOYq0fu9utEe5iaT9Mw0E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX3Si8qX61zn1d
 e+z3DsQ5LE5YtpUE6j7kfsm/cvz/OzAj0gFQxbwxE4TDYKtdyF3pceuz3+XZJhuAfwcU1fcXZzV
 gNWuakDJAKwpOizuHluI/2umOYwTW1iVmjHfOhajkBy3mrXHXnAQU8neI0mcThRnV01Q+GnVXdy
 zfisPvBJHHd0Gu/l/JiXHU2EcGcUI92oWu7dXQbihRxo6ehs5NRldPkOmjPGHjfdFJZH6dFDN9n
 UmdUAbaZ202zKFuOarave3tolnRWWM3t1FCRynAv5ooZelBMmkz91h9siR1FNhp4GrPmz6GaSRZ
 f4K9e56ztX/jmYeF7Ak1EA+fIHCCY7gMAIO/ngDK8+eIfaIDk7j+8DCaeLKZ/VbjQ/BPbynJuRv
 MtA2sbQANfmszYkBLE0FQW2FWEV80q8j513PcPmViIIdKkd1Ou6DN2fUyJAHkfB9htNJ38hMfS8
 Zdoi2pgaJFdg0vGunLA==
X-Proofpoint-ORIG-GUID: AF3NxU2osDGBR40kexls7N7g85MCwI_8
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aed9c23 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Z1SsOzVGKYioKmY9djYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: AF3NxU2osDGBR40kexls7N7g85MCwI_8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060037

Enable the support for download mode to collect the crashdumps if
system crashes, to debug crashes extensively.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 705d7ed48713..de3504395c48 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -108,6 +108,7 @@ optee {
 
 		scm {
 			compatible = "qcom,scm-ipq5210", "qcom,scm";
+			qcom,dload-mode = <&tcsr 0x25100>;
 		};
 	};
 
@@ -400,6 +401,11 @@ tcsr_mutex: hwlock@1905000 {
 			#hwlock-cells = <1>;
 		};
 
+		tcsr: syscon@1937000 {
+			compatible = "qcom,tcsr-ipq5210", "syscon";
+			reg = <0x0 0x01937000 0x0 0x2b000>;
+		};
+
 		qupv3: geniqup@1ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x01ac0000 0x0 0x2000>;

-- 
2.34.1

