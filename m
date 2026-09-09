Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E984E38E11A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788975449; cv=none; b=KsHHHHdIYT2RN0mdGDBQOlVRAsDuz1uTFsVQg50kkxj0edFVOoxaf4AAqhkLv42kJUKZ2iux+5U4iMBcIioe+tAaDvbuViLR31hw4TGUW4BUKkSYApcTTFiD9IknJ5QE6z2k8hOG921pWOaQkXaUuKBaaz6NsI22mTrzVgaIJFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788975449; c=relaxed/simple;
	bh=gllQAeSfz8wD6OjJWJ5fccK3rEpdJJl3i7TSr7C1Q/s=;
	h=MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:From:
	 To:Cc:Content-Type; b=VBjm7Y9hT8DO+WkExgojFSvm0n7k4awlEscIYiUrCq7R2jrkZbpYsdn7aosWN1ywWrLupHUNFnPXg2G/MvzlmRRSVfLCagmsFo7K53HkHBdq7JEgJvNlgdvLrFnJyBAF7RJs/9su9dLYksKrpxVetMWALlfSGb8PhOZBtFu810g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gvuO/HSK; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gvuO/HSK"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso103132a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 10:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788975447; x=1789580247; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:date:message-id:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gllQAeSfz8wD6OjJWJ5fccK3rEpdJJl3i7TSr7C1Q/s=;
        b=gvuO/HSK/9iYthsXgB5bsFybkF6WCELlRFvN6jycMcN3Fzj24u00/ioZ36PivkUnmF
         YqeZWV3FhohwZle0aIxlcdJvY7Qddu0t7uXPM+FVbPUs6c/k1InnWz0YOug5LJh8VQn2
         Rsuuj8tWfVCzZmuQ/WqW5INOiplmvrTshXEVHrxkCk1cNplAxtsEmWTFbHA/dL/llN8q
         xWy5GgYU2qr4HtR9SkqmHGB4Ci+PqgnvMbvp1FcsZDbMfRIMEADD0LbuvY3ceAp+NPXF
         7zF16NTnAOX0SbUlBUAcWrbmqGN3uXCkJu6/Kg6hGIfq0EgJcja1gwoAKzkqDCIu8/lP
         AIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788975447; x=1789580247;
        h=content-type:cc:to:from:subject:date:message-id:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gllQAeSfz8wD6OjJWJ5fccK3rEpdJJl3i7TSr7C1Q/s=;
        b=PrcVtIXAzcj5lZKYkGfl2lSndr5omnd3SPSe0YpzkCJ25x+Ok1IalU97jUI3PiNT8J
         65fC7ehgvTGGz+eEspfFWo15tbUloB1lXIIiFeQaC2wQETzt8EkLVqyrCaOJyNh/58IC
         gnuw3ekX11UkTY4n2FEeIGGk3EmV3oTv0zR/IMb7HiFoMkPOPkriZBoaRb3Zoic/P+hQ
         JMQJCSxfYxHSi5mK7228HCSIIbiyZeLZKHoDcmbMx2rHrAgAF2SEXys7p7kqZM5A1TWx
         2PKReXoYJQjYbxLhbFdZ9aMl19CKkNEW+AUOtsonTEtF53FUAJ2T41mgQ+Wy3hqAs1/o
         UOXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfYQMtvQBKhaSqVFOU+R0QMU5PWd9mSYy39ZDWp+x96JsI8aI4Pi4MB8No5M/2rzNOoulc4YwcDpqxVK8=@vger.kernel.org
X-Gm-Message-State: AFuF++m7Hwd4QjdUW8asKhLwNmU2k6P+d6Ysya88q5lrRiR5G50Ec3vX
	crQAG5ZcYvtsxG+eU9wKky12DTYs/iXz3e2X/y0RG/HkiGLhaS6c9uAjUNy2u0yhsJF/PfZMkJy
	yFG7qx6CKisktlrN4/jzI6BLBClsiulJ2HQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: from pjbpm12.prod.google.com ([2002:a17:90b:3c4c:b0:396:702b:655e])
 (user=rathodpriyank job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:37cf:b0:38f:657:6823 with SMTP id 98e67ed59e1d1-39d77aa1851mr284135a91.8.1788975447027;
 Wed, 09 Sep 2026 10:37:27 -0700 (PDT)
In-Reply-To: <202608260405.gHL6gOJf-lkp@intel.com>
References: <20260824-pcie-lmt-v6-1-bab4ce233fa5@google.com> <202608260405.gHL6gOJf-lkp@intel.com>
Message-ID: <18d3b7b0cfb6fcb1.3137322e31392e39302e313337.965f0.0000sendgmr@google.com>
Date: Wed, 09 Sep 2026 17:37:27 +0000
Subject: Re: [PATCH v6] PCI/pcie: Add PCIe Lane Margining at Receiver (LMR) support
From: Priyank Rathod <rathodpriyank@google.com>
To: Dan Carpenter <error27@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Helgaas <helgaas@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	lkp@intel.com, oe-kbuild-all@lists.linux.dev, oe-kbuild@lists.linux.dev, 
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-kselftest@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

Thanks for the report!

This series has since been decomposed and restructured into a 3-patch stack,
and this issue was already resolved in the v3 submission:
https://lore.kernel.org/r/20260904-pcie-link-endpoints-v3-0-4b9a91bd4b35@google.com

Thanks,
Priyank
