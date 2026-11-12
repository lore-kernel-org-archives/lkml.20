Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489230;
	b=FjzF9OmshErtN5kN7EqMNRyQLzNWTXyVIqr19Xw2SDSXdjUNp99f8KNyu9IvmViXMui9
	 Vp7/34GKJNPnI1y0UZHkBmXH/zrbFe4HDK2V+DxFGRa/vOsyeFf7aW/Zyu2w4UhEythwp
	 GmPtQV4QSoCu4pYV0g9uN5jwEbAj+UMq90ApEfs0oE4jsljgDk7rHHmf5X8RuzcdG+491
	 FPSiz5iRSwOblRAAD6im39Uk0PKf1k/ZKfcLAFZF3QZqVa1Mbvgu8jgYDzeHnoyWxRTaA
	 VwkEf7vZlGTVY9F9nAnbFGEkXSTi9eHCP+EnmjCY7wnISS8XafVTdfqXnINepVA/KZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YU2hXqNmb7fbPgUZsnx7SG8vtJgeywnopM9Jcb/ViNQ=;
	b=FlDN2V6Rq0qW0kMdGeLim8J5avfM48WoGBoAzpLu1QRCT66vd3qnoFkeoNf7ahZ97Ii6
	 EuYqmE4KZhpd96PO/jyYRgkjGIHc3HViUicrOcBFYeB2XEzrSbLK71EcGqEte5sTTXPPp
	 ABahECD76FhmAVtDwvJJf1hrPXibqBhXCFarEojj6QjynGzPZenrg3LHTmrph/k+rKcjA
	 cnwcUZfo+lPTXbYH7Pzs1U7i+DXuG2UOMPuMmSpCbHSNWrlzVExCq/rTYXYLuJ9Dg+gKU
	 ZBdBSSVfWXCy75DbgIW2IGPDBthnyR1ESgJ/6eD+XTxzqaoiF7ZjHAc1DNeTJucBYdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GZgHRT+X;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C29606A8A8
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25C29606A8A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GZgHRT+X
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1931ff67a29so8079469c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794489229; x=1795094029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YU2hXqNmb7fbPgUZsnx7SG8vtJgeywnopM9Jcb/ViNQ=;
        b=GZgHRT+X+rRD6nJNeLPBXmBFnvmTUF8oOhPGSuiY9nhuowlhO+3lXFG2u8P5HVRjsG
         HhIqZYyyXJkHFYybB3oWHoE5dEKCNDD+fwMPgrWZ/l+Ojp7aN1mILNj+58vs2XPbehzw
         CC4yVbZu0so4a6X5bskKFY9zuXpRcZRUmuJ3xyXS11FPqV6IwNK94ybkig3W0dZlzPGp
         EKjz4aNaJZiYVzCd3qtjhGfD1XXLZ0tL8aFiIpEE/3fWWkUvOqv/pk6zyKpkQvAOZHoR
         nloj4v48d+i8yOIqmXrTzNb26lTTPSfZeBLxsvc4ileeb7zAmaH2lv+dB4wCcQu4qoST
         eX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489229; x=1795094029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YU2hXqNmb7fbPgUZsnx7SG8vtJgeywnopM9Jcb/ViNQ=;
        b=XZHfyygVG6nNy5eRE8KavzfTaA5/7dtrxNOl3YezuciVUyNADmmfC7gZi4knisDdWN
         ej0sLKNsJuHStDQ5iZjSJlfy3sd7aGhZavtGVtFyVYRPumS10Bje9URcvLcl8XLoDUkk
         kH1QRCFCmTE6trhghLcFbaCwEpSJGQ8lgemgTWkMLGFce+QhkWnZRNa0dyU+UWOa/9lU
         bSIt62iyT9DARfLwqkmQbDR2DGW//KBLR7GkKiAYGLERi5ywDpGlq46oICYIh5pNjI7V
         Yh1fAoMaJmlh52SvkgFfSdJVzCCGePEWrQZHDkl6WRVWEFGtEkPfTd7E8x3lgJoQjil/
         M+mA==
X-Forwarded-Encrypted: i=1; AL+hErFGYSk5nBElSf5M3+fYpH6JKzIES8kizw2VBCBUT2kCWLBpswoQAhn4kOmfxfOymolptKxR0RHEXZsJyKM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NH+DZsjUku17kc0cbJHXEDRLKsnMf3lbPGKRzRZXEVIM7ewtk
	YH5xQHiLyxSUVbAYsFESR45Tv3QloSwFmzeswbsCLXhlOlv4Myz6RERu
