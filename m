Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9DD53E2F2
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790079167; cv=none; b=L5omnNCro86jBGvOlyyUKbc4gcBMMAzcFv/JTxvNEqcOpaAIj223TMffKk5fCjIh8XFmC4Tb3/ZtWvgLfuY4/kZLB0a2G+ZiK9ll9jU8dzOuFbNtDjIajUj3VBgjrKwPi5be6D8vN2ArqB7WGOJYxP3L6NPoYvi1eVL/m5XRkoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790079167; c=relaxed/simple;
	bh=QCx53jzyHh0wEL7VJuUKs+fphH56IILmzUrQEC9ChHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EBd8bgCUImVdGWpU3T39lcyqhVL/HdCE6C7x5kcKSSPOXQpv6NcFWiP6aQHZfKsh7HZPIXA2SOpO256LMcH20IRMauCsTi6xLNO/7ZnczGieOm8iqIO0kLKg/6hToIqATM4J7px/h4z3dPX2SikhzdyTkjkM20ZsSDYv10+SrMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KLASV+/M; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLASV+/M"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc46895f82dso51049a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790079165; x=1790683965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QCx53jzyHh0wEL7VJuUKs+fphH56IILmzUrQEC9ChHI=;
        b=KLASV+/M5CYE2vKFvL8CXoW9ga+9eu0KawPkeM6Vr9UiKyD0kBai4cgKQR5Dm78u/U
         JHJJPy1NvUJFXlfwpAwI7SnXQSB6shLOg8tRsUoqxTplzNsf6YJ+wNx4fVQ4cLFNXGc9
         s7mpeuQiVpC4K/etXAPV7riqssQKrDS2wHldEGj2+IGYaOiaiYG+9nTiO8pBq1PhjE2G
         xgQ2AnA+YiGxVxUIUcCRo4qha+RMvwi7tg3mTDWDGoNJXVEwhfph/T0h8xY0ecloMt3q
         8iJ7Hn4qb5UHp5e6TUUV78ebZQVtFCwSsmEK5VEhEu2pmskVE1Wxwe+LxqGh5Pf2vrs/
         0Nsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790079165; x=1790683965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QCx53jzyHh0wEL7VJuUKs+fphH56IILmzUrQEC9ChHI=;
        b=kkJhCWAhP5PK3TLH3QembSzeead5oU+q8VNJWDEIykxTJbBqjjMk0whvNuhe1gErCa
         +Q7DDIopyNmx6TAuiheW0j62wJORrGDzgvuZ3/zbthM0Xbr+IgVHD3rHIBWGcTOTfepP
         nQavXBvFh9Ircrf72Fq+uLfZr5+nAic0jp+IUl+IEAykzfCHxlPdLm+WsMTDS7nmol/F
         fNN+guiwzGEBnIp6w0gw3wtBAsQs13yroM5cysL+FRGL4RAwb9Gh+SLWDI4R3dZJ1dG+
         KGkuKfzt/Z7s1vRUz+cPZLFQfxOYc1myKXBdKU5g6ZDnzG/7XKTvigN1LXQgyoFhYxi9
         55zw==
X-Forwarded-Encrypted: i=1; AKwUvByzxigVj8uQRRztzD+6lER0qQNNSzsNIe8I/5DRkp77V2XWWw/qJNTI8cEebeVaNNHfEZgoMe1J54834ZI=@vger.kernel.org
X-Gm-Message-State: AFuF++mbwdfpl3op0IfqLTnQucN3Q0rj/nCC6aUoLeOdju2Z33qW4hFV
	OKTfZu2P3C5wwLefOEL16icsEKr1lxMR9i5H/jFxUIt8CVKcYlcMGMPy
X-Gm-Gg: AYBFou3Jm3r8TyxTPNWe4mflpZDEuklaFxd3PpOz429zju8ZMHhwPuotgVH+lRa+y3Z
	NR2UCiIww/Mhv1FuAtDobJLrPJgf63A2lwTGgb0UQW1OyBBxoADtB79Of+oKcJP7I5W2JB8bdE2
	u0+Uo28t42/i3LgT3CQ1bHV6WXNKUQesOTrl6WKmr/GSbfuRGFlAGytf7AzdLmDpA+4+721thrE
	kPU8bjtuAbS2MoVrenUnvsoZXor9QtcXrigCvfzO7gpoAqZV+nQpeYTqsIZz9bQfVb74TE0SgaI
	FHTUVEAYo0GdCScl55fZ5e/rYRsNrQs7CCFklZonaEmJeR+7yROEQYVIrhRvY4k+CfQEmwofohm
	YPfhwcSeDw7a6p79Otm/351lFKISHaATHs7zhE7d056XDc61odmNuJk8njYaDHTK6cbdqntHb5+
	otE5C+Xl9eY/5xcQz9/UAoCdNcmr8tcHjZltHPltBU9PrkUefo8obTFXj8zd29Sd3ozQkylQS+s
	LgJa0UfrGfkoPU5y5Y/xTRGwqIKhcMwvpefpwuBA9vq7bCSrT+HbVb4TqkcuQMObY/Y1w9dGv8p
	q/cAaPzTIAK4r+DgpLJfbCxaWrZOCQ==
X-Received: by 2002:a17:90a:da84:b0:3a0:238b:db4d with SMTP id 98e67ed59e1d1-3a0732dd66dmr1810985a91.5.1790079165337;
        Tue, 22 Sep 2026 05:12:45 -0700 (PDT)
Received: from cachyos-aura ([45.112.148.109])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f29d8762sm5091159c88.5.2026.09.22.05.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:12:44 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: size the RX FIFO threshold to the queued transfer
Date: Tue, 22 Sep 2026 17:42:38 +0530
Message-ID: <20260922121238.46016-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922065041.GC106095@black.igk.intel.com>
References: <20260919232647.448748-1-navonjohnlukose@gmail.com> <20260921120526.GV106095@black.igk.intel.com> <20260921170456.53354-1-navonjohnlukose@gmail.com> <20260922065041.GC106095@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Sep 22, 2026 at 08:50:41AM +0200, Mika Westerberg wrote:
> Yes power savings are always good but in this case it also affects the
> latency visible to the user so we don't want devices like touchpads become
> "sluggish" either. Do you see any such issues with the devices when you
> have this enabled and not using /dev/cpu_dma_latency or any other interface
> to limit the CPU low power states?

No. I have been running it as my only kernel for a week with nothing set on
cpu_dma_latency, and I cannot tell the difference on the touchpad.

This patch increases latency by 0.7 ms on the mean, which I don't think
is easily noticeable by humans. Against that, the i2c traffic alone cost
2.24 W on the machine I measured, more than its entire 1.87 W idle draw.

However, if anyone tests and can feel the difference, please let me know.

Also, i2c_dw_configure_mode() sets TX_TL to half the FIFO and RX_TL to 0
on adjacent lines, so a transmit interrupt moves up to half a FIFO of
data and a receive interrupt moves one byte, which is what this patch
changes.
