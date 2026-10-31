Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793410312;
	b=ozgU7QWSBAb7ufzvajJ4Ph/A/qczhfN6V25vjfj02Qk2WXT4o3gT98o0ElhQK/ExFkh+
	 G0irEr9yvmJisPb9p88yUfUMz0k4lvK5WCc/GvSFflV7C9VTR/5vQPkJo8Hj27Go62cH1
	 e/X63w7mu/x7M9KtgmEpL4NfCrx/XRGy+hpMuay9iSrhQeAt7Fkg+FLQ6fbDfHuRZ95Js
	 lyqf93wcV3KfgXVOUh6c+dn6P9q80Sn5xKsiE4SO49ejI23121GG+r5/6WaYaQlVZTYcQ
	 AMNiuZ0jvScv85iMT6S+e8jH4qNvCRpFzNDDwRGYOuwpKNUA9bUWE7WSiaYtXNMpLTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793410312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=nnMXVI7pxSqYqYmr+cJgAyqTawsiLp5YajS+zEQksOM=;
	b=y1A0UnwVNI0b32RK4YmiD/fpP1sm+cFgprRVteY4jZoB44LClXMoHsRQG0HEzirc7nRp
	 UOCtDbbZ583tYO7XLyioS5LfLX1UleNANIqfwmaL/RG4jgywTzbI3tN6n6NezcTMoFQ3I
	 4ToTOAYHsBHSh0MIC6ZefzmF9e1miU4J4O0PixQnrj5tVZT+SR9qba30xU/EmbAUfkmX6
	 CT+ylPgYzRKWih3cV9Jlia6pnNxfcquF1US8vHBn44QLpVfKHRsZVGnXKgh3gRRU4g2Uf
	 nYmRBXedxbUK1ouNZChtEqi87VwcntcUpZ5YnkNI0oB2omit6TX4g2gJwG8jOln9sZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VpTC+yCU;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8506F606A321
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 01:31:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8506F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VpTC+yCU
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36a24f47293so718108eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793410312; x=1794015112; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nnMXVI7pxSqYqYmr+cJgAyqTawsiLp5YajS+zEQksOM=;
        b=VpTC+yCU71DBdqXgz1LKbQNMOo+CoTVfbjagSAdjMqu/UezP7IeaVnTLbj+D8DT64a
         UgpIB/AoGz+QTWDXKQGu5eBN53Ah4U3OyB8xG/N4UtjGnTTAIK0698FSBrMBFrxeGUWW
         dcxhyrkWPDAlD055uHgNpHcaWdSU631DRHO8KUI/NjLmtA5C6YY62CoVuu41PEjbUR0w
         9yMpK2Rs0cVaYZTrJ6hOV4KrowM3q6fE44FlnK+e4WVWcaLDUFryb6sQP5InEHohby/Z
         TgZmnqsMovDi8VQmWkxF9tt+UpGJDOKDk8/JAOA8TqAZAgNpbI5lnV5R97otEtz8uMJy
         TddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793410312; x=1794015112;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nnMXVI7pxSqYqYmr+cJgAyqTawsiLp5YajS+zEQksOM=;
        b=eE7G1qnBftdWJxkdoAu9HPBezbRmL5omjykbQPUXw9ltCeXUJwq3txYzizUJqfu8d9
         LCcJoBZzEOveIs0zRRhVlqJEWIuYyNGOj6ZrvbEXirwIYPa07HhGcxiFmTEsiWh+OGCU
         bqOArqDXhwzxemXn7gRDoUY2/CK4VpAoCQ8JXKy9I++peyK9E3AtOO/9PiRnqHovTQAP
         rZPSHv1KgxYTIfCCdWN5vyz5L8/kzPYq+EmZW/avbvvofNktD3nFzqg+8czKcmz8cpcA
         AH3imQUy6oBc/6/zgA8AUuota7bwf+uHU5ZwW5snjGZ45r24+SFdvLcX97nmGR/pbD5v
         CowQ==
