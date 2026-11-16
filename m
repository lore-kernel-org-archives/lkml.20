Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830687;
	b=fl23rEiMr5PNSq2rgMjNgu15ACkTfFHSS//4xTZjx4TrEIV1C91Y1U2klRWcKSVQb+hM
	 gSArpZ7p8/68OkL5X3D0qd8sWFpxUpuC1N7MA9P49vwflbaJ4qa14XC6Ig+74U7+7HP/j
	 D9U3gsL71K0lJmDfbhanJ5U3H3BBnExQVbFgq+cshDKwsWUMT41E+keeQjgcFOiUF8VBA
	 aozVC1giTt8QxsMKYUBfWoNdYVYcP4CeZXCgx5gS6F5c+DMpAK2h8wUp98JenZJmstLcH
	 z2KHYz+TZ60MjPD6xL5kmG0RRdKTj6h4TWbpyCfXLgCo/WCLW/kGicQ/wgYdnYKYFDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=w+hLSSBEQLeaadJ4ehRvrNvghPc5ZJYcY8eWYUFvqOA=;
	b=f8Ee0tjSGni6MvRtdOLplBNhVPtyCpHbiHpjwtsqUDXBmMELZew+aPkaP6+KUmhTxrWm
	 vupbTLynqoRhGH42cb7WqcFt+BNB32/69fgzxIt8V+zIcdK9HBhSPv8n5bJlPv6x2/nGr
	 M2wUXZrIQkz8mQfYFG46S0bJsVAKRxchRsITlVNgpRcnr+YQMDPapUp9jp2W/qU4+Edx5
	 KqHMrWWcZan8M4M5uYgrmVVEDO98UbrQ3Jr2hs7n8ZWAlj5kygLdsNjwyoaOWhskK1SmQ
	 BaHl4rpBHUH38SPsk9AQba0YiqPzSXu2hl2N3n4ArE6UVHwjXYI8mEM4dvoZMv2pZ+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R6ZQDB61;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCA0606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:04:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CCA0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R6ZQDB61
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b0dba37a7fso29510607b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794830685; x=1795435485; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w+hLSSBEQLeaadJ4ehRvrNvghPc5ZJYcY8eWYUFvqOA=;
        b=R6ZQDB61rzhvhYgQPcmWrTeolhLyLN32JqAJH7MI/omFjgFHMvVIpXo+zR84zcrSgw
         qYz3BPAqeMsqfoyxQbCnXsC9BAzK35cZZLYTm75I8urB4qwsg10LYufBTuarq9IALGu8
         pqj+ENF59L8XQJisukjrq2nksGwx+54ksp3C3KqTGKUASXuw9Nv5ihCKJC9Q4qD0qpS1
         s1aam+e4pLVvCr6i93Nwg3Hc16/cbtIRGxNAu0/GronzX458ySXXfT05ncBDXiLR1/vk
         U4sU6Xc7mJQPOfK/GxZqNYDLPHWdTEcs75sjI3WtpZJ2C24jEvsuSxgoC3YkrQLICpxI
         zE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830685; x=1795435485;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w+hLSSBEQLeaadJ4ehRvrNvghPc5ZJYcY8eWYUFvqOA=;
        b=AEYMUtyjIeWEYf0CefXNbgH/UvtqrfTM9Hx+kCmpkQB39UrUm8N+WGeG4oN7D7wNlw
         lBNvjmXAfunmBsW85ttKp3VKTqxt30Euvgb0NW6Bm2qEQgMOwphh8SAgWgbydLo9Nlgq
         z18/jU1UnOqT5fjOfkl96xhHYj5mHYc+W0+dJmDgZYyTsRpNk/gMzeMYMxuWkG1eGCiU
         WJoIKaFo7oRWbshPFL5p34Upudtr8bAMM/2BW6wUie1vKj+KZ44Fdz9nebAfMRVO1NE9
         A0MJrzCPLdXNzKRMQINMIVrBBjCApF2dA/m6fx1kuZDQgwMjqgIyjbPwZO4AUrRRR/tl
         T/0Q==
