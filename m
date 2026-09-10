Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4315047ACC9
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789040975; cv=none; b=SEXmI9zATM8/bml28C+yvsq7UwNun2Sj9Og5/Y4Vyg66DbD4BsDcdndp5+PiowBEnh4ImtzgP1PARm2/kkhbBQWgybh9ANj4bLlv9xIljTR0uWVJL+Kj6epbGLdJyT5QlgeNyFePVsnqkv9nAO6MH2n+aTZhISfP7tCdYr3oXSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789040975; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eJ96MVvT/P7KivyKlVbNfLTzjZxAAxFJ2Fz5+9Nf5v3SgTKyZnh9ZfvODOw2dBume22ZK/mTVXrwB/02Vq81JNwyc++BSkL9yiOmmIjlzakuDQtQDNNR3htC81iBwU92YJjegUgVSH5oCQBHSt3lA6PWhes2XBKZeETmQp7tz0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMpqcJka; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMpqcJka"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso66771305e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789040971; x=1789645771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=TMpqcJka2KQuxG0qAKpWZfFv6ebd8fY5pG3h1BfeZxsqpWA09BOTuZ9QqLWHJtB9ar
         Ofig8B2TD+K261SrOlYCOxrvNakZ/CAdtHnvDxasg5dLDK8SpbW14k5zLNvBg2VnG2aE
         on/ChJwLTJWY6b2vQTV6Dcovrs12jQrvpING+6JJui29QgRVLsLxxzoqtDCwDEHhlifo
         Q1MEIj5BEi2U4rD2jm6THKkk/J/1I2ATerBYPi32GcenhymmCXp3ufjCdRiENxsU7eP0
         ELaqtaIOV55+s07GeHRMxvHTBmFAQHqXXsDsgZG53ZoF/p/mTycqhGsdC8DvIF3Et0Iv
         X4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789040971; x=1789645771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=EOVlvs9EZ7QVv9yNUH09NmefGpVOyPyYe3Bbq5E2Jdn1uv/WPRIl+5rpaGUcJRTMBQ
         4AS/LBgVe1bp//GANl09IisPUcE6r8ytJF0zHNkCMy3n+kjamdHIoqa0/WIm9x0tsqcS
         TLIKiMQ49idp/7vSSSOh3RSKTg8mK0+gNDRD0DQKMsLgrpTgeBMK37ant2tKVxJ5xzzY
         N7BAsRFD0WB7BdPY/ziSN+CIdyCuOc6Klv13cZSIoepdrk0kmqIyybUkWuNASHUHCEuF
         a+MEl0SMBa/SQNilS+g7g+zNsSymx3mUQlMIuH2x721jpnD69mMJq7c83PJ0fXhug1Xp
         Hu4A==
X-Forwarded-Encrypted: i=1; AKwUvByg0jhGDQyY/J8h9WmY3gZDEwltGYfgxL7GPjEoD7x0eSpaP8lJjdgkqi+3zf52Xgdde9H93/xKcIhXW6E=@vger.kernel.org
X-Gm-Message-State: AFuF++n7HNcXk2Dj+APIkIvIwHJmfOI6W6Mtu/Er8C5vtmbzY5QyvUVb
	dArJGHujznWrlJ0saXQwpWXSaJvXm9H6FnXajQcaqAL9A0N+e1mYXC4j
X-Gm-Gg: AYBFou1UfvV5q1QQCgfib0d9+eshgJSSVAIZmVI7qeHAPX/gM+K65b2JQ2f8KKh2r8t
	NyZP4rj9BHRyKG5uN5atBiV5fUWCBrOH3aM9IvP1vigrPxgYdpQbp8ggLMxfqzHYGyGI9WmUFRN
	G+zmnGhOQQLDj15HUzVvT0ugZr2S2VudS7IgqKY7XWkuSkjhkFoxsAKwZvKpF8dLfJ4sEeW57GX
	Qcr+AacEynHbix5uKoGCy8NgvDKDzQ5lwnABem0VSK7azAZrGKsxCpcI1NAQCPyOrOpvc8Q4Zpk
	k6MbjAhmglC6BzpDl5LHuV7NeSLMpfetcl+UOfROo0XJ+ixN7S155O8YU6LMMGH8az8JXN9Z3v/
	qAANBc4lHqJF38nZwCuz4Gi21Dvz+DDz29SkpE9fMkAu4LQPAwnYx7Ro8ceT1fOJp+B2ragZARK
	Qs/lB3V27foN01yPCwpvVLuQtMCO4fFn0OWknEw6PYwqbG7b1LRPC2C8RPo1jG+futomnCKcc73
	tJF5E4GEIf0KEuYFtybeaakvVKgYl74E/+ehdA5gE/9+Le/PQSeOA==
X-Received: by 2002:a05:600c:8b05:b0:49c:edd2:855 with SMTP id 5b1f17b1804b1-49cf823c411mr438196315e9.6.1789040971053;
        Thu, 10 Sep 2026 04:49:31 -0700 (PDT)
Received: from cachyos-x8664 (159.red-83-38-226.dynamicip.rima-tde.net. [83.38.226.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d1fb058c8sm62353075e9.0.2026.09.10.04.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:49:30 -0700 (PDT)
From: German <germanpapulindez@gmail.com>
To: lsa.uz@pm.me
Cc: andre.gilerson@gmail.com,
	conor+dt@kernel.org,
	dan.scally@ideasonboard.com,
	devicetree@vger.kernel.org,
	germanpapulindez@gmail.com,
	hansg@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Test on another machine and userspace for [PATCH v3 0/3] media: Add support for the Sony IMX681 Thanks for clarifying the origin of the errors I am more than happy to provide the tag Tested-by: German <germanpapulindez@gmail.com>
Date: Thu, 10 Sep 2026 13:48:33 +0200
Message-ID: <20260910114833.4801-1-germanpapulindez@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910112210.44432-1-lsa.uz@pm.me>
References: <20260910112210.44432-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

