Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794273724;
	b=B3JXw1H6g/ejgsJyOLKYLhF+X4yVawDb4yWXax52gTAMSiH9Exg5Sgi15eliw+71HDzc
	 xvx+NmOpTp8RG7q+ddFWyRAJmKbJMRa1+th3tQ85etSNuD6zrta7Ym7/3v9XaCOHJhUp8
	 m62Do4flujHCH90s4xC7qNQo8MYvSLeHz3dQmh40yR6SCIodfqhOrlxPmrNpUKhak29IQ
	 vsLTc4bdwkRR7+IPiOpJrhQWULIGcxAJBhAk6KR9A/Hph2b+c40oftOmvI1SFDH8t38o+
	 3ng06io7OV8vtRtAv2ARErk6zT3ftGkQ3+KfS3k2B27cWLTciYyoG9azcEYu2niioFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794273724;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8So47bPBCZmexI/kzj7aaVs+HdPn+jjIsV94eZRvyr0=;
	b=bqOQckWbXjaUXu0kE1xiAJGxjKZk13nLjT0sV9ahgEdx4FFjGjKqRP7W3dInNLCWjx8W
	 6Ir01klNsu0VuzV2C2eWvCUq9mByJRXM57jxLzLLtqTwI2JkHlsgWOBzysvieHp9Zi9qG
	 w8u1vbHGpbQTRcj4D7FLP/Q359CYgqcXV00h9+vY+c4PkQIlhQcSvXOwRbqKKyeHC1OJ2
	 uCi/Ya89Hs19PQ4y+umSGrsRmRZtjzsKfasnw14Q/8JvQQB7qcWOeD+pcIuZY7HU6SJO8
	 ZDydM9IHve8euZjObQ5Gc1vYHVCM9Lw4d/eh/Ost5RTAy5EYZQsn19PlD0F//D2zJGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dsq7N+Jh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RGhkUH0X;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5DE60A381E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:22:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB5DE60A381E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dsq7N+Jh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RGhkUH0X
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0jcQr237419
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:22:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8So47bPBCZmexI/kzj7aaVs+HdPn+jjIsV94eZRvyr0=; b=dsq7N+JhZMxNrVHK
	6avJUuU8XEYPugS+EB2pbkOQeq9tS8ttDck1z8A7L1yul5jIHwTYekIaQdUL40PM
	5eI1zQ7Zn+nK6BiIVKVz8tWTd/zaypIQ8N5bbHf5rgkxQVDtafCdPTSmUxmURJ1J
	KjhmyKGUZWn/ulqlrlAHJYFLr3fl/6OtYfnifwY2k8EMFHiJBofTPy6EHq3RDPXd
	jPPqImrLr8AOaCO1b751WfEFGQm+TQHi/XHnz/upu6dtqXArAYe96IN6nxNI6A5d
	1VJnk9K27deOwEpZ8s4ULqSRa06rFVVvkp28uUUvYyaR8O4yXJyuKLC/VRy2aqGk
	g+MFkw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hubt8u4qc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:22:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ea0fe07201so10177685ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 17:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794273722; x=1794878522; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8So47bPBCZmexI/kzj7aaVs+HdPn+jjIsV94eZRvyr0=;
        b=RGhkUH0XPlh9V+X7C6THVKsJ9FzptRLO8aUNU1NraM06Hbx9q0A2I7ZOY5urR9XlJ3
         bHzBA16GBvb4KgwZV/e06TGUisHlaNTfA/lBg9iXAl5gNAzbHuVxR5u9L+C+/aLilBun
         tEZu/AeEJ3V7Kb6odrq5HgNi0J6ZCFv9hgcx49TH9mXcJ4PWdXQDA5FKhJYiknUa3oil
         xwVaJcq1cOISXJ0WBdbZJe7jfqNZ2WDJKteYzLTN9IVlTe7+3kNW6CxknnIn7GzLi3T5
         ge1NXXfbNijKGZZGf2QYPlFVttLXtwDE+KrBQaF46e9YS6q5UCTq4FAjMthEK1OagioC
         iIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794273722; x=1794878522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8So47bPBCZmexI/kzj7aaVs+HdPn+jjIsV94eZRvyr0=;
        b=KyJxCl8U/sAHELfxlsA2e5/NKXNdf/+yKL5VcatnEvUXpT3Xw83mzuU9Ca1mmOU1QS
         j1TFBVYLq7ALnIfbMzA8vHw5P+qX5qkVEtk9438jgiLLOWi5IpU/cpT3SG6QDDR29d6O
         I84NAhUWxd1SS1ruS/G+WcOCcXTgWvZpqoFYJHSWBvvZYYxi0AtcO7MNwXdAEJo8r/go
         paoOWfRjBDvKAXkFMd3jtIZx9K8IVC6sluWuWImeu5t+mbhPlQI5ygvwbLcLrrikFJsU
         8mXBxjCuUBUEfBQKyoX6qStihPffvXBkouW6MSZbp0gs1PVQEtvLMJDYEf3D+cWn7Ckr
         1Lqw==
X-Forwarded-Encrypted: i=1; AL+hErH88bSw3NduUGbbdT0pNyevTX2nc2ws71vGqf2/p0jQrT+Z8j8N6WHwODhourbgw/yc7/5EW7BybfCkORY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pi64r+/iDtAQEM45rrFfiTufNyub8nM5ny8CKwSO2OBEQTIm7
	bfk+AOo9suwrLOeU9vGgFSOu9CAcWluGPCdX8jVH57mgXekpK11ADOVjqAmaSzx9Z5n2SXuRInL
	aULj22JmvNktMX2CkXUTL8PzAyP+HyXQgTL510EXN5EkU34p48sUgOOm22cfLCZkjx0c=
X-Gm-Gg: AYBFou37TiQH1LVWGQ5tomgaUjoS9OMoTScyGtZdjjKNBE5pkB7mI7RUZpb2IduuRjC
	5fe3d/m3YVqL3Sr/8VdGSKRrDzpxP1E0ndSMQiTntvzah5J57gC5mWvgatR+hDm1qjIqzTpFdLr
	tEwEHHGUDNVQrIdcbR7FsMA0K7vW3/PNTV61WlecVaNM1lmkt74aPQwpHKl4wrswPlTrK0m3noR
	L9WoDmI5OPCNdZOs6bThbHkI5noie41b56gjPHEmrJ7SUCoWzwDIXzavhA13WExRqr49ikl6FwB
	o43fBbO7R+1rInnr9jPmb8o/0iSRevvIOY94sMBlvBCpsR3+JguQyvshiO+WBOrJFK213UK0jYQ
	WtIl82mR1cw23vIWdK3foXXtypJiHwNlZZOP6qYuaj8zP2CrfksixjJIgrWZmqojJJNQioflUMu
	sGmy6+W07mkJn7nK3MaQ3WJmM8w9V32tfB+nY=
X-Received: by 2002:a17:903:3708:b0:2ed:4c7a:31e4 with SMTP id d9443c01a7336-2edb8f95b9fmr9076565ad.1.1794273722138;
        Mon, 09 Nov 2026 17:22:02 -0800 (PST)
X-Received: by 2002:a17:903:3708:b0:2ed:4c7a:31e4 with SMTP id d9443c01a7336-2edb8f95b9fmr9076165ad.1.1794273721629;
        Mon, 09 Nov 2026 17:22:01 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6e0d5c0sm3148065ad.71.2026.11.09.17.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:22:01 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 09:21:17 +0800
Subject: [PATCH v7 4/5] arm64: dts: qcom: sm8750: bind traceNoC on the
 platform bus
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
Message-Id: <20261110-fix-trace-noc-probe-issue-v7-4-2f06905c77fe@oss.qualcomm.com>
References: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
In-Reply-To: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Jie Gan <jie.gan@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794273690; l=1677;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=kZiNHGuoVNQkmFL0f1QJxaveTsNubLnCPGMK37H6F3U=;
 b=e3fMacKJRF3qjdJA+5qwXtZU3e/TGJVbSK8JjnWWrajul9wrlr2x33918PI81Yq/4MBAFZPAN
 GNkwgEpZYYAC0BEf8rSHydVrEwYZ7b9AW794RJSuX6CJPb9gfS1BoYv
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfX3hDVjTBtZ1IS
 mvRBK2gLFFEzamK1Mt7/LJGDbiNS9QIh7PSW8mH/Ta5prIrBxyEFTSaG6HUWqmo/mv7+OlASqP8
 mkkSRHZ1Si/RPi4my/up595NFimlr18XgLtGY58cuU5WqPzXY9NcuU8LXUxFDqNzBcO1AQk0OeO
 VWtQrBfsaQhkiCIDSnd+Xx9Nvvg8TYMktHb07H5dPFt3aNR1tacG9vM+9YcNEXeLObvq1iy3cg/
 gvel48FF9XATLp8VtVwEZWog+aVnw69bkshPvtuD+CXyxR4XjlJ28NpTK8wOOe3ygCOcYkk0PBM
 Pm/1OFKGwZ8XDRbgwGOFoxukBuloCI7Sq0bLxYRoGNadPiEpY1IdLgztdGvBRYewtOcagn7jJzZ
 5WloOarKRonEdqTybZFNPjvdqE+P1nVAQwVgAPlaDe19L/gRpFmnvFW5UyqyoSpMVlit1vgJ9zu
 7uo4W/cWulnbA772UOg==
X-Proofpoint-GUID: SI9QmeZKlKOaQiHnKACxpfjypVR5jgxv
X-Proofpoint-ORIG-GUID: SI9QmeZKlKOaQiHnKACxpfjypVR5jgxv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfX2UmlLRlMATid
 xMmjrioNaCt4yYOQpzMVFgg/PhfupmRAUOg5kbbzXPDdA2onzIh76HAUs8flX+cGf3TcfKltkie
 ORTb3tu/Td2G0QGTJEExyOSIVpjz/7U=
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6af271ba cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=7Rut49xxg77_icr6qwgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100005

The traceNoC node used the "qcom,coresight-tnoc", "arm,primecell"
compatible, which places the device on the AMBA bus. To bind an AMBA
device, the bus reads the peripheral and component ID registers (PID/CID)
at the top of the device's register block and matches them against the
primecell ID. The traceNoC exposes the CID registers, but the Component ID
value returned by the hardware is 0x00000000 instead of a valid AMBA
Component ID, so the match never succeeds, the AMBA probe fails, and the
device is left stuck in deferred probe indefinitely.

Drop the "arm,primecell" entry and use the standalone "qcom,coresight-tnoc"
compatible, which binds via the platform driver by compatible string and
does not rely on the component ID register at all. This lets the device
probe on hardware that does not return a valid CID, while remaining an
Aggregator TNOC that retains ATID functionality.

Fixes: ebd1eb365cae ("arm64: qcom: dts: sm8750: add coresight nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index cf947acc5760..13f05c0d67f6 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -5172,7 +5172,7 @@ tpdm_rdpm_cmb2_out: endpoint {
 		};
 
 		tn@109ab000 {
-			compatible = "qcom,coresight-tnoc", "arm,primecell";
+			compatible = "qcom,coresight-tnoc";
 			reg = <0x0 0x109ab000 0x0 0x4200>;
 
 			clocks = <&aoss_qmp>;

-- 
2.34.1

