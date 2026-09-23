Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB2157D202
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790196206; cv=none; b=NHt7sGm8YfqpMB7vEZ/mpJXnSv3cny2x0Rkgj5mVCsijjyfbi6Pr7eU/RamlxKt6ysKYqvKH1DDWHH5/t/o38+CsLnMk+Er2oaeYdP/6p21dbDqdmqA2XIrPXHqBKR9Xi6kAFwD5IBDIUoGKTUsuggHbRngQPi6ZS06blrjmMSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790196206; c=relaxed/simple;
	bh=MkdxfzNK3Aw/xczi5euKuiD+ogoT8JhdeeYotSXEeEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fqBIW8T++KtSjcQAQ/9SiFlGAPNlMLs8aqVW7LhY7+jqwZRIzo0IeK0SYCkYzJ5K85PSbE00OMf/l3XcfoAArQYjBZl8tF4Fbx4SCvTXXTzxywp1HXuvRmjXOlh7Xv2BXuhWCHXtEL0AXjoRSVWhcRz/8UtvhILcWsCAGwQOBW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=mhs4PXU+; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="mhs4PXU+"
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C3F013F786
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1790196202;
	bh=E0S4RGo400gWyKWjQ6KReY99+fLF22ntkggQIWdD5/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=mhs4PXU+tDH9wva3U5RbhCrybJyUwyl41YVnGyVu/wLKoevIOZvd/AONgk5kfp9lV
	 61U4b61JbLWVsfi2YUq/ZguUm5swQRXSnihSqgqj2B1nXw9whv4+PJxdOfM3FiIaVN
	 9E4bHFn/dz6DS37uro86bh03A0/ZTiWqSlVa08QkEVod23Ficxzwh4mRZ8ypwMaxJp
	 UqKQsXFPzjyQGgaas1Qfc8tfHw2xciLSvOuh7XSRKECubizKgbGTweX9L3PI1mvKAC
	 xA015E0PU76bEdx5r3yfXDQVrFgWx3crhGK1NrhJQB5R8ZWnCzB5gDY+4b3MxbKJB5
	 5NRQcnvHeGOvw/Lx5WzipgMg3+PZbr2cPciBj3ZNE1HQFXvfmSixPQtC5sWYzEv5b9
	 MVggwLwMZGShr4A8KLusY8dJf06KKlG6HlOoQtbsPO+0Cu0zfM03X1e+5lVWoPrNzQ
	 j0OaZAtiOntUguLNWbf5igxLvfh1dNMCZVGfJYQK+sJDOUp3j1607a7wobr9PT1et7
	 LW7xq8iAz5RGyksBCs0UDkzv1EudpXbktT7zZBO0X9vLucO+4wT5BC0VfY8x5jaE0z
	 flpCMUlk/y/iEnNEMVo0FiwdlCI7COBQT/I1K8U5vUyN/5/SyRzr4Rxb6ToJOdilTt
	 uOGfHr36QENiZaq56WuvD3kk=
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c25edb54d22so149422266b.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790196202; x=1790801002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E0S4RGo400gWyKWjQ6KReY99+fLF22ntkggQIWdD5/A=;
        b=UetWxL6xCCoUuxsUoFeQ+DOQ0DDGsIDaZyrf38xs9ftM6ol1xOZSeg9OwWp17AW2oo
         SA8yVS/Rh/vxUxEH9vtLdMBpnYA7rpRxwyGb9ZM87lCKi5rRrHUg0K74cSTKlUtFUIka
         L/Jqmx6bDR0O0VmkGUrhenk1iOdPqEeZHlG2tJgz9kOPTWYX0og16TKXkVneR+KJbev+
         G4xTKXzIrd96XAC3JBgYRKBEmJjrIgTusveMEFQu3Mv1VjuLkEXw+v/Io8lQMaAbDMnO
         ++4LoyQ3WG1GFtOmte4cjBuv6aq6zGWW3N0J1vhBWxfCe+k0DquKAqgwuuU1WuA+bDfq
         RFeA==
