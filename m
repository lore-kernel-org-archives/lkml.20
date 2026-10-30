Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793343181;
	b=QlYCSzx9l9QHvGrATLkEHZGSOwvqwltosbk4YN3m2VoCjtinVftSi16qxkVv16oXQSBm
	 FuAvjs8DEs4r0ARJhGrE3zhK/sjcH1OpKVs/VQ3SA36CVflIAqSqf59aUW8boZXtVODag
	 TXcY6KAUPszS26e6rFk1ZDtjUAaF94A94VWjv3MHdNfCyZrv6XwZ/+rULEBZ1ju0mrRnv
	 SWpgL2jYY2ZTJXridCAET/Pfyejs1KyweTzSm6yjMa47Aqmo8FMjeMGV/8NQerQ6eSmEe
	 ogL0CqdJBPsG9g6DTi9prTrEocTwmzcAK06nTJpO4Be5QmE9qx4OyevWT16Hkyi5eew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793343181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=qXtTOic1CSe7iLEVcnI3wJflAV0GHEPp/NEkAFGsTr8=;
	b=jd16bEvJKzkLLR/FgnwEs0vWkuXScrYtrvr/UoLFxxsXFAUVzNbqi7O1jhF0KZ3sPPxo
	 K5HZWSw1nXAB93rd+QlzWF6kKlLGOxHb5M+mPNUnc7l7+i/UzH7iWasF6JWdU4I6Okhkp
	 cqe7sTnRhvDvcUhOmEWpgvTcjv5BuwEyEm1E5ImkJLAiI+Ls+bUSzAOsbk1A7Oq7J0fVl
	 vZzOitBLnPbVIt2dYfAXozamEl5+YhNo6gYU/xGxVDnf+DE7+kI7qVqd62lCTS73Ei1Wu
	 ny9bi28kdNCZHyxtNBw1LSFpxTt/0+t/88UQ8ghUeOiGYwjen2HsuYZ2/+3d3j+ETlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--starchang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Jz3f5tt1;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C89606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:53:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33C89606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--starchang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Jz3f5tt1
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a5971cf7ceso500821b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793343180; x=1793947980; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qXtTOic1CSe7iLEVcnI3wJflAV0GHEPp/NEkAFGsTr8=;
        b=Jz3f5tt1lHW+sWpdjFrp/X5c88hmABgX7JHsD7mDSt47kbWHamUxbvuWabR2amylU4
         nkNf/8Y3zBaBkhXHHUWRxIo5MifNOVHrfNduzXa2/EbM3WZMA/slrw1ieeNGCn1GWHVr
         ztwsHOUt2qfoWlJX3I/JmNDPzaU1Hh4rePYHpYsaI8noOYuxYGq5UmL36OuEU6/wEtmo
         rIKbzHUtrYHRTN/t8jkTN+tsRSAjBduhj0GjhMXZ7nLrQTjQ8bOfDufhPIikR1Q8kDWV
         OdGXW7iV5f4Kp3s0Eox69lhelltwncOSxY2acXtRLwf1xjwZ1Cp8StPU0+8eP5mlkice
         EmjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793343180; x=1793947980;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qXtTOic1CSe7iLEVcnI3wJflAV0GHEPp/NEkAFGsTr8=;
        b=pGDAIhXW57aR31KK7qMK5x/Zb175o89fIUat8CmNT1FnPwYgMgmz8G6zs5Kp3KwT6R
         iYklI/AEbblJl+jZpKBlhhydDfbuFetP6jnfSVdticLn26nu5wdSRFRLQKockh/Gdu5D
         xWzd5sZfpKM+/PrSh/LyTkz187+NzT5GcXsBqOZtjcLPy//wJxjLJ+WQA1mxa+9CQ56E
         lxCmv3+SjfWWHkSOUjrbe3/ZrWZZ78FltPe+cKrgSET23n0R8Aa+OdnbANe/ojaXke4y
         gXfip2Qp/HwdVWQ+AASXUdtTn/rE388W1gbk1DkVz+zZ//LJ70PcCwD7BZhBoG40FIRy
         Q7TQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8HB/lm5S2kDclgosegCJ2IR5lyIPHW2syAmqJQrDWVlPj2zb8gJYgtROpRuFfiw2D+zmMw52QvV0xvM0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYNH+wjTNRco1RvN1lbFF7WX5rrVOz7+mXhJkNDFolarYyfgHo
	MiKdpEOkpaBKMAawzGoHdEFWxZRMeNSaY9U3zXe+HH23ODv91aXyz1ns2eVQluzhNGHVBd5ueNr
	G/CRpYo5ySKWPdI6K3w==
X-Received: from pfbkt3.prod.google.com ([2002:a05:6a00:4ba3:b0:8a0:2311:b0be])
 (user=starchang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:1f0b:b0:89e:779b:d0f with SMTP id d2e1a72fcca58-8a9beb69d8fmr1284653b3a.37.1793343180250;
 Thu, 29 Oct 2026 23:53:00 -0700 (PDT)
Date: Fri, 30 Oct 2026 06:52:58 +0000
In-Reply-To: <65cf2338-7bb4-3151-f3b1-ef171bb5723b@ssi.bg>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261026150539.1357037-1-starchang@google.com>
 <20261027015619.1745984-1-starchang@google.com> <5c1fe870-39ff-e83e-e479-0e1f0fed6a83@ssi.bg>
 <20261028061644.2997812-1-starchang@google.com> <f631e178-d9ec-f335-9163-c44a9e6c58af@ssi.bg>
 <20261030030715.604215-1-starchang@google.com>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261030065258.818406-1-starchang@google.com>
Subject: Re: [PATCH net v4] net: Fix Hole-196 vulnerability by dropping
 unicast ARP/IP in L2 BMC
From: Star Chang <starchang@google.com>
To: ja@ssi.bg
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, johannes@sipsolutions.net, johannes.berg@intel.com, 
	linux-kernel@vger.kernel.org, wangroger@google.com, starchang@google.com
Content-Type: text/plain; charset="utf-8"

Hi Julian,

Thank you! Your point is spot-on: in a shared-key Wi-Fi network, an attacker
can simply broadcast a forged GARP reply (sip == tip == gateway_ip) to poison
the gateway MAC for all peers. Giving GARP an exemption indeed leaves a door open.

We verified the Android / mobile use case and confirmed that completely
disallowing neighbor learning from L2 BMC is safe:
- Gateway validation: Android relies on NUD (Neighbor Unreachability Detection)
  unicast probes and unicast replies (PACKET_HOST), never on broadcast replies.
- Wi-Fi Roaming: Roaming clients *send* GARP to notify the AP/switch; they do
  not need to receive broadcast GARP.
- Router failover: NUD naturally detects stale neighbor state and re-probes
  via unicast, recovering within seconds.

For v6, following your guidance:
1. L2 BMC ARP Replies:
   Drop all of them unconditionally (including GARP) with
   SKB_DROP_REASON_UNICAST_IN_L2_MULTICAST.
2. L2 BMC ARP Requests:
   Process and send replies as usual, but suppress updating/creating neighbor
   cache entries.

Does this match your vision for v6? If so, I will prepare the patch accordingly.

Best regards,
Star Chang
