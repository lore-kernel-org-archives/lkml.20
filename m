Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792594761;
	b=XL9nvUeJ3FX5tM9t3vThPLSJ5pMPyHFMOcp3DhKgCtSWSat+rvRxh2e52MT8lIzF5Yfw
	 qHfVsljs/MOufDel8C1oK3Zd8icnW1C2K3xgntkFB9hew2iMs6v8o70q0FQLUL/i4x1Ou
	 1cMwWV+NABBKJHcc7OrkFNdpDeBGRETgBA5qe1EGjRtGDVRXjyGFACfM4bdujn7d9Y+X3
	 dFiXtnN7TsQgPPB/l/jsavfTHtba0FNIFh5TloDU5QiVvyI5WrQgymNHON9F/jHQwFfhE
	 4uUhD/OQqMA3ZvG7UxZzXwONwLBPhkPegMiGj0n8ZB+IzRN1SqUqKjNzNgF2S8wNPQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792594761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=hObvmucUS6t1rWR1L9u3AvYVQ+Nq1snLbT3mu1kE8f8=;
	b=UPI5dztsAzjMJk5Gaq7iVRDZtf5JLKjntqmjU6TsNSaJRyu8OJHOpn/9zZpQiWF/oahj
	 QnjB609uWEcCIx1qnuem001bjOIXaOK4+dtcibWiG+m0FcESm4svRWaP8oRR4ARJtdiQq
	 Q2PMTpCfRGTw9zpvltzPgdcpj5Sxm03oDj2cBvHSBX2J8vNi/VZUo67dIoJxL2tOcMdrn
	 xg2Rsmd5aftMdCrDd9qgekRjYvLffcByAfTdJE1nNcO6pnmcJWWipizZQPgV35MUAkDS/
	 9gexNjM+Mv/GIQJw3lvYYzwVUAUoP3I/v33yw70CaTmxjcbifFVhtMQhZt8O+5RCnjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WO9+EzJK;
	arc=none smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3DD606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C3DD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WO9+EzJK
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3a9e87ba7f2so7376761fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792594758; x=1793199558; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hObvmucUS6t1rWR1L9u3AvYVQ+Nq1snLbT3mu1kE8f8=;
        b=WO9+EzJKvDZCAa4i5HUJlbg7DqPjyFHR5FavlN/kFq2BTKdu4v3gy6HlWq9kDt/vnd
         z4Zq7rZBRF75tNqrVEnK+W+VsEjahiudmwOkz6xukmkjENYYIF3q5UJkG2TBsIeg4Ppj
         qHrsk102jqTowe8j/4IwuJraQEFLzymsvR7k5v3xdgkk0wr99EreFczLMgXXFwE2PvX/
         RtEnsVVhev7EUxg+dOyvq54UZ9qIEJmP+nPM9zr63JQ9oSgxFXDMormbGbSdwHhwHwoc
         NaebjomKS4GyMem9+GbsBBTGVE5CSDtf/w/M3BSBPxhCPMnhO8s6arY959PR/M8oVxMa
         YSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792594758; x=1793199558;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hObvmucUS6t1rWR1L9u3AvYVQ+Nq1snLbT3mu1kE8f8=;
        b=N8PZ9uHZpCVIS0cDhShw89xmV3X895psNVdj1gZ9DcIqArBeaQSLDlFpMYAIINBxaC
         3dxrSDt5ZuhQjosM40NZ4iL4Av/ujjudcvSoT+TgmorDHfmn1oltEdF+0dLJv8CdXp6R
         ztvVLEHDs8tGNuprBI5IlqgCT508V2iwLfQUZbK8J5sfe5LuPaeaf/x++MqoAwQp8avZ
         a6JnfYXgc2D1z75lLp8hBem0I6tfbUNVauRNKuTMVGN+uDyJFzuKOY82cRm7xputhx4o
         i6GOjSae0/r965mE29EcokNUup5g5G/UqdZM9+bLLK0ZQn0eopUliEF9f2419MpQ5ahi
         06LA==
X-Forwarded-Encrypted: i=1; AKwUvBwgQ7XaUGMsCshJ2I5FzIAPWgU+3kWIOj0hV1bzzJoa6u0FxR1yQ/FB6C3tbNZhffkDmL7f4nKNj6lZH0s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMzWuhcn9s/pM5TOMcNkjASXLLdDdW5LICeAtJWQc11QO8W9yY
	DZBORxF00VbdtbXhuMEUZDBIwX784esxIcpzgiMMYYsS9ktAMGOG4Hur
X-Gm-Gg: AYBFou2Uj0521lStSUe2pMR3J4B0bNkoYrwQ5vRPOYdv2HZ62niSel8coCDSJyVZgfR
	R+p/1Qb/pi0qSth5v2t0IUaf0kfba5AcOEAUx4WTGxxmDt8FrgxGm8dbzAHxIxjjhotrvH4s0OL
	ThHDr8ZG4pXGzkfmwm2myNbV60y025ecpPw8PcJ81IXGaZsWdICM11Jlru1g6A4yoo2hKxc4Uas
	+oEKGJi0txem2dfJdxjjWbKoq1BLN2uVBSRyUJv41Ieor+X6/gUwp8o9fmYShdiArgCQcH9Fgwa
	n1GuTzx9uKp081e4DHhTTlQI5maCTOieu0kDdpRSo9c0r8walqaMwcJhUSYc0dqL9MF+e0owBOv
	9TJo6WlEkofta+ml77V6J7UzPBM/pdEwLsyVX3YMLgjCgjXeGr3wl+UZctmQoQ28zlKygpHGmIR
	FD9i25isu56ly7Fqhc/X0f5CpOoHT+mjYR8kAJAoNjSReOdUZvGAJQsnUgECi4E3UV22lCFMVM8
	oskLhwPwnCZZWOo3DA0DMGYYlmLr8Zpcsmsw6hX7V7MbaeymTFfL2c81NfDyvQFn8m8AhqIyPNr
	kqAhaqA+FoMEexMe
X-Received: by 2002:a05:6512:65c9:10b0:5bf:a34f:b94d with SMTP id 2adb3069b0e04-5bfa34fb967mr478168e87.9.1792594758106;
        Wed, 21 Oct 2026 07:59:18 -0700 (PDT)
Received: from [127.0.1.1] ([85.249.168.112])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa4b90999sm128327e87.68.2026.10.21.07.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:59:17 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com
Cc: shayne.chen@mediatek.com, sean.wang@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Fil Dunsky <filipp.dunsky@gmail.com>,
 netdev@vger.kernel.org
Subject: Re: [PATCH] wifi: mt76: dma: run threaded NAPI kthreads with
 SCHED_FIFO low priority
In-Reply-To: <20261020-b4-mt76-napi-fifo-v1-1-ac8a24e2062a@gmail.com>
References: <20261020-b4-mt76-napi-fifo-v1-1-ac8a24e2062a@gmail.com>
Date: Wed, 21 Oct 2026 17:25:53 +0300
Message-ID: <179259275334.35963.15413466304986880275@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Adding netdev to Cc, as suggested on the GitHub mirror of this patch [1],
since it touches the scheduling policy of threaded NAPI kthreads.

For context on why this is done in the driver rather than left to the
admin (chrt / sysfs): mt76 already does exactly this for its other
rx/status and tx workers (sched_set_fifo_low() for the usb and sdio
workers and for the tx worker), so the dma napi kthreads were the only
mt76 rx path left at SCHED_OTHER. A userspace chrt also has to race
the creation of the napi threads at boot and module reload.

Numbers from the setup in the commit message (MT7621 + MT7612E as 5 GHz
client, 3 runs x 5 min each, ~200-280 Mbit/s rx with userspace load):

  stock:                  ~500 full-ring events / 5 min, watchdog
                          resets and MCU timeouts, occasional hard hang
  this patch:             0 resets in 3 runs, rx 276-288 Mbit/s
  stock + chrt -f 1:      0 resets in 3 runs, rx 249-273 Mbit/s
  napi_threaded=0:        0 resets
  rx ring 1024 (stock):   800-1300 full-ring events / run, more resets

A similar restart pattern is reported on single-core MT7620 at much
lower rates [2], which fits CPU contention rather than throughput as the
trigger.

[1] https://github.com/openwrt/mt76/pull/1164
[2] https://github.com/openwrt/mt76/issues/457

Thanks,
Fil

