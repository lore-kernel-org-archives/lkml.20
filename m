Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646882;
	b=fnAvI6pxwg1I41qW7Dz1DYd4qWGdeRdhuVgSkm4oFYLJZQfwwxKDh2Nw3l1ZjwBLcKSB
	 IdLewxyALg5XgzbMb0zLaxwTkDZkqHFfNfLJFTnhYdU6/hC0oGNJWDyp+RKXJTWf0gcDH
	 V/LTWGyHuJoto7ea+uX1wrs9cgZi482ikNNxlBg3PkLY5yyFHGMncTKhOmmm/+qcDMR21
	 wP5CD5joiwdhcgC/uW/VZypKShXofPb8bUREI5Fi+sQg6+UEFuhb/7OMWjrxmEaxP44yg
	 0k6FutwlAPmspF7sYnFgbfnVWF1whDnjpcmPEQaI5StaUb7DdtQp2OZW9q6VnYJhALg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=8mRY0dC3iNi2EAcGRxVrgoSrZHfhv1W7z/F4/S56g4Q=;
	b=DxxKUs7vocCGReRmv6rz2UbFHq/eUnRrZd4zTXq3IoqQZ4oF4xznCwnmbk/bWgkeVHAl
	 xVeFVORXVfEqoeTTK2SAbxFPSRD6g8VHFx3B6aGpNuTSeLtCy139i3+Qka40Wsh/bgkpN
	 YkrayExRXJMKuK2+A6Tw6+yO94uPt4ViDunakbmpc8ZjwaOeKxHQGtDSVm+ntvsrPGiF6
	 qr5vpplNAF42K/qpoI12x9Phx4+bgQY1D26vhTHvVaxXLMqF2Q8EjuEhYxeUCtuFjs9Z1
	 s46LNXYHyKr35pTPBMgWFlr/AJSCD1LHSbXVYjW1U7kR1AdR4O2DhFXzFQ0A8z7dEYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SDDON54F;
	arc=none smtp.remote-ip=74.125.229.133
