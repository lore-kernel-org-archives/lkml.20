Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AE6535FAA
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790074416; cv=none; b=IjAWXAu/evOT5ehfDZM3f5l/0CcQoS9X4k1TuWy8LDwnYg7uhqcqZmSCINS+/kypX0BTN8d8sc/iA93l/7xqUQ0qd6vo3PWN9rLWi245lrd79Ikw4XkU3ODuz2xQPtjVM8pVXTK9NwrJQ71bbQEDR4KBUZDLJKGu1SAolKj3W6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790074416; c=relaxed/simple;
	bh=mdCpsV3oeBbM/txrF6zviMQFbYf9Gv0D67sVl5aM3Fk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OuKCPc9Ya3LoJjznVI5ew9qplJmLNNZOYn7RhZZCtQLOo5FlQCEbIyyVjX4ArK3Es75628DKW4JLhbgxoa0ElcPcU2v0dcNH6BgQAmlaZRcjSIHWakYzRXc8bAJoCsgcElzZ8b1pyAg7STaLEkYxcT+uV3mIlOjxXvShZ0ql+x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D12hVC/V; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D12hVC/V"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469a34907so4255529b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790074411; x=1790679211; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mdCpsV3oeBbM/txrF6zviMQFbYf9Gv0D67sVl5aM3Fk=;
        b=D12hVC/VeHOG2LUl9Qk5sLDKR924kcC9Cru/0NvrJv2WmI1kzbDK0n6oGJfhMntSl7
         JsIVqknDEaJiwMqUeFAyKcDn/Q+HiL/SKgMGnGchg+2/bG3Ut2hy87DuHJ29cciUmbR+
         rri62iVzWDM0Xvew+NBd/jofE6PgqAYju5XN7/M5zk7nej8qzvlLNh3v3XPnDiXq3BFM
         nFggsNrgPNPp1NOzCEFMHV8DotywO4el1QZB58ZD8dtCAH46wCHm1vL0NUaR6x5KAiC/
         a58IpjgjoRWls1BSPjTJNAgF0bj2tvfIw5MssfY+B0Gook5SKSBaAr/mVGZ5Ir+0E9V4
         1RJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790074411; x=1790679211;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mdCpsV3oeBbM/txrF6zviMQFbYf9Gv0D67sVl5aM3Fk=;
        b=M5sbwxmFO18W4EQD1QYI5j0wxkMJVUqln/HeMT/sHC9nalEXR06k3ULeYAj83VwoBr
         4s7GiEUHfQnCeHXY5rApWpXwSK+HetQroFRE4rFuj2faKZnnaMvVIpOqKqhqSZcBqv8a
         BYSasMGl6Gm4x917axQxVFKT2Ca0xU0vpyyGvEiTxUgdKs3tMq6MV/TGiE+gK3hhH8nQ
         xdeLeyTXuzO3VJHdSs0trYLs0fN2zOQauWyvhxANLsLb0TFei+STeDfX1lDJo0D+9afI
         ZCI2FI3kvqX92xJNtCA7yOhygipyqnR92IeoMrlek/ZlT2FEkiADvd93OgE+KfplBqRU
         xtaw==
X-Forwarded-Encrypted: i=1; AKwUvBzhjKFcqRxNcxgQ7fE/nOgq+kPVyEc8yVcifj+Q4qu7aRlOAYZvj1ywhw5zHtjizlYawpmowPQ6G8FC5Do=@vger.kernel.org
X-Gm-Message-State: AFuF++mLwUAxALjGMxDhdNC6/t7EoOeps0PHNylbYDTuk9vsT8OIJkbZ
	CCp2rrNzBr9Npg+ge2Zj3jM1uqjeE/PipHp39EHo7cnVwLI77QyeUaE1
X-Gm-Gg: AYBFou1jvIK17oPGcMkUP1fi0U9kSJhh0MuS+LFnXPGnDeHkvKaEAXJ+0Z3BMYmiAZK
	7KHmxWqlmRAqL9UfbtbRkvFJzX6EHN36LlId7ACGvHkhexkjrpuPoeopGVE3edAsjNSwrYfG9hk
	T52JtCw/EGOPE/PEuhxnTFt+YVw7C90ViHx8VSy/3U33qHcLEFfcl7SCMlNLI6xnuFKusrH5cRk
	5QwQ0ONBfdGpu02BDbMvu8+ya7wNFxwbjeVtAjiv9d3JGbHXk19G61DmRYkPA+juYR27+xMNVwX
	gNzNXTM1BSpeUFUgdtu6lpLw48iTBxOtJ5swA2zo1sVI425C6kM2aTs789gA+6Bhjz9L/lkooyu
	sSElt9afGHLh6IvafndzWvhKZdwNzfBRaEHRzqQrT1AtYyeUly1Vq8Q1Upf1ROCeokuh5I1eoMi
	jyiyssK8edwerQu+H4W/ajCuB/Sr6RJZiSf9jauRrkfxYdm7RgB5giCpZAoUo++Ewhmw5SlBFvj
	rVQiESlHvrfCc/MH5fTN+/Opo73QMU0xsutKQE=
X-Received: by 2002:a05:6a00:1743:b0:879:ffd9:1282 with SMTP id d2e1a72fcca58-87c819bc726mr913524b3a.8.1790074411386;
        Tue, 22 Sep 2026 03:53:31 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:e5f5:eb9b:fe8e:9197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87cd584f183sm2302b3a.41.2026.09.22.03.53.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 03:53:30 -0700 (PDT)
From: Yuchao Zhang <ndaugoing@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	sashiko-reviews@lists.linux.dev,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: Re: [PATCH] KVM: selftests: arm64: Add test for cross-vCPU LPI disable race
Date: Tue, 22 Sep 2026 18:53:22 +0800
Message-ID: <20260922105322.40484-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260922102959.41FFA1F000FF@smtp.kernel.org>
References: <20260922102959.41FFA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks for the Sashiko review. All three points are legitimate; v2 addresses them:

1. INVALL/SYNC on unmapped collection:
Agreed - INVALL for collection 1 was a command error that stalls the
virtual ITS queue. v2 only sends INVALL and SYNC for TARGET_VCPU_ID
(the only mapped collection and the only vCPU receiving ITS commands);
unmapped collections and untouched vCPUs are skipped.

2. configure_lpis() overflow via -e:
Agreed. v2 bounds-checks the -e argument in main() (must fit in one 64K
ITT page) and adds an explicit assertion in configure_lpis() that
nr_lpis <= SZ_64K to guarantee the property table is never overrun.

3. Silently ignored KVM_SIGNAL_MSI failures:
Agreed in spirit. Injection failures are expected during the brief
window where the disable path has invalidated the ITS caches and the
guest has not yet remapped them. v2 counts successful injections
(checking KVM_SIGNAL_MSI return value > 0) and asserts at the end
that at least one succeeded, so a permanently broken environment can
no longer yield a false pass.

Additionally, v2 re-establishes the ITS mappings after every
EnableLPIs toggle. Without this, the disable path's cache invalidation
kills all mappings after the first iteration and the MSI flood goes
silent - now the overflow window exists on every iteration, matching
the re-initialisation sequence a real guest performs on re-enable.

Tested status is unchanged: no KVM-capable hardware available, so
compile- and TCG-plumbing-tested only; no Tested-by.

pw-bot: cr

Thanks,
Yuchao
