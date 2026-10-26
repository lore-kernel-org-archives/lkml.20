Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792992474;
	b=sZOl+lwV2Wh/2GL/15RO2RsWh/hw4emOCsiYlxBiGqG92DfoZQJZRNapbMylWvcD0cnR
	 jVA41ksULL0NR13ysiUSyK090btS+EnVPtkuuLXMA/lzojKoG/ZHsf2TrFV512s+GCwAK
	 I1BK85GJezzMdmuSQUVRvu//Vah8m2i/dlzFP1Guyi5x0VZBDngZw2DXHcDiRhzfHp5Q8
	 2PZsUDUhArzjggnPYShniOjyHzAoXsEmPNZXntVkjPo0/a5eBZ7A4+w/w2u5Awf37BmwS
	 hNqb0Uh0A12+BYY9fdAYAiz5A3fzF6PXtYp6PQ/D4AD9NSR7yEa2brefkQ8vrqp+2VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792992474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c2vVLfr5r23oMNsvxAvIsVWSucEEuXtAs0YtxOnot1U=;
	b=u7Et94bOmfEHj0SaDvBhzdUgW6S9EW7DwOT9gmw+Ro/ewGfRhKTNWQHu3Ovlu+VlJFWq
	 oUPH2PljXxIlG6qvrb0CL//oj0tceiTU87TrdpJ6lZjFa9sOC/grTEaBh1R0HbCyPj5/f
	 TqXsZSJMfbUuFQRPSBGzB6YJmScwXYn+5ZKKKF0dhp6ACJKiu8HqH7tc7ITk1YQ79R5ON
	 sfmVSgBc+HWW8B/pxeCEtPJPatDCnmnoR30zm5QHqMOj+myPHQ7Bc4uzAWpTQ6gwdqHjt
	 s4j3hqWlTxTDMfC3yxXG6tI+Zpyv6+mXQF0Bq4aBrxDcyuqYNbQSyLa/6YmgGlkd9+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="jMP/3eHG";
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3AC606A322
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E3AC606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jMP/3eHG
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-157fe9d771bso3099662c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792992473; x=1793597273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c2vVLfr5r23oMNsvxAvIsVWSucEEuXtAs0YtxOnot1U=;
        b=jMP/3eHG+EcjoJUjkHbgDNSNscVw1lpaVMGVmlUpSZzj8OH+U3b1U1M2BhE2Mv8I9+
         vqrrRNa5OA9HhlhBVpqgpBpk+jw8d9HwWsf/blISembtKeT6gaD0G3HT7EacBY1BhFNA
         QazbKzpgew+ACfErhewIOJ3thbxuc2XrD5GfdKyk8zl6bM+EIWPMksj6qQ3oBrXZOzwC
         mpWCSIUiPObAEG/CqyHrzXy7Fa4E05tF/kJHXvIHnKYcNxDDGyyKgG36WcNdxV5hs+0E
         rXurmLsgyIVpwv09sjXTYPzp89m0LKWKukArbhcO9O1hgvfCJNbxYu4tl3umhJy8fGfi
         dynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792992473; x=1793597273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c2vVLfr5r23oMNsvxAvIsVWSucEEuXtAs0YtxOnot1U=;
        b=OUPUhW9C41Sh2Mb6cyiGc1IXh5KStsasOgJo2ruTHnY8ysSVtqSZgLzZWiZ3NlhqOh
         0vHROZ2EOY+MtpMAFdS4Xljf8xpCgy0jmAKuQU5FKQGzA8l/5ZL51dLPJpNjl9+mcys+
         OKzaRPbvBNoxh9wglj9cTr5dyiujztxNpsH94vvxe5mmJD1XvFZTNNwdyjIrjWXP9EEl
         K92R4e57w3FDgySYMv6Tpv0jsEDCYaxvYn7DUuAfFf30wKNkAhg46hxbu7V8CE+xVrRf
         dUg9byVlFVa0N2bW/IqTBlRRVgdXptElj2VH9RF1tNBXGc8nq+dUZQqKpOWkz3uBl6du
         Qn8A==
X-Forwarded-Encrypted: i=1; AKwUvBxTSjYa7S5sUzRwTWPn8A4SC39VRF+i0R+kfD2fsBgQf9NsLOTCXJN8tqvrFREq9z3guvqiwd2rwzD1N8w=@vger.kernel.org
X-Gm-Message-State: AFq9FYImx9wFdrwAwnpT7xCLWMsemYMnRLUdLIpsOqegoMdNBgq5X6A6
	S4565pVG6TFffv0DYT70coEv4dl7PnfRUxNLVa4kQvxe1zQgymGdf3nB
X-Gm-Gg: AYBFou2z5TtTFX0lHYvgAp128Z170YXG/L/mTJ8l7WRdQ18Ogu9JdutEjhY2UECLOgC
	A6qX8Xxssr4Mxk5opD6PNXsOgUhaOH1g2AebN/jj5pp3RApYu4M+qEET68YIf4Wk+E9tvQrc/qr
	DNK6gDDNhGY70Wfz1U+pYZ+NNbLwSz5V/nE8kg/vBI0Gh95ic1dA9p75QGPK54ViIJd/4+1dYD5
	/sbqf1qPB+hIF/BVoLLJwR7/ChR6Ys4lYNxXW+zJcmZvfJRiy6+vbAglnfyVJELMpExoqD1VfQu
	rRs3B19v73uTBrulR3VcRdotLkJraL+gtROvbwRNGnUynrD2mzKC6D735CeroI5WQVAcgPcyJvo
	vn4lCGLIV6CebFfcBOnz1Ds7Dw6kKuKRVWftNypqOPcx/yh4cV1hgsMYfoBrsEWEASD3h0t71TS
	OdSJStMcHzKE1jUQ4uabReBru19H/rDTpug7XaXzps6pIzBcQnB7iIJ7wd3rB4M++gsPjm3T0Eq
	HlAWSWjTBBhz8tRTWOOT19CJWYndXMX0tVGuOIg7+SeVcjAvIAeiR94JH/Kzfj+tok5WLYz/Wc5
	o36z6m8/hkeKO5wq/Iq4ERvyOQ==
X-Received: by 2002:a05:7022:b04b:10b0:164:4e36:f956 with SMTP id a92af1059eb24-19935905c52mr8981726c88.16.1792992473149;
        Sun, 25 Oct 2026 22:27:53 -0700 (PDT)
Received: from localhost.localdomain ([136.25.42.214])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0e8d700sm25064523c88.10.2026.10.25.22.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:27:52 -0700 (PDT)
From: Tim Budding <tim.budding@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	linux-sctp@vger.kernel.org,
	lucien.xin@gmail.com,
	marcelo.leitner@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH net 4/4] selftests: net: add SCTP I-FORWARD-TSN tests with message interleaving
Date: Sun, 25 Oct 2026 22:27:48 -0700
Message-Id: <20261026052748.187496-1-tim.budding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <179293012994.3134.15218902499880345860@kernel.org>
References: <20261024120627.837568-5-tim.budding@gmail.com> <179293012994.3134.15218902499880345860@kernel.org>
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

On Sun, 25 Oct 2026 12:08:49 +0000, netdev-bot+sashiko@kernel.org wrote:
> [Severity: Low]
> This isn't a bug, but the deadline check and the poll() timeout use two
> separate now_ms() samples. If end - now_ms() comes out negative, poll()
> blocks with no timeout.

Agreed, I'll fix it in v2.

> [Severity: Low]
> Does the reset case check that queued I-DATA is discarded on reset?

[...]

> The test does show that MIDs restart at 0, because the marker is
> delivered. Could the test leave stale fragments, or a message in partial
> delivery, pending on the server when the reset is issued?

Agreed. As it stands, the reset test only shows that the reset
completes and that MIDs start again from 0. A reset is only performed
when the data sender has nothing outstanding, so in v2 the pending data
will come from two PR-SCTP messages that the client abandons while nft
drops the I-FORWARD-TSN: one partly received on stream 0 and one in
partial delivery on stream 1. The reset is requested once by the server
and once by the client, so that both new abort_pd() calls are covered.
The test then checks for SCTP_PARTIAL_DELIVERY_ABORTED on stream 1,
that RX_QUEUE is 0, and that a new fragmented message on stream 0,
which reuses MID 0, is delivered intact.

> [Severity: Medium]
> Can the RX_QUEUE check fail on a correct kernel in the ordered and
> unordered tests?

[...]

> Should this poll assoc_rx_queue() until it reaches 0, with a timeout?
> Or wait for some sign on the server that the I-FORWARD-TSN was
> processed?

Yes, confirmed. Lowering net.core.wmem_default alone wasn't enough:
there were no failures in 140 runs between 212992 and 66000. small is
then sent after all of big, but Nagle holds the marker back until small
is abandoned, and it then goes out in the same packet as the
I-FORWARD-TSN, behind it. With SCTP_NODELAY on the client and
wmem_default=70000, the ordered and unordered tests fail 10 times out
of 10 with "2464 bytes left queued on the association": the marker
goes out right after small, and the I-FORWARD-TSN follows one RTO
(300 ms) later.

Rather than poll RX_QUEUE, v2 will have the client wait (with a
timeout) until all of its data has been acked, i.e. until SCTP_STATUS
sstat_unackdata is 0, and then check RX_QUEUE once. The server's
cumulative TSN can only move past the abandoned TSN once it has
processed the I-FORWARD-TSN, so the check no longer depends on timing.
