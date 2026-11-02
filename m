Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623738;
	b=LOaO6CuLAul36NvcpbaLJ94V2nCBIcTFRK1hC4shD1zUM1B087hYAUD4S6ucqgIHSBgr
	 Yt/QFZAvxn/Rp70YE9ajfhNovQz28GfIHs5fVeJP/O0ff07wNZ/qRkIB7yjSPUg21ESYS
	 Jd0cTPTbskjMStotoBb4dwqyDsNZXie221peOOqKAHJ/akb5WxcUd5Pu/+A8/5fBVpXRT
	 gZnP2mGNS6GgQUCeg8MF50JX4Vil8krexlZPnQuRXXGS+Dl5/A6cQcA1YUfJQC3OhUguz
	 vNX9MKN1Wr13kydalhoW6QrKQ3PzYtg11Z0x4i4DVKtHBomHwL2ndPox7WEVkDhG+5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LBUpvPTvdv023x+oUMAsOEs1YSnQG/Nq32m4ILsCaxY=;
	b=IhMvTSUCy99yiK5hvCeWm+eG3B4XFbtzJuNmaodKd0ogiPcfY6Z/MDAOpvXTWmgUTvqC
	 Gri+HBXjXNEp+p2QcGMpqU+7NhwomlynkTtWfW/ExqnGaed3WOnRQV8CxiwmR0yOxJat2
	 m1NKF1Z9gv/SWZf94pbSoluW5gT4t86OhyNhVtrJ7RO+8avHK0Zonz+7Aiw1BpD2mdaWX
	 hWiyHZtJynYAHys5ATHxprGJijHmHqsPnSd3sBA2rCv2lQ3AfW0A58cHrETQZWER38Ggl
	 KvFNGb1z+gIueks/kd6OAkehITjKijbNVxsUh+IpBF9khecqWPeORfmjnI3+t6SNsiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ke2atzBw;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F57606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:48:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20F57606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ke2atzBw
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso2665428f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793623736; x=1794228536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LBUpvPTvdv023x+oUMAsOEs1YSnQG/Nq32m4ILsCaxY=;
        b=Ke2atzBwtGQTnT57Tx2mPEWaeX8gEHW3h25HJnSDhnbLHW2m05y+FKCFoWfwxnoT2G
         sTZFqqPfiFcjnR6pwxhGNFIm5aVRFr182X3ov4hXK/95kOY5rq/pNn48urdF8EPuBKPQ
         tlPOsOSCRQgHZWELiQ1+KbO15L2S4WOURPjGXMyAAZBsP9+RKxsku+WMf/imwY6ZMWfs
         1TaYTpS42JztRVqjldgz4hD4JVzrFtbEM6yYDTxo301DyKqSju8u/ZUgWeAaAykL8sOj
         LzxMNwlVVk8SP+DbdeAlLgQon3MQGFEm0AimsBcfpU92kmHxY9USIISHnVG7VlDJHRvx
         Lq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623736; x=1794228536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LBUpvPTvdv023x+oUMAsOEs1YSnQG/Nq32m4ILsCaxY=;
        b=Uo4y+v7M0ejN2alhLFO0UpmRnO4GHABE+BPcXvROs/Poj2NhVQdU592Gh+C3a0WInk
         SOwIoVMwNz2gtIGZwFB9vjd5DdTEkKq8jSl1NMi2N4TDqUXwEY4YU50HIyghlYmgZeOq
         Ek2AzDInNyma0o9W7Zns/266o+3tLdjyJijBlWVDCqrT+fVeoY6stIu992uNVUF6k9Gm
         mMZIXuPGUwaqZnRjbRtxaONnR2fsiW8ZuSXkbPpPC9J60gzmOQeOOWLxhRZf3nJV68/u
         +92MKR+Qev30ZPQMGInNoLTQfPYDVq/fau+onb9+Qyjoo2YgK7OUtokOc6nJaLsamuPC
         wwtg==
X-Forwarded-Encrypted: i=1; AKwUvBwdyDxOTbGAuUSTsl/FlHGEhui47FCq68/jBmMqy/1W1zS0Umcycl2PlYWO17B9VHqDnnsFAALpLbZNPy0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CHLiTDjYLYU9yWgS8I3yPthLO9X+f9U9uK8UnTIcJJzsk+kd9
	nd50oMzwmZAx3N51f8twIn0e+h9PgfBobjwu6qOGOxIDd3TyUo/vGBlrcBk+
X-Gm-Gg: AYBFou0a+evlO8t9V7gy/jeY+tOMdAWL2Y9V9s786prnrK7/0JSM0lYKe+IGe9qcFQj
	cp8VnsuGeTPL7VdyyBzep01hXQp1WRASAOChoiVbEUAYha7QkVnVqaUv9sH6YEQRkK5fDTTadem
	WZ8WDWq+coCOYZum98M+ncHJcAcgq6T9ifD6ms5JG3MUp5sVSkU8DxLdDpLdjZFului/dDGFxVl
	09WoO6+SapWFLRPuFiWuWqMy39Em3YmbaxnLeL2zDvKJ9y3vWlaQ+Xwy96MmFGAC+WmGfZV8R7o
	fl8ep3+o5wa+7QYL12b1JI+nll4jgksg9pOC3W58vnT9z0XE+ujDTnxIFzggwIuHZWU7HAtZp8u
	hSmzqCERPaxky4Du6tZDQfVwIja+HDI6lTkAZtbAP3kktrsgJbxB1EX0JQrsjvVevRO3GpA7gzC
	fsdj1j9VtaA47bb0ki2vCQfJDiipf3aDEz3vk1QAWP/WZAk2MF6IMg43s8KDqGFsC47lfGlT2RS
	BO9uCEkrlDNyQV7bcYW9Wll0wd1CUM6qJHzfKMUt6OEzsxSJ2SZS+kmCVYtZvczIFvdWH28uw==
X-Received: by 2002:a05:6000:2488:b0:48d:f996:1814 with SMTP id ffacd0b85a97d-48e6e5366b6mr21410001f8f.57.1793623736403;
        Mon, 02 Nov 2026 04:48:56 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723bfsm18719736f8f.15.2026.11.02.04.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:48:55 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Jeff Chen <jeff.chen_1@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH wireless 0/3] wifi: nxpwifi: validate firmware response sizes
Date: Mon,  2 Nov 2026 12:48:51 +0000
Message-ID: <20261102124854.325979-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

nxpwifi inherits several patterns from mwifiex where firmware-provided
lengths and counts are used to bound loops and copies without
validation against the actual response buffer size.  A malformed
firmware response can cause reads past the buffer.

This series adds bounds checks to three such paths:

  1/3 - HE capability TLV length in 11ax config response
  2/3 - ext_scan buf_size against event buffer length
  3/3 - command response size against response skb length

All three were introduced with the driver in 73b01e57ed3e ("wifi: nxp:
add nxpwifi driver for IW61x").

Tristan Madani (3):
  wifi: nxpwifi: validate HE capability TLV length in firmware response
  wifi: nxpwifi: validate ext_scan buf_size against event buffer length
  wifi: nxpwifi: validate command response size against buffer length

 drivers/net/wireless/nxp/nxpwifi/11ax.c   |  3 +++
 drivers/net/wireless/nxp/nxpwifi/scan.c   |  9 +++++++++
 drivers/net/wireless/nxp/nxpwifi/cmdevt.c | 14 ++++++++++++++
 3 files changed, 26 insertions(+)

-- 
2.47.3
