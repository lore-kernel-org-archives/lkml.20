Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15379241CB7
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 10:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788864589; cv=none; b=Sasvz2yGLIOdxBiTliv0EPYU390CEsbaRkSACTb9Vdb1FMo8M9Q0xGdWIRaJKl86XJ+lQH1ZpvCCi9ln7oE4mJkeCFNCub6JPTOrmICAJfw4pzrbszpRO3fmcVXsvTAOPdyUxGpS+Ff3XbSONxIzIz+h2X8UbCKTAjvh8l3GM8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788864589; c=relaxed/simple;
	bh=+f7lFKo1NHDijB5MYO4zHyRLaJQ5Y+XoWWoWZqH6cCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aRQeGdPEYnYCnfi+JDHf1SHPPiLWVE1bbJC/yUJ9W0yXVzsRXBNPxIh8L0nXYLKoKw3PbFOIxBgTjYxSo5Her0V6CR4cNh4VyD3MHzwY1uhBOWzbLGjCeFGnLGpZ9nrfTv9P5mrolT6yLvuhDS2YbRRJS3pll2aBtpWdkuedDgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rmMXsLzK; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rmMXsLzK"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso5465889a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 03:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788864581; x=1789469381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HFbjLRR+QxNWklfU9Df6zJrHL32Jh7ySvaRZ4XQ0MrI=;
        b=rmMXsLzKxxnVxqDb/avp/t+vPdcNTPGhvrYOwnOUl/qZjQZXFVzErDUaInKiErnBWi
         CWU4QlaicUQkE7eU4iIOwC5TAY3UuoLBwCBJERFidnk5mLFPxAHCKTo+CU/umB/VjaJQ
         Lu2ttyXGWJhkRlT452h4HE24szDZ5G6tKCSplneTKmUhw+LcVtOQsFdAE+/eTPfvEHrM
         KGAsJGkcXZw50sg3Xn4pxz0LcHrqBHP7MrG24PyeWuRqKCqW+CI6N6O/vKBc5FpMvdTq
         yVENZreyqTtdUy2HZ1gtg1QSf6vVgOHDr7Z1q1hZiw/OkBB5aL7dwbgiItsEzK79zPiF
         tK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788864581; x=1789469381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HFbjLRR+QxNWklfU9Df6zJrHL32Jh7ySvaRZ4XQ0MrI=;
        b=rDkkbAwaSkVxV4idfLPEZdetgLuh+E7EK9rO2xP0UpymWA++fsPXjMlkSp6Rl1n9iR
         CaUXUGBvHs5r3d8vSYEz3Y7pbB5RcxhWkdtXNf4Uuifj3fy8dy01PKCg3cK6C5Ca22+0
         g+YSdVPQ+kt/G1V5rgCxhahBMCDIMWqqsyHH/9EzM/63/rTWGsaok0lXOJh4P0oP22GC
         aTbhy7H//Y7ayFUOcG/2Y0leXSBaj/pPE4K2AxJkh8+StsZNX6+DQqiLy3cabVW32+cX
         mOEHpbMPab1wPqpTwiGYFEJDU/xLCCqB1Z+7z+GhwKFK7KnBsaP2roSGIisM0WKLfmsP
         At/A==
X-Forwarded-Encrypted: i=1; AKwUvBxcPGJW8LPczRy5K6MPSZZ9igAaV256+H51cdhL03R+AnaxG63t34XHWcyA9H5kARfyaSzKEvg9ELTIaD8=@vger.kernel.org
X-Gm-Message-State: AFuF++lVC+mRADBDsgt7/LKeAKSqEmhclrmC5mRYXUniMG25yxUA4Zqe
	W1DJv/2LQfv7SA55EFiePXlYBAkl0m4v1+ekVRnjWftlPR6bon3E1cKQ
X-Gm-Gg: AYBFou2zrwapRobWPVrAewy3aLYYvu/rqcWRJ5UzU6VON2q1BJfi8xeDPRZaEDfxsKG
	79Cqq/UlSC1pTS2RA8fJwA0GuARgodtgplJt0u05SzXOK74LO7azk547u7s8DEyfOhK7T4ODH5g
	1zCMeuZLguOQYSKbLFsQ3ZqbURGlaNlHusUdn651lmQ5TMuLj27NhKFsoQ3g3IBNntABEY8+5WB
	t9hU0MXO9jfdFUFlHNDctM0uquNXLg9QTtGUJL3VMMefvZPRaoyWe3iTnWDhi54FkWmdUAdEj5p
	MG3MR/PO8lTgvkJlYJ66j1k0Xi6nAPDilgZAknZt2cGi85kPlcVDq/FddLtgIrE9i6FwD39M2Vh
	yzuIKprMM/KErH8CUUlu8AgxX3ICCeyUwu0kABooSdh/hzFbRYc7pBD127UlWLrWIxtOfNNfCPA
	tDszi/+zdP8/JjNdaQwJY2TINAR3sDhF/lWA7uoC7JKHDMuKjqRmpX6haScYh81fuiL5plIJI1L
	YUwxl4A3oGjexzdqugsiMXo9KK00leDigqgU8liJq54Zv3EhATYGofkiVuagEZKDNRTtf6N4Y7o
	yaL5XcpBRtzOVxdO+B+c68S/
