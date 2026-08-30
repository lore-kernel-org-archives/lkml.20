Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5FE2BE655
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 03:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788059655; cv=none; b=BB0XtAIq5ype1hg191kWQNHY5Frd1BUV6buxeOZ4+4KRcRFdDmW4GouE0gASVq9O07r9w2uMwyTPqJNsujypNBj7RFj0tL2LmD3+DeKTwS3AWxFHwz58L0Cfy1geU1JqvCO+m0Tlx+KTmTjtWTwi6yoLmq9Bc2HSzeVMlpS6ATo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788059655; c=relaxed/simple;
	bh=AveADoKTyD0qMKs5efp/712wG89lKRLH/NKvKyDAXiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bjwjS2mtGqtqfdsmEfUye1X4AfTX/fHcGCgDOtk2y4z6CA/+xatcEC25kc+5feWg1vQrNrNwldnq2JUa/g5Qcu1Q6KijSQOwiQL7Sw1q67jdo1tkJ25IjNrBwaRXcMcKMU9eZZjLS7M816KgU5YQcymhg/UKHKSn+QF+qF5EdE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z21y5DRl; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z21y5DRl"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-52de50e77ffso28015201cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 20:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788059653; x=1788664453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9wqelshad8XAt0R3LlKAJqZNkTeXlB+pj6PSPch5MBY=;
        b=Z21y5DRlLYFRM28JALsfIaJLvSzP5DLqy6ouki1NNRPGkXdkX10q+Uj7h48qVtg/FJ
         LOan2BV0teV/5Qv3WBRFHzdN5jUwUfO8jFmINUtLM0X584710+GpheqlpwftmBjLYa+T
         BU+ac8fj6w0yOVytpBf+ZYaPgHDMLtaFyUOczIt4SQqdXTq1OuYH2v6v62xCgsbxB4ds
         JHUFg7m4sDzYwgMMaPAyIjZXOQq8QHwRaFCmFO6qYe6w/fJmEn/1l26ETvNTSMRu19PD
         49WbnFlJ4Sn8w4RkGusmeAsLCaQ51rmSn0Uo7ZRuW2rPHophYA7BkUhyknpSCzlSUZSC
         MdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788059653; x=1788664453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9wqelshad8XAt0R3LlKAJqZNkTeXlB+pj6PSPch5MBY=;
        b=UEELoG/DUp79BwuoF2TF+uUI49GeQthQkUsBW8aUDP3q3pzUmN9MWojhtxhBjDICJa
         mlxogKGutEGU060Q008Lkxn1Z0A2S0O+L6IxpOxthsrJMj7VP9WxlwBYUvvfg0eWtCAv
         Xk4tmMCdroTX9MLMl7XWnFVbB7/0QK1rk/CRKB4Xx9s89pFvrk/RqBn7mZzVO/uWLUiW
         gtEYfiaok0bmMG9Y2EMuzhjFH5AC0Plm8d1bxWl/5AEs4cOxSZKB+xZRdzBKsvVx/7sx
         xroeToAFWgwVD2bOpjJeWdmYiEYabaTGy4AKLnZPPXv8oiL09DpKJMBzpBvxbQXMKm1R
         iBjg==
X-Forwarded-Encrypted: i=1; AHgh+Rp4vVnuHpQ9/aqfJ3F/I/QYTbwZBo5fgaPRSugbzoCinBaMRjo+LYxU1LAJkalsd9VF4DAceVyL1ZbCXYk=@vger.kernel.org
X-Gm-Message-State: AFuF++kziU1lNs4XLiEAnC7iM7IyGP+9QeqOdYNSHn0jN1RZwbxRnvd1
	a3O9bSHGQ2NhpPQ2O60zGjjlaEmS7RcOEEO6Qvhs9e3s3xG4ZSHqmg2FbndnJ/Ik
