Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794011140;
	b=MH5KgWz7MYxA4VfiOrh7kLbCt7PnxkeqFcP2HFzgND3JAlzXyBokUl/GNChmV3gH86E6
	 ExJe8oDaHxdk+Uz82OrZVBb9YWAwEKJPkqz7gK5sGHzXXDnL1wazRjOkcvJk8NCHoFkPe
	 kFAzXjQzT9W/mBGBY6ibwAflOT4tLBIzsBvtIBZa2L2jxuA4yOBVY/on6aI3KkEKXzwNH
	 KI76IeT3vRyHijAwsDVh09zCxgUqXn9aUHVqOwHd1VBvwyVedQTf5byaD9HkK23hltxJ0
	 SAII4LadG7AG9JKzfyFU1v5eD3eRaxq49e7gRNEdXbq96O17UAzPgOCXX7c1GrrY6Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794011140;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=v5HBDmcj0GX2lBmhlBM7xuasV234qwUB54gNIX51b6k=;
	b=N4frhB9W3UmEcvZowEdWHFUzggaTTIz2bcC7MqKEfV4binUz/bfpbH92dgqydDkN9ftm
	 Aa67G+qr4evHkCMuN02v2XcVotJ7uf+rMXg7aTn7RqyS8TSbwAhEZBz168H6m8gj/C/Vu
	 Yi/6Hm+LfyPEYF+dguzOTwmijy33ETyFWwClFHWs8knz3YyMJ09eSOLn+7SXvrCD5Twhk
	 0U8epJhdC1acnNjPzI3bXksNGwyld6N7sz+SnIe810M5P/vdd4crDevGyMrSSIApZDWcn
	 8wYsYv/eTprwDjB3xamOhk50xsDQjcE+4BkxbkehYc/ZA46N6H8kZhNVFn86FGmyE1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NZVkr8T1;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=FOUAmPSv;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E757606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:25:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E757606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NZVkr8T1;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=FOUAmPSv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794011138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=v5HBDmcj0GX2lBmhlBM7xuasV234qwUB54gNIX51b6k=;
	b=NZVkr8T1owta1UfhQc83OEr1bdVTuiSWuyoI0N9l8BzdoJkcNWiKBCrEQ+zpBB/EwQyWHc
	PLidHehd025dKy8Nf/Z5iLG40LJ91P3KsOshwyYgqVS+oRfvxhEclT6Z9az+6MzK36XMgc
	m5UG33F9+Q27wb8552P9FIoNfS0BEP8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-676-E1rXkFcqMvOmnK6z46vDBw-1; Fri, 06 Nov 2026 19:25:37 -0500
X-MC-Unique: E1rXkFcqMvOmnK6z46vDBw-1
X-Mimecast-MFC-AGG-ID: E1rXkFcqMvOmnK6z46vDBw_1794011136
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c8a517107so33406076d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794011136; x=1794615936; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v5HBDmcj0GX2lBmhlBM7xuasV234qwUB54gNIX51b6k=;
        b=FOUAmPSv6OXpe0wMiRsW4IBJY8DYL4YVc7XoBgSTZ5IUhuD3qsezMCn8BvsXTKSiIY
         3q7qOVxVw3ISmniDPYCtbOaz9LWeiozIKvSxnIl+Ew4vIybOEsGbvXPBos4cI0zX1c6b
         aOI/yhtbX7WAkEPFYPdMao5KF0QEP0lIewNvY7EjZsT3WBhLYUAml6EKEecSL3XE6bh7
         FOHohTI5mkX3fOseZtvk1lhMJ2TYM+zgE4K0HQSBZoCGbPs/3+hR34mpsKnsaLiWzO4R
         DB9NY7f9beB/+EEE/30h+p0eLQRLO54N19ZBHMhDnYqYWVudnwUatO3W6QrJS0a/Nlmq
         pi4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794011136; x=1794615936;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v5HBDmcj0GX2lBmhlBM7xuasV234qwUB54gNIX51b6k=;
        b=jeF/QSrHZqqZkskm3712uSw7KO3eIDj1ejcbZU3yjiNfyzPkV77wVqY3HGXhQnycf5
         UTp7yUfjmXsw0llHtCjqHHNGCNBYuD/kOYziCey2iJATaseysWcYsBY7eD7wwhAqaMD7
         091au1thRV2qWnIKrBMOXt7phIqJ58rtCPYq160jgiTPcnOxRswzPTjL1baWLJIP+JWC
         pzN4ehOdIRX//hy5RnQQW1s/zYdtH1BlrDnUwHdAEqOI0To0IMRmiR+94u2vHPSRqRhv
         Iqrkf0tD/9/VWriRXSTHM+SHjd9BImNxNwwP5avisUxJkL9qYcHQMHNAqjNPlzPNaora
         QZ1A==
