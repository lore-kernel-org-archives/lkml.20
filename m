Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384396;
	b=3/ExF4t2+Z5gH35gpc8l1NXHxRxz1PVjKrliSimgp8AcyO7D9snBr8H+nnovAOWHY9Kb
	 V9Z0nD23OnUPb7BXs62fqrkeFAAUHmc0OmbwHmxzuvrLwYmzMFYRpnOAdVdemObDS9OAp
	 /WP+TC5aluUOP6l17RFkpdI2gRSuWYcGcEtDDuNgcYyPpcXPlkk9QvYDafANX6DwvQSuW
	 9SwsOMV8gVtKMmP6OfG2Gf7r9/Ufy/5xTpC3/fVzqciLdaUzAabA2yJMtHTjSCgg8pYwm
	 Lbj6hYxdQ+kzrNJjtRZ8JJ9Fl1pwLU6UR7nyxGgCEw43da5pcj0wj7/R713jxXpVnAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=r5QHJOclG6lenrzuLdLFBV3oe5/4KSdk6d52zk+Yb/c=;
	b=ssRp4rFsbfG1A1nXVTF0o382dBXmbLtYdljpLY+mFVnA1fd5x+bYHEr1QJel/qFLrLKL
	 YenmndxE2biKPuHLyx+9OO/PjNKfVQ8/mVTMW8i0fwQ2OWwlb3qwYYL1F+rJ4PCwtAEkr
	 bfDlBxXaJfT1gJfiabf5MHRCLh72R+n654GII34F4uW3HX171hscrGMD3cBJK4ngDbqaB
	 /GRwpvAtQTUfYM1N0+WRxkkE/msLMgIXKEH6Y7dn6PBtuhaNxnFA3KgRFcpv6UyBLwADi
	 R47QNUrZiV/3Z/nCeJcwJotPfikbw8lOwUh0ujrMYOfsYUks88OiP+CJ/SVCb2lfSSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=ahFmw8U0;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5CE60A5BE2
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E5CE60A5BE2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=ahFmw8U0
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so450394866b.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384394; x=1794989194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r5QHJOclG6lenrzuLdLFBV3oe5/4KSdk6d52zk+Yb/c=;
        b=ahFmw8U0eeZvB6yv9lj/iRJo5flheWQupjk/oaf61Ec1dYOWMBk7CYVknnuBSe6KHs
         Q2aptZKfu2hDpSIqF/N3nu3smoEDel3zL/U6Zun6n5RxqvTTwmrIfpS4W63fmJK1hSUV
         ++6Iw4YuQn0dId1loASC2FBFFWhqATo09WL8qMb4Jn2Vx1vknwKS6Tf2onUn1a1lnCXu
         yUoN5nhZx9LNpant22fZNKo8jyb41eLQ9UCmyOEkdQPBcW1cLNI6gSa0LBHVJy2n2dM9
         K49xE1IMlTu4s9mm5PeaczQ61KX9BS3ZxTk4UrYdOMr91+YfUYETZwazyB84E/c8wyid
         Weuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384394; x=1794989194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r5QHJOclG6lenrzuLdLFBV3oe5/4KSdk6d52zk+Yb/c=;
        b=AyIVIkaezVoXBy8hM1Qxe6U05K+0aG+UG+yonCP2UII4mLt6wyIIA/T7lNYRJ0gql4
         QsCcET7U71mx6Z6yBfLgQYDfdP6G2NFb1XPcTnlnenDaYNMZIYT7EcaNgEfv8cDajdrn
         YKSJl3oKCyBRzqPBw7NlW9hvElw1/L1zx1WnFwPcKkrEfjD3yhK3ZfoOb/+vVP/RqsGr
         8X/NaPC2eX2UXrZv6JzYigb/7mwOabSM3Mt9Z2Z6l/uMKYOc3RdiIV8skXrOd1rtBP2K
         t4L/+nGcxZ6nPRQuUHdvJHKkj/jLUatqqHlsha2Y0kYSyK8oeFlTE4H+Admjydt0qc7u
         mo7w==
X-Forwarded-Encrypted: i=1; AL+hErFHTsjHTEUgQrxWxzdafJogZbSuY2smlJkxmA4m1iLQ6EGKasvr2dbcqPvsAk8nTqETd0LaSRVOHtQGZ7c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ApwfLjzuxGRadFyPDrEiBTw9nrafbUex6qMv0atYp4a9ThlCg
	PWvtMIWerKVhNgWA4ZldokLNHjs9wv7Iky+sk4VVEiivFZFSuwJlzvE2KG/eadJC7A==
X-Gm-Gg: AYBFou1O0k3D6LJx/Fp5EQB6Fui1DCykb9Bk+Isxm/9EGadjgMuf/pSiamHu3wEEvEW
	0XKTqA2TLKUobCmtizOnbeKkiLpxOb8MMeZO38Y4uds2+NeoOhlv15D0P2k56b+JUPrjNByjRLZ
	mbxTW1dA9YfJOzBNNMpDpfPojmLN4+Yu+KF0y3dQIC1yMJKmDTnYbpZVBoDb0zzEYqH7FgNLxav
	jAoBNsAoN9Hh3ySAmOYUYTGmzMV9bovIO+z+KQRZrg6IKXr1wTh7Ewy4wMVnVXHZeEOQmIVJGC6
	CWRwVKNAIL7UsRyObQoqHVinG+JWATonhN0Hk9wI/tm9PMaIdQfS+Ck4hp0bjFgdM0aPapwkPGv
	7B642OOGzRQhEAb+9PZRD8f9amDWNFG9cmy4RVi9Q6Z8EV/gpDTd0fxpzrm/fvB2+puN6J1gewJ
	oJ3Vw3ZthgGwK5RjrnNAbzEAtgSn0jpsmi1lj3+cj4LvkT29Mh5mmVrYK80X7f8pitiWzhx7Ons
	VCsx7pPyT7X4TBoqpLSEsl7M8AX4pDbxhUdV/V5iyqxvR4P1Plb7GKjbjWyN2ZH0aDQUdyHORNQ
	yN1rZB/t5BKR+ebnRmUTbjoxJZIEBbXLih/nu9aw+Vpko9S24J05nK/jNqR/Lpgt7SDKe1rX8F8
	jKuBY6ltYIoI0PG51dQTvhf/4tnOz3ugaX5J98JIlUnXUMfuF4e9d37A1vSUAPLJ60AuRIzBGjn
	Dj5m7ZaKNsUg2epndeCXNYPfEUnM3z2Hhf60iPATW2TCdq/daEg2Vnwjc5+C/CDEVPDJmp+gGBw
	N8FaMnYbbrFKqVhInCoirk85bBGVuCuLy8J9KqyqUz5CbQ4c5ij4adTQDXfk0X2x+aglD4AYgBd
	rz/X1Kl6ST9z0ms36qk=
X-Received: by 2002:a17:907:1ca6:b0:c41:960c:8c62 with SMTP id a640c23a62f3a-c5066b338dbmr122198366b.30.1794384394508;
        Wed, 11 Nov 2026 00:06:34 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a6af519sm203722266b.87.2026.11.11.00.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:33 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Chris Lew <christopher.lew@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] soc: qcom: qmi: Take responses and indications only from looked-up servers
Date: Wed, 11 Nov 2026 09:06:28 +0100
Message-ID: <20261111080630.244427-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111080630.244427-1-julius@bairaktaris.de>
References: <20261111080630.244427-1-julius@bairaktaris.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Any local process can open an AF_QIPCRTR socket and send a datagram to
the port of a kernel QMI client. qrtr_local_enqueue() queues it no
matter which server the client socket is connected to, and
qmi_handle_message() passes responses and indications to the client's
handlers without looking at the sender. The ath11k and ath12k
REQUEST_MEM indication handlers, for one, then free the DMA memory that
the running firmware writes into.

A client handle learns its servers from the lookups it registered, and
qmi_recv_new_server() keeps them in lookup_results. Drop responses and
indications from any other address. Handles without a new_server
callback keep no lookup results and are left as they are.

Fixes: 3830d0771ef6 ("soc: qcom: Introduce QMI helpers")
Cc: stable@vger.kernel.org
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/soc/qcom/qmi_interface.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/soc/qcom/qmi_interface.c b/drivers/soc/qcom/qmi_interface.c
index 16e2e24b60968..ba9d973279145 100644
--- a/drivers/soc/qcom/qmi_interface.c
+++ b/drivers/soc/qcom/qmi_interface.c
@@ -469,6 +469,19 @@ static void qmi_handle_net_reset(struct qmi_handle *qmi)
 		qmi_send_new_server(qmi, svc);
 }
 
+static bool qmi_is_lookup_result(struct qmi_handle *qmi,
+				 struct sockaddr_qrtr *sq)
+{
+	struct qmi_service *svc;
+
+	list_for_each_entry(svc, &qmi->lookup_results, list_node) {
+		if (svc->node == sq->sq_node && svc->port == sq->sq_port)
+			return true;
+	}
+
+	return false;
+}
+
 static void qmi_handle_message(struct qmi_handle *qmi,
 			       struct sockaddr_qrtr *sq,
 			       const void *buf, size_t len)
@@ -485,6 +498,11 @@ static void qmi_handle_message(struct qmi_handle *qmi,
 
 	hdr = buf;
 
+	/* A client takes responses and indications only from its servers */
+	if (qmi->ops.new_server && hdr->type != QMI_REQUEST &&
+	    !qmi_is_lookup_result(qmi, sq))
+		return;
+
 	/* If this is a response, find the matching transaction handle */
 	if (hdr->type == QMI_RESPONSE) {
 		mutex_lock(&qmi->txn_lock);
-- 
2.53.0

