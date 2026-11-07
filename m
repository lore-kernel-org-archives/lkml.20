Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794086775;
	b=rq5+a/FmSxyiQD0rof2LcQD4tXAjOgJFMQ3B2GrYPVLpYfxVztIf+9n7hFomz9KcNU3Y
	 5Gin/l5BYdGCI5B0p1qxRJ8l8XGPO9QbL5dTTKRg7zVHZh/ErYwKa6wduj84VG3WZqAlu
	 AAlJJqS4l920Z2WH5zBMmiXzF4bepdFvWCDnJfK7AZAvoYl5p8THUEnsKqFu+LsxJDoSu
	 EIv/EuWpx6MYCz9U1k338GzTlXgqTaBYbBHezvRJnSsDTX/Q1zPrin235Yd5zXzZu/rz8
	 um9uvu/Muque/BE9dcB/UuxV2j8iaBpD4wmIkVnSyKbRBgSnEW1DmpUO/Q7q39vv4yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794086775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=M14Ol8mcNnfagfWbtr2Ts+wbUVDNiKvnayDW0nuHJUk=;
	b=0VH4GcPBjswp7JvWXfT398fluW2wzeKy2jNLiBXA8/czb7qlJbT1oj0LAJmdERBpp4Va
	 O23lY48mYYW454wdhQMAS5AEp0nYyr2WrZhIwRdQWl32iQ5HfBTXCfdLxbyMAVvjRPRNF
	 7JrpprbyNexLEZyxCcCb0AQMPTOBXF/YUt4DD48PvGatjwJ3KSWjTenmFsx+4R1/OC9uh
	 iHYT0hRmEAHRE6BHPh/5R0U8s0e2SQJrH8KGMk/nQywbQy6WGwEUAWZGVd/QQPN16AqM6
	 oIE2beDIYzcGI+2VVEVH9srWYJSMef9DwMB13TUPfvZIxid7vC6KxnYKd1szQlOzHBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AwGfHfZm;
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732F3606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 21:26:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 732F3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AwGfHfZm
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36e06480786so16358eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 13:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794086774; x=1794691574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M14Ol8mcNnfagfWbtr2Ts+wbUVDNiKvnayDW0nuHJUk=;
        b=AwGfHfZmRDvgDyvcol5H5FQSBV/VfE13WHr6wUleH5eXKFkwlojtXBGBbe91wrgMg1
         HC9GrWkwQsObLT6wIqJrfo32a2PRWB/VVBRuGMPgQ+FKttKffh38+2zER5gZBDXUB3wM
         C4m0+gXrzDCtkhbYI2nnX3z5LHts0svvm08cM09RiC5Ef4FH0ttfttKOaqLxoK94uBuP
         0XsCudLTB9z/CvTIZhbGbOKzH5xELo2ncpcbcJehRHn4w8hdkNCt+HXr/opzJ7uiA2SS
         bo//kViaQEQaoSr+ETlwBUWSyP/RDP94awok3u2K8qjfOrPCTOsSVZbNbNafR8SZ2Qc/
         eC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794086774; x=1794691574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M14Ol8mcNnfagfWbtr2Ts+wbUVDNiKvnayDW0nuHJUk=;
        b=crE3njDh98E98A2tgDQDkSuOrwkBO1VZ6QsjwjywsVKP2+ua8ooEBIKx7eCD+gzjMg
         oJoRhGBBl95nD6+ICFc2zYmf12aJDC8C6x1Bi17FRbpbCyaIC4mvMR2Vr5bwUX2PZeZF
         2ZLznjQhddvMDXYwvZTPjcjy7Ss7wBz00Krlg1ToJcCM1aUg0DhxMWM0MQ3UMWxTgi85
         vgyDHEkaaa6f85WxWhwWrws+mZw7A4hAO8FOcwJ7PueL/PIfzi+9Gc0c2IuNzI/u2XnI
         5H0AJj2Mo3T9IWmxWuIm5G2i3tba36KV4CDwSE4Ke4JcGaCbQPi0yP3BpH+YaSfev67j
         lYPw==
