Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793600082;
	b=4ilkZhB7+bSgfuwG2dw24+/DzjIqeIgR7ni0lqBFrYb3F0asqf9NFizghDelBkfm7rsz
	 zFdJ0wYhetncDf1XwM4ba/hX6TH/UKTCYsUwsmRz7tRsDRdcvYqUMPsaOHjbJ+tFPwTbS
	 bo1HjXzmmyrtCExMjXc5xHr8iUuWiFCkpHqSsaE4mp51DCazhE6aKQQ2s15aLU6EDvMwl
	 1PcTeizpNE89cPEwQ2+rkK7aoXEWnYMKGK3Ixd9/scnDCeUZlXCJch1Yn85mdeAWLJL5Y
	 QO8o4MAYaFwbZZEBSUZ86MWIS/jf7iV2XjkRBEe+f7RHMq8O6QWPHM0IgCIHioqbJ/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793600082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=LTUJ0JEm67/O1NvvxTlwEEPb8oRFqpA1lbxsVjiMSpc=;
	b=5ElRoOOcRq4588qCdWSSQXdzYv/9TnTWxSX5e1Jy9jK8B31CH36pOhH079BZ4XCBKQKP
	 7JnyLT9foXfO9r3olhr/kMObX5DCOin4rImtGPyi5GWTPGE2rWiDFFg1cgxlA7oJfTdUR
	 33AZboIjtbTm9MbqoprGE7NU/6Hv1FRRYa/vYGE+xU9OOwdIwDdTZ/o1XQGjgkD/F11MK
	 76DSL0WTxNIIWYYkJZfLdhrobQoffAT2QUBYhv2q//tjGqT1+g71HQBe/zH8zt8KLDCXg
	 uYVg6BNebMSeuqbfdHE7R6VcUrBCqBQSp0DYKYP21voHBK8BudmlKGZMdfjTt3fKueg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0LiQdi71;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20D8606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 06:14:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F20D8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0LiQdi71
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-15ea896ddc8so4522401c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 22:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793600081; x=1794204881; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LTUJ0JEm67/O1NvvxTlwEEPb8oRFqpA1lbxsVjiMSpc=;
        b=0LiQdi71ry6UnOYAb/AWYDEDHzAl2m/whEmqaRLTdIRqgKCtnkPqIfbQ3P8ZqOj/Ml
         j5VqjNarkoXEp8hh3lq57eHDDtlqd9DDMbCtczdKIY1mvv99Bn/Z3pSSRgC+IhR2DIik
         PvaTiQaEyMyB0deiKydRO9oPn/WFcLkX5icsOXC2nz/IoGiooOyihDso43W/2/5ZeOPy
         MW7lyRmdEokBsA0DngyCehsm2g2ARQzRIJb9BA2Zn1jBGYGzdyRCOF+Ve5N3qQkcTJD9
         mH9gqCAST4gL5m5/URFBQcEVJTy4fPATb2Ey5HAsZ9h0rpkhjdIUo4p44T8/Gxu75lxh
         Yj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793600081; x=1794204881;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LTUJ0JEm67/O1NvvxTlwEEPb8oRFqpA1lbxsVjiMSpc=;
        b=j7LDRoiyXO21xRSnYWuK3vuKFzNMDl68T16XDIGvTPxzeSzDPrkr5CVqUjOKJ+ZnFO
         lk8leeeRag/P3JkRRrkCDUAHJzJg0L1ROxgAoInAkYB61GLGZfyFh0wQKZk40rleY4A0
         oCIrhnhbjZjjgpxVemxfTXePZRrvIuWDos5G15957ZT7/G3BpRvzN2RtaxBx4UI9Obz9
         Auatuv7ACYqBa5UCdCd7oOm8RiwsuOIWlG0X3mOkhdwIcknHdwTDJ822dwfAnU8VUWZc
         vXxxarwiWzzJNwAWIxNbwNVk9Di2uZlfoQEj5iKu7csSIoe7l/66YSUFZescU0B8B6Di
         f0FA==
