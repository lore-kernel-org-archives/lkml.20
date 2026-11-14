Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626772;
	b=jUlwi8p6hp0klfiyalUAPSfqw3SVV81jQ7a3/RVb6j2H2u2r2ikAo1U454L68xF44PSG
	 JS4GoBbL60DV7jlViNkn3lRsTyCOYo9r3QJOlXwB1bVGr5IG2hdM6yWCFdvsNL27ZvBeY
	 Vfzuq+aeTfexkKvkFPOKf5swS0f7/RWx/AxeRoTt7cFy/gCGJVUlcVFNZs07Gm+QjHZFl
	 ZP3ZyfNvx+VYIbuU8gyoQkxZJfeUH3D9saSCwxY3FwloFDUEoYr2xCgZ3cwjy6qy7VZxv
	 RK9J+w/HRvlJlpKGCbrEl4bjNj6zKw7C85v7TiVwSeAvRyyEKnBvaokXegk8kPjpOcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626772;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Nf+u8uDdBeb8sz6+AsPwZUYSErJxQM3b+PCxFlU5aJc=;
	b=zhtKKQoDacHog1qycP32Q1wQg/GjpIzB2z3AP6f7Y4PYQppdZDDCWvue4aZVFxNDazLZ
	 c4PXpbJzZPjwjiWWRi+Xqu+N5+28iAusZexfPwo9767U0AFs0lbQNQh9GUOZ84F+09LFh
	 zNESmJ0jegNZqrP8+5T0pVyT5TvpfLDFvV4LJm2lbdDanhA+RMNDWQvqeor5JDglP0lcO
	 pF9AinhQE+qmXgCz0G/JyICx0RskkagP+lhop59lZ4IlUgrm/ejVBQMzgKm3MnP/SmZpw
	 I//GpYzvFH8pDoEc+gI59fnPoNoGvtA3Haf9zboUnpL8d/u/SeLMDVl0CXS3cZHULAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="IKl2t/1w";
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505F8606A333
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 505F8606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=IKl2t/1w
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cdb9f760337so1337302a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:26:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626771; x=1795231571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nf+u8uDdBeb8sz6+AsPwZUYSErJxQM3b+PCxFlU5aJc=;
        b=1KjGNRPGvYdv85pppCxVPKIH9EZeCm24B3HhrHHXyMFrF965Jt/l2A2h9BFD+ReTaR
         PLgF+XN0Nn5v/rIQDFa7N2zxIEJIPID4x8Ctp57es39lOR/QbqW5L4Xm1aDLDcbpj1fs
         FXp0jO4UfvOhALxj4V/N9uhSVQEmgGc4/yhLUqMH8SU7UUi0TGRAyaAAPy/5LFE80RKy
         nXdnUasAVhy0T9cV9ETsrYW2gi5wz7iih3CZzdG883Fn1/dkrz6ZYdcGcEQjQNCuE8Uf
         RiKLL7zJQSdgUoDN3bHQpRmdhEKgQp8skS3mbz+1/VG3VArMWMaGbPPVBRE8bnxmXtDw
         Vf8A==
X-Forwarded-Encrypted: i=1; AL+hErG5KdpzbVDecW2zsvFFlhjb4I4Bm91nIFbbjIFRL548PKETUSaiA1UQYsi2frru6qrcsXwfVP08Ae8hgs0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0HB6dAr3GYBDWDxPi25jxjSh6gptB4AJUEXB25hz5vG9/uLn/
	0mT2d0hrzUxThWUYAlFbgPifOayeeSnOQSXW6cjqqDsq+eN/bJXMwkQasZCWkkpogPVZfY5BNVi
	JytYAZUA+MEoWegOWEguBc0DCsziO1cWT2xaA1UwgDTAkXK2Db1eGXq2jD7AMlmMh3qjoAs575h
	Fd3CQNBuOF1r72orchPOrgGzamGIOsi6TRpJuxyu501P1jiJu7inNBAm1CzupbSfzKAjm/0prDV
	YuyNSGlLLnIHkipSOJInLog
