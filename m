Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793995944;
	b=Co6uJYZabPZvxdsqhOIkwsh0m77XgoXlWfzRHsbk8SomFaMDSO09x8CXy70uPfxoRjJ6
	 rGbtF6mV95WfC2e6EQ/Y/4hOE37nuoWHT0P2J+E2mjxJTZh6vKbBxEjP2VeUnqgKy0GEA
	 vyi6Z388c5ffSeX2gktYnnSUIV3bfyRvFatDGF/asXxdeoIsbzfMOHPglCa+vuW4zT+gB
	 f0pHYOAokkEovCeetyXMUa5+kQ37mrz7I6pkNIegNxVGS7hv7PGMIs7SKv2MUTCXmUCQD
	 Xix6YihQaJytCPv0Q81QYFllhZnLU46RaFr3sR4f3nf24Zt2lZdXSNDJ+7Q8DmMfjWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793995944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=Qrlz6fT5MJk8A9WNwfgrVZH+1NgxsGyPwS3ygdVEOkw=;
	b=0bTSKJiEkl+MAomWecuQsFu4CSGGYhAKkWgho32m8NAQY6uzEjYpgmObPldziceGBxvp
	 Ez6CYoUPZ74TaN63ZRTMpaoX4PhMJi1abfUZyAtaPGuX7OjSLkOw2wxwbtaVzkuE+xrME
	 ZtFqgTLARKv7lqw9TNRMjXrF6ucwBcpOhnZeWvcoRzjY0JRF0ckRzGZw096jjnjzBO3Er
	 xgVmCaBGiU4UPvoj3JeYz243SRa/ir/al9xe5zNYKH2t7rwPYgEDNt92bTYZzzFZV0otz
	 sUy9sXdXBr8PuVke6z7o+o4wHRc0O9gqXWpu957PQAScQdi92kegBupg+1pwLcX14RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lAXEBUHD;
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76DE606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:12:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B76DE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lAXEBUHD
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b305e10ac7so9163977b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793995943; x=1794600743; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Qrlz6fT5MJk8A9WNwfgrVZH+1NgxsGyPwS3ygdVEOkw=;
        b=lAXEBUHDJaPc1fjhVVeCiHNKFq/6qK4rr5ZPtPjXNcSI1RLNlc5cERFb4Qwx9xZL4X
         l+Ep6NV6VHL3DUxMuvC0TniRlGZBvVE4PZXMYmrAjZzBHu/oEDlpzlWz8uxM3OxAvUXv
         b/V01EmPebWbw6v2z75ErsWqKCRM/UgwPP4er7ABEQuoAWHbaAbTtrQ8Sh1JS354l9OD
         CmnvdUU1CDXMycD1vFqqR958oS5yA/Sv6A0YwOJzKfpYjdt0lRwX6kT8Eo7o7G9ubPdU
         h0AEoI+c+MYfnxZKf2wXaplrjZtfBcrDz6YkQWdm/rR7oTOEfl5N9pma8Kd4syY3iasB
         0maA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793995943; x=1794600743;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Qrlz6fT5MJk8A9WNwfgrVZH+1NgxsGyPwS3ygdVEOkw=;
        b=OFZOaH/iN1OCEbC0cDZWJ5H9NCk6Nn80MgDghCMdYXi4/9p4OeFn8I6+4xV9lHCHbV
         5s8lZS4JCRlEcSmCgbM/UY7WgC285Y92u7RwX9tXjbUQLLb0D7Ep/2U7x7kxYSat8UIu
         XJ+cKa4A+qZR2Nk1rQJa7ZgaOKZCV/yvfAadLIdu4qJxNWwINcvr/v9pCTiSj/FDrfe0
         YWfhA0/C3ZI/5koR1whgY9ZbLy0DEIF034DSGtYtLU+AXESmubx+Rk/8ip6IJKms00uE
         LeNGeNSe/agjSMy2vYhxBqybAPLixZH2zXXYLQAAlmRO1ectPT3NGlCLc1vU5i0ws7ib
         II0w==
X-Forwarded-Encrypted: i=1; AL+hErGEqTZdENNzu+2P5+/JA6fn+J5YDyoTk8i6pzJDegPDtIOlx6Dm452jpCFyafLr8RjVTuPdnU7OEH/04Qc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8R0osUsqaWbj7NCcl36J7d1LtnhDiiZb2+uxaR8dc7HxFmO4aN
	Sg14RX75qYgGIQ1SoEBMCV2ByotRXis57nWsLNI0pFM9FRpc4TImKonv
X-Gm-Gg: AYBFou1ARXuGiN8uaARzC3Epc68B+vj52RDXo9D0aT6rO8csbR26ArupiqFMEA8ZXmM
	99lxo+kemsd1X4x9bvTwmeXmTdca13lAoihl6TPc2lMuLVikv9Ox8WO3ZJhFFLwIKHr3/O4nQ4f
	gQMxiL+lLivNvSN3wrz1Yjw9Mmh3ekIR3jjXTT67tXaendvkeA2eObwPEqQ5e8wp21eRqauoSfk
	NYEZyPfOOsJKVfxONc68UuIed+tEvWvIa3LdXyypSGVI34YYki9EhP6mfeYqffERUALHav9bZQ0
	nCzUCrhhBt42n0Ai+xBMBK/mewlk0RIPVm6uhvfGl+Waa4RLRIa+2m/w2Xr/x1RnUIWWkB+ggLI
	T1S5TONnGwakUDSF98TIu+K0zDp9h6SFa63rMyqDwsAfteKNyIgIugtq/jpe6P4IBovQLVT0tib
	wVxNZ4YEvLmM7gvra/eMJOUvuJxStRh5Tvs3+UDd8OMyKy3mgCBeNEsyt0onCdU9fVexBIaEQPm
	qlTGH5vf9TJB7nhdaDyYiV35AXBPeN/mKUraoCn1iz9wTNNVKJ9FAJ6xJKgV4BlRuYpAf3nIHDc
	qSpvOPx6y1llnDCcoUGTV2chuA==
X-Received: by 2002:a05:690e:14c4:b0:67c:2491:3754 with SMTP id 956f58d0204a3-67c2491394emr817731d50.81.1793995942713;
        Fri, 06 Nov 2026 12:12:22 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:2::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c135cbccfsm2642686d50.17.2026.11.06.12.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:12:22 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Subject: [PATCH net-next v3 0/5] psp: support rekeying psp protected tcp
 connections
Date: Fri, 06 Nov 2026 12:12:08 -0800
Message-Id: <20261106-psp-v3-0-a8dd38f5a727@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAJg07moC/02MQQ7CIBREr9L8tRgKhVpX3sO4QPppSSw00JCap
 ncX0Rg3k0xm3tsgYrAY4VxtEDDZaL3LhR8q0KNyAxLb5w6MMklzkDnOhOsTMiOFFrqB/JwDGrs
 WyxUcLsThusAtL6ONiw/Pok912b+mpphSTSgRhvIGWW8Ul5dhUvZx1H4qfGI/pqa0+zDszYhOq
 rugRrbtP7Pv+wuBkyEi1AAAAA==
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.13.0

A note on v3:
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
 net/psp/psp_deferred_del.c                         | 231 ++++++++++++++++++
 net/psp/psp_main.c                                 |  22 +-
 net/psp/psp_sock.c                                 | 114 ++++++++-
 tools/testing/selftests/drivers/net/psp.py         | 269 ++++++++++++++++++++-
 .../testing/selftests/drivers/net/psp_responder.c  | 197 +++++++++++++--
 12 files changed, 909 insertions(+), 56 deletions(-)
---
base-commit: bb67589c87249c9bc2415ab11a754d6e303774e3
change-id: 20260202-psp-3c8e2f65c5c4

Best regards,
-- 
Daniel Zahka <daniel.zahka@gmail.com>

