Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28DD4E50B4
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789623943; cv=pass; b=cJ04Gg/4BMHw4CK2sVzQsjDVVh07LkoWvmAPuwoJ7Z+kdEcSAiqlrWzskXZupoGO9NAPxH3KOX1wf5335/f7qytUvu/GkTSpHXwQF/en6AhbPTmncTSTiiMY3TtSzH4gZjcVMkH4PrOSoLEeIIuXhwdMYuzt46uzUMhp0lXQcLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789623943; c=relaxed/simple;
	bh=TLb2nOqtBItk4KOsON4925LGI4M9C0ksEUGbwyjyQuc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=flDV3/NReefQ9lJUZJfVG0lYta5xrPVT/yIGf8W4RPoZB8YZHmIN2MZv/OCz28QMabVCh8eF/G17Wjdo9iKOy2xUdDJ5Xc5MZn/zllP8aEOJdSyVxHipyL39atdfYk00BhF96MU4NgpQ51V17mwtSzkFaMlBeItuXv6tQOb37Gc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DlZ62d0n; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DlZ62d0n"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a985fba28bso564438a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 22:45:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789623940; cv=none;
        d=google.com; s=arc-20260327;
        b=mvvik6xK/IsGWVXQEAQJoh+/50qPPaaB/WvNRXkanIajLnaq0h2ab4Csu19MWErMOv
         IQSiHt6NKJP7ob0Bkw6qYXFOVAXOnk1CU8bnrW4d3r3XBoxD9vi0w7+UZXH2yH6Bnn45
         Rs2XFfTpW7yk9q5TrOXTTOwEUCkgNYllsp0F0V2qQEJ5/PEfEnKk1X7T7VuzC4cMOI8r
         DeJE5JWDfmdn+c+2FePhttzfnkZr8NjZrqXelgiNb5MYGsAQ9EcMamnbSx7wAVgKD4zs
         Eu9t2/hVIHVg2qoYgFQFzYrDPg4ptMMBNxLC629qJJC5fEg91zGr8qvI7wij3x9HqWb5
         ZvOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=WxkFkzssA6pC9icCvytDKFmiFi1j9AIom1UsTbZeHsc=;
        fh=PVepdb25tvKF2Y4BtEIOvdlYYn6UtuqbGyhz+oywXsQ=;
        b=FArUMS/5RvFzHVPJa6KjaBTSIjfNBE60bmWV6PakMsTp3mNTpyvjy+QN4JlCE/SMDa
         CzGq/NA1XlGrfxPSpeQWYVLmeWjvd3jsLmnCaeRw4ntfq+0CYyOtnSPp/cr4n4sZUJUZ
         3z0trvnbJSTOnGfYlMuQ39TCTcl8WAFwW3uhMvIPxHdripL9RRlcohmt6m0uSIjDHbYt
         HEarRTEl9p4hYR6F4fOIr9G2t8NbQ6rz5S1OABFDWpUUzxQmrI96G+IuJ+YKW+LyWQG9
         9wnDxwR/au666ZBm5xqbk23obymYgCUoMNVrZCCtqmrBzkD+1RJs1r+se7rkQXZUgADQ
         U9pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789623940; x=1790228740; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WxkFkzssA6pC9icCvytDKFmiFi1j9AIom1UsTbZeHsc=;
        b=DlZ62d0n/G0h0JL2beJLQGJOjzn44+dOVq6qbcfDVOqHktMLIb63dvFgjhKgGBevDq
         fK0f/ecIaijY0pn3ERGwd8tSYJ9BkiXiLIWxgI0XrSVdBmgQUaSvCmzea8fX2FM9BUzf
         JzPmivMX6FXLlX3bglO9RHq6aPGDH9qaPcsmC4d3hK4PwX13NH5KZUutjfADrgrrJIXZ
         aVwEoaUu0Us9hSkmnem31Yw+FXzAUCQbGOkYps4erhMuqvFnbUmyRTGIqRhdlMQyLgnf
         fOKV6zo80t+b30t9jyiNZ6K/zOfscTLpzpunugVAj1jjxwjH9LXXclXvRLaac1jrPn8T
         dKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789623940; x=1790228740;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WxkFkzssA6pC9icCvytDKFmiFi1j9AIom1UsTbZeHsc=;
        b=ycYS/X3Cvdu0rRZnEn7On/MlLlaa46VXS2RTO0Zmoo2yi28rQ6Mxbsx/IZM05WaTOJ
         mBo80K6CzX3esgibDTIDhQnOrpTiUxr6IdxA2htEyG0ZTAvx/FAUvYsixfWZArPdYqpE
         gH2or3KEhMNMtQU2EdadDsIQ0ZKIf/FLODQtxdE6TRRfHiT1Inysi1efzz5QWxI9IqjK
         YIOJFzGGXTJXdFTGx+0gHEYlmnJysNij9u2ITXcfYf1AETjL8X2s8pIjCwlub8UAApQY
         c6BuIRd47/0pmdrkydO/lwhkSnbWUf9tR84aoSVRGr8mRCzJXfbPUN0OFsh1Mi49eJJ6
         G60Q==
