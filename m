Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794085120;
	b=PDY/DP+Kbsxw86K/DsR/FvmwMO8MDuX/1F950sr8ubeZMg8q2mPeCLzXxx/l68FzzWA6
	 90NGbTmWZ9azXDXIvFB01v4ELa4XEHcJ4zYFnLjJ8YY2zV0+QoZMnXdBnOS+KzFgjW247
	 TcsMEUIqkzKBlW9Aikfb4GF3TObbErcJqP86cVccRFK/S41s/AuTRtUsxFB4Ty0bdsyxb
	 Jxo9mMJ5t4FqXNTvk9NcKhbu44JjxfCZw9xONc0dYl5jlZN/OZ7iYHZJoLl+05zH5GQsQ
	 pA7VYoaGKU4z8g0xaT32qMF/KrcLlfNhP11Og1KLd02bjHTj5egqPADakuIg+UXr4/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794085120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MquOJTyAOSA85wPBCkYjBgdo8R4QVbXqYtRJqICmdiI=;
	b=lOnAg2C5Lv4Py+Nb3rrnZf3nKGmvgeckfCb3xYFxJKK4AxH7YRjhUiOwGNWrOgUZ9Uhu
	 3NuMUY8iSssnpfkLp/TE5wCC2H+pyrQ8qrDatLAlyf1VRHa2rlVgKTQaqEuU/RfEIBHf2
	 KWEMBCZR2q4xtE/39NdYtmnwaCPGDbj6Pakgpp5t6Wfx3vaB2G7ExNFKVGpgWw73PaKvq
	 ujuQIhmciI/bnGbU6ROdZG6Bb94BpuzFOLt+oHUHYT8XWyFc3uWVL6n21iJEPcnpjIach
	 Po1TccWZJsm2gXM0+gK31NTZ7N5HyKc89+jyEVwStS+QuJchXSLmVMav/yIfz5eYkzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O+zMOrQB;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3723606A32E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 20:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3723606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O+zMOrQB
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so105615e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 12:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794085118; x=1794689918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MquOJTyAOSA85wPBCkYjBgdo8R4QVbXqYtRJqICmdiI=;
        b=O+zMOrQBc6YPVqLx7vh4M83N1v+pRXf5SAk27K9jRtk5LMl1sqRKMTIWe3E30PZ0n3
         2ABeN4Zd0tE42EOb/hsgrDMSKQLNNWwG9JqvLrMa7Bt5vdLlAFRtx0JEPWa5ZYcXKh3t
         JG/QKW6I8OD78M4TftXyCsvDJhoWWunh2trOJwV9ugF7hcKdo4VQsqZ8vBtzcGQP/fva
         f2/3mJiuHqyIkJURlbT3oY96XldAAoiEbZ3NA82l0JqYW5GRfFoLhNhUUH6ScpEtS0Dc
         t25t0Rt5wbLLDdp9Dw+FaTO748r1cvuXvySVLFtWMF3HTB6TBijZ+uzwWoe5nYZUSkt0
         sKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794085118; x=1794689918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MquOJTyAOSA85wPBCkYjBgdo8R4QVbXqYtRJqICmdiI=;
        b=JeaFMNb2jKd2rFdaPzBFYGh/ghn7YRV9Gb9ddj0ZZXr2WPHYcDnnPlU1VAlZdIv0p1
         m7RWyGGFHW83barQxARUfuWno0SmzaB1CejmMZRzecr6gBxFjKuhQH08d2Vbg/ez8c7d
         zuIawr46U256fkQym5/DRhHCCsSzxtn4QD+8u1S2+PXHJwnAFJQc0EKxOkgzPM7bdW7r
         ZFx5OKqjfN2TAMKzVOnB1O2jYdOkTxisBiz79iNOZRVVqPUpflHE+V5qEN71TMy7Sq71
         p1YvgCLGz4tlOWJtYZgqmTC0PvfK2M+g4B1qUFDJzhp6miyQhGZIiGMB7Kfw2UEDxyaF
         0tKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCT/f80zxC7Lolqe0SiKzdAjtPDkVTCuZAOPsGPISHD7dVZROEyZOsCJ7ysF7YaIZ6Y7+8d3z4DyvHBbs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9x4GZ+WjSTp/T0f8OfTZ8gg3s5H5kr6J0i6EygNk7mfFnn8+ZM
	q4+2kFwg/i2bq88fxiwK3HS9JzpGtCLIqMLQ9HJI8qhrORgRDjmRb1/Q
X-Gm-Gg: AYBFou21RznVOx9yU3juCJfaayTDnnhYNYgwm+4q6hAnZ5DyF1CqGzOSwj3dYdS8jU4
	UeYXIp/wdKc9gxdW+Re/IhtRdAM6eipJ31TJSGHLPTvKpXiLn4cj88ky0MOnEwDekMRgEcTGk4s
	XMylRtXuM7ixN8ZgBXgktvY4pHqnSkbi96IDX1QeuZQ5GrwCpy3ZsWuxwGiCKFBnS5tltBYjv8k
	aVkJMZHQlFNJvJKQDpEmSq3h6Z4bxXf1/8ddiXguNtdnvzIYjR9qZMKybW34j6x+rSrr8rkvpo9
	soESA+aYCzn/8K+ohF6JTBtDbwBBIMxNAdl82A+5RRcLWj7a1FkhzloU2Cl5aMgOcmZ2L6cF4cK
	2Uu5GBm/eu1XIWyGoCp+mNADZPn0boOjNuiptTVuQ1vzQ+RA4E1y6rewusU6m+QD82VtMRVFdqo
	TVUy30SO9Yyo1nvDv5YBKQhnwO0wZyU+kezcUiDy1UPB7VGi3MnNj8aVMrtwwBbnvnHKUhEvTf5
	s8sfI3kHpAlQVoIHwm2Y09+bRzFxqxnWSX0HlYqa74aTyUdLpek4ilXWyME13S0+NU6uA5/6FSc
	zKfIQNfRnvFOiJiLfSYP47FEWUcilAw0XLqvs4dp86YMVjU2bUHvZb1PsbPaUNnIU8kl3roueXg
	H4Nup4oh0pZnqBY68JD5JN6BD/Cs2xRU/dNzPgw==
X-Received: by 2002:a05:600c:3d96:b0:4a1:7ec7:a479 with SMTP id 5b1f17b1804b1-4b6df7d4d86mr97639175e9.33.1794085118056;
        Sat, 07 Nov 2026 12:58:38 -0800 (PST)
Received: from DESKTOP-0KSTGNI.localdomain ([197.52.47.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee1ddc7sm8536545e9.4.2026.11.07.12.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:58:37 -0800 (PST)
From: Temitope obabi <obabitemitope765@gmail.com>
To: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: linux-afs@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Temitope obabi <obabitemitope765@gmail.com>
Subject: [PATCH v3] rxrpc: Remove unused rxrpc_drop_ack tracepoint
Date: Sat,  7 Nov 2026 22:56:37 +0200
Message-ID: <20261107205637.665-1-obabitemitope765@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The only call to trace_rxrpc_drop_ack(), in rxrpc_send_ACK(), was removed
by commit 5e6ef4f1017c ("rxrpc: Make the I/O thread take over the call and
local processor work"). The tracepoint is no longer reached by any caller.

Removing this tracepoint avoids keeping unused tracing code and makes the
code easier to maintain. Each defined tracepoint also takes up around 5K of
code and data, even when it is never used.

Fixes: 5e6ef4f1017c ("rxrpc: Make the I/O thread take over the call and local processor work")
Signed-off-by: Temitope obabi <obabitemitope765@gmail.com>
---
 include/trace/events/rxrpc.h | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/include/trace/events/rxrpc.h b/include/trace/events/rxrpc.h
index 56dc9b614071..ec145da21ca8 100644
--- a/include/trace/events/rxrpc.h
+++ b/include/trace/events/rxrpc.h
@@ -1837,35 +1837,6 @@ TRACE_EVENT(rxrpc_send_ack,
 		      __entry->serial)
 	    );
 
-TRACE_EVENT(rxrpc_drop_ack,
-	    TP_PROTO(struct rxrpc_call *call, enum rxrpc_propose_ack_trace why,
-		     u8 ack_reason, rxrpc_serial_t serial, bool nobuf),
-
-	    TP_ARGS(call, why, ack_reason, serial, nobuf),
-
-	    TP_STRUCT__entry(
-		    __field(unsigned int,			call)
-		    __field(enum rxrpc_propose_ack_trace,	why)
-		    __field(rxrpc_serial_t,			serial)
-		    __field(u8,					ack_reason)
-		    __field(bool,				nobuf)
-			     ),
-
-	    TP_fast_assign(
-		    __entry->call	= call->debug_id;
-		    __entry->why	= why;
-		    __entry->serial	= serial;
-		    __entry->ack_reason	= ack_reason;
-		    __entry->nobuf	= nobuf;
-			   ),
-
-	    TP_printk("c=%08x %s %s r=%08x nbf=%u",
-		      __entry->call,
-		      __print_symbolic(__entry->why, rxrpc_propose_ack_traces),
-		      __print_symbolic(__entry->ack_reason, rxrpc_ack_names),
-		      __entry->serial, __entry->nobuf)
-	    );
-
 TRACE_EVENT(rxrpc_retransmit,
 	    TP_PROTO(struct rxrpc_call *call,
 		     struct rxrpc_send_data_req *req,
-- 
2.53.0

