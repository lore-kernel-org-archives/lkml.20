Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384398;
	b=LAAQ1kZE3s+DbASo8uYHX8SEmJjvmjx2mh07aaJFAp0SQk+oWwRsid6ufoYwqOne1Dd/
	 +v5UBgn8HIr3gO89J0/SQDgruKF0zizVSkb/e9YCKNDzqTA/yRUteBf7NE8FNw5pVTHla
	 N07NO90uVJcepI+aAymai+jXHspU1p6lV6ubLHkOsZqZqy1QMzTLDQ3EHFnjASeWk2Ery
	 cljoX3QauryMeI+k4Fyht21RNx0PTmy51e9Q9tO9gODdn5GigE6Uv8POOZ1MARRXGrl1/
	 +m1fgTlvAUWJNzEBDZLK7k0efowWY9/NiJlceD8WnZ9jVa5LRaESE62nVMw8vfqKTtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/Vw/Ng9DVAcAXNdpYFohPWP/a42h4elI1qUZ0Yy3RdI=;
	b=BZiBmrMGYKVFaiNp7sAlOPW3IT918j3jxbFM8wTkmiUaGF0hgsr9ZBBRMD0NckSIzBOL
	 CqsybYJiUpYeHPzPG8iyY8rr+DsyDg75jHop/yGeokgXLXbWBr+FaZPJ1SzKKPt7D7eFE
	 qS1MbI1lCMLq4iWM707iS3wIHlk2DmmiMfU8KLdU143fc6tx9N8yYJeXO363ff7B8y9/y
	 UTumNKKQ1d4BnYnmDgjC0BSZTVeN0wryX1nHVlofrrudoKx2W1HkHmnDNH6yb1y5dvGTz
	 KPLEyHn3+tMNs6cthwGesKT5pfWLzTn/egLPE0Qb9478GcLL4QyTv8/Dvb40BSYoEHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=gacpxWE9;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CC160A6F61
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8CC160A6F61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=gacpxWE9
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso504598966b.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384396; x=1794989196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Vw/Ng9DVAcAXNdpYFohPWP/a42h4elI1qUZ0Yy3RdI=;
        b=gacpxWE9WxZOwiWnKoLF6LJ7DhjMhXDCXTqv4CdbCFctA7Tg2HZucpZPc/vwNZv9jR
         FSZYkFWf32Zf3DqADqJQh1r/wnr+UsrgAyo+TZy9IBM73JImieNt2dtqHX8KA5RM2adD
         3uEIVIV5VNfdGoYx/oBkMJVoC3SJOCpdjk/5f64xjSa4vm3qssEed2ROGcAgNIAll3TB
         5cyCpqtgQNsQPFR6QXBSXJhoEeee0YFFHEMH9QATMdPgr+OZSTzX51FqG1YKfBZ7zuKR
         75BknnVTz+CIPLaweKs5YCQo7x3mPnfe0cY+h4CNJcrC4CJB3y/0rWNXQIjSbTy5DfWx
         4QTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384396; x=1794989196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Vw/Ng9DVAcAXNdpYFohPWP/a42h4elI1qUZ0Yy3RdI=;
        b=SY65mKFpS95KVDd0KVai1YtJauGHnbt54eIR0H6/WlFt/o0WKIhqs6J8kI3o/Szbg6
         A575dfpkO6jOXaVKkC2twIwxKia3/V76SrxbSZ35AKpR/UOQ+1nNuJn5jrNnaSukHylZ
         4EXCdMZhofpjbsPv8ZU8bvZgMUQ4MuJPPVhdplhG5Iwcgvli0jmaJvqTaMBS/dl227H0
         zcxBa/BeC816mJqAWO/zHfbj4F0sH4fR+pDQcWAebqjtVTgxdX1tYdafM8SYSSmuipYA
         LkJhvqx09sjXEwCN18yWnbuW4V8jMsYUldna4nmUxCaQObTLDwZ8UxLW5TPPTzRsvYhx
         bHUw==
X-Forwarded-Encrypted: i=1; AL+hErEgtqUq+CyAwdJYRsvcm1BRqA9jhOHv8F4T4IYuHletOAFMBamuwlnaoe8DVbSTw6rQnJhccsiXNGzvmdE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xdf9Mdss9KYXE37tiE8mEGYKe4Bsksiry/1th4kaQNtNyDKUs
	2obpJwsx40apaKbVjoGN6VQP3a+I1B7qfQahS6qnoSYmCYkQlDxdcMyPejdJRN2C5tHY7E+tKUa
	Pi8udI+CE
X-Gm-Gg: AYBFou21eOFxrWJCSAGPbf42BBZdBLv2rJJCuYAziohJ0LOMxwyMvGZg5e3spVq/hBV
	VjDGmZWQoujI27bmtdUQABCjAV1AmtllOtodMsMBGeyORrs4wcHFhNotHUg93JqpWZ/YZ6rPOQw
	If2G1GzhNRxNB9RvMIt4sea7xyiayw4X2UkZM8/LSKLXwGi8R3BPcLsKDOUYAf6XCm6BpMPNcVe
	lZRarkgV3137BhHHTvVtF8C9DPauaIxMOkn4dR5CSnNOJaRQH77/G48yZ/Xy8sRJk9cLh/CToA7
	EjmxeCtMfZq3UkOvfULrVvcSV00qxsxWNAln0c2iLvVF0YADmqZBXdBJ1dQYUSk3gv1052uIEws
	vVTK2a2y8h2+Fh46r9mT5YZ0lpW92Cryd4YH3YxiGyLX+f8yxM4auybi2gs1PqTMzHXlMx7wnnx
	syu/ZeR9wNn0DsPzU+zvGDhtQbzbjSc9BtvrUJRfIdUphdjbLD+GdGWSQfPU7z+M97Glg5q0Ure
	LDq7TBko4BUlxLcPT52DHmhGi57quUHViirXxLdHWvVxeEqVnbUS+ZMOAWcqdOxJAHNp2tp95B1
	PjXtCh2jZpCKJUW3nzgZa+eS9xBxxOE2IFeDH+rZgq7CnIYloHjk38N5O6fwpT1U+qQ9u9E9eUy
	+jaKSri1SO3ouPfsE3ortvj9Ch8H1oTkxurUW7hcQ06nn3JYcD3yVptoDFV25cvQRdibMdGqQRD
	XtlCxRIRK7AUa4sX4rdqWv7lhfX33tHpd+eDHFzPODn72F5DowcmYtd91WKCBJCgOowRK9g3WBP
	eXOjoNdJMaJu7ujt781AmUN6MBpa0czD2sFY+DhEGgXNfhuB3bQVmngSTu8xwBv0kOWbeLeNrPx
	5jbiHqkmKQAujnEcgrkrDof+P5kqsbgLfEDa5w31
X-Received: by 2002:a17:907:d311:b0:c25:f7db:4bec with SMTP id a640c23a62f3a-c5066b54812mr120674466b.18.1794384396170;
        Wed, 11 Nov 2026 00:06:36 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a6af519sm203722266b.87.2026.11.11.00.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:35 -0800 (PST)
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
Subject: [PATCH 3/3] wifi: ath12k: ignore WLFW servers on the local node
Date: Wed, 11 Nov 2026 09:06:30 +0100
Message-ID: <20261111080630.244427-4-julius@bairaktaris.de>
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

Any local process can publish a server for the WLFW service through the
QRTR name service, which records it on the local node.
ath12k_qmi_ops_new_server() connects to every server the lookup reports
and starts the QMI handshake with it, so that process takes the place of
the firmware, including the REQUEST_MEM indication whose handler frees
the DMA memory that the running firmware writes into.

The WLFW service is provided by the firmware on a remote QRTR node.
Ignore servers on the local node.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Cc: stable@vger.kernel.org
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 817bd820623d2..ca1d8720a4830 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -3994,6 +3994,10 @@ static int ath12k_qmi_ops_new_server(struct qmi_handle *qmi_hdl,
 	struct sockaddr_qrtr *sq = &qmi->sq;
 	int ret;
 
+	/* WLFW is served by the firmware, never by the local node */
+	if (service->node == qmi_hdl->sq.sq_node)
+		return -EINVAL;
+
 	sq->sq_family = AF_QIPCRTR;
 	sq->sq_node = service->node;
 	sq->sq_port = service->port;
-- 
2.53.0

