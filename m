Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919931;
	b=wRsylfgYfpWWO956/lP9CmGS+rVjidI1GL6CtSJXX1U6J9br91xeIYJQYA3as4U/O9kD
	 Z1OHdbQEAobtk0XkRJX5TT7ay8xPCCMln/HFbK8t0JhSmRIkGQsluT7TsCAKB8Y2eF4td
	 Dp59o5zJQs2+wjAaFJxaRup6eTSxb7qnhH4AeCEoX8+or5KyQDu0LhoxifxDqHzR/O93h
	 atCT0I3wPeghREq1LTNmhST8HUaUOapAUf12nOWJuANrmTzHTgHvNW951YBBuZHeKLwZq
	 QMDUI5nV9QGxCkwJaAK6+PoZGCmhIt7ptEjMGvRmFpPvEtYyGKE3LBYc74uhtyChc3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919931;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=qF5pRgK1fLCyx67ZJUqqMabNrPbzcG9t+q8YanBUEjo=;
	b=X1dz/4R0RyTV1qif0NMHunCzYuwcHHGY+f4O4TUyJm1uoxC6EeZ1uMdHsAjHGv7RT3L8
	 gHv7NvrKxRxZm/sG4dF4AqW/4QxpNQaduYmOtrBZtx9RrKr82ONVPbx8ul7Gc8fFmzS2K
	 k7Oo+zp/gx3V4Bs+JVUjz+YSLdFFBx01FeN4quOj2VrcP+3bHw4/wwLhicb7kkAIdIT/z
	 bajPXNnpzM7L0ujA5Cpf0lzv/ykMwMAA4opEVVdB8kvlcz+OqN3DWkBywcbZuPcT/EOxE
	 0JvVba5JN+AwpeBPimgDLOPZGyIGtLxxYk/++6K0lX5lY1Fu/julVsTqg8l8w4M5mLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="RJv/+K/J";
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44AC606A890
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:52:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A44AC606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=RJv/+K/J
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso2600307a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:52:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919930; x=1795524730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qF5pRgK1fLCyx67ZJUqqMabNrPbzcG9t+q8YanBUEjo=;
        b=qduuO8QcF3+NriwXeSnmar/qjxlLKLY9Seha8Bu+Tz4DCNg58y+4RD8jaYb/d8Zvd/
         jHiw0UXZpZo72n8xJZ8s7q9WIb6JcUkki/qQljM+GdEq7cHzAaZks2pZO+f49U5yKQ/X
         WPHTjGqmIIc5UQAc8RHLXuxYWXcO2vhVTL1Tek4YWJU28mEMzMqOXXYSeQLpt2ihOMFe
         pPPi8JC7LBuB3OjjJr9HLSvekL4vEMbBw4VHZZRwCQ4xMBtMCyPUVHZMYnBXqACjtum9
         TPxhDIIYrJqyQopFouKWGiH2+92Kq5puAskuCtX/5s/Qgd5e/YSiFqiFls4NVc+5oWX2
         2J3Q==
X-Forwarded-Encrypted: i=1; AL+hErGgBicnTh1+AOTjVNSi6MyxuOSE2I3z+OWs6BzJWiZ/VJdW1De0I+73V3mCheujdJVkxyInBrVhvPzsnZA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ko26u6i6zr1XQylFMqcp0Cp3IqDFhOR9CCaaKPqzF4nOvoEH4
	15soWqEoxgCkiEwmee4NE51grd8+PZ2tnnERLmZESPOhXjKsEtV0A6dPi5O3sQDEQLFhlvtw00x
	wclelrgW4eHkJrlsTvytCHlC8kzFKSV09fg+FnPHYmsJIqZjCpOr07W4wc9zDtroy8rRFvVp3sE
	KJVv0ZGkPMZ9xVEdl/t/+SzvMMgAYefMt+g99zOU25cgq4u917UUWbZNwkpXiWLt1uVpL0DnS+J
	OcJRVXAgvZt0JO4k+OEymA=
X-Gm-Gg: AZFdTZeyCtoGZqdB9Q40rLnpxkx8V7JDv4nVWDCd5zEeetiEOUChXvRa7WrOJXsGsQ/
	eQre79E977Ju6LC10w4gY5xGW43Y+wwcmC7vYt10RP7XvG7g17D8rbhsOpCRQnezU9mfACycSOa
	rQIEaQ6TebtArS2oudOXMr/NimjwzzFT4NwsIbZcdDpgNT0bAuGg1Rqmd1X6VhXr2TJ/nAQ1+Kv
	P0WNE6dc++BQn8Q4oTykUxhQ3192p0kwnObM34NqncDOBDNRKDslYjroTB5nfkOevag3HYob+ej
	PvddGw7ataPJS5W9u76p2qPkPn+WpdDN5byS5aYcFgt9YjlULrNU+2yt7FPIWzC0o7LkqNEbQI+
	IutcTzHS9a4iTXHSbhxBC7PiXi5fC4JdAqoQ52ol3ZPxxkGfMOm/ZuMHQ7Bux8zcB/jD970GAnQ
	lZ36mzalXNNudst2OvZMVfqyKmO8Y16cplUwuy0I1FbA==
X-Received: by 2002:a17:90b:3d87:b0:3b0:a831:5acc with SMTP id 98e67ed59e1d1-3b1b0a3a056mr12488765a91.42.1794919929925;
        Tue, 17 Nov 2026 04:52:09 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3ab9f198fsm1950705a91.0.2026.11.17.04.52.09
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:52:09 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94960bd17b5so358966285a.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794919928; x=1795524728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qF5pRgK1fLCyx67ZJUqqMabNrPbzcG9t+q8YanBUEjo=;
        b=RJv/+K/JOChBh65radfIAqU761KlZATNikfKaMpad8eoA+xHnnqoQ/gZTI90KeYE0Q
         eELV45rfBlq8n/TbV57ZNxw6iRyfLH1KYSVYhmtTjhN1p6e4PXEQtAZ5zG8VEFkV+JU8
         jaFSrkm32X7IoVPCXgi87BzUwN6CE48T53yLQ=
X-Forwarded-Encrypted: i=1; AL+hErHfvW97a9FXx3rEpAFoTcRfca4g5fmO8bqIBNT1uRfhtPu9SxwgTBTYJHt03yfc7/r7ucBZ0avfF5+PxCw=@vger.kernel.org
X-Received: by 2002:a05:620a:8908:b0:93f:735:6c83 with SMTP id af79cd13be357-9494bb3caaemr2034707785a.56.1794919928608;
        Tue, 17 Nov 2026 04:52:08 -0800 (PST)
X-Received: by 2002:a05:620a:8908:b0:93f:735:6c83 with SMTP id af79cd13be357-9494bb3caaemr2034705085a.56.1794919928133;
        Tue, 17 Nov 2026 04:52:08 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c870f31sm1089421185a.27.2026.11.17.04.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:52:07 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Ragul Balaji <ragulbaby@gmail.com>
Cc: Ho Jie Feng <hjf3108@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com
Subject: Re: [PATCH] wifi: brcm80211: move the USB bootloader definitions to a shared header
Date: Tue, 17 Nov 2026 13:52:04 +0100
Message-ID: <20261117125204.3992696-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112050816.2795512-1-ragulbaby@gmail.com>
References: <20261112050816.2795512-1-ragulbaby@gmail.com>
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

On Thu, 12 Nov 2026 13:08:15 +0800, Ragul Balaji wrote:
> The Broadcom USB bootloader downloads firmware the same way for other
> USB chips than the FullMAC ones of brcmfmac.  Move its commands, states,
> firmware header and response layouts from brcmfmac's usb.c to a header
> in the shared include directory, so that other drivers can use them.
>
> Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
> Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
> ---
>  .../net/wireless/broadcom/brcm80211/brcmfmac/usb.c | 68 +---------------
>  .../broadcom/brcm80211/include/brcm_usb_rdl.h      | 78 ++++++++++++++++++++++
>  2 files changed, 79 insertions(+), 67 deletions(-)

[...]

> +#ifndef	_BRCM_USB_RDL_H_
> +#define	_BRCM_USB_RDL_H_
> +
> +#include <linux/types.h>
> +
> +#define BRCMF_POSTBOOT_ID		0xA123  /* ID to detect if dongle
> +						   has boot up */
> +
> +#define TRX_MAGIC		0x30524448	/* "HDR0" */

[...]

The move itself looks fine. Like the series "Move brcmsmac code into
brcmutil in preparation for brcmbmac" (posted a few minutes later), it is
part of the reorganization that has to go in before the brcmbmac driver
is sent again, and nothing else in the tree uses this header yet. Keeping
the brcmfmac and the brcmsmac parts as separate patches is fine, but
please send them as one series with a common cover letter, so the shared
pieces are reviewed together. Since the series then touches more than
brcmsmac, rename it to something like "Reorganize brcm80211 code into
shared directories in preparation for brcmbmac". Can you clarify the
additional sign-off from Ho Jie Feng? Did he co-author the patch or did
you use his (earlier) work?

Regards,
Arend
