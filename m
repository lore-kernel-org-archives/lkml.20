Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794876103;
	b=0iHQ09x0Vhz7Q20fb5ZgCIPGDy5UFykOetwSiQFvTGtXgyLuusYSPhKaq4BfSSybPeYp
	 0SUria3+24zxPU+SupTa2G03hk2sW8wBgsYq7pYGRQPx6XOisJiFASe9lpqQSWaAO9le/
	 6f+Wak416qHHgS5/zQscPY5icFcnHQrYH026NTE+/jOfls0l2p0Sn9hyUOoHjD3oDqYUz
	 2xYrd21tKw29wkFKs5w2OWLejyx+fS73CGsa/J5o4xI+DyCsZbnJcLhSfY4DnIUYCLFqZ
	 PqGakOc+U027Mt1oXi7uEldJTwqajfxdfZ17Jx8PRRmawndm+/Upj4UZYOOoCmodIcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794876103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JJxaAqU/N4mLE/X/C5f40TDVe8Y+8SNJEnAV6SKgDMo=;
	b=iH3et9tpnnGXdle11rNEahJKXefBGfSnoUbIYanwCeODMheC/kLMh+hmsy9yaBCKqKS5
	 YcW8djRvVIlLk2rhuQycX1G2WwdidP3UEzyOdd+rXIB4nJO1Cp5vFsMuzIzmO9V57Kxay
	 0aIhlq8y4ap/F7H5Br/kcdl5LiK2gejeeWSqQkKa370g6UJu0AyPUOisf3rwPcHQGLy/g
	 l3PBPQbJgTybpaYiDZHRSdnm1az5ME2qOP3+pRUAt+MUJjpPSCqztT35x9thoFp+/YDiv
	 yAY0EqBygyT9zO7BqASj8F5EdH64MJVMhV6ECoUk4Q7t+GXkhnPzF4plqpvhxKPL3fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tv56jH1i;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2003606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2003606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tv56jH1i
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e977109392so24101765ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1794876102; x=1795480902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JJxaAqU/N4mLE/X/C5f40TDVe8Y+8SNJEnAV6SKgDMo=;
        b=tv56jH1iv1IBTN63TvObbpX1zCNmAWOojKFikkh4lz/ckuHRpNc3A8s4Wryq2PWq0i
         LtA94VGruH7jzQKfcsrqeWhdsJVHAnXwTOv7zpqnCOG831yI2rV/SpdgWC5AFDzybxJU
         muzGdYZLf/fK9sbG68xDH224hPDrCNrvTCLZEjWiw1ndULtPpBEjZ62iT1BQY4qXtNcL
         GvlOnWa0MaMEwbdK1xo290mqxB7muv9v2JMjTnNcbsG67fbqbBurN3zeLK1I+uwrFtQw
         W10qGCYWFVRN5CBSXbZXT4ls0DX57Lf3fHPNg9PJUbvcF11FjOsBLJ86YpHn4un0Yk4k
         nLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794876102; x=1795480902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JJxaAqU/N4mLE/X/C5f40TDVe8Y+8SNJEnAV6SKgDMo=;
        b=DSM0SbfvxS54F+T/uZhHmpSa/3bTtdgxS/BF/B6qZQBT5zGRj7YLuGXmDUm0Jk7oVv
         89ogdgHn9umKewIL0oV32ML1DMJVe3O6TZrk70hFzRcHYgXEpWw9M3EPbQ1H5QipiS5i
         R2ZqTDADxoMxvWJ9oWaS0XnaUsYKHlM4h+zxl8FxhbSO/rMfdRnAamZrsSSQrSXUkw+p
         vy2s7AdwpDl/VqqvEKL7DNdD2nXbbyE4dwMZWwE4f3DWnjyAcLM+5r48EHCL/t+yBz5T
         5a33yxSzC/FSK01/ijCoMy70RpEWTM6gzZe0Q7SmFJKttKwXG1K+6jbWxo8fEy3V8Umj
         jAog==
X-Forwarded-Encrypted: i=1; AL+hErFQtX3rsMJ7VR3aeBdI6PB+fp8HGzNAGvt422SUBJVsPCEryNlDYtNvCTiNUjh9hPRKjy/tOeIiLarHj3M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zjxuFO1Rqti7BKQV0PH8SkrkA74mq/np4V9zKMb8m0nKamfU3
	Urfie3RE5dXmq83M/0qmr9A/Db9BRB78NUeTGOlmQet2HWkbhW1skoqHA1CQZ10UQg==
