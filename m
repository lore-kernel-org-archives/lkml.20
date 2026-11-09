Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794261426;
	b=ElU7e2ALIlPDcuNCUvIdk1Tpo9X1dbVltLjjSEiIrKXA3MSOatORfPT/HD8U/WvOU0Rs
	 wfFp6PBxPKn+u7ibWG+pTMqftnBTdPOCw2HEmWEkkNVBTODiyyT/Fv0UvZJ2ye9DgWE/n
	 ygsbOipdyEhCLrsLq1VliE8wsvZdNdnFore3yVCwGvsi/0qaYoCk34MlGh1ko34FOxEch
	 r5Ve7wLowHm8sgoX+dmyAVj2PLixFybLv/5SP1DdhTOk5FKtjzn3B5jzb8lRUPpO1lZv8
	 9/RptF+Lz92Gt6V+KtLAGGJdOAFLigy1KtTvO+WgQ81/um/o4/qJKrMwfzVJPWs7v5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794261426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=fuuQE+0q6aMXMK2w5CQO+HhUEAZWO2YsQm3bGqm9ELk=;
	b=qWnkVa9EddFpUt4GchZg0US6zoWyc8nBi7IJYJrl2wLbbPqa1lUAbLBLDycmKgbgnSFh
	 XIixpuAcqoTwcU+YZ0Yi0rBRqA5L9A4/BAjwyXIFeVKmgC97W4CfkOVGR/mFWiC9Xu5Xb
	 bJE42zy6BhsC+rKSrxoT0cY6u/4NlqnselZo6CSgPS2S6r/+SqKFXjwTdc/mNGD05CwLQ
	 lEKb+i5MfGeQ2a2nidZuWPjZy8ZWCquNJAKRHjVtcqg9z4Wyq/bBRfUXqPVW6Gwks+KKC
	 hayUuORTWH4hP9zRU5cx3eM4E1aDXHAujy5LJYoAyGs7f/hCuZR5eZ3A02BuX9CJ52A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kYTMQDPJ;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A00606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:57:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1A00606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kYTMQDPJ
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed276af91dso23384125ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 13:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794261425; x=1794866225; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fuuQE+0q6aMXMK2w5CQO+HhUEAZWO2YsQm3bGqm9ELk=;
        b=kYTMQDPJQhwibutGohKus/kbWKLZ6wwl14rcPVMl+HKeIaqmPoKFtYYBV3HqOsxZpQ
         i6VFiuZ+6vynKCSSVfxIAw99CfHYt1m/M9nZo2p9kgNo7TlxC0ZjVVw89Fwg3RlVmegl
         k71jEurPdeb7gxYjSZ6tp4dUMeYCi/91R8K+O2L9mNo+jTfxIOiIGkW+v7fzQYqA6VgW
         xhj5r/NSLQO4EZ6bq4E2gHa1k5+/Wf23BBLEgRXMrgoKI2fNk66fPC79IUfGUECRO6Vk
         y4a99a1faO983t1QQyeT6b+pz5JR/44yPIN314H5YpELrTYKMevNoKjRLUlc1x+OYme9
         5dVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794261425; x=1794866225;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fuuQE+0q6aMXMK2w5CQO+HhUEAZWO2YsQm3bGqm9ELk=;
        b=SkBUEdTy6M8V8a/qVKdlz6q4l1CcgXiG5d19VqW5dEVH0fxrLBg12eV/eoWry6jFb7
         DVihLvw2rf9W3Xlymu9qCz57EkOMFNgZ0CLwnzHHjndZxM/DkHuy8eog6UAf4nRbUPWL
         fpH1Nldjnv602IddDEX4fkVycVb3VFJMHUmEypdUvP/wEFpC6vOj3xTS8lhWQrttsmEC
         WYvLrF+VJOWdOXTBqEZyr5af1uo77NTzDF7C+wjD1dYNx2kRpDumey6IHGU0odAJoykA
         Xd0flMV//7sQtb7fbjvf/Bg81G6npseZStIW2DOpxbUT0l7YHoBeIiwHraGK+eeyAAMi
         eryQ==
X-Forwarded-Encrypted: i=1; AL+hErFo7246YLBbkKdslGmqsJRn627Zry9gUpwUkdleslremVCbFgYF7Ft5Zd9z4r75Kzu8falb5FCmAkkwh2Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WQY7FDpcN1RYkJX7OnLD38vyYjqt/YXK79p6DjLDGEQHl7Tun
	IUSM8A1vO1/9mj+2mMu+38vV0ncdITgmu/QMvJjfzTn46VHjcwM5bDvg8092LqdRIhaVl/hhHFy
	UgbtIXp1htGdhT36sKzy0wCdSn/sbm8y+7Q==
X-Received: from plbbg3.prod.google.com ([2002:a17:902:8e83:b0:2e8:ac89:717d])
 (user=rathodpriyank job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f709:b0:2ed:118e:7fa3 with SMTP id d9443c01a7336-2edb91f0086mr5040085ad.39.1794261425086;
 Mon, 09 Nov 2026 13:57:05 -0800 (PST)
Date: Mon,  9 Nov 2026 21:57:04 +0000
In-Reply-To: <20261028173038.292999-1-rathodpriyank@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261012-fix-aer-mask-override-v1-0-49a0d7aeaea0@google.com>
 <20261012-fix-aer-mask-override-v1-1-49a0d7aeaea0@google.com>
 <20261027230853.GA519764@bhelgaas> <20261028173038.292999-1-rathodpriyank@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261109215704.1852183-1-rathodpriyank@google.com>
Subject: Re: [PATCH 1/2] PCI/AER: Make aer_mask_override effective for
 injected errors
From: Priyank Rathod <rathodpriyank@google.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: bhelgaas@google.com, lukas@wunner.de, 
	sathyanarayanan.kuppuswamy@linux.intel.com, ilpo.jarvinen@linux.intel.com, 
	dave.jiang@intel.com, prarit@redhat.com, ying.huang@linux.alibaba.com, 
	terry.bowman@amd.com, corbet@lwn.net, jic23@kernel.org, 
	danielmaraboo@gmail.com, linux-doc@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 28, 2026 at 05:30:38PM +0000, Priyank Rathod wrote:
> Good point, thank you.  Would a shorter commit log like the following
> look better to you?
>
>   aer_mask_override=1 is supposed to allow injecting masked errors, but
>   aer_inject() corrupts the hardware Mask registers with "&= !" and
>   restores them before irq_inject_interrupt(), so aer_isr() still drops
>   the error as masked.  Emulate aer_mask_override in config space reads
>   and writes instead of modifying the hardware Mask registers, and
>   document the parameter with MODULE_PARM_DESC().
>
> I am happy to send a v2 with this updated commit message, unless you
> prefer to adjust it directly when applying.

Hi Bjorn,

Gentle ping on this series now that v7.4-rc1 is out (both patches still
apply cleanly to v7.4-rc1 and pci/next).

Please let me know if the shorter commit description above looks good to
fold in when applying, or if you would prefer that I post a v2.

Thanks,
Priyank
