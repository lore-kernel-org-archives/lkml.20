Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054BC41E6C9
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 09:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791107165; cv=none; b=MNoL3Z2ZRJuRBr8YNs99HLESIjZwW0rnFS11tReL48FGAcGQYsyPki2zBS83tPTXfcoUISuu4CRXZJLlAU/YyZA51QxEhuVbfnHOmGnc49sBJjQsHc8L5+SDTNeXmyx9jMVuo4DlpDT88IiEiR86WtCbGTpwKx4UlqZs0PBbAgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791107165; c=relaxed/simple;
	bh=u+vYm56YwNMck27Per+ZsEAji+EkicSsZhqAv5T9Xcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OeiXMseFjas5quVCDPNBGW0pdI7cfFKojEIklV4+0u4C4WrcuKKaxre/pPR0Kjg6/5HbrDJb5yW6OcOhnAIMOR6IzcwHb28JIe3HgWPPaxziTbxLqvuZoB+03xYtKqzKWvBC1+MGZD7U5n+ATRbwLnlM2+5yFsu1+xZd7pKeZzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=G8ke1yEF; arc=none smtp.client-ip=209.85.216.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="G8ke1yEF"
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3a0aaa0fd13so281539a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 02:45:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791107154; x=1791711954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PyyofAU4SJtVBmzx571gZStp+YRjOTEqsRVPq36CL2U=;
        b=JL6qd6r+pLcF1NicF2uhJR2g1jmIyJZduf1Oa5QUKysOZ6htV8GST9mD2uF/j6WWMV
         Ksexckq2+Y0M0OGSvyzQVYX0+SViqJ/T1ka+5u+T6CA5HvDC1gB3RGS6whXukxmYnAMR
         cDZChbEvY/Y2boiV9i7xG3c/EbMDI2taX2IiLpMtum00Gk5grFAtC/NeIhc82lLUPFC1
         jj0Q0SKVqWwbPR5xXXRo1/MFp68kUYHydTyWJp3ktbwAdpGWNT1yr/oOqqExW8NLfwXf
         pb7USLlioXEuXNpLx+ovLIUo2vbqMLn0UZgtkhSqKoFWA/5aJ13NIG1sj04b7b4PfMEB
         0C0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxzpcISjWIORYOrM8U6l5hxlqGyGvnbVqe/nBMWGHkz0X1nMd87CAF3q8+z6ZGhRxu46MEmERDbmAHaCww=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLK50wqSxUYv7JLqWwfqqVcjn8HEZf/UaRWFNkpCLm+MZ5Cyn0
	VfcsifzTBuL4Ebgz0/Nn8hPA4tpdOVhPHt1/MhN2NHeK1s8upiuURDXqqwxAcHDoj/aTjjV5apT
	2UB7g2GyF5a7H6XUAilE7gCgO9yJTk4WoJUhkUbFdT/Kvy/APkRou6BjlHLEjkaeWjLiWsziAeH
	Td+aML5A6WhiGwoMb+F/pFd4cwASUBczppHZxmMNuW7bx8m5XRE5wpm23h1u35UPxsZBUpbTvKk
	GGV5c53sKBGsxPH+Erp75zMSA==
X-Gm-Gg: AYBFou0N/to4jtnioQ6TTwr/1ILegHu8hAJAwS16goKjsPlT1o8dIwVE29APXr+6m19
	V+D7M7MMuoTUTcMalx+3WYIfA3Fx/jaqNg7OE1YqqiTD+qJs6okU1Ote2z+C+eUpzwxmGZ1Uh5I
	r9VnpV0WtKtiYtGxBNHewR0+DqUZIWlSSdF8jNPLGagdQik212WYp4oiizTMKfKLRfcDoAP5C/D
	cDJPedRhgUrDI/GyWFUBSqvt+lnaE3GMH1ls//u+F9zeyswpLiU/q2h7vbV/KviIjD7nmfpDpbm
	q0XHkQ3ZDrRITHALldUfqcraL4tl1nL/sq70LdnpkWV2Jiq33alM/TotBLkBhlFhqEKGt9v7WKI
	QFSC10sZj/Wt/82Q/9kmYcZ8bJgVMLKDPuPYgsFuspNkZKutIEY/riRtKBqG9IDb4PHfZd9bmhm
	gE4eV1FujqD2PeSeI8Vb04JKjj/7zFG9boENpfeIvjwQ==
X-Received: by 2002:a17:90b:3c44:b0:39e:6c6a:6577 with SMTP id 98e67ed59e1d1-3a6ced75f41mr5918361a91.58.1791107154251;
        Sun, 04 Oct 2026 02:45:54 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3a78f189ebcsm784555a91.2.2026.10.04.02.45.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2026 02:45:54 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so1648232eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 02:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791107151; x=1791711951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PyyofAU4SJtVBmzx571gZStp+YRjOTEqsRVPq36CL2U=;
        b=G8ke1yEFREXyWRwnfYmsdve3/1ZWIWZOYELE6RkNsNtdEDdawXK4oZIq8bLkzrjon/
         JC45idp792Hs4yj0TXJH+Fnqg+KlxntFc0gusOkqN6Dbs3TXx+TSUUoQsk9lWbOSeS2Y
         qAmiByC5Xgz4Xur60bKf93OqlAi/QT1yXl5wo=
X-Forwarded-Encrypted: i=1; AKwUvBySzNQ9KFt5e45LpgByNAViFn+5SykRgGVEGxcmbiBvvu/aC34RXtjQfvX4IxfOC/75r0yn/ljfN/STRlk=@vger.kernel.org
X-Received: by 2002:a05:7300:80c4:b0:328:3542:b73e with SMTP id 5a478bee46e88-34f150c28eamr12941725eec.15.1791107150903;
        Sun, 04 Oct 2026 02:45:50 -0700 (PDT)
X-Received: by 2002:a05:7300:80c4:b0:328:3542:b73e with SMTP id 5a478bee46e88-34f150c28eamr12941692eec.15.1791107150271;
        Sun, 04 Oct 2026 02:45:50 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351272d5103sm3595747eec.27.2026.10.04.02.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 02:45:49 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Pengpeng Hou <hppiscas@163.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH v2] wifi: brcmfmac: bound NVRAM comment parsing
Date: Sun,  4 Oct 2026 02:45:45 -0700
Message-ID: <20261004094545.1324258-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260920034414.16948-1-hppiscas@163.com>
References: <20260920034414.16948-1-hppiscas@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Sun, 20 Sep 2026 11:44:14 +0800, Pengpeng Hou wrote:
> The NVRAM comment handler searches for a newline with strchr() even
> though its input is a firmware buffer with an explicit length. A comment
> at the end of an unterminated buffer can make the search read past that
> input.
> 
> Keep the input extent in the parser and use bounded searches for newline
> and NUL. Preserve the full input length: the capped size used to
> allocate the output is not a bound on the input, which may contain more
> than 64KiB of comments. Leave the outer parsing limit unchanged.
> 
> The issue was found by our static-analysis tool.
> 
> Fixes: 3e99b08ab53c ("brcmfmac: enhance nvram processing")
> Cc: stable@vger.kernel.org
> Assisted-by: gpt 5

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Pengpeng Hou <hppiscas@163.com>
> ---
>  .../broadcom/brcm80211/brcmfmac/firmware.c         |   13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
