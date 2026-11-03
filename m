Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714377;
	b=V4mK2iyI6id4dmli83l+9XFCjzCrvoN7vb7uiJ2FMdP+tzrHBfOLCFKJ1cNsik6BGHB4
	 qW+OB+z8ItWnUM4FMQLlp6WJki7OUlJNAOVbi9AMnfsHBMhbvEQuhTH1OkR4y6yq3R0yQ
	 PJoE0jWNaA5OkWyawGBwDZQHuBdIooCbtJH6G9LV2qV3UL4nhHp1yg1NqwAYpfFGQMC7w
	 xrB2etdYsQseArHbhxKAzLeGHoRCLvPg6CPb8BAGe1YGhnm/CdGO5X4v6LxcYooT3A925
	 Gw9LaKK6WhQerHNEMaCytgT5pZlf2wUWta6Ds6pI81+YV8oFuJHZHFcA1k5ZLZkEo+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714377;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=43xLL3WpmNZ/pYhKQm6M7yVVXTs8TfUEc4VM7Zt3f3A=;
	b=Vc03hBzb7Tp3gxRt/y5GttMXDZfF8S8rDiz0f9ihN3Hj0cKb/b2OhJhKYRiLolZESQM/
	 USQNaPs4XQtVut62RUI5V8KDwSl5qf+ye/Mo+0rrFSTcshmLcXXN6ZPmypXbGALQVuZmW
	 OAA1tJxXA843hReV6ZW3+wdhDmyMwiOAt6k5HNGE4jPj0uHPvO4YdI8MxzLsXpacFzZBq
	 T2cUOEvxnCbZFH1NA/soWn6CCW9Od87N3y08e1FCQNbVFWaHID7Ce3cXuEVi+yTDBC6Pu
	 y37/EaxAxMqcA/NGQvf5OPqrBkz+CBsJIbFk2UUckjwmS8B65fzXSqhcFY1NWuOPY5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ISDU6a6r;
	arc=none smtp.remote-ip=209.85.161.98
