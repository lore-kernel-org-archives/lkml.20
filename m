Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDEF3BB670
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 22:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790546504; cv=pass; b=lxJ+hvM04wko0/FREOdYaw5xK4wtxE42heUZHOTDIuo5rykkWn0v/t1MsAXm1Ml9aauKcXYpyRMnlxllCNctVc1ClWOVI3++HwVwC41ZNwDTsnf+QjKEj2Pr49f3KAkxOdI3ZC9RCp20G0+TfZw1Sj0PnAOjtKk5pgM8siPRK0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790546504; c=relaxed/simple;
	bh=Pyy7SD6RT8GeOcXKhheqQq5nrt238c/zkSEnH//QW/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PxAliIPeBXQaqODQLiAfPDCwdD0Th7VRdDoGoM1RhdG6tXFrUGawHHBMO0ZMtjSY+rIOJ1x+RbTM/xSPvHEI2lu+kJmj20jtfs7v9EdPUhEZFllwOQMLurgEivKAzuTYsuzrJ2P39ohpQtF8I7EqUkbYrcJehW8JRj85tuEC3DY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tCTlp+Ej; arc=pass smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tCTlp+Ej"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3413069aa25so1500269eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 15:01:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790546502; cv=none;
        d=google.com; s=arc-20260327;
        b=HyAypNdG7luK0v7h6xnhNYXmk1KdonERZr3dcplNa5Qq2KlPmHWef3b7UN9LH8iKDs
         uYO51FTqbsK6tsqSAd2RW2jKRj8jn9wUK4Vjk3leNNwHs/Xo9vWnB9Xt5CLbigsm4tPZ
         jXnQhCvcsmYaaCTWr9aZYiWrJ8MBlmlaZfVcR02GPVP/VDvvSEMFLlpKWfmRajEITyU9
         030bUdKNC3A2QRzb0Wsx9RcdaGCDd7SvkUm5trBGUi1OaJgNNz+ewqekmNCDsLjm1xSn
         qmTJftOqzNG/Bc60FUwQJOX3ohgjJoN+SbxjkJ01H6zyWQkmzXQb29pgPe7bbN+iTK8h
         DOzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SMH0IqJfE7oMGpkLO0PFMf9m4Si2ICbZ5UhcXcmawtI=;
        fh=Mxmx1zc3wPUxWtHgXJAsp+xQG1zvmMya4MrPo39aK1E=;
        b=igaX7ZtkiF9ihWFjPKfiAUhmv5yudjtCyPs3ONGZGB+5wukvH69GjYpeOz/t3aXUrU
         TYSnaPzKpDJlR3CW8/3jway8o2ELj2Or7Fwnc5yt7INEEQjXi/G+k1vVcNUjpOwRDqMJ
         FtASw+JW6b9U/ndyuAlb1vXqU4LMyhDaYWbNSMgCnmMAax7DO0voW4XZqMa8nIOOrXZq
         KpmGYRHvVD4zmW9mxo6oKJtbLhAaqAxZS9wRTxNDvtoPSKyVVj3IPS0MTDybCnTdM6tn
         ONOvBW46MfpYE0xxoTQxabEHl3peUGgXCm04GxD3CQsQTujYiZP1MhLR0TGFH7srYghv
         nxbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790546502; x=1791151302; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SMH0IqJfE7oMGpkLO0PFMf9m4Si2ICbZ5UhcXcmawtI=;
        b=tCTlp+EjqBpsbEkzwKQPznYxkm+SKuKq/FZbM+p2LFcohO171Qrqq4RLP7lTsXQFad
         WvxJpf2CY9OpaBArRMOF3xX8sxqZWYrcaR1vRTalYUP0s4DUDxOSlNvFn/FElJBktEt8
         z989klW9pMXUO6Uny0TwOGe8k+YxRY7rybLxgAW4XB3ySB9Ktd4OxBXa6O2YxPpgzFkN
         rnVfRj3kP/ljxN5vYUZKhDLhpyRVEDwZG/3+j+J2GAvXiDe9LZ8yscqQ8aXHCh7swNNX
         DZsHZ9I0APP5/pLZZ3b3xaKaz1iPg+t0TvVEWUBMChqUdDLts2W7QjSgHI8rQ5GWljG3
         EhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790546502; x=1791151302;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SMH0IqJfE7oMGpkLO0PFMf9m4Si2ICbZ5UhcXcmawtI=;
        b=kmBm9VxPn1Y8S15b8eWAXcwRVkj0U3bp3RJO0HXSfc50DZtBBlOYapOTjlFMoOmvZP
         xBjXmPSCLDZ9CC0iYQzIer+PfJEAiZrymXamITWYho2aEWMnp1wFb6wSlcA6/MzAEk9z
         smkZE1W/FcLv/oXjDpbbz2dM3rhmuQWFjr9xwsd7B5g/u9SfP+YYTqtFJLIS9ewuvnLF
         8pPpsc0bmrMfQtWJjc7xw7b02fKliWRFmnj3rIgN2exRx+Z+CA61n7mFbYMYkqcmQZFQ
         2/TP3RiX8UGhEzMExEvDU/3uKmuELS4S3YiF7BZE8ADHs0DzczbjM9swZFfZ2E6FhxoK
         m7YQ==
X-Forwarded-Encrypted: i=1; AKwUvByGXBHcYg9FVTafUp0vViKCaaXI/QqSln+YcEm+ZVCiBWKAwhWglVMFkebbdTvMqTpKmRKLM36oiKolphs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIemisDtCRaVufVWNHNclrM/x3VmrEHiG3uEuE+n9X6iVqMbjYy
	dAukdEgff+VHRC9ly1UWUg3qsZ2pldTFiBp0J4Qfk5bFZ3qg40G1ewyd9phFohLd9I5GOvi53zW
	UMg21xm8y2dkjzTSU35YvOAQx92IiAQ==
X-Gm-Gg: AYBFou3Lvl8COz0pOaqDaso0TNIiTl3YxV9stkR9wlO9qYFE4O+1LOEZyX0G12uM+HY
	eDOB7JrYv6Rk6q7P0mdUHVLjo5uD1g5CmuKa4YnPJrEax1H64ZDOtaP0q7eWOO8g5IXI2X1wWcD
	1/Isn4CjhMlPE1T2FzGASsxN8jBXzVmG7A2aJzEWVQuLLhCD7n63iATwqyGp3b+MN5DA24bQtLP
	9AeFziCGY5d6XF1V6uxQqTl9mwsNudiyBs0+uoBHzYrrA6e328CYnWwQYkJhtDK9/NYIwIJb9oH
	khV/6chqHRhEDSngz2nrFf/BgXcq21CPxJGRxlEUlJuorcv/DrLYBT5lnWscO17gTYaytpkt3ee
	/LnloiMFHF5O1dEq4BU1lEFXPz8FghozJ5osviZab
X-Received: by 2002:a05:7300:a986:b0:342:56aa:67a6 with SMTP id
 5a478bee46e88-342711ac262mr12259339eec.7.1790546502439; Sun, 27 Sep 2026
 15:01:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAM6_QD_PoTdwdM7DvzzgHRs-G5EvQu-c5oNGve=GuKV4wFYAvQ@mail.gmail.com>
In-Reply-To: <CAM6_QD_PoTdwdM7DvzzgHRs-G5EvQu-c5oNGve=GuKV4wFYAvQ@mail.gmail.com>
From: Dane Linssen <linssendane@gmail.com>
Date: Mon, 28 Sep 2026 00:01:31 +0200
X-Gm-Features: AclHuK_bGK2LhVv48Yhx7dpSF3Davb0qw8vDUCuDua9qRMsw9hK28exKJJamUlk
Message-ID: <CAM6_QD_xAyTFVvYKvCrrZmS+fV5DBBje9V=VdkDMMSpt2ussRg@mail.gmail.com>
Subject: r8152: RX stops until rebind after -EPROTO on the bulk-in endpoint
To: linux-usb@vger.kernel.org, netdev@vger.kernel.org
Cc: Mathias Nyman <mathias.nyman@intel.com>, Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

An RTL8156B on r8152 stops receiving and stays that way until the
driver is unbound and rebound. TX keeps working and nothing is logged.
This has happened 5 times since 2026-09-23 on one host. The two on
2026-09-27 were captured; both followed several minutes of about
10k rx / 6k tx packets/s.

  Kernel: 7.2.6-1-default (openSUSE MicroOS)
  Device: 0bda:8156, bcdDevice 31.04, fw rtl8156b-2 v3 10/20/23
  Host:   HP ENVY 13-ah0xxx (i5-8250U), xHCI 8086:9d2f, 5 Gbps
  Link:   1000baseT/Full, EEE inactive, pause off

During the stall at 18:08, read twice 5 s apart:

  ethtool -S  rx_packets  117909777 -> 117909777
              rx_missed        9214 ->      9504
              tx_packets  111602790 -> 111603644
  host        rx_packets  117835758 -> 117835758

  xhci debugfs devices/02/ep-context, bulk-in endpoint:
    State running mult 1 max P. Streams 0 interval 125 us
    max ESIT payload 0 CErr 3 Type Bulk IN burst 3 maxp 1024
    deq 000000010bd3f960 avg trb len 0, virt_state:0x40

virt_state reads 0x0 when healthy, both here and on a second host
with the same adapter. The stall at 18:59 looked the same.

0x40 is EP_HARD_CLEAR_TOGGLE. xhci sets it when it hard-resets a
halted endpoint, which includes a bulk transaction error that
outlasted MAX_SOFT_RETRY, and clears it in xhci_endpoint_reset() once
the class driver calls usb_clear_halt(). r8152 never calls
usb_clear_halt(). On -EPROTO, read_bulk_callback() re-queues the
buffer without logging, so as far as I can tell the endpoint stays
out of sync until a rebind resets it. No "Rx status" warning was
ever logged, so it wasn't a stall (-EPIPE).

usbnet doesn't clear the halt on -EPROTO either, so I'm not sure
whether the fix belongs in r8152 or on the xhci side. It looks close
to what Mathias's RFC "fix xhci endpoint restart at EPROTO" (March
2026) discusses [1].

The host now keeps an xhci-hcd trace instance with only the reset,
stop, set-dequeue and configure events, plus dynamic debug for the
"Transfer error" and "-reset ep" messages. I'll send those from the
next stall, or anything else that would help.

[1] https://lore.kernel.org/linux-usb/?q=s%3A%22fix+xhci+endpoint+restart+at+EPROTO%22

Thanks,
Dane Linssen
