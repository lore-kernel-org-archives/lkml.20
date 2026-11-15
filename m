Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794732789;
	b=mCzBMZXQTe5p50Gjn4tWwpbDTv1bB+IJfiFiLu0ic9tOop6v7h3hHifVJeXYQMB4M2Ny
	 mA2VjkzU9ZtRVhG+VjTFXy9A0S7Kpdz3aNwGAbyxV1Ag9wBHgUGnkioaJrKUCGHL2irWV
	 80zYDNLDfGouQIuL7aOryACXUUd01NTwaebG46a5/HKIN5Xvr5/h9JAA82pjOErX1Uduh
	 zv2Rlf3Zi6HU2AdVUPHnoSAuedepqVlbVZWbJLw7hIEhi7O5IOGVvA53HSKU63dvckfXM
	 wCeiUWErX2JWEFpZWZYVeT5+nVID6zEN18GdSy1/JVubnxuUrPu21n6OKmoTthtNknA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794732789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wNHsMSnqXLNqxHaUvaHElX48eJyvQ5UchZoPNPKizhU=;
	b=nXAP/uO2/poqKj8k0kKG2dIRxN27demKVeTIdWZvcFmOMHCZIzdkynb5DYiRElw5NJqj
	 QCg9AlK4l1f1Bx8NvJuSRCPY+uxxr7t4uDEsXS1H80f2/MObB/fTnUN+h1IjW4SQ/9JjB
	 1XL7IVPP1a1Fj1zthty9XlSV/pfK7+ay+hEJx6UGIr/s9/ir2Z3gCgAffhBgWQKBvyPVk
	 7QhLwYnQOfqSr4dCxjLOAZBTc78kh5rBmZA91ysIEaJHE0DBkHmvG5rywantFb7lxHaCG
	 lPJt2yrmPxCArRtJg+M2JB0iSav/QGu4lHaPhv17ZJ6Nc5cSmnV3M8jld2gQgWuZaGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QuNZbqws;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56457606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56457606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QuNZbqws
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-49134c8509fso2512008f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794732788; x=1795337588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNHsMSnqXLNqxHaUvaHElX48eJyvQ5UchZoPNPKizhU=;
        b=QuNZbqwsBNxNnipsn4hLIE9NyeFCT6idEXbwgrzgEnYTHXbw73p6jGLvh/aQmuBd2Y
         XaOxgSrfRJwL4Xu3A7HbpjXc8fVo63nWtteDG48RgGTBE3oLu/8g55GsggyMUwox2XVF
         9mEeCpnEzAcVwR7gg/oIgdD4UETZVqz54cDW6oS0OGpD/JuxBQ8HcNcWZHxtkXvBzQRD
         /WsCHS7+dkzaTZa8PdFiosc41ct7scbG071Y8M7V/SxuNb4J/uxyoJl/432pHWd1antS
         FgMHSc4ONoEpAzxUZG/emyrTgJRh12Xgfkc/FCYrpC8FWyuODcgdPYiIfSVlGesSoGoB
         6w7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732788; x=1795337588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wNHsMSnqXLNqxHaUvaHElX48eJyvQ5UchZoPNPKizhU=;
        b=VCvaXLzKwVWvVvPO3gNi29pF2DnWBRvdzRFeZXCZiYrwjhRlK4PPp5iSHFLBHLPwdm
         8875+P6NBPUco3LjJGT5nOAZT1QFrjiiNNMNFJD3Eq//J5Nqi9e53MHidyj7YidbBX3o
         ewmWIHecz7pcUoJsbDmCEo9ThLnbDby5HXz7M/CNUS8RLnDv5cYBxzN6M5flay5xPKSy
         mTBAA7zxW2UdJGxCD8OExyYJ9PKcCzxnY5KcYxu2dH+/7T0log2guUMDfae8OzZ7o5Bd
         wQHHr9xdsqJ/beQ73pB1ikPJUTsJv03N0mHeDErZINlbES+rM4+Vz7SHmqS3IFCG/7v+
         GBAw==
