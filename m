Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE944F4757
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 18:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791485748; cv=none; b=AWnMkqRTuGTU4YZTYECiY9+DTGRcCGu5efLbuWL02LOyH6UZNUn4qiAu8w5iCocEoX+8Rq2V4INT9zvswyles3KHKZDFSgn+oF+ViBHhhqMOOFw9l2QXrNbwHUu65t/O2IOGz9/WCWT6BeZ5i8uYwIaMcrNLb0iE4hJx3dP8sUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791485748; c=relaxed/simple;
	bh=//vq31uucGfgZgR+08QPA/vwvOya2PztDY7k7BX/FOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CCk1A22EW+V+0XmvbYEgO7DBvMZRN+QZ6FcgrORzcmEhwdj7FKiQON0QTknRYex3KUMS3lhYAGAYf6VmXSFVKqVlgrL6DPRVmkXkzYRTyj3gxW/6ueT1HAknITQ+VdhGDD+fopzWwYJuSf+3Hqd/uVm9U/mOhOfcsRaVPh16jyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rrell.co; spf=pass smtp.mailfrom=rrell.co; dkim=pass (2048-bit key) header.d=rrell.co header.i=@rrell.co header.b=gfWTx3tx; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rrell.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rrell.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rrell.co header.i=@rrell.co header.b="gfWTx3tx"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-398b3c37877so2205034a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rrell.co; s=google; t=1791485746; x=1792090546; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OwScGEwPZUR1mnPa2JDhNTpifxn+9CP5+3PlAIWMVPk=;
        b=gfWTx3txB3eEqrdVci6e+6yFxRkagLHv1lL+LYWFguTUgGyV/rBWHzY+Qmy3w0TrDl
         hNZEuc8NtLZ93zivITGTGcLBRdg0ktsCYB5Ho9iLC8o8lEUIiSzjRMxIORf1RFLFNYCX
         nMB7U2jC77Rc6/afAjgFMXzfNAHQt3xR+bUJpBnYHE7mQVkZkf3/Ce2jsRVYA0+hs2wy
         Do+AHE2tk/Ek9mAwmjGgG8i6MbKgjywaJriaFmBzwlyckdZJiyxVJ3AAC0P+EWbieWmu
         m3xNIOiwePL1xRVolZXNS1Hd6f3HJ5OWDSHKJv7bRAA/1/Wrvn2cCDvnKNd3TETgL2dt
         XAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791485746; x=1792090546;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OwScGEwPZUR1mnPa2JDhNTpifxn+9CP5+3PlAIWMVPk=;
        b=Md/txhlgjSJJXBeM5NoUzzyZ+65oxt3QqKPs8ZEiOOgPLZGcH7fJserkqdvBaBuqRZ
         g268O1w7DdUfbVGvljp3L+W7sjYeyk9F1ok8PzcdBQXPerushx0tdIXrJUtW6jSi3057
         7GiiPoGtMAE03I4CuWZtvF/zg+Ezl6sqQ3WWte9II5/xVjlK7ERHPis/uEOPR9P5LjoX
         MoXpD4lTyeQwbTLjsFBh3cL0OZYlZsf7FFBrBTcpXIcDeiRpaPX/tZTJVALhHP+FoU5t
         eTlb2sAB/b6PwmMln6oKVM8E85YYhIHCe7gRkM6zXeuDc2sS03vW3/tT+/+yHK97Y74w
         QYEA==
X-Forwarded-Encrypted: i=1; AKwUvBwzbvNP4ooWpLLQWPcU/B5exJ8xi+EMY2GE2jhOo6jMPNSUUSCGMyErmfV1LMxKUUGisayk+H8/dQLiia0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJY6i1Jfmg7peodsqBTpJCc/fKI57c00NPd9HXuBRW2O1CO/2gB
	ghhZaG36v9SlfoA0Ze2A/mdSMKU0BVAAvpNyiqy/ocC3T82Ry8YgjZtnq154e+ZBsRY=
