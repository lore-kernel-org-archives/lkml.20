Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793551624;
	b=2BDlZQc5TWc2miiI6uBk1LLo9f2IgQPOvQ8mIzfIZgvX/UN4dqJvp9BkOW2Ter2LrNqU
	 3NudvN9O15OYOcwvL5rnnFxrINXO+wKItN86UQhPdasZWn6CvJKnW2G72jlOY+wN53wMe
	 uE+CxTyRR5pxMxEfhSHtcDiocze3xHLbFqJ13GtJXID3Rw2dyjtTWSQBYJg6KByAUAjie
	 jnsmHuQXhDGgmsYjT5sd4pUpKJfAxa3ZLpma8P7uRux7F+MDUyIZg2nNSEdMtjCIacHH5
	 3yIexouCBW+yd57rwlmUxOUyYJTEsHC2PhOMtF0L0qbOP37QeyrdIDBZ92VAX0gguAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793551624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jcWwVvsHGcVV3wfMX+fsnT3+LWyvPrRI8VZs9//T46s=;
	b=FkbHwkr2o1Ch7a0V/ql8Qnc9yEYSl3AZ5MmOzzO27Nlvki1Kl5WSK6A/XRIcO5/VWb+P
	 Zg9FnJbSOXQceLOdH8eL/LqZkWe+Ab6vRPUsjAG02RoUhpK4/GApDX/bR2x4o7JzVlwwz
	 UiSkNdZ2TkBCODOTmfJ7My8Nf5suMJo8/7rBMe+A7+hgiOjJmF2LAm369srxGVjSbWouZ
	 PVNp4NoDOkj5mrzfTUXhlzsOxk10bUzcQYiKqy3ryPb0MRWj7N5OHMViaIDEKkx50fjS5
	 GdJa9XsL9OAX6Ic2ITnbr43KEZT1avsy4QfNrUBZmezoUDoc9d1iDAMaerKFsJZMjqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b="0I5fmee/";
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C3D606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 16:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51C3D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=0I5fmee/
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c43373ae89aso336259766b.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 08:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1793551623; x=1794156423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jcWwVvsHGcVV3wfMX+fsnT3+LWyvPrRI8VZs9//T46s=;
        b=0I5fmee/bbK+vJPMwHkrVXTZ0WrA3xaJuu4QUdVw1uC+SxykNpBaiAmZ0/zlcIKZey
         2XWmVonCdQ4yYx+tTi5IYoJb+WU3a7oDg69/M3DDRyzPUIqY/kyKH+Oe78pP+i3QNn/H
         0M5CnbZfE4osOoK9hiuqS3Z8s4kH8mkCM3dbWKBjDSa8tKn9cI5kVBhL/9SU8bkS213L
         YShiHmChcMvC2aqjiSdEXMRcLpqs3cmRAJBGWSs27kCMAM3JzXepqj4X43naeoHCy3HN
         qTfVm7HYfEDUKL1lloTZ6hraqRfkhRfqBgckwGOBWjmYvTBOteZ5uE9yfEcOb/gob9zZ
         UllQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551623; x=1794156423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jcWwVvsHGcVV3wfMX+fsnT3+LWyvPrRI8VZs9//T46s=;
        b=LtMjtbGLhUMlFBZUPLfH5uiMH8t4P86pQWmWtsW/2ppdy2o7bttgwAqglXa7TnySb/
         atHHCZDgD25IFkrtulDVx0K832Q0RudvFo4GIMSVV2mXExetgdJB5JNiFQ7Tdtb7qPAV
         YNBWwAO6a+1qGISWgjPQYmpESclYhefDG9f948f96NeXgIfGKxsqyuDfRb8d9tmvVuo7
         l8vV51CjUxveuxdgYX6yofOzJ5pSws5xfGcsZCWz+dx2mR8+2kp/ZSs1qgRoJNBdTeXZ
         6/Lwc1f51hVdjQGH/XdoTf8GI00VkPPZCFWlXX/P87IVF2eRKxxvjlTQDv2KjqNYgCo2
         4Y8A==
X-Forwarded-Encrypted: i=1; AKwUvBzWqRraJloksvVkF0RLlelm20xPaTw9nw7zGKzzfh59l7thVC1Ywyq5WrHwJs/5cTKbTSygVRPxiYdAehw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK73TP2FfhAgqafOoxAwtFHmZm/Q/6/q53d8vWZtgizNOl+vZzq
	f4Tm3ZuqF8qeSu/IQMOcMaKcpeuX92deWhCwDpCgTolncbOsJYXTxUNI7HfTtVdQ8A==
