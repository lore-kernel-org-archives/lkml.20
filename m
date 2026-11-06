Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793927755;
	b=KN3FfqCCQAa/uDpa2o5ssKbD6RZxVdULXF4qBVByAXgQAiEC8elYqKS4+QrbzEr5rAHd
	 AYa5huX1GlDNxYhfY1Bv0pU729pzlj3j96Ed9rg6AiOYg3+bFhi/lJrvdz8cc69qeHEUB
	 p+JUSUQ7/L68ukMuWFjeWpN9s0xH3sRb4S2SunOVvOKOJz6rc0rovFFaoFG3uZL7u994f
	 Q2M9BJQeU2QN7mmiNTObPLhGhxVB+/H2lb1i/mI1Hi4DmzRgk6qW7OrCAaTrOZv8Iv2Kz
	 3zAUTPlF3ddtgz+6UVrFh+MMxyJlW3THsYhJMBvd8qZLx75vHMKxzE5IxcYoVuYiqUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793927755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=alLL1aRZfj6wt40HSFYb5SB8NlHrXFN4c0xYy1pcLT8=;
	b=4DdOco7EgHUgrw7IvU84l+UbtaObsi8ujP8GduaPd4OOV7QBU5V0q1URUmh2/0JaACOg
	 Pfng8zRUZhmRgbKCYK2GkcAn5GeCUfV4e+/uJwi9ZivKvkQTo2GAdeVo2cjeDolsozmDM
	 iY89GEaBKhVO8U2jASKv/o3gO0zDeU/KsR3tvsMFCwvFfrmpoxsZw4xYHrERSdXyrx9L7
	 W/cPPY7z1Ox3bPJmpFzevhLcjxp9lzk4w+Ohgh/Bktj2R5Cr7Gu8iEiSicpFAdmM6aSJk
	 hqJV6DbRf/ruhTHbRb63hGNLKjgpW9vqKV/0zeNTgtjntss2se6UGbrbjJUVBN2TdaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P8IFIrWJ;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99874606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 01:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99874606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P8IFIrWJ
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b0a921ee46so516937b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 17:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793927754; x=1794532554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=alLL1aRZfj6wt40HSFYb5SB8NlHrXFN4c0xYy1pcLT8=;
        b=P8IFIrWJKzcIslrm1VEd1vQmHhWOwjik1vgKMosMn2cVAasyQLrSdQOCyWtd6A5AgJ
         l2Ix/ysD3Bjrv6ONnAGyTawfQ104cCSJuxF6MOOiEOlnM2jvtmGzUTCu1g8iGYGCGmoO
         7ssKSX2Z49ZqQXHf5uzA71r4AXg5yVy8+whe8RfuKr28ol/Gx6ziV9QqgoVvTJyGH+Wd
         IL6j/kRtk+WxECFfS2ypGBEtvaZ/Ju8fsCBq1zyfT4Ag+BdZOO9epNGmojJwYQ2+WY2i
         qaaZwfLSPnIHuScJQyWHCTqWFM2cM6B4JnM41zrSFL5ryl1yYY5JQeCCpezXSIJldnFG
         zf/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793927754; x=1794532554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=alLL1aRZfj6wt40HSFYb5SB8NlHrXFN4c0xYy1pcLT8=;
        b=rsFQ8FbTXmF3avqF8aMQohDvkLU+4q34+5viIYYVcs5+8+DHwkmUkGD8RxtbDVGaMG
         tF7QytYDjjksp+2bk9kg465Y5QzBkkPrFQGeunt5rpUH8k2zmnrEJISRiKlteK/qDe5K
         eQIa4lONsbqMfVP+jIqytnI5G0kPYohiqPqRqbFwo5zWUGIF/F6ekyHj4LijlFI9SGZy
         ymDUBtSuhDNE58o/W655oQuGuG6B/IE0r46zbOYn7K0XqMUg+6pfrvBOykYJsGwBIT0a
         y7KKC3jEnMPkOWsfUY97Dmz3j9G8+377TRzx8w0mUMoyIkok6ezq6XSkN+s2WqajQRHf
         TGGQ==
X-Forwarded-Encrypted: i=1; AL+hErG3UXU3vJosEtzzW8Vdorj94agYKhzc5H3996I8ktW+ttMNe7wP8iWIW3t34F6Hx/3pkhm2ZZxotVlA4IE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/27GcboLUzy5jYcDBQonhJy+uf5Fe1PYLnUn8QMi1iEXOHwAB2
	RJ4nvLh5GOTZNllM4WXi3UtUGSsAEyZ+YXCBvSOm9v5+utibMiVNvc0u
X-Gm-Gg: AYBFou00Q3bRSo3rFoER3C4cw5I+/yzcrTPaQPXftDEkwbktXn3H6ZBRhfeEjRL/QUU
	PgJXKDRsQryrF5B7yXtXWoiqHc0fvUdZy5kfcwy9P29Hs7DV4K3R+5JzZdrZbs2AE7GNcBM3u6m
	e2sV5wVm8lUXigJfYsf0WU3Rj624ZJllguIK1Rv3zAHdHHTx508HM/vwmpuwZKAatQKsHLIKa/6
	0wWH1hG7berk3gzhZjoyGviJuRokFxL8EEowdvt5EhTl0ZKrPRqtpJgd1iSUa9VJkSWd/exOvPF
	3vy2dFhFqgF6EVJNKRLjaOwdJ4NbVDOPL5k0CN1UKACqr0nttvJjGjNF2WTc/R89lLwJUV7jwHg
	upc9d3zgALbubn2oUSTX/ifwX9oZ4TkMnyS6S5uoBO7xLKAFpI/TocDFROb5JZIuD+at41oRCF6
	rY5SR0iBoRQghNEQ9hVy5T8FzcdB59Q2MJya+VHxrClCwLvjmTMyubXFUx1i7e7azzI2bUZOALx
	L2kV5ijIOLCChdHkcWYxn8lKP1JFYhShpJJVEABdTn/hJHn/6PEuX37PX4xUQ0D7Q8+C2tveY/p
	seq+1rKR5QJGEv9VOA7dxrr8RKzAlghZpJlqsyQXyocj7aRS7JR0zQ==
