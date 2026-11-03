Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793688105;
	b=oS8Xa8FCklFpBU0E6ouJDKpszNKyFLJWWyU2yZNGGnXbWGUoc6mGcFPddH/ra1rW4Saw
	 MSrpbr68yShxFhj91qa8IEHJIgOu65mkndsUm201Qvl7lGmI79uES1mO1pFfGhqAhdW+Q
	 E299R3uTVeNhoXdMYo+Kf/xy1n7T1M6+/gM/XSfcCbajsRoJRW9Yq/mO06oMyJk4R2EI1
	 d4V1c0lbZuv+pUa0cNDzZQP2BbuLLYIo71zmaMBx16wkaoXh14mNmLd+AWPT+qCg1eNbt
	 4PCEWWk5rC/70Hh6kJAIOFURrR4awa5sT6XlYoj4E/MeIv2uplVlfvxE4AIqT019AuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793688105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3GhAdV6YWwOILn4mDd4q6cYiLjqazm9wTfpjdpaNwRQ=;
	b=wdBqUXjoHKVHJNdKnkGULtg84GMGQ4m2Z+yZlufSHxP5xJWBaMLBlcsodLQcELYC+Wkw
	 ZcMjzkyuDwsBLYRB9WnnCtrMCzRLN06v9lvoyIZKQ4dEteq+9n5Pwx3bZVMeuKqt2zEmv
	 4g7WJ1CcewGqC4t7NK5asV9z8ZLxGZncfHOVSNAJ9LnYg8MIXl3Qoxouqs3NeSVnQgKaL
	 m59A/cr6bWoDkaSLutUCNhUeWqDIq8UUDk13RfiT6dsOyeTC39t1qK1POKkCMYJY0k63d
	 dGaETSEJk/XeYSC7ClsXWcXzhbVWjf+5b4ZgQbHEbfDNAeAJYZdyIwJD0D3g2ZhZrMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asu.edu;
	spf=pass smtp.mailfrom=asu.edu;
	dkim=pass header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=izsSScfq;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD79606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:41:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DD79606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=izsSScfq
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15ea896ddc8so6533436c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1793688104; x=1794292904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3GhAdV6YWwOILn4mDd4q6cYiLjqazm9wTfpjdpaNwRQ=;
        b=izsSScfqtaEPi04OrrSMWvX3ry3jlF7A9LPcriwbQpO/4rWhTeZT4pB18nVqdcWZ/E
         AjmrJdC4nUFacz/Vcx2JmSsE9Biu4lGwoy+cZP56fPZxJ9EeyCFhRJKnUwplxJ88rc7Q
         uCDthukfC0wtFudfwjj7b8NuB2EU7wlH7HLHI79kH+lsTzNR+dcIIt5z8n25uZuAaWmB
         hfUPPuay236DgiT+/VtDPz7y/wMHliQhdyoJzdIA6dARpaU7jDLVIKY6BD+wde3CddFo
         qL+J7Ddc2MktG8zns4ZSgBHI74CDl+Fwfwyv3IC52UDajptlFsnAZOCxXtUPZw4P8E3t
         DCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793688104; x=1794292904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3GhAdV6YWwOILn4mDd4q6cYiLjqazm9wTfpjdpaNwRQ=;
        b=KKrF3LCurIJl7mK/K/JFaTWgcpKF6BE40QAAgYr8KdAF37tcvecd2xdcC8GK1UXNFD
         RoKB2Wcyf2nAV+RY2pF8hL4yjRrYJfui2bznLuH06SeDv031IUBsFfQHUjHskzW/JIWu
         oaZZ49fGCQ+NH9oOJaDDUCRFpa5/o9nosDB7qzfnOSXAMER5IaEy1auOaVSCsjVy+saE
         BGbDVpuyIjzYCLCsXNWK//GFfLUV7+S9pXnZTJsHQUR15LFLU3vr7LsygBLg85UnoMj8
         IN+5MwQLGme+NvoxFrREdym+z3FGD87i8xB2VtCYcziTFUyGXoCwAwjsR69397ZKQWEC
         Peow==
X-Forwarded-Encrypted: i=1; AKwUvBz9SvQr7OeJ1sot8A+oy+wjvVfyWjKut432Hf2QULbItjS+3DWXWo+TrnAT/rq2XsaQtmUX2lvutMD3sV4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CZTdy8UTkG/6KDs3bfG3/u6QANwNhzFPtgxnf7PmbhIPDfr/V
	nCdZ/E7R/7IdL+PxVacFppJgeHEj53b08oOR4+b1i5Rqv+3/qoGqCE+eHxKRyg5ROg==
X-Gm-Gg: AYBFou197MDCPOoWzbkI9AXf8tZElYVBbW8f8K7G+DwEZ8Ub8d2f3MlmNFLj55E8EQj
	GiMbtyOAoBkNBJxAJP9vfhoYlSV4pGUiFPkEP7+ecDCUkeHQ3nwhweT9B7VbrZF6LT74PdkzUrM
	BfcTw3qKJfHptHPIaHdiWSzFA0+mjOd3NaSGzcVSQsC6/5RRhxbJccdO8i5b6PPhDLeyOqniN7G
	HKGBCNQux0iilE/GS9MnvxLYEr1ty01xLIIS4ijXtM4F8BLpI6O6JVey7/AkAXzyJBCThPalSND
	yc6UWZ3Zr+rCiuxMbAaw11GK4ViEH4zqfwCvvd1F9IU45IiEgzV3ezASX8/jrz9cdtx9fbte/RM
	XgpnC/Qq0fatrTpsj4opXUqz2t49tgu9ComdrLPN0wpmvI2/mJ8U5jeEWUiW+8xvfjVqYzyCU6/
	qy0htSOKLxS0pj9aT2lhvUuTpWMAwnaLsole29BZwZP7PhTUe7ibufW+ZeRfo1/StUhzE9Zs40c
	9LakMiJXNsMQaf8cwE+l0KDKyXs32P0bNSjosiZVV67b+bqNESjmU5XsIIlhmTjHbX0x3IdnLXB
	KTFqd8/G0iSgjRQeDBtR6kVePNPRdW8624eKPSLztQ==
X-Received: by 2002:a05:701b:2311:b0:189:d6bf:7ec7 with SMTP id a92af1059eb24-1ac5ae39462mr15976051c88.19.1793688103972;
        Mon, 02 Nov 2026 22:41:43 -0800 (PST)
Received: from localhost.localdomain ([2600:8800:1e00:25f0:10b:4313:ca58:9bc1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19c6b969sm38876730c88.14.2026.11.02.22.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 22:41:43 -0800 (PST)
From: Siddharth Mishra <smish149@asu.edu>
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: dsterba@suse.com,
	wqu@suse.com,
	boris@bur.io,
	mason@kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 2/2] btrfs: tree-checker: reject extent owner ref without simple quota
Date: Mon,  2 Nov 2026 23:41:41 -0700
Message-ID: <20261103064141.2224566-1-smish149@asu.edu>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <b2c34370-3a6d-4864-8093-654288885616@gmx.com>
References: <b2c34370-3a6d-4864-8093-654288885616@gmx.com>
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

On 2026/11/3 16:46, Qu Wenruo wrote:
>> Cc: stable@vger.kernel.org # 6.7+
>
> Again, use your common sense other than fully rely on LLM.
>
> Will drop it at merge time.

I'm sorry, that was my decision. I thought a hardening change should go
to stable if older stable kernels can still hit the issue. I'm new to
contributing to btrfs, so thanks for being patient with me.

Thanks,
Siddharth