Received: from mail-dl2-f5.google.com (mail-dl2-f5.google.com [74.125.229.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81513606D811
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:14:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81513606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SDDON54F
Received: by mail-dl2-f5.google.com with SMTP id a92af1059eb24-1ac216daf7dso1360828c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793646882; x=1794251682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8mRY0dC3iNi2EAcGRxVrgoSrZHfhv1W7z/F4/S56g4Q=;
        b=SDDON54Fyhv73iNsVlFcX6vkzj1Rcqv82e8IHNU2a9H2pE7/NUK+8QmuBhS/KW9bia
         Zj+q5+Bg2h+pm91gZhtPSRaKl9cb5II1TdTvAZVuFY3LNv8pk/I+TblRU/ufynzkWtk5
         VVv1ZM6i5z3mHDgCxVk9BfgaG5WEEDx/rABAA3+Dl0OMmJNNeUN8Hw4GGw8pdaC6fsWK
         GlkTIuLe0Ax9uMdRZhd6RT9tFbdU/pZdXv8HigKnphgjNsJA1+TNO7F/yfw43naSeJIz
         4idQqPyETGY+ma9czrAsaGDP9RZs2ND6WUFkk3vmHYhiOPWz3GkuVqIeOI9uA37DYnTy
         whaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793646882; x=1794251682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8mRY0dC3iNi2EAcGRxVrgoSrZHfhv1W7z/F4/S56g4Q=;
        b=STbiFoUYxYyrQQQTCFIhmVRCkeiH2Yf8lDdIXIa8X9nqw6JGOyTVd0qy9cWM5r6NpF
         LWig+0N0fJmLISHtX46/yTafCrI6ul2OP/udRmathswcw/3lUJWtFt7yKt4gQSdv+8/S
         8TPqhf0NFJjVt+djJGf8yYbf8s4Jec1LdB/36QVdGg+wC5KHTI87CFOm5QWTvofyTUuC
         dHVL/+Rj2ojEIVf6c9aedm4H8Z1h/r6zlB+mh4p32sPnAxBGFJc34Lw4MS7SkTXDqXNv
         7sCIWZo6oBK8VLxUViIjA/nnA+jgzOd8Xq3iPj3UBHRCyWdpgL7deoROrH80FS48eAwP
         P2Hg==
X-Forwarded-Encrypted: i=1; AKwUvByY59PUj8wO6OBO0gBIwRmFTr9spbEy9ZdXUGHPiFAYdDeb1+u26glJ22CEpfwLeVsrJFFinxIFuRRpX80=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDN9ZfkMEQvX1gib8NbuKa2YJZ178pg1pladv1wAZQLejCKMHr
	VjFmYsbagGqiOEuf/f0infvYlEb0DvvHC77HAgbmZiOQbWPo6Bw2KceM
X-Gm-Gg: AYBFou2sC9IQ3rdDeBLGTFjlLQ8cWYwarujF1jDcoGgcNKtUdeNkhJU0NfxcLgeRf1u
	aPKvOe5ztvrFv6espB6ZM7WoVBA7ReWdBMSJ+g2ngh7NKmRVk39nOGXb/5hXSlbQz5EzdEHRwct
	eXuNILm0I5NrhvnUi7DqCdo+zWp+EIJFaacES1q9sj7voIw4wJUx4uCvagzVfN56ZOYHxLwgRlu
	BSR8diwfru7lq42GB0f3M/EF8NkBVhFpZ/5RqnGl4qJKXsV7gxSc2LO0LNrAEUBLA9BzkqYhEH7
	FKYgFKTYFoUC3ulhnTStT9C16JhMbPdmbxdGCjKl4nH/y63jCUiSRQC4adH3Po0A2TdX/RsWefn
	o/kTqEgPhGB/CpZuq4qtgTBlUpogCrPVZPG1xcue07vu97ktEj2173kIJamjO0jzYMieKtkmbUg
	eizh7q6A3iWM5eQvkqvVUx7f0hVOZD3w5bAxcg+aRqrVwzI61gKw5OEkgj8EOkqurCNiMVCyUVz
	EyjWYYVSL2AcICLxa6JH7h4azqmeveK+yKSBROe30KBhWMQFeLrpjSqTjI3HaUaRTpzHE0k9aeG
	AjGR0o0WlAQfrSha12Ov4Tk=
X-Received: by 2002:a05:7300:2442:b0:36a:2059:6c85 with SMTP id 5a478bee46e88-36a42454b4dmr18746729eec.34.1793646881637;
        Mon, 02 Nov 2026 11:14:41 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:60::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a504c6sm40157681eec.21.2026.11.02.11.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:14:41 -0800 (PST)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	edumazet@kernel.org,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	sdf@fomichev.me,
	almasrymina@google.com,
	bobbyeshleman@meta.com,
	asml.silence@gmail.com,
	daniel@iogearbox.net,
	razor@blackwall.org,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 2/7] net: devmem: charge the frag length to TX skb truesize
Date: Mon,  2 Nov 2026 11:14:33 -0800
Message-ID: <20261102191438.1059771-3-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102191438.1059771-1-sdf@fomichev.me>
References: <20261102191438.1059771-1-sdf@fomichev.me>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

truesize isn't well defined for devmem TX frags: they point into a
dmabuf which stays mapped for the lifetime of the binding, and freeing
the skb releases no memory. The charge only feeds sk_sndbuf and TSQ,
which limit queued bytes.

Charge the frag length instead of PAGE_SIZE:
- TCP uncharges in bytes (tcp_trim_head(), tcp_fragment(),
  tso_fragment()), so the charge must not be smaller than the frag.
  PAGE_SIZE only guarantees that while net_iovs are PAGE_SIZE.
- Frags shorter than a page now count their length, not a page.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 net/core/datagram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/datagram.c b/net/core/datagram.c
index ecc30a6f8302..489d92fe6dae 100644
--- a/net/core/datagram.c
+++ b/net/core/datagram.c
@@ -737,7 +737,7 @@ zerocopy_fill_skb_from_devmem(struct sk_buff *skb, struct iov_iter *from,
 
 		netmem_inc_ref(net_iov_to_netmem(niov));
 		skb_add_rx_frag_netmem(skb, i, net_iov_to_netmem(niov), off,
-				       size, PAGE_SIZE);
+				       size, size);
 		iov_iter_advance(from, size);
 		length -= size;
 		i++;
-- 
2.53.0-Meta