X-Received: by 2002:a05:690c:f03:b0:8b0:db26:88be with SMTP id 00721157ae682-8b341921355mr4114727b3.19.1793927753513;
        Thu, 05 Nov 2026 17:15:53 -0800 (PST)
Received: from VPN-156-173.vpn.usf.edu ([2607:fe50:0:f802::4046])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f7721ddsm8307427b3.7.2026.11.05.17.15.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 17:15:53 -0800 (PST)
From: Juan Agustin Niccolini <juanagusnicco@gmail.com>
To: netdev@vger.kernel.org,
	linux-afs@lists.infradead.org
Cc: dhowells@redhat.com,
	marc.dionne@auristor.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@kernel.org,
	davem@davemloft.net,
	horms@kernel.org,
	jaltman@auristor.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] rxrpc: Fix rxrpc_sock UAF caused by missing poke in rxrpc_abort_eproto()
Date: Thu,  5 Nov 2026 20:15:50 -0500
Message-ID: <20261106011550.59902-1-juanagusnicco@gmail.com>
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

Since commit 03fc55adf876 ("rxrpc: Only disconnect calls in the I/O
thread"), only the I/O thread disconnects a call from its connection
channel, and hence, code that completes a call elsewhere must poke it
with rxrpc_poke_call(), which queues the call for the I/O thread.

rxrpc_abort_eproto(), which aborts a call when a DATA packet fails
security verification in recvmsg() or rxrpc_kernel_recv_data(), marks
the call as complete but doesn't poke it.  The call is then never
disconnected, not even when its socket is closed, because
rxrpc_propose_abort() skips calls that are already complete.  It stays
in conn->channels[], and its call->socket pointer, which holds no
reference on the socket, dangles once the socket is closed and freed.

If the peer then sends an rxgk CHALLENGE on that connection,
rxrpc_post_challenge() finds the call and reads the freed socket's
flags.  If the socket had enabled RXRPC_MANAGE_RESPONSE, the call is
then passed to rxrpc_notify_socket_oob(), which takes the freed
socket's lock:

  BUG: KASAN: slab-use-after-free in rxrpc_input_conn_packet+0x3b2/0x820
  Read of size 8 at addr ff1100011b343328 by task krxrpcio/21029/1030
  ...
  BUG: KASAN: slab-use-after-free in _raw_spin_lock_irq+0x72/0xe0
  Write of size 4 at addr ff1100011b343308 by task krxrpcio/21029/1030
  Call Trace:
   _raw_spin_lock_irq+0x72/0xe0
   rxrpc_notify_socket_oob+0x54/0x3f0
   rxrpc_input_conn_packet+0x682/0x820
   rxrpc_input_packet_on_conn.part.0+0x5f4/0xc30
   rxrpc_input_packet.constprop.0+0x8a2/0xea0
   rxrpc_io_thread+0x944/0x1570

rxrpc_post_challenge() doesn't appear in the reports because the
compiler inlined it into rxrpc_input_conn_packet().

Depending on the freed socket's contents, rxrpc_notify_socket_oob()
can also call a function pointer obtained from it (sk->sk_data_ready()
or rx->app_ops->notify_oob()).  The use-after-free is deterministic, an
unprivileged process can trigger it, and since the attacker controls
when the CHALLENGE is sent, they can reclaim the freed memory first.
These conditions make the bug reliably exploitable to hijack kernel
control flow and escalate privileges.

Note that without rxgk the stranded call still leaks.  A client call
pins its connection, so destroying the local endpoint hits the BUG()
in rxrpc_destroy_client_conn_ids(); and for any stranded call, netns
teardown hangs in rxrpc_destroy_all_calls() waiting for it to be
freed.

Fix this by poking the call from rxrpc_abort_eproto(), as
rxrpc_abort_calls() already does.

Fixes: 03fc55adf876 ("rxrpc: Only disconnect calls in the I/O thread")
Cc: stable@vger.kernel.org
Signed-off-by: Juan Agustin Niccolini <juanagusnicco@gmail.com>
---
A deterministic reproducer for the KASAN report above is available on
request.  A working privilege escalation exploit was sent to
security@kernel.org on 20 October, and I can share it with the rxrpc
and netdev maintainers upon request.  The bug was first reported to
the rxrpc maintainers and the security team on 11 October.  rxrpc
autoloads on Ubuntu, Fedora, and Arch when any process opens an
AF_RXRPC socket.

 net/rxrpc/ar-internal.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/rxrpc/ar-internal.h b/net/rxrpc/ar-internal.h
index 865f05fe37ab..31528b5e34cb 100644
--- a/net/rxrpc/ar-internal.h
+++ b/net/rxrpc/ar-internal.h
@@ -1455,6 +1455,7 @@ static inline int rxrpc_abort_eproto(struct rxrpc_call *call,
 	struct rxrpc_skb_priv *sp = rxrpc_skb(skb);
 
 	rxrpc_abort_call(call, sp->hdr.seq, abort_code, -EPROTO, why);
+	rxrpc_poke_call(call, rxrpc_call_poke_abort);
 	return -EPROTO;
 }
 

base-commit: fafbc4051123d5459ea6950899cec08ed946e278
-- 
2.53.0

