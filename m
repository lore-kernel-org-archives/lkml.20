Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612274AD4CB
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002494; cv=none; b=aafdA36KId20E13w86j+HtkX7gI2SitbF8uAOYwWmPKFN/5w988/MBZowK9kvVXP8ew2BGUFquacJt/I2s0tIggKVwDGgQswDB0IegV2/1DMHTURxHf53kZY5WMevTlQsDPxRV5Y4c7KYxE2C//KPRisBdGaV3AenekZLxdtmFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002494; c=relaxed/simple;
	bh=QWcJ1ZwZUHcxpyq7thHCmohE4ptDaGzodLSdKk9x9Zk=;
	h=Mime-Version:From:References:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DI54FminhfL7jtplz8fnEpAbK/e4rUywl+nqOPJRpqBAP+LuiclCVuoI3JgVVaw8pqQzwa1ZhcyeGsc027xFcmFzCmlZXNpvqzdz1mBI+Ir7yFU8cHM2KXOCE6vGpSETF3dmDm3kQ1J2ytRm2BEa8xVTOpnCSAouitudLMOTcGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=black-desk.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=black-desk.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a302c23fb2so25679041fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:54:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002490; x=1790607290;
        h=content-type:cc:to:subject:message-id:date:in-reply-to:references
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QWcJ1ZwZUHcxpyq7thHCmohE4ptDaGzodLSdKk9x9Zk=;
        b=sEGuavj0DXZxhMYP7RIR4nvYsBzF482U3c9ZHVR43iF7i3XsSzG/Jgdh3P7uAaUvzu
         uO5erZG/zFSSyShW6g+MrunpoqoUohbrtuVcB4K8IzriM3OK+dXUxUbOfZHTxrukyhNZ
         Jw+2EXwy1+24hTY7fIbQGf2ywd1cpMKDFeHNlsCyCltQwcllUb+yS+rSxYcN5u/PQQyv
         eDD4XkxiAzxfuEbLbERNWYg2Tc8YmQWvp1bTM+Vkp8ic9iFkAkRzTzLHtksu1W9iaKsP
         pDJK7DhdRPoVb+2QDR35Yj9g3rk/2dpGm4/SWSCy9Czxwr1ntdfNxssgs9pS5BdpI/gb
         RDWw==
X-Forwarded-Encrypted: i=1; AKwUvBz04V/HlcS8Oe4OnzHm3rQITYMSKTmfRtoakJOQ054g1afmJogOCTmlqhbTYM86eyJDAmp5Kg7RYtQSSB0=@vger.kernel.org
X-Gm-Message-State: AFuF++lhb8uXOS5PitJp4nSGQihoXZzVi7mc2QHFZcwLZCzrQ8v+kepE
	v5qoCxNkCMiScFt0IBrLIY9KYxrV5FiEGz1Z1LliNwn69Kb70LRz+BrAKfuCec0uIS9rxw==
X-Gm-Gg: AYBFou2FrM7GQ9keYm5PBYL9ZgpBNzF3/0uHGAMcgAkTj+cOKl2NtxRaLvyFyvunV2d
	c/pWHYSfd53Vc6+BVkpLdpTa7MVrH5gEB4pS/7g9kFcFXxHTYgNcU+jHPhV2+utOTg3qgsMCnVG
	9K7PSV2cYS7K7X25hkz1OGWomON/Iava7r7b3BJmvaDynRJ2/m01R8/cYYtIuBdB/XzjPv7JVdz
	KOfMOXo6GA5q37knqNaD8NBGG1Clkq0s7VNeQ4US1N98QlcHsz615jdPn7xuSiOLCIu7abyd6CJ
	nikR7bwBNcL33I/157+jwNzRchtnJWFb7k/9DMv8V4MggWknfefTvLJ5//Hnd8nBz7+z+LqzQxa
	J8kCP1X4dqwtIKGO85MNi6KTJDL/JEMQeQkIxaHdKzEDqlMgj6jxjnv7XSZhxFzAWs3Zsu4P1Vt
	kavNKO3ncN7tS1DA0Rt0UdlxdtzW5szvBRUVsIJI9zaHMfbRJi4cmtKRNIVl0jmUnZ9DU6+2yjy
	eAn57I/j7r5bXBLR+7qSfaKvq+s+FME3yhgEVZ4EXgZIJkb3NZW0HeUIKNUq7VNEIcYrZMdsRU=
X-Received: by 2002:a2e:be2a:0:b0:3a1:aab7:9bdf with SMTP id 38308e7fff4ca-3a5fbe4a9femr23452341fa.5.1790002489991;
        Mon, 21 Sep 2026 07:54:49 -0700 (PDT)
Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com. [74.125.229.205])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a60763ea05sm24631471fa.34.2026.09.21.07.54.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 07:54:49 -0700 (PDT)
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c795f805so1587575e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:54:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzTw6f+KzBiKOfr3bxK+V1yqjkd6kNwStx7ocLg/+VX3ufCEei5IyQM6ciHm1vjgvuyWa5QeQY6lK2vPQY=@vger.kernel.org
X-Received: by 2002:a05:6512:3a96:b0:5b8:9c46:d4cd with SMTP id
 2adb3069b0e04-5b8c1951288mr3688629e87.55.1790002488480; Mon, 21 Sep 2026
 07:54:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 09:54:47 -0500
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 09:54:47 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: Chen Linxuan <me@black-desk.cn>
X-Mailer: aerc 0.22.0
References: <alpine.DEB.2.21.2609191504030.27665@angie.orcam.me.uk> <alpine.DEB.2.21.2609191513020.27665@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2609191513020.27665@angie.orcam.me.uk>
Date: Mon, 21 Sep 2026 09:54:47 -0500
X-Gmail-Original-Message-ID: <CAC1kPDOfcwWWf=c=P0jdkC3gY_XgW+kUVRHJUzGcbg3kDWXQVw@mail.gmail.com>
X-Gm-Features: AcwNN1V6c2qU0b0r9BU2071ZB6Xf7zCTCVbgql1xyH-Rm3j5rkXmiN9tXpwtK7I
Message-ID: <CAC1kPDOfcwWWf=c=P0jdkC3gY_XgW+kUVRHJUzGcbg3kDWXQVw@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] MIPS: Only check -msym32 when need-compiler
To: "Maciej W. Rozycki" <macro@orcam.me.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: WangYuli <wangyuli@aosc.io>, Chen Linxuan <chenlinxuan@uniontech.com>, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Chen Linxuan <me@black-desk.cn>
