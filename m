Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794010868;
	b=S7DUOOEiN8etKw1YV6d4eRNwJRFfj3N1kqmvQEDeF1pSKM5AGQ8mSbg8Iw/FnoUzXKVv
	 0HULEIvFvZBbgHUpVk3tUkHvxJj5RqJt1Ty4VeDBXhbIxlt71//3CBnXCceLWpauEnJa0
	 hs6POKY/z5r3IJw0E7tZcbh6E0tHp2C6S6mF7Ct8ioExeGFv/N5IgupaScZxwsHhlA/M7
	 n9vqPkJtwzj2QnsiLKYY11e5EAiuuGfzxF42Z28G3Yfa2Yp6CKpuWjv6TFdozMFNwVnue
	 3s7bdCGhyBHiq+PiwV/zm2RBeG7olQA56uAm3h+Aa6f+FEWRoY2DmnFDukX2oVy+ldQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794010868;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=mCDjXsuCFVkOFXp7EHhySvdFShTVmWA+RDsqn87rEII=;
	b=IYA3dhX7KOyPs/KOYyxV3mES8Ky/bxHTu6UbFvj+V2Dq/6tTGpy2xueyp6XEAals0boc
	 Mf0CQ3vRk49vF0WfF43fPhQhyuFKV4kj4UG5TFAwQQ29BRyZ4IRSobNuqQMsQQwj/omTr
	 JhyJY+4MmwWhXgiVjvlEw379Iq26xetR/qVoK/QcAGj04MP4gDotxxKSA64MkjhZiokin
	 Qs2q0YkDfSypBeyiEMxN+2LvRY96DQO7/Gr1nu6nORwq2gzoR7ByNdZkA0X1pWeUKJ/Ql
	 f/wb/I0MClqy/Wzwr4mQq/kHRKvXoeusnnCALLgWl0H/GOXGJ7kWOde5P6sQwWR2xyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jf9GISnB;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=NlnKKXpQ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7D4606A32E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D7D4606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jf9GISnB;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=NlnKKXpQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mCDjXsuCFVkOFXp7EHhySvdFShTVmWA+RDsqn87rEII=;
	b=Jf9GISnBZ0wONKY2iaOs9SlIUDHitNSluS1ZaHWFlZL6MhuIR1isPyj1WkPkMoNRgW4vik
	rPWWiZ5COuCOQY8G7jejZGByOsfI6D6S00cpk+h/JGp0nGowQpaOSMWZA0DpMTXC88bwKm
	MSWuRJHegoeoF7da4bEJCXv257TrgVQ=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-sq2Bes2uNYSxV8J4EBHbGQ-1; Fri, 06 Nov 2026 19:21:04 -0500
X-MC-Unique: sq2Bes2uNYSxV8J4EBHbGQ-1
X-Mimecast-MFC-AGG-ID: sq2Bes2uNYSxV8J4EBHbGQ_1794010863
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5363b06bcb2so23433271cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794010863; x=1794615663; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mCDjXsuCFVkOFXp7EHhySvdFShTVmWA+RDsqn87rEII=;
        b=NlnKKXpQWdB3nq2vpcPOQQ2XwSeHfcOq7MSiRvB6EnvBX5HJGoZSmIR8xyfXzcyOaF
         p3Hiu9HwInGKaixEiNp/I7sPXL04iwFksNuxGTejyFbIcD1ajnsnfTHk2GLnCaYDWQdy
         gIBSBcnHDvNefPE4/2m4+1W+rt///jw57XFEz2OM2pvwGnbdn02MY3/7pHlgwa14O/dK
         UQHwricNPtk3/Mnx4LUHDCptyBovtQEB3cG2MwKZsyTvlND7eWhkRsU4SejUv6xfzW2j
         K25IfDhCTpC2BiNl1AjhafgUL4hjMs0QKY+KP4Ga/EYjBx2dRWa414w2NfAx16r9aUiF
         z1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794010863; x=1794615663;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mCDjXsuCFVkOFXp7EHhySvdFShTVmWA+RDsqn87rEII=;
        b=naCB0GMrzS2OA9x8xCtfWZ7gwBrsn0ug7UMIhbh/BcF1whHITvFT4+t4/6Td3XVwtV
         t1Kge154D2mEHl/UCebdFdpDGdH79pXOccccA4nayj9NiFXoyZmLAJdN+Bo3fnFahppX
         6YD7uTpIkX2Z4WgwekQvnepE7soUKFugj6Ror/K2RDSpo3mbG0p+co5CM9HKQ44pjYR6
         xn1dc5R80OrzROwYdJlneePbg7cFQ38t7g0LKsuXFYLKjAoT+Br7bztjaZdrRb1CXJmA
         080dHa5/ZtXooU+2IHbmX/AoPlOVBmgyqH6Yt1W1MsKe9fNygbkBFEtpjF9rRjaNvLu6
         sF1A==