X-Forwarded-Encrypted: i=1; AKwUvBxacF9P9Zrm/pKXATIj6yuhTrAw1Zu64nMpcP/W+8YAEFVGbMDJZd+NYIg6bDG9AiRJUHXwBFb+EOaNxVg=@vger.kernel.org
X-Gm-Message-State: AFuF++m3HNFSDDvAgXm3uisbH6AbluhGx4lXiLkw+w3dm56OfRFovIXh
	AkvR2iMN5TZCk/QyCCpPeww7myelzbVvj7+A4BtpQmq+JZyFcqhGV2gFgBqS2Bg8kDbB6aoVO7Q
	kyzAiSdNBd7aWO6/UOr3wq93uVNlx1M7bBpYaWCgfoa8yCg5NKTtCB7gd18auKS9QZL3kuemlOk
	Khon/dzA==
X-Gm-Gg: AYBFou2q/CbKsYiho2ygaWe1Ia32b7YHAyFUHOMyEv7M5irxLF83EAa1KE5UQeu3uMW
	FADWmrVyz+qRn7pm8q9uPU1jzlN6+60t/7Wcjp1Cni9IJUHgIt5IEUriP0BIJ71syggQE9xsgdz
	FcoVo22MI7n5UUrCWQXKwkV1CT+YrMDM8Fz7h9TQ9nCalBZNxrxb6UWJGwsL16JT2IVvgkyeTem
	f3HpYOlQpa0uUmhyPBkU71vEPDc8jZb8PA/H+aTat46CdxG1PGZ4Kwg+4dRlUqsurIR+EGQC/de
	oDTByc3GPNK0jINcnVwaJfb9tqyQlCTD5ia6OYFA58VIk/My/q/ZPT62DjAEN7dt6jR7D1Vjcmq
	Ha22PvKSTNM9cIlJTVYz3eXZx2g/+lxct3VApB9/f5yaIrqjRfip6hTDIydYKv4KBRIwFv0YE
X-Received: by 2002:a17:906:f588:b0:c2a:6c3:9e98 with SMTP id a640c23a62f3a-c2ac22a7cf7mr23776266b.40.1790196202381;
        Wed, 23 Sep 2026 13:43:22 -0700 (PDT)
X-Received: by 2002:a17:906:f588:b0:c2a:6c3:9e98 with SMTP id a640c23a62f3a-c2ac22a7cf7mr23775766b.40.1790196202124;
        Wed, 23 Sep 2026 13:43:22 -0700 (PDT)
Received: from deep-thought.gnur.de (ip-095-089-205-015.vkd78.pools.vodafone-ip.de. [95.89.205.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae6a4a00sm185431466b.46.2026.09.23.13.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:43:21 -0700 (PDT)
From: Benjamin Drung <benjamin.drung@canonical.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <mbrugger@suse.com>,
	Benjamin Drung <benjamin.drung@canonical.com>
Subject: [PATCH 2/2] wifi: brcmfmac: Add clm_blob firmware for brcmfmac43456-sdio
Date: Wed, 23 Sep 2026 22:37:39 +0200
Message-ID: <20260923203739.2560527-3-benjamin.drung@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923203739.2560527-1-benjamin.drung@canonical.com>
References: <20260923203739.2560527-1-benjamin.drung@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Ubuntu 26.10 these firmware file are missing inside the initrd when
including the brcmfmac kernel module:

```
/usr/lib/firmware/brcm/brcmfmac43436-sdio.clm_blob.zst
/usr/lib/firmware/brcm/brcmfmac43456-sdio.clm_blob.zst
```

So include the clm_blob firmware file for brcmfmac43456-sdio similar to
the other firmware files.

Bug-Ubuntu: https://launchpad.net/bugs/2168109
Signed-off-by: Benjamin Drung <benjamin.drung@canonical.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
index 3cff0f1fe25f..cea52d408817 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
@@ -618,7 +618,7 @@ BRCMF_FW_CLM_DEF(43430A1, "brcmfmac43430-sdio");
 BRCMF_FW_DEF(43430B0, "brcmfmac43430b0-sdio");
 BRCMF_FW_CLM_DEF(43439, "brcmfmac43439-sdio");
 BRCMF_FW_CLM_DEF(43455, "brcmfmac43455-sdio");
-BRCMF_FW_DEF(43456, "brcmfmac43456-sdio");
+BRCMF_FW_CLM_DEF(43456, "brcmfmac43456-sdio");
 BRCMF_FW_CLM_DEF(4354, "brcmfmac4354-sdio");
 BRCMF_FW_CLM_DEF(4356, "brcmfmac4356-sdio");
 BRCMF_FW_DEF(4359, "brcmfmac4359-sdio");
-- 
2.53.0

