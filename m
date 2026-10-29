Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793241177;
	b=jwJve0yyLVd7/6MhjROU+TEdMsj+BmydYL6bJ5S4hY0Ax5TvQzMlYSwk4gYqeuHOHWjU
	 aFBjc+kJJo5A0/wbkSA0F9Oyv1/nEkB6TiDwGzIKNkQ224TQUkvJXNi7lB8/HmMBeiU5O
	 +83opvnn4NT/PLQrT8eYdLx9b+g5sa+q3CtJzeiY1saMUcmwrexlD/ocCdC6SZSf+3uCM
	 MGNM/R0v69iqUhNGdSn+cV6q4GqacynDuGn/wdfOtb4euG0HrOftMJTJ9Q2Nbwp8mVcRL
	 unZ/IQX4om3lTtw5GMTX4A/6G+cme05Z4lYRIr+tT7MDEchR5tdtd16y6vKpND/N5gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793241177;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=5HAya7AXrvW9nuDMyU/T5LGM7V6HXtcY2BGF7KxiYmA=;
	b=boElgLt9BqoFlJjzgwo1K0wpubnhjCGV+NBUE7DbaRiiT722PBggUhPssmTOizoppGHK
	 0TmcFE6WFPiKcmiGLVpRCu3WdZniud+ibdkWBqmaNsdy9mElTZPKXHujPTcc+okUZXvNd
	 7EQbW9OwYslCFmoVaDnSkFzypVvzI9jqwsH/gBQfwhmOZH84OPWVbVqUXeiz4sBalDnUf
	 A91jSMqxgmfH+YMst1MlRj+sOYTxKMOsZHonUe5A+/EvWVh1H4hv7NsbPlpBziaUkvw5S
	 TPokmZFkb8kMBZeYijYr15c33+hrnj/h3OrHEAihZWAtA61ltvquWAA4Vs6Hm0dplHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=AIb5uj4v;
	arc=none smtp.remote-ip=79.135.106.30
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0960606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0960606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=AIb5uj4v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1793241171; x=1793500371;
	bh=5HAya7AXrvW9nuDMyU/T5LGM7V6HXtcY2BGF7KxiYmA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=AIb5uj4vlwZR3NhO90Y28Cxnm8lT1hWVpiUmMdgYWn7QcwXQpIGWgcdUZPaGOTj8e
	 5BVE0UKK4keJnZU9sqCeBsQQe9I1qcdkNs23PyCm4j3w4C02kducuw08RtzD+th0cN
	 Hhic35jHrw9uF02lIq71gTYEvLTb2KRXrylbklH+VqIJCuCodU5dqTcLvH/ewwWAgM
	 0q8JOFg9nBi+hCIDQ42DLXDWRqLbVKice7RtT0ppXLxbLSadIWAaVJnI9A5w5en7Id
	 +tnJ+bDf20jl8xjrQlGezi+JV7DbmzWRF5VJ8FW5yISkvq+sRQQxxz/lfV5n0MutAI
	 kBtMn6nTq4zsg==
Date: Thu, 29 Oct 2026 02:32:46 +0000
To: linux-bluetooth@vger.kernel.org
From: Kyle Pepper <cochcoder@proton.me>
Cc: linux-kernel@vger.kernel.org, luiz.dentz@gmail.com, marcel@holtmann.org
Subject: [RFC PATCH v3 0/1] Bluetooth: btusb: UB500 reported maximum data length
Message-ID: <20261029023235.1280321-1-cochcoder@proton.me>
In-Reply-To: <20261013032742.497402-1-cochcoder@proton.me>
References: <20261013032742.497402-1-cochcoder@proton.me>
Feedback-ID: 97716137:user:proton
X-Pm-Message-ID: 86604828647744461e295fc629aa5efc46e70b8c
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Luiz,

LE Read Maximum Data Length reports TX/RX251, while LE Read Buffer
Size reports 27/eight. A separate raw HCI test verified sixteen
251-byte packets received byte-for-byte intact and completed, with
one packet outstanding at a time.

RFC v3 replaces 167 with the reported maximum TX length, retaining
eight LE credits. This establishes HCI251 acceptance, not physical
pool capacity or an absolute HCI limit. Audio with the revised
callback remains untested.

Prepared with LLM assistance.

Kyle

Kyle Pepper (1):
  Bluetooth: btusb: test reported maximum LE length on TP-Link UB500

 drivers/bluetooth/btusb_main.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)


base-commit: 1081a6ef8f1e0661fd52eb3f878691b0b96cdff9
--=20
2.56.0