X-Forwarded-Encrypted: i=1; AL+hErEysX97MRR799lU0aIhFetlPQ6o3xEoXVOrWC4kKzSZxcL8A/W/f9Cf6GlYiEM/RajDAF1Xxpa8do0Ex9I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RK4eNcKhO8Us8Afs659I+CUf1ndEOWcwEzxFklLnqGyKLV3rS
	DH/uZvGp99R1JZJ2eYr2HuSA+mwz57gaAOmlyI8ro4yYlXI4u1AZvcfv
X-Gm-Gg: AYBFou2njqCKBPu1fRVzyvmm90BDYKV2cO1xEC48jvuzFI1iUPRZ/QVzQ4rwLl2fdcD
	mwwRi20OhEGlw2+mz96AY/Fvpt+9GjW8esxzMORhQLpb0cEQ2kkGLQZJhfSTcmNh1yp5A0oSmTr
	jUT84XsaoKLEfGDXnFIS0ZVodsYku9Vfv9dwEo/OelVZEu2aEAuZ50tEP9LfaMkWScWYkBJW4ql
	8dcvgOno4hj1Zn/unyOQgsNa8Ud1kxxoP/em5AM++PLmmm+QWIYxgp01OPaMU2Ir9ysBzhSYFVm
	tl1r0ep2Lk2ka4LJLm8QrQmM0xQH7EzsLNCqOs4csZG5Q0aia8Zf95zZzPSTh15UGg8YM702xHJ
	4LfMH/2hmxIRYZ1No4DPL1TNEon6u9ETkqsNVngE0jx7B9bOT96cYG3O3qI00KJOPrbvT1L7m6E
	pxQy4K8TaCPmo5DEn1ah2PcIRllsvSO2g7dk32qP9kz3bUEjNG8MebepmkdpMdAefr9uU7TUeIO
	Avkiu8UeUvK59YGoWkpBnt+ch+V+TaQZ1F+X4fbLQMgltDrqcGwYAS7OsL+6PItNb7PeYyGDBt0
	sq3b52qtxecADjNpEKFPPUzuH+KKL8nKYxdONnYgBS1tvqP5PfGYCWCYOaLBtJvU
X-Received: by 2002:a5d:5f09:0:b0:48d:f730:bda8 with SMTP id ffacd0b85a97d-49c733510e7mr14372013f8f.50.1794732787542;
        Sun, 15 Nov 2026 00:53:07 -0800 (PST)
Received: from localhost.localdomain ([2001:8f8:1161:9f6:2001:1fcb:a25d:8f2e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5fe370f8sm13886168f8f.27.2026.11.15.00.53.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 00:53:07 -0800 (PST)
From: Ximing Zhang <xzhangjr@gmail.com>
To: Hugo Sales <hugo@hsal.es>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Len Brown <lenb@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT] cpufreq: intel_pstate: Refresh cpuinfo.max_freq when a CPU goes online
Date: Sun, 15 Nov 2026 12:52:26 +0400
Message-ID: <20261115085234.40661-1-xzhangjr@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114-intel-pstate-online-max-freq-v1-1-1bbdae2b4986@hsal.es>
References: <20261114-intel-pstate-online-max-freq-v1-1-1bbdae2b4986@hsal.es>
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

On Sat, Nov 14, 2026, Hugo Sales wrote:
> I have no HWP machine, so the HWP capability path is untested

The patch fixed the stale cpuinfo_max_freq on my Core i7-10510U with
intel_pstate in active mode and HWP enabled.

The test changed no_turbo while CPU 7 was offline, then brought CPU 7
back online. These are policy7/cpuinfo_max_freq readings in kHz:

  Turbo change   Unpatched   Patched
  off to on        1800000   4900000
  on to off        4900000   1800000

Both patched readings matched CPU 7's reference with all CPUs online.
CPU 0 stayed online and reported the expected maximum in both cases.

Tested-by: Ximing Zhang <xzhangjr@gmail.com>

Thanks,
Ximing
