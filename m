Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792709834;
	b=JdtJ5W5iVfiebS+NSQ2ghD0UMNSr8Qlq4tf0RooZi9LQRh8Q0F9He/DIpDJssRKWFuVa
	 lvIrXAAlOlrffm4cUCHb/+3nkdu5V1XuSdB70IQ7afV4AsmqOdyfPu50Hkvo9z6nG/xqq
	 BcmdDBLqZckkKgseojndG7ReW8vIY1LRnybx0+4AMVxxMdwScPwahRQNNdnWh/HiC6sc1
	 VrDlceW17XgQuYrXYthUE6q854vj5SphftCtxj7/prR0MBCYrzGnWty8Pn7vhm/Xh21eU
	 YmYLGbmHDrwQUhsxkqlYOvObkkhT+KgfbrVUkNKDjUJ9bvRpEJ7fLlpb9F4jZ09kW8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709834;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=z9FAKVdyeVMvleoyzIAnMj2py3FpKl2sDcMqYrZVJ2Q=;
	b=wTptNrb1he/WwmQdF4CaByjdPu6DpXvhWt6rd+Sm6TFYM32SJGvrkN6OzQDRQubgMD0e
	 K4hPKjMzYbGwW8J0GbiJcXrI1OkA0Eu9WvNaj4IYXWvQmGRAue+vTLHdgLaEVmcSyA4CP
	 gyI4GB6N8/Qm6V98d+IGQqaAI+N4l3Moo7L3p0YMfGgwlpmIqiitPpat/tNcw4MaXmRDI
	 rm3M9ZZ03ZBWUEgItqpVGyz0eVQVxTowwEKJ6BjIeuQVB+us0C7Ntqo3d2UgjpO6hSvwq
	 kH86Ku+IO5AWwEEGJLsS8XhvlTvJyZTbTeNjne0vyqfUbUVBO4slBTy69Yuhx7dnzIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KJtAyG90;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13334606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:57:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13334606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KJtAyG90
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso171082a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:57:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792709833; x=1793314633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z9FAKVdyeVMvleoyzIAnMj2py3FpKl2sDcMqYrZVJ2Q=;
        b=mf9x8vVdfO9dHNFz8KP9KtLd0TrxbY2f8RTn3RguUCiWgAqWxKlbPC9Yct+A9CUNJ3
         +nrufviDCh0DjKf8eSPYX3yu+mwnU+yROQh+5sxKvmj5Z/VBd3u4GOzTxtwJFbuf0CbU
         wvlL1YTpb15V5vNkOkv3XOFh+EYGhgzwv6AcsQRHhhN0hoUqOv6PC6atSLAukXWqMvbQ
         CuAQVWGun3Sg/3EYUCNObnJ0NhJ9d/xqcbW83k7fkWAtoCrUijiO1emhI1ZpY5PXdNZH
         pAicv9cq6LL/iMuQn6p6wgyaQZkkiCzAGOP0rFmjwrtQevdFPqJpNhPP6C+c0qi0aTK7
         IkZg==
X-Forwarded-Encrypted: i=1; AKwUvByrjdfc6kF6SXQC1StNggqbtSDQxUvyVQYxfTGEweHns03aIsgfbHLdRPeR7kBiwmW2+Z7qVLW7KPhMFpg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJo499q0u+HJlkyBiN/J9YvpCOPgYVniPeiijLFmSRTRreHKJSA
	8wOmsd7pPM35vTgdsx0TJsmKXxdFHOG9qxOSmH6zvUgrraHtWl8L9eolVca1WHUQIegqAq6W3XZ
	o80od7KPh/PkQzWNeBE42tgiAkhkXx0nzRXnf+4MW00JrtXzZ00NnWw3/1WH05qbOWfv620xpEQ
	BKaLtNfYkeaeE5aBMcgu/Qn9m7wKkNvEBxKynusLfhKNhMk0tBzGsPWNS0gaUQOn3CGwUbcyVpw
	vMYvgHclxERdIwlvCmCQx+N
X-Gm-Gg: AYBFou1LFjw5mYri/UOwf6DBZXwdm3WvUWQ+h4MaVng5nXXsajqspwbAz7YjvGcJjOV
	YXSZCpahvNydIcqqJmpmqSvIUWmbUEwv5SWPWSiqLCagmIyUrOnfD4jpFwL8E4koNbzQeBXm+jH
	GQdnmwm7llniAx6E6ilA0dYoijpZdsEIdaZuVeJJ9fA5gi5Zs6zQL8XVSuBapmlcRrbJTIeoimA
	2hYubUhNyUuo/XrnntntBtCUfF4Xtc2DJ02B0L0TNnu8KGhqk37GgREsjRcBRmSxQLM23G0H5Ji
	l1ukMVKiNY09Q/oXUyJcJmc18KEh1bo3NvrCwS8LqMLzIG+Mfe3TkWEtS0DGeulXO0ZXjmbOj5w
	u2F6rgkrdd7r6Da3vz7Kee5KUPiQ0S0UM09wX5eHSZryvcK+c7ZkwrEEu7krOL2/nzEOlu2hkpx
	YVuyaVFEaEacE1+ECYjXoBBit0pKBJnu1igz3G++aU5lA=
X-Received: by 2002:a17:90b:268f:b0:3ac:a203:e0ab with SMTP id 98e67ed59e1d1-3adce0d0c0fmr251910a91.48.1792709833344;
        Thu, 22 Oct 2026 15:57:13 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3adcd004910sm170716a91.0.2026.10.22.15.57.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Oct 2026 15:57:13 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b4bf686ceso10418306d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792709832; x=1793314632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z9FAKVdyeVMvleoyzIAnMj2py3FpKl2sDcMqYrZVJ2Q=;
        b=KJtAyG90EAcRaGeVcmkcHFGLAW1z0bB/mqhYPtQHNOi/Lvjk0QxWP3MNGbSmtqw3Rp
         SUsAnZtjwkhQNbRLl4j+oiNywRtWhA8LKLvwrdHBrnyqDS4mEXhDFgR4zlc+PyKYLLBS
         5IiaEOKBkNEcMMepaBtbDcL1THuOgQV3bpj8w=
X-Forwarded-Encrypted: i=1; AKwUvBx885eFoPwvIuRN7Tez1KhxzgJaaeKbls4FgXm/FjRvi/ME8MfUd48PcWntw2Xd0XYXdNt51rekqKQjfRg=@vger.kernel.org
X-Received: by 2002:a05:6214:300c:b0:919:89f4:64d9 with SMTP id 6a1803df08f44-91c3ab0a6c5mr3600756d6.22.1792709832180;
        Thu, 22 Oct 2026 15:57:12 -0700 (PDT)
X-Received: by 2002:a05:6214:300c:b0:919:89f4:64d9 with SMTP id 6a1803df08f44-91c3ab0a6c5mr3600576d6.22.1792709831759;
        Thu, 22 Oct 2026 15:57:11 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c395025d0sm4501656d6.5.2026.10.22.15.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 15:57:11 -0700 (PDT)
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
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net 0/6 RESEND] net: dsa: b53: PCS fixes
Date: Thu, 22 Oct 2026 15:56:50 -0700
Message-ID: <20261022225656.1387306-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This patch series fixes a number of issues found with a LLM and while
testing on a Broadcom Northstar Plus reference board (BCM958625HR) using
a SFP connected to a fiber converter:

- there was no serialization of the registers across multiple lanes
- the SerDes powering down was incorrectly managed and should have used
  .pcs_{enable,disable}
- the interfaces advertisement should have been confined to successfully
  initialized PCSes
- the negotation and forced link parameters were incorrectly supported
  and should have used pcs_link_up and pcs_inband_caps
- link state should have been reported through the PCS

With these patches disconnecting the fiber cables triggers a link down,
as does disconnecting the fiber converter from its cable or powering it
down, ip link up/down also work properly as a result as well.

Florian Fainelli (6):
  net: dsa: b53: serialize SerDes register transactions
  net: dsa: b53: manage SerDes power through the PCS callbacks
  net: dsa: b53: constrain SerDes interfaces to initialized PCSes
  net: dsa: b53: configure PCS negotiation and forced link parameters
  net: dsa: b53: report link state through the PCS
  net: dsa: b53: apply resolved link settings to serial port MACs

 drivers/net/dsa/b53/b53_common.c |  69 ++----
 drivers/net/dsa/b53/b53_priv.h   |   4 -
 drivers/net/dsa/b53/b53_serdes.c | 407 +++++++++++++++++++++++--------
 drivers/net/dsa/b53/b53_serdes.h |  13 +-
 drivers/net/dsa/b53/b53_srab.c   |  12 +-
 5 files changed, 345 insertions(+), 160 deletions(-)

-- 
2.53.0

