Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792518733;
	b=Rei4Gg30whtSJB/liKuk6fOSVLEp9dRHXXxBBBlNAsBsyq4TSirOF/lUInjscS2Z3Fdk
	 RBakelSQVkqMxMlzzAMsL+6m3u3rcTRlHPh/RHOpL+o2y0dBz71OAtSXjcf5043A3Acm/
	 cLbXdX+soPn1vw7S0Pqjzv7uKMFDWgIYn98iNfZ4tR+wpuSb6/WHXzseOREdveAPafhYk
	 6pUhpB9lBaZn/dL/+HTIox1odBof9JS/JNPMasfjYjND+mqXy83u+a5Qlh1jRjVvYhUZX
	 7gu66i/cp9z7hheGLeI4vSgu6vlhqT2EpfzMSm5C9fwdi4YzQ/3/EEnPcLTvvjs41yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792518733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DLynpXkcnSBCTePjhJ1JNf5DdxkMtU5O62aB9gwLhrM=;
	b=ij9pFaT50/DxrhMWa9z3iHnexHqUJcavk3Zs+rdIwLGR4sEGOFMdCmOpp5OiwkH4beC5
	 5z1cR19Nh2OhUcxe5NIxYbQ0peVm538gAwOHMWJOdMicoJ28IcOvVBpsBHp77HIZS/JWb
	 53VTL95AdzUcYRKnR81W4jdkPIghD1fCRG1Ga+ldPSu3QLztOlwJ01tiqjUpeUvOt68LH
	 i6TRzb0nG+4w5CTVQcnv/l5tXU8h5U97dCVD4rQ57Y0wGqFwsy5bE0xZuN/R26p2Eaqpc
	 cKL5Qx5d0NuYSlkvKY1n9NgVT8/7r9qtg3ZAMuH4Ve0d4urK6TD8vFvTFGSpcoVAbvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mlkjQya7;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB041606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:52:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB041606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mlkjQya7
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso2183544f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792518731; x=1793123531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DLynpXkcnSBCTePjhJ1JNf5DdxkMtU5O62aB9gwLhrM=;
        b=mlkjQya7unhLNCSdndFnwUq4Y5QEOTw3r5heS1hGqytEtBX+VBrgGhIPP2X6vUAorn
         /0dYEbN8L2E2ipbNe92jNklwZP7UiUTnq5ot8n96lBrByx7PcnLOpqFm16hy4WyGpl23
         Ihni7Z0JER3UNOuNdW6pdNqtlRpNvNxaJY/M+MN8S0kdh9w7mwE3ykAy0iRZo97bOBqU
         CVfK1a51lXPOOchy/Nlg/XFk4tMMx0bt/8KRNsUW6fQoc0q/QMF4utvcmfbK22mYNJSA
         vFU6RQXKrUTjYkiPKcQ2/UCYFOvWuRX8Nuqjj0eFMtlgyfZEg2cGMqBqBQSflrxuuSY8
         b+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792518731; x=1793123531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DLynpXkcnSBCTePjhJ1JNf5DdxkMtU5O62aB9gwLhrM=;
        b=PGaTJ/d36O+VqRpFrBcqsVMFStjs48oKhZp1tffWfUiCJOePoW0KPPlLxhd/a10W98
         eluRX+sU6leLmb33rhWKAjNK21ntK85yn/KUC2IMv2/914Rcn8Rx0Z0/WO7ApgbzwCin
         wpzdoSQzAGwdP6LZGrynTpsaEKWF4zmsvWvqa4uipe1FjJ5Cgox/Qhq2Byao8kMhMnjO
         fLIOFe9xFnC+vrEN/AB4q/0paHhxCxR0n5sF+qY+ob0ArcODau1CLk7RI5FXiSfap3xx
         F9bEu3c5zNQabTX306biTkQ1FpSW2dUG/fqM7OLiyM4KKe3WaoGYdMGB4S8fjSDOCXlK
         KwSw==
X-Forwarded-Encrypted: i=1; AKwUvBykLB4QgEB9GaR5ebg2cTHPD8Kl6q8JCmNvdq9pE2kJO6J+NfuTwn5fq8eEGUprUsaEqVzpON+nfn4vlts=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoxdnT24cQHzPyfKbGJrQVe5Qmidx9FKmG6ibxxbO3mWt3WYCC
	YC4gGbwqQQd403+/EhT5TSbAhdMk2Y/N2VwnKkW601Z66cp5UnNGFF5y
