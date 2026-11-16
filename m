Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870454;
	b=xOCyGnB5/mGB/7MWyHcUZIREP9UI5gcEzaQFbBNegaqdxLGorKQKsvAc8woO4tYlBmuU
	 0dBT8RsFeUrHcmavZlSIbzKYSzJdlRe7oYdqjc++LI9QHkjvCMWo0zmaya0HBL7q4j5+s
	 1/VG/sxGQfDHosuJSTxNTQKr9FyDd615c0XPtg5Pr9MG5S04w/YIjtpaiSQOFDv1CWH7s
	 dyu5VaQSG0e7u7eXrshdtKRNrTktLJD4y4gdZY3sKa94XKj8+YneOWOoW62+vd8ilN8Oj
	 d8WVyQdqK4q5uFN8NRGzsb7UX587fZLAiJhcsLd2jOGOIfIk7m+CM47+Q15tfdf44EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870454;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=hpknOOfaXRSRwzsy+zJvYqiC8yonJsdMZo1b7Unb9Gc=;
	b=ERo6008YOMrJbVNstCV+Raw278P6FQVqtO+dSFIfC0YtUmTZ+py/9yulSWjY103OBE/k
	 IJXg5TYEqVdzwzXvMTueKR29Zuet/6jkiydTRurHrRkhJ/oaEcf2uYhm1DyUIjKMUw6wW
	 8u4rOpZwshqUoEvcPwiBiwzkeWWaO8+KLveq3GU52PchNy6Yh+UHwCQ5S0kcXHDavxUZV
	 reH8h4ddCPEeL3+vKtVAhgNgYSrdatpQb5/E+kmzXk4+wRxmSgz/gTAdHee95Z/2jJwz2
	 4/hKiu5GZDRQWNRyfrgzqSa2iwcZ5kk1oF+xz+Oqf3lXB7dvti3OdMR007oF6uJ5TMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="bz+S/T5b";
	arc=none smtp.remote-ip=209.85.217.99
Received: from mail-vs1-f99.google.com (mail-vs1-f99.google.com [209.85.217.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3542606A8AC
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:07:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3542606A8AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=bz+S/T5b
Received: by mail-vs1-f99.google.com with SMTP id ada2fe7eead31-7cc013095d4so1215792137.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:07:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870452; x=1795475252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hpknOOfaXRSRwzsy+zJvYqiC8yonJsdMZo1b7Unb9Gc=;
        b=OUg2oG1Q/fY4bGZ6Jlnp/YuOtoGKf24n0U+X7qRh2eTdkyD31GWdP+GMHr4mJBYQC2
         /VnAX+Olf0moDVrpM7V02GVLG2B1HBtu6YJLSWXOK277EtawAHrzmZ916aHYTQlRzTvE
         B4BzNauDHL3qYirOpXAGf/pp+F2xAbiIBpdQBTq6zS3RbzTJ1JLaCuaHyx7mJmM6HYZf
         1u0lSKF2ucT58/LCUTKBI8LqAC+vjDUMvQ5fznC4inzHvHH7m6f/C/N14CsKZvcBEUEN
         TsxhoYL2y9Gqzz3ez436t/AFnDwZB9Z4T9Na5LyLRDa4e/4RnBMM6NVQMuSlU+847jaD
         8uLA==
X-Forwarded-Encrypted: i=1; AL+hErETjrjSbgj2pnsbcp5e+iMRgVtKL6CpXFQzMnHyYiRw5nYk2jkrmW/xQrfcjbrZp6YzvK3jbQi3y5bKJkc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Zukpf3XdRXTMX+VljSEqPvmrTMpNy9CEbJjSJndUAH8u2m6vV
	IZJm9fPQp4LluPX34dkw/rHBZjIgLlmkFeNxevXU3IPH61QbuYcmdJazl1uKnXXWA0flUEMZ0XO
	CHpoIeqF4C/XT5n6yMHB4Um+v8u9DBsEdjAj2jNJ3TI/j5aFkl0/fgCch/HW9MBpdnsmooWNlXb
	/xdPTpkrwuL5VKq+xvuH5GQaxx9GyNNbOp2hVlK8l2AEwTLEQ1QoeQ9Y6CNjCSZgQYvmS/mwk6D
	70powhoUXoDSudqGidy3ef3
X-Gm-Gg: AYBFou05ZKwQ5jo+TfltZPcw0e/GmoYbpdBMxi7gnI2unzDHUjqTgO+HAjmeL42gsD+
	S+Qgczt0UHbff7HWYhyvcQVlQoWDlwkb+SEUi95bwVRuTGWAWQwNktC6EBITvJNN9RR7cZWn3IM
	X/fug/von3ReTfQhVSTSRXxQA31C3yDKe6Jt+EoTKuy2F9cFqJDT6+QnMWK9oZsQDXwYyIlxBVy
	ndJtr9J7DNyy34GxuKeEo0go3E2ZzUh0EG0KYhSc/IAQzHnYMucuFQSsE5SWtXF2VImxOXXEIRC
	Z5mMDeGAObSYQkfMP3IW6vXzhcw+yGsNMSvO/W+sr/04/PoZqgdbRgS/XX1LgpetPoKlfq45sKa
	ckeKKXwu0bsps0aqispGd9dTbiDxnUIwRnogHEZrNy81Q8EYwyrdIAtWPRKKSIHnxYh17a+sty7
	EY8LBgk0eHlInTDHGddCHlixR5xk3kcgvfgEEYZg4QiZQ=
X-Received: by 2002:a05:6102:508d:b0:7c3:fc96:fbdc with SMTP id ada2fe7eead31-7d64db4c716mr3569847137.37.1794870451786;
        Mon, 16 Nov 2026 15:07:31 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99e338490a1sm131060241.10.2026.11.16.15.07.31
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:07:31 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-378722fd4a3so4467570eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794870451; x=1795475251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hpknOOfaXRSRwzsy+zJvYqiC8yonJsdMZo1b7Unb9Gc=;
        b=bz+S/T5b4m7RmKiP2V6x+lQ6wlTBfHetGQzkfrGFU3k6CZSHo6ToHCqEJQ2wk7MZQX
         qGZkCka48Xi29FhZkM4LSDNcD3w7Z9PyesawwfYhhMHk6hsJ7SZz/yayR0lSUC/i3bVr
         0EcoyACWqbkEr5qIc7DRHorY2fZfCjhMMd6nE=
X-Forwarded-Encrypted: i=1; AL+hErHjN8KlCl8N4y1M+KFJfOdLzmOSaZbAO9wt/66n3HaU9f9ifetaYa0k1w6beSWCfW1wLNKFCpto7e7TarY=@vger.kernel.org
X-Received: by 2002:a05:7300:cf8c:b0:369:f70e:bd40 with SMTP id 5a478bee46e88-3796628f4c8mr11453316eec.16.1794870450454;
        Mon, 16 Nov 2026 15:07:30 -0800 (PST)
X-Received: by 2002:a05:7300:cf8c:b0:369:f70e:bd40 with SMTP id 5a478bee46e88-3796628f4c8mr11453300eec.16.1794870449743;
        Mon, 16 Nov 2026 15:07:29 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-380e031f3e5sm4677314eec.12.2026.11.16.15.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:07:29 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	"open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" <linux-ide@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:BROADCOM IPROC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>
Subject: Re: [PATCH v4 5/6] ARM: dts: broadcom: Use noncoherent SATA DMA on BCM958625HR
Date: Mon, 16 Nov 2026 15:07:27 -0800
Message-ID: <20261116230727.1490184-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029212513.4126083-6-florian.fainelli@broadcom.com>
References: <20261029212513.4126083-1-florian.fainelli@broadcom.com> <20261029212513.4126083-6-florian.fainelli@broadcom.com>
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

On Thu, 29 Oct 2026 14:25:12 -0700, Florian Fainelli <florian.fainelli@broadcom.com> wrote:
> The AHCI controller on BCM958625HR fails with the dma-coherent property
> inherited from bcm-nsp.dtsi. Soft reset times out waiting for the first
> FIS command, subsequent engine resets fail, and the disk is not detected.
> 
> AHCI allocates its command tables and received-FIS buffers with the DMA
> API. Declaring the controller coherent bypasses the cache handling that
> these buffers require on this board. Removing the property restores
> hard disk detection and operation, as confirmed with a diagnostic DTB
> that changed only this property.
> 
> Use noncoherent DMA for SATA on BCM958625HR, matching the downstream SDK.
> 
> Fixes: 56e2ff0346a3 ("ARM: dts: NSP: Add dma-coherent to relevant DT entries")
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