X-Received: by 2002:a17:90a:d644:b0:398:9c00:29ec with SMTP id 98e67ed59e1d1-39b26245cfcmr44518484a91.20.1788864581354;
        Tue, 08 Sep 2026 03:49:41 -0700 (PDT)
Received: from rikka.tailabced6.ts.net ([240b:10:ff82:b100:8ce2:c181:4224:d11d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b25f8d2c5sm26456207a91.2.2026.09.08.03.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 03:49:40 -0700 (PDT)
From: wakasio <scarabeeta@gmail.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: xhci_hcd / ASMedia ASM4242: Bulk-OUT -EPROTO with Logitec 0789:0308 during DVD+RW recording
Date: Tue,  8 Sep 2026 19:49:35 +0900
Message-ID: <20260908104935.13248-1-scarabeeta@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260906122750.1c71f176.michal.pecio@gmail.com>
References: <20260906122750.1c71f176.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Michal,

Thanks for the link. Bug 220936 looks like the same issue, same board
family (MSI X870E), same controller, same suspend timeout messages.

To answer your question: no device was connected to bus 5 or bus 6 at
any point before it happened. Full sequence from that boot:

  10:59:35.014709 xhci_hcd 0000:77:00.0: xHCI Host Controller
  10:59:35.014756 new USB bus registered, assigned bus number 5
  10:59:35.014848 xhci_hcd 0000:77:00.0: xHCI Host Controller
  10:59:35.014893 new USB bus registered, assigned bus number 6
  10:59:35.014938 Host supports USB 3.2 Enhanced SuperSpeed
  10:59:35.015160 usb usb5: SerialNumber: 0000:77:00.0
  10:59:35.015534 usb usb6: SerialNumber: 0000:77:00.0
  11:00:48.349628 Clearing Run/Stop bit failed -110
  11:00:48.349744 PM: suspend_common(): xhci_pci_suspend returns -110
  11:00:48.349812 can't suspend (hcd_pci_runtime_suspend returned -110)

Nothing else touches bus 5 or bus 6 in between. This was autosuspend
on an idle, empty controller, about 73 seconds after boot.

After that I tried unbind and bind on the PCI device by hand, that
did not recover it either:

  11:03:30.975422 xhci_hcd 0000:77:00.0: remove, state 4
  11:03:30.975812 USB bus 6 deregistered
  11:03:30.976136 Host halt failed, -110
  11:03:30.976262 Host controller not halted, aborting reset.
  11:03:30.976325 USB bus 5 deregistered
  11:03:33.058079 can't setup: -110
  11:03:33.058350 init 0000:77:00.0 fail, -110
  11:03:33.058416 probe with driver xhci_hcd failed with error -110

Only a full reboot brought it back. On the next boot I set
/sys/bus/pci/devices/0000:77:00.0/power/control to "on" before
plugging anything in, and did not see the problem again during that
session. I have not tried leaving it on "auto" again to see if it
happens on its own without that workaround.

Separately, I applied the TRB dump patch on top of the previous two
and reproduced the write failure again. Same pattern as the last two
times: 11 soft-resets then a hard-reset, all 12 Transfer error events
at the same TRB address (this run: ffffd140425178e0) with the same
resid (23552).

The dump itself printed fine, event ring and endpoint ring, about
1061 lines total. I could not tell which dumped entry corresponds to
the failing TRB though. The "Transfer error ... at %px" address is a
kernel virtual address, but dump_ring() prints each TRB using
(u64)seg->dma + offset, which is the DMA address. I do not have a way
to convert between the two from here, so I do not want to guess which
line in the dump is the one that failed.

I have the full dump saved. It is about 1061 lines, too long to paste
directly into this mail. Let me know if you want it pasted anyway, or
sent some other way, or if there is a specific part of it you want
first.

Thanks,
wakasio