X-Forwarded-Encrypted: i=1; AKwUvBxJIvWj3hEraCTB1vEZcxJdnXQx8ObHdvEWKawZrRFma+WJOOZRFZoWOoXyGgUUCwLtF76v4iZjCfYqo/M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/22AQJ3bwkmZbj7Ka22axFlyFcxiZLhoVz3cql+LFJsEo9KLHV
	fxS73PTDpLfLGNohC3cSfLO6FZ9Gfe5UZpcp1lbrPiEabNdEjoXk2G/aHxiu6gKTCMDD2YLTpCy
	XXS0NfwTG6JA0KlkYzW99HKX2DPnDzyHI368kvokRyIRJysviFhxcZUXOpkVQ7tsM5w==
X-Gm-Gg: AYBFou1OaR4bkuS1B3mz5PywoOtpaeo2W9H2j1fA70ipgCsX++ZCo6Rgfrjmja7ntLM
	ScbBJg0Zjpr2rH+xXVzxv9GWAvMd0Uhkn1fbaOfFzPN/LVKh4vRwud4OhiF7Tr7Sy1Oc2vKA0sV
	GiLPksV2jx79wzMzLJLCS6HifceV/WbSDRkWp6BmzYj1oH6Ljppsk8hrHE+hwzQrG9Jex6XSwU3
	z7hR11lPtqLfIl8z/htyJVeKdEjbTlt5FQpk7JjFYKYdl1LrvBkbjvEzptKQQdCfHtcvSidDj1l
	btq/552sBcbXx4zobAL5sppdT6S1AOtxrrBtvXbYDxMeULC0ac1Svy0FLajslVoDvo/dzJaqatB
	j6QYOvYgQYdiUh+grGQF0TpKCXnuZ/GcH6ZSQvVG2mk0/aWCkHJjkfDJV8QLuoNXhnwNGxano8P
	GFE+W/rcl1bbxOIkos
X-Received: by 2002:a05:622a:608b:b0:535:1761:107b with SMTP id d75a77b69052e-54e13d76489mr67614921cf.31.1794010863440;
        Fri, 06 Nov 2026 16:21:03 -0800 (PST)
X-Received: by 2002:a05:622a:608b:b0:535:1761:107b with SMTP id d75a77b69052e-54e13d76489mr67614571cf.31.1794010863025;
        Fri, 06 Nov 2026 16:21:03 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e2683624esm32445291cf.18.2026.11.06.16.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:21:01 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/2] mfd: convert to subsys_platform_driver()
Date: Fri, 06 Nov 2026 19:20:49 -0500
Message-Id: <20261106-mfd-subsys-v1-0-1c3e755d37a6@redhat.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqAIBCF4VeJWSekkUSvEi1Sx5qgC05FEb17V
 ssPzvkvYAyEDFVyQcCdmOYpQqYJ2L6dOhTkokFlSkuZaTF6J3gzfLLQubOFMaXyZQ7xsAT0dHy
 xuvkdlwPa9S3AfT9JAH4AbgAAAA==
X-Change-ID: 20261106-mfd-subsys-63dc5bb82f83
To: Lee Jones <lee@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=724; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=AYswpvPVCUryj51+P1LGK9/UjRYirXKlC5LdoCoqFdc=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLe5T17sENr9/zCym3LGN5WLlp6y9u3MOdpuJuDUla+R
 uwfkzsMHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEwkLZvhr1SeuZtycTJX6sKm
 lG6bnLoAB87Ld5vNeONt7c5fSK3qYGR4o1l8I25S3JrGvlru9bYuL94f3HnyzxUZh4K7DK9nsfo
 wAgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in these drivers and convert them over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (2):
      mfd: qcom-pm8xxx: convert to subsys_platform_driver()
      mfd: tps65911-comparator: convert to subsys_platform_driver()

 drivers/mfd/qcom-pm8xxx.c         | 12 +-----------
 drivers/mfd/tps65911-comparator.c | 12 +-----------
 2 files changed, 2 insertions(+), 22 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261106-mfd-subsys-63dc5bb82f83

Best regards,
--  
Brian Masney <bmasney@redhat.com>

