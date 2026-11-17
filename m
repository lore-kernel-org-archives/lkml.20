Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794929936;
	b=L7OXx/aPB9wlSmWOVI32Ak1I/SA4iV56HD2SzW+zqcW19pLmd2Dh6F0j+2HpjR/RfOhR
	 g/WLXFijmxxghzPKKTU7u5/dJlbq4gXbOEQ5stuUBAxMdDn1xXPvScZocXXg7KBVvptDy
	 EUq/ADMl0c4SrT3Ycj77GuOF56C0QqqWU7GrP53nLADqjETZWbyqgdurg4JsFVEiSAA3/
	 k1U7ZSY6ZfyI3K33ZTes2184pLKhKVthLWEwepjKr7f9Za5/aZ+DDS0Mzm+HLn5sbi6+x
	 ZIaD2NQl6tf3MqdjsYppBMUqSn8zzxNf6vKaq1JSqFXk56FN9W9etry5fcgbsILf7mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794929936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2OtjkmM0kgAG5rBlapfGUja81WVEPt17G99gLjcYGE8=;
	b=Fe6Z9SChmrp0JG2y2VzmwneDRL/uGOS/jDMegS8ByyjDmaOWDTGRPSkeVQZkSB8ir2Pb
	 7jWJ0Q3HP/YErBwMZWgGgyUkOaFsHXok3g933EYY9zIWX/k3xsd6M3y63H7s4DrJ5lWDz
	 A76RA6YtHnJwRV4dH6GvyHHh7KgaYapAVVQfJCLCv2WBAJR2CZLIb/VmqXNqUG+XKRUDi
	 m2E3hxfpo3WFe2EVJeXcwfcAsAj2Njg01a0gvPhNe2d+5t2yL7vEMbhGtU4tNa/lZJ9nO
	 xsq84g+CTnb02p3NT9KAlnbM+NzhuWV0z78XF0V7pNk466HK2hkVW100cAgu3DZ/EQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MoFrHDhb;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C13606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5C13606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MoFrHDhb
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-372bdb942dbso4483341eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794929935; x=1795534735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2OtjkmM0kgAG5rBlapfGUja81WVEPt17G99gLjcYGE8=;
        b=MoFrHDhbS3d3mwGDQk9t3CBTmOF2XBVomXkTCqKrwScvbeexN/knJ0CO+XQkvytkIq
         O9qb27K+Z/uhl3tlJLpWtY0Z0NXAtjYamPUWCv+x+4Dw0tF2KxGG1VZmvGeQ4JeT1dGJ
         sURBf4FcKDwpWuM7curHUBjeThgDlhITNYNnIcbuD6FxctOTd8wt/MVitoKmnFYdvt6v
         jFB1esWL4LbeujsAg1Xl50fNmiESP9Hl15v1m35a7himVnq2cFlnafixB8IqFmDAE0yc
         nsUD4m+HT0ZE2ZyWdCDJWwxeS+NtYH6ENKvcUThkdMnylyuP/9unuTJNZs8hhizbiywI
         xPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794929935; x=1795534735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2OtjkmM0kgAG5rBlapfGUja81WVEPt17G99gLjcYGE8=;
        b=uqdF3IFoYK7Im+rtHnlGYyENDloG/Bt+W5gcazE//6bh33nOhhPZfwkPwNJB14U1g8
         LAxiSU/HSW1xgFdvE3/1i9qmrwO+hnmwABNrfyUO5d7EyywcjtTK5MUjHuZxYvzRFiYS
         atgu4bK4pj7aGABOp5WLUUfkflcCKVS0sFMbptO1EFb1a/rqH68IPhlrg4snAWnSMFFL
         K+84EgTtjRPRJizIznjTPhnWD8xF+aPTti1sTyVLD4YeIF0Qu/aFjiFn/OoSfSCh4Hc2
         euXGMm3FNktvI5nAbG76J4KXovw+8D6ktvH5p5mhMF3JfySv/SQjEMPAB33A6KAeTUYY
         zvbw==
X-Gm-Message-State: APuU4Z/AdyxAeRBz8exuVjq06fqV7jMrkBbfO5Z9hhvBZltVa8hODvAR
	VpC8hJCeNGCMrI6gTht66avx7WXZhJgc3SB4bdwJoQ7xW+bHJzwPeb/6
X-Gm-Gg: AYBFou0sp/e/ox/vcBbbOHuLKmmH4pFpEWYFWaa73zxirRBTpcRtXHvBTkgzditlRvN
	+EP/Mm27eXSuC25YYKlUYvODEBLwYUOHTjyl6eeUb9xf3bFTm1Ol4KUHjp3Lb1KgycHMl9hxxzG
	v3YQqf/L0AFcMGSETm61lU9tMvTnABcPKffHJm714WxPrAxyBen0wDLr67BUDdV7mlCVV2Mx5eG
	DelxLKBMbcpIVzDNw4VfbRcOYaMOeKluMlMHD4fQ9Lic2h8EdYceQvmaxpf2znj/vKMinmjSjcF
	CE1ZyGES9jr6ofPDBwPebiDpJMpqGbfiexsPwIIGjR3ujCpc2J3moruY1gtPVrp4uM5Dd5lZ/P9
	MAYNP338IR5X7+yQ75UWl629VYFs5ZMTRWhqwHMzVbrwq7ofSg6d8FcwjzmNrU0tw3WezPUcRXR
	X3MPvL6k9tiZm1ZJ1MebLVA5jgbLdrkad00V8zt4NxrDWRz4VSRrWbb9XJ97Bf4zyatiXHG92Zq
	lRKV9XqTk6XYW3Tt6LUYggpOvFCmbyjcMr55Dhiq3hdE9N/c2Drx8HknjXVshph4eAWFAqfKCRq
	zxxQPZkTL6tiovuxAzAJZhSfEuQRtQqpr6OnxtGoL8PHtHx8qVo=
X-Received: by 2002:a05:7300:4faf:b0:369:f961:ccf8 with SMTP id 5a478bee46e88-37967ad9432mr14017145eec.19.1794929934846;
        Tue, 17 Nov 2026 07:38:54 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm85897893eec.20.2026.11.17.07.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:38:54 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH] ALSA: core: Validate card indices in lookup helpers
Date: Tue, 17 Nov 2026 15:38:32 +0000
Message-ID: <20261117153832.2766-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87se0zxzyt.wl-tiwai@suse.de>
References: <87se0zxzyt.wl-tiwai@suse.de>
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

Hi Takashi,

Thanks for the suggestion. I've updated the patch to use WARN_ON() 
and included the safe return values.

I'll send the updated v2 patch shortly.

Best regards,
Sreeraj
