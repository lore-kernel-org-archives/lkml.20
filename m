Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793358652;
	b=ac5y325M99NyfqYkkh/S9uUiCugreZX/sIXzEjdV1J5qaZoLcWrVoslNxBakchzG3wTC
	 5dwHkhGv5GjnAGy/8LYl6BRC26MZaRUYaaJiBJ4+d2fAKpL3yhwzWOsZUT01Y89bE7qyX
	 mdw9kxaUuU5Y//RYsFX8QzECOT5j832YuajqggLy3DdOdM3dzHnePnPOyM3jygCxijlFq
	 TGve8gN6tq6FDnYokx/eqJsI0U+NOeADK8DhTEdKWJZCqck7a1yLbNzCoCPgSFsngSygo
	 98velxNLzWNw7cok6KALzkw+FpGu8jZpYtyE4oGcmlqPwBJ0LCnkUGWIhSk0sLYe+kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=3K77XNkfMH7a8onwpIoaohwCSVh2S30EXP1W1PCwgg8=;
	b=XL4Xl2Dqc9D+i8N85mlpK1sN3x4gaNpMd1ZynWYT9x0KRn4wTfLCdVwF7pNuqZxdRiu2
	 ZYFmxLyr0rPNFTAuwZsFrXruhODe6gv2KN5B7eWXpyNGLRcspbQfwF9qULcde0r8t91HS
	 q97qepNi2uE2AD5VGyXqJTu08HirgNxAO1/lKdwmAqBfrykKGR95tMDTImCUzb6OUoKR3
	 9WquIH+DLITcNTw01HrTSnYxONOCZTIpyoTO9z9zpUav3QHF58zWMSa6KYA9h9SV/EDD4
	 3MAHRr4GMldY2tpEYq66vEFNOS4f7GJjqM4yUoqtf6RKnFL84wPLGZd1QdW+321SHkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Op+K9gir;
	arc=none smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0E7606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D0E7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Op+K9gir
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7cc2bb73cd9so112140137.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793358651; x=1793963451; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3K77XNkfMH7a8onwpIoaohwCSVh2S30EXP1W1PCwgg8=;
        b=Op+K9girD6S4wCdakdfLsogm7mwuSirVskruFOu89qb11mi+oFCrsYh32/RHot1jvF
         5gSOe3BcwsMBh4MoCZD2X+LktUSxwDY6mH3vlDr47d8RoVpGenvO47qxJPab6m5AS0vV
         InGmUtmB15fUSz2hZxBOKURp2LWvp++46FsRAXyzxhZu9ehgLUlsrnX4rlEUNZ5e0VP7
         ZgmbHkZID5oS7e2gvnzl8TBNR+ec+nKREpgJJVhU4ZyqPgSrsxDrh1jcFinhgquAvnU5
         RMObtQlUxJ6p86d3HymhL/2lgDY+/WvtMZK9jaN2kZM4HY7UZIDI5OQdmkLFg84D83no
         4Mvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358651; x=1793963451;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3K77XNkfMH7a8onwpIoaohwCSVh2S30EXP1W1PCwgg8=;
        b=SfNyKkH5x8coK2O2ceB/VdXhZydwdvwuPErZ0YrIxdjYjc9n0EI8yDRTzklOmyw6bG
         zNJWWhnvMVpwmlVQKXkUmyLGvIuxAnGoLC+CxGpOvtqYjZTId/GFw/WXO7FBnBTL+mJI
         SLlOfhFASZkajwg5eEucVZh8a0cixk7p9OqYnJtU4GAlMoKqulL5n7tlJpAoluYYKE+n
         71b3oxxPLPRk3BWLAbr4lVXqlWEp16+u67nhQ1dgXYw+wO6b81q7hWq8gYVkkbkJRS5k
         RDadiOscqeEPBNDR0k9OFEHeL9qtf+rM/44VM7sigQXWXMrnFWL9a315f8msY+9aea6p
         13GQ==
