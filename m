Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AC3449B33
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787918709; cv=none; b=cbBtl2lbtklDzEW6vdUm3J1JsoSTSS+bflrmxaXLaBAY0Rwx+57xuXDi3jcdbMI1jtZU/FOyuEgMkV/dCraH354/yRSOPPW2Y43ejldZhzf/0/AaJ5B4h0cFNm7HkNdnvXE96bFQ/jNHNFGYtrK+amQoqmHo7Wd2PmsWHhESVjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787918709; c=relaxed/simple;
	bh=g7/k4uisB3yiRQCJKrGol/lrSc+9m+nkgTGpTG9dJqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O5so6O/zsjsIdvAVOb4n16heqLPmaw5k96Wi/HHpcFp0T6mCcNa8s/Oy1OeWaGiIgD3DblJAnzHV6blv00T90oF8382UCDomxY1D9RfoP15aIW98rYydXp0HIZnr/do46CmAELpK5pi+lxxH32VlBUAlCQMIHw1sud4FcxhfXoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xsgpn7Yt; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xsgpn7Yt"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7eb1dc6bd53so907785a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787918689; x=1788523489; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lWqQxoK7O394GAzySBcQeCr6jt4vv9YmvdIACmdtGGM=;
        b=Xsgpn7YtNYvW1F1t+i+s/PdkQ27wofqFDAPjvgqNsdY/+Jc/MUoI4D8X+zVj/3rR4u
         kjI2uNCqvK2HI1YYbTAwUyuEkJDXU5kX9cyyIHUpliA4ym8WAMdTi0qZll4c//piBoBd
         Cuq/4GoK/OA18D8D7E7eVgt7OHjXqwiTyL+QxGexhIZ51eSDCbrosszVNzol67MibKmy
         X6e81LpnDCdYZZb8MESf/Cm9i/GR2VEsI/Ty9Rmmm/Q9Db2ig+x2fouec7W7hdwUCZF7
         YUwPsyvWVZdusOF354K0S2wyhzUNgG3s3y2Si+1YMMT6WdSVE7B4xjRLOUH60cYJRNPl
         QPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787918689; x=1788523489;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lWqQxoK7O394GAzySBcQeCr6jt4vv9YmvdIACmdtGGM=;
        b=fDtl0Bp+RU+xsqWdX0qDOCBENSxPUJrARBJfy7tmCgjz4xGv7J8UfvA/sPvQm1jzVk
         Ievz1myT+7qRMmjItCSuTQciPLoJn4/XOQ6GxE7/5QXmX2Z67vMe1M+Xv3e/AJPSnBoo
         MM9VjybgVoNvNsA/27ECJackz6Bq2848foLNkuZ3sM+Nz97W6VfyRrJbeT/E6RCRjZrt
         EgAtOYMs3YWtSelreyFoYl7qSlSpLNMqbZj00cG252dAc7UrN1UuXpcyeRsO31IFmQyK
         z/p45SCL0Gg5jRJDQkIwwNHDtPEM/SsYo+3PA+ld5fkrcmtafv+4o6THstuV/c0QOfHi
         LStQ==
X-Forwarded-Encrypted: i=1; AHgh+RotXc0tGNG6/f4WKCcfxQarWFLoIjv8UBFXaccyO8sH44ByBJwHGerDubiFJ8cbe2oLW6M8WI9Plgks3VU=@vger.kernel.org
X-Gm-Message-State: AFuF++mAlt9ajceZlHZKGftdf6PV895ZL7cSsPGHy5PuNbuNfDiyAowd
	dkeTnfvrrzU+vo6Jhy1EJAIIiRiGcf0AxsDBZBmzx2dN+OTHbnuvDWvM
X-Gm-Gg: AR+sD11Vq1g5GL9hCQbkDoEWc2DRaBMvvSjXDLjiygvM1LHzZWeH4chGR1qHvPJJ8vc
	+MczWeenszTHqyMXyHOpoK9+RbQ8LmjucK9SFwGSSK9kW5IV4td0tu5sU+twFH1Gd+0i2ZU4xt2
	wiMM4X9PVL0bi4qGMfnXEGzQegtkEUjXudtqF9atJf/Dez1FGFLUj20OUwa+2MhVwAhbBteKvwx
	wig2earogoa/gg9iz9XXxKB4Gt9e0pRwMzXnxr3ikxJ7332CtQqEa70ShN/hv+DIeG4k2lBEEte
	Z3URmgGHwk2UCqA1T4isTdXBwdgiPMeVRbRo7qPoR5b0FWUcVZdtMVLAU/dDAvUXaYZVRpcIK7z
	vs5olU9KOrdDAIJ2ndRvHm5gvIVs+E+QBFr68sIoGYyo345iqRTogRz66C4Y8V+qrVCpMytdFC2
	mnSjGFhWKjGy1iT9IhHybA5DXbFCfiaDwoH0hPHJt1cOS32b3LhnD/EmJ9xzBXq31FR7f8VNwD/
	LQZWUjF7JM2ruQL9AZU7v1CB1Bn3A==
X-Received: by 2002:a4a:e7c8:0:b0:6ac:8e23:3078 with SMTP id 006d021491bc7-6b1c6422a9bmr4115615eaf.5.1787918689511;
        Fri, 28 Aug 2026 05:04:49 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:590d:7e37:c87d:136d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f8095bcsm5559760eec.12.2026.08.28.05.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:04:48 -0700 (PDT)
Date: Fri, 28 Aug 2026 05:04:45 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Alexei Turtanov <9alexei9@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] Input: atkbd - skip deactivate for Xiaomi Redmi Book Pro
 16 2026
Message-ID: <apF5WFQU9LPM2lYL@google.com>
References: <20260828112239.18081-1-9alexei9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828112239.18081-1-9alexei9@gmail.com>

On Fri, Aug 28, 2026 at 02:22:39PM +0300, Alexei Turtanov wrote:
> The internal keyboard of the Xiaomi Redmi Book Pro 16 2026 (board TM2425)
> does not work: atkbd_probe() succeeds and every command is ACKed, but no
> scancodes ever arrive afterwards.
> 
> Testing on the hardware through serio_raw shows that ATKBD_CMD_RESET_DIS
> (0xF5) is the culprit. After 0xF5 the embedded controller keeps ACKing
> commands but stops delivering scancodes, and neither ATKBD_CMD_ENABLE
> (0xF4) nor ATKBD_CMD_RESET_BAT (0xFF) bring them back. Only re-enabling
> the keyboard interface at the controller level (i8042 command 0xAE, or
> rewriting the command byte as i8042_port_close() does) revives it.
> Running the init sequence without 0xF5 (0xED 0x00, 0xF3 0x00, 0xF4)
> keeps the keyboard working.
> 
> 'i8042.dumbkbd=1' also works around this, but then the driver never
> writes to the keyboard and the LEDs cannot be controlled. Use the
> existing atkbd_deactivate_fixup quirk instead, as done for the sibling
> TM2424 by commit 3a046db33bb9 ("Input: atkbd - skip deactivate for
> Xiaomi Book Pro 14's internal keyboard"). Tested on v7.2: keyboard,
> Caps Lock LED and s2idle suspend/resume all work.
> 
> DMI: XIAOMI REDMI Book Pro 16 2026/TM2425, BIOS RMAPT6B0P0909 05/22/2026
> 
> Fixes: 9cf6e24c9fbf ("Input: atkbd - do not skip atkbd_deactivate() when skipping ATKBD_CMD_GETID")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexei Turtanov <9alexei9@gmail.com>

Applied, thank you.

-- 
Dmitry
