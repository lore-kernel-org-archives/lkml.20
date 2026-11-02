Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.62.234.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646825;
	b=1qSaIrw3wkpUsR5zN9QtDwvanQ6JeXcUIKXqq3Fd4SYNYyW2EwwWz1NzP2KVpIRVCfwd
	 EW9zA6EhsLd+X+1NUy9VkNsT0NhM7n178jIchmCd5GaJYLKGM9AHXimQpTns5ytL324AZ
	 2PBxZegjaMn0Ir0P3SDco8lU7uEsH+DLTbZnijhI+BWXncIBs2AHEXbjcsQFzYsCGDpHp
	 V1qjXEPZq1+mhIOpN5qbWLRs7JODYYlL/+t1DRpoenr9MHA42IB8gh5a4POOMFC3wJjYb
	 94YSPc/PdebZVDs0DEiMY6vmRdND9qedwqK6t4+9QjWQKJ/5BEjIqW11ve9MU6N72wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646825;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Received-SPF:
	 Received:X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:X-PPP-Message-ID:X-PPP-Vhost:X-Virus-Scanned:
	 X-Virus-Status;
	bh=Xax+p7m5RCBebK4a1+/omYS133Ve1ycVI0ylmwVPxUE=;
	b=FR2jvblWtSimnoU/DoQCOZUDZhq62ILRvOxVqJv39jU/AGM7eKwEU5hg+PC1ii9waehG
	 T7yCR1rwGZn2CrLtUIjtq8YOAkqbT9p9R6cJ26w032FllhBX0Lsx66wQGN4OIhBVLIXTA
	 O3Yzp/mjt8/sse2wJDc2vQyveGeFZ0fN9GoeLfNCN0c1KW3WduugFxhVMyKkXWCVQLeic
	 0OY4f2e4G3wrv9ysV5yy63DOIsm5J23bqkdVMaEsO3rmJf9155USqJGt3aFzwM4UgH09k
	 hpRYuTeb/llB/Dj5CfAzBaXYjmLhvG73zDhphpDuyUaaB0T02PyncNfJbH/GAQb6b4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=antheas.dev;
	spf=pass smtp.mailfrom=antheas.dev;
	dkim=pass header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=AAvaABqD;
	arc=none smtp.remote-ip=46.62.234.254
Received: from relay15.grserver.gr (relay15.grserver.gr [46.62.234.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43820606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43820606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=AAvaABqD
Received: from relay15 (localhost [127.0.0.1])
	by relay15.grserver.gr (Proxmox) with ESMTP id 74AA43EF53
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:13:37 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay15.grserver.gr (Proxmox) with ESMTPS id ED5843EF59
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:13:36 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id F3938200CD8
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:13:34 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1793646816;
	bh=Xax+p7m5RCBebK4a1+/omYS133Ve1ycVI0ylmwVPxUE=;
	h=Received:From:Subject:To;
	b=AAvaABqD5AJnJCHJfHc3FMZGSfxOhBYlm1cT36fhp4t4/YmYIuwT/OFO6NA3jBcbk
	 QwPbhd8p1dhPwpZcp/gSCFuS+h1ivxaCi0NJLwFv3auZ8EsA55GrEAxSLZs3nNyaAw
	 rgyhBbyuuzO/GbttousHMWK61AGvXyCBpfqLXra0JCTJZvW1lW0LC7GHs9p78aGO/b
	 Yo+aH22audcnDXglv/CutyVg/DHicgBjeU5jcZdk2AGMkGvbvG/nXbrnF0sl8HjDvZ
	 Ga5RHGwwzqJkYqsGEEMiwm/DSfkuOs++uKLNXsbs0ybH8vq/tH45nUHQgsm3BcMGZL
	 bSGECf7f3qgQw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.216.43) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pj1-f43.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-3acd21ba21aso2499571a91.1
        for <linux-kernel@vger.kernel.org>;
 Mon, 02 Nov 2026 11:13:34 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AKwUvBxJqTsnoGZeHWIP2T00crG8K1IHFXCc1IxwuB4nns+uI9PUIuvtvuPU9sSMZJrJIP2EJImAQKAAqtJwmq0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hrdhdu8GfqyS+fYf3TrDmSo3nr+Y55n696P79f0FzlhW+ETRR
	lDEHzeHKELcX6eCq2O8TXV1/9Gv/KTsOoGABoRJTSyK2Y5nfV2A84bsclv6EnIwgpCmTeQuiMtN
	vEPl56KT+BNXmJv16WHL5bbl+GzMLSJA=
X-Received: by 2002:a17:90b:5344:b0:3ab:a3ee:33ad with SMTP id
 98e67ed59e1d1-3ae897eb378mr8757651a91.22.1793646813306; Mon, 02 Nov 2026
 11:13:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102174052.1216670-1-lkml@antheas.dev>
In-Reply-To: <20261102174052.1216670-1-lkml@antheas.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 2 Nov 2026 20:13:22 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwEonhmmZUD1cyXu=6t6MMGyz_yOr1vPnUzhOuwZhC2NbA@mail.gmail.com>
X-Gm-Features: AclHuK-WiY0Fb4cF6nE5AJNNvIJXfCMXfWO_c3oD4hDmHpDoClAM9Qjh_kebXzU
Message-ID: 
 <CAGwozwEonhmmZUD1cyXu=6t6MMGyz_yOr1vPnUzhOuwZhC2NbA@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: hda/tas2781: Prevent throwing away custom
 calibration addresses
To: linux-kernel.supreme403@8alias.com
Cc: Shenghao Ding <shenghao-ding@ti.com>, tiwai@suse.com, perex@perex.cz,
 baojun.xu@ti.com,
	kevin-lu@ti.com, sen@ti.com, matthew.schwartz@linux.dev,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <179364681541.838663.1140156889213598600@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

Apologies, I forgot to cc you.

Test and report back.

Antheas