X-Gm-Gg: AR+sD12fIh8ix+bVtL3Hx3yY+ux+NJM8DMGC4BzHge4MS13/L4CRQh9uYc0W6fqeAGG
	Y0L4PzH1Y+satjtfTc5rlex8XFXCsRwRGa6YdCR0aafDKLJP+nX+jTfGr8OCp46SgnnnSThu6Dv
	ckAmULlWbHG8AXSoAW4dc+5O7i2QjeIIl2hRxM9/86yEOAfRCV0a+zGX9qi6UsVTowRLI6b7mXa
	u+bAWpIxanWDFyf9rvN3qSyvVJpYADE68PPg63Fh5ltlkiXWTFMhCAb0y73KgjPz97jdYH/XQmU
	pRyUL+rHB36r1m/nwNpUvvgY7YWDTVZBsacXuNdaaPCW/yITuHKuwgw1tC7Ohcs+4j8homxhonm
	XGdi3NsSEdG6NTnDTMB3/9RN8SRI5v/hvKw+jLS7o7MJejPs48Pnxec1iSkfvfuGCN886ttVxQ6
	eOlML+7jqjbmSMDwrLfS9+jUYz3ada1AlFP62BTS+9fuIeWjsCQ3k9yicQ5CtmrY6tWi8DhA==
X-Received: by 2002:a05:622a:5c0d:b0:52d:6c92:b5e1 with SMTP id d75a77b69052e-52fb95f7381mr255204331cf.27.1788059653044;
        Sat, 29 Aug 2026 20:14:13 -0700 (PDT)
Received: from ubuntu ([2607:fa49:6f63:9100:2b08:ba59:b738:ac34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52fbe82f3b7sm44463631cf.21.2026.08.29.20.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 20:14:11 -0700 (PDT)
From: Pierre-David Belanger <pierredavidbelanger@gmail.com>
To: Shixiong Ou <oushixiong1025@163.com>
Cc: Pierre-David Belanger <pierredavidbelanger@gmail.com>,
	Shixiong Ou <oushixiong@kylinos.cn>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] usb: xhci: fix maximum event ring segments calculation
Date: Sat, 29 Aug 2026 23:12:32 -0400
Message-ID: <20260830031233.1810986-2-pierredavidbelanger@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828105926.930033-1-oushixiong1025@163.com>
References: <20260828105926.930033-1-oushixiong1025@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I ran into this independently on x86_64 under QEMU and had a regression
report half written when I found your patch. Same one line, same reasoning.

Confirmed against vanilla mainline 08dbfad3f504, with v7.2 built from the same
config for comparison:

  v7.2 (8d3ae59288f1)           USB keyboard enumerates
  08dbfad3f504                  xhci_hcd does not probe
  08dbfad3f504 + this patch     USB keyboard enumerates again

The failure on 08dbfad3f504:

  xhci_hcd 0000:00:04.0: xHCI Host Controller
  xhci_hcd 0000:00:04.0: new USB bus registered, assigned bus number 1
  xhci_hcd 0000:00:04.0: Failed to allocate interrupter erst
  xhci_hcd 0000:00:04.0: can't setup: -12
  xhci_hcd 0000:00:04.0: USB bus 1 deregistered
  xhci_hcd 0000:00:04.0: init 0000:00:04.0 fail, -12
  xhci_hcd 0000:00:04.0: probe with driver xhci_hcd failed with error -12

Reproduced with:

  qemu-system-x86_64 -enable-kvm -m 512 -display none -serial stdio \
      -kernel bzImage -initrd initrd \
      -device qemu-xhci -device usb-kbd

Both -device qemu-xhci and -device nec-usb-xhci are affected. Reading
HCSPARAMS2 from inside the guest gives 0x0000000f, so ERST Max really is 0
and max_segs comes out as 0 with the current code.

I did not see the page allocator WARNING you hit (my .config is a minimal
tinyconfig-derived one), but the probe failure and the -12 are identical,
and this patch fixes it.

Tested-by: Pierre-David Belanger <pierredavidbelanger@gmail.com>

Thanks for the quick fix.

Pierre-David
