Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794703711;
	b=go9B+OxF5y4/vnkyFjurFxpM3z1ZykOmYyfO46MJ5MBCZyPBtRGylxtb0xoxKFQ06M2G
	 x1E3shaLA47VIagfn9/PE+hUW5rpmhEFX4PaN7NVSlSc29HQYffZPUxg453GwBG4JDGIl
	 sv26qUN1UwaCrck4jvrJlqKOlK8HSfFhz2aSXu8F21EsEQnXHsqghihwYwLjUhwi8M3hh
	 r5mODnz4mXcPAEIGL1mMXQyYy1POan5d6CDEfTvZV599ux7KSJtUnRguqiXoz8cHqNfYy
	 y3GkfCoB+4RmH8AEgfVOYReiHrQBzjrhz61ysozPnXVwlE+cKrrdawJXzxu1noRd4gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794703711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GNCaXsk/Xt/PN42cfY6qixho/TvY1Q+vI598MxtapPE=;
	b=0rgLgaFjHSwk7BB5rYlU56ZXAzyQO65ZuCehck5Wvjo5WIH6IjHz64YUTo+kXJfCakXV
	 SoybUX2mI+HoowsG+ELoyIRWFMYAErvVx1+tjd745kFp0eXKIezXVSGLthdUFgnr4xEJp
	 l7Jf6vw0vx+4X7EIdsD8n9fDKlTLTZU+9cCVM9NJLcJTc8McMgTx91hMJzw5iPijr/t9i
	 jlpTIGJyv8monxMU5k7PaudLvBiddSW050Wj/MSFO2Y8uaGj8ygJftI5uF5S6hYbuoaJf
	 hxITR+wSsrd5Z2dO+0Pla7SJ2LOqqryBIv+SlzYXQgdAhoKj8fFK9IEF8yV4GKu01zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DMcqLdbV;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B29606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12B29606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DMcqLdbV
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so2751036a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794703709; x=1795308509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GNCaXsk/Xt/PN42cfY6qixho/TvY1Q+vI598MxtapPE=;
        b=DMcqLdbVjGQlExaBwxojv82/j1Te2Q8Gs0X17+IG0qyDhCFq+1Nt0dCxNncZ0loGmW
         ZfI5Ao6vE177C6wnSiZfUM7gpK6TuV+0KHsIWXhF/pUoR/PEaV8i6FwFa8Va6yqt/LHd
         h4CEm6Y8C0QXmF+mbfPCvi3DAy7buSqHon2Fx7W1oNtPLWQF4dvDeGIiU8u6lhB8Pti+
         pTIgV5tBB/eUMPJUVssMgjiqdsIAR0Wbd0u+0ec3qtj9TxZyDqlxy9VfCEv1GId/mNun
         1Mml1QtgowP/lu9GKK8iFct9z8Y0WG9Rl7uCqfPiyT2DdUYnrbgZKrSzwm5A3UZj7A82
         ZHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794703709; x=1795308509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GNCaXsk/Xt/PN42cfY6qixho/TvY1Q+vI598MxtapPE=;
        b=B2pZBbgfl3N7grq+wUdAFwc+0xon3uBMVVzjrCEITr3UyZ7dJVynz5GLoIChoBHzLX
         NLBIINQ21+9WFXXRWCHsV+eHv2uusXwDx/CPnrDH/QU7islVTfLu/V5434Ml8FlgFwkY
         4XmcmVS+n9+ic94VPB7/3HQ2jgzwCjtjEhnT4YT+Uk/3gmhS9N1RhuUXM+NYucK8AUa2
         XC3JMo2wpZs7RbRcUsjurEEoRQOKZM6YsxWk/ASd5o1tBc5Flsx0PDrDNuHi0FiSlu7d
         jFLuS53WuVgqthEDr7YRSXeDjpm0n9Vzw4iDQ7cuiNstt+OOc+nzxLWIYmvXTgWu+C6i
         n89w==
X-Forwarded-Encrypted: i=1; AL+hErEvZlAsfAlNP4NcWArgzKp4sKzj54E5fU2hvUKPb7uHU5dBR6o4G2h9XERiMFH77cfx5cVpQoYBs4yZT94=@vger.kernel.org
X-Gm-Message-State: APuU4Z9A+EAWnRu8+gi16c0y4w86O2m1iBl+2enyYfmrOAaReJ03CdPP
	68XYoFb6qCKm8yYGVRUOO83tTPFQhuDatVEIlCdEjLd/H82JXn1IHKM=
X-Gm-Gg: AYBFou02/DP/gDU1rE5A6RF17NDp4forcsMqd3Xrg74x1EmFEh7AchX1xEnAhjCDrSH
	0eqR4FJQnJRxe77NOpJmTnjEcUAukfV7VZnBHAfmMDwTOTjy+NpzncOAbrOkczP2DDaoTSKWBFe
	b5rH/DCQrsDsw33Iq8EdW7DGMJHhTy8e9yVuwy/7xs1ZFXTa7CvzP0x1AmndneNl6aWThbSDNVI
	bVgxjFQpxSB1VKlJSgPm4A8DUKgnI3q2ziFU4EQ61+xVzb7/uKOo9YXj1g9BfIrLHUJNbPuGVmU
	XU73P7KH/7ph1cI+e6C86eNhqIqlhD20V2nosaUEXj4V8vPDy6v8enYaq1T8qGZK1Xk99NwYtfP
	ivqvshv7ora2X4adUK4fyo3LRi19ej+3J4w39CfEq8rPEQHY1L+vThVCQvrQ4AwTecfnReqXq6R
	mV1Jzhb13hLckNXTdh9buv4LOI4NsP6aIelcNQxki10PzJvuDoQQsWP/FquEvn1kJEms7yoYScl
	taLREHApTBxGA+cxAWY56naxMmZqHv9491rqXZriAgkYuE2aLLAclAonNf0gpVWmYKSUyfmc5dW
	NTiKy29anIJJbTPA2fc2OXE5YhDAmyOGMel0jGyv/qiX3KGLrFb8JK6niSR9JWL7iCD+z8s6maS
	ezzBUifd4D6YeFZnt0nhGlvuJNk3IPApwCApS
X-Received: by 2002:a05:6402:a513:10b0:6b5:6ba3:5860 with SMTP id 4fb4d7f45d1cf-6b7c0c12b08mr3317211a12.17.1794703709333;
        Sat, 14 Nov 2026 16:48:29 -0800 (PST)
Received: from sohrab-omarchy.taila18b31.ts.net (2a02-a44e-4ae7-1-c0e-6d5a-8ae2-915.fixed6.kpn.net. [2a02:a44e:4ae7:1:c0e:6d5a:8ae2:915])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23dde49sm2857574a12.23.2026.11.14.16.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 16:48:28 -0800 (PST)
From: Majid Hajiheidari <majidhhdri@gmail.com>
To: admin@mswin.me
Cc: konradybcio@kernel.org,
	andersson@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	amitk@kernel.org,
	thara.gopinath@gmail.com,
	rafael@kernel.org,
	daniel.lezcano@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: sm6125: add TSENS die temperature sensing
Date: Sun, 15 Nov 2026 01:48:24 +0100
Message-ID: <20261115004824.395133-1-majidhhdri@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <a3f071d3-6082-47a1-bb00-9d8e72fa3cdd@mswin.me>
References: <a3f071d3-6082-47a1-bb00-9d8e72fa3cdd@mswin.me>
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

Hi Roman,

On 16.09.2026 10:16, Roman Linev wrote:
> cpu4..cpu7 are the downstream cpu-1-{0..3} cluster
> sensors: they get #cooling-cells and per-CPU passive cooling maps, which
> stay inert until a cpufreq driver registers cooling devices.

I have been running the same TSENS description on a Mi A3 (laurel-sprout),
derived independently from the downstream trinket DT: same TM/SROT
addresses, 16 sensors, SPI 275/190 and the same sensor map. It currently
runs on next-20261113 and the zones read sane values.

I also have cpufreq-hw and CPU idle states for SM6125 working on that
phone, which is the piece your cooling maps are waiting for. I just sent
them as "[PATCH 0/3] arm64: dts: qcom: sm6125: Add cpufreq-hw and CPU idle
states" (you are on Cc) and left #cooling-cells out so that it does not
conflict with your patch 2/2.

I could only find v2 as a reply inside the v1 thread, without reviews
since. Did I miss a standalone posting? If not, it may be worth resending
it as its own series so that it gets picked up. Either way I will test the
latest version on my phone and reply with a Tested-by.

Thanks,
Majid
