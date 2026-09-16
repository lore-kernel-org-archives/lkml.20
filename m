Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBEB3C3F6B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789557832; cv=none; b=FBTvWfRCRkZzBfw5OVxOtIsD8AolFaQYQ2IvadWLeGibp6Hk6OJLcSfBf3S2YbmcfAr1AMYF2uCtqe8O0rwPO4mgGWD8u9asM7rdr8nrcJTyqnCNbDq5zgRPA/TfsQidIcBXE+Y0uMsA6wBm9NiLwN4a+PJG/5xRT5UrYJafepY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789557832; c=relaxed/simple;
	bh=9xfCnfWUft91FQ9MOOueIx15mDmNvVVdKkU3/hZKgHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qvYxrbeQN16s1qz2g3pq/Gu/mUSh9dfM1hOeffNX7oU75Gv2omxfeC6QXHri0+FMP7+rckuakIXU7ZGdXRPuFIgcMQP6M4oO+HTzsbIvSUsVVyEMTVuu4Ij4j5kht1q1AvUS/bfiP0Cbk1cYsnSk7yuHt84piITyOGgtyD5lWc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KznDIepM; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KznDIepM"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso5925405e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789557808; x=1790162608; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9xfCnfWUft91FQ9MOOueIx15mDmNvVVdKkU3/hZKgHo=;
        b=KznDIepMwI5gk4UeJdZCO8BouTShkrtZyFygLGKAug/vX9irn7LxY7Qu8fo7SCKdzz
         ymP7kE1Gu8zfPTTanl7KcyUw8/RfsohNp1wGc5MoINZP9ccRvHiGNhDP63NjcKqD1ddi
         RgLpR0dnz0UmM0fS5z0s1n5l87SMtaDBjGHCwzsvrw2S3LjAv0Pb9fq1FGd1n1yBEnO9
         h/0vLsaL6MQNxST1EXz9bjK9T/43Ns3hD4yYDz2TSJKNMw4SGKw7Dyk7GgX9wVh2mu9g
         540Jk/kRxT3RRfcQ7v0Ao6pNZbiawylp7bBh9uR74plkLyY5eSK57UVmoMMxE5W8qvlq
         Y7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789557808; x=1790162608;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9xfCnfWUft91FQ9MOOueIx15mDmNvVVdKkU3/hZKgHo=;
        b=dKRxY8rgXnOEZW6e8y2IOvDmAoUAC91aIFkcXzxH8MEfi/ELnuTQzS5qAeEIh4NcwX
         eZlswlz2dHjh5uunPX3xBDYl+o12uvSiHzUTebAh8TuuJO93RDWFtDx03F1wG6Jqzuuh
         ZAKDOZPuXNqO5zKUidJK4ptz2wIGbfsp9Yllu9uYSZCqqZsLHMao2mxXppxv+XFzapnc
         NmH4ZBqnHojI+NTOMIYyUDbX1oh1B4lPUFr8+RtP1g3P6naHoVD6QDp0IlALy/KBjCFG
         lvuDnOEWoa4HwaNDqYYz9BY0g5hqQHt149bTEpMb28iRbjf+DkXvV06htsbgy78MSiMf
         X2AQ==
X-Forwarded-Encrypted: i=1; AKwUvBwt8THnRbImivOQbgcQvmhJ9jLv8a6ltacd1lVTIaGOHt+MGg4Ae2txifL66I5/NWPDO4UvGhs/mWafAyQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m4x3f5QrJIn3qEVWeZBaULdeKyTeeMoA0ojkxeEmadEBrgIVUv
	Rsx7wNZNDh7qARO84PUcFxaJTXsqsYO+8FGGuWCW201PmrXW6obsmhCg
X-Gm-Gg: AYBFou1Le3gxGtnNV7JBP/lT1hEQzQwzX7Goyo7KJlI8jtDEHnSfCM2EmyDbBjau6oE
	2nQXERbxLd1g3aJ35SOFHvMz9WiJ14tfA5dz7955qENDcc7iMI0IS0gKN3Xx0aqvQgyzAYVk7/Z
	20zK4WvuKC5dCDILAcuMYpuLm7+LfJA5lP+7v2AIspB6NUN/caRT4iqJ84h0nyCCSXosy1/JevJ
	ojGTSVuImPBywjS72BOaxy1muWCuhN7psa0djn3i2aUI0gcXa9gfBu9p1yG8tc44//9fleLAf9+
	La7cKVYUhd55WRS/NyIhj1ZzQaqTHf66Xrg8KYBZVt/fpXiETEfOUqtzKfpAZRJ57Zsh/ZlmCD8
	sSPzCYKnYE7oVkxlowlgw3EBK8k+Pdui1VVbpTFh+68MOvz7AXyyVkBnwbAt2fLXTonMFpraq1K
	OZgcxTgPZlujzJto1dNCyyeQkBXm9Tf/xAhR5T3Qz+52GQJ+YyRC+3TdotAi4VQtaaJ2M2cH0a/
	AQ1Z7wB77M=
X-Received: by 2002:a05:600c:6296:b0:49e:602a:b4ec with SMTP id 5b1f17b1804b1-49eb730e225mr53609375e9.8.1789557807754;
        Wed, 16 Sep 2026 04:23:27 -0700 (PDT)
Received: from localhost.localdomain ([194.154.195.114])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e83d9057dsm80761805e9.3.2026.09.16.04.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 04:23:27 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
Date: Wed, 16 Sep 2026 13:23:19 +0200
Message-ID: <178955779940.30466.10860982419496123467@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <55538466-2203-42ec-a0bd-b743c04a3b38@arm.com>
References: <55538466-2203-42ec-a0bd-b743c04a3b38@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Dietmar,

On Wed, Sep 16, 2026, Dietmar Eggemann wrote:
> In task scheduler code we use cap_scale(v, s) for CPU capacity related
> scaling.
>
> We could move its definition from private task scheduler include file
> kernel/sched/sched.h to include/linux/topology.h to be able to use it
> also outside the task scheduler?

Fine by me, that reads better than open-coding the shift. Your diff
builds here on arm64 (topology.o and kernel/sched/), so I will fold it
into v4 and add the scheduler maintainers to Cc for the header move.

Since the diff is yours: is a Suggested-by enough, or would you rather
have Co-developed-by and your Signed-off-by on the patch?

Thanks,
Oleg
