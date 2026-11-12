Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794523167;
	b=B8vZ5FPTBJ5ZktCTxmq5ZZvtMH0KOg7Ceh3owHRW+El5x5hu/kGdBOKOFqbD230gsEYR
	 qPoglmp3XGMc+zhfp4tAYDmhAxScPOYHbexWEty5O4wloWaY7SXsNmSlVXQcc4r8Q1p47
	 YECD3j05Zp0K7SUZkNTUHzgo5EWUm+UGsa6hHD/IZGBmv1Yyv+K3WOe+dphikYIwuMXja
	 2OWNFIr/Us/ELwruoueVJUM8qYRCXPx+L7Rb1nKed0YuIgtSkygZHOxdIUcQDBu8weCse
	 NyvQ4K2/BNt2kMlgVaRuyrRAAUESgNEdVDZG2fzCcG4JLj1Pm+wiSTdHo06c99DBQvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794523167;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wRKS0AEcnZLyk4SJMKgDIkHcfHABAQfWhr9XBghPIvQ=;
	b=XBEnUharrH61sJeEPavQ960866SZMnI27ty+QdLUuHiQS0MNhVVBiQjExDtLZcYaQQWx
	 68HfWqAT7gw2h8O0JUQif1e1eUw/mZ76ASOLj08cWOGo7Wnxfh/nh2tz3XWsIX7l8lM9K
	 RDt2nRlx2C/xdaEZgiPJWM4J4b9g81smq2v8eUGx6cEtvUDvj1ffUTxsme3RC8fRFpVW5
	 AGxGuui3drlFcfZSQhlOLzLTIKaQA/sFHMQtt9lLEipxdOzSpq863/fl7fuDJbLP63POn
	 3Df5OkNWEjuyO2NUZyuorGRGsSD2N+3mpEkWPYy0cPNAFhk8YQkVaBYRjAlctzuSADQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Pxs/y/CX";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iuIg0Dgi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42213606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42213606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pxs/y/CX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iuIg0Dgi
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACJZeE51638267
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wRKS0AEcnZLyk4SJMKgDIkHcfHABAQfWhr9XBghPIvQ=; b=Pxs/y/CXNp6+f9iv
	yr33sDj6/7RZBTaCKEoLUOAcWh9uhONZ9Y0gNZi08Kyv8Atv79wiDnSJG/IUum/n
	KAWJupbgZXKlS+FLVuMy2wboLb2UJ5mi1YEEE49HPhjBlF0fLeITTcpI0WhrZe8q
	5U0++R4l0oGWhe83uOKOemaPB08pA3FsQ3gSR0hsM+Wi4+M0KIhBGt9O1Lz6oNdZ
	sGML8xNhDz1OWsbvITst8LJ84Z9xWfSOgkVsYJBljQTvSYA+6jkW6KHPhteY6bKE
	8449Qj18kNkEgvfTAKt8uWcrbqKmYgZLv5q2RYHhcFQ+CzayC3OfV1E36qZuoinp
	w0FXdQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re3q3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:39:25 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso478687eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794523165; x=1795127965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wRKS0AEcnZLyk4SJMKgDIkHcfHABAQfWhr9XBghPIvQ=;
        b=iuIg0DgiuGxVKvAYMGluPCQp4myO0Ia3G4mF0lZgkRoIMuEKyweJ3KdEYsgTZ7uVhm
         5BmD2L2kRNIv1GqtR6UcFiby6N3JZ6MzXktS9ZteGrM4AdZINDUsnG73Q/uyU3Dy44Sp
         XBKcctiDmGV3pq9ouBmuR7HCq/bH5Vsv2d9l0B9oMct+agBTw9yhhH+TlayQrmPAYxap
         QNPAv7gHdKIIJYR/n3zG+a1GbBXrAPB9L5mWfaEq6er/QvhPvqEU+ZQ9Y6US2bxFwXqb
         Ogpfd4OXZPWuq6nWQgxy+4k+9qD/7T1LjtrtV118IvUurbX2kw43BXIXu9AE2h1QD236
         txXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794523165; x=1795127965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wRKS0AEcnZLyk4SJMKgDIkHcfHABAQfWhr9XBghPIvQ=;
        b=vmum8Y2HoTgwPpeK1bTCDSJ1XkgGC+LVbHpgYhB3ZUeOJM7h6m15GpMlsRUp34NE4N
         oYkUSmoIEgw0s6RO7PeXU6T7s8IzskyrQ90wKI2opJvoIhhukcO8mb9AzJiSIQ45STap
         FbfwMQElih7U1VF46iIFGTssqGSAbJGoJmiPBisyQAIYyU9dz9Cu7mGMTh8aMkULioVo
         WWibmv32yns+GuYNS34KLJrNGQqiZ2wJeKMkGSAEH9HQvAGgOpvXTQWcdjIhj6KjfcX0
         wcol9LWu+XBi7euYmvoer3Gp8vCwt0wgnzhfjh58BvoH7jk/shSZvcxJhXMNHVKJQkc3
         cLTA==
X-Forwarded-Encrypted: i=1; AL+hErGD/lynuDQsNx3H0aUgau1G+GBYVFCTiWVIL6JnIkI7FJabReBPoj3FjXoDKBnvmXfWQ4+pIujirV6MuRE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jk4D4ZCMZ1eU93HU2kmAcQSBsaTUbx18DZEA56oQZ2b0TLHSo
	YNyyN0joCPigS9R6l1pQ3l+dNL4jNd51tdPO3ojll+UloEwU1hTFHqYvrt1HsTYJZtVigENUIk8
	tYLa9EFUeJ+Hc9ZNAnjU+5lcVJR15Z8fDJcQBbKtGA5f1IgEebL2l1XuScdMZ3byjD/8=
X-Gm-Gg: AYBFou0FYU4k60eoOqBfKdVr2LZHqMwi55cH0k8PN+SMzYgb56DqVvrEpJeDWvxWMh9
	/62y71QJ2ye3y3XZLaLHBVqriQ6D2EmiVq1+UElNPgvJ1B8cTinZ/iZXK4/Gdb20UtLpQOq2nBH
	ylsnM9Vzp1NV9uz1WvSsXCLWDSp6Yvjhv+R4TI0nBZSeAOpWQS7F1zo1XhNvs5qrvXktyoJ12s4
	xU6iAeb/AHyozIrrHu1RWsxogpZitgb3apKwikkWRJw6F+PNV2abMlfV/vXiWAXMnmn7efqx5MY
	B3U5h1wVxTTBCdmQGzO8uzMpDjnGWwUT8Qi9KdRbqSKcE0xKy7+p516tumT1Rljcqk7LfnwT+8a
	ikhrVVC0MFV/gW/rfNjZrTJi4MZ9Gi/OjUyiyiBQ8dW93P/RhlDiroOCRc191HQETAA6jOfeOEJ
	X5O90WSeNdvA==
X-Received: by 2002:a05:7022:c89:b0:1b5:227:7d1f with SMTP id a92af1059eb24-1b5030d765dmr705376c88.11.1794523164841;
        Thu, 12 Nov 2026 14:39:24 -0800 (PST)
X-Received: by 2002:a05:7022:c89:b0:1b5:227:7d1f with SMTP id a92af1059eb24-1b5030d765dmr705348c88.11.1794523164263;
        Thu, 12 Nov 2026 14:39:24 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm2333496c88.5.2026.11.12.14.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:39:23 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 04:08:28 +0530