X-Gm-Gg: AYBFou0NORr4k4xsq9Px+TM9Ao1IEPwmdH0Tg2SoGzc+96KXG81KghSOLBpQlgbpWxu
	hyKQNBGV7uahm6b5tSnJwnOPWnQly09QRrT+DSfxBITZ6KfdIpTd99R+5H7NDfBfpvMOWp79V0h
	JaL0hvNelLRZWktObXBFcHtnZhZb57AtHd9KJ2YqsjJmYhCawJG1OW4cTxSMIPT6uOyoSkgeG9a
	NceE3Gbtg2KPvGHjr5mBnsQcgBIjW8hg8C/xN2wSNqk39RZrLdFRcbEC7bMvVbu3W+pSsT7LwET
	l6KI5tiqQv/3WaCt0nfFi5uyFraUqTBqiaFgRNhVPMPrtKbLoIVMk7m5hUFSDh8OdI6dNJlOGzH
	YXS+j6mCp0vvzLfJkHhHB8weweSiy3Qq0lwJUpX66oG9v1OVfiDJzf1W5P6kDToMsJUgXGbjun4
	ezP7h7t0gHEaWvJdPihppyAPseKqwjlqwcxYPDa5uK
X-Received: by 2002:a17:90b:5544:b0:3b0:9bfa:72ac with SMTP id 98e67ed59e1d1-3b1b0b996b8mr3245302a91.21.1794626770511;
        Fri, 13 Nov 2026 19:26:10 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b3abbe1asm3282895a91.5.2026.11.13.19.26.10
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:26:10 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3425098ae4bso1976083eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626769; x=1795231569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nf+u8uDdBeb8sz6+AsPwZUYSErJxQM3b+PCxFlU5aJc=;
        b=IKl2t/1wPrVguI+AFWbv4UiiX5YKtcwOJexuVTsNpPOzelgDZNAj5JcvuG84UK4P3X
         IKxkaTdb6IN8vfoia3qIM8s4K89aYNDE6crLz2o4lRdCjT6vwFmd898tN0iZeQElZPwV
         RUlWt3uKx7/TnynIOV+phF0YqH7OUgvMWahTI=
X-Forwarded-Encrypted: i=1; AL+hErHqMAhDpCR2y+JVbS9z1y1d1EDRk3n/AuAe+1JQMot+S670qtpKhZ61i0uzjZ08UFYMpyN8BjxNLahFS4g=@vger.kernel.org
X-Received: by 2002:a05:7022:e881:b0:182:d0a8:d1a9 with SMTP id a92af1059eb24-1b4f5dbddb6mr7061016c88.0.1794626768619;
        Fri, 13 Nov 2026 19:26:08 -0800 (PST)
X-Received: by 2002:a05:7022:e881:b0:182:d0a8:d1a9 with SMTP id a92af1059eb24-1b4f5dbddb6mr7060975c88.0.1794626767910;
        Fri, 13 Nov 2026 19:26:07 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad134sm14219770eec.27.2026.11.13.19.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:26:07 -0800 (PST)
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
Subject: Re: [PATCH v5 07/11] platform/raspberrypi: vchiq-mmal: Include missing headers
Date: Fri, 13 Nov 2026 19:26:05 -0800
Message-ID: <20261114032606.873673-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112-b4-vc-sm-cma-v5-7-d25e3b687e71@ideasonboard.com>
References: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com> <20261112-b4-vc-sm-cma-v5-7-d25e3b687e71@ideasonboard.com>
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

On Thu, 12 Nov 2026 16:48:05 +0530, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
> The structures defined in mmal-common.h use types related to lists and
> videobuf2 framework, but are missing the explicit includes for them.
> Include those.
> 
> Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
> Tested-by: Paul Elder <paul.elder@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian
