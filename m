Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76CF37E5EB
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790486279; cv=none; b=b09mW7TKQ7zfrXhDkKjwxzyx8yNqghteAzdsUz5EpLATKl3eJb4PUAxzGDBXah0zO+C6tWtyClpL6LuOq6ClFlA8Mv1RRxH1WkjAjRG0d64qxb2mPj/jpSuH8ii5UMwQ2hJLu6VLP3o54ZQKM+zBvUIwi/YjglktUMG3ZFfxIkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790486279; c=relaxed/simple;
	bh=MbI2CAipFQlkcCXtD8/pXznz9amsVPkQ4vG76YYrVuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GfML6AbpReAhpoPulbaI24Ie/uzSCxmIlMTC3uPX/y9GocowEyHrkCNFzZouayGI/YJi6n9ig/LhuRN8hAm7yGVYCZRekcjO4YwKpmRpLaIPsqfzhIgonO1oVr9MnhkuiJgGYeUp1k9OwG2i+kNapbwtYcFFdW/OmP+B5wL4dFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G3UJxVuF; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G3UJxVuF"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e62211987so2283503eec.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 22:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790486276; x=1791091076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mYPvDSVXM3c2xr1UquxO/x9RKs46Xl+77uYFO9CJ7SI=;
        b=G3UJxVuFVx24fgI1L0dk4eZXNIXiHMRal4tSMZrhzUkW3zPV+Wrlt4Q0+XXWdd3BfB
         h1/0AKHDnfFC5pg8OyQZMRgeR1g+IrK0Del2SKMdDEJFwuaPSVj8ITzSVU0Qsj8n7BU5
         xe9zGjwdIxfXBRVY8cunGBJ1BkT5droXAe/nEEX3KYZoKCLS1mczgTB0csrIhyQytpnp
         y+EiA2ZqHy4i0VYtxsHRY1xvtRHWKFo7H4IWJhPosknCSD8DHCbdO0UyX/zzFRb+B4rG
         yztUSgPWcZ3pVMahW/Wox1ajKLyGDu3XzjFLTL2C7LuAWRPW88cupuvPaMWyElNHj28n
         Dbgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790486276; x=1791091076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mYPvDSVXM3c2xr1UquxO/x9RKs46Xl+77uYFO9CJ7SI=;
        b=I4ECWFxk6JNiPaghpZ4ig1bTkdb31OOrAufZOWz24Ycvbr93GLJj/Phb/82eg2gaMN
         SnvvA5QqsYUxl1JJVhjrIsP387vLtxw4FIjcvSBU9QGXZlGPlK8QaZEl9NkqhwZ3T0Kv
         7mTDhNYgVhig7sJoGU6fWzCTt91bmkyb986IGtWY8E3lDzHq08HRhF8SPxWr8mbXEhTx
         iydDkJGLvbBJnihyspq4VxAyrMUObcX/xvM/9w9yrBnSWtnbRCwZNSMarAYi/X5jcc6t
         XHWiKZLm0q5k7K+FXOHHstDlIFuVAx/YwegK/Q/uBWnd3oTwQWzP/r7yr1yflzF10kIC
         hDoQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4Q/btMbN0yW0GOnYF+EvWfJmFUBkR3d/p1ekJWiM1BqcXXL84mhY9Bcg6JLe43Q41G+h/yb7qQH0GyE8=@vger.kernel.org
X-Gm-Message-State: AFuF++k8kiQBv+IhHWgbb8s4PDnfUZnWI72SfU2wVcfyZRWmYgAy3YHM
	Mjb8MhqA3ZpNHb3+me3mJshYdCieF8jPauaMv3Sy3Z3XlusQoCCe6ZGq
X-Gm-Gg: AYBFou1FwVxHX7Q42GxFbw2vu8vFa3Pf+z7i6xoTWPkZ6oNOP1/rDCSeu1vv7tNxAMk
	4UhnCFK+/ajmUKYi26mboFHm0uLVW5NEV/UVv63XriHmah0dd4ik02oF/+LKO1cojQPRWMvw589
	h+8d47tdo5tlAwUmqwVTVdXYft5gvGq1VzBFRlHP+eQwlnDHP5xB10WfyGXLBzgYn15eiuLVDoO
	Zcl3n9i3ycBXW9IsfXBL0PNKzX3FK6dZqyJoRsbMifTTq1fGvYr4UEFp7pjvwjOpEFTskHbr1lt
	wIpHX3CVn4+f4IF85PMUc5tjo1yBtr6qevUEx0CIfXxDoJfXsXtf5uq5wI73iANJqC3zLij4Zut
	1RnMma7hFb9WZbDRwn3bCZzJIgMV+hFf47PcuQPvXlT2jWIPneeFmHBm9EFtru7AMiTtE/RyIdc
	inZ9vfs681gjcwsZb6zfijbohF5KzVil3dSNrfKlxBi6khAU1VgoNB02kSXldsv3d+2Un06mSJ8
	vZbjdIRVJaFTcrhrDe0uTmZIWnC/sdUDPUBVEnF20KgR/sgakpS8v4YiVDOSeBNaKt2l3TUiDzw
	noz/jcgxO8JxEG6U5z7AUYQv0SSVftxeeigPIxPi0J3ltXFV96IGQUNcsIOTuT2XDrx3Wh0SnQ=
	=
