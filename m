Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180183;
	b=Ukc/fShBVFssrmbnmRcQ6vN2MLrx0w0mkEhZfj1ILAQTiDYC5nWlYRvn5Ermg/pAMrrw
	 430oA06r/YOBMC5exFWXlc/3RxHrBV09WoqURYDxneyfIZaG4wCOO2vLrc0K9r/pskGQc
	 N4dJjBZoaCOXXJk1wtj0hOABSuzLhwQhdq2/FtZ0ZmCCQ7zOkpj657SCXcsD8xR49o7s1
	 XNN7IuX/yhjbPIlgc5+66HsUtH33mVGkFzJHhUdxVRhFGaCbF+l39citj3Xs5okISo86t
	 cLbWQtxC1caDoR1MXha8o5pqr4wd7iBc1j7Rq1WeyjzNYHH3z1qZg0/nGhoHt7xMM8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180183;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RasCjunpCh/NnC9QmLv8I/gSUP58pKx7xFWImX02RhM=;
	b=0HRyfeO6t0tVPz3eobXLfPuQU+C42VeoIAbwlPo+hqZbB0MX1g+v1G6kO7bu5VhEIpTq
	 EzI+5OQ3FFxLVg1T29nBC9JjcF7W3nZ84xEiYyrMssnerF21SuwcalO2FCDC7ha9Q7fBf
	 RUg/P0b1DjIy+oON65e/VzxOpHs+vX9KwuPtzkeVqgDNAtw7dlJYwYOHBHF3gBu61YoA7
	 jCWioAnD9NQm/m1aPKHSXTDx3juvb/W758dlnG/AQLLrNlD1K14QXWe96rVbu3QW77jHh
	 WzPbChhk5nc93X/IdsS/s7VCvGkT7jntc/DEoCEPU1+DBrDgFe4RSRJaRN7SRDXxn/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IO5fdKi4;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FC2606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93FC2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IO5fdKi4
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so8899985e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180181; x=1793784981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RasCjunpCh/NnC9QmLv8I/gSUP58pKx7xFWImX02RhM=;
        b=IO5fdKi4z0OLJU7M88/lVVb6oujx+gY8duIyBx8erfI51FuYBuaXd1yPV1ZBI7NoOg
         cFY0Q9LmITOxTsPeS93gOoaQMCziY4PA+/tncE48IFF9LRHTnwxXwMQSi1gc07DrcAbi
         +US+GjuAJFUTxb7VS9qX69A4UheQ8Tgm1cVq+w8nMetORtjcvnGD62cFm6SRwrBbCKL1
         g9UzJ8T5x2+Vtp4TIh5aYPMoUosdmIv3WRAbx8W3euHH7pulvB1/YJ6i8Awr7pYR/oHe
         c4lRhn/5iZk5jZALIdNkyQ6p7gvoh5Qy/qH+OqYHc3QhTOdURJfLl3LX214CvBTHizv1
         US5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180181; x=1793784981;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RasCjunpCh/NnC9QmLv8I/gSUP58pKx7xFWImX02RhM=;
        b=brRs7NBoeaZd7mujALn+jQIK3da1AcsWZcVEp+40c67gEjwuYEkCeJzWOtOsIjYxov
         9GMXEoqcliGVR3hAGaevAN/E/o3AaGhp6U7LbkpXrMCBUpc7C/gsWVwEXlJqIDuSutlR
         gONmVNnb3fgEslSFafrlsWuBK2IKo/hUqQcfT8DIgWrO2Dds+k4Q98y1YCJea+4shf6Q
         mJSpJhspCPQoxnfBj+qDPza/7pdY6YCRtOZMbhEjRgCR+dGl82cjMmh9/Gd7L14F+d/2
         RT7CSSZrtm877g9GhBAQ8ijTksUPIThGBP7my+92zYPHPpP9LTBVbF5/cHtJyZWQxSol
         zl5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzV4dyU+9OypFPEw7R98ChQ3xWOR3Z6e8l+mMfqeGu7gBpW5NcLIauu8phB94Ij+VBhLrVHx8jiJRw33VE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpe8vpIF6OielJALDUtoeyyIHJGzFuHjY8L/F1bE4/Sa38M/wz
	L27fv59Aclhef1re5yHNDNa1M+42qWb5bJX9w9RRnLCctKMpLwHsk1nt
