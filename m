Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65FA327BFC
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 02:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788660840; cv=none; b=sBeMvlcqfPIk9N4f22nvjRwt1IDK0PTW6Ji07Hs5RPCFrUZD7ggNpMqfPxlI5bV3JGAlo+62JjIJsWLI8wcztqzW0sqnp4fSVRtfcszlEG5d2rNTKMo8svrkG7ZZBbuP781T7NFaEYGX+I2gc5Eg51U5LoYH1D4yrZ7Q+z+mqys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788660840; c=relaxed/simple;
	bh=PA+s3kQb13WtGZurP+OFfhZZHb7A3tUCZDFqaBMBsjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BqKWceQ0uqR8jc7kNjeyj7bRTFN2R9Zm8B7WoM+2prWK0pstLTYAoagko59vTtXsLrYtLKSmTY8GHOottBxgGnyMmXbe1BD9ZRLukPIF46v+OeCr6wsHFdj8vBphvPRNlM9CvbgJd8HKBYPIkacV/n/5Ps7VfAYpLFtjwEY5BdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sBRTfh4N; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sBRTfh4N"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-398c1101c1bso2245547a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 19:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788660831; x=1789265631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xCPt6KzynG3w/MC2ejZoHvPP32P/rZdibGGUikeOpow=;
        b=sBRTfh4NCsJJM7PssM7z9uxLR8PPo21QtUalkkGh2PJrLOwfUiNCO7AmxuGYNC6jg8
         3wigFZHIvA21n5KDJAQxiLmpNbMV8HXe9k8lVysWHZAFMz4q6TqyKjuMwPERH9esvu1f
         VRfOXBD9zUBlzTfAgRWdUAi9ZhLYXeVX6CR+2hEci8qTrngkpEiATpw7cyF5ww2xKJNL
         //YAA0utMbHx77VRjxJRX2gv5lPGJvcm958hPwFYs/nwYXONkAzjYGI/T3yGlL4rO9/u
         YPFGzs5BNqp/vY4wqUqfMJwPCKs8eOO3Rx8RWkbCU32uTWRzLMjAzN/HiezvmH0fVg4x
         zubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788660831; x=1789265631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xCPt6KzynG3w/MC2ejZoHvPP32P/rZdibGGUikeOpow=;
        b=PgTSZmlGjfybI6kz2Ox13PFHMi/tPa+fazfFY2vCIwC3XXzJuRIn5kXhnx6jKoXHlV
         mK/FfTcXcf94Kh2uQNr0LPox/SBJIr8XphfY4OC+50yADOxqjQK4Kgdj/M2UsVdck+J6
         fWbK5Kb6zWLW2kcvAIHdGfdnbD5Coy4fQdstqMvuexham6/KyXgKDpQk4MnlLCplZQhb
         OvrDNm2siSCXnJI6jloCT36SBvfgr1QSem5ZiuqweNYbaxnG3Mkoz1IXUX5/9TNAEqMl
         9W0YsUlpsfrjIo6gxii/SOThdkF1ZFxXx6ZiAgeHbE3SdH/EVWxD7PZVGoV6mKtmramR
         KHNg==
X-Forwarded-Encrypted: i=1; AKwUvBwgvGZVpO+i42ux2/t8MJFEUvcyYJn4kH74QTrIXHSZt6hvYFl9bosgY5NiclFT84NQRlxkew1jVy7doms=@vger.kernel.org
X-Gm-Message-State: AFuF++lVZngEdqVQj6hTSMidqv+p9TzGmbtmaXPbnBZ3E20vVOsgYkOO
	5e7MPjUXcTxvpODrEP9w00WlD7J5YYeo6C+BR7g0aFqzH1YUny6MPcRoqYKDCw==
X-Gm-Gg: AYBFou2L8wM8U2729FiUTcMzfveOjyMNMaYWQD35MKXADmiRb/bklnPQ/T4DApm00SD
	K2RIJyILiy/bTqjj7RZ+W5I1av7X5pvL13K7TdSf9tWiW2NpEuCp2pxusllJgIcvRHnndw/a1vH
	M9q7gWWjpLdklW/wCzOAHAqwaCith+RMTzsfvLuzgTFAkqhDhPSA4t+2Fns81zPVHV+/LjaKBed
	3Sn1jBnKHq3iCLVuVEvpDTJw/G1qeGMZcpcFcu4AlAN0HWK5A/vg4r+gf7xQdbIFHW0nEWGLv7g
	mxQE/201sImp14WtPX8XPjRscdFN5ROCPo3PiYZ9DpU7CpAmjyA8hyDwAi+3/gmmjL7eL8Twccz
	0Kmmzx97qYZzlbD6gsKIBLN/BhrxSeBCz7VerJr6TDK2pUPEB8mAo1jUlzIjyUToX9DsfggTt/a
	acia6KoI97ilED5OFzRof8VuGCVd1KY9mjrVqxl3hq/mUozW+KdSqdrsZDO0mU9ix6+b9l6Dnt4
	rwZ/q/O9OZ+Ya0weEtlyqu2Ibsxbvp3PdgWm/rFmyioXOw4b9gXUNN5KL0EugxhmjeyMIhKfOlO
	s4/JJmiPvmGBK6GHb2gjSf+B
X-Received: by 2002:a17:90a:d2c6:b0:395:4de4:92c7 with SMTP id 98e67ed59e1d1-39b260d2f07mr23930878a91.3.1788660830982;
        Sat, 05 Sep 2026 19:13:50 -0700 (PDT)
Received: from rikka.tailabced6.ts.net ([240b:10:ff82:b100:8ce2:c181:4224:d11d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c3a526sm18520491a91.10.2026.09.05.19.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 19:13:50 -0700 (PDT)
From: wakasio <scarabeeta@gmail.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: xhci_hcd / ASMedia ASM4242: Bulk-OUT -EPROTO with Logitec 0789:0308 during DVD+RW recording
Date: Sun,  6 Sep 2026 11:13:45 +0900
Message-ID: <20260906021345.10436-1-scarabeeta@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905234752.1f0c9c83.michal.pecio@gmail.com>
References: <20260905234752.1f0c9c83.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Michal,

I applied the second patch on top of the first one and reproduced the
failure again with the same three debug functions enabled.

Cluster 1 (ep 2, start of write, unrelated): same as before, 4
Stall/Hard-reset pairs within about 177 ms.

Cluster 2 (ep 3, the real failure):

  11:07:56.930732 Transfer error, ep 3, at ffffccbbc21f1540, resid 23552
  11:07:56.931126 Soft-reset ep 3
  11:07:56.939018 Transfer error, ep 3, at ffffccbbc21f1540, resid 23552
  11:07:56.939183 Soft-reset ep 3
  11:07:56.947399 Transfer error, ep 3, at ffffccbbc21f1540, resid 23552
  11:07:56.947686 Soft-reset ep 3
  11:07:56.955772 Transfer error, ep 3, at ffffccbbc21f1540, resid 23552
  11:07:56.955939 Soft-reset ep 3
  11:07:56.964233 Transfer error, ep 3, at ffffccbbc21f1540, resid 23552
  11:07:56.964395 Soft-reset ep 3
  11:07:56.972881 Transfer error, ep 3, at ffffccbbc21f1540, resid 23552
  11:07:56.973060 Soft-reset ep 3
  11:07:56.981806 Transfer error, ep 3, at ffffccbbc21f1540, resid 23552
  11:07:56.981975 Soft-reset ep 3
  11:07:56.991162 Transfer error, ep 3, at ffffccbbc21f1540, resid 23552
  11:07:56.991324 Soft-reset ep 3
  11:07:57.002050 Transfer error, ep 3, at ffffccbbc21f1540, resid 23552
  11:07:57.002211 Soft-reset ep 3
  11:07:57.015466 Transfer error, ep 3, at ffffccbbc21f1540, resid 23552
  11:07:57.015576 Soft-reset ep 3
  11:07:57.034026 Transfer error, ep 3, at ffffccbbc21f1540, resid 23552
  11:07:57.034195 Soft-reset ep 3
  11:07:57.041915 Transfer error, ep 3, at ffffccbbc21f1540, resid 23552
  11:07:57.042019 Hard-reset ep 3
  11:07:57.162742 usb 6-1: reset SuperSpeed USB device number 2
  11:07:57.176799 Stopped on No-op or Link TRB, slot 1 ep 2
  11:07:57.679888 clear err_count at ffffccbbc21e9000

Same pattern as before. 11 soft-resets, all at the same TRB address
and the same resid, then a hard-reset on the 12th. A different TRB
address cleared err_count about 0.5 seconds after the port reset.

The second patch did not change the pattern. This run failed at about
187 MB into the write, the furthest one so far, but I do not know if
that means anything given how much the failure point already varies
between runs (0.35 MB to 103 MB before this).

One more thing, separate from this test. On this kernel, about a
minute after boot, the ASM4242 controller itself hit this:

  xhci_hcd 0000:77:00.0: Clearing Run/Stop bit failed -110
  xhci_hcd 0000:77:00.0: PM: suspend_common(): xhci_pci_suspend returns -110
  xhci_hcd 0000:77:00.0: can't suspend (hcd_pci_runtime_suspend returned -110)

This happened once, during runtime PM autosuspend, before I started
the burn test. After that the whole controller stopped responding
until I rebooted. I do not know if it is related to the DVD+RW issue
or a separate ASM4242 problem. I am mentioning it in case it is
useful. I have not tried to reproduce it on purpose yet.

Thanks,
wakasio
