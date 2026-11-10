Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794270279;
	b=4b/vuhsefGztB8SZ04KYvK42m6TtUUxL1sHa/NSMOQI6MxWPNBz3p6NlxN0bm+dKuynl
	 dAGrMlXo4SWs3wKQvGHpq+O+lIcfUbNPeE30NcvqrbVFqk4bnMnc7TOTQLZHoXXXtJ97E
	 y21lu+YwHfbK7LDBt1Ue7LnHAiYphKteqm8ZXCFreYv8s6N/RHjOmOtCldffniTd1wPtZ
	 6j5/txVnL4CNOLcBbvmfn+unopjaxyo2ONRweVuurbz3FFhYUI7q4SicijkZ328xl5l4n
	 FfxGqHsVH5G5k4D/e0UBIu5e0lrZ+lhmpbZc7wsums+qCqlGpnU1PIwey8Wy2RtL5NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794270279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=8R6psPcEpcxXBloXv1H5EoyGYGx6PRPHPE+vAtNfv8Q=;
	b=fikTF5Vc+jwgtk5lmMq0Mz3rzuhSh44LKzm1IdQYdw7xDQ/aCkCqihcrxBMs+jMh5QZb
	 I4ZzK+LnQUyjvOqisz8n/WdMOAIC/WdWfoAXkA9LcnZdA+sMsc5ppaRsSxfhewWZzbl9u
	 fX88aS4+MnhlcZAhEc2NY4W3zBiCtNLBb3BGk93vDxiQU3u1Y5FszeN6hlvvjohNwnB5b
	 mcATb2h2jq7iAPaLMnMRttyFR5wVZLGuRKeHM5QtjOpmMZrbmUf4mddq2eMlA+05FjfRN
	 TchVq/EJnQvUrgnWJTLYo4h+wtVziV4AToSCLbjfyJnBHQ3EAacaM1ip0lD8v5+nuWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TuVRyzuW;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CFF606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45CFF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TuVRyzuW
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e954d87b48so23370075ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794270278; x=1794875078; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8R6psPcEpcxXBloXv1H5EoyGYGx6PRPHPE+vAtNfv8Q=;
        b=TuVRyzuWUgVcsf9lNq678ixAFJhPOzvFG4t3LRHWBAlBem5Qaz6FmOVOsmGd4DW/L3
         WU+Kwj6rfd2umV9dl9/VTCpXF/I9sEA96nbYfl9Oo5RqfmALRzU9IMLvz0Oh2MF8S+5r
         +ZW/jM1G9O/WQVZme8EkVhftOC6lEUr4xRtvYPDvHvmL00PopnsM7nOyymLOgvQM/RnX
         wLWpWi4iOC0GVGlmhfgGdoSlR9872llOD8o6fXNDODhkDXS9r5lTh0uAoht/UuGWphZF
         Etf2c57hXs8kdFp4LjsVEqn9ikfHPTPyqnkwYPPvRGwHwZi2QwpE4jcn6alAxH2G7jX+
         Dc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794270278; x=1794875078;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8R6psPcEpcxXBloXv1H5EoyGYGx6PRPHPE+vAtNfv8Q=;
        b=HTWAvi/Ya6SeXtEn7y1xpNWkWeHiheVOeN47FY+GWeKe9r6gJwwdBAPzXWkJ0KG5dy
         yXfB9VwfXbPe97HEtZI8HfxgOeBaU0L4ucaTpYe8ZEwSnr2/mc5k4Iiw3M7PVDMv17sO
         4mV9h+X2KAv+LgL4y7pNE0dimfVK91K82blCV7/eC8CV30NsGFCZwrQEXg9BFe1Yint9
         6UmCTqW6vNy1tQSoi87zzNjqBVj035hXUPlKUvJOm99bpii/qRz8d1qI/noA30OE+F1s
         B92U/d2DG8Z0gDwqBGmgQiplnWKtLYcy8E/l25dcPDZ0vzDgRvc8QWe7H1Ze2FaBKViK
         dZuA==
X-Forwarded-Encrypted: i=1; AL+hErFmZaoLdXjhm3pVmkczNG1xMng+OHStYtdglko0e9RkeudFGNDEfExBsxYU/EKRPHzkfZyEUc/cKFtIwtU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BM/sp8JEqpBwkmk5N/5bYq4L9bXXT5Ab6M0L+DLOA+BbF7idS
	SySSsjbqxTYlhjfbmCWBWwPbhpiiYGm4e+cPKylOaDAwDw+P3hAV6mK59hJCaEKHrcUqjxfZ+l5
	QcEkLEGdnD2c4NcMJTQpJMEYRGguKRrdEsA==
X-Received: from plpb13.prod.google.com ([2002:a17:902:d60d:b0:2e9:6468:1ffe])
 (user=rathodpriyank job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2302:b0:2e9:6f2c:71b9 with SMTP id d9443c01a7336-2edb8fa3768mr7596535ad.1.1794270278310;
 Mon, 09 Nov 2026 16:24:38 -0800 (PST)
Date: Tue, 10 Nov 2026 00:24:37 +0000
In-Reply-To: <20261012-pcie-link-endpoints-v7-0-36aba9c91f10@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261012-pcie-link-endpoints-v7-0-36aba9c91f10@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261110002437.2376944-1-rathodpriyank@google.com>
Subject: Re: [PATCH v7 0/2] PCI: Add Lane Margining at the Receiver debugfs interface
From: Priyank Rathod <rathodpriyank@google.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ilpo.jarvinen@linux.intel.com>, Lukas Wunner <lukas@wunner.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-pci@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bjorn, Ilpo, Lukas,

Gentle ping on this v7 series now that v7.4-rc1 is out (both patches
still apply cleanly to v7.4-rc1 and pci/next).

In v7:
  - Both pcie_get_link_endpoints() and pci_aspm_inhibit() are dropped per
    Ilpo's earlier feedback, leaving aspm.c, pci.c, and
    include/linux/pci.h untouched and using the existing ASPM API.
  - Retimer receiver discovery and margining coverage (receivers 2..5 via
    LNKSTA2) are included in the pcie_lmr kselftest.
  - Both patches passed Sashiko review with zero issues.

Please let me know if you have any feedback or would like any changes.

Thanks,
Priyank
