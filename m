Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776583;
	b=JBnM8sJxHjcczE4fIhJfeAnKYgMa4eBEP1fikEhCs+3oaYaAFBKyY9ZQHCm9bQSJjNNB
	 uj1FXx5lOf6wecjQacTeiyePgHH/IIGoI34sXNyhr/PQAmi66RfHt092rXKaE8jGLbF4A
	 sykIB4H9i1FYm4IE3BbI1W/ixpf5mju5c+h1KW3lGNA4ou3o1KlBRwoIaC5QAZj6Af7Px
	 za8q+e54rH65n3rDeSOexKJD9WIjduw/Nh2yqk4d1jZE0mBS+31X69++y5I8BfAcOOP5c
	 inBy0cZXXqcmXStz4gEQLln3/QoJD9lodJ1sdC/rMTLsaEEk0EDRjcJV/xkbv4V9QCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776583;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=6760X4jvEOJT1XPwXaJIlWsWrt6imq5K3Nwu10HduZc=;
	b=SX0MkyIcqBQwJxH/LGwbbaG8+CB8qbmHH0Iy1bmnSJGHN2Idal/v7uB/ct4FxJy5vyoj
	 aZ40jvzpvmHyQ7Nbi9G3jVEQt/JOBNFYYGPk2+PQ2WLyWzTDhP/wl/3NPRbt9ooEo7m8i
	 fl4dju9F7dMuLPVAjTPIao2vxjz45wEaXtoIREElD6iIldfmNTeycEsO0hYN4F28rctQO
	 R6MfEDWLCvn/J8vMH0UBRlg5Mc+/vrzh+NwqSS9Oq9pdIH+p2Dqq+JasesliAUZ0U7/9g
	 ZUrPSHoUkdLuRX3hgF4GnSDylHwML08+Hf6x4mnQd9bcPueaBfvJ7kE6x9inkCglnmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KKrjWF2A;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AE3606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:03:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92AE3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KKrjWF2A
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso887432a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:03:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776583; x=1795381383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6760X4jvEOJT1XPwXaJIlWsWrt6imq5K3Nwu10HduZc=;
        b=PLESkmXNX3SFVo9Tn7SpwNqFlVei6rrmCd5OU3PD0hd3dupQIvwvut+Pp33P4oM2us
         FZfu0oEWsMuF4FUzrzQZcc4+wsbX0tNxFWXirP4tus8PJX0yd4YjjO/+Q8WMd1AmpI6o
         0Otqb26K0jtD+y7QE9qLmnXC5YWVbROrS5NGSNuO1DjPu02srlV8omd/AnPbziOGBFEE
         eMr6E6VBgjQwUSO39KkqPRiuSSSsvhK94t10SmvF3JvwTCIMQnEAoG1CWg9IvvBNbPox
         MQhWr1Oo/bBydLn30y4ZzPThYHNHxLvT8s8S/SFiY0Ru7jce93plN1gTQjqhCaywKvhI
         btMQ==
X-Forwarded-Encrypted: i=1; AL+hErH21q/99pkHKrzX2mBROKTDiBOBmCc5E7hRDmPak4bEioqRaXnszQOdd5ZxW6Fzayu1gdRz4rslvKlnBXU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/c7GdgBIs/OUckTPW4k+VGq3uYS8lEFHZR2UgkRnsOi5NvfIJM
	ETKUPrbgkMPjvoQ9Yb0UABWHxcZbfaFkCSgR+FpbKamsenKQN/0njRSPJAMJk6qszdz0NqVsVWQ
	fuTn4XacrKYl0Sb0MzDRu8rywmaF01fq5GTiv4m8KfdFvzq4NmXPwwClf3BrFeuZXmcOc1xvhgW
	qXQB5birNE7QJQFoFUy3mXIcBA3XmhB6KrMg2pcxASoo/xGDHoivH5CHbTobEbBbFl10DFqjXWK
	25ysPSl8p3MqFOShTQlNdI=
X-Gm-Gg: AYBFou2oXsCzF/uucP/PmTS7GC4eIQAqejk5tY9FAfwbx0mTWBnbSWHHxMi/EPZOtly
	UBYyOmg3LaA/ObZ9oO0ItesGX2Ig7kAB3WfViKS28gbpI7K0Cx4qil2TDbcIok2GoUte4iqLY8w
	N1zmnyuE8NRtiKaz7ACSbZcJGriTYMjiEkXFkArVZNiUASNzpvEVctAkPPYVelbnKTGL1gDwJ8H
	KGiJZEHo/bYwSyL2FoBPBBYhmr878gwPTDc/fZGWXVsDfyQuCQcsbfmGq+vy+oWWVF3KpvvG5f9
	flm6iKtzcAK+7RQNH3bjJP0G7zG9CBONH8h7OutrOV+KNY04HWA9UpQUd0GaRX3hr5j1pJRHMdS
	k2iMDFQ6R7GBKhdzl0n5ZrSVfKxvO9tQEyrL4CHpRoA8HRPLGosw9hqxnvOp8hQqo7rX4zSTXFn
	zBvsOLzy41vF2tiYU74fiZym3QTspYHIWX8NVScTA=
X-Received: by 2002:a17:90b:3ec4:b0:3a0:4668:4cb0 with SMTP id 98e67ed59e1d1-3b1b0b83494mr9041013a91.47.1794776582833;
        Sun, 15 Nov 2026 13:03:02 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b3a71eb9sm5140880a91.4.2026.11.15.13.03.01
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:03:02 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f479b9819so1055109eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794776580; x=1795381380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6760X4jvEOJT1XPwXaJIlWsWrt6imq5K3Nwu10HduZc=;
        b=KKrjWF2A04lrxn7xAKqhjLzR2KZ/V2enCpylT6NCBIwWSGDtgsKIpyBjCCUEwnoXBV
         99juzg1IoRIxZ07EsAkdjy82kBO+0y9NNMsYINfSsi6Igl1Gc62xZx4adjC+TAxGkS14
         uVN6PI9+xyVvTtsmj85I+HcB5hh01+pbQTiRI=
X-Forwarded-Encrypted: i=1; AL+hErFx1ktL5/u26PjyYxJo/s17v12oICs3SDs7Gi+1AJZuWm/CIw9Nm8Z3xo7YfZaMJqITlbTZlFcY71YBEUg=@vger.kernel.org
X-Received: by 2002:a05:7300:8818:b0:36c:a390:8907 with SMTP id 5a478bee46e88-3796750684emr9649109eec.21.1794776579904;
        Sun, 15 Nov 2026 13:02:59 -0800 (PST)
X-Received: by 2002:a05:7300:8818:b0:36c:a390:8907 with SMTP id 5a478bee46e88-3796750684emr9649084eec.21.1794776579210;
        Sun, 15 Nov 2026 13:02:59 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d3e37sm31068797eec.24.2026.11.15.13.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:02:58 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Shirong Zhao <shxzhaosr@163.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] wifi: brcmfmac: drop glom superframe on header parse failure
Date: Sun, 15 Nov 2026 22:02:49 +0100
Message-ID: <20261115210253.883721-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261009072232.18-1-shxzhaosr@163.com>
References: <20261009072232.18-1-shxzhaosr@163.com>
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

On Fri, 9 Oct 2026 15:22:32 +0800, Shirong Zhao <shxzhaosr@163.com> wrote:
> brcmf_sdio_rxglom() uses rd_new.len_nxtfrm and rd_new.dat_offset
> right after the superframe brcmf_sdio_hdparse() without checking
> errcode.  On parse failure those fields are either uninitialized
> (the early -ENODATA/-EIO/-EPROTO returns) or hold a rejected value
> (the -ENXIO bad-offset return), so bus->cur_read.len gets garbage
> and skb_pull() runs with a garbage length.
>
> Check errcode first and drop the superframe with the same cleanup
> used for a bad subframe below.
>
> Verified against wireless.git main (fd4e7f1137291), the current
> wireless fixes tree.
>
> Signed-off-by: Shirong Zhao <shxzhaosr@163.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Nit: as this is a fix, please consider adding a Fixes tag, which looks to be
9d7d6f95bda1 ("brcmfmac: streamline header parse code of sdio glom read"),
and Cc: stable if you want it in the wireless tree.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
