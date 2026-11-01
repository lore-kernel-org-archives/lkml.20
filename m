Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793563364;
	b=Y2tkZaui8i5SQEux8F6nDKf/6Ucq75HvmV8bIxUSLGza+K89jIr/OObDZYJLA2WUyn2V
	 FxncN9iXuqIuNnkHJn3vSdDHSHRd0nD9lokN5shi6MY205lp3C5BWdCcKdOUM0Or4Sj2N
	 kaiig+VVEh7Mgs+6Jmn3btiUHOmrwhSt8FwWv5eP2NLEWSrOCt22uqXfXRnMBAbDyihW2
	 FKqjnaWdMDJhiwTslu0xaEN6bEDJGhZoOqxf3ywY/ty5OwpnqOQk4/kZioyIQB5GtyOgu
	 OB/voHz9mEvgDuijT2gmu8XOnV8zKbbMFYGJAL6rvWFlHIHyivx+dAFriLDkT2vYKOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793563364;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FFo4VAoRn152+JvtJtOQqOlN2dBiZRlLDT5r5GGRz9w=;
	b=qkeHIe0se2JkTmFCyuoYlxObPD17hN9itjUU/L3lK/iNHEwVxuMU28xXqB+8PNiRiL+C
	 6ve5wqxWS1ly+MqZn+X2X14+KTu8MVWM0SB375h5/JKVucNV03S3Jb+Qk2EUGpPVB4D2p
	 jYsGr7PjEm9LhUgWeaIZWBXadM6EFraqHDcqATO8xOVFyiobY86oDdNcaADeQB/AioPYt
	 M2zs6TRaWfzRAp7b55OoFXuij8iN2kzQfe05qk/zcmYS7gWEbazPM+DJQB10EKRuKu73g
	 gIWTZfOB8jJwZ9kniuErwP//+2piSQhZKVb89cxhtSWPMWgdVErc0bJcZc6SkXVsL0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gofb68I8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B87HFIY1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B37606A336
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 20:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75B37606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gofb68I8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B87HFIY1
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HQj8Z1444979
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 20:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FFo4VAoRn152+JvtJtOQqOlN2dBiZRlLDT5r5GGRz9w=; b=Gofb68I8Niiwe2qb
	ahR4nYiqtXB/u0EUAithM3H0qTLCuwGOJWalrcW+H6ChsQdXwouuRAQelKjVT/Z4
	HPdEc8Buo3TAzOI5qNNTkHnp3t74tqUvDUZUfziBudlKZkY7vmS4XPJEgjyoEWw6
	a/d6ouCJK+GZvVoX3pWdHZ1xaFEsFIbuFng3k0ZTnfRYb8s2GQGkwyfop/6t9b9C
	Z9jlCwbP7UIS2HpEcnl/Dx3brmjEvG/lNyivr4NT7xargh3NiT1vIzXx3aWCc5ZT
	o2lYhrh/B0zxo/mvVnczLPtZrkSPKC6qD1WCcpev1x6c3CtALZZqiy8tQHDXKb0v
	8BHTNQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8duc31t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 20:02:43 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-836caf085e0so35725657b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 12:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793563363; x=1794168163; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FFo4VAoRn152+JvtJtOQqOlN2dBiZRlLDT5r5GGRz9w=;
        b=B87HFIY1gw0JXTvs9/NlXc3S/7i3Wfl95psNJeP5nhZUEfbA+FGRtCjcngLSNsv0IL
         KEiJaP5oQGsa+I7kXKCeMJifC0RX/zz5movJ8laFO5dcxle0LxamQoEqQacuRD5AAsce
         Hy0KuGGU0nn5ZbpVfICJ67YfiLiKVUD4rgzmhMf5rIpk8YX5NIw6MfDoPzkSYpFPbcW0
         fxq5peXQGUk3UQtc3c7JwWbKpIsHprYRpIY+csgMIL9Rc8meI+nZcZn/TMu89K/A8GSc
         zN9yg0RAOcKNJU2JnTgzzB1XxkOMg6c3uplG6E148WezkfcOsusmy8P0jydrRuLlHWX4
         A1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793563363; x=1794168163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FFo4VAoRn152+JvtJtOQqOlN2dBiZRlLDT5r5GGRz9w=;
        b=KDr+DkVuFrm3FPV3AxpdVnRS+2KFuOYED3Z5994tyeJq1PpQJcr78CAnNPPHdSWqOO
         QCQueM+UCKObF6R1xJ/RIt59siV3pfDOhtxo//2ZAqZMu/fVx75jB/2KhMmslBlyUV/1
         1YHiUYJLwWW4uqY2mLLiqH01t1sOZM4dV8rQkL7ksKn0gYDJNaV+0clzyrLfkYxyYeqm
         dLZO88eQzt0XW61gwTxgHzh8Sr8QoxzxRkpTgYLZIetThfgo50p8xKgsXBa0ojrLB78v
         As67miU5V6xyGsUce/arQo3GTbPe9/G5PsIkFil2ompTMyzIJ95Ai8/FYHssaHce/diK
         u0fg==
X-Forwarded-Encrypted: i=1; AKwUvBxFbQwjR+B2761uos77BUSO7pZTLTbqT4Iqd9ipm+IbUOhftJANKgr43uuiQi3lfIgb7WNDnSdqXLNXkr4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dM4W9OU9g8MJK7MgZavRoVwuFmo0QkXVC5cU063iiijc+8716
	J7mh2GKK9GtTu6GXlJTRaGE5zAjYRHqe9ZokK9bmTRA2uajIpoNn3R1hELQqw8oHhp6TIeD3n+0
	9b6MVGpFCNNPMeSuvgW2jQJYFjwmxMH1aCpn0wQQXB5YTFUUZc6YgCwKTSySyPet+xeE=
X-Gm-Gg: AYBFou1qk4CVWZn+hkbUV9Yjxd+zJetXCJzy5u/lb0/vpNHrIl3PsC5HRA9bXJrYdCV
	zyWN0fFcj04e+8Pi+IFe3I/uhC/00ibR5wQnlOZTQLDcPKbTebVYXEaTag/tBAicRYhs3+FFg9P
	/gX6WaG1UzihKWBJya/tVMhfpJuqcqhqvvi/b+S3Q7f/W7oDczZeHP+eUFcyD/tyLY1Wasoj4EK
	Dc+UDea0WqmCaKn5s0b8xkiytKK8hLm0KbAFzavBmplClpljnEjIHsH/2/W8mgjKw/DBYeoH6t0
	fcgA3IWYHk0eQwGHW/NjSnMGzsJiyJ14f4er8QrvCr3k93+VhJKGvdpZ8aOTrCE53rXTNAy/bwl
	zBLD2UJEpW8Vl54to+fO/+P5Dts7simX1q/F0AH3wmRCCw5/5bUcFECE4cE+SD5lf/A==
X-Received: by 2002:a05:690c:3481:b0:8b1:f47:9c07 with SMTP id 00721157ae682-8b2b6713e63mr56500817b3.25.1793563362615;
        Sun, 01 Nov 2026 12:02:42 -0800 (PST)
X-Received: by 2002:a05:690c:3481:b0:8b1:f47:9c07 with SMTP id 00721157ae682-8b2b6713e63mr56500697b3.25.1793563362213;
        Sun, 01 Nov 2026 12:02:42 -0800 (PST)
Received: from [127.0.1.1] ([2600:1700:b450:a0df:c754:9665:1e1e:bbad])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b7198c65sm41034807b3.36.2026.11.01.12.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 12:02:41 -0800 (PST)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Sun, 01 Nov 2026 12:02:36 -0800
Subject: [PATCH v2 3/3] firmware: qcom: scm: add HP OmniBook Ultra
 14-kg0xxx to QSEECOM allowlist
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
Message-Id: <20261101-hp-omnibook-v2-v2-3-1b99767deda0@oss.qualcomm.com>
References: <20261101-hp-omnibook-v2-v2-0-1b99767deda0@oss.qualcomm.com>
In-Reply-To: <20261101-hp-omnibook-v2-v2-0-1b99767deda0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Authority-Analysis: v=2.4 cv=O6esLx9W c=1 sm=1 tr=0 ts=6ae79ae3 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=zWXkJhVHaGWV9AuZZCwA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-ORIG-GUID: GXdyxQzbD8ORD1WKx47ynV0aVvXzD_ha
X-Proofpoint-GUID: GXdyxQzbD8ORD1WKx47ynV0aVvXzD_ha
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3OSBTYWx0ZWRfX713z99f7Emmi
 bOOxkIUIeENNgU7XLwS3TZuD+aUfRqp8QDEnqW/0ir4Zax2S4wk6vrrXitlI8hUydiAOxs5WCoT
 n+b3+TjvsQ6F3A5KRvuU3f4zimS2IgEha3eZYCiS2Q/zAEi2aJM1O1wWAYT0h1mbBT52fNSd3Cw
 C+KhwtjolSiJymsQ/CKXbduqVZSkxzbDXZtB7mCWKAUnxUf/CVRYc+qZm2z5f7bVLgV5frJqHSB
 oduHLrIzHnmAaiC73hPaRltFj3g2DeqZgw62hSQHrskYvOcnqb9xzn4trtxvahYMtsVoF+gv5l3
 I3UDm1N34UurcuwtuU9NFWNDyWuPUcLML9DYj8yFZCunA1QXmio5aLnA3Sf1YFILa1FiBUFpQLJ
 Oluy9jLzFZgq/vwIH9kraC+SpOnfoMKwHjFzNyMy5YcHibUQ4s0J0xfi1U2Oa8JLF+viVBifNdo
 7HXItIAC6kNUpYKSAJg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3OSBTYWx0ZWRfXz1DdTmPpMOUH
 XaX2GvuG2F2/1bAJgPO4z2y9CKKPatZiYokowSqDiB1m6pbxnoGYhcwPlDDslohzLQqpsHZo48D
 +Qu1fzfumDRdcDhpK8ZqAzblvVIp6lg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010079

The HP OmniBook Ultra Laptop 14-kg0xxx is a Snapdragon X2 Elite
(Glymur) laptop whose firmware exposes EFI variables through QSEECOM.
Add its board compatible to the QSEECOM allowlist so that EFI variable
access (efivarfs) works on this machine.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Assisted-by: LLM
Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 43e250faea75..7658769425d4 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2238,6 +2238,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "honor,magicbook-art-14-snapdragon" },
 	{ .compatible = "hp,elitebook-ultra-g1q" },
 	{ .compatible = "hp,elitebook-x-g2q" },
+	{ .compatible = "hp,omnibook-ultra-kg0xxx" },
 	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "huawei,gaokun3" },
 	{ .compatible = "lenovo,flex-5g" },

-- 
2.47.3

