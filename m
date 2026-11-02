Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617646;
	b=XQWvruvweOCE8uC+DtvzjxU2ox4B+gfIRbY4A8ZcadG1x/Qr/WGy15x0jzkNaKI1ea66
	 YCWjm/UN7kZ938C8VN3Jz/LrKbjkc/ndla6HU63zMLkdbht03iCSPImKdjMqsmPAbYl93
	 XvDI6M/jxtH99fPYHGp+shgUP9C4EZNuh7O2d60qgvujsD++9DVmVlgh3ZN/7lCDu8iMF
	 MJx5+i1FBJVSmSh3YGH3HFXBaZFcvvkz4wTShwKmqBTBLAmrg7gni0gIAfO2IC8u8Q0ru
	 XShk7O2xzk9JiSg2yItNvpbLHvTGFQqYh8DRTxM+B0smVO0PczAG1yza5aoyoDKa8tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617646;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IomzRdt99bekLdCNuT1PRZtlRcbSbbUP/6u1Mv3ZjDs=;
	b=sAl+fHfL/whMSg3MPInz7brTFGuJow5kji/7Rrk0GKOPqCG1vzVAse3YF8sayy5ADQgz
	 w8gOVe+o/4xljGhRo6I02nH90u3Fs69TW/oP8THawaQD82QW1wocim1jvicNwSQqDgcsi
	 jxWRLXpcL425yYthS8gBn/HWhp53r/z32zuJwKL+mqWHhU2xbdSiN56BDhWEX7zB3s6sY
	 YUIZwCsFX8Mri/UQeVL6rDrxn0Qj3V1BGEyQ5CAzvhEqQyliVcp4b0Z1Rw8ab2ZmjaWsw
	 YfnFja0gvfaFuhNwZT3cTR5pHesZ0dTIks99ozyg1i3DU/JjFt9iOXrSy1moban5UcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q25XNqHr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XsjFkGHh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53442606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53442606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q25XNqHr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XsjFkGHh
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AEsf260818
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 11:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IomzRdt99bekLdCNuT1PRZ
	tlRcbSbbUP/6u1Mv3ZjDs=; b=Q25XNqHrLceOHR2astg/IecZv2nAFp6g19j0Qc
	3wAFIBEnhDToIVBv3hjEADJLGPa//4PXKPaS211cOMERYKkUYqX5VSxrDWFiPgDg
	+Zpj8uC4giAFZWhaGkMUvnTHyijsLzsfSh5/vr+0x1waeiH6kPWapyqXr/n+qtb6
	5Sr90q6XD2saKufr/oQEN1OIwJEOMWbWgUI+VkEQOKIvbwz9uWnmA0+8aRkumdTf
	tuHPVdRR37FxZP+aE4YEHXcMOIl35KFgczq3SvczYH48Gb7s116YkwFZqfdTPf3r
	28R7QdDAdlZeueplgvLYSdZxZGcuMugclTyJp/4QjhF90NOQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvrf7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:07:25 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc06b9cb33so469990137.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793617645; x=1794222445; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IomzRdt99bekLdCNuT1PRZtlRcbSbbUP/6u1Mv3ZjDs=;
        b=XsjFkGHhPj4XSuF6eOPN28/2AmKXnh4G/b5LL9gw9CTo44ivT8Fw3fkWYSOTJ7bd7x
         bdxXu6cPWlUSlh3EgJkJsxjUpKXQ/JyKAhM2z+E67Ty+iOwr51Gg+3oMOc7EDB5JC20g
         m1L8DS66qcxLkD90gMwM09xj4kRLxNTMmFD8niSJhNjGB4OeRCMZpg+Jpclpd/41TtF0
         QUlAyjADYdoGm2WF0ueosrCsYsj8qkDvT8jw6T8Ey3MRC+PdoBZ3tCRaFhq4oSq8fb0p
         fLyAfjJHqzZjrTu3BARrtTF7DZ5LsrLgsvWQRUbn2vp7cDQfARcLnhspC2a23jHoV0Bp
         RvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793617645; x=1794222445;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IomzRdt99bekLdCNuT1PRZtlRcbSbbUP/6u1Mv3ZjDs=;
        b=QEKarGuK0TtPfFY4oVRCyr6w8tWGfr1SLSAxzZjgBhsdvc58J4tSQN60Lk8EXhxzzL
         uApf2/t/SJUt5A0dSHKWdzmbOaeLx9ZJWveQ32LkN0vGWhvPeOCQjN5XgAWIa7vXSdA9
         HTvvFZgU+Z4WwllnTIZS5mVvqqvj9eFP+oM5WqFgaP2B6P7VKN9Dn9w5w/jOebjg+Pvj
         aQtixok/pcvmGnhbp6CPt8pjItjuKi4C3NTLm1Sxei1ZBIS/FUgmDQb+C+KvE+L5108u
         OLfBi7j8pRroPrqwetvnPl4U/9mJ/q7nAAxK3UGmDPsdTyHHwkQ91n6R6+4eo1TDLGwc
         hzkQ==
X-Forwarded-Encrypted: i=1; AKwUvBw7D/y9y2IJU3Swxz7Q2qrbJ3+LbDZBAQEmYSK5RAFfDxfZnOzaMJVKRAMlwdMvNrx13Sg9zwRGZEm4ne4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CKVWUMiwEWXP8eLRFcqkBLFXt0NycSSitX9zUpU9x9u/hPiNJ
	n3pmPcYngNfIldl1dBxyfzrNOoaF5996K4O2PvbWUPjsggUx2gEIBh0V4qRji/uiyoojGd+fP+N
	lYdBPaiMIjeg8daWOqtpiHRJuNnFOtKYvFbugyg1ei5zs9RkFj+WMKCf1owrpv/Re4A25DHoYLO
	1rEw==
X-Gm-Gg: AYBFou100tdcWTflUcLJnRDSYTsrPFBUhCfBIRaZJmK87XaIztQ2ENdpI+j6zXpbCob
	boaJIZIxi6B02RKO3kIFDzifk9bI1AWPhCdUODkky9XYE7j79ZqDKTb6T6lmvVlS7y2JDeg/Y35
	AeHY46c77wMpcDJNBZxnPvqK1J2HWhixBc+7Jd9w7hz+Moar9/c+pg14wRNL1kuGG4LuUjhdt3i
	yc4I0HPUs6vZjWVewKZIbh2PZqzmf6WGg/vNvjNG5wnzAbMMVWccHUkq+hVP+QsphkayunOYcBP
	B+2ovSzY7nmopB5vs9LTRRxY8gM9ZQJ8MjuDQ2bTxCmglpbcMjXID//MW6INkNMQABuNs+1VEah
	hsJGXSblL00Nvk1/jiWt8eKxLpZYM20ttRbdaOMCfeEt5Alaqa3f1CLDyiA==
X-Received: by 2002:a05:6102:509e:b0:7a7:366c:92b1 with SMTP id ada2fe7eead31-7d072605b45mr3152853137.23.1793617644402;
        Mon, 02 Nov 2026 03:07:24 -0800 (PST)
X-Received: by 2002:a05:6102:509e:b0:7a7:366c:92b1 with SMTP id ada2fe7eead31-7d072605b45mr3152844137.23.1793617643745;
        Mon, 02 Nov 2026 03:07:23 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b7815fsm19934660f8f.22.2026.11.02.03.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:07:23 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 13:07:19 +0200
Subject: [PATCH] soc: qcom: pmic_glink_altmode: Fix use-after-free of work
 items on unbind
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
Message-Id: <20261102-pmic-glink-altmode-teardown-uaf-v1-1-377d92e3b5e2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOZu6GoC/yXNQQ6CMBBA0auQWTsJUxM0XsW4qNMpjkJL2qIkh
 LtTdfk2/6+QJalkuDQrJHlr1hgq6NAAP2zoBdVVg2lNR9QanEZl7AcNL7RDGaMTLGKTi5+As/V
 4ZvbdkZzQyUOtTEm8Lr/D9fZ3nu9P4fLNwrbtBRLgzoMAAAA=
X-Change-ID: 20261102-pmic-glink-altmode-teardown-uaf-8ccf631de17f
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3126;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Uh4HXhNmZ/dbNQnpFph6ZfzvN/m1Ht64robNo+er9B4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6G7pH0g/feQCMez03Uba7RYPX0g1h14HOSBKm
 SvOkMuHJcCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauhu6QAKCRAbX0TJAJUV
 VgBND/4y6D7iGbNsOHfEcxKY3hqlFqI1Tch+fxThybt5vM46stYHssjyocLm2kY+pQdQq7olJGk
 73p6RjWxsL3JBkyzZv5iKyWg5TrRRwYU3EK9kgXwXg+dXUrlY4yq68nFc2M9d9QUdmoGRQnY+FL
 miNyLypisYtC4NfDkv8no+DusnfitW2kiuv79Lh32V353i110nywTmB4+VKsyM2u8Ey6eoSGK2y
 edfQXzMMSO2JO/QsclwS5HmnMsSSPBd3qCXKzN3EhsstdiPZAbohb3XIIY252LtKqQEoMTJBNE7
 HTuEKTfByEwJ8/evJkgEw/7D9Kt1qasyCp5nhSIdq7yAHIERfQ9h4BO8XiRO8WBYXfTehxxUz+P
 AS4cWZS4ndyKo8tH4ahMT9KGMbffdX7Vi8/gXM5kW6P6inZrv/YZB9n/gQjOPv/YwHLDtXk/Zwi
 Wl0ySplGtBmH7m4RyTz24c1uuy9SloROodU49SffmGHiesA83xSP/NkZ6FzyRl750BLBMZaGZEq
 Sh2zeVyPKKCxpaQhpwLrn0oAduOSGI9xcC4yeC5suQfOc8d/1gadinPWDAtClUM7JWWp4AQV136
 gojIeqzcf9dUQWg8+cVmDqT9lyQks0ROSVgI7L0cujXi0oymShvCDGujy1AfvG+1WA261sVlN6Z
 uQsGEJ1uGRUorIA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae86eed cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KrGhH5gZDbmhOXNytT8A:9
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: weyjt5xybhvtq3LX_yNjEILCT6eV23pR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfXyDs12AflkAe4
 qloOT/LEpqHP0zsTjLAxKQj9ICx6D3/UFr7K0z8losUtixdioFYz4GJiINXBBvVaLHvtN4vXmWG
 bMKlUy3dUeW3/mK5LGy1IurI6WE1/yU=
