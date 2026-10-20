Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.249
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792513290;
	b=kzbHOKj1jr1REG8h5oOYH9QT+MOmCSI1R3I3rOhjRFjABpiubayw37rXulE3eEJOIVLa
	 lmAS4OrrQOtvJvZ9JZLzxs60MT3X5LU/3vogUgLqSAbbJA9SntePHcbfXuXLLcWl3vG6t
	 ldDQRBdkZAnS5clB6jgTu3yjaSrn0aNkaRft9B3zQfkcwc1rNQZ4Cg/PAZkAKxbn8sqSk
	 zAVZEUXtQs+wcrUvWZkdG2qZlKZ1JGBXul/IRCYN5zO5vzZFKrGne1MtYkCwh7Z6pKGsP
	 wwYEvL2SOGMic5DnQ8kyrIRbpDh5b+woxE88pj3su9V+xtw6XKUUz4qjbT4PSnu0Rrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513290;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=pxcH42x189/zaOrwEfxK0dZti1fheIX3Rga1B4Am/Tw=;
	b=twXt9KN+EQyCIbe+sBDq4L/zF2PpZnXnWxyup2q8copsP+BC7ptSnX+8aADufsz39PkW
	 eQFjeLVMhY1hEwUUcriENJ4INAkG4mD0ym2UduTI9oNXxcNSQEC56YB/JvEUxCVlZJFrb
	 zXM6wU3bfSqAmyGn+9RDaJoOMq/u7JLOTNqvWhB8J6FeQJcecCfTscARC2bv9oYQhUXkE
	 y97yAUJrHsxKGGuDpk5KtxXjswI2DjqialIjaCqXgliLUzlhWl3XU7hkZG1XHlbyUT2zC
	 holSsP2zzC27hqHdfCiLj1aDlTkdCAdX93taeVKeV+p9VzjYVL+VKbY6l2TNqS0Y64Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=l1QiNQXS;
	arc=none smtp.remote-ip=91.218.175.249
Received: from mta0.migadu.com (out-249.mta0.migadu.com [91.218.175.249])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A1F606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47A1F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=l1QiNQXS
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=49a+oRA1lv+Mz1o41YRrStLBxL2F34gYMEViUmKV2t4=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792513287; v=1; x=1793118087;
 b=l1QiNQXSTgs0KInbxTTQOwL+qD4qZLQM++ij0ACwxGBCsbFZeCw4Y7MBBUWhDuLOJJxHpdKi
 o5NWyVrSNkDmQXgDt3msA6n7jlbHcj4D9jsgOnHm1PVHvVTvNQKykqGpE2zY+ZTdrpmaMHS8KcX
 TPjb4/Q+zjSdub5SeKewDBG+pHc2oa1B4lv2xIDhf/py+rvsuyt9/jrlKUJeDKkNQ6/H8YKhExJ
 FIBuy8RLbzpxnbQhkQoa+8R2M2LkH9kGKa9+xeguza6vBYvo1XbCVPHijxz37U92NSIMIfUIEcN
 I2bsecLbYVOT/HIMs5ebStfU0FAqjf92F8bFeMBIzXYPg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4ab1a25d000ef3f3;
	Tue, 20 Oct 2026 16:21:27 +0000
X-Mizu-Trace-ID: 4ab1a25d000ef3f3
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 0/2] usb: typec: fsa4480: Support reporting hotplug events to a codec
Date: Tue, 20 Oct 2026 13:20:29 -0300
Message-ID: <20261020162101.1527014-1-val@packett.cool>
X-Mailer: git-send-email 2.55.0
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

Currently the fsa4480 USB-C SBU MUX is not actually used with audio
codecs in mainline. I have gotten it to work with the wcd937x codec
on sm7325-motorola-dubai (copying the Type-C notification handler
code from wcd939x to wcd937x, will be sent after this).

v3:
  * Put the codec mux/switch refs after unregistering our mux/switch
    in fsa4480_remove (sashiko-bot)
v2: https://lore.kernel.org/all/20261020081343.1507986-1-val@packett.cool/
v1: https://lore.kernel.org/all/20261018225906.1265299-1-val@packett.cool/

Thanks,
~val

---

Luca Weiss (1):
  usb: typec: fsa4480: Report switch & mux events to codec

Val Packett (1):
  dt-bindings: usb: fsa4480: Add an optional audio port/endpoint

 .../devicetree/bindings/usb/fcs,fsa4480.yaml  | 94 +++++++++++++------
 drivers/usb/typec/mux/fsa4480.c               | 57 +++++++++--
 2 files changed, 116 insertions(+), 35 deletions(-)

-- 
2.55.0

