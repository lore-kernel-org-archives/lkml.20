Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8884238E135
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792132477; cv=none; b=ekYeBS3uYw97xv2CdghtUrXRERfidjdIAkNwtm38UYDcRMA8ez01F2yDC3QKYMIVH6re5/2riSHj5IgVZk8rikBlqRr0ICrttUVmc1v+0MPQk0sosaRKfo3UwLfXqx840grkpTG5hB/mSlBRWdl+5eKIUB2KHSKq5rNKfIeZbw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792132477; c=relaxed/simple;
	bh=ckd8Z01py6nfMuc7JfJGjW9DMPCumhB1KgWSdYZ3e0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TnweKVnAswUMYR6NoWDfCpMHeyZSxpUVfDTCr+M8Mwd8bMqgNRFbyiF0ja499jNLcWXasEa7AUOQo/1uoeekB5e63PhkDZGEuKL3D6fCZfvqKMacBsmCLOUA3QAEBYwyejd54bXOV2zWEvhcv8hr0OfFkNTAecMENBWDFrYgJI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LjphkV2I; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LjphkV2I"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3acd4850f40so126069a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792132476; x=1792737276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ckd8Z01py6nfMuc7JfJGjW9DMPCumhB1KgWSdYZ3e0Q=;
        b=LjphkV2ILgevGHXbwcsAEwbzCks+3pGhEr+G+Yx6d7SJ+5fJI3cjg8RXJEtOdaS4yG
         pF9hdemfgU6ESqR3JwqHKx7VHN9R51vfrFFZEGPmr8nYg6q0X4eeRI5ywsjzIr6MpvYe
         XhwR/XIXSpGnhaLY1o6Jfs5ZB40BDmdtkCdyu42r85hI4rbbZTF+oW/uH8KZdTzEQpIf
         Cvx/br3BgF5Cpu3NUFgLfsbkfWC+bm6SWQPlWfDAiRtCtSSWEwXPQtOLeAmviH3UDA6W
         ktCriXMkUxLCcCuQRzS5eCpzNiORSxIl1z7kfb/A6tu+qpU37Cas/xjkE40eNlE1ufDU
         /zHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792132476; x=1792737276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ckd8Z01py6nfMuc7JfJGjW9DMPCumhB1KgWSdYZ3e0Q=;
        b=OzUJ09OaicMc1no0PODb9F1bnvTViUVPQTBAtvFbTF9R8hUiP50IP3FZUSbMDk3iRe
         5E8jBLmk9K4E831t5TbocCM7qSG1C2YFGS9nVZ3J/EcNMyKx6bGN/7koRPKM/5ZrT+xM
         jCvQIThrCE02CG2ifuSmfpb/e+qIvj9Q71kLispNHPssKg/I5ZOqRLIyrtkZBJkC6Llf
         RgpIWoZho5MoG+y4iwyGwT+1Q6+9OoNbcEOBIrajnEuTs8PDdMPCPL+tuTP18/YdwU6x
         q9hYOA77jGt57FZMCVRhNNdifInt/qKJmcoOqUFQ5pTyCg5LdNyzHzB7Jl+RA00QGB+C
         xZ6A==
X-Forwarded-Encrypted: i=1; AKwUvBzA3IAl0Qy7EghrDjD7ICpyFANeDRFbrR+miWuskrQmMIsZT0YsaMuXG/1sMTj3/UEKWLYp6q6iDDS/Ws8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6//CFoDDIV5O1C0jh8GhSXx9453lVaz/8C7UWaldZabuj3fJU
	DizGSKG3EDdonELa5CLlG1tRhp89OMzXYGh6LiqDdxlSayZYpo8uBLVa
X-Gm-Gg: AYBFou2Gf4GjiGVGXn5HYAWpYv4Mqx0dEcucoldPdmzv2ezRn+qDeVoqR7W/Y2bL2FM
	s5W5LtBHH0mDgLEMdyxBOWJfAlcfgQVHC67AFd8cC5e0rYt94KDzbRsKsz0oen2rNs/odemmS9g
	i/LtBk5FY597iUX3TlqysFsvbrXmNatfIOpCltBRqf8fVIRN6Zb3rBoK3I22skn1ZO6CJYN8GHt
	iKtrhiqm8oEyrGmQdT8JBVhULipUcSXd09Wu/7WS/8bnR9Xhix3kQQ91eCCi8K/+Xp9qcBVQBsR
	sM2k7j7G3Mxv2Xo1HdHDWhCoZ+dmMeHjSdkXCyB6EfEGhoy8L2uO4Ygw+66He5edS4OmvZM8fik
	gvgk5iy1Ors7TzfI2dkamSTBswPlmTaLPUIKPS1SKcHdn0/uGEH4UBRCdnoTx/IhSNJQdqMcc7M
	MKPvIntq9N/aPdJZyC5xuGkVZlWxcrtpO2pLT8lfo1Cv0GAsviBqGVi3/+rWMRux3mPO2LGZFyX
	hDQHVP7o/JYikMbo0Dmx+1Ffhs6btO8RYB0
X-Received: by 2002:a17:90b:2885:b0:3a8:495b:d64b with SMTP id 98e67ed59e1d1-3ab3a32cbb8mr16897575a91.4.1792132475742;
        Thu, 15 Oct 2026 23:34:35 -0700 (PDT)
Received: from localhost.. (59-124-112-186.hinet-ip.hinet.net. [59.124.112.186])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac947dfa00sm7678169a91.17.2026.10.15.23.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:34:34 -0700 (PDT)
From: chipang_kao <prozac2734@gmail.com>
X-Google-Original-From: chipang_kao <chipang_kao@asus.com>
To: hansg@kernel.org
Cc: W_Armin@gmx.de,
	ilpo.jarvinen@linux.intel.com,
	corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	scardracs@disroot.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] platform/wmi: Move ASUS platform drivers from x86 to wmi/asus
Date: Fri, 16 Oct 2026 14:34:27 +0800
Message-ID: <20261016063427.664738-1-chipang_kao@asus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <41d6bd7a-e4ea-4077-87e3-e60102ebfef3@kernel.org>
References: <41d6bd7a-e4ea-4077-87e3-e60102ebfef3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Armin, Hans, and all,

I tried moving the ASUS-related platform drivers from
drivers/platform/x86 to a dedicated drivers/platform/asus/
directory. Most drivers compile successfully after this
restructuring, except for asus-armoury.c, which depends on
firmware_attributes_class currently defined in
drivers/platform/x86/firmware_attributes_class.c.

I found that Sean Rhodes has submitted a similar change to
move the firmware attributes class:
https://lore.kernel.org/lkml/ar0DNFlI7MEA8zp2@tzungbi-laptop/

The patch has been applied to the Chrome Platform tree's
for-firmware-next branch, but I haven't found a corresponding
pull request to Linus' tree.

Is this change expected to be sent to mainline for an
upcoming merge window?

Best regards,
Chipang Kao
