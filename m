Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870107;
	b=PMdCB116UsZ/Y6XN91KEHHZnBzboM5zj3CWw1QhWCvsGXWXRJ7U92fc0OBlx6rxBztUP
	 a/23Unm4xNKyPb12HXMwW/TmYnRPXnfL7d/LMRJUyPZZS+wrwShlNIejruNJ2pF03ynfZ
	 jZriMZmCfm2lEhVHDMDuuD2dmRjQys98oaKxn5QFKLKin2HIFmb0WHLFkRkbHXmSFWAY5
	 0tyeySs+jXfRMf5P/JiEYNqVteRJ+AGczIIfKNiU3axK8lcLlSi0IjgrJxSvC6kXdejYK
	 bhmOkkwGL2h7yN2PCanHEIIMfchLgfcyIdhz9BeKLz1zL2aDzUHhXqT74ri0whdXDDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870107;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Su+gEpoBtUwCtjKeItQXUwyCg0MCSfAULs5Bw2J3NhE=;
	b=XHtdsygGCrbv3cWHDMl7dpfIm0rGOGF0ScgOTogVs3/dB0sKDKUhRZLVzE87PJGEjxPq
	 ZVpxgelm6XcB+OWSgCKo8ncs0MJzaDjDqSHypS/gY8ZNR+r+JP/Up1Yq8CukmIsG8Rs/6
	 VGyXAwPAxcJHIr6Ixj2StPdIPIJy4gBGEqC3SrlQ33cNrl56I+oj49KppvwlZNWTLReA7
	 G3J1Z40ONuSdYx7qPIiSljFpKcKuvtG33fosuzPQiKfrqlCfm9un0cCbR6UQCEUFp4QKh
	 FL975R+UZkE0Kbjz/JD1MCCbfHYc+9osPTtxAVLCnsXrIm3djrUA0P2aKr4h8QImSLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZdYVFqwp;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEA5606A88A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BEA5606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZdYVFqwp
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cc147d86bebso268655a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:01:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870105; x=1795474905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Su+gEpoBtUwCtjKeItQXUwyCg0MCSfAULs5Bw2J3NhE=;
        b=O/qTd5vI7TDSZQ25Aznl4rZ5mt2nK00OocoF00LmiuxBLe/bQly66wkIHgkyheJzpN
         mNjHzrXXqX72zfGESRjX/qXe9ulN/dMBeuSC1PBCtxHv/fQfbtx+avZEjhSjm8Rthdz7
         7WH2kZn/tZgnvVyKxZB7E9dGQ1zltHhWDrJtlCmHdxKaUWjmOuBYALXkvY9C/RptZP8S
         cPxp96y0mPBJQ6zvWL0DLHGXwk1oTxfa22ryjLdvmlfFLAmEX8Orfwo8oPosp0tT4Qcr
         oJugVLqOazPBQ0xJvp+K2o59zYFuyWJK4fvNysTC7t2kFTSFEQV1H6M3nN/VVOAcVJgG
         09rg==
X-Forwarded-Encrypted: i=1; AL+hErFLOUuMMhzkUOtAvUbyk0G6O9BiOKNKKakkkvibJju5MLXeMD8wfY5K4WJrgaRt7nuzeMpaGM3G3pUjLVg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OlVYPu3+thXhndUBlGsgh2oF9O9gWPXSLAOkj2Yo/XiWT3CIC
	TrhXOPIDOR6j+1C+4FK28RVJq665hb4uhpzMNUyOt2hW7zWdhI0quCvDXZ7qThYTiXA3hb9KeOy
	Cd4rHCVIz9VSOmyphzSLndqZe9EymdJYW00mrr7VeCaEyVHXq7OrE9djgTdlUyxcaLCCjODBUHR
	9D8A0Qi67CXhXZO+cxqYnGSrbmu4eUV1wmr7XBM0zkfFBtMMNxK1J72ANzGz1BT9w2BnhDf3Qwo
	Q1zL9GlJgVPYi2x4qy9MGkr
X-Gm-Gg: AZFdTZeL3G8VESdUL8dEZl6oMkIVprqKYYqgn1cpFWYSqYk3Xef42ICWw94A40qR9sw
	Qs+IBJLMePaD3rP7ohih9/hrnZ/3HGpzv020Vpad74RQ59wKTYdTnLFrB1PJX0uYNJfyT0qRUFf
	qDxTKl9ZXmgSkY0GWpu2BIwN/Jz07z6MMvTh2VrIMn9PS2eSkP6HKHH7x7xzGhZNzHVRQyxyjX4
	1XQdrv5CYdsuOZXSVY0wIsAJwrk4JkIw25Bya3SoUXRW1q4579srD+77ecIbKkbw0oJX2XzS+Tl
	IPtShnh2gCGqeoQ9SY5jY+umaLvhYnLsAhZommyOC7Ef00fiRWUKjXXDdD1pQsqZp+wx2xaoGHu
	GY97e/pRNVH0fOvQ2sHHqguHKzwamaIdD0HMgm6YVGgoog0GVyqTlz7rFBQOtx1D6NqCs2cn531
	6hGcVYlDExgdWe5AZ6h7UzE08R3yGO/kxnB1uDusaB
X-Received: by 2002:a17:90b:1807:b0:3a0:d82b:237b with SMTP id 98e67ed59e1d1-3b3abba9e7fmr519845a91.25.1794870105277;
        Mon, 16 Nov 2026 15:01:45 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3ab9f198fsm596917a91.0.2026.11.16.15.01.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:01:45 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b3ae327c55so230118c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794870103; x=1795474903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Su+gEpoBtUwCtjKeItQXUwyCg0MCSfAULs5Bw2J3NhE=;
        b=ZdYVFqwp+ilP/IJqXJKxMW5Tnz7nD8dQ7ohgqjOsjE0QoJV1I+N344fNHwi7Jjqz/U
         bYuPscH7x618S68fvD3bScPLOHkyQt9H0/YeTV5a5tXnypMBI3KcVPPVj/VKMJ2oDWLc
         Slg3ag1V2A31M2iDKfydaUf8tqsrsWRLbDmEE=
X-Forwarded-Encrypted: i=1; AL+hErHy3+JSHEZXenmAfWYayBaNKXJGMaxrlWXKkK1BLQD/YThGHLSEOkL05X7JjDI0p65pLoq5Bvfm/2KM84o=@vger.kernel.org
X-Received: by 2002:a05:701b:4590:10b0:145:ac96:3917 with SMTP id a92af1059eb24-1b53a470bffmr663515c88.21.1794870103437;
        Mon, 16 Nov 2026 15:01:43 -0800 (PST)
X-Received: by 2002:a05:701b:4590:10b0:145:ac96:3917 with SMTP id a92af1059eb24-1b53a470bffmr663482c88.21.1794870102473;
        Mon, 16 Nov 2026 15:01:42 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e008sm35174833c88.6.2026.11.16.15.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:01:41 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dom Cobley <popcornmix@gmail.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Juerg Haefliger <juerg.haefliger@canonical.com>,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] platform/raspberrypi: vchiq-mmal: Fix warnings in the zero-copy path
Date: Mon, 16 Nov 2026 15:01:39 -0800
Message-ID: <20261116230139.1470752-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116-vc-sm-cma-fix-v1-2-2b0f11aa96b9@ideasonboard.com>
References: <20261116-vc-sm-cma-fix-v1-0-2b0f11aa96b9@ideasonboard.com> <20261116-vc-sm-cma-fix-v1-2-2b0f11aa96b9@ideasonboard.com>
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

On Mon, 16 Nov 2026 19:02:54 +0530, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
> Fix minor issues reported by sparse and smatch around the zero-copy
> support added in mmal-vchiq.
> 
> If there is no handle present vc_sm_cma_get_vc_handle() might fail,
> which we check but end up printing and returing the value of the
> undefined `ret` variable. Fix it by returning -EINVAL and dropping `ret`
> from the print.
> 
> While at it, also fix the stale reference to the function name
> "vc_sm_int_handle" in the error print, which was renamed to
> "vc_sm_cma_get_vc_handle".
> 
> Secondly, during cleanup assign NULL instead of 0 to buf->vcsm_handle,
> which is a pointer.
> 
> Fixes: 67d0fbe47f8a ("platform/raspberrypi: vchiq-mmal: Use vc-sm-cma to support zero copy")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202611141210.9hmxzD2V-lkp@intel.com/
> Closes: https://lore.kernel.org/r/202611141218.5FZTnFtc-lkp@intel.com/
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian
