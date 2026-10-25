Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792959566;
	b=SWcgTwfUDb8crmYqJJ6TNqiuUFMv5NtheiBa6w6T0/staDCATai23MM7zHoWF31TMVU8
	 s/s9Ia/cfB6OFKOZ2/dPzgM2kBllbNcVAGAggzP6K6A5OpKAk6jFV4um/nPecvOhGEUor
	 HyUvjSrlR7KX1WMuOsXBya5kpZBX8ioEunJ6XjIXRcwiGXrDVLmWHkbkW36+5HcKS5WcP
	 Sp2ZConVwaALVcoGigofnH6U8m6QNvR6Qnl11h5WCcxiYxGzGUMwihhuDu2bROb2DdRc3
	 YmiRqWJx0UV9/ZhrMaysx1aTDV4BkJamdNzeobsH1jsBBR5IuMw2yzrJ00TqippTPFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792959566;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nFsn6GsCb++hqUei+F0uCFTH8XCAX6AMJvfUo6GyI4c=;
	b=bQ3bpDTH0uGQzWOIgE4mIG78D4bGipj0dwLsaRJRVr4/1rPm4jIHqXs8YX/mFbI/EIJG
	 xo6V/cB5jQaMRm/yKoCRL+ev6wmcNYnGvD/frCs/uaI/PTzwdjbq0YoQCL5xlTMNlvcSb
	 sg0r366+VkbTTMc9fYs5tlAFmfKgpp7dBNR2QQRER+LhGv41eepLiQzVTVkr1KjfqG5qm
	 6a4zGbkbEQJlk7424oAlFiEtOuWsiTzfSLjwDsLozlN8GF9x9tZlamKLArOtBeDp9t6eT
	 kNZjsTT1h5pIBh82I3O4ZQq6LlbqThv9ocnzcijkgiqJJRiQlar8WXHh1NTdF+3AL/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OqfDgpp2;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UYMNVllp;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB72606A326
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:19:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DB72606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OqfDgpp2;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UYMNVllp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792959565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nFsn6GsCb++hqUei+F0uCFTH8XCAX6AMJvfUo6GyI4c=;
	b=OqfDgpp2ufJijIjNkZuggFE7j66lD85wxWAzwzrlEr7H1p3iLTeoxaMq8xwtUtxO7YEzKi
	I8YTCAMkFvojQ99ylDdCsr/DYzeLofo6aUr9Zoq2f/5JhF3jvlTZEiXVAdE1WNS6Y617s1
	JLrHsRsnvOzJcBiFh5KOCUCYARQE73k=
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com
 [74.125.82.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-oXL_WRJ0M3KKn6jwYGRy7g-1; Sun, 25 Oct 2026 16:19:23 -0400
X-MC-Unique: oXL_WRJ0M3KKn6jwYGRy7g-1
X-Mimecast-MFC-AGG-ID: oXL_WRJ0M3KKn6jwYGRy7g_1792959563
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-193b5eb133eso3299200c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792959562; x=1793564362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nFsn6GsCb++hqUei+F0uCFTH8XCAX6AMJvfUo6GyI4c=;
        b=UYMNVllpfiQz7Gj3e9sqv3+G8LhikszcvRv7OxzeMW1976+4qLWWtyN6lYj4qvS1XQ
         zM6hUEbVk2k4gtWNh724oxuSOqBy/3jA0SmDtIGvm6f9xF0AuAHw8vG8RcXG87c8Sh+p
         iBMp6WY3to08G8U2Uf5wQozFI9GtguvyYfHITNG/TborpdBwyZD9lF9uaLk3/9rKrImk
         7wkKHOBvr9bdDh9u00vSFx4TAhwkqauL7tnVF5wsPAhtsyKFk+qxudzNtmrEtDRW1xcT
         IJoVPuvxeIpxVzt9BnjZEnvy5Pz49iMbqqPUtvdI9wnHttGNivB+U+x+Y1BsOLRSQ6qG
         o7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792959562; x=1793564362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nFsn6GsCb++hqUei+F0uCFTH8XCAX6AMJvfUo6GyI4c=;
        b=hXBL9ZT+Wo63sKEakY6R+eaPnOR+DxvZk6ES0ZJpWqWUiAAwunWipQTyEUWW9crw1x
         YuBEZg96kPrzGIF57DhjQuJhz2gqBvH1TsgbzgtK9GqCB+gvjaaQX0nu7PPYJXQ7Tv2j
         15nvZpPjWAPGCir1yphJLsC5H9NcGnjFTguSkZ4rkyxHQkA4DcNet5fBp4hEFqTTJxkp
         Q2RKZuszRGKBLhLC/SfvLToFoKl2Ms0Gb5yPjUmEXtAYByk8XwKvIr0dqXROJjvUxR0r
         XxNZg/pGU+T+I5W7WBzrl+htrOjj8ClR+7XPL79jQ7lnw66ym3opyi/kdnuLCrx8AY/l
         AcsQ==
X-Gm-Message-State: AFq9FYLc8TWnRkFCztD9oTGeg0PXMBKS5jPuKDEoHgZRkRpzJmCNWz28
	6sggCjD4IeZyYQgSng7EEU7fezpT+jPYY5JVMCYmn0fyWTM88DoBDVBcqlZUX1vHPdMEt6E2Upi
	GtgKHI5KyqiO+fdBgp8X6oHHr5x09AhvVCCMnM5AWznxoAYYoSzI9HTzbcYFrcw9aSQY//Q6jHs
	AfilDMff0JNet4VQIy8JXRIN7q24hnyMu8oijHXXm2xoRHDIKO
X-Gm-Gg: AYBFou16gwBYeUzu4sQjzvTdEG/7180FMHVy8MVjKwws/nIRDIBljWMKhI962O36xO0
	XPbF2V/DjIasaiDGebk+9VTt5Vv4wJhkZrADHzx/rL9T1jkiQUqgyJTp94k4QV5C/1p8/htZ6eQ
	cRwAjjNCa9++KF0wxr/LsHab/AXVIH+t9Do2bnyyuUG/XPj1PUID9CaE5OR7MqUv3DhktXe/HSI
	ULkIHVbh4QgfzvTYHpbZbYqws4leANEbjaeTd4+e5SzjVkc8H3c/cZIC4AJao1dNf38fkP3NJ17
	EF3K7Lif8UjFnJ9gLFx2EaUiWCYq+hqcu3nwyXdBAuAMQLi38nQyipc/q+Jr0XJQhVFZvFd+79J
	xLWoU4X6EPrK24+d0zdzKFeOdbcwXpcXHbFF+NrUM
X-Received: by 2002:a05:701a:ca0d:b0:144:eb46:be0 with SMTP id a92af1059eb24-19934a952bbmr8319095c88.13.1792959562492;
        Sun, 25 Oct 2026 13:19:22 -0700 (PDT)
X-Received: by 2002:a05:701a:ca0d:b0:144:eb46:be0 with SMTP id a92af1059eb24-19934a952bbmr8319058c88.13.1792959561796;
        Sun, 25 Oct 2026 13:19:21 -0700 (PDT)
Received: from fedora.armenon-thinkpadp16vgen1.bengluru.csb ([49.47.195.13])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d59f90sm17656169c88.3.2026.10.25.13.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 13:19:21 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Jarkko Sakkinen <jarkko@kernel.org>,
	linux-integrity@vger.kernel.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Arun Menon <armenon@redhat.com>
Subject: [PATCH v4 5/6] tpm: Increase TPM_BUFSIZE to 8kB for chunking support
Date: Mon, 26 Oct 2026 01:48:57 +0530
Message-ID: <20261025201859.221991-6-armenon@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025201859.221991-1-armenon@redhat.com>
References: <20261025201859.221991-1-armenon@redhat.com>
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

From: Arun Menon <armenon@redhat.com>

The size of the command is checked against TPM_BUFSIZE early on before
even sending it to the backend. We therefore need to increase the
TPM_BUFSIZE to allow support for larger commands.

For now, 8KB seems sufficient for ML-KEM and ML-DSA algorithms and it is
also order-1 safe.

Signed-off-by: Arun Menon <armenon@redhat.com>
---
 include/linux/tpm_command.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/tpm_command.h b/include/linux/tpm_command.h
index fc446a1282e2..4ad11068b090 100644
--- a/include/linux/tpm_command.h
+++ b/include/linux/tpm_command.h
@@ -434,7 +434,7 @@ struct tpm2_context {
  */
 
 #define TPM_DIGEST_SIZE		20	/* Max TPM v1.2 PCR size */
-#define TPM_BUFSIZE		4096
+#define TPM_BUFSIZE		8192
 
 /*
  * SHA-512 is, as of today, the largest digest in the TCG algorithm repository.
-- 
2.54.0