X-Received: by 2002:a05:7300:cf87:b0:343:cde7:15e7 with SMTP id 5a478bee46e88-343cde71e6fmr2118832eec.0.1790486274760;
        Sat, 26 Sep 2026 22:17:54 -0700 (PDT)
Received: from FT6N242TWK ([223.181.116.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144f4eb9esm18602721eec.19.2026.09.26.22.17.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 26 Sep 2026 22:17:54 -0700 (PDT)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	Simon Horman <horms@kernel.org>,
	Tal Gilboa <talgi@nvidia.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 1/2] lib/dim: fix 32-bit overflow in dim_calc_stats() rates
Date: Sun, 27 Sep 2026 10:47:42 +0530
Message-ID: <20260927051743.71460-2-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260927051743.71460-1-jain.sm@gmail.com>
References: <20260927051743.71460-1-jain.sm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dim_calc_stats() computes the per-millisecond rates as

	DIV_ROUND_UP(nbytes * USEC_PER_MSEC, delta_us)

where nbytes is a u32 and USEC_PER_MSEC is 1000L. On 64-bit the product
is done in 64-bit long arithmetic, but on 32-bit architectures long is
32 bits wide and the product wraps as soon as a measurement window
carries more than 4294967 bytes (about 4.3 MB). The same applies to the
packet and completion counts, although those need more than 4.29
million packets or completions per window.

A DIM window spans DIM_NEVENTS (64) events. Drivers count events per
interrupt or per NAPI poll, so under sustained load a window can easily
carry more than 4.3 MB: 64 full NAPI polls of 64 MTU-sized frames are
already 6.2 MB, and drivers such as mtk_eth_soc count one event per
interrupt while NAPI keeps polling with the interrupt masked. On 32-bit
users of the library (for example mtk_eth_soc on MT7621, bcmgenet and
bcmsysport on 32-bit ARM, or virtio_net in a 32-bit guest) bpms then
becomes the product modulo 2^32 divided by the window length, and
net_dim_stats_compare() makes its BETTER/WORSE decisions on a value
that has little to do with the real throughput.

For example, a 1 Gbit/s link at line rate that moves 5 MB in a 40 ms
window gives bpms = 125000 on 64-bit but 17626 on 32-bit, and 5 million
packets in 2 s gives ppms = 353 instead of 2500.

Widen the products to 64 bits and divide with DIV_ROUND_UP_ULL(). The
results are unchanged on 64-bit.

Fixes: cb3c7fd4f839 ("net/mlx5e: Support adaptive RX coalescing")
Fixes: 4c4dbb4a7363 ("net/mlx5e: Move dynamic interrupt coalescing code to include/linux")
Assisted-by: LLM
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
Found by reading lib/dim with an LLM assistant (Claude Code, Claude
Opus 5.5), which also drafted the fix, the KUnit test and the
changelogs.

Tested: the new KUnit suite (patch 2), on mainline and on net, on UML
i386 (fails 4 of 7 dim_calc_stats cases without this patch, passes
with it) and UML x86_64 (passes with and without it); W=1 builds of
lib/dim/ for UML x86_64 and i386, and a native i386 vmlinux+modules
build, with no 64-bit division helper references.
Not tested: 32-bit ARM or MIPS builds (no cross compiler available),
and no run on a 32-bit NIC; the traffic levels at which drivers hit
the overflow are derived from how they count DIM events, not measured.

 lib/dim/dim.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/lib/dim/dim.c b/lib/dim/dim.c
index 97c3d084ebf0..7f3eebae73cb 100644
--- a/lib/dim/dim.c
+++ b/lib/dim/dim.c
@@ -69,11 +69,15 @@ bool dim_calc_stats(const struct dim_sample *start,
 	if (!delta_us)
 		return false;
 
-	curr_stats->ppms = DIV_ROUND_UP(npkts * USEC_PER_MSEC, delta_us);
-	curr_stats->bpms = DIV_ROUND_UP(nbytes * USEC_PER_MSEC, delta_us);
+	/* u32 * USEC_PER_MSEC overflows a 32-bit long */
+	curr_stats->ppms = DIV_ROUND_UP_ULL((u64)npkts * USEC_PER_MSEC,
+					    delta_us);
+	curr_stats->bpms = DIV_ROUND_UP_ULL((u64)nbytes * USEC_PER_MSEC,
+					    delta_us);
 	curr_stats->epms = DIV_ROUND_UP(DIM_NEVENTS * USEC_PER_MSEC,
 					delta_us);
-	curr_stats->cpms = DIV_ROUND_UP(ncomps * USEC_PER_MSEC, delta_us);
+	curr_stats->cpms = DIV_ROUND_UP_ULL((u64)ncomps * USEC_PER_MSEC,
+					    delta_us);
 	if (curr_stats->epms != 0)
 		curr_stats->cpe_ratio = DIV_ROUND_DOWN_ULL(
 			curr_stats->cpms * 100, curr_stats->epms);
-- 
2.43.0