X-Forwarded-Encrypted: i=1; AKwUvBxl1GQvFHiH2u4HQSYw6cb/rITmqM/mON5DmCy3MOSOPQdpUeWCU4LPiEKhOzLLnSfRntTuuaInMY5841A=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0TmPosSl6qaRArzm1Opb+j9l1dJUZZWVCdG42a5VKNjB4uWjB
	twvpkmaVjZqVQU3hZX87sMMtFh0d9d4rIhjeEScDIQHRMddnGPaioqG+
X-Gm-Gg: AYBFou04Qhca4LJIlN30AV7R2Z4QZSCtkvutEgZAV/Tk8qa2woXOVZgCfhtCsBuX9uh
	C5z1PE2k6mXbtYkFpC/S8hhdwGA0/q/+BAB8v5jIzXDbfVzS93MPvJiFCpOMPxhnu1vji8KZA4T
	uGg1eqXtSQaHdVjNpRhv6oHd+4kAoSdGpeVwn+NbIGnouKDF091KmI1pLpKBSAsnkFjI/gAjrZG
	ny7jqDqj7EvusZ2SMWpUP1Y3bnbP0aaCys9JeTvp4+deVtUPnvceYlU7rtAqRK2xH2E87p1DS+F
	qOURTIoAXzQwzB52D5JplhJmFvJTTKZhuVwSfgU//JgfZ9skR1jFc9XJ12yqr/nthZqXBl9j9pJ
	cd1YHD0RZ8w8rVBP95f7AWYQAd9RkJ0Xn4Z8fG8qgAW2xepHTX9BzBUmqCV+KRTOMjEWi55RXap
	/k9i2IYPzqaCScPsNV4tYYQilIkwcFMMwFovQyuySTuc7E3MN4MsyhMk1+m75M1AsoHWKVZ0PPl
	KTEC1XoZergtkZfA2dCdzZNwa10/yUD0szT3g2XiVTpzmXCT1gnUVRcljR1mPRNdFicG/rHpGbb
	p9NvE2q4uNHh7GlvqdqqoEAvcNi3g/s6YKdeoi0fOQJzEZUk6eYG
X-Received: by 2002:a05:7301:1927:b0:369:f419:e7bb with SMTP id 5a478bee46e88-36a4260caacmr5280670eec.39.1793410311487;
        Fri, 30 Oct 2026 18:31:51 -0700 (PDT)
Received: from 192.168.1.3 ([2409:8a1e:2331:2850:d40c:1fcf:6319:8524])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4294419dsm11009649eec.18.2026.10.30.18.31.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 18:31:51 -0700 (PDT)
From: Rongzheng Wang <testwrzwrz@gmail.com>
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	Jason Xing <kerneljasonxing@gmail.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	stable@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v4 2/2] selftests/bpf: cover AF_XDP multi-buffer TX software checksum
Date: Sat, 31 Oct 2026 09:31:43 +0800
Message-Id: <20261031013143.42509-1-testwrzwrz@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <auT51NbSPvKJwgiD@devvm16445.scu0.facebook.com>
References: <20261030023248.78802-1-testwrzwrz@gmail.com> <20261030023248.78802-3-testwrzwrz@gmail.com> <auT51NbSPvKJwgiD@devvm16445.scu0.facebook.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> Any reason you're not reading the real value from
> /proc/sys/net/core/max_skb_frags ?

The test wants to exercise the maximum supported number of frames, but also
needs to run on every build. CONFIG_MAX_SKB_FRAGS ranges from 17 to 45, so
using the minimum (17, i.e. 18 frames) gives the largest bound that works
everywhere. af_xdp.rst documents the same limit:

  "For copy mode, the maximum supported number of frames in a packet is
   equal to CONFIG_MAX_SKB_FRAGS + 1."

xsk checks MAX_SKB_FRAGS directly (net/xdp/xsk.c), not
net.core.max_skb_frags. I also set net.core.max_skb_frags=4 and ran
xdp_metadata; it still passes, which confirms xsk does not consume that
sysctl. Reading it in this test would not tell us the xsk limit, and would
only reduce coverage if it is lowered.

CONFIG_MAX_SKB_FRAGS is compile-time and has no userspace interface, so 18
frames is the portable upper bound. That is why I used 17.

Thanks,
Rongzheng