X-Gm-Gg: AYBFou1hsPgCkjkXdjNnep7wvt6zdhDJAj/qF26DXlnU0uckAxSTSo9mOwmsHbjMvrz
	YUImiWNDZBrAIXBgj/ljhndN8Kwu7+32XLx26uQcNX3ByIXJ3hlu7mvdzE+WPWm7T33v9BIbZB9
	lDO4mOQRGj091RLryz30yT5Z5oNzvHXSB4T3QO0Zh2gJTQfJ+E1/YFSOdYxs5Q5cyA4hUCbVixZ
	A6ErMG8LxUTfxtz4k3X3WmTmnNmKpJsNHCzWSqOKqCCG0d696TynchiwpLQ6zObeaDWfwux9/Pb
	tWYo2Jbzrg9tETwjZPBMiQPdX/9PXAw5WOxNqoXARe+IMtDVm9ql194RHJstG/+iKXKzWPR/JRJ
	OI9HGQv/GJqlk5NZrkIChfqK3yAs098ORbswYB/wC9/4nOxvxa7iNlO3vC+QAP4SjH7teAvRf/D
	k3Pkh9EHU6SgMNgI6Ie+YV7IghHOI+jrj704ZU4L35arPyebWrWgND8exVO6MJEzuTI1EnR4PrX
	L4E6MOccsJwPhT0cFxdHl5EuGE00gv+ehI3yHpb7NS1u5QOx+bk8X9NM/V384AkK3FlUu/INUxt
	JKjcxVKeZbU1HGUSQfQm8BKzTa8Gm3Ir7VL5PPk9UH57FjFFEJlWQ7oHx6kCbyCGWXjqmMf145P
	bpxH5McqcSGO3w4aLFVOpWK0b3uyiVqIhpKkCXqjSwVMpPNJESu0HgZLM9pZrG1WcsiM3wqZbmU
	LNWVH9MSUDZSk2ltardW9GU5QcHNdBKQK9jrOycq1qiMxD+m8Ix8blGoZr6paqcl1vqN7VfonYT
	wFKgLdHCPW4FSU4xQHEoUAo6XcgIWqkZiOcY8ZlJwQE6x+6cUeEDy95PQMcSOBJ00RF1VnG6EE2
	rl6DNid/6d0GdlMhdOY=
X-Received: by 2002:a17:907:a88e:b0:c3f:153a:8663 with SMTP id a640c23a62f3a-c4ca7b20cdcmr673840866b.23.1793551622679;
        Sun, 01 Nov 2026 08:47:02 -0800 (PST)
Received: from Desktop (p54aff790.dip0.t-ipconnect.de. [84.175.247.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfdc3csm291298166b.17.2026.11.01.08.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:47:02 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	steffen.klassert@secunet.com,
	willemb@google.com,
	jiayuan.chen@linux.dev,
	mfleming@cloudflare.com,
	almasrymina@google.com,
	bigeasy@linutronix.de,
	richardbgobert@gmail.com,
	ecree.xilinx@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3 2/4] ip_tunnel: move the TCP fixed-ID flag to the inner header
Date: Sun,  1 Nov 2026 17:47:01 +0100
Message-ID: <20261101164701.301997-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179241582749.3135.6106878374160339370@kernel.org>
References: <179241582749.3135.6106878374160339370@kernel.org>
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

> [Severity: Medium]
> iptunnel_handle_offloads() is not only used by the IP-in-IP tunnels.
[ ... ]
> Wouldn't the inner header then get iph->id = htons(id++) on every
> segment?

Agreed. gre_gso_segment() and __skb_udp_tunnel_segment() reset
encap_level before the inner inet_gso_segment(), which then tests
SKB_GSO_TCP_FIXEDID, so for an IPv6 outer header the patch turns kept
inner IDs into incrementing ones.

> [Severity: High]
> This assumes SKB_GSO_TCP_FIXEDID always describes the current outermost
> header when skb->encapsulation is 0. Does the decap side keep that true?

Agreed. iptunnel_pull_offloads() and bpf_skb_net_shrink() leave both
fixed-ID bits where they were, so after a decap SKB_GSO_TCP_FIXEDID still
describes the removed header. That is older than this patch: GRO sets
the inner bit for the inner header since 3271f19bf7b9, and nothing moves
it back on decap.

Multicast routing does not carry TCP, so the ipmr fix does not need this
patch, and v4 drops it. The fixed-ID state across encap, decap and the
GRE/UDP segmentation path is fixed separately in "[PATCH net 0/2] net:
keep the TCP fixed-ID flags on the header they describe":
https://lore.kernel.org/netdev/cover.1792857378.git.julius@bairaktaris.de/
