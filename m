Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC6743F09F
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 12:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791116934; cv=none; b=Rv9SwZKNGZ3SYYaLofYv6GNP3du0onAlPviU6NbVm+LPvtsKJjFLn3ZiCF+lB+94hSmQl0vZ9zE16IKmvzVtqr6GL2RIOxcit/+R9uwo/MRSx5wXIYbkcLpZhEeOC4QvSNpSg8zrBeJ39amh0JPwdiRDIXjHUHoI8PJ8QCFMu0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791116934; c=relaxed/simple;
	bh=uqTDGLpLDiZjJGXJ7cXBmigd1ujQhtoqRZW9qtkfopQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JKQ6RMyxfhwc//GOwBUAZgLxIlNBiqJGq1qHhAHeIkNsIb46eUEOerjtBuySK03DRjRabRc15GqeJgYK3ca3G33rl28VLLvkkO3vVZKk2E1gRrb8af2bH9S4Y07QEIq4WghZ0PjRWS1PrswQ/F/F1fm5rRDZE4Jzu46q3te/0f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=G50Tdfl/; arc=none smtp.client-ip=209.85.216.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="G50Tdfl/"
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so376907a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 05:28:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791116931; x=1791721731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=48VB+6X5YIGbdqE6rZBZu2Xgbztijhzm4Tc1dAueWso=;
        b=iiEsJtE4/JtlUICBYW9us/E4ibW+HU3WC2+vbRBK9qwcDwWIODEe5MvLR3rsZZMuRP
         TDWfxo+2JVJ5cF7fT+qwe/aZy5QDorMSC7fLhA7CKkW8yK4C78IOTToVaZ3XOF1OfZ4C
         65ShYlj6oK55ccNRH6uumuOMXIwCXfjJeglzhwNbE0qztSUm+jKsaaSchfHgOSfM6a/Q
         L6H8QItux8XqMmiBteaIWDv6S9p88G5W+5ugk7r8Hwz+vZo18y4KS0kgFIQLs0TgCvMi
         QOPwoYEFCsZUs7LbrQY31Cge2U53966+KOjdc33tS9OWZIJdj6LGzPaGRXx5G89dZvg0
         uDJg==
X-Forwarded-Encrypted: i=1; AKwUvBxNAbn9/R0k9gu6WiDp/Cq6BWfuqTJ3kPAgEUI/5kB3LdrMQ4QSVgstgzIwXB43dQJ/4eOzAhNcQM6Dcyg=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2jp5jViB5RlkrZK2d1DGggFtAgNtuvbSKtZm1aoiwsFKBo/8o
	00VKwGYyvKG273tYQuuko5Gkr5+39lYZmoJFOPV1/onIeq7dDjxrO1hOLonwieeqCmqhCqAAEzV
	THUATgvCzq6F8HxG+59eFPd6RAqoT3J9ON7k6zjfiCP9phkAKrrl3C9o7NdlorukVajyBXopPxq
	+tximObC0Np6MZSOh3TtC+8nBvJ4T3nI0Ie7TmjGDqCRqtWMd18Hf00VQWv+ebwUkGaCs0W7/3j
	hAoZEeSTu1EKntIDo+z8zPiVg==
X-Gm-Gg: AYBFou2D4SeRZLcuY6Q4dxbRhXH6Gtp4LkVRHGdFku4IttcYetIwTa11YDF3bM8EB+6
	CeYo0L/FD0LLBvJqlZ2JvrovQjym+xdGPnVT3rltHcu866mdIId+lwuwfxMr+sshJ77VUewBlmO
	s75WQ/zAzVfx+3RbM+EodqDSKvju9c2xVPG4wYnzm1rGLUOsMp0aPt1hoGbDzknglPkTbyd+1z/
	0vIIZvcJ4UzqtjF89r6sMUHECurWgBDQ5yE290gF1e4uNBSU6WBDziIUZofQPIkwA3v1n2aiuZh
	gJtMKeJbFCKSP+YiOw88w8der/FCwsq4jWFLBNo5CQ7YlJjyKVJJy+AGf8I8e3bpCse47uiyO1l
	hcyQ5xcxQrOJvItZH0E8dnnj6XokDLn0EG1N50iJMF5sylR9fqHhlFdONNKMpXviw6r/NOlSNu4
	AWMGDZIyvCClJIV7H6Cr1f75Ye90u/32M1GV8B/+U=
X-Received: by 2002:a17:90b:53cb:b0:3a4:9a7a:360 with SMTP id 98e67ed59e1d1-3a7872b2565mr3433786a91.29.1791116931400;
        Sun, 04 Oct 2026 05:28:51 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3a78d67781esm2692516a91.8.2026.10.04.05.28.50
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2026 05:28:51 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1438719cc1eso1334228c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 05:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791116929; x=1791721729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=48VB+6X5YIGbdqE6rZBZu2Xgbztijhzm4Tc1dAueWso=;
        b=G50Tdfl/cyBmVad2dM+1fn73upmaxMVee6uJzWuoqe6oWMunv3UkOh1rjwtZ7sDBE2
         TjRYLdHMj6p1MpehPFzmLb8CTuXnVvC1EfZR4iQZCBfuwR4oW1VfgwYY+lJ1mti81iKo
         GT+4oDaXncmAZSQI9F4u56pwaf3BIs7+MRL2U=
X-Forwarded-Encrypted: i=1; AKwUvBzG571cU83P7FLPIwC/1cJjZH2wne9J42BBDuuaV8r0zb8T+KmXTVj0ysCVwC+MjzAtX2UQduKRMWKhlKw=@vger.kernel.org
X-Received: by 2002:a05:701b:2051:20b0:147:9ad0:cf25 with SMTP id a92af1059eb24-151c435c1eemr6422033c88.46.1791116929403;
        Sun, 04 Oct 2026 05:28:49 -0700 (PDT)
X-Received: by 2002:a05:701b:2051:20b0:147:9ad0:cf25 with SMTP id a92af1059eb24-151c435c1eemr6422002c88.46.1791116928821;
        Sun, 04 Oct 2026 05:28:48 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fc39a7d1sm12234015c88.3.2026.10.04.05.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 05:28:48 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Benjamin Drung <benjamin.drung@canonical.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH 2/2] wifi: brcmfmac: Add clm_blob firmware for brcmfmac43456-sdio
Date: Sun,  4 Oct 2026 05:28:41 -0700
Message-ID: <20261004122841.1391116-2-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260923203739.2560527-3-benjamin.drung@canonical.com>
References: <20260923203739.2560527-1-benjamin.drung@canonical.com> <20260923203739.2560527-3-benjamin.drung@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/23/2026 10:37 PM, Benjamin Drung wrote:
> On Ubuntu 26.10 these firmware file are missing inside the initrd when
> including the brcmfmac kernel module:
> 
> ```
> /usr/lib/firmware/brcm/brcmfmac43436-sdio.clm_blob.zst
> /usr/lib/firmware/brcm/brcmfmac43456-sdio.clm_blob.zst
> ```
> 
> So include the clm_blob firmware file for brcmfmac43456-sdio similar to
> the other firmware files.
> 
> Bug-Ubuntu: https://launchpad.net/bugs/2168109
> Signed-off-by: Benjamin Drung <benjamin.drung@canonical.com>
> Reviewed-by: Matthias Brugger <mbrugger@suse.com>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