Subject: [PATCH v13 2/6] ufs: host: Add ICE clock scaling during UFS clock
 changes
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
Message-Id: <20261113-enable-ice-clock-scaling-v13-2-258dc817bd63@oss.qualcomm.com>
References: <20261113-enable-ice-clock-scaling-v13-0-258dc817bd63@oss.qualcomm.com>
In-Reply-To: <20261113-enable-ice-clock-scaling-v13-0-258dc817bd63@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        "Martin K. Petersen" <mkp@kernel.org>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: VU_5NlKa9a3abkwYxzWMuKIgnWVh7eT0
X-Proofpoint-GUID: VU_5NlKa9a3abkwYxzWMuKIgnWVh7eT0
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af6401d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yPCof4ZbAAAA:8 a=4vEl8bdWBwuQafGpEzkA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA5MCBTYWx0ZWRfX6ZubwcbuFgl0
 DXkDzu8021dpyc2TF+EAT9Veghcm67SHTysjCshnKoY+lJLeQFtiMvmVvbZAwtNqhW4sANbQ529
 AHXzXhRCNkYjWwUzQnZxugz4Wx4iTFg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA5MCBTYWx0ZWRfX/E+kJZ6eptbo
 C9hTd/s43BsQvBIq17XjPd28vi47XIDcn47Spf7D8XLWhSavEH8ImxY15YxnIt1iSVI7qDoUFJG
 RJJmb/ChPG3haYz8y+rdww29MjHrpHQ21LVlEz256k9lie5avzJqzQ5JPWYsDh1k6Yi20pBfQGh
 bfIx2OOV0jtira6KS2Q9dEOCcOROyjJkByqW5aviucuIXdSFwEQqY/fGy0sLL0NxPWXDm/aJq8G
 fu2MR8jjSD2BMgJfApg8MhG1Zv4tknvOt6ELzycORnx4Dk0D2aqgdyotXwYysRxEb8UIZUmiNVj
 5xAvj210rTo7DHk2oueZdXOJO8h5uP973TgL+IHZ52STI5DNsiMWm2z+g2CE2TeOVcD2Qc7sqmQ
 zbO9/yPTEZxIJwN0tVrmM3HegLL9WfhYwBBSutbugJesRCE6+IBjKL/Dyf1fXm8ABZZ9Gz8OP71
 XwQHW8Zh1nauG0Wb16Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120090

Implement ICE (Inline Crypto Engine) clock scaling in sync with
UFS controller clock scaling. This ensures that the ICE operates at
an appropriate frequency when the UFS clocks are scaled up or down,
improving performance and maintaining stability for crypto operations.

For scale_up operation ensure to pass ~round_ceil (round_floor)
and vice-versa for scale_down operations.

In case of OPP scaling is not supported by ICE, ensure to not prevent
devfreq for UFS, as ICE OPP-table is optional.

Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
Acked-by: Martin K. Petersen <martin.petersen@oracle.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 6afb8498b8c267d0bbbdb1e14f37fd305c71fddc..5019803a6aba4f649972e2ecdafda1e9e38fe2ba 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -307,6 +307,15 @@ static int ufs_qcom_ice_prepare_key(struct blk_crypto_profile *profile,
 	return qcom_ice_prepare_key(host->ice, lt_key, lt_key_size, eph_key);
 }
 
+static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, unsigned long target_freq,
+				  bool round_ceil)
+{
+	if (host->hba->caps & UFSHCD_CAP_CRYPTO)
+		return qcom_ice_scale_clk(host->ice, target_freq, round_ceil);
+
+	return 0;
+}
+
 static const struct blk_crypto_ll_ops ufs_qcom_crypto_ops = {
 	.keyslot_program	= ufs_qcom_ice_keyslot_program,
 	.keyslot_evict		= ufs_qcom_ice_keyslot_evict,
@@ -341,6 +350,12 @@ static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
 {
 }
 
+static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, unsigned long target_freq,
+				  bool round_ceil)
+{
+	return 0;
+}
+
 #endif
 
 static void ufs_qcom_disable_lane_clks(struct ufs_qcom_host *host)
@@ -1987,6 +2002,12 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
 			return err;
 		}
 
+		err = ufs_qcom_ice_scale_clk(host, target_freq, !scale_up);
+		if (err && err != -EOPNOTSUPP) {
+			ufshcd_uic_hibern8_exit(hba);
+			return err;
+		}
+
 		ufs_qcom_icc_update_bw(host);
 		ufshcd_uic_hibern8_exit(hba);
 	}

-- 
2.34.1

