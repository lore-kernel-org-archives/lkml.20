Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793659393;
	b=HmNUWXOtz/gOvEUCvY5zoAwGdJpn/g2O7siDnqpgXSpAkZRcvFpA1KySycXYP7jXCSvQ
	 aAC9zJjUJx3jEm+rY3Yq7+gDIRkZHsWwyzQhVgmLOh0oIwmy4zSAEonBbFh2n5nXkFK+Z
	 SFUQWb+5UqIwl/wmF+vtK7h8Lx4hB9Iamf9LRsLhTE1Jxmf1o2N0dLF+uskRTDo9/atrk
	 rCmR6CCa4FyzjHKiW0v8rpZWNF6mwbT66jG6hn2XiemUiobhBFCVG79iLJTC3oUCrSOr+
	 9CCqQAMhqZXjZud8m9fzHDDjajbYMvcC/LxBI+MBAmcY2nQpjesvodN7hYjEoQ7sPQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793659393;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ld6LhVyW9FEP7YniLiZY/+QYzHS7rYhgNhRztid4deI=;
	b=aepNS4m3a0H/XFO2ADrv6dB67zPVqCs0OO2q4M6fyPv7ZYwJmaWZ2uV4+oxzNDo6RBty
	 naGD/6HWllGmzK8Y36YPDlBnLiGJoYlXqYFuzP14mgPwZCw1pRmXDizDE5FbE+FAkG6i0
	 8zfRRJ73KCLHxayUaZm9FWp7y7HzGBRtg7B2Fmd8GwgrGeEY4j2Yznn1Z+DeS3xgASGlg
	 HFmO4oO6U2NTZ8yRl0oYC1zOcUmYsP+65XPaCM6IckTBXFdXWW5TLMyIUPcHs0jcbxwx1
	 Jq8Kty5zwPgVW7Ep/jNxiFyMcF4t0x8TEFeUrlk5fA56T4FYdaf+AQq1lfzCEIik18w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b0k7+cIw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T7KPWVS4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAD5606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AAD5606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b0k7+cIw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T7KPWVS4
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K6PcJ1301321
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 22:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ld6LhVyW9FEP7YniLiZY/+QYzHS7rYhgNhRztid4deI=; b=b0k7+cIwLROhKG0n
	Unk3lCGzZsTIpg0kbhsO5t/G5mcYeG0G+8WkeYuU3f220ikrtwQTsVPfSBbNJbXt
	ERFJAHnH0MgFSkVvsbI+0gvn/Vi657ZVolzG/G3gFa59MbO4GmhnjTChF56spqs+
	bgUV1rUaq+EKu7xftML5GpiOLswWr7AaGooAmK0UlkfvP4FgO2f+HLnobGsrQOrM
	X63cvwOI+fQfQdmEVF1uXOJv7ivQj9U807/FWTSftwkUOyfMCmzQ2wS8/0sF4Yzh
	bV3ssNkooL0ym2bYQ4IM//Z66tALxuJMZNORpDtdHQTKvqFxLs0yE4upP6QWRHPc
	cDp5sg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsa6trq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:43:12 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a190c53a3so200999eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793659391; x=1794264191; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ld6LhVyW9FEP7YniLiZY/+QYzHS7rYhgNhRztid4deI=;
        b=T7KPWVS4LKUka11tNq0ump7lJnIKAjcAZldpoo0wXOiNJjWEGdbbGgrI8S2EvSP8jW
         UQsCgMRkScCMAiE2FyULb57pmP2F3gZum/MShKcFnozqKVI0v4/TK1Oe1q2m9/xEZn79
         IrrDxKEwZLV2C7qfESGMoz5UJ6tgQmWY3Rs687vit/QF+FHykU33DCHkyukLdoYahxu0
         mDNKujT1k8lsTdkwui8hDYeQFe6MPaBqTVB2K8AOsOdJj6kgU7xNJB34qXRMJF8Hw73d
         050vrdm1ZY6zz6hnDf8kV99hsJJRZshXi3SbmnlJHpDvm3x4KyORMdIbhb/uNfv9M/3I
         Nv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793659391; x=1794264191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ld6LhVyW9FEP7YniLiZY/+QYzHS7rYhgNhRztid4deI=;
        b=YDbWA7iPs6mzJsynh/tN8fB5E90XWASSszv+9ByehdN9Y8Cg54pzOyMROmNO6JE+eD
         FOmPlo2655kQPBVlQXcGO9hnZLeSNwhaRcpEspofKERF22jZ/7hhDyC2hHaGzzTtPssz
         y2z7qAXcVh6cYydrTb4U2i6+NR1S0XeJUmRFklHyTSFUPSGqDYndHTNS6tWECcV5N5Fl
         blEuNPjLGfLl5sa9acm6s1Y41H1B1hRn3+zmzBv0BA3hQ4I+1qarBlNvTeemjwUfJkR0
         /zVBOqmvpFMJP+AJirFKXCeD1fzY1Rk3aqZba8Zi+V/hjheSw67y7fHVu76hxQkZ0A/B
         ECig==
X-Forwarded-Encrypted: i=1; AKwUvBwdchLEHoIi5TbAUSGm2P1cokdqL+XS2R3/ad6Ct2FcJT4viB2FzZwIOaBodY1+BYUVSdMqY5VMTgJVd4A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KK9BfXFNr+HJQ5hAmgZESvB+hiu9Dv5fQ8zOQd4oitsmG8pr/
	+uviMs8xBQDANsVsnHw85XEyfIXWJ9jD5ZeA4xnC89Q0TafPX70Z/Ng8Im44ogFbTeLu6FHyyFh
	cj7PNQ1ELh4UJgrEX781fCzTzs35g24ic3ZPeLxzLTFqBsfJc5pgbufam5FsRO1Nx59k=
X-Gm-Gg: AYBFou0sZntAY+3khEtLOz8b3FyC2wA9VH2elrv9vOMKGti6ZWHodHVIY9tovwfGSBb
	ASnGTaWQ1cK07xz2W3KkowtDiIBJm6qlegHS1VqETb2AS2en1tiHzGQimRHCUiu6neHEdVAOdDv
	PfP8aJGLlOmnTXKFUkbNsp7an47J4w2egShn4ThWqLsj95UC4Ip6NRX9tg6QOjBhV/019wnByX8
	IuM0a4TqnCKtcBn2YllBTjhN7GJqD8AqftxS/KDTyCCP0WxAG1f33Iil3NjQyQi9ZWSqO84L/vh
	kxKBTil67nIW2EbO/qPMOkc13Gy5xpcIjJblawLoVFXCJ51eHZCcuvxK7jjyKopl3WKN70dBwBT
	XyBr+myjhjL7shKAL9s1fSFpM/BpE0wg9Mm8Qxf29x7qlKPNM0AeEov1iIyxMnVM9gWU5SuTbg/
	EPUg==
X-Received: by 2002:a05:7301:4d12:b0:369:dc59:7a6f with SMTP id 5a478bee46e88-36a422042d2mr16078684eec.1.1793659391100;
        Mon, 02 Nov 2026 14:43:11 -0800 (PST)
X-Received: by 2002:a05:7301:4d12:b0:369:dc59:7a6f with SMTP id 5a478bee46e88-36a422042d2mr16078652eec.1.1793659390376;
        Mon, 02 Nov 2026 14:43:10 -0800 (PST)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm38673319eec.19.2026.11.02.14.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:43:09 -0800 (PST)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 04:12:17 +0530
Subject: [PATCH v2 1/2] soc: qcom: pmic_glink: Add RTC client support
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
Message-Id: <20261103-rtc-glink-cleanup-v2-1-895eb6e8d890@qti.qualcomm.com>
References: <20261103-rtc-glink-cleanup-v2-0-895eb6e8d890@qti.qualcomm.com>
In-Reply-To: <20261103-rtc-glink-cleanup-v2-0-895eb6e8d890@qti.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, Raj Aryan <raryan@qti.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793659383; l=5457;
 i=kamalw@qti.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=VbRGDTprBzSsCqGCi3QW4SniYo9NQNb/RvBM7iC9mUQ=;
 b=JosSEdSweFLmvhz7vIJ8SVJumWt/rt0x2iD/dZ6PqxaidYYZeAreMwhZ88TItmF1P0FHz28DZ
 HFrjdSyppfUB5GUGwdgH7cgYdFCwmJgPWvNCb5j6IXN5K4clcCuYpj0
X-Developer-Key: i=kamalw@qti.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4OSBTYWx0ZWRfX7EV+8SmhryeM
 RdfKBzwRWbTkTJBx7mq8M1r4GMaNaZp9x81FhdeO/d0GhpH0c3XKCB8dees6hwE8+s+SHGbMvtA
 jVsvfv+mEWQ1WWcfkREvZpKsdBCKQAM8LXJCXrXlQogBAO/7BUkLxrTVjf1NQeyA2PBYS+hGGcf
 qWTjK9WMriL1ehiHPm3fF9Gd5UrgdNakdNtw4KIAx+ksXjPo2OiWyhFaGtg8KnYnCDLcsjqFp3M
 hac4ggnGls1/AJ9nJkjC3iBm5DJuBSyH7Uc+7TvzWSCE1g2Zddjic32kje/ijsAbrCgTiYKDuyz
 J89PisOzomtdddKCaNDnuZ3DWDUoDF7qw8K5C8lSYIuBX/NsyDFE6UNsh13eeUGqo/97PJOUmFC
 P03ZvXFSjkC2Hpm0SY38Pqi4CFOxHORAvGfIgxiuT3Zmzug/LQKksy1te6Msz1t/ZZ5Dr7GSxyO
 W7Tv8joNcZHDcRps+4Q==
X-Proofpoint-GUID: YjE97c4A2wJGCFLdsSW-G40gK9ovpABu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4OSBTYWx0ZWRfX+D6DhVgz54st
 C6wEAg38cPKC818YEYWODBo9OjCB03lztWKAirhOm1iDXRAL77TbPDUnyF6t1knempqPV4spGVO
 /xuV7YYIXEtTQLa+O2cisPoJe7R9PKg=
X-Proofpoint-ORIG-GUID: YjE97c4A2wJGCFLdsSW-G40gK9ovpABu
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6ae91200 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=p-V9VznDl610eMi3XWcA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020089

On some Qualcomm targets like Hamoa and Glymur, PMIC RTC is only reachable over
the GLINK interface, so add a new RTC auxiliary device ("rtc-glink") to let the
new RTC glink driver bind against it, mirroring the existing
altmode/UCSI/power-supply clients.

Also add pmic_glink_client_unregister() so the RTC aux client can detach from the
clients list before unregistering the RTC in order to avoid use-after-free issue
in a scenario when an alarm IRQ is received during teardown.

Enable the RTC client on Glymur and Hamoa/X1E80100 variants, as only those
currently support this RTC client from the firmware side.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Raj Aryan <raryan@qti.qualcomm.com>
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink.c       | 43 ++++++++++++++++++++++++++++++++++++-
 include/linux/soc/qcom/pmic_glink.h |  1 +
 2 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index 84fd0c82c0c4..8af6f4a65e61 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -21,6 +21,7 @@ enum {
 	PMIC_GLINK_CLIENT_BATT = 0,
 	PMIC_GLINK_CLIENT_ALTMODE,
 	PMIC_GLINK_CLIENT_UCSI,
+	PMIC_GLINK_CLIENT_RTC,
 };
 
 struct pmic_glink_data {
@@ -40,6 +41,7 @@ struct pmic_glink {
 	struct auxiliary_device altmode_aux;
 	struct auxiliary_device ps_aux;
 	struct auxiliary_device ucsi_aux;
+	struct auxiliary_device rtc_aux;
 
 	/* serializing client_state and pdr_state updates */
 	struct mutex state_lock;
@@ -118,6 +120,17 @@ void pmic_glink_client_register(struct pmic_glink_client *client)
 }
 EXPORT_SYMBOL_GPL(pmic_glink_client_register);
 
+void pmic_glink_client_unregister(struct pmic_glink_client *client)
+{
+	struct pmic_glink *pg = client->pg;
+	unsigned long flags;
+
+	spin_lock_irqsave(&pg->client_lock, flags);
+	list_del_init(&client->node);
+	spin_unlock_irqrestore(&pg->client_lock, flags);
+}
+EXPORT_SYMBOL_GPL(pmic_glink_client_unregister);
+
 int pmic_glink_send(struct pmic_glink_client *client, void *data, size_t len)
 {
 	struct pmic_glink *pg = client->pg;
@@ -342,6 +355,12 @@ static int pmic_glink_probe(struct platform_device *pdev)
 			goto out_release_altmode_aux;
 	}
 
+	if (pg->data->client_mask & BIT(PMIC_GLINK_CLIENT_RTC)) {
+		ret = pmic_glink_add_aux_device(pg, &pg->rtc_aux, "rtc-glink");
+		if (ret)
+			goto out_release_ps_aux;
+	}
+
 	if (pg->data->charger_pdr_service_name && pg->data->charger_pdr_service_path) {
 		service = pdr_add_lookup(pg->pdr, pg->data->charger_pdr_service_name,
 					 pg->data->charger_pdr_service_path);
@@ -359,6 +378,9 @@ static int pmic_glink_probe(struct platform_device *pdev)
 	return 0;
 
 out_release_aux_devices:
+	if (pg->data->client_mask & BIT(PMIC_GLINK_CLIENT_RTC))
+		pmic_glink_del_aux_device(pg, &pg->rtc_aux);
+out_release_ps_aux:
 	if (pg->data->client_mask & BIT(PMIC_GLINK_CLIENT_BATT))
 		pmic_glink_del_aux_device(pg, &pg->ps_aux);
 out_release_altmode_aux:
@@ -385,11 +407,20 @@ static void pmic_glink_remove(struct platform_device *pdev)
 		pmic_glink_del_aux_device(pg, &pg->altmode_aux);
 	if (pg->data->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI))
 		pmic_glink_del_aux_device(pg, &pg->ucsi_aux);
+	if (pg->data->client_mask & BIT(PMIC_GLINK_CLIENT_RTC))
+		pmic_glink_del_aux_device(pg, &pg->rtc_aux);
 
 	guard(mutex)(&__pmic_glink_lock);
 	__pmic_glink = NULL;
 }
 
+static const struct pmic_glink_data pmic_glink_glymur_data = {
+	.client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
+		       BIT(PMIC_GLINK_CLIENT_ALTMODE) |
+		       BIT(PMIC_GLINK_CLIENT_UCSI) |
+		       BIT(PMIC_GLINK_CLIENT_RTC),
+};
+
 static const struct pmic_glink_data pmic_glink_adsp_data = {
 	.client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
 		       BIT(PMIC_GLINK_CLIENT_ALTMODE) |
@@ -404,10 +435,20 @@ static const struct pmic_glink_data pmic_glink_soccp_data = {
 		       BIT(PMIC_GLINK_CLIENT_UCSI),
 };
 
+static const struct pmic_glink_data pmic_glink_x1e80100_data = {
+	.client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
+		       BIT(PMIC_GLINK_CLIENT_ALTMODE) |
+		       BIT(PMIC_GLINK_CLIENT_UCSI) |
+		       BIT(PMIC_GLINK_CLIENT_RTC),
+	.charger_pdr_service_name = "tms/servreg",
+	.charger_pdr_service_path = "msm/adsp/charger_pd",
+};
+
 static const struct of_device_id pmic_glink_of_match[] = {
-	{ .compatible = "qcom,glymur-pmic-glink", .data = &pmic_glink_soccp_data },
+	{ .compatible = "qcom,glymur-pmic-glink", .data = &pmic_glink_glymur_data },
 	{ .compatible = "qcom,kaanapali-pmic-glink", .data = &pmic_glink_soccp_data },
 	{ .compatible = "qcom,pmic-glink", .data = &pmic_glink_adsp_data },
+	{ .compatible = "qcom,x1e80100-pmic-glink", .data = &pmic_glink_x1e80100_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, pmic_glink_of_match);
diff --git a/include/linux/soc/qcom/pmic_glink.h b/include/linux/soc/qcom/pmic_glink.h
index 7cddf1027752..c78dc7a8c99e 100644
--- a/include/linux/soc/qcom/pmic_glink.h
+++ b/include/linux/soc/qcom/pmic_glink.h
@@ -29,5 +29,6 @@ struct pmic_glink_client *devm_pmic_glink_client_alloc(struct device *dev,
 						       void (*pdr)(void *, int),
 						       void *priv);
 void pmic_glink_client_register(struct pmic_glink_client *client);
+void pmic_glink_client_unregister(struct pmic_glink_client *client);
 
 #endif

-- 
2.43.0

