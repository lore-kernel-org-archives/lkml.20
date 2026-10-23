Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792722556;
	b=BYRi4WrJRH0v6soP+3MSI5wbhw8acoKZyW1AtkROVDlrOhKkd9pliXltQpMaj6R8igWp
	 dE4vjbkskzNuGfHwdTcPW83XcM9+sH8o/TuMEcQ4UiEaMS/6OWQsXM1LH5WF6q8eY/nL3
	 MzU8QcNUDkxFrK/MwWLNCxnyZ72JuE2+yo7ZA554tIG4VT/xU0N8zwNRwhHVOpqIa1iRG
	 TUqMcr8vyuJAfqHnItpEgLKhkhJtLWzUn4caHoXZXU0PEBVGQjPS3WAZEbYXqEkgSNB5z
	 8DLvszHh0EhU5gG9qf87H+qdqkeBZP/eW7zsHe8NweX+ISbFjKKxgJMGrmLYpon8Fvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792722556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xkWlWpp4ZDY1peCYRRrpWTS72BRYKnKp7I3EGpvyDNc=;
	b=HUEEepDg/YslPbueoTaK21Vx4dYnu6m51z+D6EewWZU8AJkwQJjkofZjHe59v3eMhYAF
	 gD93awC7OW+0aA3j5NEL2qjN232n1RR7jJdzorhnY3ofJ2JCf7Jms/zgJ1hi+cbIFLryJ
	 3fgionQ0CxQtbeSzUAje8xiNjvH8sen6wgF0ZdYApVnRhBhTaz68VND088lblrjB0Fc/x
	 JniqTSVbzgh+b2EU4B8tYON7dt9r3TjR50xZfpqq6ON5sZmso8gmGg9rjNH6I+pb3HzMV
	 4Gw5raCovIIpMzlhURiUxhHhAPa+fgqbFdW2jA59hqWxzgHtEy2gHrULdUpxvYmdgxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WWBJkDE2;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD1D606A319
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:29:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AD1D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WWBJkDE2
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso3485165e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792722554; x=1793327354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xkWlWpp4ZDY1peCYRRrpWTS72BRYKnKp7I3EGpvyDNc=;
        b=WWBJkDE2NtdS8GR4hslQcNtP6KgcVta4LRRPkHeRHo9mN9r/Xb7HTM9KE+6ELFS2zr
         U86r7ENsilFuZKeAkg+zT+iOVPJmaHQEtcne2uT3hUGXSt86+FT8+novDIBMVDr/L9Of
         LBWz72IIozyF5TN0aADcVV1WQELt0iDr5+3GC61FyA2b6qGUH5iL7IQ2sbrBA+JOBfYd
         jZsyVNmX7owo4DGWpBNU31Qqg4FJMPBeMd1tf676ewDb0013TkdG13wuzyYdCFiKWP2u
         Ns8d/ubAeMgfDo0TDghhk01TdVvPY4I5Y7ee1ZxSxI8kQ/NAa6p18hU+GVVQy7EIedC3
         OYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792722554; x=1793327354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xkWlWpp4ZDY1peCYRRrpWTS72BRYKnKp7I3EGpvyDNc=;
        b=k9eArtFexSDTtZNqRiFqcbBd5WxYdrHi9taD7eoscXW/JdTOjmMyuu9jdrg17ifaMC
         D7fF0dtLrxLRshZ07crxEdyqYjAYCkWDRIf44dDcqAfEq0i+Bd3wuh9bVaEfsJ3/BB9Q
         NXlQRJXbXRwGBKlRB8yXHSUEgYZBucGfUjI1/5JUr2kwfEH6ru1qdSE4RaEauxk+Py/o
         CJlh0GhxQOp0Ful9CMeCKXR1FL92lCpwtKYjINOSbBVSHNV2U/51gl+SUsMuIiCBKXQe
         Go3NSu0tCSoY7ZxUi+5SHVFRqvIqpYmGJE+1knqmrq2eSmt27U8fvTgIIycgsIiNxJG3
         TpNg==
X-Forwarded-Encrypted: i=1; AKwUvBzjce5+eyrErsX7n/qTqnmtybe1vcU1fXQa1K9z5sj7CbNCceTqbVvxc847FYewdctRpl9z2L3120iiYms=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgElnZ4Hc8+1+TqMNvdXNEdneg6o9PYgte8xV1xFEI2TbVZFfr
	0QFYZEsL3gFH+CFQirPTDzoD8PjBweZAnnliPkuidVJfH66A3qbp8rKGxZJGYyexYYo=
X-Gm-Gg: AYBFou2GoVZL57PO2NG+AwGX8xZRl94lQNPFHUIgl9DfU655zaz2IkduAd7djDr9GM0
	eZ6X7lWZGpl+nHPhc6nJanz7pJfzQ0+NXdLOkj1hdeLVVxNxRJjmifewVL3yg6UednTWiJNBOkM
	BMsCV+zRK/B5fvtBcY4bauSgmTQpiHH/IVc6Cfzko4MwLuOBJIkFjaehsipAI8L67+qR8A8NmBC
	d6YyWi1WUicBP3YBk2hTXr27TI3lSHiQDZd4g450sBmcwx7C0nM3qRjgM4ePfbND4Ow1mA86osv
	+kpWLU+SQ6RWcYGp1n33IVv3eM1YBzngG1DhtMY+nuYPM2OQpL1wkQnq0y5nKKBS4/WJIzUskBy
	aRM3c9MAtsqfCWy4roETsoeHGJENhZCm3/Lk+nA+zv+0A8llkOHP7nTvCvMFh5M/BK+GvGmTqso
	3+Tf8UUocFS5XwWB4ixulX/0divEI0l4OpI5qKsdAgOhETB2hoIbhXNtWAA3CHuw/4gBLd2wcYv
	QHeKLC+m1ZVZdh40syTtHVfFPx7RIAvVq9roB4uFzdT9x9B
X-Received: by 2002:a05:600c:5251:b0:4a2:1655:87db with SMTP id 5b1f17b1804b1-4a216558881mr551215e9.0.1792722554613;
        Thu, 22 Oct 2026 19:29:14 -0700 (PDT)
Received: from sagittarius-a ([51.37.82.204])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a211b899ccsm25305455e9.3.2026.10.22.19.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 19:29:14 -0700 (PDT)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
To: bod@kernel.org,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Amend Bryan O'Donoghue greybus email
Date: Fri, 23 Oct 2026 03:29:13 +0100
Message-ID: <20261023022913.3763777-1-bod@kernel.org>
X-Mailer: git-send-email 2.56.0
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

From: Bryan O'Donoghue <bod@kernel.org>

Remove old email address and convert to current kernel.org address.

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e8d5b020b7614..2276751fc8c45 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11313,7 +11313,7 @@ F:	drivers/staging/greybus/spilib.c
 F:	drivers/staging/greybus/spilib.h
 
 GREYBUS LOOPBACK DRIVER
-M:	Bryan O'Donoghue <pure.logic@nexus-software.ie>
+M:	Bryan O'Donoghue <bod@kernel.org>
 S:	Maintained
 F:	drivers/staging/greybus/loopback.c
 
-- 
2.56.0

