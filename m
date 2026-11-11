Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384397;
	b=DM+zzaE18Mh/wOKGn6LozW8ybolWEIge1tAOT04Hvgk9WHENTNBDykpBPWx2uzGKg9jV
	 HzP7YgRnWQ/imXiCHU9Q8ATYGM5/e5RR3WNnaxeni5jDTZmkU53radCiDcTA1T0owo1O/
	 ozCv1r/VBsPv8eXGHWGXN0SD04n9793ADRlrRxtcauATY4sxH1oAYDcdQ0F+yBlPcVzpt
	 egsDn525MMeG65wqxPTU4ks9xhQPkqevcuVr5WQF/vw4HOLaZYpMowFWsBv1igvJWijYc
	 qkKSPj6+G8rqanG34/znnQanU7YnmSRn86O9IOyq/GYjdvX3Bwa5PpiVbL+D2qKLUMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bUvokNlCeYm9onJ5oM1T8ZQNs1QR3modjs0guNDfzJk=;
	b=3bpbL6fJGEEeOaxeWJ1idfOdJmlA6Vf6g/26W1JATWNSlckE7fHIhNvNj+1rL/h4ch7N
	 1tzkAviatG9Ph8Cr4EYcyVHk5JAKV44oVLm+i9/MWtwJTzu7AjcZNeiCeYVXet5vsCkxN
	 wNTQ7y24myQCbyNo7YoKo71bNB0HTVIzkmABqKHaIRki62WO/IKvhdEM6ISBpD4hiOz4K
	 PbEH6aVhxPf8wegqgkKzM8qJe/f4L8EXG+5bRkpLQ0Uquvlgx4rjLgUlqrQrovRhNBa5J
	 VhrOGtRiGE/lvAuMcWSHSBSVRlnl1ISl7aZHYI8wJ4hJVaJ1amBNAWviNGHynQyNoLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=G9XYGNiZ;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE0360A6F45
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECE0360A6F45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=G9XYGNiZ
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso6358633a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384395; x=1794989195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bUvokNlCeYm9onJ5oM1T8ZQNs1QR3modjs0guNDfzJk=;
        b=G9XYGNiZqL7cP7CR4fV/TQ3pohy/Mat/Y9YA8/O2Z8asWXdeIX3vT7ODOi6hC2FWMW
         pIeaTOcKTAFnUcfKMb3vNASe8zwXsdnpMrAfvroi74/OAgUpnbDspnE0gMnnPhtGL5Rv
         9JvTMJSsmfka7eHEjfqwsir2jxglkoL6LaNkqoS+tMuC3dupzZvpLpg8lbz2WP+dMgts
         q8RZUdfOJh34+AGFdIsC49BreKaYo/VYt7r4kiaSP/wP9ObAu0fe1HuQcjqFVjA4KJRZ
         DWsob8vj+S9jQvoiDFBmVmHFvd7TYqgX/hmMpr39ksaHwy+nTOFtzrrQ0mOvQ0mFYUhB
         zPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384395; x=1794989195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bUvokNlCeYm9onJ5oM1T8ZQNs1QR3modjs0guNDfzJk=;
        b=1MbbpyAsgbKCsBUpbBAKLAWzz1GjedbYRj+ijgQxy+cJSNYEJhXxm+Jwe+2s+6jJ6M
         vWUVcnWSkV4t3xAKgDdXMeTcjGqcR4Hee6n2rqXOeeg4JSUkj1Fry//4WH6VfwG2IIJG
         xvDJc6vSX/sNP1bLfIQtBZTgN6Dg0VLCRano2fJwZe/QOaYwIpyNcUol1PpLgV3INha6
         XO/XGHZvF1RlsjQeBQJ7LDXNZtKJJ+sznxEMafH6ZqE+0FN6XdeciDCIPTYizfkV10qz
         sHh17Ye2jlIFlmYEQVYHUQbE30CbycWWGmJbwUzgIBAFSuuekEubIFSTYuzfhyVZz8HV
         3yBw==
X-Forwarded-Encrypted: i=1; AL+hErGCYjRz55hjFplCxrUTSgH85CZHg6t+kik1ft8MOPZZjW3cleYF1gacuODCUb/Cu88H/rTypuAvojRNkkw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9foKbpDnKWvLL4LqASyhrQEIxjvjN9j8mZ+uv57xY1CQLkpVOY
	d07FNK2dcPESBT83+UKv+A1UHt+a3pX7+PQWO6FXuOwjDvnrwJxiUEtsqBKVefHUNg==
X-Gm-Gg: AYBFou1p9dNLm/I7iEJCg/j+HN3jv9Auswf6oSrCET388csm946QXlcRV8a4NXQ/cbQ
	zCYhA7jodlA69QB6BfZGQxRUkwlnlveA9NLLsY/5lN1wZRt022SmEcKarPKVG7JLRi8l44FfugM
	HSUaHkPZRtcQzcHQeWwsVUQG5Wgl7CngGfO+Rij4FvpFXzryP99OvjyKBYgYf+tf/ZKLXoSamWc
	Y1Mlvq4R+Tbg//7zyXMDEQiQnbGdsfx4KIRnCijT8RNvdoVJoJvv/A6BeDl0jBcsBSGZfX0Nl96
	fiDJWTKzfOuCPH1hzMCKFkavhRdLQWXFMEsgrNOwbupEt5WfDtmMe6jaB6MbKp4Tg72AFfGBRHP
	nLMncOnwmpUjrZaS0HEgV+h/YjD63BEZbmYMb6/NmJ3eR4MHPmyMnk4u0bq04AN5o8XFcgtqtIE
	wg9jp91N/3ZNM0OFhKLPj9dmZ+jnEyqWKnTP/jhWjMbejOJjw40CUA0D2bde9D877pAGJ3gMP2j
	MkBTub7hS+Lp2D3ohnalXMtiIU/Vdq5BU/n3pEoTzAH9i0cdzJatDakiYjE4Pge9P+lwHq+UHY7
	qXVnPIxCaWdAsHeGAZzuFvnyEj8YmHU8vWv/aq6utuk8/+sY72vGkerKHMBmJkhzl77nBAV9D5g
	RSMRVsiFXTt248y0IKRYPr0f0NKuYeTSMoBRYJv+bpIGCZo7XLEUqqj5ilBmhcA40iOAFQpezs3
	CJsY2dNNL7VG3mhFirFKte4Yr6JrehLMEqe2mxpReGXlz67tizfzpZRzpvw8lPpthpYWOK61OLC
	Mry6wLkCjZGStNMrI4WO8pvUSuPck09Iw0jJymvzX3F9BHfAP9LDqMtfY4lESPNmb37rnR8+5WS
	vk0UuRlupWCEqx6fqSs=
X-Received: by 2002:a17:907:3d0e:b0:c49:d1c5:431a with SMTP id a640c23a62f3a-c5066d58e34mr133683366b.38.1794384395369;
        Wed, 11 Nov 2026 00:06:35 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a6af519sm203722266b.87.2026.11.11.00.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:34 -0800 (PST)
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
Subject: [PATCH 2/3] wifi: ath11k: ignore WLFW servers on the local node
Date: Wed, 11 Nov 2026 09:06:29 +0100
Message-ID: <20261111080630.244427-3-julius@bairaktaris.de>
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
ath11k_qmi_ops_new_server() connects to every server the lookup reports
and starts the QMI handshake with it, so that process takes the place of
the firmware, including the REQUEST_MEM indication whose handler frees
the DMA memory that the running firmware writes into.

The WLFW service is provided by the firmware on a remote QRTR node.
Ignore servers on the local node.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Cc: stable@vger.kernel.org
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 7dc07339b9579..c4e4b9c5ec0da 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -3172,6 +3172,10 @@ static int ath11k_qmi_ops_new_server(struct qmi_handle *qmi_hdl,
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

