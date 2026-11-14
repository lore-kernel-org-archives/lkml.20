Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626054;
	b=0OoHWWZ40NfuxNNPkToavQARPhBFwbI/5V5v/4nOC5IU9F/247uUIBbKdJXw81zQyMCD
	 S0m/Wu89GHbvej9m/45eFbda/R/A/nKu5enDF4na2gGcOaMHSQSuh7NtwsDMMYOHjgVK9
	 isbSov/Ce0yoFEdfU8fda7/dUI+V9lxYil7ra+CevdisEvUMfIi1XVxl9DwNGG7ztQjHa
	 9L4wAX45LZ8idYb8cohsHvBZ3/ffqwa0lmN8wSJGcxeNIcHu5/PSbzdw5WFFgyGPTNiV6
	 GaM9uv4mGOcxd+8nobwJ6XbdlPC4tf0M41ulBIF+ctraAVZ+YUs8FC78U880FemlDTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626054;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=m8d1sx+7DRy5PxzOct+9rL76yHYrDGSDUXlfvhnlv/Y=;
	b=vrloeZTzQcXytUp1EYQS3wjj0bE+IDTBwfNXpN7ePd9bX7n3p8FMGY+RuGG/N/yE40wP
	 TeUsR0fkTKqxyaqpl331sAUBBqGl68T/fQm2aCsFj2JcpVSx9/01OKZ20CDCCSfCxoJ3s
	 i/qwVPgcUX0eVVyvyV4FLC8oPV1WhJ2p4yDtabpj9z+47AOtz3B5zLO3by6l1MJe3JKWO
	 7BIOrlOPpbQSB+oSvS8MDkyjKfwR7UxtpCs26ZaN51gSxTVssMQRrNomxC+XRGr6rsAFK
	 ZVbwo+BaSK2abrYOk4zPdUF3V6K+rZ4ECv2/TdjfaBK3s0hWWdC1Rs9oDqEP96lM8tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZZ56decP;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF42C606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF42C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZZ56decP
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b09c07b3d2so982231a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:14:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626053; x=1795230853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m8d1sx+7DRy5PxzOct+9rL76yHYrDGSDUXlfvhnlv/Y=;
        b=SKipSFJiF0RGlLV4GhAfrcE6kuqTunpt6PagMTpaF4SWzxNkCb27hCVW7K/P4T5Qji
         cdqOh+4fbrO+YLtIV0adpdTKeAqKtH6t6EDbEbOsXP5TELSXT48pt+y38V5PnNKI4HgN
         elHebsidsM89+G8z0pwMbGBL6sBco9P0hc9rBHLAI7EURjH0N0ga9OtUisqRjeAUK/6S
         CVRGznq1hl2NsUXCLvtINrE6ANzIPaKbVb5fvyEMaM4aRqRsaaiOgpmirQw6tML7v/qY
         0Qi2XKEFWuh60JgyWL3nV/LBPDNnnZKtJz/VI2b+waVt2mEGK/xfvC4wiVYqIdSqvws3
         tkQA==
X-Forwarded-Encrypted: i=1; AL+hErFT8lqvzY6Ad1jW7ZzY3INmvCtmceTs6c218LeqmGoFvZR952q1iqnguaKL43cTNYTFr4OkNQCm00Qk7VM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8X7iDEc5NCHAeO1I/o0ioNn0BU4JbODeNrVZjRUGDqU1al6rFP
	yqGp9wj3N5kAeMoNa4yYUP7nBk6Mh7hW1Hy8XDOE35jaEpYFNBIhj4VG+3orgsGDbuF+F8Lf9IQ
	OgMtsBthYL0xkdQVqGB6dJICzNLXfsK7La4RUFmBP8HG7uAiORDYULlmdqhuixgi00iWWfgleb0
	qfwAEunQelLF2ncF3Jx/zdXS4RJT9OVhYZSOipFh5qWZK8MALXjj0bXFqzVYCjtK60pNlPBifCL
	BGvKfo1clm11VJdW/i0zdHG
X-Gm-Gg: AYBFou2t5/RdtZkQrwyf3JU0B55bwPlCdB5VhcTJUJjRS/CjeTI8ScUbulrEspwIZ5S
	bHKessx8GpyMzXpgcETZ8eXx8AS+FDwFsAcjxbZePXVZxGyFX0HPj24h5/6H0yK5YYA6JSf7VrQ
	IS4aOWb6uJvL+/4jgw4GRjm8q80YcL4ecOndlYwPpfc30wH692Uc7v10S5Y/20rWhYUM4Y6J5ka
	y7qGef9qXjzqQYQg/OIXKFm7xr9Jro2KJEsNClrWIgAKGvuSERnsbMZcgHcm6uGQepM5nfERmqe
	wi0AKVDrktTxQqIAolwOUAPqd/x+W/r/5py4VPudD35YQvTcU0bV2AAcFgQewxMksOVBpOTG/Tr
	6yXCexVlZiSZs3MtDDMUEVSFEMe6xRQWvDND0w87bP5a4lzYhs56wEuZwVbIDS0u6FRWJ4DconK
	4UU8Af3L9fmPWosvnPAjl5eXf+26roMX/G9J1/MjYB/Fc=
X-Received: by 2002:a17:90b:1846:b0:3ae:8106:6074 with SMTP id 98e67ed59e1d1-3b1b0a42a3bmr3824890a91.16.1794626053178;
        Fri, 13 Nov 2026 19:14:13 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-121.dlp.protect.broadcom.com. [144.49.247.121])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae96f125sm6323200a91.4.2026.11.13.19.14.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:14:13 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5383c05fb2fso2068031cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626052; x=1795230852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m8d1sx+7DRy5PxzOct+9rL76yHYrDGSDUXlfvhnlv/Y=;
        b=ZZ56decPkoe+YjjuLeVaMo2ze37CtiSzYPkTOA1Hgcnutg5HUscSKTjbh4xwFLAce7
         /mpYl7LgSdk9chM8scAjY4zODA2cD+upSsG3cDTYWkxOHBk6wTuh1Q/qVl1kni0UUjyy
         U1TuTGQclCHdqWh3yxsxwZYAwQyx56g4wbDYU=
X-Forwarded-Encrypted: i=1; AL+hErGSXDDOewWEieLT1chxob8nxORks08Cb7GFjJzDD2bHEqsDiudcreJf4Hze7Ou9EHvfEHEn+ONwkk34Bqk=@vger.kernel.org
X-Received: by 2002:a05:622a:54b:b0:55c:cfe6:80c0 with SMTP id d75a77b69052e-55ccfe682cemr88471cf.26.1794626052115;
        Fri, 13 Nov 2026 19:14:12 -0800 (PST)
X-Received: by 2002:a05:622a:54b:b0:55c:cfe6:80c0 with SMTP id d75a77b69052e-55ccfe682cemr88301cf.26.1794626051752;
        Fri, 13 Nov 2026 19:14:11 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad0f07afesm31826931cf.16.2026.11.13.19.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:14:07 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Sander Speetjens <sander.speetjens@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Eric Anholt <eric@anholt.net>,
	Stefan Wahren <wahrenst@gmx.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] firmware: raspberrypi: Add blank line after declaration in response_callback
Date: Fri, 13 Nov 2026 19:14:05 -0800
Message-ID: <20261114031405.870827-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107-fix-raspberrypi-firmware-v2-1-5bfe605a5cc5@gmail.com>
References: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com> <20261107-fix-raspberrypi-firmware-v2-1-5bfe605a5cc5@gmail.com>
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Sat, 07 Nov 2026 19:21:31 +0100, Sander Speetjens <sander.speetjens@gmail.com> wrote:
> Add a blank line after the local variable declaration.
> 
> Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian
