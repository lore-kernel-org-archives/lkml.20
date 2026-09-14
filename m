Received: from mail-ua1-f98.google.com (mail-ua1-f98.google.com [209.85.222.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B9F389107
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789416224; cv=none; b=aSRGGMduv5cns4QhoYg67ptVqjoTZ6wkzyVp/WSiSuWQip86tAnmf8gPc/eJIWFYAtdpVW06o491qEQoBX2mhJERCFS+eaHcHqOYKp2V904y+LM/gnKvDl3+3RDrQj8muobh4oKWndI37coehy7ejHu13tcI1VPY1kfh1zVN5mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789416224; c=relaxed/simple;
	bh=iGHNNVQOC0D0YNnZ4vMitSMlVZq1IOKF4aTaBo1p2b0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EoVTugzXQQZs9KOJomtZkDu1csM9zChxxnJ5INi3iRcrXxZY7xZdex7lAuTVN5GSXPYxcOeMGPVygteTS1ehD1uGm7w2Uns8Lmi/5/yp8Zx5Qd8T7/+LnJGer1iGg3+X9KnkDAB/HeSg0ia0WCavacZD4EX3kXWA+lYeWqujdKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=NmIshWD7; arc=none smtp.client-ip=209.85.222.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="NmIshWD7"
Received: by mail-ua1-f98.google.com with SMTP id a1e0cc1a2514c-9828b5b20eeso2254995241.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789416222; x=1790021022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P+2cvsudH7ftH8jFsjvcC49I+38SHnXJ8HERpOnIBgE=;
        b=hrbQye6ujEnPKx61V1XM6OkpAs/fzt8EpwleYKDw+cIV0r9Ch2OlLVs8yZUlgvb4Vy
         kM9qBP1kDughc0eXanMP/vY9nDGCz5mYQu5Py1pssdTbubGk50LNZu009Q5zpUR6gC9y
         h1WBPrquThbrTxN+84arhWTzAdR0hCUAERIk6pq/VgONXMtGE4TomOBC7zzaZ/NR7Nut
         8WXaqj2U5GtCswdTv0YHzMXrupJOa/JkElq4nMmUQf7XcuHbNUPRJyTxH08lTNJ+2LAs
         rMv32xYaxMDJao+QN7YRLeNETYAGs/JP09f/qCorsH26W/GQ9E38QbbKb9t/wlnBHENz
         CjtA==
X-Forwarded-Encrypted: i=1; AKwUvBzWQ7tT0irsaYxKY1yHD3dg6jEbZXDXdaMLvih+rfgsnOG25on4BuuPtKdU3eaTFN1FJb6J2BzmxcP+Xqo=@vger.kernel.org
X-Gm-Message-State: AFuF++nD1xDT4rkSJuYRslMv4bjP0Gxdkwh5WBV0Og14sSkyNsMKwaUg
	K+SxT4mrZL5cpkzkeghnLzJ2uzIQHdE3lmTUbxK9JvDAwCcAUrsrw4vLUW06GRtDsRm1WBjRoZh
	cwnT1qeihsrIVKPsVECI/V4OK74s8jqUhizjzi+ZdfgzIfX0J8Ug56N8ttf9F6XToQ5pmRubrgf
	3lDi5fFWDQzfeoLkZJc0ak3X4nf2PvwreC8r/Vy3/4MAzNC72Xj3v5vllyA6xM+gl7KTeOQCWCt
	/1OGjCUPVEqG2S/bWyqZb8K+g==
X-Gm-Gg: AYBFou0JKcaTBTqynmhsiEGhBYXgJG9+EasIiP7+kuRORyZLPgM409PEKMP5I1Mc9nn
	oyLpIzrJj5M3XKBKP8lyEpHdmmpioDYIw+hfLXEkI8mLFbWsW+PkXZcE5dhlI1OQ4UtkxiN/pGh
	g8Av1ieMfomgHs1rK8iAMt9bV8N+T5bTVUCgxYTIioUx+nI/IjVCs4dd/ucmQ49yt0iT6EKIMLM
	s0KVWwSJDWk5HWvuufZK81OgusecQoUa7b7wVdPcW42sUT1hspIjAFkEtBXtGbui/sVaH7u9L6b
	TZd8VKx0cOXwxtJTeQJp+ntAbxtv/AxZdwvvKeMSiut/r9fi9b5ucIEBF99pk8TDrIx+z0vR0fh
	DxBM7QJnbrPOLNCPwPjDzL6ofA5D5sFuB3NMwKyGcNT53TJPr/+sLFelaryIRBI4AoawnHh0Yg2
	0lAPz0VaiwU58yfz0BZDbo1i1u1JIsoHG+iBzGZZM=
X-Received: by 2002:a05:6122:21a9:b0:5c2:c0b2:9880 with SMTP id 71dfb90a1353d-5c981adc33fmr5551902e0c.1.1789416221643;
        Mon, 14 Sep 2026 13:03:41 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-9120f21cfbdsm1379156d6.2.2026.09.14.13.03.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2026 13:03:41 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90cddf4f59eso75984696d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789416221; x=1790021021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P+2cvsudH7ftH8jFsjvcC49I+38SHnXJ8HERpOnIBgE=;
        b=NmIshWD7q+L/mPmx/iBb5DNwEM+i1HSjempw8DL9+fg70BlHVPoLUkOS9M9Q4b+a2e
         qHOkbPuj8x9zjqLDyuWus5TSEiKtPeJUsDz3IjCZdpxx+Ay7fND1EqOpR4HAec2Q/seh
         HjLcG3gwMyYKvhy/BST9rqJ6gMH18wy2GQMcE=
X-Forwarded-Encrypted: i=1; AKwUvBw6fT42G0wmmRA51Bu7RxWGFaLEkmWPMgWDd5q8yLCtyRSjU2ewlMe/w0uMy8a/ZmFBteaIn8qCNAmTfG8=@vger.kernel.org
X-Received: by 2002:ad4:4ea8:0:b0:910:4da6:8354 with SMTP id 6a1803df08f44-9122e55cf24mr59329376d6.17.1789416220692;
        Mon, 14 Sep 2026 13:03:40 -0700 (PDT)
X-Received: by 2002:ad4:4ea8:0:b0:910:4da6:8354 with SMTP id 6a1803df08f44-9122e55cf24mr59328966d6.17.1789416220205;
        Mon, 14 Sep 2026 13:03:40 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f477d42sm103209166d6.18.2026.09.14.13.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:03:39 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] wifi: brcmfmac: bound NVRAM comment parsing
Date: Mon, 14 Sep 2026 22:03:36 +0200
Message-ID: <20260914200336.1742565-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260830135328.12321-1-pengpeng@iscas.ac.cn>
References: <20260830135328.12321-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Sun, 30 Aug 2026 21:53:28 +0800, Pengpeng Hou wrote:
> The NVRAM parser tracks a length-bounded firmware blob but its comment
> handler uses unbounded strchr() calls. A comment without a newline or NUL
> inside the remaining blob can make the search read beyond the current
> input.
> 
> Store the bounded input length and use memchr() for comment terminators.

Please add:
Cc: stable@vger.kernel.org

> Fixes: 3e99b08ab53c ("brcmfmac: enhance nvram processing")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

[...]

> @@ -215,6 +220,7 @@ static int brcmf_init_nvram_parser(struct nvram_parser *nvp,
>  		size = BRCMF_FW_MAX_NVRAM_SIZE;
>  	else
>  		size = data_len;
> +	nvp->data_len = size;
>  	/* Add space for properties we may add */
>  	size += strlen(BRCMF_FW_DEFAULT_BOARDREV) + 1;
>  	size += BRCMF_FW_MACADDR_LEN + 1;

size is capped at BRCMF_FW_MAX_NVRAM_SIZE to allocate the output buffer,
as some NVRAM files can be larger than 64KB due to comments. Setting
nvp->data_len to size will prematurely truncate parsing of those files.
This should be:

	nvp->data_len = data_len;

Regards,
Arend
