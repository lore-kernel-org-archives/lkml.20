Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482802;
	b=yy8yNObWCwzEymAde6jXusH0NJA95qFFGSAYBE24WA2W75rnEvt90D/G7hz6tmGXL7sA
	 mj1gExCzAFuylMxj9whNK1kZH8aTds6MmA6CKtC+oeubD/cFE7IGMotJkO6hlo4HZ7Lqx
	 iNgHFNWahinU0GSBtu+X4OMR29AGY6taTTr/qY/9DWyPMiR2dx79tN78cSOodpNUzmqIt
	 TLVcrIwOhySZgMZlkv6EfU+Pao6wwpzxDGoyXRPJ2vzMoTM3B1Zid8ihjis1FbP0f8BLP
	 cII1sp2z0NRZ983KIaqvWHFxlxH57ssQLDHs7i+hVpb7yZ9gHujUOk/zhDXbfwgvr/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482802;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eX+da1b+MVcHID5GzcHj7M4eExkMrlV1smciu9FI1s4=;
	b=TEByfbemDQqVOhJ9Ev1br6Bcv7TWfJvqciNOkKVHRXRZuu5psf5L2/umyaEvQ6shLjrb
	 ikpwNDCEFv4vF7BDg3rUV4ie6+eoY3tQDmzwYfOU+5ZZArbxa0akpRccniLYaDi/1qt07
	 s4vkWhywPq+S9F6OMPF70j82XI4VdjwsTC7nYKyQw2TZ3kfwSQv7AZzLSSMf9iOyydQOW
	 0nBi6cy2afeOUhrT1GmZwTtRU3CKidiIeePGMkAoKJGcKTgfsRJWYasANWRTAtn9RA5Wn
	 XZRiNVA5IogmG89bRAlbHkmqmJCfWxvMjn+Isz18781rIeaLZfvPx62f/IZwVx7/beA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nlttWxlm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B+9dzL2l;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3365160A5BDA
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3365160A5BDA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nlttWxlm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B+9dzL2l
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAUVdk1629181
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eX+da1b+MVcHID5GzcHj7M4eExkMrlV1smciu9FI1s4=; b=nlttWxlm7ef8wzNf
	xAibSwWx8YCu3ggPZ2uKh8kuKX9HwyFLxZaAHyHOA4kS8nSHds3nNbr0WWwxT+dn
	kTZBTvsAOfZDT+Of0HzTr3h6vkAgI9KkRSIxIoNrJnADDbfJtzhl8KEBWqPfwOPu
	1eQS+Xmmr1mzHnoVlUS9E95PBXq+5ludQIMNSmTO2/1KPTLV9YkTT1UhDu9ND1JY
	YAnYLbALR7N6B14IzTzVXd2qm1zzjASKHlwqQHi44ckvr0DdkdYo3TkUSNUjOp3O
	ajBrGufYY8+PznckZ04+bU12BA1h1wcebIMrvqLVrJedNvvtX9pE7Tm7g8XygC8l
	fMFErQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbs005mg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:26:41 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3724667bc16so480178eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794482800; x=1795087600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eX+da1b+MVcHID5GzcHj7M4eExkMrlV1smciu9FI1s4=;
        b=B+9dzL2lUD+hm/QX//a63twJKgYXzsnYboc7jwZARzmBWwHnpK+7fhmT4aUUtNU7tM
         lIUpcNsWaK7L3rTyCljgnPk5iSCv8xNGa89Mnazl523qdEGnFvn0JsUzqJq66A5IeieG
         E7mM2676w9S+Lvt7Hri/OfrQBi0ZwoiLPiT3srZ/PF0AwhzslaNiiZq0IIvU0WQEtFpP
         6ZIh/Jz1NhHYi88G/uWBA5yDfpPBlRkAkqVXIggvr/8KDYPdiroSNBZhkUY/JQ1aJ/c4
         80gPXkTBLJRtAe+EdlIz3ZwWQViktjabvlTpaJVduSHhpXrfPSgurW4MbhwossnKl4jR
         GHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482800; x=1795087600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eX+da1b+MVcHID5GzcHj7M4eExkMrlV1smciu9FI1s4=;
        b=pSfMwa8SyJe1sPc6BQJA0qaqMG5Dq7pgMtj4ke1RBb4siwCwKw5lIrCwDO64t5U9bJ
         JovSOcxicb/hGp7JQ6oT5UxJCy0GHPH1y7rZb/pZf8JhMDUTxoRYZrbMfa7pu00gu4nt
         QdV4N1gt+mZlg4ajwXtPHcHEs+1zZiWKshMI8/vty16tBOKd3J9scp4wvIzpani7HCnU
         UjPHWdvXMkBlHEeVTsi8MashrHryV0zyXla3Oh6Jd9+lJQFPaBhsa7nSiA3j5T/RU2L9
         O5+OWEg2K8l3AtoswAtI5XINDgJiNRvvro1eXobG2qvioKVCSRMypypvhK6jAbRbaTAl
         y3sw==