X-Forwarded-Encrypted: i=1; AL+hErE62HSXLyIxvzz8awC9iMvr1obJShaM/aR2Ewm2Rbk9seSXcuBatvIGZGSEhtK8u1UDaTduQJCa6J4sUJI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UophYbgG6jWUUv7UCTOBaN3Xixa956Kh9/cjgmo+Wv1nd9NHY
	R1ClX7cEybMWYOISVZbFw6ck15DhUPASDYbYkfWC5osAAlhgdZgJbXqqoGBW71Q8V2BGe8xGw4g
	ncGCfhUw27G6eriub+bI+y+8aNdnZ3yFPTz1or2Yxb53mgfbh8KsgCkNPkd3tiaANyg==
X-Gm-Gg: AYBFou3DjfJDzTWUaIux7P8GKIXoWwqApbT8lOnVav3sQ+iwObrJD4EYTQom958HU91
	fsNmbQuWh8Wl3UmrUqr7c78o/AY/TpIFES3S0oxeWdoeXP0LMVM+hPQyXZqkqsFucFlM+yLrpun
	LSRSQP2XBU3AkPvZVlQ+jdp905VKv9Vj+AT42hGhXhP6/nVTNRN4cW4Xn9KUOWIODiuGbkRSzqM
	YdIzX5+lZfI/KINMBdq4mIk0k2ddByOP7dBc4CkawATftO2QZmlwOHdVw6KeF1nh8C4U6lenZBW
	UPDqE9Eb/yiZMv3O3YK6aAmQTAmMuuNnUKj0JALHMS1DDohgcA8p3ygsGksCC3T1nBvslz7GRO/
	F8BFlIxEksBRfYpVZGHlDu8p+rkF94JJ9uhzOHgF83MUJar0JSgwpcwFnQImOW6bo7yVaihDQNv
	Fq6FLBc2OwckxvDXR4
X-Received: by 2002:a05:6214:5d0b:b0:91e:850b:770b with SMTP id 6a1803df08f44-91ea96a62damr61889686d6.17.1794011136276;
        Fri, 06 Nov 2026 16:25:36 -0800 (PST)
X-Received: by 2002:a05:6214:5d0b:b0:91e:850b:770b with SMTP id 6a1803df08f44-91ea96a62damr61889396d6.17.1794011135846;
        Fri, 06 Nov 2026 16:25:35 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6ab543csm32089856d6.39.2026.11.06.16.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:25:35 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/2] phy: convert to subsys_platform_driver()
Date: Fri, 06 Nov 2026 19:25:19 -0500
Message-Id: <20261106-phy-subsys-v1-0-9a443422e563@redhat.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBCF4avIrDVpG5mEq4gFNdWxQDoIEXdXL
 L/kvf8CocgkUGUXRNpZeJ4STJ6BC+00kOI+Gay2aIxGtYRTydbJKcoQYektYlF6SIclkufji9X
 N77Qcya1vAe77AXPe4MJuAAAA
X-Change-ID: 20261106-phy-subsys-1ee69f26649f
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=729; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=6hJaXWA30Jxx6HByRtYUmyJvFx2Jm5Df1B9uMcHm6ow=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLe5f+037brxKLVVa99LVzl1/7lSW0xDvyd6/m+yGJtv
 IfwNjOWjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACbiE87IcCPz/RHZ8kMCG/h0
 1ngtj/DYdp09327poxTzLecsxR9nSDD8d3v+Nrc1umHXjH2bF5zWNSyuXS2T6Sx9NaqKJzXzcdw
 NHgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in these drivers and convert them over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (2):
      phy: ti: omap-control: convert to subsys_platform_driver()
      phy: ti: phy-twl4030-usb: convert to subsys_platform_driver()

 drivers/phy/ti/phy-omap-control.c | 12 +-----------
 drivers/phy/ti/phy-twl4030-usb.c  | 12 +-----------
 2 files changed, 2 insertions(+), 22 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261106-phy-subsys-1ee69f26649f

Best regards,
--  
Brian Masney <bmasney@redhat.com>

