Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BF2521897
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066487; cv=none; b=ZkSzEYY0ChR1hp+jY5+mb1fzeBZsnSfYLWk8aVadlRvkAu51Rp68NMKtH9NgYLl78kBPGegedXkE05JlBZirb1wisw5GZ+aMOYMc6ljuAJCTpBq7RXQLc4ge2+G6s1cK1OC10k95YEjCuE8kljIwG5Dpe7jXXss/ZA1Yvjy9ltc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066487; c=relaxed/simple;
	bh=vlT2izf++gU8SdYUB/P/44JCuyP6O54Uc1vQ2YVNZk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cqogH7y7WxpLIzrT5g61yXKJl8DVVlZAibKSOYw4vQb07uWzY/SEjZmF1mIh7cUrDUGYTyDPqM0hoci3XkscmR44LTn4nhz7eFoeLO+76Edf+PLqkXsgSNFgwM7x3+lbrd+32H0lizrYo730yrH2kWJUiOPfwof7Urhl3AHxGJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P0N2MajN; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P0N2MajN"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed1368so45946425ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066485; x=1790671285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vlT2izf++gU8SdYUB/P/44JCuyP6O54Uc1vQ2YVNZk0=;
        b=P0N2MajNTHnFacVoyhoGu8nyjoJSwV8/8iPXlqe/TJAG1eo+wfk/lfJ90m1/i7E54V
         wYQiQNjK9L6UnJjmtozcGzG9dlXIw26fPD1Morv5JI9TzfgsvfsgbYegF3wYWKhiFpfT
         wVz3rYB8Myel97zwCgZRGxpHX1hn0Gt0xWXchaLy/zpDT/ptvNrOWGbq77LlODCb2jgj
         jiCdh85+0JzYJhnTu1B8Lq7HjAA4B1GwiCUdwmc7bJ23lrPPy76tMxVvNj0XlZfcssKV
         fkNTOz2mvkV2SOUDmXD9d2NNB01qwdTYsYmAPcje+BLY2ZSk6/Tq20twCQZLzsbXK6Du
         p3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066485; x=1790671285;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vlT2izf++gU8SdYUB/P/44JCuyP6O54Uc1vQ2YVNZk0=;
        b=GUlFre5c4sMzt3Rf7xaPHNi7NV0/z4z+nw9pmHkEf1qxjF3pFE+SjIoduz7YJlDJGr
         Brbu111t2ipsRrkYi95LnGKGqrbQvmMqki65StTcziGXAsnEYB+wjhMiWgEVI+FTD9Rt
         oCh6ZwS0vEnZBlt8c0woHGpEv0DyHKzopWGA5NJhmXJy3R5yAQZxOLDjK10FUkZZ6DSk
         onpuq5sWXluFO68kD9zsWjvEx75N8az/vRoD8GoB47xK/v+omqNiFkNoc40x6bLLu6bi
         ewK0COfeCGlBw5Ej8pcLal32pz/e6vilLEuuNx0VIb1Dr9buPV/A78/C7KqTIy4VD41F
         y9ig==
X-Forwarded-Encrypted: i=1; AKwUvBxgLHOVrmEC3Cq+PNU7ixaHxH9tX55GwNBP3/9isAfOypFn0Bdqe6GCQl058na7veVZF5gagrdYDV2YbgU=@vger.kernel.org
X-Gm-Message-State: AFuF++lRGfyXjcFzcwHRQektZ2gtp3rByEzz1fTLEEi0D+BYp52cUjnS
	xz2QTLefHbrg2Foalg4F25xLFgn0VynbA8uJvGb5+ckganq9GPyQCEc4
X-Gm-Gg: AYBFou2V4ivbTmH9EMmqnBDqRkAy1fqPtW7oWBZBTReyyn+YCYNuH0ni6ZHwaqb6B4G
	49pLFEfvzOTdATSUj58KNit30a3HERihr34sQTWEvEsZHvhf95lmtYBnLhpomij+vBX7CcxzISP
	U3My73kYC0VIroN3THcTI25ZRj1/VenwsaTZtYhkSqJu+TTv40MY/bSmt+8KCyhR6nP3pn77BBt
	is/B5EnSinfdiPfwf01IeZb5Pu1YLQw4TGevTSshwELUfu1wiooWpp5p5cTmvEPicte5fTq03Zp
	0FDhxGEsaNeaWF4m+czKr91xjrkIrEdpY01w9PbXtFIJ0Q/RcLgw/1k/GTKUf0E6jUZ1aB7/UQG
	L/+1hs0fkumC6wZGSoV+S8E5feOvSB1UXppLXWbPibhnfLkB9KEDY23sjrAwJPQab6fF37lIBlL
	ELiqi5NqRizlpbzm5Rk55+NpS1/rG8GbVNCIBzdQyCV2CcHvDWTlr4wwkr2UUtKAtOSsTEGftx7
	xDd9VJvmcu9TQNXKuOlfPoDTj0901KRH45wQds=
X-Received: by 2002:a17:902:cf0b:b0:2dd:c053:c209 with SMTP id d9443c01a7336-2df60b3a425mr4756515ad.37.1790066484736;
        Tue, 22 Sep 2026 01:41:24 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:b519:cd9:fed2:d000])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d0581f0sm6030875ad.74.2026.09.22.01.41.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 01:41:24 -0700 (PDT)
From: Yuchao Zhang <ndaugoing@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	toke@redhat.com,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: Re: [PATCH 2/2] net/sched: sch_cake: check negative transport offset in cake_overhead()
Date: Tue, 22 Sep 2026 16:41:15 +0800
Message-ID: <20260922084115.36844-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <179000041222.2160803.11108326722307773525@kernel.org>
References: <179000041222.2160803.11108326722307773525@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Thank you for the detailed review. All three points raised are valid
and insightful.

1. Regarding OOB read vs shaper accounting corruption (Severity: Medium):
You are completely right. While the negative offset in [PATCH 1/2]
(net/core/dev.c) directly causes a wild pointer dereference via
raw pointer arithmetic (skb->data + hdr_len), in [PATCH 2/2]
cake_overhead() passes hdr_len to skb_header_pointer() which undoes
the unsigned conversion. The real impact is corrupted header length
accounting and inflated shaper durations, not an out-of-bounds read past
the slab allocation. I have revised the commit message to accurately
describe the issue.

2. Regarding companion guard from qdisc_pkt_len_segs_init() (Severity: Medium):
Agreed. When the transport header was never set, skb_transport_offset()
returns ~65535, which bypasses a negative offset check and inflates the
shaper duration to ~66 KB per segment. In v2, I have imported the
companion !skb_transport_header_was_set(skb) check.

3. Regarding segs == 0 underflow in multi-segment arithmetic (Severity: High):
Agreed. When segs == 0 (e.g. from DODGY GSO frames), (segs - 1) underflows
to 4294967295, causing an astronomical duration to be charged in
cake_advance_shaper() and permanently stalling dequeues. In v2, I have
updated the check to `segs <= 1`.

v2 patch has been sent in reply to this thread.

pw-bot: cr
