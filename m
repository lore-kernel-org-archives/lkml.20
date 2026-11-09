Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794261221;
	b=tJ8om8j1gMeSZPZyntnvNbUV4IHE3f+8qekOBaXBhobbIhFN9oDwPyuLw55GvpxjqoXL
	 W99KgwOSdKHblOUDD6VoUj3Zamd16duozuZnLgS2d0HSahSQAjKls6E0uId1pLNjQ2/UL
	 Ziu69w8ZMYAHTNw6RYDB4sfftJ43sNIyiD7GxJjUX/vhoX21g8+sxe5NNmst+mtHNBHCX
	 yUya0aZ+NxOBSkTdJdO3BJPRn7SX7guYHDxII7TS2g8kdBPq7fqmViCRiyTqcrs0iZbwK
	 AvHGSQRjkldhXcMqeOii72Ap8DpSp+GQXGg1E3P1ndiE1qSs0Rt+9JT9BZ2n9Se0KJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794261221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=rxNh3ezBlJBDubzQ4HVqSLZQeSKGPHcJoMnCtAFhXGQ=;
	b=V2bxQL7BZoYJOxeTha+cyzwcpUCYmCRQ/ZhLLWz07fK20kRB6HGvn+WyH3Zb9aexHQP6
	 xffh/0TMs+i9x1iD7B9rWYDSi7YaF5m7hGs7dV4WV2ULsbAfUAtsALnvctJlAKcGnp1Xy
	 y3h8DfWh2t5dbOcMNdnhvsbmfhwR49eOqE4VQgrnREkMcX+VNx1uq7b0mdmiNr8Tkiy+/
	 RtkuyIBTo2uayEJJKi2GsaMZXFroKVch14RDLhdvhOpmxdpqA5e+/8+hZoa9Zf6hSQEeK
	 0l9keBds+FkA4k2t1h8aQOxA1fv/ea6aGUh7vKtG4LUgbAATrqswTp7Q/q4FgnXry1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="bW/KbGOi";
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3104606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:53:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3104606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bW/KbGOi
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed00709df0so12549295ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 13:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794261220; x=1794866020; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rxNh3ezBlJBDubzQ4HVqSLZQeSKGPHcJoMnCtAFhXGQ=;
        b=bW/KbGOinaXs2YkmP5nmcEDXKol7Ua3Zre6o0EHDN57H8jyUrItYmj3RoeYL+uOC82
         1vpPYTnbYFFyHJ9rAUeaNZ3+GhkvzlCiyb/tcsskL/WqQDjkZ79HhqcIwJD6kf1MBgln
         55Dp685/SX6dP+3HRAyw6lKCrAOXWJHG8hGgFVXoPXHcM7acGl/AQ1YlJCOXomUDF5IY
         sFROaw+1/iG93roJuNb2SRnxXSFbjah6HWvBRrrCQ67xTAnNY66Mv7PNXeK8YO1DQi5D
         3g/gHcNFNku5FElfgYhKDJPK130+ADdUY+psgL+iqWqu03oVISrHFwvf9Tl0S4conRUr
         ru5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794261220; x=1794866020;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rxNh3ezBlJBDubzQ4HVqSLZQeSKGPHcJoMnCtAFhXGQ=;
        b=vdh+9nl7YJp450pQD1JWlwPOzgRTpocv7iS7iES6zAWysfstyUeQJk3v/wMkqK/sKV
         eCgvDx+vGfQk6kWmx7bpJXkkmnUQeFdfhsadpRb0XtJFODewoPZCpW8GhjrHxdAwQfyn
         fNRik0kqg+GaFt+U/lws7dXyfzsatuAHbf8qbOL1UmjEyqw11c1Kh8XuxXptEl3x/RVk
         ygP8l/bqYef86yyxQ8A6HP/pe+jaiXzTf+T8NXwIHNdPua4qBShi4D0Cg2nvYBtRRXaX
         F1gMRBvACi86uii7Ppg7Zi3FZC74yIDkojmj76lB1GmaDjAwEr5Pc7GKPMzTDCVPAnHk
         JbRg==
X-Forwarded-Encrypted: i=1; AL+hErFz1Ok1JiMPxaHRyUf2alnKmC0VX8vDRZTs5pQqvRRdUKOhnnpwaKXm7aECh8WNUpkfonzbusijmB0qjjw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+I9ISo+DdwhTaTu+/VC5WX0ElmNLz1Vt63Dskz+Ahx3RbiM2W8
	lnhEfGk/j0Bcht0WAcdvbW+czzR5nVu6b/Agdkz16XAyfslKvCcyt3WNmXrfVhbCg8csv1v7L6F
	XlQoEd/xEglXJOA1nvWA0qj0MkazWwzvfZw==
X-Received: from pgfd22-n2.prod.google.com ([2002:a05:6a02:6556:20b0:cc9:f7f0:57fc])
 (user=rathodpriyank job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4cce:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-3b166aef2b6mr990801a91.3.1794261219882;
 Mon, 09 Nov 2026 13:53:39 -0800 (PST)
Date: Mon,  9 Nov 2026 21:53:38 +0000
In-Reply-To: <sashiko-outbox-168676@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261012-pcie-hotplug-nullref-v1-1-6e21c2e89ea4@google.com> <sashiko-outbox-168676@kernel.org>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261109215339.1841223-1-rathodpriyank@google.com>
Subject: Re: [PATCH] PCI: pciehp: Fix NULL pointer dereference in pciehp_configure_device()
From: Priyank Rathod <rathodpriyank@google.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Lukas Wunner <lukas@wunner.de>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>, Ricky Wu <ricky_wu@realtek.com>, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 12, 2026 at 10:16:29PM +0000, sashiko-bot@kernel.org wrote:
> While this allows devices without Function 0 to be successfully hot-added,
> will it lead to spurious teardowns upon system resume?
...
> Could this spurious teardown issue be avoided by modifying
> pciehp_device_replaced() to handle missing Function 0 devices correctly?

Hi Bjorn, Lukas,

Gentle ping on this fix now that v7.4-rc1 is out (the patch still
applies cleanly to v7.4-rc1 and pci/next).

Regarding the bot's question above: pciehp assumes Function 0
(PCI_DEVFN(0, 0)) represents an occupied slot across all four of its
lookup sites -- the -EEXIST check at the top of
pciehp_configure_device(), pcie_init(), pciehp_device_replaced(), and
the DSN read at the end of pciehp_configure_device() (consistent with
PCIe r6.3 sec 7.9.3 requiring Multi-Function Devices implementing DSN to
expose it on Function 0).

I intentionally kept this patch scoped strictly to the missing NULL
check in pciehp_configure_device() -- the only unchecked pci_get_slot()
call in pciehp -- rather than mixing a broader change to pciehp's
pre-existing Function 0 behavior into a minimal NULL-dereference fix.

Please let me know which direction you prefer: taking this minimal NULL
check fix standalone as-is, and whether you think handling isolated
non-zero functions in pciehp_device_replaced() (and the other
PCI_DEVFN(0, 0) sites) is worth pursuing as a separate follow-up or best
left anchored to Function 0.

Thanks,
Priyank