Received: from mail-oo1-f98.google.com (mail-oo1-f98.google.com [209.85.161.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9D2606D82A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE9D2606D82A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ISDU6a6r
Received: by mail-oo1-f98.google.com with SMTP id 006d021491bc7-6fe4372c5f3so2798703eaf.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:59:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714376; x=1794319176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=43xLL3WpmNZ/pYhKQm6M7yVVXTs8TfUEc4VM7Zt3f3A=;
        b=0jv6rjttsXEfJmqSskjBIsbUMNoEGK3cl2kla09GbtEVLAEsIU+TiQN2Jg5ZdHsSL6
         QJ72JnDIls9WyIgdEvYF0N7pCUEicBN7M7Bqmf486YJ9h/EaxiabZZEbhbM63cGiL1AI
         ITtNoIWb2wzdKUk66eyg+nei/scI266L3dWSMdIEiZZrer5gO2ZmoxirHRkynFrA+BAW
         xi63nYME+R7HfeO4GcDL9If5v+CoQq1C1UG4XZs6hqCNti16RCNabpIZhX1wWqhI6bLu
         x5C1knofSF9kU6QcVXmg4zt86fOlrvDtDeTNaUKNuouCv8Ihx8neIx+WB/Mzux3YH05a
         neWg==
X-Forwarded-Encrypted: i=1; AKwUvBwNnRrrlPx1/+/M9aXbkuVp8Bll9BtTy1nZgXmyQqZisjLow/JSWl5yXRGGhVKdB/xT+qW19Sy2RREfQx4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Vwx4UthnXXVKPXPAgiKh/1p1u7D2LiemQCQxCl50fGeC6uRFW
	8ZtD/8OSR0/9e3guy6UzsHIx1T7ux4w7FMQt66gVdEAPxo62HlEURtWfelHgrURIgD6AxQOjiTK
	K4+DHEFKL3PYyFcxi1KjlM2id/AbjOZtXoghr0DxgeY5gR9M6OI+8nusnKOZkjK83hGSfdSe1oj
	vmGeIfyYVHnZt43tkkBzPH+P81EYJg8DIAv5Y2749wky2ojqfvksW9KUADBPx9XQuKiuLaLAOI+
	ou7NgLaINcYQx1GBVL7ch6A1g==
X-Gm-Gg: AYBFou2jr3WkjJHnxp5N4ZGlBnxs6WUG4HFR0fcJvR3eBWDN1BVReN51By8nGzVwzgp
	W1GmQ5D6d5XmB3sYGxczFwqu84Yda/xFX80UG8ktCaDdnnhBbnQQ8pdviVs+RXeQmqG/0w5pH6K
	cCUaXUk4CjTMgCTojMg2ZJDw/oJdrrf1XfCPkkI7rVWTCjgmHTt1QMSgmc0zWEVG1sdj/chYOgx
	15FlDAn8zCWQzUV4Hx8gTqkJHtp0Ckpv0GYZvU5a5uPoWQa0khcP0zFeI9J+FcZ1y3Iwuo97AMt
	bSzkYbvwcKO6wLtSU4ZzJLox5vwSBfNFbgbJ2kF9Jec+LN9wTgnnAxJBIPPkSlp/q9CwPq75Ouq
	3JEjCkiBjIhoZfXSCGWaPwvf1zfjNeftcWIAPxRnviV8s7wvb6t1bHMXwC2MCFjhN4P/qyKE6sp
	e75pH0Bfx2WHMtXj47bQ2sftnqcnuici3fPnmgW60=
X-Received: by 2002:a05:6820:1383:b0:70e:d5d:871b with SMTP id 006d021491bc7-714f24f97ddmr7444206eaf.3.1793714375599;
        Tue, 03 Nov 2026 05:59:35 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-714f31897cesm123486eaf.9.2026.11.03.05.59.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:59:35 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1ac19c6bc71so3070297c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714373; x=1794319173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=43xLL3WpmNZ/pYhKQm6M7yVVXTs8TfUEc4VM7Zt3f3A=;
        b=ISDU6a6rW4p2f+cGo6Neyxj5GI/ethEwfEGXvxQQEBa7XK0VqV0LEZcmo9AN2czJCj
         Yx529j5gOxKgSEViEgGlkfdZ9SFDMH3Ip02HXgqRaVYrY7pV/cJzFAIEJRp3ZxA8KNVb
         /3N7MlbT9ntoy/GR/G0rn3HMtR1EsGBgWEREA=
X-Forwarded-Encrypted: i=1; AKwUvBzLbfds4EUZ95mTmu9k2W5VtEHlgdMq9RxtIvo3krMJP0cDxKR/nUXicoUF/ND4WGL4hGVeAEnjbJKcsrA=@vger.kernel.org
X-Received: by 2002:a05:701b:450f:20b0:17d:7b45:f905 with SMTP id a92af1059eb24-1ac5f36ca91mr19014236c88.31.1793714373157;
        Tue, 03 Nov 2026 05:59:33 -0800 (PST)
X-Received: by 2002:a05:701b:450f:20b0:17d:7b45:f905 with SMTP id a92af1059eb24-1ac5f36ca91mr19014203c88.31.1793714372513;
        Tue, 03 Nov 2026 05:59:32 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:31 -0800 (PST)
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
Subject: Re: [PATCH 05/13] wifi: brcmfmac: Negotiate PCIe mailbox transport with firmware
Date: Tue,  3 Nov 2026 14:58:50 +0100
Message-ID: <20261103135856.3676311-7-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-5-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-5-b5cbc2cde2fb@gmail.com>
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

On Fri, 25 Sep 2026 23:43:40 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Hector Martin <marcan@marcan.st>
>
> Shared protocol version 6 and later allows mailbox messages over the
> control ring as an alternative to the shared-memory mailbox.
>
> Advertise host capabilities using the negotiated shared protocol
> version. Select the control-ring transport when firmware does not set
> BRCMF_PCIE_SHARED_USE_MAILBOX, and dispatch received mailbox data
> through bus operations.
>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Hector Martin <marcan@marcan.st>
> Co-developed-by: Michael Reeves <michael.reeves077@gmail.com>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  .../net/wireless/broadcom/brcm80211/brcmfmac/bus.h |  9 +++
>  .../wireless/broadcom/brcm80211/brcmfmac/msgbuf.c  | 57 +++++++++++++++
>  .../wireless/broadcom/brcm80211/brcmfmac/msgbuf.h  |  5 ++
>  .../wireless/broadcom/brcm80211/brcmfmac/pcie.c    | 83 ++++++++++++++++++----
>  4 files changed, 139 insertions(+), 15 deletions(-)