X-Gm-Gg: AYBFou14sNGujCWxhLb/Cw522ua5X32jRhI3XX96XQ3xR7C8GLngHDMXJS0YDQhQ7og
	sCoM2vsSNMzYObfthb3m1gh9tSPlK95ArVJXatUmBl15Zf2MPpwyJeWvLbWCp0jBhZfkXRvI3rh
	tOjZBIW9cTCjNBFrjIkZptGkR8r8KeTcIObts3oFHXxbTI0XfgB1h7ymLWgiAHeU4P8GerkFdcW
	PNYWUnfrViGOGO10Bkbyk9Ej+JcLE4ycPpZm91vtcgKZUIxkYTJGj6LeJT8ieiSnDdPb+KJ0Bi+
	TDd82J/uxHoQ+6ygNZYAAkfS9kOGRXdNCZ1ZIUGV0Cq7xiStUdllMdMK3W5wb5padT3L3rysKeq
	7a9MiSVXjYX3b/MIjEP6iVw4CHQtwWcIn4bISLakch6Ut2Hk1cB0XSz73oUnPdzdKcvgCTZnH/M
	I/Vi9VOdLtSA3Oc5pFn9DVH40J1UXMGjlYwgnX+zBaZbRuCC76HIGg9Tey/6+NsZE5EkyRkG3Wb
	SRj
X-Received: by 2002:a5d:5846:0:b0:48b:677:f80d with SMTP id ffacd0b85a97d-48e07f98c94mr23696027f8f.26.1792518730799;
        Tue, 20 Oct 2026 10:52:10 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8214b5sm8165192f8f.41.2026.10.20.10.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:52:10 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v6 2/2] wifi: rtw88: support channel switch in AP mode
Date: Tue, 20 Oct 2026 19:52:09 +0200
Message-ID: <20261020175209.2962726-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <9aac793dbdcf4c4d99800418c16a7346@realtek.com>
References: 
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

Hi Ping-Ke,

On 2026-10-20, Ping-Ke Shih wrote:
> Do the 60 / 95 ms delay here to substitute 10ms of
> " delay = csa_tbtt + 10ms - read_tsf();" below?
>
> I think 10ms is reasonable. Not sure what is the purpose of 60/95ms ?

The margin stays 10 ms. The 60 and 95 ms were a test build that sleeps
before every second download: with 60 ms every count still went out,
with 95 ms the late count stayed out and the next one followed at once.

> Use proper functions to do 64-bit arithmetic, like div_u64_rem().

The patch uses div_u64_rem(); the % was only for the sketch.

> Can you measure this on USB 2.0 port with some traffic?

All three ran at USB 2.0 high speed: an 8821CU and an 8822CU on an
i.MX8MP with PREEMPT_RT, an 8822BU on an AM62 without RT, all at
HZ=250. With iperf3 at 18 to 51 Mbps in either direction, the
downloads land 13 to 33 ms after the TBTT, never two in one beacon
period, and take about 3.3 ms with or without traffic. Every count the
sniffer saw matched the beacon timing.

> See rtw_hal_get_tsftr_by_port() [1]

Thanks. rtw88 needs no port selection: rtw_core_port_switch() moves an
AP to port 0 and an IBSS runs alone, so 0x560 shows the beaconing
interface; 0x557[6:4] reads 0 on all three chips. With a station
interface up first on the 8822CU, the AP moved to port 0 and every
count went out.

> Do you have any concern about reading TSF as parameters of CAS work
> delay?

One, found in the tests and handled in v7: when a TBTT falls between
the countdown template download and the first TSF read, that TBTT has
already sent the template, and one count went out twice. v7 takes a
TBTT within the margin before the start as the one that sent it; at
worst one count is left out and the timing holds. Forced both ways,
every run matched the beacon timing.

Otherwise none. The jiffy rounding adds at most 10 ms with HZ=100 and
8 ms with HZ=1000, well inside the ~80 ms a download may run late at
100 TU. A TSF jump restarts the schedule from the next TBTT. Below
about 30 TU a USB download may not fit in one interval; the catch-up
then keeps the timing at the cost of counts, as in v6.

I will send v7 with this as patch 3/3, patches 1 and 2 unchanged.

Regards,
Mehmet