X-Gm-Gg: AZFdTZefprOrYATBSzcflVFRO78DVoihIKhk40H+NvDpfb43wYOjQRABoIOwBQvq2Xe
	0NhFc5/HvwY6TCVpC1fdZAZNtN4naND0K6QVR4SxCDDMd/7dBJAnWhojgngm6niKiJxEtJ9qngN
	RUm9SwICt8OvUXb+37llHk8Fuh2N2GJr7xyYhnN1axVNKJn0kMNN3iG0RHhVdoX0Wx5qQ6NiLUt
	ziICy52BiFxu3KR35V93fwCZCvyDQ8T3b9ZpFolGmsNkXYpKv6CN599YdEfa2+D6ajyjtjTdYHu
	O+8DL8pL25Cu/R/0Mu0r1+whq/k6pZiYEYx4zBMTvHz9Vehir9FigkpmG46mawCk0y4NjRYm6br
	7gI4UMZARZluZ5qng/I2PVOAXexS6rYj4OcBg7qKFr3QYRdMzsskdQw0oMkVbmZShtlJMNXOYvh
	JoRJ6uq2vPS9E1WSkKYnA9aZhD0qsECZ/YjpMi4l+0y/hKLiBJmbW3r2cfievdzUXCiSULiBVi0
	3UHez2+61MNZ+UGzrKpmMvAaRX135NGbBA/WyidrqA+TCxV+zte+3yloyjWJKCJNRZdK4VVEnt1
	zO4uoSxImnNmZkEOLcnMrW+RGfW2LraXc7Nu5WF/9rIArpktA/oermaL8NCDTcrJeNEbzEqSXn6
	RQ2zNL8t8vzR8OpCf6w==
X-Received: by 2002:a17:902:f687:b0:2ed:3c11:67e with SMTP id d9443c01a7336-2ee0dad0688mr134037395ad.24.1794876101909;
        Mon, 16 Nov 2026 16:41:41 -0800 (PST)
Received: from cantal.lan ([58.136.72.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd76d8f08sm5594825ad.4.2026.11.16.16.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 16:41:41 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	s-vadapalli@ti.com,
	rogerq@kernel.org,
	bigeasy@linutronix.de,
	martin.kaistra@linutronix.de,
	vadim.fedorenko@linux.dev,
	r-sharma3@ti.com,
	robertcnelson@gmail.com,
	nm@ti.com,
	vigneshr@ti.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 3/3] net: ethernet: ti: am65-cpts: implement PTP_SYS_OFFSET_PRECISE
Date: Tue, 17 Nov 2026 07:41:33 +0700
Message-ID: <20261117004133.1594972-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179446830443.2199510.10552580927894870264@kernel.org>
References: <fd826c118aec02c06bde92ff9c20f1958c214b3d.1794284248.git.jjc@jclark.com> <179446830443.2199510.10552580927894870264@kernel.org>
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

> [Severity: Medium]
> Is it safe for this driver to own the EXPBIT_SEL field of GTC_CFG0_PUSHEVT?
>
> The register belongs to the SoC-wide GTC, not to the CPTS.
> am65_cpts_ptp_getcrosststamp() rewrites it on every PTP_SYS_OFFSET_PRECISE
> request. The previous value is never saved or restored, on success or on
> error.
[ ... ]
> Suppose one of those consumers expects a different exported bit.

There is no other user in the tree currently. If in the future something
else in the kernel wants to use it, then the solution would be a small
driver to mediate this. If there is a user outside the kernel, I am not
sure what you would have me do about it.

> [Severity: Medium]
> Should val be checked here, to confirm that EXPBIT_SEL now reads back as
> AM65_CPTS_GTC_PUSH_BIT?

I agree this would be an improvement and I will do this in v2.

> [Severity: Medium]
> Should a failed syscon lookup be fatal here? A bad index just below only
> logs an error and leaves the feature disabled.

A ti,gtc-push phandle that doesn't resolve to a syscon is a broken
device tree, so failing the probe is right, and it lets -EPROBE_DEFER
through.

[ ... ]
> With CONFIG_MFD_SYSCON=n, the syscon stub returns ERR_PTR(-ENOTSUPP). Any
> DT with ti,gtc-push would then stop Ethernet from probing.

MFD_SYSCON cannot be off here: TI_K3_AM65_CPTS depends on ARCH_K3,
which selects TI_K3_SOCINFO, which selects MFD_SYSCON.

James
