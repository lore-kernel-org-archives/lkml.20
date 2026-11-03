Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714367;
	b=lyfMz0flbWWoOHgHRlPMPTsdx4+fRhwatCeF21oystPxH0uYyFIqleMdYlSPk8fTDhd1
	 5NKjajEv3Mv06gsRtDJQjnL+2eYQEvPOd6cFz4wCSD3HXD+ewULHSdaC5Mpuz5i4mIhk7
	 cAGGUFE9vZqtnGk/kj5xjzpRJfxEwm+YRXCBaWJf3ipxmIhRFzkpM/VpLP/u2L0SV259f
	 E5gxKlvhv3l6R2gBdzw0uHARmo47WwnJyQKM/h9KGrX3kZI5sBXYSNgfrIIgNJL2TZkpD
	 E/3G8oSbbEDnuVp3C2v0yE8ZGcntRdb+7+QcVDMaaF2GLnhOhCGb90TeG845DKkd7zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714367;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=ObP2EjY6D+HzwangbrGAF+EH007820Bo/Jvo+O4ZYyA=;
	b=tH1hYvpfonfum5iNbRVbrc+NFu43jByo/GzogzBhJ3PKx/OSxkO0c+Y9tfhZL9h0nEiS
	 NdVrvvLbgdkUPYbnFcrMgDIRIUPpw37cVpRf/UESry+d+7XtQ9ZrWEiTfjjtFQfixjJ3v
	 1IVepl5YY5CQExIPYeGmEWyI73IAV4V3J2bixPPYeDA4Ps+EO66DE/dtUQx7r/KTI/lE0
	 tvrr7VaLQJ4GVRXkVDafaBIMCcS7Sx3pXOHqa5ykiKCTlA0nTSb0rE+2B/kO48dnjuLMx
	 3SKREYfAmzkx7+pKhIO9d33XK6jwo+zh2dXmnfrgIK8xlcRZj0X/IYvgJBW7HL3536g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Bbzlozea;
	arc=none smtp.remote-ip=209.85.160.228
Received: from mail-qt1-f228.google.com (mail-qt1-f228.google.com [209.85.160.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F218D606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:59:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F218D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Bbzlozea
Received: by mail-qt1-f228.google.com with SMTP id d75a77b69052e-5351d76e1baso7855301cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:59:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714366; x=1794319166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ObP2EjY6D+HzwangbrGAF+EH007820Bo/Jvo+O4ZYyA=;
        b=JEYlEyWBGfpxe4OFAXBmdqi6CJC1jDGu+L8nW/9XkODhKHfb0OX/hFPecKcJ+1fo64
         oPblJYWVDuCHh9kYQwUik5gSc2r9urS0fE8bBBIIhdKrLOc8tqq/EHMb92qJXby42hEF
         fB/EMdCGAc/dReWqj77b/FSkcqsPw1MnYE96KCmUk0o37EtATX2K+MPCo0+NsCSoC5xl
         FVcocHUMAVqii/O8zNE5WG9pI5h8kBiekoI2kMbjIMr+MvHOMIZRfGHjmGwDoLFpYZD2
         l0Cn1XBpXhbh5MnNhrbivZ49Hq1qAXQcROhHu86nv+UbPtSuf3AtbWck/FQorDYZkHmr
         XgJg==
X-Forwarded-Encrypted: i=1; AKwUvBxxEg782zGbuvQ6ZciIxOyC+170iN4V6vs5BL6OzoaQ6hmSVWdYhIjKGQd2SzhdyZKiMzb2nO1rhCZeP30=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wSX6KkSI0WAStEDYEH/CFd1Pqv9ndZNkqVxncuRm0A82E407p
	wPePsEXQUof/kC6TIMqw9alwYz6NYb81pRerz9fDzG4143anwRRvA0NKP62qyCub3uOEw9yoRCk
	Z5C3IDtgjm8v3aY5Louz3Nowzyv1zP8tG3wdybnm5PYwetkBmGuqp/3ZWmx815KzBk3yhrDTRys
	8xmjuVhtrwFQrh1rVTcwH7zR59ESG0p075F+5a3j3CpJj0vYYqqRQzWA9ILDHCtuUNBCVxGRWZm
	6HRujza3wkWu6Xj6cnbwqWaMQ==
X-Gm-Gg: AYBFou1yS+fQj1R+73NwfU+y5znjKpz/vdNt1zcIWpZhKZEMt/OJNRxoJyEkvWGKfi2
	qrNjeW1v/bIa11N5dZTCHPkpdJTVZe1XCIxASKC5Pr1+T/J5NA/ZoEmYwN46qGofeNdrIXyfKkP
	2m5KTcS5BOwj3szQqkbht7k0CbApB3czFXARMdWlGQGxNkUi1HAao3QL0b6cz5v9nMelD6EmNHr
	aYcJNb4TE1mc6pleFI7YmCcq3QW+isFCVB9W8YZPLvUlHqtQ6pRI4T3R1aWuaP/RABj4jP5suP3
	Q4xP+DuXOY7Ir3FjIzO7AhgGdu5HdCMdzskY32N6+dCJwP4vhyafT/hvXB1N0+LP80jHIIDrQ7i
	CXrLXmHy0OlvJ0AT+vSPDpzVDAIFbOQvEc501E0zN260orj4sX9msIfp0gYywaYCo+/5X0Ba7R5
	Q4fCk5tkjJyER7M4EGmMmzuNXRnB1OlNifg052ZGM=
X-Received: by 2002:a05:622a:1ba8:b0:536:54b3:157 with SMTP id d75a77b69052e-54120b25d42mr277159511cf.26.1793714365844;
        Tue, 03 Nov 2026 05:59:25 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-91e7376f666sm150806d6.32.2026.11.03.05.59.25
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:59:25 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3425098ae4bso1030822eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714364; x=1794319164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ObP2EjY6D+HzwangbrGAF+EH007820Bo/Jvo+O4ZYyA=;
        b=BbzlozeazxgHj4zb5a8zE5W7BSXJ6Jh1rNN42aM3NvANfqSuXkjtgWvNK0iGxc2s55
         hPXFnULX3czIuObzc1btBzp0vw7fMoXLtMRAGpyaz3121uNNhMPV+H1zvYpF2pU5B9IK
         yojvDOWB6l3wOAccl8T+Z/gDDMoRkBw/3yqcU=
X-Forwarded-Encrypted: i=1; AKwUvBwJgXMl2ejpiizKP+qmhU2eTa1l5VpLNu8SYNZd2OAwuN5E1mA0AA/aFPE9E0bDD/CK8i6poS+HwWBR0xo=@vger.kernel.org
X-Received: by 2002:a05:7022:f90d:b0:151:7831:e403 with SMTP id a92af1059eb24-1ac5b027fbfmr16236299c88.13.1793714364458;
        Tue, 03 Nov 2026 05:59:24 -0800 (PST)
X-Received: by 2002:a05:7022:f90d:b0:151:7831:e403 with SMTP id a92af1059eb24-1ac5b027fbfmr16236255c88.13.1793714363382;
        Tue, 03 Nov 2026 05:59:23 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:22 -0800 (PST)
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
Subject: Re: [PATCH 08/13] wifi: brcmfmac: Handle larger firmware band lists
Date: Tue,  3 Nov 2026 14:58:48 +0100
Message-ID: <20261103135856.3676311-5-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-8-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-8-b5cbc2cde2fb@gmail.com>
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

On Fri, 25 Sep 2026 23:43:43 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Michael Reeves <michael.reeves077@gmail.com>
>
> Some firmware returns more than two entries from BRCMF_C_GET_BANDLIST.
> The fixed two-band response buffer cannot accommodate these lists.
>
> Use a larger bounded buffer and register only the 2.4 GHz and 5 GHz
> bands handled by this driver path. Ignore duplicate or unknown entries
> so they do not prevent wiphy setup. Skip unsupported bands in chanspec
> lists and scan results before decoding channels.
>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Co-developed-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c         | 48 +++++++++++++++++++---
>  1 file changed, 43 insertions(+), 5 deletions(-)
