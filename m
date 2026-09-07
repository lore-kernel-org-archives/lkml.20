Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E32364950
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788755050; cv=none; b=VLXQZz8iom7Bs1HOzvgs3Gmgya2q9CWsyjla8Cdicf5cKWPt4kgfmPsUBN3JjR+Jeud+2YRJBF2sHav7dESFd7xqsgQAUUEC4dEaT7xIPt/uVRg0OypZ52bqep0xm3Kx+vguaoAj5taIN4uweuhAWxI8/hkPDjFZMuQiC/1+6ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788755050; c=relaxed/simple;
	bh=7xvzWPsbRUjoKFIeIpJ4LNFFnqsIGbmsPP/3C4GXOA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DU4K2Bgn8n5LTIQEy0N7V+5YP11ogYwf7/V2U7YwVTqCxHhmhuwLDF8W9FYvigvA+xc8Zwv3UUwtWl5+H3vazaPZnvIR4noeRKfFHMhSigbrbLm0cAKU3VsTLOw/uKgq22wU4FRLpCFEyhv+McQuOvEu6ZMZFrH341b4Q4QAOeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mZ5L0vra; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mZ5L0vra"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ca12086c06eso2449140a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788755049; x=1789359849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PmXzGo6t/wlmSCym3bZyWZQ//t4eHunzCgozWLux0nM=;
        b=mZ5L0vradIMILAvIhXttMqcIdmGyx1ScDZesfpP42KfjIpwlXr8bnAocNiAZ/qgDMN
         sUH0EglxahPdvR8X31cQEeLh5wz+6A0jpkFljZ3rxWki1w3V859x+llhw/njHJL2D2au
         dbvgPZvmgvFkPYwJQpqlv/4NMTznf8UwDAFDdUgQr+5GY4r7UeOMWGaQYtU3TAI7Rfq6
         x6DHfijxk8eyVUnpICnVth2FzNdOE2mkOke7ZaH89pk8t32PBtjI+XqqzqKfM1no02oA
         9Tvp5TD2lXHzQ5vgpzRZZzakjhKCz1kvKx9CWjl5sx0lOaa7UBwdTr7kpX51xGzuaPiN
         XUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788755049; x=1789359849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PmXzGo6t/wlmSCym3bZyWZQ//t4eHunzCgozWLux0nM=;
        b=m7YmfnylatRz3LJB8+KzPCSLlgLKe6sJbzoQQth39cguk9eWoL/yur8jmM7wTO2kM0
         sJX+vYVOrjG0p14z5lwArBd70e9h7kU7BDQOdcu5g68bG/+XOZeH6Ji/QSIvqeGpd2oE
         IlDXvRuw/PrzOeZvBg+XgxkSLbhu2J1IXZwzVwiYlIIYyS/FoOsiWZYHviJfVG/LfE8v
         eMe1jVfQYxEiW1k1wGLH4znGBIJEMMI+X5Jjqe6uJ8Kmo/upC4NS4pP7iH5nM3RyTg0p
         Nt6VRf4G9de5IoFhpoXuZUYWfBMktTEmuc6olpxQunJ6W2OuBUMVXDKQX+G4DY3z8t3i
         9wkg==
X-Gm-Message-State: AFuF++kWWYKFcgwPYrzGCVPECDSuLLl0nQYluLbDB74mBA5+dD0pn2EQ
	nV+tfYsMpBCZYC/wCvtpvpo6P/cxI95go1jOI24sbCA8rVDl0y926sWESrGNyFDT
X-Gm-Gg: AYBFou0zgQ3H6+G8kufRZ8aLjlScyvzSwMHHnUL4Vr19ff/c56UIFFyzjK4GoeiZyaL
	EvU9ozmt5i6+Ny3oWQ/Mke6KdixA7bygtr4TBuHfKoHf0Go6YUcNJ+dkxxntuiIkDz8HHQ3qhVW
	qg66aO0rSoSztrZbdWRq0ne1wMEWKBo6MUKYd51LXJUeI+OMXhan1lqvM2hnJ3PxzNSZfoUJ9rh
	HXusBvVBbI7lFNo19RtTUiB2LgPugQT7vnB0f9pGY/PXUYrKIDtWsVyME88RErasK/6I9GWZued
	o+6OW0u/V5NhxbwJnmmkI1aRcLm4SM+Rwh9Ga9sEckt8yGNtoiqaotCTDEltA1GRoXLfd/zvERk
	oLk2itrjFNuAnzELLv3ApsmwsCAOwTJsHIKtreSCbVuN7vB4rJ2e+2+xw7Zjo5VHHQ4l3ZE/aON
	tU1L+OqS5RM6ni/YEmSRulNl6gfI42Q3uEqDZthwHPIGFRtB60nwpNTq4jhIvAb08QHpij38Boy
	vOn5idEAZK/0w==
X-Received: by 2002:a05:6a21:138c:b0:3d3:afd9:6040 with SMTP id adf61e73a8af0-3da3a1f77f2mr32584655637.27.1788755048746;
        Sun, 06 Sep 2026 21:24:08 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3342af0bc08sm22629643eec.17.2026.09.06.21.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:24:08 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH 2/2] input: fix repeated words in comments
Date: Mon,  7 Sep 2026 09:53:58 +0530
Message-ID: <20260907042402.12893-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904111911.32224-3-hemanth.selam@gmail.com>
References: <20260904111911.32224-3-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please drop this patch.  The sashiko bot flagged it and it is right.

  drivers/input/serio/q40kbd.c
    "It allocates the interrupt and enables in in the chip."

My patch deleted one "in" and left "enables in the chip", which has no
object.  Reading the function, what it enables is the keyboard interrupt,
so the comment should say "enables it in the chip" - a different fix from
the one I sent.

I will send that as a separate patch if you would like it; otherwise
please just drop this one.