X-Forwarded-Encrypted: i=1; AKwUvBx2p6W4zGD3kUf5fxHIRxG45JKFe9UW9W9qMCpZCcGGgZZ3dPtdyw5B7RAOub6woH8O/mwTUSAaHe2Nszo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/B+9ywpb/IHtvw6EDxr3V9ChwVkUfOwyeqwJO9/F1wQzKD+Iwo
	vowPB0eN/imXd4JqP6v0Ws5B4LQ+iBf9YSmydlqMgpz0MCKHumhC2U7UFTZMBv8NsZ4=
X-Gm-Gg: AYBFou0LOovoNExesCl7qcdMOZUEvdGlYXNZCgkFAeilEXjgPZHZTCrLdsw/+7GqstN
	MoEewl0qYbnOq5iT8MA0yZQrTcEZ+bUe9G3YR4Ka3aHJVOqw44Vv/S7QVglwoGD05bwSVRaQN55
	SyyYwbmZlvHZ1kTpgh9dxIhqQcL6kR0F8SKd0tdO+9Sav9olqNR+HZQr5+Yjiv4Kb7EW8q9YUE0
	zxRmQBxaUfxc4BpHADCIgxKAsVylDdXLnTYXVBYtDd7k9UAIsUomEtzzTnP75Qc8QAT/QUBnfbS
	LQJPk/NuQnghPNcXQf+EMQguQ7b3FSW0rUYXTY/d8oUusX/LkKGmHZnayVQ8UrhRvGcBwTgrjOS
	CtA6n54o5JysDxM5G1CX4jynx7G7s8/jbfXH9uxSM3KTNJnG/o76Hf907cjR1VLCQpP0cKq85km
	JiMYsF17xUMfrcxR+nPQ9uh/NgJ5b06aeXDWk65m4COK/uEmPZhuM1RKfwUvgIm+4OAtgKp8QhC
	pu/mATbXwWYcQjPvTrSaMZGflo1oVz/V+4OMosPZsp133ZcS8o/4ehnQhyFZ++r83/wEMdd89YJ
	vZ+DU5YChKtT4lYgdz7E7+7t5NCopyZnRqK+uogXqqZi0gw66tTOdmFQqqBJ/WNC9U4Kxv2v8N7
	kdPihAEMH/0WWjGcXo+gqeQ1XeEhAJhYOlOlRJw==
X-Received: by 2002:a05:7022:f681:b0:1a3:9936:d11e with SMTP id a92af1059eb24-1b25d39c2dbmr11497320c88.41.1794086774320;
        Sat, 07 Nov 2026 13:26:14 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755eb6efsm1146297c88.4.2026.11.07.13.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 13:26:13 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: giometti@enneenne.com
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] pps: require CAP_SYS_TIME to attach N_PPS ldisc
Date: Sat,  7 Nov 2026 21:17:53 +0000
Message-ID: <20261107211753.75932-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Any unprivileged user can attach the N_PPS ldisc to a pty, and every
attach registers a PPS source. At most PPS_MAX_SOURCES (256) sources can
exist, so such a user can take all of them, after which registering a
real PPS source fails with -EBUSY.

Require CAP_SYS_TIME to attach N_PPS, the capability that PPS_SETPARAMS
already needs to configure a source.

Fixes: a0880df0ccde ("pps: serial clients support")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/pps/clients/pps-ldisc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pps/clients/pps-ldisc.c b/drivers/pps/clients/pps-ldisc.c
index fa5660f3c4b7..54678f20edd5 100644
--- a/drivers/pps/clients/pps-ldisc.c
+++ b/drivers/pps/clients/pps-ldisc.c
@@ -46,6 +46,9 @@ static int pps_tty_open(struct tty_struct *tty)
 	struct pps_device *pps;
 	int ret;

+	if (!capable(CAP_SYS_TIME))
+		return -EPERM;
+
 	info.owner = THIS_MODULE;
 	info.dev = NULL;
 	snprintf(info.name, PPS_MAX_NAME_LEN, "%s%d", drv->driver_name, index);
--
2.43.0
