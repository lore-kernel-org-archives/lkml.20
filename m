Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794865166;
	b=ZNMLyootTzcIxR4sz+sUjDNGDu28P8/BO/KdjMT2rpepaYTlpnR6R0gCrQ+scbxD7K26
	 tIYAtNHWZ0fMdkl+35afA80i+A+v5WaSyIf/P06uFcLEOjY5Rx99CGnH6D7HN1+he6du1
	 q+E57gc0ZJ6ntMWInj9fHwMkwK/n9FcFVGgT0YQnmRzl/ppgkGsQKTz6DbDM8NNwmSoAD
	 TaLZNcvFcFBKt0pPDSixKE5qFUVHGkuErGsltvux1Su+3cyo6+rMw9WtlVnY2r6F3kq4F
	 OAYwZCbqiD81muOBFXr66JxHXY1iwdBys59vOeLLoEuxi0TmaaNxoDM633jdPq4ok9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794865166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:
	 Content-Language:Content-Type:Content-Transfer-Encoding;
	bh=opnkhLUC6ThL0jMd9CJlNSJPx4niwGCT/r4/32rpuBs=;
	b=5PewyfSdr0EMJllHSKRLG3Vwz9x2HoGw0ZCFKO2P7AuQQ68RsjTKHc3B1lkx3x2D0KCw
	 TVyOtFVQBBTnxendssOHB25l/l98dloX7EgHqGA/w89Dijt5DkAy1PXonQ4111RB/mIUI
	 DKm5ojfEl09trkrzFXhpDSViaR1zHyTkfjMQcj47Lb+oPMaXQ3Avox6KdeazmqPNi6+2H
	 gKwku46Xowd+NhDpbwDbGqg4pEByX8AmTND3ZR98Hgo/TS566breutRC4gk0DvJFqoEIP
	 o5QfUt6TjHszBDTotCf1d01b3nWrrRjO3MYQkaaS+j97aANwtkCrw3dA6zC3pfVtHnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0sJwunB6;
	arc=none smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1919606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:39:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1919606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0sJwunB6
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-67dc7eb1442so354229d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794865165; x=1795469965; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:content-language:cc:to
         :subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=opnkhLUC6ThL0jMd9CJlNSJPx4niwGCT/r4/32rpuBs=;
        b=0sJwunB67mZVBzvystQxzO+I805REdp58OlLmomLRxAPJqq7ZDStUzlEv87kHZZCtW
         qtbDLZQLHtYWFlvakUOSdEGVHnHjZugOr5i2wSZKuoV6SmrM/p7kh9QLDxFWS6skrtG+
         A4nTG4GabTURfQIQbl2rTZv1ZrGobHuOgDoULll0s6bHuttXEbIcu5ATiuD1K0lDwKtM
         3go0Paw1WysOBnN8F1QwsVpMzzsapPlNBgOJM0UEM3283e0PEle9juiEo0laHgaoQmgx
         S+gcQhHIs4MwwMC53ku2Xqo7Zu/XoId1WMcMcrJiu/8XIDNLGyujwW5VW62C506r8RW3
         sIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794865165; x=1795469965;
        h=content-transfer-encoding:content-type:content-language:cc:to
         :subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=opnkhLUC6ThL0jMd9CJlNSJPx4niwGCT/r4/32rpuBs=;
        b=qrlK/wQqLMmrq9S300bycmIuy8jiNP5OWmyJQK8Rc/LjodDHtyC9qi1BFgkKONm+wb
         JHtvUDc0q+506NNsvJl2x0eYryi8wNO7CQlo8HO4EwaqUR7DlURvJOPpLfYAHKA4ltsN
         mpYPgji685x0rakIiR5nlyVuQKg4N7JWcxVWqvfGueVl+ycEUh45JDXzAAhV3cEuZO4N
         GTLUeOTKihQgM95XZECisPv6iG39PXZXd/vNGKU3M5MVqfUDwHHid17AO5Bs2lLhiqGp
         dw/UKIajeqNyUcnGghaujuXSoBytbEGJaKw5MJVwMqZSZspa2jJIdHEMStnfcXVN7NId
         NsQQ==
X-Forwarded-Encrypted: i=1; AL+hErF1vTzj5Ti3gcViEaPG3nyFFJHtqPrw472iDoIttxUvM0FJybWJRMLgjwTkDsQtI7uw7Ya68316KD6gjsU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rT0Op8v8OzTBmdPIV13hD3RnNE2w/33/GoOG0rPlo2b/DLyu4
	SJTKBl7nzLXyMd2nXJvOGhYfiXmhR4RWp00ZgsrLYFBg3Pthnesh9tZ3
X-Gm-Gg: AZFdTZdJgajY+h+e06Vp6MBYc6WqUxbalK9lYJnulAiEQE7vN/Lumq1QuO3xVV60dqy
	xieRnhWT5C8ayo+0IOfC7bz+a31oevk313SGHZsvkLAoHWYv8NoT3iT4iP1yDUwLRIP8LLfjjRH
	yyRa5GM7PoKQpnuFQJ92D8NC/2N/Kz1QysNflv4F6i3a5U7CopDwC1rUVmY3pxx9AdbC/RqqsjD
	uxFcbpQc2dIXnVRKB1ZmNnSJ0Uyo+SebK/zFO8lNnuguIN9QvAOPY2j8buBcXK6KprxTESv9KvD
	U3ZVd1/s99hL64y0vC2tUL0UCPC0MtgcF0r7mDyDsmMWN8zMLhMtS+R2J87eMbjRQQUP9iEgYW8
	7Nvj5UzHu0GGvugx9aIUS3nyvsq0n0C9XAk6p6OTvtath0QbNpWFYgl7mdkbohC7SMnsl2bGAx6
	4n4JttwNNQfzeC0BLxX5kw32kdvKYSi7HR3k6UcBmlkFAawoF1cRaT3Qm9F5Tek4SJP51piVu0f
	nyZOvGkmBLHSGAFqy5zQlMS34gAhfy5pBnunTqpiv/0bQsYXZUasfh3y4Yxjg7hz0mqwMgaKIYJ
	wwad2n23ZPG8QbPYWBsHBsvJ7qaB0lerupCQmFPUIPa00TpLp+jZVatTjzXnQMtBc6cokmFV+e8
	K0tdqyos7lfsGRRLpl0aPxdZE3FswrCeuMySn1uNl39sq/5wYz2OIQFeVGzG531yyr3jEQO3f7c
	l0oVGs/nhr6W2QQ8qSizgLgSsUD43iS4yKzae7pdByFtmYmK5p+1Vb0kaqFt5uQFFdHewIC6C/S
	SmmWQN2eR8=
X-Received: by 2002:a05:690e:1247:b0:67d:bedd:494e with SMTP id 956f58d0204a3-67dbedd5bf7mr1613692d50.0.1794865164830;
        Mon, 16 Nov 2026 13:39:24 -0800 (PST)
Received: from [192.168.207.4] (104-12-105-135.lightspeed.miamfl.sbcglobal.net. [104.12.105.135])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a55b09esm10924904d50.6.2026.11.16.13.39.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 13:39:24 -0800 (PST)
Message-ID: <9ed2d8fb-fad5-44b3-82a2-0021edb405f4@gmail.com>
Date: Mon, 16 Nov 2026 16:39:23 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Perlow <jperlow@gmail.com>
Subject: [PATCH] PCI/portdrv: Do not advertise DPC on ports without an AER
 capability
To: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
Cc: Darshit Shah <darnshah@amazon.de>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-kernel@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Commit 97ca178c899d ("PCI/DPC: Allow DPC on all Downstream Ports when OS
controls AER") makes get_port_device_capability() advertise the DPC
service on any port with a DPC capability when the host bridge owns AER.
It dropped the earlier per-port test for an AER capability.

dpc_probe() still returns -ENOTSUPP unless pcie_aer_is_native() is true
or pcie_ports=dpc-native is set, and pcie_aer_is_native() is never true
for a port without an AER capability.  Such ports now get a DPC service
device that can never bind, and every boot logs an error for each of
them.  For example, on a MacBookPro16,1 the Cannon Lake PCH root ports
have DPC but no AER capability:

   dpc 0000:00:1b.0:pcie008: probe with driver dpc failed with error -524
   dpc 0000:00:1c.0:pcie008: probe with driver dpc failed with error -524

Advertise the DPC service under the same condition dpc_probe() uses, so
a port without an AER capability no longer gets a DPC service device.
pcie_ports=dpc-native still enables DPC regardless of AER.

Tested on two MacBookPro16,1 with v7.3.4 and v7.4-rc3 based kernels
carrying an equivalent change (testing dev->aer_cap): the ports no longer
get a DPC service device and the errors are gone.  The patch as posted
builds portdrv.o with CONFIG_PCIEAER=y and with CONFIG_PCIEAER=n.

Fixes: 97ca178c899d ("PCI/DPC: Allow DPC on all Downstream Ports when OS 
controls AER")
Cc: stable@vger.kernel.org # v7.3+
Signed-off-by: Jason Perlow <jperlow@gmail.com>
---
  drivers/pci/pcie/portdrv.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/portdrv.c b/drivers/pci/pcie/portdrv.c
index 32fc623dd4..e7358e164e 100644
--- a/drivers/pci/pcie/portdrv.c
+++ b/drivers/pci/pcie/portdrv.c
@@ -264,7 +264,7 @@ static int get_port_device_capability(struct pci_dev 
*dev)
  	 */
  	if (pci_find_ext_capability(dev, PCI_EXT_CAP_ID_DPC) &&
  	    pci_aer_available() &&
-	    (pcie_ports_dpc_native || host->native_aer))
+	    (pcie_ports_dpc_native || pcie_aer_is_native(dev)))
  		services |= PCIE_PORT_SERVICE_DPC;
   	/* Enable bandwidth control if more than one speed is supported. */
-- 
2.56.0