X-Gm-Gg: AYBFou0DclVjvqVWz6F19nt+UMhzTuSOY8r7PKjnsuCq2xKtrReuQDOb3fMxvYvMRuA
	lfMicVJsJVYBxDjg3jylEq8f1mDoS70s9UcxDAGt39/JSOl1rQa2vT5d8r66pMnBpEMaff9gQ56
	dQfzVBVEN6n6Xhq5q3uD/+dlKNl7JK3GX71IKM3cPJiHQhVU2VPmY4X15JPeimXI16zHQJaIhsT
	+PqKPF1xchNpIeTVVOB/DoyYospOICWD5D8bVkWk9gIgaEG4noYvjumRQxfaZCMemtxkvNJ7OEq
	rSA44bYri6TH03Pti8bgTCLKC4O/lAKk+8j/Py4VoM5Aepc+IJdqweFu9WaPVMVKXQcN1KvrfS9
	/O7cJuSfZHyigxY4zvu2RrxSC3h/C/foEbImYxy5+KOAq0nqQbrMyzFWuQOVVZDSPzTPh3dXZCo
	rbe9Nu6cmgRrk2rwuP5PO4TVIaFjMzbeyb1P0UO4RMvg+CXQ1vEjWGdPu0mige4YDfqGepA52Lu
	ZgdYg==
X-Received: by 2002:a17:90a:d445:b0:3a4:bbb9:e912 with SMTP id 98e67ed59e1d1-3a8a192992dmr4940277a91.23.1791485745623;
        Thu, 08 Oct 2026 11:55:45 -0700 (PDT)
Received: from omarchy.tailc658b0.ts.net ([172.92.210.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3386997csm140023a91.3.2026.10.08.11.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 11:55:45 -0700 (PDT)
From: Darrell Gum <d@rrell.co>
To: =?UTF-8?q?Francisco=20Beltr=C3=A1n=20Millal=C3=A9n?= <fbeltranmillalen@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: Extend Apple Thunderbolt power quirk to Alpine Ridge
Date: Thu,  8 Oct 2026 11:55:42 -0700
Message-ID: <20261008185543.85892-1-d@rrell.co>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924132815.24430-1-fbeltranmillalen@gmail.com>
References: <20260924132815.24430-1-fbeltranmillalen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 24 Sep 2026 10:28:15 -0300, Francisco Beltrán Millalén wrote:
> On Macs with an Alpine Ridge Thunderbolt 3 controller, suspending to RAM
[...]

Tested on a second MacBookPro14,3 on 7.2.5 (Omarchy's linux-omarchy
7.2.5-3). It has two Alpine Ridge 4C controllers, with upstream
bridges 8086:1578 at 04:00.0 and 7a:00.0. Your PCI/PM v2 series (with
e18d1abc3bff) and the Apple native PME patch were applied as well.
The full report is in reply to the series:
https://lore.kernel.org/all/20260930141914.6678-1-fbeltranmillalen@gmail.com/

For this patch:

- The quirk fired on both upstream bridges ("quirk: cutting power to
  Thunderbolt controller...").
- pm_test=platform passes. The stock kernel hard-hung there 3 out of
  3 times, with or without brcmfmac loaded.
- Real S3 resumed on every attempt, about half a dozen cycles
  including lid closes on battery. noirq resume is about 16 s, with
  about 11 s of it in each upstream bridge.
- With a USB 3 stick attached on the 7a:00.0 side (xHCI 7d:00.0),
  the quirk logged for both bridges during a lid-close S3. The stick
  was still there after resume: no disconnect logged, still at
  5000 Mbps, filesystem readable. A replug about 2 min later
  re-enumerated it at SuperSpeed.
- On that cycle the empty side's xHCI logged "xhci_hcd 0000:07:00.0:
  xHC error in resume, USBSTS 0x401, Reinit" and recovered.

The patches were tested together, not bisected. Only one S3 cycle
had a device attached (a USB stick, no real Thunderbolt device). The
no-wake-on-plug trade-off is untested here.

Tested-by: Darrell Gum <d@rrell.co>