X-Forwarded-Encrypted: i=1; AKwUvBxu8yHf3XH4eKQKnq1S906X+rUxrNyrB2LG9RDRMXVLs9Rv/fj1Y9JNjeHiwupExOe6DDKCI+taLjTlFB8=@vger.kernel.org
X-Gm-Message-State: AFuF++mRA1mwC3C58+DmfEtneHaTXQ/Bk1N45Qd+/sn6moOS0bkVywNI
	HVdppkDGomW+pDw3bOYGXHUV6MzK84jhIuAa8Os4E5drXoRYF+0/C0C4enFXnhOrRRWVQHSv0Wo
	Ohl+tJSm97hsQ+cHRUYALUln2y8KynG8=
X-Gm-Gg: AYBFou3dX9Wg3wzxbTfuqtAXgcZ1/Mkuyda33Trck38f5OKSiZQj0aUxZQ/jnXnPxCF
	8OL6BKxEetHf5zeW9adYrI0wJeZKeFC5XboEIijVYkn2gBy3tDrS9ljc7KmYzl3nRDPRR2wkjp5
	4xI1aKNY7r8eOCEUbhaDZXYBlYgjczuoisCBXKh0DgdGZTFZZ76zoIu7ZHr2cuDa/xPBRnvDttD
	caxFnH6bW6hNfspGdliWlx9pYvZKfhBqzDOJkhY9a+3qIApEbhoPvbn6RKUcPC389XzN6+/tCbR
	BmBMF3IuHLbfEfr5zjEVUoEB+nVoroMpbsuAHuS3oLi/Z8/H0E10MEJK
X-Received: by 2002:a17:907:d14:b0:c29:4634:5c99 with SMTP id
 a640c23a62f3a-c29e52918a9mr365267766b.4.1789623939705; Wed, 16 Sep 2026
 22:45:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Yuchao Zhang <ndaugoing@gmail.com>
Date: Thu, 17 Sep 2026 13:45:28 +0800
X-Gm-Features: AcwNN1W1ZtD3gP38DTGoOvPF8n7x5MxoqmLZYUzaSGzaLyTncN9yjIast4J_p-4
Message-ID: <CAC2BP3LyU5Qc80YTk7nq4vS96QKiufyAAdkNjVMr_DvcO=9K8w@mail.gmail.com>
Subject: [patch 0/1]can: restore skb header initialisations in init_can_skb()
To: mailhol@kernel.org, mkl@pengutronix.de, linux-can@vger.kernel.org
Cc: "pabeni@redhat.com" <pabeni@redhat.com>, linux-kernel@vger.kernel.org, socketcan@hartkopp.net
Content-Type: text/plain; charset="UTF-8"

Hi,

This series fixes a regression of the classic skb_under_panic in
packet_rcv_spkt() that was originally fixed in 2015 and re-introduced by
9f10374bb024 ("can: remove private CAN skb headroom infrastructure").

#regzbot introduced: 9f10374bb024

When an RX CAN skb (mac_header still at the 0xFFFF sentinel) reaches a
SOCK_PACKET socket, the length calculation in skb_push() overflows and
triggers skb_under_panic -> kernel BUG -> full machine panic. Because the
BUG occurs in softirq context, the machine panics even when
panic_on_oops=0.

Call chain (confirmed on 7.3.0-rc2, arm64 qemu):

  slcan_bump_frame
    -> alloc_can_skb          (init_can_skb no longer resets mac_header)
    -> netif_rx
    -> process_backlog
    -> __netif_receive_skb_core
    -> deliver_skb
    -> packet_rcv_spkt        <- sink (af_packet.c:1914)

Historical context:

  - 2014-07: Originally reported by Austin Schuh on linux-can
  - 2015-02: Fixed by 969439016d2c (producer-side resets)
  - 2020:    packet_rcv / tpacket_rcv got dev_has_header() checks;
             packet_rcv_spkt was left unprotected
  - 2026-02: 9f10374bb024 deleted the resets -> regression re-introduced

Patch 1 restores the three skb_reset_*_header() calls in init_can_skb(),
matching the 2015 fix.

I also prepared a defensive check in packet_rcv_spkt() itself
(skb_mac_header_was_set()), which would protect against any future
producer that forgets to set the mac header. I can send it separately
if the maintainers would like it.

Reproducer (100% reliable):

  modprobe can can-dev slcan
  # attach N_SLCAN to a pty pair, bring can0 up
  # create SOCK_PACKET socket bound to can0
  echo -ne "t1238DEADBEEFDEADBEEF\r" > /dev/pts/X

Result:
  skbuff: skb_under_panic: len:-65455 put:-65471 ...
  kernel BUG at net/core/skbuff.c:214!
  Kernel panic - not syncing: Oops - BUG: Fatal exception in interrupt

Thanks.
