Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626794;
	b=Cwh1n3I0F5E/d47O97s8qowX6I4eByVs8OglHT/E74q5n43yffAYaF2lHE+RLU+dPzMI
	 rBa/1I5mpdvkuqy1goPyfSub1KtEqHacrQ79JfjJRPRRoOqEhzdBf4ALqQQNUBhEa9DFi
	 7EJd1QjoJSaVzSoE6WtJQVhRl5CgTa6ZDMrwJFnYinGQjhUpbz2FKIcaDhYcCzcAvU3ef
	 e2zQwpHiKhnlA2rPffZs4M2+NT+A9lKrOiTPU/D+9yyRbrXMTqnnDY+XVhIgUBbDiVdrV
	 Kw9yk3xQhTgFJglTRfVbLcpKC3XMbqe63mrD3+YtX90A3FHsXWcqrRav5oQmtf4J8WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626794;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=pSuog9nQWHn9MLxIB2S1PpZmy8uazH4JRtiBCErcRLY=;
	b=4GjNIIL72BP5u0HVvCbREbBWWm9x/gZFWsA5/oiEBft+v0eJCXDmBnzH5+7R6S5qjrUe
	 jFojCuABognX6SBAbYjHgiYl3GZ99lRhpoDQ6vjUvyiM8kYWE1JnPSu0oQE0FjRlsW7qO
	 XBbXhgFlayjAk9pf9jSrAnQmELxXspL3D5l+s4whm7PXneZShTWhMfj/Mz65p7d39m3z7
	 tRShmGcUcFb4n3f97QW9TscLripZuEA+SEzHFvaCy7nvCpc1TeBb0NTSOVzMVFcrPwwmR
	 w40HfBhDqS4qOmL1XBUhLtb0SrRSeb2UhStpqYjuG26FaID96Aai9YGnY6S7xBXbHrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZZGSdvwD;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83061606A332
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83061606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZZGSdvwD
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso853490a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:26:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626793; x=1795231593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pSuog9nQWHn9MLxIB2S1PpZmy8uazH4JRtiBCErcRLY=;
        b=MiuM5zqaiUKHZuSvgCeLqUcoVIz5RtcXBDFzY0cbWmcV8WD0ZukOouUCQA3qQFp2ra
         Fu6ddar7FJRh8tgHhdZqQbDTy6Tfe2mq5d0KRx2TdU4UH6ZE5IQf8Co4tx7dwdt9fDAh
         enKmjxLTKNS861wyKXPJzg+2ySl6nLGnp9HrKx4GQE6j8oTUicPk6mMXHEtJOr5eMlUj
         qVd0cY56ARM5nElSGO0Q358dnRytpYe0aHgPwAtw3/KN1jO0lcBLbWpL0eTMiuY2d48a
         LNcIsjISPi/S3SqtMrHG1VRp3/81AzsGUmU0igOG7kOgtECX4RdH7GynoclpxNyMLmSw
         R3kg==
X-Forwarded-Encrypted: i=1; AL+hErFYI0a+PcKFgNW3fZf017uzR39v54r8Id/VD13oeJdnVJPxdJ5cLqyZojjilWsx6ZpjvqD30/rXeqYPB+0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qLmkjy3V2HKLWY6mA09pG0tplNKdDrs7mfH4pD5XK/RqKIA0q
	Cf+fL4fQNxW/8k2DaCJH1/xDwxLnj02dWAz1CV1mr+oTjvO6rZU0Pn86gQba74AYogg+ZQhd7FY
	XtUFA9835sqDQuEudMI2ZkUnHqOKd6PlRsELe580rK3feekN9W2h0t7i/u/ldzLzP7MqrcPAx5i
	807nPJ60zn86Hy/ZtXnbAS6Ms1/QyDgjLyk1O08cQ4g7dMAum+THpQaB6cWHB+ir63vzViwEaz9
	gEizeCjianCulJnMl1X+xF7
X-Gm-Gg: AYBFou0kIfLq6ADgzVKiqyh4gmaKYftgpM6FaRU9KyPXSyYZe0Ol8niU8ftOqpvWyWr
	EAjYCILwGYq+2k6GrZxK6VWXUHWoHk8DkEOc5lDS25LwxTITG6Jkn5Vsd3K1aAqZx5bWv4rumUQ
	pKJdUpoi6Dnf6bLsWPpDawLN0Yfax+ieHM0E5SWBQezLp5JVlVpjhZZE1GwxWRB5vB6HbBAwqY6
	K/wyMCEujy2T2pbPJOFWMmqqSObOUlIl9cZKppQK7TQiPOhRqfICHUcQEBAqlJ7JWotNW2LJGmE
	FjwtiNZEQ4ghpxhgZc7GFU5REVDWMF1ZKzWXyvFy53Sb8k+boGND+Ek5D78ysjD18RQN2kf7q/w
	Io6zuhv/IDcEYRbXdzPAScNaLihay15wL421Fh4maCKwr75pAxOY2XWfWLNyNxNpQzNZRFfo7Ms
	9WH1xeVtqtN+0rMJ2VtfYhiAK4/MVB52MGSKtJ7Gfd
X-Received: by 2002:a17:90b:184d:b0:3ac:7116:434a with SMTP id 98e67ed59e1d1-3b1b0a1f032mr3848713a91.15.1794626792784;
        Fri, 13 Nov 2026 19:26:32 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae81cfa5sm6101628a91.0.2026.11.13.19.26.31
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:26:32 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375f0fd31f4so2070593eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626790; x=1795231590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pSuog9nQWHn9MLxIB2S1PpZmy8uazH4JRtiBCErcRLY=;
        b=ZZGSdvwDhuWYni1J2V8Rabf7e46v2yQPOokz9gkSdVbekO/H3ERIoPHTJds7IiXeYS
         uTIrmbycH8wy9wQNFjk+Q7sUh9K30VsbnGrBARn4SeIkZ4V8OzCHTaqG0hWcrmcNNLDR
         Q1o+77GaxgZrNsBq3FM3DXScY+bJ7zXWp6ptI=
X-Forwarded-Encrypted: i=1; AL+hErGCV37J7qUZhKCakXpFWlGI1WOT0TNw6B0larSZtrSJ7zt7MTt74Fmzgkz6iySCtmhRM4ppZtP+ztZa5qc=@vger.kernel.org
X-Received: by 2002:a05:7300:8818:b0:36c:a390:8907 with SMTP id 5a478bee46e88-3796750684emr4626540eec.21.1794626789920;
        Fri, 13 Nov 2026 19:26:29 -0800 (PST)
X-Received: by 2002:a05:7300:8818:b0:36c:a390:8907 with SMTP id 5a478bee46e88-3796750684emr4626503eec.21.1794626789258;
        Fri, 13 Nov 2026 19:26:29 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379558231eesm11403804eec.12.2026.11.13.19.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:26:28 -0800 (PST)
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
Subject: Re: [PATCH v5 09/11] platform/raspberrypi: vchiq-mmal: Support ISP parameters and stats
Date: Fri, 13 Nov 2026 19:26:27 -0800
Message-ID: <20261114032627.873858-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112-b4-vc-sm-cma-v5-9-d25e3b687e71@ideasonboard.com>
References: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com> <20261112-b4-vc-sm-cma-v5-9-d25e3b687e71@ideasonboard.com>
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

On Thu, 12 Nov 2026 16:48:07 +0530, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
> The ISP used on BCM2835 and derivative platforms is behind the VCHIQ
> bus, where some parameters and statistics are accessed through the MMAL
> layer.
> 
> So add the relevant structures, macros and enum values.
> 
> Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
> Tested-by: Paul Elder <paul.elder@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian
