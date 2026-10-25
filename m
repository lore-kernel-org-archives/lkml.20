Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901131;
	b=5HAWvtv9/4Niv07fS0RbtX/Ld09Wl3YsHDvAHgtDxMj8ZhJYNQXt+XfBVW+vPkqoCgRT
	 LPxtAdMFeoHtEAWQPs2qXii+Ec+G0my5gkalb9VmP2Sn+jwXtgjsoUYIDHUSjC8M1Wzz1
	 /PVEhoER0ihjNMvU5o7SVPsYvJGY1yDpWJUZ4pqwhiMdAoprKD1wdnpqx9mTRFWzDZbdW
	 R4f5j8EFIzu8TZjPlD1vwkjN2w0JL4Yq64ibCSEJw6xCpFstMw89PdEfwzKX31QvlhqPn
	 lkyh/dkgmCRWw/vP3dn/l4A/nD41KnuPgTomNvJ1yztO2hvvW50Z6hx3Z+myr8WoSBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=VtUIhvjUIXS0O+fAa/mNh6XhVMFUshrdlfp0Rfaq3nQ=;
	b=5Gw7TeXNXNIVurdplhgbOeQcgcRFxg1J0uh5nQxferMhM7rJO+FJ7mJQxVA6B3Qbc4qq
	 e45/pZrhq9ZDbt9R5groNBz05d7MPTjiqbRGGNjbULJzX7s44YrlHA0gPdXlADMqyHhnO
	 W4MRA1IIWqIUZH9MlCCdxCPA3CSD5DBU3YD2prOZGv1cvog0iAShp5Y13SAjPliS+Cf3J
	 VTAqo5svKV4w2T7sevu6qy5WWi3RlI1CXTVtqRTuDAahELnUiiVTljPO54mnf0LO4UDl8
	 GhBUj/JRGqY3ya4zZmB4Przte155ujfUyoygutTCKwVLggXfN7DOXyg3JaNwrKmnJ0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--weiwan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=h+sENBGd;
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9178B606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 04:05:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9178B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--weiwan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=h+sENBGd
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso2774860a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 21:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792901130; x=1793505930; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VtUIhvjUIXS0O+fAa/mNh6XhVMFUshrdlfp0Rfaq3nQ=;
        b=h+sENBGdqUjPol1nVxf1Fw2cCO8rFZjOCgu8Jxdj8d5vx/yqWnoORi2+WMyzELiw2h
         5AP/a6VdPHk2KKYaYju5/EaNNPcrn2t3LCfCD523mQ9drrvkG9RdFkuD0WXh4fGiUY1f
         jckeIAhor+g7LGMbo64EniuNGuEB1kFYovy5shxwaxDSnW/zTDuM3kTwtA+QZiF8IzPm
         ykzQNHflsiC/+U7SMfbonwL3/ETGp2YpiiHrtf1Rlg4Cli6stKd1LWJTyhrFytkqnpf5
         mVT3x5P/NhEFKF+fKsRWsySvR35I4G+Zm9Z5YCIDcsUuqQyhjJ4A7FSlmYrVNH/dyEff
         AtFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792901130; x=1793505930;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtUIhvjUIXS0O+fAa/mNh6XhVMFUshrdlfp0Rfaq3nQ=;
        b=K4wpxbxP/f8yfR+nwcKGpdpsrZLkzhwgYoXm6yf1bwSl7EzvZJY1ahxlTHen2fMGy3
         0kGT/Jlai9QLzgB52YNY9MhiH86FcGG4gTcfLGz5FqzYKVWQ3hwW2q42sWoDiJnY3HH9
         eE0gsWxPwG1Aqv7aX60jWGCC4vvuOjdKi2iKbhP0vvoikX5ZdlIJo0wXOhM6pvpRA1+n
         dF4B6U7+XZpmQD7u8tQonzh2bDUkjER3q8HCOCvCFlOkundqHQkITfMIPwrtLMY9P9xj
         6HwSkM5gqUxPrUtZC3ylJSOoKgzO+fOhcbEmRJGLd8FcudFzS/fmzEc7to2zt6z9vsDr
         /Gcw==
X-Forwarded-Encrypted: i=1; AKwUvBwDjO9wSmSWXMYgARD/wfofFY9yoH6U51vStpenbUw7dJYZzRombVp38PPL+OB+AoHZORF8O3/h0BVun70=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtATxOHn7PnxpYmL5d08MvAbT2tOL2/5lLPCCB+cSWWc6+cyIo
	gn8KBomj8js9vw2NJdCkhBMhm+s4eeWiBvDRcmVk3zjDLEzXoMimA010a+HIS5w3k/RArN99Kz5
	ykhK/9Q==
X-Received: from pglq37.prod.google.com ([2002:a63:5065:0:b0:cd8:b247:590f])
 (user=weiwan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:6bdc:b0:3e0:b937:883d
 with SMTP id adf61e73a8af0-3e7bfbdba5amr2693469637.25.1792901129714; Sat, 24
 Oct 2026 21:05:29 -0700 (PDT)
Date: Sun, 25 Oct 2026 04:05:21 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261025040523.678027-1-weiwan@google.com>
Subject: [PATCH net 0/2] net: psp: preserve SKB_EXT_PSP across packet scrubbing
From: Wei Wang <weiwan@google.com>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Jakub Sitnicki <jakub@cloudflare.com>, 
	Daniel Zahka <daniel.zahka@gmail.com>, Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, Wei Wang <weiwan@google.com>
Content-Type: text/plain; charset="UTF-8"

When a virtual interface such as netkit is associated with a PSP device
in another network namespace via PSP_CMD_DEV_ASSOC, incoming PSP packets
decapsulated on the physical device lose their SKB_EXT_PSP extension
when scrubbed during cross-namespace redirection (e.g. skb_do_redirect()
calling skb_scrub_packet()). As a result, __psp_sk_rx_policy_check()
rejects incoming PSP-encrypted TCP data segments at the socket layer.

This gap slipped through the existing psp.py selftests because both
_data_basic_send() and _data_basic_send_netkit_psp_assoc() only sent a
unidirectional data stream from the test socket to psp_responder; the
returning pure TCP ACKs had SKB_EXT_PSP stripped by skb_scrub_packet(),
but were still accepted by __psp_sk_rx_policy_check() while peer_tx was
unset.

Patch 1 (originally from Jakub Sitnicki's BPF skb extension series [1])
introduces skb_ext_scrub() to selectively preserve SKB_EXT_PSP during
skb_scrub_packet().

Patch 2 updates the psp.py selftests to exercise bidirectional PSP data
transfer using psp_responder's "data echo" command in both direct and
netkit dev-assoc test cases.

[1] https://lore.kernel.org/netdev/20260910-bpf-meta-inside-skb-ext-v2-3-0b21e42180b0@cloudflare.com/

Wei Wang (2):
  net: Make PSP skb extension survive packet scrubbing
  selftests/net: psp: test bidirectional data transfer

 include/linux/skbuff.h                     |  2 ++
 net/core/skbuff.c                          | 22 ++++++++++++++++++++--
 tools/testing/selftests/drivers/net/psp.py |  8 ++++++++
 3 files changed, 30 insertions(+), 2 deletions(-)

-- 
2.56.0.257.gf7497c7d27-goog

