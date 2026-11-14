Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626804;
	b=ODWaB1ZF52Fick3FZ+NTdAOpv4CrQ72zqwcJ/kXsLhWklP06w49KBlBeogcjM79MkLC7
	 HXTWWlfFOFn8s4k3VX0LJUgDmz88WMIOeDepH1XfoGhUwZDZUOlgt8TE4DyRS8RXgamLW
	 NeAhSwVidIwWoq3VMnWJHWbhbdEszusw6wBiihDb1jQ6vzPDpxZk+b6zJZnzG61SJHJgm
	 UfI3Yo4Ydq+PZedub0MT38cOaLgAbvGJQVcdVI/vX6olQTIg3Vr1zgFZHKMHXJaWyC2J7
	 NpR8wHZmrkx/6EmlGbp7Z8Mz9DbsaJkFUeqSQby/IbCaQcX0DGReh5HlK31rvnTACHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626804;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=4b6Up4gAM70Cuwx/Xvys8/hZil2sANohA08sIDRsk88=;
	b=RGZ0qE4GiTeRSi7fqxr0AoVD3POkc3n5+BPvXqQmgKHHjpgEd2s5fuRWMPL291bPbecq
	 fb7gMBW/HBAqpw2gxRJBCKT640lMc1+HG9vmLTZfoQi6HQoNMRyE+f1Z2DidVFMpQofDI
	 cttalUcxElT0WeIvPFEvtFpTZ/aVnHA9Sd1JylNla3JvO25tx/UJMmwMhLzAB3SI4PoV3
	 p0q1uTTqcb3Mz1wUFWcgNfqnRbROOmhBd3xa7fIwRNo9XC2Bv9uf8YhVY5VM+1gxdHxMf
	 6WdHB9eTQLcRAimSsL1W1+Brv9YMJwwSZcLQu84/BKv6ayOU0+C7hkbPF37O5Ey7Zow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Vsf5TbpD;
	arc=none smtp.remote-ip=74.125.82.97
Received: from mail-dl1-f97.google.com (mail-dl1-f97.google.com [74.125.82.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48ECF606A891
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48ECF606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Vsf5TbpD
Received: by mail-dl1-f97.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso2023677c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:26:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626801; x=1795231601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4b6Up4gAM70Cuwx/Xvys8/hZil2sANohA08sIDRsk88=;
        b=c42cgvQHrw7BOJhImTNAOwcQ14cG03UmZQwWAnVqCyht+4dlCHX8D+SkPvGjCofO7L
         ltdB/MsHO+3Gn+ggn9aSH4hqyhvG+gCORO31YW2ZI3Wm5sCfW+6rOl+Yn8/1DIrNIRyo
         nxxiVLbct+c9P2/jahkD+qr+lb3H4hgJwB+M+q+YZWNHOPh6oQCkiJuigwZUZu3PcXw+
         BuPFlgL57PRPbdjGsIZqQaQr+V34WYQWjiVV5YtVdj/g0Dp2jbzoLkghunfI0kQ254qt
         MXw8K68lX0hhFRpkMm+QX1H99dZxAO3uexoucPg++x7a9xT4htYt94CqvVX0WDZcZSRp
         wHQw==
X-Forwarded-Encrypted: i=1; AL+hErE77lcYoCA5ohZy3ks1jqxximBwWfMaMsSB5mkBFHwILUKSKvMuTokNM9nP2wULSTC8uzxg/Bxknzt5qJg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kzzMfFJKC0YdXL4H3CIncNsPm0euwOEIFjj2f0JaLgdAtkEdt
	hNVTO/mrrsOftG75b6EO9vQWTrIKxdxcYCupbFpvh5BIqAzsRoXfAisgruUQykIM3wILBUJgUsl
	IeVJRz/ZqwXUbhB662RBoO5x+IUrRSe8JRK7TW3GABWR2n5ehqBybQzXpc4DsuIRzkb3Wk5j5kB
	kFA7q1IHAEtjSpKjGyjEuj9DgHCl7E43cL10An4VwwHGcNvHwNy1+96rEPd43Ok5e5JSEB61fY+
	Qv5wtnslN/LULsqUgqCA+Oe
X-Gm-Gg: AYBFou0mm43JM9t3C+1Jm4mbnXWG7ZgghqkLoo5vNnC6TlpNzLmpuWcZh263v8otOxV
	+quUVXqMTGCjKa+umypwyw0YoLZBjyMa3eXudkMCf3XjRFs41nYsoQXs5wH1+arwKyICL2sCZIR
	TDWJs271qqiVe2AGUxva0onb+hzteJeMkVCPW31BMfmS3lQP0RfTrCIpwylYMffH33DCGkB7KIb
	Hi4nM+QayUmBLeN8oxgptJTuTk0FVbfpqJx154m6Jq+zyh17voBGNM5a2Y+38TBOkmyKu2gkOIR
	DF+fH2tnU7Bc5w7W+tgRjBOh15oGLtk1GYugFUPg+dfuJFCHbFqkMIJJpkE51sq3N/cVery4fJW
	fEne759H42s+uzfHyQCf77rbZeFsWPLh+SZCDcibhS5R2IwhYk+Q+d1FFR17UzTTOdzKMjyAEm+
	5ibP4+E9jc2pp+7NbYSNDk446qsNKDkWJlVwGbR5Oh
X-Received: by 2002:a05:7300:3083:b0:36c:f88b:caae with SMTP id 5a478bee46e88-379675fc82fmr6370746eec.22.1794626801078;
        Fri, 13 Nov 2026 19:26:41 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-37953a91e52sm228160eec.0.2026.11.13.19.26.40
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:26:41 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-375f0fd31f4so2070661eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626799; x=1795231599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4b6Up4gAM70Cuwx/Xvys8/hZil2sANohA08sIDRsk88=;
        b=Vsf5TbpDQ0HT4c5Y6uCG/OtNbZ+FvTFce7INMMkNxG+Gz0ZJ7RjHklyTghNe5Wy0gY
         4+TV9+tV3hPkRV+Z05Ge28qcgD2oG8PbTJBgVVEE4oZ5ZJ02wOoybKY6Ln/7uDlo8jEt
         b6f+UNApLD8EwVaQGZsMxMBTqMigujknpIxkk=
X-Forwarded-Encrypted: i=1; AL+hErG8vpk6QfUuC5m5D7O77ZQEbdgDf8uncrU9SbkZsk2MphTZxkiFp2w6bCn/v0iej2FghJQ3w4JLvYpS3Fo=@vger.kernel.org
X-Received: by 2002:a05:7300:6d03:b0:36c:3b8a:8090 with SMTP id 5a478bee46e88-37963a4ef35mr5925397eec.2.1794626798659;
        Fri, 13 Nov 2026 19:26:38 -0800 (PST)
X-Received: by 2002:a05:7300:6d03:b0:36c:3b8a:8090 with SMTP id 5a478bee46e88-37963a4ef35mr5925349eec.2.1794626798003;
        Fri, 13 Nov 2026 19:26:38 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795533170csm12182371eec.7.2026.11.13.19.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:26:37 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Martin Wetterwald <martin@wetterwald.eu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v5 10/11] platform/raspberrypi: vchiq-mmal: Support bayer and gray formats
Date: Fri, 13 Nov 2026 19:26:36 -0800
Message-ID: <20261114032636.873947-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112-b4-vc-sm-cma-v5-10-d25e3b687e71@ideasonboard.com>
References: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com> <20261112-b4-vc-sm-cma-v5-10-d25e3b687e71@ideasonboard.com>
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Thu, 12 Nov 2026 16:48:08 +0530, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
> Raw camera sensors often send data as packed or unpacked bayer and gray
> formats, which needs to be processed by the ISP.
> 
> Add macros to support bayer and gray format FOURCCs in the MMAL layer.
> 
> Tested-by: Paul Elder <paul.elder@ideasonboard.com>
> Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian
