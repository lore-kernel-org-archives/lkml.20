Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794255125;
	b=kLOFB4y293QpQmWjs8AIWJ1RB+/J89Yp8Q1MAd0rTWyFj8im3cd26jmG3UW/bG0ycJb2
	 QUv7BOdNCi9OjxsZ9aduc6tq7YFVCNIukclyCBDiJ8Epg7/PRfi0z4Ho9Nck7b+aCq8Bz
	 DCeatMG1/+enh7MVoObtmQqX5VuY0ar3c/7mYuJqzorU8c1XUaZYrSMuMJZjw0HWVkf7K
	 dKAn2R2J/IB1O8mF2ykFuwfXx772sH4brqQV3N/K/Q2pUFVBcs4pHFSF5iXlsk3IdTQDY
	 hpjslpUJBuUj+nb7nge34TadSnixO/KZM7Z2dGHMKkROGB1ZX17dLaqEc7lW36LyvZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794255125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=292T8O0aYQmW1UA5e/QuA2F7Fm+KQFHNlKPM8I6UjFs=;
	b=ewfwrCSmVncljdSMjtcd/pD86raBH5CJPe72ChUNHDH4b3lvzOqCLo5/yz6oCIsVCJgh
	 kMkHKmQTu68+sdDl+HxUa1hMGuVLT8IgvUnPLGR4V2b+6KKE1hu4/4Wl5d7ZY1U/mUeDq
	 Uq57z6/sL0gtpDUWaAd9MSYu8bpfH9yOiE/7jlq4uh/ISo+uc2vymbWhRakgV+Tc8zNA+
	 /HzGAbx/r6FBMBjU/s8OCeaM9Um67e2VG144uwwKSNSzV1jCEaa6LR8yK6vRxWwmJnEgi
	 XjwCrTte9K0i0Nhmdy0YhsaEGy9/e6E22WqVe6ZPbN8UPG+YiisqlaLh/Kz8vWh6u6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Ip8+iMcH;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EB5606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94EB5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Ip8+iMcH
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so509789a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1794255124; x=1794859924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=292T8O0aYQmW1UA5e/QuA2F7Fm+KQFHNlKPM8I6UjFs=;
        b=Ip8+iMcHvKrY9zFOYypIviny/5cFym2x9yoAPmDDC/trN/zTVtZ3Y6KFEbImBGAzr8
         d77ZFlCo1lr4hxIOKdtTTGH6w5JmYn0vplbDm2XbqLUAhJ8neXrnB+NJeSuKgNLO6u8d
         W6wqtBbfw+e3zJLU101XOWq7oMybWBRKbDvhkxIbYc/0uIhoAecYTArBfiOfSUNq2scN
         sTsJpI1UNH8FovGNkAWkCyCJysaFs3KiXEl5knV7KiyniUuoctuo+8C1uB8jqOFGl/4S
         zCPqNKNUZB/RX4+khtR4NgZJmV0Iygb9l1gYHuVNIe1ojV5WRudu6JhtX61gIEi6AXfY
         aU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794255124; x=1794859924;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=292T8O0aYQmW1UA5e/QuA2F7Fm+KQFHNlKPM8I6UjFs=;
        b=2s/pKmQMvDMHi4Ft1kWnLtzIYNNVEVm+Lnp/RiP1glAfQ+WldqsoE1Icq0H+gcC6ZM
         WGWax8ROm6UxjbxCnITtjmRpDCRhJeWJlZInvZhMa08j4viuFA9WigiSyGmeMSn82gZ0
         Yza2oZuiGcNrLtOP0X350TwWlW+7bB8mZHK2DY8IuHfAiQaX3XUhjg7f5ZVMpgeYXRwO
         nXJ+zkHReqIe4BeT7I85CJ66yjHHHijVeuPU835Ujy3+7kWRzhlz1JcJJ6DuO4EgHZiL
         o0r5KCDh9Zky6tCza9E3Fuf/w7koRz3qKP8bmTjMrUItQqjMpMkwQRms5BAFQTeHJO0d
         LqdA==
X-Forwarded-Encrypted: i=1; AL+hErFcO1/sgTe05LivD2PpsYvMXRZ8MBsLHJzGTlfChKmIL9wAZMDEWKXG+vjlybFLmcQ9qJlUVCnfM1QDEWo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SHL3IMcbqMD/VSkJJNOIt4NNROJahwIIkmMRh1XrTYN3bGtft
	t6DrsW3jZrmlbyJEtlUz+Zsy3G4P+XB8pNRb+522avHUSUtlOcGWwrkDdIGlfPyGFUc=
X-Gm-Gg: AYBFou3+ALs2HgqE0qsfhfnZMd8PGlFBGE3BEm4P2ZcXU6vMTeeaGAeIInxyHEq3CqN
	X3eqmmrb0WXtRp/DcQ7JmeszuME8u4zj7DJ2Ee/t9ehi5866wXahPzmrpiPRf/OSw8EEyjWjO/v
	pjUgjgsRWJrLD6K6y+hOrednAFO1BxgBmi27quclsUiqqhowK9ANOXkV48s2ZWZ58AIKcbjG6EM
	h9C0Q8umDJd8C9vkMgrYirwl0DA1HPfcYqdEDc7F4B73JZVU8AJ7AQFtMzQWukH4SKqq+Vhc6GZ
	+msY7y32+yQURCoUVNC10AzvAVVJ5AN/d2Ilpw1UrN3XDSJnn86OV96XK7jsQb8vdSbLLIODtTN
	05BJDMyt8yOPn4cuzOODrtgUxJu1o3rtbROp4CBUCrL8zVrrsybPHNSsMSd5Zpoj/5dcpqLsmLb
	lvwS6JNiogrbXiXYiubH7t7gf5nGVQzDru5UD8WfKiHxjqGxjRZ6ZZCzAvSHNSsuLjShJvLO9Rp
	dn1AOOifAmSVMaV44tsYKbZ1c4M30DzbsB1f2ylq7QGy5qCFgAj1qI4VQory1oxAKNIfJORrXtD
	GEEg1gdRukub+U6d/qXOOAYGWpa0Cx8s2JroixKv1g==
X-Received: by 2002:a17:90b:37c8:b0:3a0:4668:4cb0 with SMTP id 98e67ed59e1d1-3b166d1efc2mr707172a91.47.1794255123838;
        Mon, 09 Nov 2026 12:12:03 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:57::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1676d83absm798172a91.7.2026.11.09.12.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 12:12:02 -0800 (PST)
Date: Mon, 9 Nov 2026 12:12:02 -0800
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	michael.chan@broadcom.com, pavan.chebbi@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v5 0/4] bnxt_en: Make RING FREE more robust
Message-ID: <avIpEpoCYvLHYl3j@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, netdev@vger.kernel.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	michael.chan@broadcom.com, pavan.chebbi@broadcom.com,
	linux-kernel@vger.kernel.org
References: <20261106191423.4194081-1-joe@dama.to>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106191423.4194081-1-joe@dama.to>

On Fri, Nov 06, 2026 at 11:14:16AM -0800, Joe Damato wrote:
> Greetings:
> 
> This is a follow up to the previous RFC (linked below).
> 
> On two production systems, I saw the following dmesg pattern:
> 
>   NETDEV WATCHDOG: transmit queue 0 timed out 6073 ms
>   Resp cmpl intr err msg: 0x51                  x20
>   hwrm_ring_free type 1 failed                  x12
>   hwrm_ring_free type 2 failed                  x8
>   AMD-Vi: IO_PAGE_FAULT  x3
> 
> This suggests that, for some currently unknown reason, TX completions stall
> and the netdev watchdog fires. The driver asks FW to free the rings, this
> times out, but the driver ignores the possible failure and frees ring memory.
> Since the FW didn't respond to the ring free command, it is possible that the
> FW is still DMAing to the memory which was freed.

OK so Sashiko found a lot of random stuff and I thought it might be good to
summarize what I plan on addressing in the next revision in one place.

For v6:

Patch 1:
  - Fix commit message
  - Return the errno from hwrm_req_send().

Patch 2:
  - Only check the response for HWRM_RING_FREE. HWRM_SELFTEST_IRQ and
    HWRM_RING_RESET keep the existing behavior.
  - Read the valid byte with READ_ONCE(), then dma_rmb() before reading
    the rest of the response, including error_code.
  - Respect BNXT_HWRM_CTX_SILENT for the new warning.

Patch 3:
  - Count a ring as stuck only when no response arrived, not when the
    firmware replied with an error.
  - Don't stop DMA when BNXT_STATE_IN_FW_RESET or BNXT_STATE_FW_FATAL_COND is
    set.

Patch 4:
  - Make BNXT_NO_FW_ACCESS() also test BNXT_STATE_DMA_STOPPED.

Update commit messages as needed.

The Sashiko feedback that I think is real, but that I haven't seen in prod or
I think feels more like "new features" instead of bug fix and should be a
series for net-next:

  - Making the per queue paths more robust.
  - Completion and NQ failures are not counted as stuck.
  - The polling path in __hwrm_send() probably needs a dma_rmb between reading
    the valid byte and reading the rest of the message.
  - bnxt_resume, bnxt_fw_reset_task, and bnxt_io_slot_reset all call
    pci_set_master without checking the DMA bit.
  - Notifying bnxt_re when DMA is stopped.

If Broadcom or any of the maintainers disagrees and thinks some or all of this
should be part of this series please let me know.
