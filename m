Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794627137;
	b=EQ/kSOPfzMt1IMjZ0GyvRTVjftMDhsZRw/TkY0N6dz6MDmpUmVBEg4nlehSztkQezNvG
	 YkcIhPisTF5gV2EBB8nxVBe3xI8pZ5yJcC8LJTxxwpQ67LFl2goZr/4zTimD3TcQd+6Cp
	 IMGCIVrghMOOjeGRW3PaDfZGnIZLLrNyOKz7rkhheQedncJzqzjF2hSAarZEC9ZeRn2Bz
	 Mo0c+G9n1yjltQcYZF99RUe/JTY7DJyE5JOTiXaFmyW8mfI+/knyVffKzbq92eGEGfDTK
	 r3Ez84zTD9bVAYg0MHAjAALETLjsXOhPpYZJjs4ud3vHLJm5FE8jcCQde9Sa+gY0tCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794627137;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=a9+SF6U2AiWoeGlLfeemvFEwWPJkSucImk3rldu64e4=;
	b=KEOE5HIijVxtdeajaHg+nvSEnCcgY+Ec5UC9CgDcmKo3lATWKhhgMyfg6TqRgQCSH76Y
	 YO1kf0GIiOMVW8D0OMalULnYeOO4QNFQaO9tqRuURmR4w/oaq4dHU9jGKxx8FewTD5Enm
	 pk1OGQZxzDFy8ud99+Xv1sDQLlSPCxUJExDNClSNaONgQHTbihIYY/XSp7+w9ioU+YRLv
	 vJiXKzvDNVArj7HhrI53qX2Z98glHZSHht4l8MbysDQsmlPGMHqNfDI+/UinTJC/MjpaA
	 cQDNOOc+YZ1dFSFIwVNYJ6gbMBYgGBTYniAZp4xB5r6B1S04kf5C5ODp4iOhHcLOhrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Fy2luoou;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1AD606A895
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C1AD606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Fy2luoou
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b1d1d74384so43906a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:32:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627136; x=1795231936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a9+SF6U2AiWoeGlLfeemvFEwWPJkSucImk3rldu64e4=;
        b=EeCChbRWerpLleLTTzenDUkj1s0zHSrj/g4+RM7a4Fuwnsf1IXrDb/fdfBE+9J1y8u
         /xQzUtyWau9xMdWOMmupVxNQlfqUtGWLaTL5sZ6PS/n1bSZVE/0h5vhmvM50yg53T2Wn
         eF8M2oeY5ECUgjqYhQx3xEqB/AVbrfYJNwvLhacKtiEFzyBnVdcl/HotDhGXneoQU1Kb
         S0Tsh+PT5KKvRIRRLQv4jNKoTfroMIVcvBc/dpRt+yHkSULOeb92KKloQKT/v2fTNYBH
         p4ah0u4xLdX1PWdp1ODhQfJjsBsqu08nei3d7+akGDTh2sq0QZYJ/sDWYmiTamx6zOls
         ZbEQ==
X-Forwarded-Encrypted: i=1; AL+hErGBeZVageszw9hfrm0M6UDuveAkfsjkUZGQkd1hyBGzqWhcX9wJgUagd/8f1bXqpcU42E/ujiy/jAOhDkU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/H0ywfcI7vgmTZu1GzE/Tfee0yJhNCE7oQPpN+7g6l5bws5mUb
	erTvlwDGjrnLcA3vJbP1e/AiSVkFzYj4g4Ztq/7Gu3AIob+18dJHG6DNY3nAzfTUL0qNPSQjnkh
	XQ61/s5IRk8Gfx+NCgQ+CPE2Aro1CEpbwkleLZCbrcXfCWwKd0ZR9tQkbP0zpmwM+poaSic+CUE
	Hu841uNPFMTDqzpeq14bJUoTboGmwaLIA2282jdzm6JcPIzaseiu5PF224VUxtU0rFUZLkZNH5Q
	ap4K3NC0uiycyE16RUDaAaa
X-Gm-Gg: AYBFou0UYvcKVADk352PzN73EY/LSYlKXCK5RpoDfjT22n9rR0yU5dQ++OkcXXu5vLR
	SWFa1sHRLMXfN8n5hJiutsFyQSCZliLVb9omSPUr9tc0lwSdCP3gWJyD9eszjcs0FaDe0eahj9K
	g19zWQYhXkn9gFnbOFq30Q02nR10r7yDu3+K1EmoBdEFrZsemnlSGMg1WXzt88n/8v+xiviK91P
	4uqhPBAcfX09YxUb3YfSyXdijRURigtbn7hi7tvAV9dgECKWHWg8C5fbjxCwE+jl6BNQ+37XrYH
	wVlI3O76Idld3CslvivS7j1eGJriL11XXWDzxvNniHkxppKeQBoFerZOKy/aJ/wL/4fhnm1BQeZ
	Yx9RwQoFucoPOlH64r7TFB+8eXp3TSrgLMZQ/Q5PFumQJJstJ8ICggFF25Y/USRQVtOoo7ZkhJ/
	6Gk8gyUlOxWJRF/tR+rBSwdNx46hxcyg7JJfgLABRZK+Q=
X-Received: by 2002:a17:90a:c2ce:b0:3a4:7730:33dd with SMTP id 98e67ed59e1d1-3b1b0d3b75fmr4269049a91.58.1794627135943;
        Fri, 13 Nov 2026 19:32:15 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-121.dlp.protect.broadcom.com. [144.49.247.121])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae8da103sm6519956a91.1.2026.11.13.19.32.14
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:32:15 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36d1353fdcdso7016871eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794627133; x=1795231933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a9+SF6U2AiWoeGlLfeemvFEwWPJkSucImk3rldu64e4=;
        b=Fy2luoouSuw93Vm4sW0XrvTz3LfNWmtmcY/mfq3irYjESwtROR771h8HGJsWYecDdl
         TcmBWpbx7NUyyNnn4Fxk1+49BeeUq1/Acr725TExcBwM5W21NX/fmtUprKg46LicgLuP
         WIK+AwiYtrdYuZJteJxoKKgH/RS7N3oFXwLqo=
X-Forwarded-Encrypted: i=1; AL+hErFWJzkXEsw4Nkn8U40vgCWrCExCPI6Wq41BoueY69spZ3gmulLWJ5X6ye9pwGhDg60IbtK/pA6uqG5pzEU=@vger.kernel.org
X-Received: by 2002:a05:693c:414d:10b0:377:678:2309 with SMTP id 5a478bee46e88-37966a58effmr4496557eec.15.1794627133240;
        Fri, 13 Nov 2026 19:32:13 -0800 (PST)
X-Received: by 2002:a05:693c:414d:10b0:377:678:2309 with SMTP id 5a478bee46e88-37966a58effmr4496527eec.15.1794627132576;
        Fri, 13 Nov 2026 19:32:12 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm12851389eec.28.2026.11.13.19.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:32:12 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Tomasz Unger <tomasz.unger@yahoo.pl>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/raspberrypi: vchiq: Fix kernel-doc Return section
Date: Fri, 13 Nov 2026 19:32:10 -0800
Message-ID: <20261114033210.876038-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110-vchiq-dev-kdoc-return-v1-1-dac3e840bcac@yahoo.pl>
References: <20261110-vchiq-dev-kdoc-return-v1-1-dac3e840bcac.ref@yahoo.pl> <20261110-vchiq-dev-kdoc-return-v1-1-dac3e840bcac@yahoo.pl>
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

On Tue, 10 Nov 2026 22:38:25 +0100, Tomasz Unger <tomasz.unger@yahoo.pl> wrote:
> scripts/kernel-doc -Wall reports that vchiq_register_chrdev() has no
> description of its return value:
> 
>   Warning: drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c:1341
>   No description found for return value of 'vchiq_register_chrdev'
> 
> The comment does describe it, but in a free-form "Returns 0 on success
> ..." sentence that kernel-doc does not recognize. Convert it to a
> "Return:" section.
> 
> No functional change.
> 
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian
