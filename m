Received: from mail-ot1-f98.google.com (mail-ot1-f98.google.com [209.85.210.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F2435F161
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 09:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791107126; cv=none; b=oYlUucG8/otyHsXrSwXca0Q8KI8r7fb74rKPVNqYNCPB1eJ6rfgCsQmVinu+c9MsfFGTwFlWKacCpH/WLJtExyQw+ZB4H6Bp3Hj+b8wBZ/YBZZw5cLg1qUUlCoPbZKHakeYNIEj9u1MetC+QyJ73olBEmdF5E9ZkMhuSM523li4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791107126; c=relaxed/simple;
	bh=INRGB+/ti9rjpjFdoKVgunKwtrTAl+XMQ4DCWtMzBgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QNyzPtPzKHR5MOzhXCgN/DLBN25g2/lGYyJnKfnEz6JzdYOrSw5ssrt566sEtNbyPX3wM7SlwXv307GUKHAN3wJfJ8dS3ibseMhebAcmB2OtxtNL8IgfOrdtRjENOXQi8sFLbt6h3Ic143n4hdnUQBm68iUoqCIWbKhzSrGUncg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=hGTA3+oh; arc=none smtp.client-ip=209.85.210.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="hGTA3+oh"
Received: by mail-ot1-f98.google.com with SMTP id 46e09a7af769-82395ae2ea8so1053700a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 02:45:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791107120; x=1791711920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JoFX+YMXd60kpER0QJajp4LEvvy2XvMbrnb9b5wYktk=;
        b=ekYWDnwkdwTO+ryizrqioWdz9mQtV19PyhGx5jBu6It3qf/6mhe593ghNSYJdapei5
         cNmEanzIFyApdGS9aVd7aIonaHg+FT2nBKNUUxSPlp8QsfjgNEiVlVMDn0ChKFkeofpo
         iTKLjMgwppJtIpSlaMWFVO/jUUg1BiPI1lLvWU7JcntzjVaw4LsqtMJiNEGPTuzCLoxw
         Zz0lMpP2EpikvRHJHCiGFhgV1na5JFf2/HyWmPE9k92gl7EdAr4/x5J80KJd/elQ7m6P
         1mOexYhoZTX2r7bF5MvMvS//+SzP2fLMoz34hU2UKjcz/4Iel6p99sj4hbGtUXndk23s
         niYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwRZzLzWDYuPkWK9nMcp5jk4Si9TROss2raHBunVzpJUMtItSU/oEWDfpXYCF3/n5c+fmBut4OiS2eBgCQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mrXyWPOhg9mR7s7MQTrXVU9OD1bbSxBuphw2yzD/e4IYNhNeNe
	dVfHF+aE1DVhhr+6gpYa8E7Fd1Vh/rCFqVmKvG3m5ukKz6UrprZhLUw8GHW2+aGzS1pDT3w6/jr
	lvVJCAlihBJ+mXRRS8UC+nYbsoTf2KXk3QebzG3KZZbDVAVhHRrhC1nEuOHFq6DkekOL2zPeBn0
	q3FlfFWkmRq8DOf4XdOzmx45rkb/ePWLjXAfabEVNMJDx5GWB6n77JU39aU0JhVgtqWq8vL1J7k
	4+d1e7EUCy+bIdZ1jO/3ok8nA==
X-Gm-Gg: AYBFou1S+/g011MpB8Be7yDrvKrCUBWeaalnWDkyjuW0pUR5bVwZoN4NvUM/7cIamMb
	z2yOB6R0gLeZobRQFtxCydfI7YIj7kCsH2sqUpbpkhGK1HlEO0NW1ArUT/xGolUz/YwaVikI6WF
	yeD1oKXUEI2yO7opJZbz2+1pnHrTjZIiG4Lptl+jBJiOQU31cV1VnWLVDT/ZSqTdVXP3xARaE0B
	hfRB6rigN+34ku/WE10IEdzpeYzGyH/V0sKm3TAKD6Qt8z/8k1U+zYfnAyVZiPcVs9zOX0H+7L/
	KQJIwldQ3+Mk6EgwmQnsfuKcmADQUCD71JTA0bt5S1DSvTkTvxH7Cl5sUGKrbwRYAvQWsWjrcax
	biD2CgmHgOz409GKIR1x4I5VpPiZ0yIBZkizPCPZ7ry201t/wAOGt9KLBZZBZGN6ztn5LJjXHee
	6bpOm6B2mrYqVG9x6bvHqZsoNcVlRrM4dvUWfbagk=
X-Received: by 2002:a05:6830:67db:b0:81b:9724:8714 with SMTP id 46e09a7af769-823fd5f4eb7mr4418386a34.19.1791107119673;
        Sun, 04 Oct 2026 02:45:19 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-82276cdcc7dsm1129751a34.1.2026.10.04.02.45.18
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2026 02:45:19 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso1245622c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 02:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791107117; x=1791711917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JoFX+YMXd60kpER0QJajp4LEvvy2XvMbrnb9b5wYktk=;
        b=hGTA3+ohXjmQXWkgkJ1FSUXtIYSaLjwbYi7/V6POhMa5V6Ya2PaezWpFwkrfkEywvj
         tSEwYdmkB5ZJHbaB/NDv9qdxAnhz4V1xiDRIpCCJmZgqn6nA3768XqS6q6YbhKEm1pmZ
         yQSB7IbmLiGZ91AprMVlvQzksM25uQcDJ5f6A=
X-Forwarded-Encrypted: i=1; AKwUvBwJt5mzHdQpkoWmDO6cpbgdKDjj4lSXr0Yv2t9nINJMl5l13DAHbr2jgb/I7LSROux8rOrvauLby0Hmf7Q=@vger.kernel.org
X-Received: by 2002:a05:7022:eb42:20b0:144:fc5b:2121 with SMTP id a92af1059eb24-151c30ec64cmr5879794c88.17.1791107116970;
        Sun, 04 Oct 2026 02:45:16 -0700 (PDT)
X-Received: by 2002:a05:7022:eb42:20b0:144:fc5b:2121 with SMTP id a92af1059eb24-151c30ec64cmr5879764c88.17.1791107116264;
        Sun, 04 Oct 2026 02:45:16 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fcec9a95sm12736954c88.15.2026.10.04.02.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 02:45:15 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless-next v2] wifi: brcmfmac: Improve D3 substate entering timeout handling
Date: Sun,  4 Oct 2026 02:45:10 -0700
Message-ID: <20261004094510.1323851-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915-brcmfmac-bcm43752-suspend-fix-v2-1-1bd84914998b@collabora.com>
References: <20260915-brcmfmac-bcm43752-suspend-fix-v2-1-1bd84914998b@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Tue, 15 Sep 2026 02:50:39 +0200, Sebastian Reichel wrote:
> Some firmwares (e.g. BCM43752) do not service the D3_INFORM mailbox
> handshake when idle, so the D3 ACK never arrives. If WoWL is not armed
> the device is going to be powered off during system suspend and
> re-probed on resume anyway (brcmf_pcie_pm_leave_D3() handles that), so
> the missing ACK is harmless and must not abort the whole system suspend.
> When WoWL is active the device has to stay powered with its state
> preserved, so keep treating the timeout as fatal.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
