Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283243;
	b=v6lSfU5evLrKqF0cqBRvqlq6JdtQ2R/NJy4CubaZkFKxCML5PeWjhMfX3kW8gsxlr7wD
	 Wt+18cx1YnIktZkCUOmjlREr54nZ4mGYwYtm+D+9gyTxJyRYQJWPUArzgIP7GrKXFgTGU
	 jwY3J7zy5ikQWo+khwIZkH6A9l21j+JueqVjqn/882Y6SFZdOOmw6CT9yHO4Oi6zGAXSp
	 SWzMtr3iHKoa/FaJqGP/9Yfb/5c3epnCttm3i0GqQ1MuLbTGSQ9tRE93eruCwC2W2qWcF
	 US6dx4d8GFZbDWDBqSFusKTR3/PvEwsrCiAafjEoM1lCAgPJ+bI72lTHpXzPCZ+yRqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=JbSTxllG6qq/Srrtm566fJNVCNWR5pySfmfZ5YTXfSE=;
	b=Fw1UP9/Mb/hLxB39LLonQk12k9vZ0vmrgWLT5KZCPEwYhzhw/sDFpXxAP46+cFGFzphO
	 0BljBuga1eyzBzLBk6SL+9nPIWTwKvibDZlnwj9uQWV0F/kF2BMz7SEl4cop0AkMX5Qwj
	 Wl0QKbKWUaaffPVhC8PhOwwehMtGCW0TUQZei5o4hi3lxYV/sSn8V/et90QK15SKqeDkk
	 wplFjrKttIWkmgAqxmvGzwPSc9WE/oxSFqAchRfuyLdzmjMEJvEGiHd3ddsAFKybsE1EP
	 m7KmvjERDlZd8tnShvzDTSdY26qOeH9Yvulmh+cHVJBFY2cWm5wfik0j4Idh+ioBlXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FQdf4MGW;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94B9606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:14:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C94B9606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FQdf4MGW
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36a2551d7b5so1024234eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793283242; x=1793888042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JbSTxllG6qq/Srrtm566fJNVCNWR5pySfmfZ5YTXfSE=;
        b=FQdf4MGWZ9bAl9mcM9T9HJiMRdlOV0GvYu8FXKDD65tJpfGUpDVnousJRkiQQzY06X
         VE6wOqz/GJXQuh03lvxzdh163X49k/phL2ZMOYMTCPTR6wkxSLWFwlX9Vy2bQaLhHzdw
         P88hhYy0w47jqRxUGK20jhU8a51XHApsyj9/gJihOB9Ew6/1wKu1cWF9LIs9HmOBeQPv
         KakOTir5ZO5eocT3g6LNVocWCTLTlcUB4JFwAX7zv+t64KrJqlO55to7mgu9Fvzkzozi
         eU+cSlahUosFGKEGZ6RZpDm8ndL5jX8gE+Y+ZN2k53gn3rsSAPrcGoZd0Ov66kTul5rm
         Gg9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283242; x=1793888042;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JbSTxllG6qq/Srrtm566fJNVCNWR5pySfmfZ5YTXfSE=;
        b=UZjEvb3cmE2XZf5N/sAomSxYEzVHz5aTpUpXX1sXhLKsBXm9GTbf0/YtntrSOk7dP6
         XVUw6PF16fmVQlYtgzFI+HlPelJA8rJH5zE6eNrgPI3U2QpFiIektpj4TAGgnUPrC5/M
         mMJyb2pXKAHyx/L170AA50ATzfdWADoFj9ZLpf/YlOVtbTLnP2zBbyGAbkxVK9up3De6
         KNF3PgGxP84jqteLil+erCY3yN1dJwgsBVckr6p/+6wzVBy6CqLwed+d3l/1d26LoKIy
         ccI0451cMPyoVE+qw1mcwhrSKdrcSsatRRX/C4nQG9SShfx7MFyon3fqa0yypsJLP8Tu
         X/aw==
X-Forwarded-Encrypted: i=1; AKwUvBwRxTVNTm1SRQU1YvRctTFgm7xpkEmFyRfcEwIiKYgyFXAPWIEoPcCdtLmNMeO225VGGIUgyuYjTIsNnH8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQ8xrMoKbQ8tqtTAmSnhN/mPdn3EVjHwV+6LqtQfJb480Rs5q4
	pZaL4UbAXPliutMp0TkAA7QC8qGaHBLxMw802xsKX7ezxmXSfffQ9a6whGzwYzl+
