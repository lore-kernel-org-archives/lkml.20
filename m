Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C83439F87
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788291953; cv=none; b=ZueRkesoHVnXZlykAZA+DvJ9eApIx0pyaCRaEfCyxzyMoqQCeprV3wzkYLnUrJNA4bEJdD/Vq5tSQM34kvqYA9WaCiSepWdo75LPT8BhCjZwfTRn5TJC/0XQmoGjDBZBKL9GI2vfTdxKTV0X4P1/icSE87pvZtrXhwYDiqwMFGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788291953; c=relaxed/simple;
	bh=noIwLroC3QxdO9H9YOTtZZGb08Agpt6CN69Saip6HSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GTNa5oyfLg0PFqmtj6wMVKVzrpiYNn2/2fZWSaTlMcgFzYFUH1Xz8MoUyEmCSnp47Jb6g55gtK2Ct/4JKTog1kM/FWVmF5dMev+lTxJdbOv/l6zLkdun2GLfe8qwvU5WrRqgqrfNpEaZpCzM2htg7Gz8OUyW7fabaYVWQHLrsg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nYEuRlny; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYEuRlny"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so1597495e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788291950; x=1788896750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=egjLnBNnYVR/hTviRogWVrzKsRnzbjObGE015hZhVf8=;
        b=nYEuRlnyvYuUTVHVEGw1CFg38PvUZLtZhR8ugfQHHMlriqJXVOcmkfK7xvh1lWRyfj
         bkvQCYzIzj1BMlfO9c/rKChnHICHE84sl7b7+BxTvd24dSPaoIThSiZslUykDhAXT5j0
         VOzjijFudsIGXMmV70gpsgX/jCcA4Nhp9RCtoAK+BT1HcMy4ZqtDGCql8yR0j/Fmx95x
         9O26rIy4XgicGpLBVm38Ce7vV6Woc/ZXL6yvvRx/IqSVbCc4VhC3aYsEPxIqeVNUAHSU
         +ZeV8NdK5Ytsu1GkotdlEHYpJzuJAnPPU0ah0TT3/Bu1T2a32Sjl/91F5JRK5mxTluL9
         163w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788291950; x=1788896750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=egjLnBNnYVR/hTviRogWVrzKsRnzbjObGE015hZhVf8=;
        b=CgNd0dxkW1Af7junLSiZNOnRHXgc2gZt338Jtb+C+FkD/sfy9J+pNKjp7Oc6xQuJpu
         vTCGjEXINIXk+2dyFmJlSW71L/Rz6GjD8VA+kKqOgCZpOvruW86bb5By5tbQsMaXUki/
         DHym/AKY4CmZlSTtrsl3dzYzWSUjRyNN0HuqHmNT+Ywfhe2MOPmchB97MsbuuP+nDC1e
         Xz/hiFebmthlwMwSUV1bd7vfp5L0PBi3cR5YXwvGFjyHfNQ3XISu/y5n5XHLd4x05uhB
         l53QVvUhy7sQYuWsKfCjYMfPrlm4pLSPZuuA/DlEnbqFq9Vex9/lYQoYNvD4Oplv7IyQ
         J0fg==
X-Forwarded-Encrypted: i=1; AHgh+RpujGBi9ti+J8YeoUjQFPbI/FzUiCfl1n5r+msYiUCrU7jVS3DtrO2UDfk8oJASJzRQz8NgrqYICHNcUyI=@vger.kernel.org
X-Gm-Message-State: AFuF++l7l74qZtK+pGj2rGhS+5aps+eCWU8QI13PNT/pUD7/93cM4gCG
	IjINyQfOrP+YaPeBFQt+bsLq3FEQWzP6WvvTCKUNiQUxo9bzfoAVuWkM+BXhpZ9pbRs=
X-Gm-Gg: AR+sD10B154RgPA0c592baQtGmoXQlutrCXkE0wm4GBYinPbKzGqVTxJdRZdpMrnaTg
	2JvOZQ79k4Ly5QTubyW+k5oSq6e0yygrCmnR4IxrOFMjra44zaPvaM6Ay0bdtaTJy57u18Bk8bc
	dxqlfCrZTzupCaDp3BeOAHMenPne6Rn0CfyynhVujN3qjQW5qb/Y2rA0da28ZbWHcjKuVnwSY5H
	A7/jgtvU813fMKvS0Z5TIeK+1BR03rtQ4mGj37RMQgNXCshLVRxNQOq0i7uHvVE+cxgZKvhWqrW
	9qNCDM+dYSH9n5U1lpyDY8VXN2lDynf2UEID+R4k/6QKuPznjFYltF6Yvj2VX7VtmvdJOU6Vrkd
	CwFg/8wEZ6TpDicnI20W5khEkiHQLduTRmFJ+JzD1P6RFSXLOQAoE4Lnnb79mFwX1m+o8A49LpK
	9YWXa2wFQ3H4Y5NqVex9+3ZWVmd1W4p+4ANyBXiaTzE0X+jlNTIE9pBX3azvSjRgR8oO+nOCAPf
	lwbUeT1MGgdUkbF0M47cepY26+N1/obIynOBf0iJdw5gEYSw1gy71GAW2kHzyn30u2f/LT5Z4b6
	7sRg
X-Received: by 2002:a05:600c:a55:b0:499:60bf:c6f7 with SMTP id 5b1f17b1804b1-49b91c4cc2cmr646542415e9.13.1788291949789;
        Tue, 01 Sep 2026 12:45:49 -0700 (PDT)
Received: from emanueleg-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce4a804sm103691665e9.15.2026.09.01.12.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:45:49 -0700 (PDT)
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
To: Rosen Penev <rosenp@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Gaurav Jain <gaurav.jain@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Subject: Re: [PATCH] crypto: caam: simplify probe resource and IRQ handling
Date: Tue,  1 Sep 2026 21:45:19 +0200
Message-ID: <20260901194524.908240-1-ghidoliemanuele@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730204722.1101805-1-rosenp@gmail.com>
References: <20260730204722.1101805-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Jul 30, 2026 at 01:47:22PM -0700, Rosen Penev wrote:
> Replace the open-coded platform_get_resource() plus devm_ioremap()
> sequence with devm_platform_ioremap_resource(), which fetches the
> resource, requests the region and maps it in one call.
>
> Each fsl,sec-*-job-ring node has a distinct 0x10000 reg region and
> interrupts property, so the region reservation added by
> devm_ioremap_resource() is exclusive and does not introduce overlap
> failures.

This patch, now commit 9a955c0a7d11 in v7.3-rc1, breaks CAAM on most i.MX
SoCs (i.MX6, i.MX7, i.MX8). All job rings fail to probe and the machine
loses its hardware RNG:

  caam_jr 30902000.jr: error -EBUSY: can't request region for resource [mem 0x30902000-0x30902fff]
  caam_jr 30902000.jr: probe with driver caam_jr failed with error -16
  caam_jr 30903000.jr: error -EBUSY: can't request region for resource [mem 0x30903000-0x30903fff]
  caam_jr 30903000.jr: probe with driver caam_jr failed with error -16

The job rings do not overlap each other, but they all sit inside the reg
window of their parent fsl,sec-v4.0 node, which caam_probe() already
reserves exclusively via devm_of_iomap() before it populates the children.
So each job ring now collides with its own parent.

Seen on these boards (CI/CD):
 - apalis-imx6
 - apalis-imx8
 - colibri-imx6
 - colibri-imx7
 - colibri-imx8
 - verdin-imx8mm
 - verdin-imx8mp

Reverting 9a955c0a7d11 on colibri-imx7 makes the errors disappear.

#regzbot introduced: 9a955c0a7d11

Thanks,
Emanuele
