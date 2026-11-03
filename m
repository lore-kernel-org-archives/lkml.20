Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714390;
	b=GJ1EWeqddNV8RxUsJ4e1O1bgbgEdtk5eIjB9dVxd0EACAmYL4HsgHP51aH0H7jLV7OKE
	 NRcLNDK2SPREHzN6oQmmohUdX4wOBxD/Z90jUMsQwMiVy1BfDP7dJ/+zVDZf9WbOy/P/0
	 YTeK2zyV08pCe+Vn04D2j2NrnoHUgBTSMsjf4KaBbUBy2deAaIDp6A2km3EPLtt6R+dF3
	 s9aPc4e1sz1ytDUjCIDR0XFRBccBkBbu/lHoBdn85lo4XLgUsiaOvEdV5VA4zmXxUZVdZ
	 jrcRc5kxN3SnE074rYGihJHzw5LH8exN+Q1LrEw1tItwKqS+UwqXPBoAynFKLZzLc3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714390;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=BPfwhnSKhhImT2MSjvVFfyGTbJZ+CXv0gKlK5lwoVaI=;
	b=KkSbTH0o14vvfvVPn3w54PKhtOsyTvXT4kaX6+si7K54Rxm1Ka+tJ2ac6t2h9DITSnZc
	 S6UhEC5yCsbDXUmS2Ej4gFNgT5P62TUCckrYR0KSRp6ytZIPtVxpv6NbiMkRgyWpy+Acg
	 46c5w5v2jT2bYPJ0Od87lwyJFjei6hoWP7zM5lSpjuBI5scPK6xc8+2ZAQWmKP/wgJMfz
	 5arEkAAa2kIDxuShHi1rcY2sbWeWQM3zivFrtp8z1ZBhAxACJjlPjy7AFM9O9X++o1vIe
	 fcFIyJGXZ2Dsz5ul60IvGD5FAQAF5kQ6cXlLGikb2sQUjM97g+PIR1tyw3CKIVKdP2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="Eks7S/An";
	arc=none smtp.remote-ip=209.85.160.227
Received: from mail-qt1-f227.google.com (mail-qt1-f227.google.com [209.85.160.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03973608360B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03973608360B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Eks7S/An
Received: by mail-qt1-f227.google.com with SMTP id d75a77b69052e-53664b4860bso45052671cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:59:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714389; x=1794319189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BPfwhnSKhhImT2MSjvVFfyGTbJZ+CXv0gKlK5lwoVaI=;
        b=ABBs0EjgPLO9A7uMcPu8HVe/SVVbr7oc0BH2lQpWByAoGRee6qlNn7G9yAu54ldxET
         TR/TkhJCzfwUBO9CGuZLUD75dIEoSX0SM3zGdgqNlsMtHnsfbnzawqlmxpH9cpcaHrGV
         3a99Nppc2HKzSOtt4sGtQp9+QVLVkQVJSOdGrKYVeRW3YNPMOnJ6QwjRWtuH0gNQdMVY
         YdBhyMLtYAEqay0HcKCFY/jp5iad9s9Htws77mmNyI/3/GgoAQ6Ik7y52Wprek4pEU3a
         JQrLkYeGe3gEFt7PSILbSG5+MFAf5DEsLCmN5bB5L111VeAAPQNwKBeWqO7+710SdoT/
         h8eQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6zD2N2Nt4YUGW0Vk1ofTKJ/MVpPAF1B0eQqj8yCJt88gmFQ/DPlLMc0d/PL+hZ3kA9stCD+rHjPwI2YI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nUlBX6UvspasuISNq/l5D6Zsd98tHG4DuR4/w9MHcJ0+OPHhq
	eO6swoA6TMmEEt3A79XU6Nchl9bpDNdtclvx0AVtZ4NcPZhU3WOYvxdmcduJCEDRJiHcP3rovQp
	J452Ijpt6ijLPVPpSFaMziIXsJUZnc7CqegB7VRyzQYRnZsxQmk9Oj6avaszzAqquG3lvVeKn67
	VaY4CbyzkPbiE3sI2R3mWOExRPkP/XmGnchhqA2o2zoEKLp7llGALcyETy9zr+s0ALgsOQ+bUz4
	GCJyWF2u1yVL+y1L+8tkLEyCQ==
X-Gm-Gg: AYBFou1OF/MYXcT069p5CxauFS4yWO+zIlEfFPlMPIjTrCH8ekKeGJWEwGHrSyOSlfd
	O9w+xTzbvmN+tx2FSbM0nfI4WBVmsJGiFk23vg7dmHJRjrE4nTDJAm5FaA4S4Mu+5B5J6hFVVva
	KOD0zjCBx/uJ7F9oVD1mALrmlcNiL57aS2cLX9fw6laJ8ofnXIMDQyTvFkjkyqRM8gp+dnpCL2l
	I0WzBQ+hZW4LsE6ZpStyH5oW0YT4TzO0Ilu+qnLQZHMvZoWzmasHHPANx4uSoWAqctd+nLDDy4j
	6uwYWCFAjyPd/VrY08iTIqdGaKdft8qCBehwZdcqm04VaC0OOPsBi35DV2FTiQszxq82IuxaVc1
	jJPgipfUVZVdWipDLNJjqr1bCqGSAooYLXizIH1DA79wpR6fWu2RVrmQw8vffULuOh0FbFr2Uru
	PLHGkm9QHzBSNM6SQQ+wvN4ez0yW8vaqD3VfRv5oI=
X-Received: by 2002:ac8:5a84:0:b0:535:a5f9:7529 with SMTP id d75a77b69052e-542b8ece19fmr213655291cf.72.1793714388717;
        Tue, 03 Nov 2026 05:59:48 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-5498c479e25sm240671cf.33.2026.11.03.05.59.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:59:48 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1acbaf81bebso894348c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714387; x=1794319187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BPfwhnSKhhImT2MSjvVFfyGTbJZ+CXv0gKlK5lwoVaI=;
        b=Eks7S/An1hyagSxN5dfkvPIOkwIavxcld/oFEZrgYcPjnme/MeuLwIl3b8Sp0Z0ric
         enUwWWNkH01zOHdfH9wPHpH+BtQt5wS1K+TCP2sHwyxpCoh/sdl9sC/qiPIWzA6IqGTd
         np9TxEOMd+p6ZUL+khP6LB9JldlJQoPXuJGgc=
X-Forwarded-Encrypted: i=1; AKwUvBxBFD5BoOK9UzFj/mO6NJe0VzhUUxXlknxHGVWO7zfS6F10I9G0iChOgJrR/abvLGllqx4ELpOKtrEOuUI=@vger.kernel.org
X-Received: by 2002:a05:7022:b059:20b0:1ad:3402:733f with SMTP id a92af1059eb24-1ad3420f9a1mr19288276c88.44.1793714387405;
        Tue, 03 Nov 2026 05:59:47 -0800 (PST)
X-Received: by 2002:a05:7022:b059:20b0:1ad:3402:733f with SMTP id a92af1059eb24-1ad3420f9a1mr19288228c88.44.1793714386672;
        Tue, 03 Nov 2026 05:59:46 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:46 -0800 (PST)
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
Subject: Re: [PATCH 06/13] wifi: brcmfmac: Load signed PCIe firmware images
Date: Tue,  3 Nov 2026 14:58:53 +0100
Message-ID: <20261103135856.3676311-10-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-6-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-6-b5cbc2cde2fb@gmail.com>
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

On Fri, 25 Sep 2026 23:43:41 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Hector Martin <marcan@marcan.st>
>
> Signed PCIe firmware needs a signature and a memory map describing the
> image, signature, verification status, and bootloader heap.
>
> Request an optional .sig file and write the signature and reverse-TLV
> metadata to device memory. Describe an aligned heap after the firmware
> image, keeping the metadata and end footer outside it. Require NVRAM for
> signed images and preserve their reset vector.
>
> Request the IRQ before starting firmware on chips that use signatures,
> while keeping ring processing disabled until initialization completes.
>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Hector Martin <marcan@marcan.st>
> Co-developed-by: Daniel Berlin <dberlin@dberlin.org>
> Signed-off-by: Daniel Berlin <dberlin@dberlin.org>
> Co-developed-by: Michael Reeves <michael.reeves077@gmail.com>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  .../wireless/broadcom/brcm80211/brcmfmac/pcie.c    | 267 ++++++++++++++++++---
>  1 file changed, 233 insertions(+), 34 deletions(-)
