Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D3E509F07
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 23:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790377944; cv=none; b=cc6lKNKaGB5i1C/bmb2VvdO8XPLaNiuFKikIqWs8gAQKLYF2KIrOMCxMR8zxDTaSj9n4L2GoatAtSJJIEkr8ZIhQTiWxXJI/VIRUMbhZ5sCn2+g2ofeY2rClzdFhM6pupwRIjsB3MjcivUoR5qbTx+4+Un4WxGo3kx2pl83LwkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790377944; c=relaxed/simple;
	bh=RQRQoR0pSyLYnvN7I6DP5/4/EnCOa5B6Ns3TUwsV2hg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rd7oko5oNepvXEmlKvXwUSHHyA7FaEutvuV4rzWZEBoyeS71isPp07E8syyMMfu4CTX+ISvQGIDl0XTnq0cMsJgzBbw/jEfC9wRXiEe88cyVLpet9X9NvrSPQFN3LFDMaACJ9HOLTXa8Z7RcSnDharqQeWjTOhvnzRKc8ZB6g2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UX1xiAq+; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UX1xiAq+"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b79784a6edso1276029e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790377941; x=1790982741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z7paBK+MgfgpKNh9WkCQ2hkQ07FwTdlvuAPDciphvtw=;
        b=UX1xiAq+z2hZ3LMTD1sg0IU8AX+bHTJF9M9WS9UbbktQfeCkRx3210Rr1/t+BgUl4m
         WxnPDYyaXe6eSBKESdTOHmweuPsL4U9W/SqdRDyBwTZEDAWsWyv1YNEkhN4PB7ZosUiI
         wPVAMDioRpqrZ2ja/B5am+rBNWIBF8MgBJOa2sH55mWi4dd7i9Dv/MHruDWguubC6LzS
         2FIz1NXGPvv5RfSbymw/bs+soGUDGN0+3a9z9SP0kIbTFcJeo/QQvBSdDb+COyiSP4nc
         2VOlEViBBYFTgCwDDfaXSgkW1wVCPsYQ3iD6KhajSLfsObAUaBYabgTEVUgJF+CDec27
         xEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790377941; x=1790982741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z7paBK+MgfgpKNh9WkCQ2hkQ07FwTdlvuAPDciphvtw=;
        b=CvLTOvHetRZactJG/GfsFe6XqMfEs36OhKZUyOOQfGK1Av/nwfNQ/rT/gubq1VDHbJ
         6/k7V0BOvkJYvXJai222AXKSVdF1Ze2pdvtAfWx+s3WTWvtHoHaIbMuOVoCWKsGymwoo
         0IgJ1AdOLtXYXuM6x5wAl2Co3dWzocJGfSulFBk5eaE2csCaWZEciq11B4bPUgEWmk6J
         eV++tpTPDdcGKfsr9MjKsRtnqKIYH+c0UKFIa/zVLw6fd8Vh4vhjVQ9BfU0w7BFFeHN5
         0Y4z+qG8KcBXHbMwhiw5MfsL3faPPP1/2SXw2x1q6QcJ3vHKUggl8dImHm9/WsnAj/2U
         SENQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjNC8LJJmj9DOBpCzMIybmz2kQv0Z54njrh0S5FTtCyE83ojLdpHilJrjG5Vb7aK5eDae6z80i0zD5NLw=@vger.kernel.org
X-Gm-Message-State: AFuF++n4Po7RxvYsVjWmTbTSiPQNAOMWGfxVUYlE1aC7GiF0DxQBH8X0
	B2DJgYBCMZB8WEuRogROWO7cl5ML0BKLcUxi1fx4opDUFT60Y9ezx1SE
X-Gm-Gg: AYBFou1Bg8vg/IaupwyK1iLssadT2aFppus+HvsUh2eS7tanjZ8duIOYw6z/EwKNUWP
	eycALXtlornKy5RNB3iU3Je1Xrz+chvg9ePnu4CqM8QaOOMV3g+WZV5Zdi6lYMGb3aoamTzFTuO
	XXZkYlpnpKJfpKgA+d/UiEkEnjj1+ggTjjsCxGFwyV1u+wj29SCAdmGcUJmcJhkfawIv9AkXQyr
	l3uEGgkbV0t5l4UzNKCuzyW0PmBx2b72cqoZvA65lVzD8SZBZE2mu94AIajdARWWCNpEwgkTxH6
	fTW/UAhAYtaF1K99eRBf4PBES4Rrcpf/xDdh8L9fjLVBdszImj7VGACilU1iGxfK3Ycs5y8Sj87
	nZFfK1FFIuOs/FfD/nYZjPRGjMR8aKBUQh0ddeX99vkuohQaSueBSryfMywVR7ZRGDQM7qFuhxC
	x161PobwgXV2Q444Tk5nMn4uS26NXaetWOZUpgB63Q6hWHd6WM3hPMmzv9dgvDnhXNUDAiHvXce
	wL/wRVX3d8zhUCQSzlBPgY5xlQacfQFBBHSBuBFXQ==
X-Received: by 2002:a05:6512:3c89:b0:5b5:e0dd:1c6c with SMTP id 2adb3069b0e04-5b8df06a153mr2754665e87.4.1790377940946;
        Fri, 25 Sep 2026 16:12:20 -0700 (PDT)
Received: from dau-home-pc.. ([94.28.220.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8e6afb29bsm894605e87.44.2026.09.25.16.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 16:12:20 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: netdev@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4 04/10] ip_tunnel: add __iptunnel_pull_header_reason()
Date: Sat, 26 Sep 2026 02:12:15 +0300
Message-ID: <20260925231216.542209-1-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260923154114.GA2880695@shredder>
References: <20260922221507.3268127-1-littlesmilingcloud@gmail.com> <20260922221507.3268127-5-littlesmilingcloud@gmail.com> <20260923154114.GA2880695@shredder>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Sep 23, 2026 at 06:41:14PM +0300, Ido Schimmel wrote:
> Either append patches to this series or as a follow-up, after this
> series the only caller of __iptunnel_pull_header() other than
> iptunnel_pull_header() is the VXLAN driver and it should be converted to
> report the actual drop reason instead of NOMEM:

...

> Then remove __iptunnel_pull_header():

...

> +static inline bool iptunnel_pull_header(struct sk_buff *skb, int hdr_len,
> +					__be16 inner_proto, bool xnet)

...

Thanks, I will add both changes to v5.

One question before I send it: is there a reason to prefer bool here?
All the callers only test the result for failure, so bool works for
them, but coding-style.rst (section 16) says that a function whose name
is an action should return an error-code integer. I can keep the int
return, as it is in net-next now, or go with bool as in your diff,
whichever you prefer.