X-Gm-Gg: AYBFou1nh6pP+GaFWyhpHAGgxu7PqPoEGYMoVz/di6kgRPpig0unJ3rAd+ZSX4deRyW
	wqtOI+ArGQRtqKP0bAMV6eMdXsZAoYcE80xYHxwOKKbCx+Q2/tEwQ0BmuDFHxPEBhssZzOorSHk
	9pzMMRaWxwbC6SULUh0dK8wKo+7Azgks6VuapGs60wItMdCH1fl9Ow3D8KVEHWMmTjA7a0FhDkX
	t9xQNAhANfaN8+mcXAA9qkNL5sUgBBkvx29c/vMcWDt3QorN3kfdMdLsgc5Pnkg6Y50aIwNOyn0
	/lwT4BXABVAwTibnH9/wTYCABMgnsyhx6bYeoAOhFT7rq0a+1XqtnES9XbuyYjhUm6V1KGSdkzv
	8HfCtyDvQT2NYSatI68yjGrgc4HbSRNwTk7CqNVo1VRDLSGdVMkHig7jizsSiSkHawlw3QmS0Fb
	EcweD0CqaJSzvDYJiI8xXoznPuWX9MzoJcBV0bRWh4NWiOjRx3roiTQjYGInsnq3veDi0iyKb7H
	8YZEVSP9wzMyi1BL+qAETdCiIB6GbC2OOvhmrPo66xxSCb0MVrw7YXVHmIGClP9raMegcgcWozd
	n8d68moelIz0sE57h+VUpg==
X-Received: by 2002:a05:7022:ea56:10b0:1b3:a9c6:b293 with SMTP id a92af1059eb24-1b3c032e676mr5378970c88.25.1794489229103;
        Thu, 12 Nov 2026 05:13:49 -0800 (PST)
Received: from xploitoverload ([2a09:bac1:36a0:120::1c5:160])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890e04sm25449363c88.2.2026.11.12.05.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:13:48 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: luka.gejak@linux.dev,
	pkshih@realtek.com
Cc: kvalo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>
Subject: Re: [PATCH v4 3/3] wifi: rtw88: ps: trigger firmware recovery only after consecutive LPS leave failures on PCI
Date: Thu, 12 Nov 2026 18:43:29 +0530
Message-ID: <20261112131329.236152-1-skalpesh942@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Hi Luka, Ping-Ke,

Thank you both for your patience while I was away, and thank you Luka for
advocating to address the review feedback before pushing v5.

Regarding Luka's two comments on v4:

1. Redundant rtw_hci_type check in rtw_fw_recovery():
   You are completely right. Since rtw_fw_leave_lps_check() already guards the
   call with rtw_hci_type(rtwdev) == RTW_HCI_TYPE_PCIE, and the other callers in
   pci.c are PCI-only, having an HCI check in rtw_fw_recovery() in main.c is
   redundant. I have dropped it in v5.

2. ps_hang_cnt on non-FW_FEATURE_LPS_C2H chipsets:
   Excellent catch! On chipsets without FW_FEATURE_LPS_C2H (such as RTL8822B
   and RTL8723D), the check falls back to polling REG_TCR for
   BIT_PWRMGT_HWDATA_EN. On timeout, the driver forcefully clears this bit via
   rtw_write32_clr(rtwdev, REG_TCR, BIT_PWRMGT_HWDATA_EN) so packets can continue
   to be transmitted. If the firmware is frozen, it will never re-assert this
   bit. On the next check, the register read sees the bit cleared, falsely reports
   success, and resets ps_hang_cnt back to 0. Thus, a stuck firmware on these
   chips could never reach RTW_PS_HANG_MAX_CNT.

   In v5, I have updated patch 3/3 so that ps_hang_cnt is only incremented and
   evaluated when FW_FEATURE_LPS_C2H is supported:
   
       if (rtw_fw_feature_check(fw, FW_FEATURE_LPS_C2H) &&
           rtw_hci_type(rtwdev) == RTW_HCI_TYPE_PCIE) {
               rtwdev->ps_hang_cnt++;
               if (rtwdev->ps_hang_cnt >= RTW_PS_HANG_MAX_CNT)
                       rtw_fw_recovery(rtwdev);
       }

   For C2H-capable devices (such as RTL8822C and RTL8821C), completion signaling
   reliably accumulates consecutive timeouts when the firmware hangs, while
   legacy chipsets without C2H retain the upstream behavior (clear TCR and warn)
   without getting trapped in a broken counter reset loop.

Regarding lore / patchwork:
It appears v4 was either dropped by list filters or delayed during list delivery.
I have sent out the full v5 series [PATCH v5 0/3] incorporating all the above
changes to the mailing list.

Thanks,
Kalpesh