X-Forwarded-Encrypted: i=1; AL+hErGOyK5mddjrNMKOeoHGzw9xkWhvMSGzoDFus7YX6KzGrdy925T36ucuhuZxCUw4jbLLIMlD3BbVcNd+JCo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/BuiDyO3wWJc85BbFBiB0IiU/90mMzOQNzz+Fz3oOXiBXecoP
	BfmzoaYR1ULD1fOjqO/ZP8+RNRIrkqvXst1VUHrp54DJoSl8lZC3Ro6X
X-Gm-Gg: AZFdTZdyf2I1G9fR6SOr91oRRuH092sqluR2rbREMkJuEfVawKxqGGMR3gVqxe54AxQ
	M375YYcHC+a65YOG5wQ30G7tsSE6b5yErLArf1jetv6zTJK8mESMe+ngpV2yFcdhsBvhqp4NmI2
	/qAZ3xNgsREobAr4GWfLUYhaHO0z5ANZDC62JrchWvcRUbJj6Z+4OmLXiGmLFaEfFP6kcerrPMY
	4h7TcJroSI7f04d1G6TzVkb5OrXWohK+jvaNVe398sX6/QnTOM3LfGpHirZpbGj4nQErHCAH1YJ
	vy7UdKkCPK9XLywmzOXHs0qmU1bV79MnpfFFMstSOg99d+jdXmm52QshpRMSxrYronWJY6c4VL/
	p4ZcacgD9wvQ5ZHh9gBXbzNXfs2g276TmbMzX4tpIMPi0D8PZWiS+88wn9kkvzlQrAJG5SyvNxd
	HdMzJRZcF4uls2WinqAA66bG5GcsquLPHzGJ+xRLl3101+heaVhV3NRlWXffTf1fuRLdB8FJUC8
	qd1sKMObCe/69OyuqddR6GeMnYvtCTSEG/dUjr22IxyyUnwDTJ1xDQt2eubtVm4rhJtVkKaE7vR
	SxHiaFoc1UaCehlmfhcBOAJVFos3jL+UNfm09zxa/7HmQf+t
X-Received: by 2002:a05:690c:3181:b0:8ae:1acc:ad33 with SMTP id 00721157ae682-8b4aa305fd1mr44071397b3.58.1794830685512;
        Mon, 16 Nov 2026 04:04:45 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:71::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa9fae24sm83783927b3.41.2026.11.16.04.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:04:44 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Subject: [PATCH net-next v4 0/5] psp: support rekeying psp protected tcp
 connections
Date: Mon, 16 Nov 2026 04:04:35 -0800
Message-Id: <20261116-psp-v4-0-1a599df2aefa@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFPx+moC/13MywrCMBAF0F8pWRtJ82rryv8QFzGZtAH7ICmhU
 vrvxlQU3Qxc7py7ogDeQUCnYkUeogtuHFLghwLpTg0tYGdSRpRQSdLBU5gw0zVQK4UWmqP0OXm
 wbskrFzTAjAdYZnRNTefCPPpHno9l7t9LPC/FEhMsLGEcqLGKyXPbK3c/6rHPPtKPKQlpdkNfR
 jRS3QSxsqr+DfuaksjdsGRUbQyrrVAV/THbtj0BnDagwQgBAAA=
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Willem de Bruijn <willemb@google.com>
X-Mailer: b4 0.13.0

A note on v3 and later:
To keep this series short, I have split off some of the content that
appeared in v2, and also have planned future work that will make this
feature more robust, but not necessary to start. Here is the current
queue of follow up series:
 1. core tracked tx-key-count stat and SADB drain test case (from v2). I
    see this as able to stand alone as a series, and I also would like
    to report key deletion errors, but will have to touch mlx5 for that.
 2. core to end grace period if BQL is stalled. I think this deserves
    its own series for human discussion.
 3. Rate limiting rekey uAPIs. This has been suggusted by the bot, but
    whether or not it is needed depends on a bit on the deployment
    model.

Original cover letter:

The PSP architecture spec states the need for rekeying connections in
the event of a device key rotation. After a device key rotation has
occurred, a new rx derived key needs to be generated and sent out to the
other end of the connection sometime before the next device key rotation
occurs.

Because PSP connections involve two different keys at each endpoint,
one for decrypting ingress traffic, and one for encrypting egress
traffic, there are two types of rekeying events that need to be
supported. From the perspective of one endpoint of the connection:

1. rx rekey: we need to allocate a new spi + decryption key pair to
   provide to our peer.

2. tx rekey: our peer has provided us with a new spi + encryption key
   pair which we should use for encrypting traffic immediately.

In the case of rx rekeying, there is a period where it makes sense to
accept packets authenticated from either the previous or current spi. To
deal with that, we allow a psp_assoc to remember the last spi that was
valid on a socket due to a rekey. If authentication state does not match
the most recent assoc, the stored state from the previous assoc will be
tried.

In the case of tx rekeying, as soon as we install the new tx key, we
have no use for the previous one, and it can be disposed of immediately.
The only catch is in the case where hw uses a key handle in tx
descriptor state, as opposed to inlining the key directly. In this
case, psp core needs to be sure that any of these unaccounted for
references to key state are gone by the time it tries to sync a deleted
key to hw.

To deal with this race condition, we introduce a different path to key
deletion for psp_assocs removed from the socket during a tx rekey. psp
core will use bql byte counters filled out by the driver to determine a
conservative grace period where key handles can be disposed of.

Lastly, some test cases for rekeying are included that go through key
rotations and rekeying.

There are some packetdrill tests that are queued for upstreaming [1].

Future work can include a time based rate limit on the rx-assoc/tx-assoc
uAPIs to prevent an untrusted user from creating lots of wasted PSP
assocs and consuming SPIs, SADB space, etc. For now, users should use
network namespaces, or otherwise not present PSP devices to users that
could abuse this.

[1]: https://github.com/danieldzahka/packetdrill/commits/psp-rekey/

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
Changes in v4:
- selftests: drv-net: psp: factor out psp connection setup
  - drop closing the data socket on conn_setup_psp() failure;
    preexisting and not needed by the series
- selftests: drv-net: psp: add rekey tests
  - reuse _recv_careful() and _req_echo() now in net-next instead of
    redefining them
- Link to v3: https://lore.kernel.org/r/20261106-psp-v3-0-a8dd38f5a727@gmail.com

Changes in v3:
- psp: support rx rekey operation
  - move the replaced assoc to psd->stale_assocs, so a rotation
    racing with its free doesn't count it in stale-events
  - drop the requirement that the new rx spi has the opposite phase
    bit from the previous one
  - keep prev_generation valid across a rotation when the prev SPI is
    from the same generation
  - document rx rekey in the rx-assoc op doc in psp.yaml
- psp: support tx rekey operation
  - move the replaced assoc to psd->stale_assocs, so a rotation
    racing with its free doesn't count the socket twice in stale-events
  - document that the previous rx SPI also stops being accepted once
    its device key is rotated out
  - drop the claim that the peer accepts both the old and new SPI
    after a tx rekey
  - document tx rekey in the tx-assoc op doc in psp.yaml
- psp: defer tx key deletions for SADB drivers
  - document that Tx descriptors must be completed or discarded
    before psp_dev_unregister()
- selftests: drv-net: psp: factor out psp connection setup
  - take key lengths from the kernel's rx-assoc reply instead of a
    per-version table
  - close the data socket in psp_responder if conn_setup_psp() fails
- selftests: drv-net: psp: add rekey tests
  - drop test for rx rekey rejected without a device key rotation
  - fail fast in _recv_careful() if the peer closes the connection
  - in the basic rekey tests, run traffic across a rotation before the
    rekey, and rotate again after it to verify the new key is in use
  - drop unneeded key rotation from rekey_rx_version_mismatch()
  - carry the key length in the responder's assoc message instead of
    deriving it from the version