X-Forwarded-Encrypted: i=1; AL+hErG2cIqtY6JUDgctY8FF9rSk4OVmBwLiuQQTmLNmkuiQkoZZmphe+lrhdlX8VTROy0AVrnEaiRBw50/jDT0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/muXiyvRWyhUKYWiJiFpvmhEdq6Ms2T+3BxzNEWnkweX2JRQZi
	W33q7+ee5V47VR4/ntYA2YefDMWFupPXa+mfWgxwV/O7IVNfb9ihy063FMiQ5g4vse/0mENt/V5
	IZEs9gGAjgOCpZjvTdU29tLXNYVqGy4YtlPZRpGjV19rdkFhYikR3KaL60gCIdDzcVDk=
X-Gm-Gg: AYBFou1gfVgqcMkDhFOyVQrPycXUbz3Bu+nHuczsHHzp47FKa7fSYLrbokfT+iHQRWs
	l3IiGkSZctl8mPBe1otEVWJob5eZzyABqIULE8xrHZuuSEEhxSui09wLhaQAfQGM3B5+7Nwh273
	19p2xmW7Z6ERHCJ7uLxpVN6xcmHsxuo5Fzktdf+b2tj52rMy6s+f68l73LThvbhI+U5KIaJqlhG
	DsSXsBW3hFU+FLU3fW96CFwF8ctenwumTxHgKK7+H2zCV8/sf4U3FXxBPwlFnNg54zT/6ij8ZKH
	VRI/XuHRDIeGc2MBfLfm2U7UriykATIphSjKaz6ZAoLXXGM43Cq6gMtCXOf+J54Q2AR9sFxCFfQ
	50tUMSv4XlFht+AHoZ/GFDKp1oEJ50n17EEVB6FvCCRADIQdZXL8FwsC1MKOrVBeaoWcW2TPmbq
	nsfE+VMdtK2GX+09IqCUVleCOf
X-Received: by 2002:a05:7301:1602:b0:369:f17d:efb with SMTP id 5a478bee46e88-377e1016141mr1890712eec.10.1794482800040;
        Thu, 12 Nov 2026 03:26:40 -0800 (PST)
X-Received: by 2002:a05:7301:1602:b0:369:f17d:efb with SMTP id 5a478bee46e88-377e1016141mr1890695eec.10.1794482799404;
        Thu, 12 Nov 2026 03:26:39 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm30402359eec.19.2026.11.12.03.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:26:38 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 03:26:09 -0800
Subject: [PATCH ath-next v3 10/10] wifi: ath10k: drop async writes and
 sleep timer across power cycles
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
Message-Id: <20261112-10k-sdio-crash-v3-10-24f03f300bb2@oss.qualcomm.com>
References: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
In-Reply-To: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794482788; l=6579;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=CbJZGKXefg/gwrgcyT9QBK0Y0s7aG1/Z1G07SIrXXps=;
 b=OU9GbDNRpHQE3xpmQtcOW2RZiMzweHwMnf+34uKU9jpUnTKcWXsdBMCvpeUIAti+7ACtlitmh
 6fR7VkHOAgBCPXF3plaCju+gAN+T0/Zry/TM7yG0tuuVEj7phIFtqa5
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfXxI1Y0QozBigE
 Ka86Z6tRBmG8/7NTi03ns2vLEiNFB1a5CvLROJuNG7VAH/BIQKan4gJGGf9bxfvPtRD455DpQEL
 /Cl7h1FvFpARh0fM3QvFEYgWEO3VZKvppIYgJu78Hnc0FQR8bqkqj5Ts3Rnm7IN1MQ9fI2uhWQb
 0rG+yJH7wxvFuIe7ADGJx7MLTS4U86MJjUS88GEQuBmxAHeG1I1fp9qJNNZ4NdhX+zcdoF0F/TA
 Pvm7MJzsPhLdIVgwn39rCkBoYLnjikSQPaMPQVxv/gtJD5lDJwF60khGtn+eTX/qU11PMrEAbaV
 Br/UPrAnRzMY8paVLkWLkVPw7l0Qr5Pg9yl3mQk6YVW/ePVUJ+aYjYryl7rdsrCLBdkjsIJspzp
 m4U5ittLo8jCJU/Bz/i5Obr1d2fPp8jiSioBV00Y/lJXMpx2F9PlrxFJUljAxj/X8svM0tdVv/1
 ce3hpEhQbeS9Q8mvtHA==
X-Authority-Analysis: v=2.4 cv=AsF7T+9P c=1 sm=1 tr=0 ts=6af5a271 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=fr4EAzCGZu4FAUfOKUQA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX3Da+4gsvn1LG
 61z8xy7ClSwfogVxManwTHxB8voSsNuu+oVbwq9VzT3JGfbeMe01hTk+xgAXYAu1YdTVfi59W0G
 L//QkbfgLP7WDrTurIeZW2UWWg1R6q0=
X-Proofpoint-GUID: j0pWk9-dskQ6u3NdiRnt5otmjuKsvyjF
X-Proofpoint-ORIG-GUID: j0pWk9-dskQ6u3NdiRnt5otmjuKsvyjF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120045

ath10k_sdio_hif_tx_sg() queues writes on ar_sdio->wr_asyncq and
schedules wr_async_work. The SDIO sleep timer also schedules this
work, and the work may re-arm the timer.

The current shutdown sequence does not prevent this activity from
surviving an SDIO power cycle:

  - ath10k_sdio_hif_stop() drains wr_asyncq once, but new writes may
    still be queued before the card is marked disabled.

  - ath10k_sdio_hif_power_down() deletes the sleep timer but does not
    cancel wr_async_work.

  - ath10k_sdio_hif_power_up() does not clear work or requests left
    from the previous power cycle.

As a result, stale work may access the SDIO bus while the device is
being reinitialized in BMI mode, causing errors such as:

      failed to read from address 0x868: -110
      failed to read fifo/chip control register: -110
      bmi communication timeout
      could not write board data (-110)

Mark the card disabled before power-down begins so new asynchronous
transfers are rejected. Make wr_async_work drop requests that raced
with the state change instead of accessing the bus.

Synchronize the sleep timer and wr_async_work, then drain wr_asyncq
during both power-down and power-up so no request from an earlier
power cycle can run during BMI initialization. Factor the queue
cleanup into a helper shared with ath10k_sdio_hif_stop().

A dropped request is completed the same way as a written one, only
without the bus access. HTC messages go through
ath10k_htc_notify_tx_completion(), which lets the endpoint release the
skb. The IRQ disable request signals its completion and leaves the skb
to the waiter, which frees it. Every bus request is returned to the
free pool, so nothing is leaked.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/sdio.c | 78 ++++++++++++++++++++++++----------
 1 file changed, 56 insertions(+), 22 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index fdf19ce4b55b..f0e1feacb629 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -1461,6 +1461,33 @@ static void ath10k_sdio_sleep_timer_handler(struct timer_list *t)
 	queue_work(ar_sdio->workqueue, &ar_sdio->wr_async_work);
 }
 
+/* Drop any requests still queued on wr_asyncq without touching the bus.
+ * Caller must ensure wr_async_work is not running concurrently.
+ */
+static void ath10k_sdio_drop_wr_async_reqs(struct ath10k *ar)
+{
+	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
+	struct ath10k_sdio_bus_request *req, *tmp_req;
+
+	spin_lock_bh(&ar_sdio->wr_async_lock);
+
+	list_for_each_entry_safe(req, tmp_req, &ar_sdio->wr_asyncq, list) {
+		struct ath10k_htc_ep *ep;
+
+		list_del(&req->list);
+
+		if (req->htc_msg) {
+			ep = &ar->htc.endpoint[req->eid];
+			ath10k_htc_notify_tx_completion(ep, req->skb);
+		} else if (req->comp) {
+			complete(req->comp);
+		}
+		ath10k_sdio_free_bus_req(ar, req);
+	}
+
+	spin_unlock_bh(&ar_sdio->wr_async_lock);
+}
+
 static void ath10k_sdio_write_async_work(struct work_struct *work)
 {
 	struct ath10k_sdio *ar_sdio = container_of(work, struct ath10k_sdio,
@@ -1469,6 +1496,15 @@ static void ath10k_sdio_write_async_work(struct work_struct *work)
 	struct ath10k_sdio_bus_request *req, *tmp_req;
 	struct ath10k_mbox_info *mbox_info = &ar_sdio->mbox_info;
 
+	/* The card is powered down; drop pending requests instead of
+	 * touching the bus. Prevents stale writes from racing with a
+	 * concurrent BMI power-up on the next recovery cycle.
+	 */
+	if (ar_sdio->is_disabled) {
+		ath10k_sdio_drop_wr_async_reqs(ar);
+		return;
+	}
+
 	spin_lock_bh(&ar_sdio->wr_async_lock);
 
 	list_for_each_entry_safe(req, tmp_req, &ar_sdio->wr_asyncq, list) {
@@ -1586,6 +1622,13 @@ static int ath10k_sdio_hif_power_up(struct ath10k *ar,
 	if (!ar_sdio->is_disabled)
 		return 0;
 
+	/* Flush any sleep timer or async work left over from the previous
+	 * cycle so they cannot fire during BMI and poke the bus.
+	 */
+	timer_delete_sync(&ar_sdio->sleep_timer);
+	cancel_work_sync(&ar_sdio->wr_async_work);
+	ath10k_sdio_drop_wr_async_reqs(ar);
+
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "sdio power on\n");
 
 	ret = ath10k_sdio_config(ar);
@@ -1629,7 +1672,16 @@ static void ath10k_sdio_hif_power_down(struct ath10k *ar)
 
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "sdio power off\n");
 
+	/* Reject new async writes from ath10k_sdio_hif_tx_sg() and make
+	 * ath10k_sdio_write_async_work() drop any already-queued
+	 * requests before they touch the bus.
+	 */
+	ar_sdio->is_disabled = true;
+
 	timer_delete_sync(&ar_sdio->sleep_timer);
+	cancel_work_sync(&ar_sdio->wr_async_work);
+	ath10k_sdio_drop_wr_async_reqs(ar);
+
 	ath10k_sdio_set_mbox_sleep(ar, true);
 
 	/* Disable the card */
@@ -1647,8 +1699,6 @@ static void ath10k_sdio_hif_power_down(struct ath10k *ar)
 		ath10k_warn(ar, "unable to reset sdio: %d\n", ret);
 
 	sdio_release_host(ar_sdio->func);
-
-	ar_sdio->is_disabled = true;
 }
 
 static int ath10k_sdio_hif_tx_sg(struct ath10k *ar, u8 pipe_id,
@@ -1659,6 +1709,9 @@ static int ath10k_sdio_hif_tx_sg(struct ath10k *ar, u8 pipe_id,
 	struct sk_buff *skb;
 	int ret, i;
 
+	if (ar_sdio->is_disabled)
+		return -ESHUTDOWN;
+
 	eid = pipe_id_to_eid(pipe_id);
 
 	for (i = 0; i < n_items; i++) {
@@ -1972,7 +2025,6 @@ static void ath10k_sdio_irq_disable(struct ath10k *ar)
 
 static void ath10k_sdio_hif_stop(struct ath10k *ar)
 {
-	struct ath10k_sdio_bus_request *req, *tmp_req;
 	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
 	struct sk_buff *skb;
 
@@ -1984,25 +2036,7 @@ static void ath10k_sdio_hif_stop(struct ath10k *ar)
 		dev_kfree_skb_any(skb);
 
 	cancel_work_sync(&ar_sdio->wr_async_work);
-
-	spin_lock_bh(&ar_sdio->wr_async_lock);
-
-	/* Free all bus requests that have not been handled */
-	list_for_each_entry_safe(req, tmp_req, &ar_sdio->wr_asyncq, list) {
-		struct ath10k_htc_ep *ep;
-
-		list_del(&req->list);
-
-		if (req->htc_msg) {
-			ep = &ar->htc.endpoint[req->eid];
-			ath10k_htc_notify_tx_completion(ep, req->skb);
-		} else if (req->skb) {
-			kfree_skb(req->skb);
-		}
-		ath10k_sdio_free_bus_req(ar, req);
-	}
-
-	spin_unlock_bh(&ar_sdio->wr_async_lock);
+	ath10k_sdio_drop_wr_async_reqs(ar);
 
 	ath10k_core_napi_sync_disable(ar);
 }

-- 
2.34.1