X-Gm-Gg: AYBFou3+rWOO1+9dsuI1sBnYmdbByL+0S6KV0eJYkBTjcgflewVHMfTPdMV3Odwg8Fb
	Qu3x7NUn67FehdinRn4getat7h07VFbrd8Ib3I0EMsOpmp4vZ4yGRIEVs1MZIjvbiCdYwOURULr
	ENQF8CWkC5ycGiqmbSFnnBRHPUH0kQdNGYoKJWr61cxPNAOfupdZD9uNk2MDsafEnkbb/DeE8y2
	24yBnUz01+s2bvmYNXJ7S1cHq6gJjZUYL1xrEeTt6zQaP6wyBaPkF66EHfIEWV+keva1pOOwQzA
	3eMGwpZDlkP+7J90gikSyMzsqFmXnws7m1Z7xk6M60mBuxpDPeCrplull7B9iNuqjjB8txReAvR
	TN0SDIiSa3CLsczCzo8bZgB7vYW15jI5Lk4TjXI7lC0u7Q8YDc3GZXkC+/n8l6ZLE+57In0qLH1
	lmnGbqxJbjdSSbESvaZN4LoSydFHAYD632U97P4pwRtfm0VXM74u9QWfYwZoGM099VEJ7bw1m1l
	uqFoyAqJ/ryWo+mJUVBo6rxkK7nqTu7g3+dvMpVmbXNe0jYNg30taVzLl2SlFryhKQeDyVT5sKY
	42S1J+49I0c3D0GDRo/oFMEkgkhGrWFclu2qQg==
X-Received: by 2002:a05:600c:609b:b0:4a9:2a92:231f with SMTP id 5b1f17b1804b1-4a965ec941cmr33454985e9.7.1793180180835;
        Wed, 28 Oct 2026 02:36:20 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a9ead8aa0fsm5886335e9.4.2026.10.28.02.36.19
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 28 Oct 2026 02:36:20 -0700 (PDT)
Date: Wed, 28 Oct 2026 10:36:16 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: wenxiong@linux.ibm.com, mathias.nyman@intel.com, Bjorn Helgaas
 <bhelgaas@google.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, wenxiong@us.ibm.com,
 linux-pci@vger.kernel.org
Subject: Re: [PATCH V3] xhci: Reset TI USB controller on xhci shutdown
Message-ID: <20261028103616.29110069.michal.pecio@gmail.com>
In-Reply-To: <20261021160608.8229-1-wenxiong@linux.ibm.com>
References: <20261021160608.8229-1-wenxiong@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 21 Oct 2026 12:06:08 -0400, wenxiong@linux.ibm.com wrote:
> From: Wen Xiong <wenxiong@linux.ibm.com>
> 
> Fixes kexec boot. Without a hard reset, TI pci usb chips will fail to
> initialize in a kexec booted kernel.
> 
> Signed-off-by: Wen Xiong <wenxiong@linux.ibm.com>

[ Adding linux-pci and Bjorn Helgaas ]

I tried to make this code a bit more "proper", by moving the
pci_reset_function_locked() call to xhci-pci.c from xhci.c.

I found that when I actually run this, I get a warning from PCI:

  unlocked secondary bus reset via: __pci_reset_function_locked

Bjorn, any tips what would be a proper way to whack a malfunctioning
PCI device with a heavy hammer to ensure it will work after kexec?
Seems we have pci_reset_function(), which locks the parent bridge for
us, but it also preserves some "state". Do we want that?

I'm also starting to wonder if we shouldn't do this reset after kexec,
to cover for kdump. Or maybe both, because shutdown() is supposed to
quiesce the chip and keep it from doing DMA, and we have no idea what
such chip is doing (if anything) when it refuses to halt.

Thanks,
Michal

> [...]
> +	/*
> +	 * TI xHCI controllers fail to initialize in a kexec
> +	 * kernel without a PCI function reset
> +	 */
> +	if (err && (xhci->quirks & XHCI_RESET_ON_SHUTDOWN))
> +		pci_reset_function_locked(to_pci_dev(hcd->self.sysdev));
> [...]