- psp: add core tracked stat for outstanding tx keys
  - moved to a follow-up series
- selftests: drv-net: psp: add a tx rekey drain test for SADB drivers
  - moved to a follow-up series
- Link to v2: https://lore.kernel.org/r/20261009-psp-v2-0-5596ab50f677@gmail.com

Changes in v2:
- psp: support rx rekey operation
  - copy old rx state by value instead of pointer to prev
  - place non-datapath fields at end of struct psp_assoc
  - disallow rx rekey when socket is not in full psp state, or
    dev/version doesn't match
  - require the new rx spi to have the opposite phase bit from the
    previous one
- psp: support tx rekey operation
  - place new assoc on pas->assocs list instead of psd->active_assocs
  - disallow tx rekey when socket is not in full psp state
  - document rekeying in psp.rst
  - reject tx rekey on SADB devices until deferred tx key deletion
    lands
- psp: defer tx key deletions for SADB drivers
  - replaces "psp: add driver api for deferred tx key deletion"
  - use bql byte counters instead of driver callback for grace periods
  - only defer tx key deletion when socket outlives psp_assoc
  - document driver requirements in psp.rst
  - allow tx rekey on SADB devices
- psp: add core tracked stat for outstanding tx keys
  - replaces "psp: add core tracked stats for deferred key deletion"
  - drop grace-periods stat
  - rename tx-key-cnt to tx-key-count, only report it for SADB drivers
  - warn about outstanding tx keys in psp_dev_unregister()
- selftests: drv-net: psp: factor out psp connection setup
  - split psp_responder conn_setup_psp() into rx_assoc() and tx_assoc()
  - drop Reviewed-by from Willem due to psp_responder changes
- selftests: drv-net: psp: add rekey tests
  - add tests for rekeys rejected due to psp state and version
    mismatch
  - add test for rx rekey rejected without a device key rotation
  - add rx-assoc, tx-assoc, and key-rotate rpcs to psp_responder
- selftests: drv-net: psp: add a tx rekey drain test for SADB drivers
  - new patch
- mlx5: psp: implement deferred tx key deletion
  - dropped, bql based grace periods need no driver callback
- Link to v1: https://lore.kernel.org/r/20260204-psp-v1-0-5f034e2dfa36@gmail.com

To: Daniel Zahka <daniel.zahka@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: David S. Miller <davem@davemloft.net>
To: Eric Dumazet <edumazet@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Simon Horman <horms@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
To: Donald Hunter <donald.hunter@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>
To: Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org

---
Daniel Zahka (5):
      psp: support rx rekey operation
      psp: support tx rekey operation
      psp: defer tx key deletions for SADB drivers
      selftests: drv-net: psp: factor out psp connection setup
      selftests: drv-net: psp: add rekey tests

 Documentation/netlink/specs/psp.yaml               |   8 +-
 Documentation/networking/psp.rst                   |  68 +++++-
 include/net/psp/functions.h                        |  10 +-
 include/net/psp/types.h                            |  35 ++-
 net/psp/Kconfig                                    |   1 +
 net/psp/Makefile                                   |   2 +-
 net/psp/psp.h                                      |   8 +-
 net/psp/psp_deferred_del.c                         | 231 +++++++++++++++++++
 net/psp/psp_main.c                                 |  22 +-
 net/psp/psp_sock.c                                 | 114 +++++++++-
 tools/testing/selftests/drivers/net/psp.py         | 251 ++++++++++++++++++++-
 .../testing/selftests/drivers/net/psp_responder.c  | 192 ++++++++++++++--
 12 files changed, 886 insertions(+), 56 deletions(-)
---
base-commit: 7ccc5e05043b1bb84326b19a2b05938d8f7a2ae6
change-id: 20260202-psp-3c8e2f65c5c4

Best regards,
-- 
Daniel Zahka <daniel.zahka@gmail.com>