X-Forwarded-Encrypted: i=1; AKwUvBzp1gKNzY2/9YD6bJWQVsnF6cSDtqBwEEtRErCmVu6zds4Tm1uklYhRMoQTIBwTRAY3umc8wz00hp2nitU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDJMDw0jE7aM4Eleq1fs/CPcJWC0qM017AtDCV1sctABC8xmK/
	ZBV0C3EX2wFbPCrxVb3mIHaA7sWSbD46whdJOFwvDz6zxG2CFrim6D3Y
X-Gm-Gg: AYBFou29yzaOiVPA8BSJkY3eE/duULVxgpwRBOa30cbnKGK7u3wIs7AXssn3vZZIuue
	mo4lvgnCu0VoHnRecFsf8UupZuK9WuFqwPXn6eMXoLVhfvBBLl0idLu5lgOK+xAtoxaV8DSrRZ7
	nWMXxuu1V1pFjFUUnW7L0t2+mGEblkJmbohpHq6iPfOCEJMn6x4kKkFNftskmL5gwagr/7DpRLL
	2gZU+V+I/53+EgTd9GpI27lxMRIoWvHRV9qyt1a3F/P5vTuhIHVgEVgmph8Maxcw6fYY3bGK6zf
	5MC5yRp/14L/lmAMtk3raIwzZhm4o8q2L/UBdQGmeFA8p661m8bDR9sbgZ2/zb4MHYtaCGX8tEF
	dM14/RYdXdpfl49E6omENoaMxGE/VWP/5Rngb2lA+ma6XsZApnHdOXSFoAPibN+uXt8aknvjBRf
	59UzEccuiVSpCWH7ow83EjcLc3JD3RD2T93W8HM4M4Kj6swOIDtcDtmueJbRjs8NyAjGdaj1ATE
	IBsKy9tE8gjX8ohHnwtY9I4bMwlmDJIUX8qKAgrjWSdb9J05ibHRhtXDp536xtbBXXvwziMpDxS
	KAkT+TKqUMj/p/AObx/C+dqKEw==
X-Received: by 2002:a05:7022:294:20b0:17d:7b45:f91f with SMTP id a92af1059eb24-1ac5c273f92mr13942725c88.32.1793600081035;
        Sun, 01 Nov 2026 22:14:41 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19c6b969sm30288043c88.14.2026.11.01.22.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:14:40 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH 0/2] nvme: delete controllers with many namespaces faster
Date: Mon, 02 Nov 2026 01:14:35 -0500
Message-Id: <20261102-bug-nvme-remove-ns-async-v1-0-61780fee111c@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAEsq6GoC/x3MMQ6DMAxG4asgz1giGUDiKlUHN/yAB0wVq1ER4
 u5EjN/w3kmOrHAam5MyirruVhHahtIqtoB1qqbYxT6ELvLnt7CVDZyx7QVszuKHJU4QkYBJehm
 o5t+MWf/P+vW+rhvadFaBagAAAA==
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-block@vger.kernel.org, Ming Lei <tom.leiming@gmail.com>, 
 Nilay Shroff <nilay@linux.ibm.com>, 
 Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>, 
 Stuart Hayes <stuart.w.hayes@gmail.com>, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

Deleting an nvme controller removes its namespaces one after another,
about 20 ms each, so disconnecting from a fabrics target with 64
namespaces takes over a second.

Patch 1 removes the namespaces in parallel, as scanning already adds
them. Patch 2 drops the write lock that del_gendisk() takes on the tag
set, which would otherwise serialize the parallel removals again.

Disconnecting from a tcp target on the same host with 64 namespaces
drops from 1201-1308 ms to 115-124 ms. Details are in each patch.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
Qiliang Yuan (2):
      nvme: remove namespaces in parallel
      block: set QUEUE_FLAG_NO_ELV_SWITCH under the read lock in del_gendisk()

 block/genhd.c            | 17 +++++------------
 drivers/nvme/host/core.c | 13 ++++++++++++-
 2 files changed, 17 insertions(+), 13 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261102-bug-nvme-remove-ns-async-ceaaa1eda6a7

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

