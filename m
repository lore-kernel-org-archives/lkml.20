Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793048831;
	b=YQ1xETBMcS877e0T1htarMQ73oLFG+Z/m2/2m+IOaokQOi13s3qd8CHwbCIQS8K+g++R
	 p9czav7dsLW9SDszzYBEOl9CHSkfNWgi1Kps1E8I4Ih1mpHVYkcSsnGHbDp5pY6e84i6Z
	 u0d18BEvJUF3QnC62DUI057+/mHFN1mrP3hNJWGEuOGuoOT+BPojzBhVNKIkiCBCgqMAg
	 rESkLCOvYWqVDYdM8KBxsUKeufrQINOfI/PeLY7ufiUqdPOL33ese93/ft0BUigdwgV1v
	 iQM4XEfW31/02B0AfDB22vr5lYD6zBw3it8NS0/okpu5Je4vZtMWJBA5MxyVn3EzmCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048831;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=DC12OXR6B3T51NugMDFwf/bpu8Tt4YhOIMBqSWA+f5s=;
	b=PNZk7hYXPsFzW/isRCZiXcHqHjZgY9RWRAVYJ/QbsapOVlVodRL1lv/PQNRYxvjlKFah
	 4yZQdGk5a0Hti76xZr9fhj/n7kCQ3owRvvcmzvp62fChkkgJvD8YfR52RadX1OgnoEe3i
	 PF+e+ApPzRJbqigcN0ysns0PQZzDDNWP2fPENM+JsSbOijMdzVftg+trOwkzAvn0ZfHMY
	 HjZjcDAKoUwF6vj6xYd3lx++/DPZB2gS2R5w/0wFHpbgdH3RS4+uOgR941oXndeZdYsR5
	 OfePJsavXJ2ict3bufSZOJE1N//QgqUibZ/e1qruSQlH0wKlBg3sLn5CS06hbwH4EFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="Umw/h/ch";
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC8E606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AC8E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Umw/h/ch
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso2505419a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793048831; x=1793653631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DC12OXR6B3T51NugMDFwf/bpu8Tt4YhOIMBqSWA+f5s=;
        b=nvgGJQrLblSIZ4WVFZiZU2+qc7Cwtwf6k5gMVM6FFlWMf/7eGGp9jgYKC41FZr6qMU
         xMiZhzS2bCp4arz2ty8EKMCVE3NucvcPjx+6ghlc6mSDY9GQiSjccjMXWn3pAoMW5xyo
         qt3WNR0T6pWvCwyXFsQ/TihxNnL0ADduIUvv9Yxwmo+WuT/KJhcrzCJOh9JIojFr1Z4n
         fP6NU/Pv9KVZcC3OKNrnAT4u96E1dDx1B0YqoQGSFWF6JoHfTFz/KLMX3N3D77zLh1tG
         O/DompXUudCJEXFaYFq2kN6sPa+qotAbvq2F5ZjdMkGR3roMyU7uwbF/Ql2jyoK99cRx
         9K5A==
X-Forwarded-Encrypted: i=1; AKwUvBw0cbjK0BFnzC5Ox+yyx7kR7Xx/FMZItmiIxVF+hTugq1NYqoMzq+NDKMqEylTzqnAL9Ermc35pjJwxFW0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIub58kksR6rmc6ucYRFeOM/0CfoUqBDBrmRYJymP+kaFHa8Ndh
	KTG/hNuJuraJGYSXZtZIJnTscxgtc8MWhLCM3RPVbQS0TQJBixyoWlN9eqrsfe84foII2zbGvyX
	0pda7rcs3bB3adFbJIxC6ApCVhQ1I1dH86I0HbbHZCp8VVE43Yw2UaEc7oKCFomFoLns3T3HTRa
	PU06jGTyZdcbWbauvHynWF+wnX0qLyefwQXj1Xr0NeGqcFwAn7Effpoy+OLXMnYUgG9MJ8bxCpW
	ESwVfE/D5PiiCai3aHwyQB/G6M=
X-Gm-Gg: AYBFou23xpEWECL+tzpW1dy5fZgKM7S7dJMr4eA76gSNjEwlC9Wpcgu5BNwZyEkZLly
	jh68wtoS0xkUiH0GCNC437VWmVMMdkOgpyVEgFMjaLoD720rrNf9F0BDAK64gL4ydGelMAiA+xn
	txq0fa/6jzETQw4bzX9bbAeV3E2jqNibjdTePNWYlOEzXSrwc8qF3RM9B7Z4soido5rAEYzPSzR
	TSTdNv/XKOI2BM8x1T3Hvm1f+yyi59q6+cnlyYriU0D5aK1Tx5liNaYOrd7i5QQUNlqMiyLxMLx
	SrcaeMxBhli2Zz4RA3sV8quN3hCwTm8BuO8nz/GerGFZyW8GNjYgW2ZOPKltDB2mOAFI89EMCFy
	UkJNzUhIijQfJ326lXNOMACaOsB0l5sKldVwkjqfDXSSnU6JlZYpTdX0yyhfTAjh7ab3mIn1b0G
	UbVYq81qfZv1L2n6dPJ961LDfZYb6iccbhIAKL+0pAeyU=
X-Received: by 2002:a17:90b:1dc6:b0:3ab:be66:ddb6 with SMTP id 98e67ed59e1d1-3adeae6caffmr6175292a91.20.1793048830530;
        Mon, 26 Oct 2026 14:07:10 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae407e4ce3sm496931a91.6.2026.10.26.14.07.10
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 14:07:10 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cec4226c70so27999625ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793048829; x=1793653629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DC12OXR6B3T51NugMDFwf/bpu8Tt4YhOIMBqSWA+f5s=;
        b=Umw/h/ch4ahM/7QdeTNI6Qj7VGq1vbCSRbUOp4x2wtlAT4X5a2Y2Aa7JkpJqrk4Apm
         v0/muilirFQZfzfwUDgee1Cr2SPLt26NLJpdeUcn5qUXWuYCU+h7znUMIwktn3zqrMho
         pQPLvZOBEGTS058D5O1j2tUFayUq0upNYunWc=
X-Forwarded-Encrypted: i=1; AKwUvBy3UpfLwfqTKkIcB8tq2DX7LaEu7L7eQprQhQP8cJ1FwDT0TYEySvE4gvZVSgw6hop+ofFzj96vLGFuqhw=@vger.kernel.org
X-Received: by 2002:a17:903:1a0f:b0:2dd:c0ff:e72b with SMTP id d9443c01a7336-2ea9c9197e2mr64294085ad.61.1793048828780;
        Mon, 26 Oct 2026 14:07:08 -0700 (PDT)
X-Received: by 2002:a17:903:1a0f:b0:2dd:c0ff:e72b with SMTP id d9443c01a7336-2ea9c9197e2mr64293975ad.61.1793048828375;
        Mon, 26 Oct 2026 14:07:08 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6ce5d92sm808245ad.75.2026.10.26.14.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:07:06 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jon Mason <jon.mason@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v3 0/2] Fix TCP retransmissions on NS/NSP SoCs
Date: Mon, 26 Oct 2026 13:37:40 -0700
Message-ID: <20261026203742.3198673-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Northstar and Northstar Plus SoCs we would see about 1000 TCP
retransmissions per second due to a rate mismatch between bgmac and b53,
make sure that we run at the same speed on both side to avoid dropping
packets on the floor.

This issue was found during testing on a Northstar Plus reference board
(BCM958625HR) while running iperf3 to a test machine and noticing
retranmsisions:

# iperf3 -c 192.168.3.1
Connecting to host 192.168.3.1, port 5201
[  4] local 192.168.3.204 port 49856 connected to 192.168.3.1 port 5201
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  4]   0.00-1.00   sec   111 MBytes   933 Mbits/sec  915   99.0 KBytes
[  4]   1.00-2.00   sec   111 MBytes   928 Mbits/sec  909    109 KBytes
[  4]   2.00-3.00   sec   110 MBytes   925 Mbits/sec  1097   99.0 KBytes
[  4]   3.00-4.00   sec   111 MBytes   928 Mbits/sec  814   58.0 KBytes
[  4]   4.00-5.00   sec   111 MBytes   930 Mbits/sec  1187    109 KBytes
[  4]   5.00-6.00   sec   110 MBytes   923 Mbits/sec  893   72.1 KBytes
[  4]   6.00-7.00   sec   111 MBytes   929 Mbits/sec  843   67.9 KBytes
[  4]   7.00-8.00   sec   111 MBytes   928 Mbits/sec  920   79.2 KBytes
[  4]   8.00-9.00   sec   111 MBytes   929 Mbits/sec  1109   66.5 KBytes
[  4]   9.00-10.00  sec   111 MBytes   930 Mbits/sec  1055   63.6 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  4]   0.00-10.00  sec  1.09 GBytes   933 Mbits/sec  9742
sender
[  4]   0.00-10.01  sec  1.09 GBytes   933 Mbits/sec
receiver

Changes in v3:

- correct commend in the second patch about what is being forced
  on the CPU port, it's not just flow control, it's also speed

Changes in v2:

- make it apply cleanly to net/main

Florian Fainelli (2):
  net: ethernet: bgmac: preserve forced 2.5 Gbps link speed
  net: dsa: b53: restore the NSP IMP port 2 Gbps mode

 drivers/net/dsa/b53/b53_common.c      | 12 +++++++++---
 drivers/net/ethernet/broadcom/bgmac.c |  8 ++++++--
 2 files changed, 15 insertions(+), 5 deletions(-)

-- 
2.53.0