X-Gm-Gg: AYBFou3k8C/TEwvlcJ7DiAzSje0LOBsz0KXL8AB8YUpJM5T6UWAOUACp3A9OPFffOCI
	Bk1gvpPftqAt+YgXxWy3XPci31GjCbCF8umi0hvyDJ6TDhBteF/ycx9paX5IngHk3wTEN9PW+fw
	PAe9/t0rT5buFdXOc6pCaMT72Pw705n8IfGHTQX7QNvvrkyJDgLEAu2zQkK+waCteFTQrLmEG5I
	Eg1z2UpfXk/gNVAow7OZ1HAG0Jp0rFDg9309RX925REpZ5XvTjvJfhfWt1ho6BCJohNYMDuT7hB
	IErIBww0QCgpiOB1AcdvlMVS+Bp6k7FFH2uemMwsC5WmZ3G8XFKFO4nxLT+mzf5Zkj5jl4KKAT3
	3WVGM559QzihqIr3zwzYG/83uG8zkDKfgcUnbXIRoJ6VcvrVJS1jLIPE7+dDiDG/IaKnKQPReti
	bGz39ph12DAMVY69K+sKfstT6aKrtO5qpGLIJl/YN6BJQk+MGhkRQFYGMMv9Vft/iHnq8hdZdjT
	QhhOVx5OGRJ0mPrKZZ8k4d/bNerJU79gnFmFMYZuk+mVt84440RBS803NWKG1o+MWsL+TkiW2uZ
	FFTGBxT5Q3OEyU3WyQzcw70TDG+dO4z59fPRdsL1+BchiDhXXbh1ZA==
X-Received: by 2002:a05:7022:5e09:b0:152:dd1b:4fa7 with SMTP id a92af1059eb24-1a944ee37e9mr3337955c88.19.1793283241701;
        Thu, 29 Oct 2026 07:14:01 -0700 (PDT)
Received: from [127.0.1.1] (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75d76814bsm15197319c88.10.2026.10.29.07.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:14:00 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To:
 Nikolay Aleksandrov <razor@blackwall.org>, Ido Schimmel <idosch@nvidia.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 bridge@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net] net: bridge: mcast: release the EHT host budget for
 zero-address hosts
Date: Thu, 29 Oct 2026 07:12:20 -0700
Message-ID: <179328314076.648427.17991367257682028617@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

__eht_del_set_entry() decrements eht_host->num_entries only when the set
entry's host address is non-zero.  A report sent from the unspecified
source address 0.0.0.0 (or in6addr_any for MLDv2) creates an EHT host
with h_addr == 0, while the set entries created for its sources have
non-zero source addresses and are counted against PG_SRC_ENT_LIMIT.
Deleting those sources never releases the host's budget; after 32 counted
sources the host stays at num_entries == 32 and every later counted set
entry is refused.  The same sequence with a non-zero report source
releases the budget normally:

  host 0.0.0.0:  IS_EXC/ALLOW1/BLOCK/ALLOW2 = 32/0/32/32
  host 10.9.9.9: IS_EXC/ALLOW1/BLOCK/ALLOW2 = 32/0/32/0

Only set entries created for a non-zero source address are counted:
br_multicast_create_eht_set_entry() rejects a zero source when
allow_zero_src is false, and __eht_lookup_create_set_entry() increments
num_entries only for those entries.  The auto-created wildcard entry for
a zero host uses allow_zero_src == true and is not counted.  Release the
budget based on eht_set->src_addr instead of h_addr, so counted entries
decrement for zero-address hosts as well.  The uncounted wildcard entry
no longer decrements the counter, which also removes the converse
mismatch for non-zero hosts.

Fixes: baa74d39ca39 ("net: bridge: multicast: add EHT source set handling functions")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
 net/bridge/br_multicast_eht.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/net/bridge/br_multicast_eht.c b/net/bridge/br_multicast_eht.c
index 18eaf9c..548ad78 100644
--- a/net/bridge/br_multicast_eht.c
+++ b/net/bridge/br_multicast_eht.c
@@ -167,7 +167,14 @@ static void __eht_del_set_entry(struct net_bridge_group_eht_set_entry *set_h)
 	RB_CLEAR_NODE(&set_h->rb_node);
 	hlist_del_init(&set_h->host_list);
 	memset(&zero_addr, 0, sizeof(zero_addr));
-	if (memcmp(&set_h->h_addr, &zero_addr, sizeof(zero_addr)))
+	/* Only set entries created for a non-zero source address are counted
+	 * towards the host's budget, the auto-created zero source entry is
+	 * not (see __eht_lookup_create_set_entry()).  Check the set's source
+	 * address and not the host address: the host address can be zero as
+	 * well (IGMPv3/MLDv2 allow an unspecified report source address), but
+	 * its real source entries are still counted.
+	 */
+	if (memcmp(&set_h->eht_set->src_addr, &zero_addr, sizeof(zero_addr)))
 		eht_host->num_entries--;
 	hlist_add_head(&set_h->mcast_gc.gc_node, &set_h->br->mcast_gc_list);
 	queue_work(system_long_wq, &set_h->br->mcast_gc_work);
-- 
2.34.1

