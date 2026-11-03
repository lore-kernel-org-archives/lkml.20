Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714346;
	b=kDxqXFbR9aB2hZ7jkOmsoIODg6GdjiEOlbVgyj6pzmO5ymx9455MV4qAI4fmksbkg3X4
	 UZ7s9+g1QCWwUVsbmRCT5vxGeQFG1QytOD1EYHVpZN8WyTDvvkgkcmZATanJJcQpcBoVP
	 BBop5iYd3jBeLPVPbcQCAu5ukcT7DnWkup3tQ7jZ4160Yrn7fmoJ1zMCqsaIiVNgfIm8F
	 yefFD6wITrFf0kYKAE6jvx5J6Q2NrcOm1cSRnNsmV9VclucBS3SRdvyQXOdpuAp5tdmD5
	 N6gES5+4nwMH4c9A2uUizcriWn2vuOt0vjMmUuJVcAGhS7iYU2hGYbUcNiuHQlijcFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714346;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=bmndstez1ROjl3SXVUcZnwGvUr5BBU/f9ozJwfuLHnI=;
	b=MeplAmmhFCQ12aJ66LSdykI4XeyrRRYOVrs5vQPvTOMMRRwwYwRror++/vhRD4oxtLOF
	 u0F5bish/eak9MGdecre7KgPcMfAXgCaWbKYxxpyJ6iOB85NPrlFuueHX8aBDEKW0tEUt
	 Ld/T+m7SC/QMMOsDzj0X9VU5B1WokcvthBRipn5GV4a50zrNdABQmOvVoZJC9NIIGHMOq
	 kjp/Ql0MWtcg9NJIqqVG4cZTun39/YVlhzX7D0g2kcsLH20moiQi1K9RrvIs8HltWHNB5
	 C/2bigT4/764w4TZm6W5v4JtzYgHLZlEvExQswHW+fJytAe6d6XVXZLae04eA937kIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Qj5XYort;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70377606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70377606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Qj5XYort
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso2514706a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:59:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714346; x=1794319146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bmndstez1ROjl3SXVUcZnwGvUr5BBU/f9ozJwfuLHnI=;
        b=UyirHflae5aBGGlxrmljICVu7Zp/LfCZ5AOwWkqtD7pQsRRcgM+KI8YvoY644PijVh
         X5xWtp+7xV7BBoQnvYCjO7UBSxZrElstOkLN382WQ3KcJh6WGH5vaiycZVz4t21AEf/V
         dYVxUVCbDLC/ICn57GbxmiZuPqf0h5o4dskLdVoRWowqqNQK7dgskuYvc5IueQPcbfN2
         GV5ayPJZy4JrbzLCGmYTYdyFG7tND8yghOtHT/cR/iDHuYmeAF4GvaaUVkVNNdt/G/Jl
         j2Sp8p778ZudSjk83rWQwpDVmAg1OR5JEzmKM+L74rH2+Vx2g1WnT2SOJYR8lEIRlQBc
         72Sg==
X-Forwarded-Encrypted: i=1; AKwUvBwYWDx8sVaUjUlFtiqfhBmc7zhKPCSli2irksiHVeH+8LKyoPX2e1imrqpKdwpdp1GqJduZ+EnkkG8An+4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UPuVB70xlg3meJjt7Y1WyALAMjt5cK6trx4Cvd9U3B/wUd4Uj
	vBL0cc5lVNzOO3YA9G+xPylMyHRLlD46YoR2RQnLDZcJW3uUjo4a0f3hu6eSfQdWkFkpdf9WXEK
	IDAmVfOj2Ynbg+U+kgmhDjJvVRJIajKyjY69gdS1ZLbmTeeEiJ9MtQwIpiG+agOi3FuNrMkE+qB
	SC+D4nR50UT/J3UiodPNQx/TvOvAotrt8PAtalwhoCwb8zwDSzi7+g8boECkqkJcvMtbqEj6XMK
	nmxelrA34TI8qBd/fWpvNA=
X-Gm-Gg: AYBFou3cgVTevijBlBZzDMk+eB8kxLTDIWlfSjxwGdTyntq4m96met0g0+Hg54J1frG
	zPdGH29rNVthY8/cvKZXblzkRY+JrtFN1BsGsdhZfvnH9A1UdA8IrwaKzEMEywZHQ1gGUZ/lSVH
	8q3Qhqx2XfOCYg8AQxfhbQj2Hd9TgVaRQ9jiG+C/XZgE+Rc7/kdZl2finvUOWCPTWmRpxirOv7H
	jhBwj/ky7zKi5aBZEvNUH2PMcYwVq1/AQuiVEqmUaCFNoxYyo5AFPhwjmVbhotlKYx6bdA2/qTq
	pPvdOfgS7bmpHqY3NjGm4KDzxxKXqFZn5jcsw6/Nm3e6xIHWKXXluKgnFr8MjOBGQewckaVWWXH
	A5dEC69WLciLwQUHKIVB17BJb4l1TyNCYENxI9uQhMNSpKXrgryPEo1+KpAZPHFB1+3jQ/RVGH6
	k2hTCRUNQRGuu2zNwcbxzYUGfMlrUjXfWBh6sXsgM=
X-Received: by 2002:a17:90b:2d0c:b0:3ad:d29c:5e64 with SMTP id 98e67ed59e1d1-3ae897e30c8mr10939810a91.65.1793714345740;
        Tue, 03 Nov 2026 05:59:05 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b07cab84edsm1845046a91.7.2026.11.03.05.59.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:59:05 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-147be78cd56so10472756c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714344; x=1794319144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bmndstez1ROjl3SXVUcZnwGvUr5BBU/f9ozJwfuLHnI=;
        b=Qj5XYorta1jw+8PbfZqY71LtnJoR1VdZw+gTUwW6/ozIzSv0aM10Tyy7BI2/uYiYCA
         FFvVmgp8cNb/J02cehNMBCQNCabMVVX+SMB+ewHIIaQBee38RYLRWMlG4CbQBgoiVPtS
         H1SC9bf9/blmL5n2lOHDZfwrGjSvAf63thBc8=
X-Forwarded-Encrypted: i=1; AKwUvByn2CJVi60JJX24UoSldAiENNEISrJIE8aqUFYh8VkyUi/Q+5ZgPnbiwSJfkZGlZ6aipugub3FIqEqDy4o=@vger.kernel.org
X-Received: by 2002:a05:7022:ea55:20b0:1a2:a5b1:884f with SMTP id a92af1059eb24-1ac5da7726bmr20328264c88.31.1793714344073;
        Tue, 03 Nov 2026 05:59:04 -0800 (PST)
X-Received: by 2002:a05:7022:ea55:20b0:1a2:a5b1:884f with SMTP id a92af1059eb24-1ac5da7726bmr20328216c88.31.1793714343237;
        Tue, 03 Nov 2026 05:59:03 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:02 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Michael Reeves <michael.reeves077@gmail.com>
Cc: Pieter-Paul Giesberts <pieterpg@broadcom.com>,
	"Franky Lin (Zhenhui)" <frankyl@broadcom.com>,
	Mathy Vanhoef <vanhoefm@gmail.com>,
	Kalle Valo <kvalo@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	asahi@lists.linux.dev,
	Hector Martin <marcan@marcan.st>,
	Daniel Berlin <dberlin@dberlin.org>,
	Janne Grunau <j@jannau.net>,
	linux-kernel@vger.kernel.org,
	Hante Meuleman <meuleman@broadcom.com>,
	linux-hardening@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH 04/13] wifi: brcmfmac: Support newer PCIe core startup and interrupts
Date: Tue,  3 Nov 2026 14:58:44 +0100
Message-ID: <20261103135856.3676311-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-4-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-4-b5cbc2cde2fb@gmail.com>
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

On Fri, 25 Sep 2026 23:43:39 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Hector Martin <marcan@marcan.st>
>
> Newer Broadcom chips, such as BCM4388, require changes to PCIe register
> access, watchdog reset, and RAM size detection. PCIe core revision 64
> and higher uses a different BAR0 register window. ChipCommon revision 65
> and higher requires a different watchdog reset sequence.
>
> Update register access and reset for these revisions. Decode the SYSMEM
> bank counts according to the core revision and exclude ROM banks from
> RAM size calculation. Disable all detected D11 cores during CA7 setup
> and select H2D doorbells based on the firmware DAR flag.
>
> In MSI mode, firmware can clear the mailbox interrupt status before the
> host reads it. Requiring a nonzero status can therefore discard valid
> interrupts. Process ring events without that requirement when MSI is
> enabled. Use release/acquire ordering on irq_ready to publish the
> initialized rings before the interrupt thread accesses them.
>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Hector Martin <marcan@marcan.st>
> Co-developed-by: Michael Reeves <michael.reeves077@gmail.com>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  .../wireless/broadcom/brcm80211/brcmfmac/chip.c    |  35 +++-
>  .../wireless/broadcom/brcm80211/brcmfmac/pcie.c    | 197 ++++++++++++++++-----
>  .../broadcom/brcm80211/include/chipcommon.h        |   5 +
>  3 files changed, 183 insertions(+), 54 deletions(-)
