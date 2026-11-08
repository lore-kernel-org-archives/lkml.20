Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.245
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794164602;
	b=EzWskPuiECENhluq8ezy1XHAULDD2Vs7WviycJ6o2ymLTHcBjdy3ZgsCeLkQiwtO45k2
	 glncS69OssC+Oj2faDB/hE/u3vx16AB9OVjdAi4JW4Rf5B3tkXeg4/CZDXc4Y3HBjCr+i
	 1j4O5GHuc7th4o/HrQZJOFTSTxrXmUQKqmA+pK/SiuHQTHS8f0NSCfw/uBJNmMvLKNtsh
	 i9ELCwVBdxzsTCEBqb2RFAH/iMjSRC6V5JHLyB6cTrYEECt5pwM1NtIiTYYOAcnzsUluE
	 DOQVUZhykUc5R7oVoMHQwHyav9ru/sW6Bq0VbyBnEh5IkaL0uCf6PhR9UIUlFyUtiOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794164602;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MMJC+UT8sGZ/SEbe6GXLi4vINWtNqNdvv9JEfWOOst8=;
	b=NEj6+RbYLd4o/iNCuFsA2uegBh3KuSaCDOg9wzqm7w9oK1RFCxOc7TUWzGfIfSIGxP86
	 L0DLASyjQaryQAjghG68a4go35gr91/uUY7JnRnpdEp/PKKcHPcy5SkZ8qzHHZ7Ek1iTn
	 +nKyX9qgYXSzng7mUM6XsyzTO17/MD69lrSjqvkrGyO0eWYMTkdGxX5bE6MV3ZEEATk0A
	 UVCNYAlLm7xQ0qywh9nFcz2a+TmLe83FQIP9mYlEz+zYvQfXsgs8K9jvcYXHSlc3O7B/C
	 zHdqk9moXhgVy05AEPR6OMQZBXNwUPTuuYAGzgz7eP1A/VjjK67NJvne7EasEtMsiEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=justthetip.ca;
	spf=pass smtp.mailfrom=justthetip.ca;
	dkim=pass header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=gR+IAZru;
	arc=none smtp.remote-ip=91.218.175.245
Received: from mta0.migadu.com (out-245.mta0.migadu.com [91.218.175.245])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B859606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 19:03:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B859606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=gR+IAZru
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dBs2msg8YEIickwk5+jlQJhTIp1QkhB2iQlPBWT0rRA=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794164597; v=1; x=1794769397;
 b=gR+IAZruwssR0B/2yjMGgquxo4vZS9IUgZ52MglUzwp1sfK6xJ2CTg0IaAchqir1+8HEkbRc
 Ln1Qmq6iK1r4+MNVU9gGx2iIdK5vDJLd+SPcZJF3TEoHQIkb3OFhNG+aKGFv4dBMi2VUmoDkxYy
 5MM4UX/7zVvIUKdhiAEe/pt+kTBTla8RQHmni3L7U4+uMSkKL1J3h+Zjau+ix5oAvKgYjB0BkvN
 9tPwvkgtp8MOmTm84AwJhl8vCtCdsMvYe7aIREy8zNqEhLhuwylA65kETNUOa8XFqhNPERdvN45
 4IlLdrmx4baP9AxVtY1Wy8urkBWMXRNe2ab1mnggT6Zdw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 889c5ad5da6531b2;
	Sun, 08 Nov 2026 19:03:17 +0000
X-Mizu-Trace-ID: 889c5ad5da6531b2
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Josef Schlehofer <pepe.schlehofer@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	JB Tsai <jb.tsai@mediatek.com>,
	Allan Wang <allan.wang@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless-next 0/2] wifi: mt76: mt7925: LED support for USB adapters
Date: Sun,  8 Nov 2026 12:03:13 -0700
Message-ID: <20261108190313.11505-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103133528.53197-1-pepe.schlehofer@gmail.com>
References: <20261103133528.53197-1-pepe.schlehofer@gmail.com>
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

On Tue, Nov 03, 2026 at 02:35:26PM +0100, Josef Schlehofer wrote:
> Tested on a Turris Omnia with an A9000 and firmware 20231227 over
> several days. The LED follows the throughput trigger and manual
> brightness changes, and turns off when the radio goes down.

I tried it on an A9000 too and watched the LED on each of these:

  wireless-next b8e5b0ae8, x86, the series as posted
  6.18.34, Raspberry Pi 5, arm64, the same changes
  6.18 LTS, x86, the same changes

It switched off and on as asked and blinked with traffic, on firmware
20260813 and 20261016, and the LED was registered again after a USB
reauthorize. No warnings in the kernel log, and on wireless-next an
MT7921AU and an MT7922 join and pass traffic with the series loaded.

> Sean, JB, is it fine to drive these GPIO registers from the host, or
> does the firmware rely on GPIO 8 staying in its default function?

With the pin switched to a GPIO output, the A9000 joined and passed
traffic on all three.

Tested-by: Devin Wittmayer <lucid_duck@justthetip.ca> # NETGEAR A9000
