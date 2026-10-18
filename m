Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F89B23394D
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 02:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792292352; cv=none; b=dMH2oWMc7Bg3IAPvj+5CFFzeEubkPg6s5FpXV36iR8i4VVanJaD9PSvQG6TyvxaKT88AHKpO6KxiLsGk8u/kfb8lw1fFkf1o1FvEjHCLx/BkweQrwMLUTYYfCtmusQpMYTOraQ2JByXb4IMxrGys0gBydIvY8j3hZJMraZHKvPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792292352; c=relaxed/simple;
	bh=xOT2xhgG4HvHxboNomCCB8zMtEcw47CfY+5UMisvHbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A2LVpRGnPzDYd7zswl9tR4/cQo8v1XBIvfPz8H2BC3gSY52dujzOajWbw29ILHLm/n93olW8hZvqC5XsVj2TfoSM2oaEUHP1wDJa/J4h/7IpNnrKvgDlMaxck5Mr1drbL1bi+fbs2aD3DjFqsEQ33t+emBuvdnBjH89szr8XVHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pr5DoapW; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pr5DoapW"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c4be28b82so822513f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 19:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792292350; x=1792897150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xOT2xhgG4HvHxboNomCCB8zMtEcw47CfY+5UMisvHbk=;
        b=Pr5DoapWgRT9SxZuQfvGgKwDD54Bgj9H/lkAtLlLj6X8Y9Q35ZZtTG3XYeU3Z2gAeY
         j0/KjqBz0V7YKSls9+VcsGJgoI2mnFbOSL6rqcJe0VYQ1ew08YpY20sowe+XlLawcKMt
         AISEQ0wo7p/IxtUfSXUza/xall1bFEz7g1o31SAFuYt4RUz2L9fyGkUTELJ95yr4NPGI
         gagxKmyQVSB3MWRdGX80thzFoVd+oRN1lDlYowAnvVo8c2Z5cuesWnD55UOgMEhNdCYd
         Lo5ui0TQMSRrez4N61wbNU5/7oYqsn0wvTlfEjr9+jOnYvXYzPm0LxDeB/HTQz/Z0U5v
         Pbrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792292350; x=1792897150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xOT2xhgG4HvHxboNomCCB8zMtEcw47CfY+5UMisvHbk=;
        b=ft5K/B2MW6l/oLS3XW3pqcyKaCQ/SO8v0NO1gihkDVacd9f827GwXCsWFzzfYGHsmF
         rxSEdrmZTrvE4gDCtNaTNzpJR2bnQShco0AWPUYj9eZWxuiaHIemo5cCSj8nFHt9j8Lj
         Dcl9iNJNZ7/+3Bu6uxmAx/ZD19aHzLckwHEZd7LwHZivtHMxlns6bBFjGqe5Otlq6V3R
         S24ImPBCDslRepw4iMR/qhijVNiP5frVl7EblFpThFYKdWX1vabI6rsVUYz4LGCr4w/f
         Mx+26sWzC0vIeA5rtjiGtbnq4abhPlzHICcgziIYOIdNRKSnOVMQGIOQNW7e2TmH1Wfr
         WAUg==
X-Forwarded-Encrypted: i=1; AKwUvBwqe8UapjLDQudFq3gNzq1GuOb8NtUsjkNteeDd4lvKXO43EM1Tzp/bLSy5v6X/KrPQbDgu59oxgTU4Qms=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7fvuwtuLmwEx8yFVeAqrQ5+sg7d+fySBFfVD3dFQZYeydJLNE
	PoLetQjRBT6dVBi/xbPqIonh5K1EJ9Ff5a0DiUmiiBh9TmSVtB8T4EwO
X-Gm-Gg: AYBFou0Aw1lfaMunXakoGkeFZW4cAVKmY5hgy/u6pozXqhgKam+PxzoUg7IHc+vJ1X0
	dvSXs0h8QzOjcUKBJveDdiLAX0t3wk+lA2u97QIi1Bpwx1tXNAlIzACPgsEufTXgxyNbUM4NPlE
	CEDlhLlFMmPW23hCKLA7NAKX8GLkjTbYa/zafznO6Kv6gmdebX+bcQNdmXegiQetvzekC4JJZ30
	AJKUhgNxQdVK5weFttHZrEddv0S+Fgxe/J2FQ9/bI/+c9Ftj+2oz4WAXsAAH9uRbMn7vobGQU5q
	8uhJQCeKXINFJjxsvJyrkfneebETgdl+ByrmE1W5iBH+2ydMK2bpmXaSqIPATsQD46GJsWOSPXu
	vuNXLjYNAZ0g0yJ+ra56CR3bOzPYhG3mo+zz35Fn7IfvDr9srNnUiOyrREhcj+Ix04ayYt9HfVm
	jTReeoVakHS33uczs/Y/IqdtK9l4UVQoR9ECtk7c2xbeeMIJpv31qLFBusQcP+ER1PtaIND0sIa
	x2ivt4H7SAjzIxph3/LqUocnEegKV9P3bRsRxKNVL4wMu9yZ2qhHl/XowvrKTf+rEMpWQ==
X-Received: by 2002:a05:6000:2c0b:b0:48a:f3c6:7bfa with SMTP id ffacd0b85a97d-48e07fbd825mr6459320f8f.52.1792292349489;
        Sat, 17 Oct 2026 19:59:09 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8bd9sm14785161f8f.35.2026.10.17.19.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 19:59:09 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kazuki Hanai <hnkz.64@gmail.com>,
	linux-mm@kvack.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: Re: [PATCH v6 16/39] mm/vma: only allow mmap to clear VMA_MAYWRITE_BIT if not mm-managed
Date: Sun, 18 Oct 2026 03:59:05 +0100
Message-ID: <20261018025905.201296-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261013-b4-mmap-prepare-vma-flag-sanify-v6-16-1aa3c9b139f9@kernel.org>
References: <20261013-b4-mmap-prepare-vma-flag-sanify-v6-16-1aa3c9b139f9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Lorenzo,

I think one site was missed: usb_stream_hwdep_mmap() in
sound/usb/usx2y/us122l.c clears VM_MAYWRITE on the read buffer since
71c610aeb177 ("ALSA: us122l: Prevent write upgrades for read mappings"),
but sets neither VM_PFNMAP nor VM_MIXEDMAP (pages come from .fault via
vmf->page, like the PCM status page in 13/39).

So a MAP_PRIVATE mapping of the read buffer, or MAP_SHARED on an O_RDWR
fd, now hits the WARN_ON_ONCE in mmap_validate() and fails with -EINVAL.

The VM_MAYWRITE clear is a security fix, and the VMA must stay
expandable for mremap(), so converting it like 13/39 or setting
VM_MIXEDMAP seems the way to go.

Found by code reading, not tested on hardware.

Cheers
