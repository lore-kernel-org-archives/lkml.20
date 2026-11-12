Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506630;
	b=cJHSfojFnLasUAWlPJh1lw+9wwgaNae84ZJ1hAvRaspnSVMa5C88ToJ0hQ4YNJEZHJ44
	 axk4UMGbpEvios3y8LNWgQjyeO9EKmG2in/jvvkWu7YMI2VUIqyfkMrmoPPPxqCAVYhH+
	 AvtnktFXeCf8i7AxThxzCsjs1hfZjOfIUZC19ZRWupQnLaN481IBzD2CYDW/PQrdP2aeF
	 JH+WAl43/aLHvlGiQdxWOHiIP3Fu0qrCCiE+g2hn4BlU7ZKh42zuMOKtK3/huo5cy3HSr
	 9M5wDLw9M3IDpZxO1ALm30UUbUZq1RJyWHysbyuX8iN9fUYqpPm9IMryjDEIM0bxbTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506630;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=OUNtryZiIEIq19vN65HJanQDCXRhp3Ynr4zR++YUTaA=;
	b=sPEyqNf3bm5LWvwvQ3NddiWv4oCAXFOSX6CtfCrDZYSHs5s5bkEms61J+H2dsD5PyjzI
	 lZFCtWbBF6W5bKix9IiFquxfTS0KFalMvF72D6oqQhCRjHULLr+Q1kPtWIoaZYs8qxGX3
	 w7wa92JC2xoUeXEUId+Yt1zmcPEOfFoldqRJZhGou3Eaow+22173ekwfwBERMBTqCreXg
	 tPac84IdCDH6j4VwYrmH6qMssVtwjxTN9gxBktEgTBYXuLMpfzyk6IJ2yhYJaihfY4ML4
	 i8816tlzE2Ww4aLlwzpj7WiDqM66I35nHciU5ssWIYUvP+Bm0LrJC65/Y5sEjpbIZBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YYk0I15C;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDAF606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:03:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BDAF606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YYk0I15C
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b0b3438540so34430a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:03:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506628; x=1795111428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OUNtryZiIEIq19vN65HJanQDCXRhp3Ynr4zR++YUTaA=;
        b=qpKqZdY/VDZdTBUtf/oh/Lnz1c+cE7PqbOG5MO/8b0DYpggC/90Bo6z96L4ofdndb3
         IzBqZoANdHPSz6dTUGTYWLMFrjGpf+xIwUzE3djxh/iOxU4CtbElvmApaa5cdRwcRu51
         eUrc3b/JLaKCf0KUq1oaCHwmGntTHjDEGukOa3I5koksL79luqTyuGgyCXVvdxvgljJa
         Vg0SUOYhk4cWbvEpEkCFarI9ELuw++HSddaPrzFFg7urPqXFmWOybPylBW2Qiz1R3G4I
         MyuuN3IiV5XeOMXheUo0C4B9XDFtKISDNCzDfqb4Ua/jT4Jp+Xqk9QMJy2rJMmjx1Fr2
         LF/A==
X-Forwarded-Encrypted: i=1; AL+hErHkwMcvh2KJTq5lNf4+yCWcdhXjsCCk1b7+NdQOMbpGKyZq19fFbeRPc7RR6TUF0molhgN2yNEgq5AYM7w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TqKT5sTi8UMfJQeoA6kJd7DIJxaBHDLfZtqe/TWIBkczOwi27
	w8ITWa5ys4n0YgVMmeytIBCkQ7Za7w4fTMXxeBCXtqWzaBD2X/1WBeyR/ikat81k+ZL05b8rB5E
	XSE078tUNIxkvEazEmX03KaHW494tc3bpuD0PZ7DJTcmJk2KAxZkFZ8TDhSQwxmlJGi0ndp1WYN
	FhjwE7q+ltbYnvPM6ObFzlKdi6eU6KCVeiCYrndP7q3bnrjdK7NXM/18CqwIDjngYtF9dxFBts8
	hepEDLRupCUFbooccVhLV1M
X-Gm-Gg: AYBFou2a262IWx3rFaT1hh3L2cBjQsV83jm6/LyZnniaw/rUjrI9kv1Lsg1E2y6Q/8T
	SGSZ2i5qV7DCAe38PiRAh4u/NA5I5pwTAluH7EF9WwCIrdAnFoGSR5WJt2Gl/EAwmPYNnDb8ZoZ
	/cfrIY276jokg9BfRDORfT+AUD1umxGyuPgju7/58pBx2Tr/BsUxpds7bUst1PeUYWMSt2cnp1C
	oTYhY4I48fJj8i6t50pNrVs85YRPnYbXsnFK+A6ygTi4HDZZvS3iAuEJKy8FCWRc7cjqWhXW58u
	/EA6/C3Oyj84Tz2YUeep9KdeAjzzfadQuquPazlg038W+K4ZE8In09WMIvP9O8QsBahrnLQcwVK
	MeFHFVjT3J/pSMyDd5df3AYF/Zc7WqPYm+FETbZ7TNuQANUwTn0FA7QMqRPj/dHKL+ngVgdqw7k
	3r4qofkk1UBo9thI21eyQXZ17pNrYf+pgGRPMzwC56
X-Received: by 2002:a17:90b:2710:b0:3a6:f1d2:57f3 with SMTP id 98e67ed59e1d1-3b182fd55a2mr5894146a91.58.1794506628312;
        Thu, 12 Nov 2026 10:03:48 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b19db1fd6csm2524279a91.1.2026.11.12.10.03.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Nov 2026 10:03:48 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae1d132d52so40637a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794506626; x=1795111426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OUNtryZiIEIq19vN65HJanQDCXRhp3Ynr4zR++YUTaA=;
        b=YYk0I15CFUnuH6VrRtFI0W3i+nJtfbuK/Q87ixhhGb/ebyq/tEwRK4qG106xJ1aUfS
         FC1nXSMpJZaylG5Mc4aFFkTLH9PdVGqIx+v7pdwHZejiw3xSZlvE49Yq84fbe7Xtifjq
         AwnkHm1MT4zwUOgHdE9RfMr4EuYnxV3Sv55ik=
X-Forwarded-Encrypted: i=1; AL+hErGT/cyHi+rYodv48C1t50YRn27cJCLIPiXmEeExfHOFGP+raCkZLPDkHqJgonuYpmd512/4ZiHK0Eayf8U=@vger.kernel.org
X-Received: by 2002:a17:90b:4b92:b0:3a7:bb1d:3688 with SMTP id 98e67ed59e1d1-3b182f26aa1mr6246560a91.27.1794506626075;
        Thu, 12 Nov 2026 10:03:46 -0800 (PST)
X-Received: by 2002:a17:90b:4b92:b0:3a7:bb1d:3688 with SMTP id 98e67ed59e1d1-3b182f26aa1mr6246527a91.27.1794506625516;
        Thu, 12 Nov 2026 10:03:45 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18abc06sm95004a12.22.2026.11.12.10.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:03:44 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v5 1/8] net: dsa: b53: initialize the jumbo frame size register offset
Date: Thu, 12 Nov 2026 10:01:55 -0800
Message-ID: <20261112180202.324504-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112180202.324504-1-florian.fainelli@broadcom.com>
References: <20261112180202.324504-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The chip data specifies both the jumbo port mask and frame size register
offsets, but b53_switch_init() only copies the former into the device.
Since the device is zero-initialized, b53_set_jumbo() writes the frame
size to offset zero instead of the chip-specific size register at 0x05
or 0x08.

Copy jumbo_size_reg from the chip data along with jumbo_pm_reg so frame
size updates reach the intended register.

Fixes: 967dd82ffc52 ("net: dsa: b53: Add support for Broadcom RoboSwitch")
Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index a2a5754c413c..ca2ba8c157b7 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -3172,6 +3172,7 @@ static int b53_switch_init(struct b53_device *dev)
 			dev->vta_regs[1] = chip->vta_regs[1];
 			dev->vta_regs[2] = chip->vta_regs[2];
 			dev->jumbo_pm_reg = chip->jumbo_pm_reg;
+			dev->jumbo_size_reg = chip->jumbo_size_reg;
 			dev->imp_port = chip->imp_port;
 			dev->num_vlans = chip->vlans;
 			dev->num_arl_bins = chip->arl_bins;
-- 
2.53.0

