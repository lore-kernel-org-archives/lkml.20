Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626090;
	b=29JOO+VyDjXbYlpvwl8rtKUbdMU7iaserQK2FEAtayAfgxYZGn3Yv2i0hp8hMleipUta
	 NnNnweFT/tTzpXrxafBt62rvjzdR8T2YwFlI57tpHSiBgLRJ3uO/f5APwkmv0m95T7JvD
	 6LiHbjf96RzRRtyMpT+5k0vNSeP9EIhdh1pAHq7uC3pZiACV/2PJMhe8pA7liiIhQ+qsP
	 /pZKSRr0IE9SVD0oVt+04PUYchq9mwgRdcxeEWlQezWwoX31AMl/Mzia5Hj/qZG1+fb5f
	 jwQFuDKzYUXn0gK/7QsUqq/Hy2H80WMCSY1TmtU+9VELtrUwxtDNVlx7KrUEHPsmuVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626090;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=ddmIYXPpxpUEko6evGlIgab6DVxvo2ysVO2fy9tc38w=;
	b=LcIowSAiIUCCngSQfRR0hw/gVR29wgnUFAiao5q/uDcEKwH2h8g0oiEuvRkwnKC25JNJ
	 5SCdOBVPpC6j1rHMf1t+nB0Q/x9NQEZowOBfhVjnoFlfWyB3l8QcevIA0jCxAV9J6se4z
	 YcvyjKKl0OwXM6ocpIZgFxAgAXP22shg0QELdA145b8/Wdjltqwjj+4/cODyFoKMmTZZK
	 v/hIFtuvibfFqqvLbQCsVxkS9z87iZb92+eMc/45S1CZzwbFcaFJGt/4dOh6GJR68saIS
	 dPqm/a0QNvcyDgByzOhvyYG7okI14+VDoTIM406CcM5cPOPiy9cm2urXycme5Uz1+MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="Z/rCS5Q1";
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA2D606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:14:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EA2D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Z/rCS5Q1
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cdab938dc83so851999a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:14:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626081; x=1795230881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddmIYXPpxpUEko6evGlIgab6DVxvo2ysVO2fy9tc38w=;
        b=y798nfahpxaiflTHXDvRhK2/1UFjUl2o8DLD2gG3pE9vZ6E22qt3G01TJzw5icIDdB
         Ab+ACGdxelHA+usFDV4Z56RiyRCk79uWt7KQk7WLypS5I7ZF9NruXXEkNtpdhGGVvJoC
         XJJfgeQcZ8wsYGxPgGEBEI+56lYkDV1OzEfJ42RPfJJpwuogYWbDINosRKTB1Ah1ozsN
         iZDy0zfYWZXwjsZMZ6E5wqdGc4A648QkbDl3M4IK2IVydSxb4bmjoF+SmlSVpiflcqjv
         EQ7o/hHPhjn0ziWcmsMVDM5FpY56nmDEjvb6YPIv2cD3Kdr+wAO98SSKTzOmRPZ30LKq
         AWZg==
X-Forwarded-Encrypted: i=1; AL+hErFRChbDDUwQ1JI7UyFUgvtYIuwK3bywL5Oq1sTqgr2NPpKynuftwO+ZElGuXHLuBxZ4OQ+i1+4xwpFHTVc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qSAUWRCtMLaeyf8Cz1JOgGsMJwIf5njM8ZGl5BqaVtePF/I0u
	WxGceXbYHeIJzTQjrGGXpWSzbzN4WSdXQZe4/s6A3ZTAhKaRAj2wHmj0lKhllxPkkeHSJGA/A8F
	H5Y9w22mXlXg1FMsvv4Ps341Nu1hcUwYaHboZY+LFKKuEKkHooMLWBNVRVon7M/9UbBiYvR4LcL
	A7SfaNknQPyqPUXIGR0dwiqTgWyXpn3IdHOI5GrJew03bW36wQhoiU3CFhMjImECePEFGRZa9HT
	ZfOamig0J3S0BSGoahmaN4u
X-Gm-Gg: AYBFou0BR9F/90nnX+7rkSevLvZLUAubMAFvvirYbHU2jyvsP2YgvouFyaglwc1Nr0D
	d98TD3e4Y4IsDqLWtE4tTlA0IgMrImW/B7Y6uWs/Yc5KKglsdRFTn4jQ+ooIo3ldpHxiKKoyRNR
	lZxENT3D37wtrQFHqiEj86E/tSF/F1csdP+BJCRIno6eac/AGEyejA6wBBpcHSJfL6VDg8gre2r
	mdxpFPppLuujDxrpfVCnQ9MdrBRtIp2sm63QAZZLsiHr3TMkNglOitAHzto1ITtRoWwE2EecwF4
	hmuihKEygM8LIN48WgIblMUODhfmOHfg4pgBJwsjUesym87G2a0Gx/L9+gRNMhOYffywsOO7Jtx
	JRvp0i3ihAD4ICx6c8+fU4EoPas7COjakXYIv577ZP5wrzdpOk5hrp94YfYUhntHx
X-Received: by 2002:a17:90b:1b06:b0:3ab:36c4:b4ff with SMTP id 98e67ed59e1d1-3b1b0a0d922mr4358472a91.24.1794626076758;
        Fri, 13 Nov 2026 19:14:36 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197a330f9sm9215587a91.0.2026.11.13.19.14.36
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:14:36 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-536347602faso30833241cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626075; x=1795230875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ddmIYXPpxpUEko6evGlIgab6DVxvo2ysVO2fy9tc38w=;
        b=Z/rCS5Q1VRZthUR3nUJtZ6sOkXaih+LG0S695G1InNG1gjw/W8XPSgfjEDw9U96b3g
         EBOJXEc1gosD50NC9y77VnqSBKxpP9FdWmCVNVP1dBFpi5dNcm26825hblj2yPour/aV
         j0tzPpvMF/zL0yPaQ+7g6/Gqvm5o03AEeCSp4=
X-Forwarded-Encrypted: i=1; AL+hErFzapWICGgNGTPmj5E2ImquJt09nDISFRBAhFUi/bdLalwiSy6ATQ2j3HFZKsoqE8jNYqDpycXu4t7lnHg=@vger.kernel.org
X-Received: by 2002:a05:622a:a190:b0:55b:fb2e:a754 with SMTP id d75a77b69052e-55bfb2ea94fmr31383591cf.8.1794626075423;
        Fri, 13 Nov 2026 19:14:35 -0800 (PST)
X-Received: by 2002:a05:622a:a190:b0:55b:fb2e:a754 with SMTP id d75a77b69052e-55bfb2ea94fmr31383341cf.8.1794626075036;
        Fri, 13 Nov 2026 19:14:35 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad0a2028dsm31415831cf.11.2026.11.13.19.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:14:34 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Sander Speetjens <sander.speetjens@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Eric Anholt <eric@anholt.net>,
	Stefan Wahren <wahrenst@gmx.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] firmware: raspberrypi: Add blank line after declaration in probe error path
Date: Fri, 13 Nov 2026 19:14:32 -0800
Message-ID: <20261114031432.871022-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107-fix-raspberrypi-firmware-v2-3-5bfe605a5cc5@gmail.com>
References: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com> <20261107-fix-raspberrypi-firmware-v2-3-5bfe605a5cc5@gmail.com>
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

On Sat, 07 Nov 2026 19:21:33 +0100, Sander Speetjens <sander.speetjens@gmail.com> wrote:
> Add the conventional blank line after the local variable declaration.
> 
> Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian
