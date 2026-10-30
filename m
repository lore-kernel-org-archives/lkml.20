Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793347065;
	b=f38eC84ZiNY4ew7mq9zwOPpT4Ldl+2HcE+6YLPT9pEZIFttvHCF/avG2jWftAZFtV5dT
	 9XwJTXAWxBgmiGprJdbOIhnqsRThtoigHTK3wz41Sz6y/8kpN3BktiHqOQbaanYhKWJEG
	 08DgmRk9UnPQEMKGcKdRA7gb4SBMM3M/3IaHGOzJ25jCfn/OcEzj1EKE2HAdWLaXo5VQX
	 ohgrqmB1to/eizusF8doyNhWr0t0gagUJWpKRf3pn2w6Ff0xyaVj9PE2steLa/dSSJi0J
	 k88X3XN+MoPPaXbnjQZ1Ia9UrlZmjfSXTjJzGpTDkUzH+3cfP7npyAhwg6IX5QNLQtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793347065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ObLQIYquGzBiqCTd14UQGXrFZOGeRqctaF0y4LnV60Y=;
	b=pTmnZBl2twDV2yhiBldbOAzhVuobACUYB4Y6gUwYvIgrwnECnXoprojT1uLsKq08Vy+Z
	 XKsxLLhf4no76R9Y0vNbnznBSP8987VIfw5YG5bqiB0SSpILuPRBcjmXQ2/7J6SBzZlhO
	 Te4vBzCVJRtx1j/dM8nSysT7dz9PBvhpgHpyaemMeKVIEysblN9UHSedgH1gr60o/H3fQ
	 TzdWtzEArqCFfkvVQfiAKBfEmGWT6uxWyEi/vbtZ1rPFZMrOcD/tCY7Hnk5GxdropitQH
	 YzNaz8fCo5a05wwCUePyIUOgQ1dzL0pMB8cVhGWEAVCFjM/ul3H3OprnR4LW+WCuGXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fireburn.co.uk;
	spf=none smtp.mailfrom=fireburn.co.uk;
	dkim=pass header.d=fireburn-co-uk.20260707.gappssmtp.com header.i=@fireburn-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mrFrWyUr;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E196F606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:57:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E196F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fireburn-co-uk.20260707.gappssmtp.com header.i=@fireburn-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mrFrWyUr
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e04773687so93998f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20260707.gappssmtp.com; s=20260707; t=1793347063; x=1793951863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ObLQIYquGzBiqCTd14UQGXrFZOGeRqctaF0y4LnV60Y=;
        b=mrFrWyUrHxvEivP2DgRPPmSDKFqCjsC+pk1cnEIsYJPsRF9pO0/VTsznBFpxMPDtqa
         n+Xyu2saCK9m4daJymY2sac3/5HA1IZvFQZ+izkSZviyMzn9Y0HIwjMiuAOyPCL/uB4K
         5Ddmhwryl2+AYgeXMkrujLmCjO8nQdtKmDPJezSHH8HbKDl8UL9YcZbt57nCNC09Qu5t
         rUDSoFR0WbyXZPphUmhJ2hiGrmXNrjF/FD4Bjte8VYvZJXF2Ukf+R6UtSk3eXi6gBxNA
         dwBS/pN4EastSa/F619tYYkroBQc+QzbdhkGP6+xbkyaZrhJFI5Ibu7Lro0w2iI8mczA
         kDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793347063; x=1793951863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ObLQIYquGzBiqCTd14UQGXrFZOGeRqctaF0y4LnV60Y=;
        b=erm9gUSJ27JQEl3cNyb/Kfc7aFN98gQBi2mrt+65ij38f6bdPvGQiR1A1ohTTtKupv
         v7GdHSqdakQz7OU4aW3WQy2Ng11fYcU6n3koaXq/7uz2rCpJsMdewL657u+1Ftpc5xqz
         4x0JLjpt+mklT5yQh0FyZB7LfptELTJBRnb9Y+Z98iUauOmaoTAz3BG9E899l8WjdeZP
         niFUHKp7+EcRqI5zwhFUby95hGxKnxnjzfMI1qU39eMTc8srTbyatvnkKuOGP6ZbbxgW
         iBl7qRFcyjm2txnpLbtHAGtnGt6q1tGXCY0mFHG7gUoSOboEIlqz+rX1Ekh81feQJRCc
         Nrdg==
X-Forwarded-Encrypted: i=1; AKwUvBx108lOuHXR4HwkLw/AZJhX0I4u7+l2NbAuAvM/6Lv6zqlq21uW51npv+Q8IuXWDitap+gsFrK8KhaowkU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLw78LY0z4R63gSZF4aabW+OVm+RycZe8+d/QhNIlNJN2MCXwrQ
	K59rbZQjW5YQbBRcWhh9HpePuRLcCbXsatR6sfGjanzNEsgjgJBL1x4hCJMM/95+eg==
X-Gm-Gg: AYBFou0TPcWXe5kXLNfIDnEnTEi4JBlutyZ2s1h2VklcDBvyFTIlLTY7Nf4XWEJZTpi
	sGsSY313V7fRIiONvTJyvb8UjmIngcITjqbMOq50+Twudg2uP+2cGI+4FrgonsRLNuoPbwgWd5f
	9WD9vjT98opKT4P1rq34uHQd1n2egdLGOpt33mLWkTGeRRvx9gy/yCliEHgMGFy7CKBD7weVk39
	q/afunJhP53rrdz6HUH8aYnqUT5gfWzRF/l+Ynj0Ylkig5cB0VeGbtCCBda6tFlxHurTQwWouQw
	KjsMEFLagZ5EBZKLPFLCpch5RkPHpezzsvFXgJAgUscaPMUO8ySqc9GrJoPv3scEBsBLYCNqa8c
	8TrRNZDXWWos1PSTB56gcTNtpB1aA0zNfZ8SCOxY4qMhJS5DcLHzjfkjZ23sBbTJNDLcygn1TGp
	xvA441zPxbkVLahgQtjIfsi4R21/amflhVR8f4PQ670QJN0mYNBM8cqGJcAUocyUf1Os8Qqs5SA
	4t4RyeHUMKRT8FF/mmPV7CQLlroIhEcR8kovbEhjMSl++GS1OpMr3QoMNSdPAIIommE4/vT8hRG
	oRjMamXll23Ui48fCXKdQx/XAPR0q3rfxl7Uo2hy2omFEFE/hEcW72mc4ys9Avn78AwDbnYIvn/
	j
X-Received: by 2002:a05:6000:4a19:b0:48c:4442:54e with SMTP id ffacd0b85a97d-48e6e4f4405mr3497370f8f.30.1793347063048;
        Fri, 30 Oct 2026 00:57:43 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8bd8esm1675411f8f.42.2026.10.30.00.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 00:57:42 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: Alex Deucher <alexdeucher@gmail.com>,
	Mario Limonciello <superm1@kernel.org>
Cc: amd-gfx@lists.freedesktop.org,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	dri-devel@lists.freedesktop.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/amdgpu: runtime resume dGPU on ACPI notify from its own node
Date: Fri, 30 Oct 2026 07:57:35 +0000
Message-ID: <20261030075735.356811-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CADnq5_PbewORwc3Wsqw3VQESz3RNAKJy+KdnWHx9J1rKg35-Hw@mail.gmail.com>
References: 
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

On Thu, 29 Oct 2026, Alex Deucher wrote:
> I'm not sure about BACO.  In the BOCO case the OEM has a mux on the HPD
> pins that redirects them to the EC when the dGPU is powered off.  For
> BACO it's usually a PCIe add-in board so there is no way to redirect
> the HPD pins.

Agreed, and I can't test BACO anyway, so I'll keep it BOCO only in v2
Mario, sorry, I'll leave your BACO suggestion out unless someone has a
board that needs it

> Mike Lothian does your system have ATIF?  This is already code to
> handle this.  It sounds like it's just registering the wrong ACPI node.
> You should be able to use the existing handler.

It does, but only on the iGPU: ATIF is in SSDT7 under \_SB.PCI0.GP17.VGA_,
and the dGPU node (\_SB.PCI0.GPP0.SWUS.SWDS.VGA_) has none

What arrives here isn't an ATIF notification either.  _L05 in SSDT9 is
just Notify (\_SB.PCI0.GPP0.VGA, 0x81), and that path doesn't exist on
this board, so the interpreter aborts the method with AE_NOT_FOUND and no
Notify is delivered to anything.  I've put the tables and the errors in
a bug: https://gitlab.freedesktop.org/drm/amd/-/work_items/6061

What I haven't checked is whether the firmware would flag a dGPU display
event in the ATIF SBIOS requests if the Notify did arrive at the right
node.  If I alias the path so it resolves, I can turn on drm.debug and see
whether amdgpu_atif_handler() fires and what request flags come back, and
if ATIF_DGPU_DISPLAY_EVENT is set I'll use the existing handler rather
than add a new one.  I'll report back

Mike
