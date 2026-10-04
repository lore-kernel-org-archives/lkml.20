Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BCE423794
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 12:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791116948; cv=none; b=hsQH7q2at3Tayr+vnhSH938UP9wO15c1B2yfpFWYMd8PD6zYieRk9T5tI3V7D/7Q8/P9a9zbuIkZdqK8Us+5NBX3/HWJIDtFec3P/5jmhgo5J9qj9wKfueq8Fd38o1KzIhv0Hh2jAQM+wEkM9EvS7byEx/cyUfRBY3bG0f/L7EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791116948; c=relaxed/simple;
	bh=O8AOb5QLaO7btcj37/Ldlt4sf7K5LubilbX/lofAehA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RBA2MkJ9m+L66AEk6EDg8pfpMva7KbXmqA2xjHx8krp7NySfkepzjAfjK53EFUZ8RAwWzMrNVbBKzgZ2ewP4+TYhf+vgMN04O2R3H3eERhK4f4aGHC52LV4XtYnGGGz2AnQV581OEmGtEG3X5LGiQo93ScwKio933mBfbxC/HKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Hyz+wLh/; arc=none smtp.client-ip=209.85.215.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Hyz+wLh/"
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cc4d192643dso19614a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 05:29:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791116947; x=1791721747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lFxRZe/WwmbBPaTtaFu4NCRozMGI6L0mmZzZk89wk58=;
        b=pCXlYQ0U3xT/JwqOKA3LNPyfF/hXYUMd4fHssucaZEP86gueL/pkHM7EsJPSCvk5Gi
         Xv2IVAGVusHT820LEwkVIa3+sa3htpTqGLNpzNPlO262xOrFNSG3hf6hlAIHvaThrM7B
         spGHzubFruJKfVAYtgaZunIZ+jV70A4eSplcYIKpQ049LLhpLzSRp6PpYUwouHlEATiU
         Y5PSCplNm5Doy6/EEIUicj/PXp1hWjyDq7gRBoozzgQp16l9Ghmlin9ks4JZ+N8o35/M
         6BmVQqZpzJ2QWqB5RaTykHrAuPifUxyUTEjsvZwLau9o6JVLXA0evgYxZ59Spq4XcXfq
         JDIA==
X-Forwarded-Encrypted: i=1; AKwUvByqXOKK7LuXB10MXfvN0aMPvDlgctgJ5MrWnAe/X+7X2JTfgKyTzvDD6gO4lyUC+cLYBIC6KDOcQMSAEx4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBYU07KnnIty396VoIxQVy9ty9HD62PCEhfwXgAf2CMO84nyrq
	zNJZOhy4aoFThuXBFSRC85JCzytCgAMfF5AO2UOg+Kalr1puqGZ3ZiiB4AVheijc7hx5qximW0F
	Z6QV+PU34n17ZjktR5kfCOX9TE+8ubLynb46siamRUsMKThqFtbBQrgeyrao905n0U5MLCfKmHw
	Yrw6CRvmhZ29Mpq4rIxnddpLX6sfAY5Ysx9//duyInw4PeAhEEpx40QV9PuCoQJ5eySP643sXgy
	pd1irzP54kKHw5CulCob25wDw==
X-Gm-Gg: AYBFou2rfJZEBqZ0mHyAZrMA9rjn43KA3ct59FKQuNUMV7A2Put/mbwA0kQt07jAxtM
	somKM2injYyJgyMc2PhsalSXyDuIk3wMruBsaX7DPUBGnFHhP7syiW4ynyIOltuhMg6qjwgKJhD
	S4nDvidlCJpn3QVWWP9yH9KrK1nhBRQcOp3Ht0JpzppnIcHzmmryiqFigfOx0+M/VtLxQTzqhKQ
	Nl/p0/2BzcWWLtwAOeixC2FcwU0mV4MPGQMnKDPg7Rk6sZEYd2IiRbYuVfSx12VO8s761gOS7od
	pTpiBa4ldbKJq2OVt79S1OeGodGCOZ1Ibs/IsYHP89ej8U3xCxcaEUYGuElT9YxRXWi6KitTKlS
	OqQnLx9+Ce2Qtvk7VkX3MQhggj6ib1vrQ/ZuvTOnUbjB7VlHql4Ip9/EH2TUU0mDGFgsfEhd5CC
	B2W2OmyPZuuXBt9++Md9DuTPHBC6tkBA0LgRdjgyE=
X-Received: by 2002:a17:90b:3e48:b0:3a6:fec5:c186 with SMTP id 98e67ed59e1d1-3a6fec5d1d7mr2720626a91.46.1791116946754;
        Sun, 04 Oct 2026 05:29:06 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3a78d4e07ddsm2671057a91.2.2026.10.04.05.29.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2026 05:29:06 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33baaba6371so1740922eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 05:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791116943; x=1791721743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lFxRZe/WwmbBPaTtaFu4NCRozMGI6L0mmZzZk89wk58=;
        b=Hyz+wLh/dgn+oLNNy6ZaXKb+tjPHRPgtipVIDc6CkBbnMogVjZGBBug5TBqq9MtCob
         JQN70NzFAwHH6D1dGZY80VWyvY/ahQ/AQZTsPXLHJ/j/GahVfBwCH23mvMw1XKUyuYUb
         JNjmbG1HDJfrdfgFP+WgyXajLPn82mimBIiQc=
X-Forwarded-Encrypted: i=1; AKwUvBz8SFfZK5Ig510pH5UVtm9JibUgQ4rdulDC2NsTMK2j2LqxaTg1iFHABXXA3SEE/bUH9tlu3VH6ptbIuhM=@vger.kernel.org
X-Received: by 2002:a05:7300:d518:b0:34b:dbbc:a72 with SMTP id 5a478bee46e88-34f2185446fmr13565329eec.24.1791116943590;
        Sun, 04 Oct 2026 05:29:03 -0700 (PDT)
X-Received: by 2002:a05:7300:d518:b0:34b:dbbc:a72 with SMTP id 5a478bee46e88-34f2185446fmr13565295eec.24.1791116943044;
        Sun, 04 Oct 2026 05:29:03 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3512713861fsm4656855eec.10.2026.10.04.05.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 05:29:02 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Michele Dionisio <michele.dionisio@gmail.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Hante Meuleman <meuleman@broadcom.com>,
	Fan Wu <fanwu01@zju.edu.cn>,
	Kalle Valo <kvalo@kernel.org>,
	Pieter-Paul Giesberts <pieterpg@broadcom.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH wireless 1/1] wifi: brcmfmac: fix P2P device removal race in brcmf_detach()
Date: Sun,  4 Oct 2026 05:28:57 -0700
Message-ID: <20261004122857.1391917-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260924123027.4122909-2-michele.dionisio@gmail.com>
References: <20260924123027.4122909-1-michele.dionisio@gmail.com> <20260924123027.4122909-2-michele.dionisio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/24/2026 2:30 PM, Michele Dionisio wrote:
> When the driver is removed while the user space process that created
> the P2P device (e.g. wpa_supplicant) is still exiting, the P2P device
> interface is removed twice and the kernel crashes.

[...]

> For the interface without a netdev (the P2P device), take RTNL and the
> wiphy mutex in brcmf_detach() before reading iflist, and remove it with
> locked=true. If brcmf_p2p_del_vif() runs first, brcmf_detach() finds the
> slot empty. If brcmf_detach() runs first, nl80211 does not find the wdev
> any more. The interfaces with a netdev are removed as before, because
> brcmf_del_if() takes RTNL on its own for the primary interface.
> 
> Fixes: 9831bcb987df ("brcmfmac: Deleting of p2p device is leaking memory.")
> Cc: stable@vger.kernel.org
> Assisted-by: claude-opus-5-5

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Michele Dionisio <michele.dionisio@gmail.com>