X-Proofpoint-ORIG-GUID: weyjt5xybhvtq3LX_yNjEILCT6eV23pR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfX5sr+N+8oc5Mt
 GG4xQ9NJwHv1qvsjf/ArQ+5PFKqTTFBzOzGQXU0eaj0+ejaz+S1l8nHdz0aa4Kbu9y1PE78mza5
 A62Af6rO93AYN1CYO87Vax56hDAcaArV9Eu4QuasE+dqEvJN5mz9KN51hPXrFq9priSRTyzzlbf
 aW5Iqac7sWURC0VF67S6t1z/15V0XC0zHt5aVFrzmyM4hpzirWfaIF4gwfMHkm+ErG9XR4grh/Y
 1w1zo7tkKksJNZfBQgt1NuAR95DQTy4bYvwIHyA89drlEp2SJUeccimILMGVTTLbaKYhgyU/r/m
 8DDKxvCrVmE5EmatilWNvt7rpMOxFZmEnxtH5MnpWOJf1fozT5DQoNaMQgyYkFCO0GNeGcY5ljf
 g5NoxSoFciOyGHSdQWY6wdaizdiboAtuB5mBADmpCYpdsvkAmSPSBqhfF3iCPnBXtKgZPfYS7H4
 wlUWJjx6+FVXXmTl16w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020044

The altmode context, including the enable_work and the per-port work
items, is devm-allocated, but nothing cancels the work items on unbind.
A PDR or GLINK notification can queue them on the system workqueues, so
if the device gets unbound while one is pending or running, devres frees
the context, the typec handles and the pmic_glink client under it, and
the worker then dereferences freed memory.

Cancelling the work items is not enough on its own, since the client
callbacks keep queueing them until the client devres is released. So
register a devm action, right after the client is allocated, which
disables the works using disable_work_sync(). Devres runs actions in
reverse order, so on unbind this happens first, waiting for any running
worker while the client, typec handles and bridges are still around,
and making any later queueing from the client callbacks a no-op.

Fixes: 080b4e24852b ("soc: qcom: pmic_glink: Introduce altmode support")
Cc: stable@vger.kernel.org # 6.10
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-762f89d1-07b0-45e1-9557-bf643a826aa1
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Prepared with help from an LLM-based assistant.
---
 drivers/soc/qcom/pmic_glink_altmode.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 465e5d2316a0..3f6d3290d29b 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -543,6 +543,23 @@ static void pmic_glink_altmode_put_switch(void *data)
 	typec_switch_put(data);
 }
 
+static void pmic_glink_altmode_disable_work(void *data)
+{
+	struct pmic_glink_altmode *altmode = data;
+	struct pmic_glink_altmode_port *alt_port;
+	unsigned int port;
+
+	disable_work_sync(&altmode->enable_work);
+
+	for (port = 0; port < ARRAY_SIZE(altmode->ports); port++) {
+		alt_port = &altmode->ports[port];
+		if (!alt_port->altmode)
+			continue;
+
+		disable_work_sync(&alt_port->work);
+	}
+}
+
 static void pmic_glink_altmode_enable_worker(struct work_struct *work)
 {
 	struct pmic_glink_altmode *altmode = work_to_altmode(work);
@@ -695,6 +712,18 @@ static int pmic_glink_altmode_probe(struct auxiliary_device *adev,
 	if (IS_ERR(altmode->client))
 		return PTR_ERR(altmode->client);
 
+	/*
+	 * Registered after the client, so that on unbind the workers are
+	 * disabled, and any in-flight instance is waited for, before the
+	 * client, the typec handles and the altmode context go away. The
+	 * client callbacks may still fire until the client is released, so
+	 * disable rather than cancel the works to keep them from being
+	 * requeued.
+	 */
+	ret = devm_add_action_or_reset(dev, pmic_glink_altmode_disable_work, altmode);
+	if (ret)
+		return ret;
+
 	pmic_glink_client_register(altmode->client);
 
 	return 0;

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261102-pmic-glink-altmode-teardown-uaf-8ccf631de17f

Best regards,
--  

Abel

