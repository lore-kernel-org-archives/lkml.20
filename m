Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626811;
	b=Qj0N2JrLVEGxZY+afROfu6Kc9Qof5zN19JWPPCIqbFqKYYAiWuWcMc5S2v63IvE/i/y2
	 qGK2BLTD3VWL4EOD/3ire3bKyJdoOdrO8a/f+yHvV4pQ6MF/zSxISUO/JyRjU4cX+1ztG
	 bZ+Cx4pIwY1BmVe6Qu7I2h9bxqxMj+CfziKDMqV9e///5m1bZNTUiZygaD5L29Mi4JHQX
	 BOWyNzsa6o2pvNpLZ8RCyR0rqNPlm0jP316ML2/Y8cVsAboK+azQVGEmEQr13LCp/kxe0
	 7Ysl20VVPErDfGwo1Ymbs1phFE4C5icqyQR6TnbsRqqq+Q9d2Yy9V18lsYu0engRLig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626811;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Df9Xd9VZHrZ3bx0rqok9KRd1CcHGH7mE8EOxZfY9S/w=;
	b=wtHjZlzRkgvaNKeQWDZQFZfOB23pIFDIJXjMyvG2xOAkowigGU9RjV8e43Zz9jfWX2CN
	 iRhrMM/t/6V4hh8RqhUezOwESGHk1DraOk+ONSvoFaElWcJEts0D9Xt8u337z1N1jGO3+
	 M6VN+qzNx6jf28BLf/PbWj+fyTnWyNEBsv3n8scmcknhZo5bYV/GsgQ4ZcHLT5pf9wpPC
	 QDAWyKDM0/fA2e3ryQVXnO5JcsGWJPhzhuuz8DQ1Q7L1eU5mlgxgDH3XefALSZzcKJTxG
	 47xMMmRo46dC640ufk2//7y3KXnKA+vKVk4ICUDdoTcdL0fZj90Rctr/It0q7WPnZIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UxAEkOml;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237BF606A89B
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 237BF606A89B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UxAEkOml
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so1358607a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:26:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626810; x=1795231610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Df9Xd9VZHrZ3bx0rqok9KRd1CcHGH7mE8EOxZfY9S/w=;
        b=lWItw2HCrM2M3QhxBjANSOR3g05zjM/X2kC672dlMFLKPNkJgQUGjtDF+e2JrdKAbg
         2Td8cuvta389y60D89KivpKGozTewBSMirjSvfKtUd8kNjBRv+mKo/V2D28sxY9kilID
         KSoNQAcAfwX77uz7cdfgEiKucn3SlgonlhU8kCdHC05yQbApuLl9OGVyFF9H0hPRn2Bf
         vqpiypW+5FT/42jP4rSCrugwJCTO/0/juw3EOiN2X1RDs2t/x1draq/j9Ac1o0lcqkLJ
         bJLuHH+EE3zpZVRNBFP8oEsZ8oMbNy7C05KsFMg92NBVvFLpKB2uT34luPyvL5p9wAM1
         uQSQ==
X-Forwarded-Encrypted: i=1; AL+hErEIDVwWOv5FZY/c/bt2JfGYYP5y4KTUecw6Q5Fpl3sCUa+dM9iHg9bLn7KjYUVTCP4AJ45s7tbLUUt2Kfk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sce62dsiKjNfy0Sc6eEG81MTVB6Q0tep9pqJa3KGRjJFT8gP5
	M7uvcBgGnQHUn60SXaplwElZJZIF6TfF5puqkhqzMNg6pBzX5sr68I2GsqX91c9JVGg5T4uJN4m
	FIdFJpsFGODhVF6dzNh6WTMlR+/gQNYA5zwExop+MXdvDKAQIYPN3SuKCHcrGhVL3YCOugBpzwv
	rXTaIptJ6AGl0psvMmAsK7nguaX+D6a6Q7MtdOlHWdgec7lg+5TQrvRhMkkBo4YkxDHHE4Qgw34
	2JROLV1PHCs98eJZExjor3j
X-Gm-Gg: AYBFou1UstcmrrwNokyz+kzlkRuj8R/G+XODufdhcqN5jkhvWM48MpeBmoR2fLifm4i
	xFi70xeiv+orCHb+HA0mRspl89D1BHCGp6xRdb9RIoJ1sqxmmOh9M02hKXi5BJWH7ewYoubjSfe
	Nov4/PZw/q5zJEDk+IRWSYD8HKAwdBRPZpOBcasJDi8IXznaHOabRl4d6ykUM+kXtdZtXeqIt2U
	Qh+yEQnQpJwF3K4N7QCV1GOlt+Kr8frfhTx+oor9ZnnWTYBmwMwOqD0eM8Gj/H3KxgDGpdV8yRZ
	foXTm08Z0JZbGp2F1nDVq4OQ1fi5y3FIh9FLF91ik+T4Qf2gFcoz/h7SlFxO6ALmWYt9/M8yp9Q
	LXV/VOtr1XFkdFlnMd64f0V2P1WwyJgO1nPuCa3I3q8BPz1tATQuxTLjVuQrDwJfVfchrkfw4rA
	+3lIj1RRTFoKj6PF89hUz3S+yrCiYzT8yMPJMNDX5U
X-Received: by 2002:a17:90b:588b:b0:3b0:9984:18c9 with SMTP id 98e67ed59e1d1-3b1b09f37ccmr3717453a91.11.1794626810458;
        Fri, 13 Nov 2026 19:26:50 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b3f74ffasm2569642a91.3.2026.11.13.19.26.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:26:50 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so1232107a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626807; x=1795231607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Df9Xd9VZHrZ3bx0rqok9KRd1CcHGH7mE8EOxZfY9S/w=;
        b=UxAEkOmlkK4g9YTLxY/6oydRvzAIgoLe6AyhloyeeqeHAwlwj/iFpI2XWMSrsoCrGz
         iLgOTGIeb/tB+4IeMtvN0jz+NO238cP8ypglHaMUV9qzsbCQuPXdR6K/cLp2O4ATNzgw
         5/Yrm3zSVFZktuI3vjnfSnEqqwiEfQIOUe8Pw=
X-Forwarded-Encrypted: i=1; AL+hErEdcjhY2Ral3f8F1+oTMjx1Z1NmtW+uPaTMJ49AhLXLMSF2qEHGn05UI3wmFQ1LmacFKnJ1ll+1bXscWpY=@vger.kernel.org
X-Received: by 2002:a17:90b:2f0c:b0:3ac:6e91:3f22 with SMTP id 98e67ed59e1d1-3b1b0b85d23mr3739868a91.52.1794626807455;
        Fri, 13 Nov 2026 19:26:47 -0800 (PST)
X-Received: by 2002:a17:90b:2f0c:b0:3ac:6e91:3f22 with SMTP id 98e67ed59e1d1-3b1b0b85d23mr3739840a91.52.1794626807045;
        Fri, 13 Nov 2026 19:26:47 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc188ff97sm2060162a12.16.2026.11.13.19.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:26:45 -0800 (PST)
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
	Paul Elder <paul.elder@ideasonboard.com>,
	Umang Jain <uajain@igalia.com>
Subject: Re: [PATCH v5 11/11] platform/raspberrypi: vchiq: Add helpers for vchiq driver data
Date: Fri, 13 Nov 2026 19:26:44 -0800
Message-ID: <20261114032644.874052-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112-b4-vc-sm-cma-v5-11-d25e3b687e71@ideasonboard.com>
References: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com> <20261112-b4-vc-sm-cma-v5-11-d25e3b687e71@ideasonboard.com>
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

On Thu, 12 Nov 2026 16:48:09 +0530, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
> Add helpers to set and get vchiq driver data. vchiq_set_drvdata() and
> vchiq_get_drvdata() wraps dev_set_drvdata() and dev_get_drvdata()
> respectively.
> 
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
> Tested-by: Paul Elder <paul.elder@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian
