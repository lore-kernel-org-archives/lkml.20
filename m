Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792886923;
	b=vo+jbkCnfrRcePaSSdeONTiiXuFwDvIUzwVetUIr3HZxOAAngpLZ/xTjocWz0iW8UXnX
	 O1SJ1soeEYbOUJLSSET42ml0ZtSOj1Jlt6+VjBE8lU9YwW22VBKQ4928csLotYjAk5txU
	 ohbOTTFtjzyY5PBamoBUhuMcUvgMnOQNZuSn9cYvFp28pl/BuQ8nugnSpkIigAldWjZos
	 JqIHK0Xf2r0v15CcHtCDICAgPmpPVok1t4B2W8ipftX0qrzstPBQYkuUfbYMORzHee5ZB
	 IygvO50xD9RqoC9qxtXavZFq919OcWfksrGbQktKfEIyUipVBx4Y7kH3wVooa0GLXXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792886923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pPVrxLHgw9uvnWkIbWwQACs8ELNvhdEnjrajTTffzFc=;
	b=Og5Ce3pvk/yh4KXjhohhKukJnABHWEGxjRgTUBJWnWnh0emY42I/1BCpn9Zy2Ow9x2dJ
	 9RaQY1wQak6yC5RNT4FQ15WOGDY0OaWgFeMXsb6XuAuGiSEjope8XML7+VhHBlvwmF/4B
	 AMXAmueDM8w+UUo0vhYmi1PeMVKamSV8C5rP/cDcTmDoB5LTdA7uk7X7+3lrEq9fzNr/q
	 F7iQVMWaROeTqD7IRh0U+Cimkp+PjFZ0PDPH5RMH/eBXU13WIiRmVOQ9/mHJW96e3ULud
	 LEqswRfBqUciiEPgfzJYM3tiIEKWnq2m2DHkgzTo4nYI9I3AWsNqaBIrl/8owcbrq/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DichRZ6h;
	arc=none smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F92606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 00:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59F92606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DichRZ6h
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-679aeeddc6bso2250829d50.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 17:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792886922; x=1793491722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pPVrxLHgw9uvnWkIbWwQACs8ELNvhdEnjrajTTffzFc=;
        b=DichRZ6hJkdUXVfBKrhYXbsiCL67VTcfIrOWgv+u8W6Jd+P5WK3cf5Kp0rMNuSwEFZ
         6fEwgAMv3OHfxXZQwVdewFQ6VKY5WXwFB40tMqVEFc4y5+5NEqaOHyo72zJL4EkDxwWY
         ZPtMSbPdoJUknVF0HPe5G42AtUzUeaq5K2dUKQ6IzqSTaKaqOT936cXXz9S0HdEGqPRw
         hjnbNdQTY/z6ZUUi+IlXyaH4meZBe1Lie847+AvLXvLlqI1AQfbXi4UiQqi6YS8XN/SY
         eLM3/rMZ03Lak192bARgduabx0G8XTnNbeOp46NNJoMJQtSDpV5o/R7QKPX2ZQxAApFx
         j0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792886922; x=1793491722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pPVrxLHgw9uvnWkIbWwQACs8ELNvhdEnjrajTTffzFc=;
        b=XAysj/xo9YxdxUK5/EWY8XAjoMUUjDjsRSskS5CL0kaVuPMOp3yZtWTLUFa520ZF8s
         LXgOrtq1k1nBwVVzkQrTo2yyXuEbq8cueeaym0uhGJ8lsuhGkOndDUxMKwSaBBZZPJIy
         rrS72FCcNsdXAngUeVlPhEqH090DEO95KgyeBsJHsSzzJkM97NWVACzlNvnxzpfUcMWj
         qoWZIk0Ri7GUKjpMGeHMG8KfPK454WQfX5v9vJZFcGglMfX3fJhohDoHXqK2U43THD7T
         ENiq8bAZXzyZvitp4iC7rUBOOcvhT5P2Obr6CAfeukNw/kb0HucFWioEOJx9Ha9iLGNW
         BQlg==
X-Forwarded-Encrypted: i=1; AKwUvBzPRB9eZ9SSxiQ785xD2WQ2o+AUnBrobMQ3MGllZB6ivTVZbmPZM7Nnkc3LPMUOUA5eGs21qx63JTEGZeg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIscmGd7hJohsrC7nHULA68Dmles6iNoMvooM35dsD1J5HDz++
	4HsHcdCsit5zzLQJ9SuyqXwkbVN2oJEMTh5aOGG20HHXFJONe4m19uBHwkXtkQ==
X-Gm-Gg: AYBFou3gxSCfk5Uqb5TeEFqhjmtgdqCKp+tO8p7whuG9becD8qZ/Hfyb0BTPmnqnZT9
	kqN25+bYuY1QGaloUU9CzaOYYeF+ZEm4loqzcQ05SWpoVn/0ihVCaO+amtnzLlRxUQoaSeyYjmv
	g99siOyt8l78j++iDIXbJ4iqBqNs50NTCFckKRe4gS05BLzn0EflrEFeed7ht66UtkL64ckTOFx
	8KOs4O6bNfDPdEsLlqA+VhJU2rkO5dwxTWZN/p3aP9m3OCvA2HrGlksGvP/pQ1phJz118E/a4KD
	xyhJ1s9shr6zDFBtSWFDkyofIMYCe/sAF97UmscHRT1PUazx8N7EvvudST05eEsxBFg25CTexDJ
	XA6A46SoeNr6Tq3BWjJ1av5g3hsMSY+AC5OCEsc7KiKsvO7cfISRe6Fy2nPm10vtlmvkmVaweh6
	Ov46PCxPidCHYD2x6/Xa6qDVJDUtobkOMiiL41cf2Aq+lrptarUNn7kGqhuK/BPeR5dM2M9ZBVx
	OT3lz6tBVtelQ5mpe2buw5F+e3XHYT1S5MVYHLB3dZajPa/d24jIwE=
X-Received: by 2002:a05:690e:441c:b0:678:3418:8cfd with SMTP id 956f58d0204a3-67a455397cbmr1541589d50.104.1792886922563;
        Sat, 24 Oct 2026 17:08:42 -0700 (PDT)
Received: from gmail.com ([2a03:2880:1fff:4a::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a461a715bsm1511878d50.6.2026.10.24.17.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 17:08:42 -0700 (PDT)
From: Matthew Wood <thepacketgeek@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kbusch@kernel.org,
	Nikita Vetoshkin <nekto0n@meta.com>
Subject: [PATCH 2/5] PCI/sysfs: Use user config accessors for bus number attributes
Date: Sat, 24 Oct 2026 17:08:30 -0700
Message-ID: <20261025000836.58294-3-thepacketgeek@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261025000836.58294-1-thepacketgeek@gmail.com>
References: <20261025000836.58294-1-thepacketgeek@gmail.com>
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

secondary_bus_number and subordinate_bus_number read config space with
pci_read_config_byte(). The kernel config accessors don't check
block_cfg_access, so a read that races with a reset goes to the device
mid-reset and can fail or return a bogus bus number.

Use pci_user_read_config_byte() instead, as the "config" attribute does,
so the read waits for any pci_cfg_access_lock() holder (e.g.
pci_reset_function()) to finish.

Signed-off-by: Matthew Wood <thepacketgeek@gmail.com>
Tested-by: Nikita Vetoshkin <nekto0n@meta.com>
---
 drivers/pci/pci-sysfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 6669e9ad5bd3..b37a285d717d 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -267,7 +267,7 @@ static ssize_t secondary_bus_number_show(struct device *dev,
 	int err;
 
 	pci_config_pm_runtime_get(pci_dev);
-	err = pci_read_config_byte(pci_dev, PCI_SECONDARY_BUS, &sec_bus);
+	err = pci_user_read_config_byte(pci_dev, PCI_SECONDARY_BUS, &sec_bus);
 	pci_config_pm_runtime_put(pci_dev);
 
 	if (err)
@@ -286,7 +286,7 @@ static ssize_t subordinate_bus_number_show(struct device *dev,
 	int err;
 
 	pci_config_pm_runtime_get(pci_dev);
-	err = pci_read_config_byte(pci_dev, PCI_SUBORDINATE_BUS, &sub_bus);
+	err = pci_user_read_config_byte(pci_dev, PCI_SUBORDINATE_BUS, &sub_bus);
 	pci_config_pm_runtime_put(pci_dev);
 
 	if (err)
-- 
2.53.0-Meta

