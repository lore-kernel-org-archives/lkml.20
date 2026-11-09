Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246460;
	b=0wzLFGoHSXEvHfm48QZkGzXh5C916ywsP6nsEDgm0pnwdeLsS4JK26mrS20x8EDjF8ux
	 f+23rSpTFvyLJQRiLSKaM+5a4Sx29wYjN8yJ7hoT2N0Y7LCjIZOl5z6BsjuEY9Q8Qsx5k
	 vQTxPYG9losfijs7gIcz/rMoDvW0XEOuBGuRiF/pIB2RlyK2CmlXDULl1c2kH4LvW0xPs
	 LefIX6u0ttnhoeKmkufnP2bUAJ5NEqsh3Pd6IE5kb+DNOopzact0A9WcyDfHDAO4KGopU
	 5AwUHdM9JFtHb037OD6b+aolnJYrCzLFTTnE2JPbfNVgFe4cj+rXSamgCht00vTUBaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246460;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=l4Ysp82mBOSxfH4gTrCizBiRG4As+fgIqRX9DQOV8wk=;
	b=F78ThzbXnUq4BJLAjjGc36SiCLqk6Wm299Wyxl+qAWZsuY1VpvdCDtk+fvAho5bVffRl
	 JZkb8mU/OAkLttnfRwY+zjNMF15hDBRa7dc7Akay2vRN5hXee619WiqT/eKJEZ6IduTAi
	 STp78d9buIziBB2OmxEemZmQZErt8VLaN79urX55ZuVb4/SipApQPINSdirHiIxlwzcJv
	 rA1y56i8sElcBOunYS+DDkZjghnBX+/7Caz71WHJNRGpFLF6D+8hlnxbqzgz3mUW3b1Dk
	 V5UC2wF7cOtwZ9ngELQRIMxiW9GkbVvPpIoxLG4Yxfaf3ch0dIBexRH2qASa2Gf/T2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WwP6mQVQ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=E67jZoly;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0FE606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B0FE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WwP6mQVQ;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=E67jZoly
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794246459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=l4Ysp82mBOSxfH4gTrCizBiRG4As+fgIqRX9DQOV8wk=;
	b=WwP6mQVQvldpsdg4Zciry7MP6sv/eLP5h5uHZpa0QnvjoD8BdVIPfgcOW7at9XnCkyb2dL
	7MOjpby9jMmJ/FR2MZM9Mej8yvp4TKb9DNqrVnwk6+p5MB84DKccjXZrh1fKRE7JQhTXLc
	8lomfoNNv4w7WYygd82CToK++lcFNsM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-GRDQvJHCNsOk6BeR0CiQRQ-1; Mon, 09 Nov 2026 12:47:38 -0500
X-MC-Unique: GRDQvJHCNsOk6BeR0CiQRQ-1
X-Mimecast-MFC-AGG-ID: GRDQvJHCNsOk6BeR0CiQRQ_1794246457
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-536720195ebso24166301cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794246457; x=1794851257; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l4Ysp82mBOSxfH4gTrCizBiRG4As+fgIqRX9DQOV8wk=;
        b=E67jZoly8X80Z0G1No8bi2x2eqC73wQPyetqPKUsjLaVJdrl36R99qBB3cAIxRxOFH
         4EgdAdRD8eIj5GdI+BcjXX1O/g4600xCMok/wbhJrdFsRh1GnEiISqzwjSLnfwP7LGU2
         OdtAs7yFM1uA1DVrDm7rvEnUSmD7L15h8c5YYt9zVSqReBt9xpvHv7U8t+wH8N4Sr1MQ
         CKAm6GkMZ1QhCJ2KbG+Q1idvxbkumUu7sZ8bAYMrz+5uEiuX/fCsQdWcnbgh6Mp4yuNT
         vKIuY6sF2HmQKAuN6d6Iun5ZvvPabQ2s4epb9cubnJ8BK9Lac51ugp7tKMj+y2TDJpgE
         4qZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246457; x=1794851257;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l4Ysp82mBOSxfH4gTrCizBiRG4As+fgIqRX9DQOV8wk=;
        b=GjlyPlFHu56iQK4ttrSWw0XNrSFadJRnt96/qiGt+yeJnuDWTqx/eWhrzqHIBk2Y+b
         LYYaq4+gcjEu0tJIDko3UHtuu7WCFAnk7/eoHL+qgy/6KdApU4i/3MzP84F6ZvnEL4K1
         MI1ND5Vl8GZA8mAH1Hj/5RJ5nxpUck5sxFqjjvseYvQ8ojmb0HaQaGNklJFn6iG11AmB
         xGtOa72ApF2YB9sPRcKKrXLmqh4RSqgshWoHHnm4wq43cxnoFhk3q6AiLA1YeE7Gscg9
         VHcqSf1quh/hxq3K7ohQ3QKNxVfRjxXDYzmCAvRC2g5N+FPhUn99kvIeetv6UrR9NguM
         w4UA==
X-Gm-Message-State: APuU4Z9bogN+EWXQ37sTSTaayrlZnMShMfFVFrmTuIduneAGiXUNMm4E
	6NsizQV/h2RQyGVNdD+0j7EETj2c1mjUD1rQa02OjJMA2tf7vaAwbBE6PtQAy8vS5UenEuujl60
	g+gtmLkDS8V8TgBptRASRzGhPHGFgMw/cQYs1l+uL7eE4sBWbQN5E6bDX93JU86u7I20s2C4+NE
	JBFBxOmoh7QAKNdhoxKM/riWjiggcFmbXNKNI9SEwd+lJ3wDeD
X-Gm-Gg: AYBFou0CQEZutZUtcgobcXA0ePp4UBjlMBe73oDqXN/z8m+pNmoqNtSl0Iagfi/JUSK
	yp6H84Oegg37D6kJ53bAjb5ITSSjBXQe4r9f46t7/zDr6fzLDewj+oIEQMF4F0Mzv2fUOc2pC6K
	QiaG7YZ1JkhSZyrvWoXVJFqjqSM51HXG/vd/6lyBLG9kBj3o40hkywtFB5ph3RRijErs9JrlU8J
	7LaHvTv8/Pw/S4Ran61jPWnvNIomC97exWwNsf8r2wm2al6vWsCpQFrPwdbrv639ich5/2JN36e
	WngfkJHxef0WlfvuKYTIs3hhwaGfbGKFcugzbplclock34pBZwG3SW1/LURhV3MHHaJFlf3rlS6
	SGo3jiQHl7lAKy2rtctt/A+kBcQePnnum9M40pkbQZVANuKjGhvzljoPD9ovOiQe/UTyNyPh6AC
	oYwN4F52ZKroFUiBcoZ2LlnWp39+bflYC1KUYDkS1Qtsh+3hyJXRso0Asc
X-Received: by 2002:a05:622a:2589:b0:536:9a5d:5e79 with SMTP id d75a77b69052e-55529d80557mr234491cf.54.1794246457362;
        Mon, 09 Nov 2026 09:47:37 -0800 (PST)
X-Received: by 2002:a05:622a:2589:b0:536:9a5d:5e79 with SMTP id d75a77b69052e-55529d80557mr233831cf.54.1794246456469;
        Mon, 09 Nov 2026 09:47:36 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550b9438dbsm2595121cf.19.2026.11.09.09.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:47:35 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 09 Nov 2026 12:47:19 -0500
Subject: [PATCH v2] extcon: max77843: convert to module_platform_driver()
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
Message-Id: <20261109-extcon-subsys-v2-1-118a58a851c0@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQ6DIBAFf8XsuTSAhmpP/Y/GA+JaaVJpWEo0h
 n8v2HOPk8ybtwOht0hwrXbwGC1Zt2SQpwrMrJcHMjtmBsmlEoIrhmswbmH0GWgjJhvZcq0H3XQ
 d5M3b42TXo3fvf5zNJ5pQIsWYLQXnt+MwiuL9a0fBBFP60oqhlvWoppvHcdbhbNwL+pTSF5iee
 9i9AAAA
X-Change-ID: 20261106-extcon-subsys-24280aaba499
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1917; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=zgzHc4C+3xMLHgRmoDRVBRWqK7Vn4EPKbCVj+Zgy+/k=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLI+sRtweOg/2+5089byYLt0Vj5e7t/RSZM3K7rwihwyO
 fuSUyCqo5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgIm88mdkWC+1bvVOTqPWahs7
 +ZX/c488fXSVtX3qvYcvHYJOxdec0WFkuLjH55vKZVn5v4zcCWo+8xzc3s5XDA7rKXxicO39Z66
 vPAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

This driver is currently registered at the subsys_initcall level,
however this driver shouldn't be needed for early boot, and can be
converted to use the standard module_init().

This driver already has the standard MODULE_DEVICE_TABLE(), is
configured in the Kconfig to be a tristate, and the driver doesn't
have suppress_bind_attrs set, so let's go ahead and reduce boilerplate
code in this driver and convert it over to use the macro
module_platform_driver().

Note that currently there is no __exit function defined and this change
will add an __exit function that unregisters the platform driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Changes in v2:
- Change from module_platform_driver() to subsys_platform_driver() (Krzk)
- Link to v1: https://patch.msgid.link/20261106-extcon-subsys-v1-1-6a781b323d6f@redhat.com
---
 drivers/extcon/extcon-max77843.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/extcon/extcon-max77843.c b/drivers/extcon/extcon-max77843.c
index 2ae9f7f1a67f..7fa42e3cf848 100644
--- a/drivers/extcon/extcon-max77843.c
+++ b/drivers/extcon/extcon-max77843.c
@@ -960,11 +960,7 @@ static struct platform_driver max77843_muic_driver = {
 	.id_table	= max77843_muic_id,
 };
 
-static int __init max77843_muic_init(void)
-{
-	return platform_driver_register(&max77843_muic_driver);
-}
-subsys_initcall(max77843_muic_init);
+module_platform_driver(max77843_muic_driver);
 
 MODULE_DESCRIPTION("Maxim MAX77843 Extcon driver");
 MODULE_AUTHOR("Jaewon Kim <jaewon02.kim@samsung.com>");

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261106-extcon-subsys-24280aaba499

Best regards,
--  
Brian Masney <bmasney@redhat.com>