X-Forwarded-Encrypted: i=1; AKwUvByBwjiqbtMFzNbledjOTY3F3dRs3gPL8WRGE0bLdxCbi6ucFO+nuOrto2DJdDmw5YnqQongN+p8NUXERY8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDQH5lwKbR+f5RqbsnttPagbwEYagp9X+qIabKKkayxy0xwUsL
	wf2ogaa01UAFvE8W6/qOMeVSRxTZRqtJXRMIoMWOUnmJQaUoQP31FOtx
X-Gm-Gg: AYBFou3hjTW82tzddcm53jgR4SWdm40d+zbZnmaFeTfIN7ctUsxZ2UZt143InbhKt5x
	AoNSON1ZLQL5GbpJfyzsOPOH27KqdULip7vzD+Hg67uW36zT6t9GxEx8J8AffowZGOlUUkA+4FM
	UbJ/BUF9E/xzTPMOojNSdLWmgc474hEubwYnEcsdWGFNdvEbgc6xcV8eHBAD2Ovwf0vUbA+IloN
	+oNXKjBjklYUYOUohEjkeKlqBpZBpXjUGi9D4ByM9+0JGA7k1dLxCuMTHAU7W9BfYUXHG7YTg0y
	YHPHCAI1/UXoblikfdWmxIkZ9dwH7JDMO5BlfpRnQ/GWDqqMdjV4a6ksVBtIhacwFn+mtPOhFRq
	XJh1vhDD1Ox9mpksPVBrT96/AkGOKvR6eJyerM/BV6LVbRpaKFrywiM75w6WEijFv6SLloziuEh
	gR0kaSPw0lR0HQ9acQnTa9csYRxCKUBYkS0nS7BrtK3G1mlcVnrzOJDe7Wpk5byJ1mFY57+3LUB
	K8maCtLrPuAzyYywoKramVdhItLdNfCXHsOaZnS2SVzqDt3lXK8veuJyxqnEce527ChZnzJ3FNA
	TKFZiZVYLUbJ/Kgjp9sl3lCxGahe7mfuyRB7t+C4BSJBcrr9gPAVJv5AkWBk/xBQDH7aeja2gVp
	vUdqqlAsMxDvi2+UA/Cc=
X-Received: by 2002:a05:6102:3590:b0:7cc:2152:4f79 with SMTP id ada2fe7eead31-7d072c1571dmr826528137.16.1793358650948;
        Fri, 30 Oct 2026 04:10:50 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([191.34.116.20])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d07754c1b4sm1841044137.4.2026.10.30.04.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:10:50 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, oe-linux-nfc@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net 0/3] nfc: fix skb leaks in LLC nop and in data exchange
 error paths
Date: Fri, 30 Oct 2026 08:10:42 -0300
Message-ID: <179335864271.64596.805818095553030218@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Three skb leaks in the NFC core, found by LLM-assisted code review while
auditing the HCI drivers that need real hardware.

Patch 1: with the LLC "nop" engine (used by the MEI attached pn544 and
microread) every frame sent to the controller is leaked.  Confirmed with
a test-only module that registers st21nfca with LLC nop on a virtual
phy and a userspace controller emulator: 20 device up/down cycles leak
598 skbuff_head_cache objects without the patch and none with it.

Patches 2 and 3: the HCI core and the HCI drivers (pn544, st21nfca,
microread) hand the response skb to the data exchange callback together
with an error when the controller reports a failed exchange, and NCI
does the same for a frame interface status error, but the raw socket
and LLCP callbacks only free the skb on success.  These two are compile
tested only (W=1); the leak follows from the code: __nfc_hci_cmd_completion()
gives the skb to the callback and never frees it itself, and
nci_add_rx_data_frag() passes it on with the error.


Joas Antonio dos Santos (3):
  nfc: hci: free the skb sent through LLC nop
  nfc: rawsock: free the response skb when the data exchange fails
  nfc: llcp: free the response skb when the data exchange fails

 net/nfc/hci/llc_nop.c | 11 ++++++++++-
 net/nfc/llcp_core.c   |  2 ++
 net/nfc/rawsock.c     |  4 ++--
 3 files changed, 14 insertions(+), 3 deletions(-)

-- 
2.43.0

