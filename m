Received: from mail-pz2-f5.google.com (mail-pz2-f5.google.com [74.125.228.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585183033E3
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789147442; cv=none; b=m4SmuZ23qCp9oBb4KiQYA4ypLNlBuh94faOk9JqVYU9tzqiQ7fKxBVEulgn7fSsk42+pEvtqzKzfn9revp5nD7mwJsM7Rx+GxVVBEgdUPDqUx6Ol92cJfRDkMs0CEssaZRKI6vm0XRBc88LeW9EhzmDrQrXzd9cYXHzIOCqUClM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789147442; c=relaxed/simple;
	bh=XyKDm2fMCyWXmyXY/voD15W0GKG2uRdBPo48fAgx4Gs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DnSEqm1yEAQsdoyUlDjA4LFIICdUZ26gSEejWVXDYCP25kwaaxvpYnjxqlS0yEA3SeKK0ElggHA8xWU2WbyTM6Hq99kgVdgCO5EbfP6yIAnCebHGdJwZrdhV/NDjcVbKucqQFtvczH+XijlG6W6pdC5rHhWgRNZSoFvxnBEQGvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ClBXl+DW; arc=none smtp.client-ip=74.125.228.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ClBXl+DW"
Received: by mail-pz2-f5.google.com with SMTP id 41be03b00d2f7-cc4ae01fe88so603497a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789147440; x=1789752240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D+ZMwis/4I6GSyUx89KUpR5JKn9wJVf4C4Nu7aArJ4w=;
        b=ClBXl+DWV70wYDmV2clQ0sfwe4h/Tnz+kq+zApPjC74EcCgxWZCZHafqw4kdrR6xCK
         sD2h+E2C5ZATG5pHa8DxhO9xTezoYuqGjT9keEJl/vq/WPvw8l6kv/fgfEccj61q3Kq1
         /D7CUQcSvaplh0x2yVdl87FxYMXc9yLvtPK4bflZs2hlfk9LNFYf4Mvc6dS4m7hP8Uzt
         1NLbzHizxsGDoKQdzxm4XVkVqrZdyvNwt9RKItDLuZUhNQnl9U9hqfP9EP2LCW0t73kj
         s1uN99kUE6AYx/G/oLGQehPX5xuLwknT1X1YvgMQinyd2puNQxDvvGKOuvpfMeqAShIx
         yyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789147440; x=1789752240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D+ZMwis/4I6GSyUx89KUpR5JKn9wJVf4C4Nu7aArJ4w=;
        b=TRw3ffVfbN+f0p1WnvEzmVT/3+xTEXLFiXIvMbxR2Id3voavTSAaVXrB8qSxJo5+Rt
         80e8PpfZepA4Bw3E/aXT6tHiXPvoiP5d6JPRrcKyKuW2IbcXtLBSG3/bh+vfRsqXnUPT
         iFBxHFCEljdOi/or4m5n9HC6B7qH4EHvOv2QuyfI1mXRPgV4eYwgfml5PtlXoEvZ4KTm
         cxnTjii2TGiW6rTIYFbjU0P8P1JEht6ao4wRY6V7krFqYkbZfwV1VmEbwhd0FF5CCZ+f
         WFkMMCUSFjm4tlXyHaZii65zmNMubkggfM5JUBmGtHchaiG9sGxtgSIFt+Rd4dlL5Sgk
         BQYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBr+fm2DMbHE65WkrwGnpNKFozreReDsOY+moqjC9BEJJ+Htxf2hHG9pxGFerezTHORCdM/e25a/MN6o0=@vger.kernel.org
X-Gm-Message-State: AFuF++l849PXIklNqTrkJDnFS3A7VO5UDsHn/QDpNzVj66YYwBv9ankj
	1a32D7N4u65xsp2ri/WG85NFdqByko664W3NVHxibsZlXOYyznNX/SmI
X-Gm-Gg: AYBFou3qVrKny4Ut870JJSrY6YokuK/fFD+qzAjC3BsQfSa7DEhmMiyGp3r8cQqk4D2
	N9RLrr9jq3Sx+udnNAqMnPE7mO3p8umM0kJymDzdl4G4SM6TNfVQ26u1zXX7zzJYYdd8FYBxD+l
	X52W/4l/6LNUnrmPIY/VWMJd0a1SCjFaWkWgBdzilCQyyX5zKG7gZKsTK0JPOXyv7Cmi84naAF2
	VW1BYzWx3xsuacKQ0tk48s7bemg6W+vMNuodHPb7fCHORJLDK/P44B01Ylr5aj3k50x8bV6FBxU
	sEtas0RnJQr+Z3CrgqwN3BtSoQUGbOI3Rn5BruVnMBcQXSUg3bVmIdcTExTPCiHErNnltVjw0SZ
	4JAFMt33ualL4iwiZArpoOslpoTWM0waccVAH5DKLFGZQOnNVG6WTLVFhyj/XB6+vXnmJ7WNBN2
	0HMUTOysVxDUYd8XX/T1MkpDckSe+HtkdW8UEAyNaOQmhI9c/zkkLa2TJfAhgBQF2Ep95kWCZJR
	fQ6VZkpXLeof/0=
X-Received: by 2002:a05:6a00:4611:b0:851:ba04:ca02 with SMTP id d2e1a72fcca58-86b332e9bd6mr7129887b3a.16.1789147440319;
        Fri, 11 Sep 2026 10:24:00 -0700 (PDT)
Received: from J4f-Laptop.localdomain ([183.36.237.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b2a2b5c72sm1418774b3a.52.2026.09.11.10.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 10:23:59 -0700 (PDT)
From: Shihuang Liu <shlomojune6@gmail.com>
To: netdev@vger.kernel.org
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	akpm@linux-foundation.org,
	leon.hwang@linux.dev,
	yatsenko@meta.com,
	kpsingh@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	jordan@jrife.io,
	nhudson@akamai.com,
	avinash.duduskar@gmail.com,
	rongtao@cestc.cn,
	joe@wand.net.nz,
	Shihuang Liu <shlomojune6@gmail.com>
Subject: [PATCH bpf v2 2/2] bpf: revalidate assigned sockets after protocol change
Date: Sat, 12 Sep 2026 01:23:13 +0800
Message-ID: <20260911172313.64009-2-shlomojune6@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911172313.64009-1-shlomojune6@gmail.com>
References: <20260911172313.64009-1-shlomojune6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An IPv4 packet can be assigned to an AF_INET socket and then translated
to IPv6 by bpf_skb_change_proto(). Since the translation preserves the
socket assignment, the IPv6 packet can still be delivered to the IPv4
socket, bypassing the family check in bpf_sk_assign().

After a successful protocol change, recheck any prefetched socket
against the new protocol and call skb_orphan() if its address family
is incompatible. This releases the assignment through the existing
skb destructor, allowing normal socket lookup or a new assignment
by the BPF program.

Fixes: cf7fbe660f2d ("bpf: Add socket assign support")
Assisted-by: LLM
Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>
---
Changes since v1:
- Revalidate prefetched sockets after bpf_skb_change_proto() changes the
  packet protocol, closing a bypass of assignment-time validation.
- Preserve compatible dual-stack assignments and release incompatible
  assignments through their existing skb destructor.
- Split the fix into two patches and target the BPF fixes tree.

v1:
https://lore.kernel.org/netdev/20260823101809.26802-1-shlomojune6@gmail.com/

 include/uapi/linux/bpf.h       | 4 ++++
 net/core/filter.c              | 5 +++++
 tools/include/uapi/linux/bpf.h | 4 ++++
 3 files changed, 13 insertions(+)

diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index 5d8f5e2c8db38..0de7967077a2e 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@ -2659,6 +2659,10 @@ union bpf_attr {
  * 		checked and segments are recalculated by the GSO/GRO engine.
  * 		The size for GSO target is adapted as well.
  *
+ *		On success, an assigned socket is released if its address
+ *		family is incompatible with the new protocol. Assign a
+ *		compatible socket after translation if required.
+ *
  * 		All values for *flags* are reserved for future usage, and must
  * 		be left at zero.
  *
diff --git a/net/core/filter.c b/net/core/filter.c
index e9cc76b775c0c..79a0e484d9dd4 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -3547,6 +3547,11 @@ BPF_CALL_3(bpf_skb_change_proto, struct sk_buff *, skb, __be16, proto,
 	if (ret)
 		return ret;
 
+	/* Protocol translation can invalidate an earlier socket assignment. */
+	if (skb_sk_is_prefetched(skb) &&
+	    !bpf_sk_assign_family_ok(skb, skb->sk))
+		skb_orphan(skb);
+
 	if (skb_valid_dst(skb))
 		skb_dst_drop(skb);
 
diff --git a/tools/include/uapi/linux/bpf.h b/tools/include/uapi/linux/bpf.h
index 5d8f5e2c8db38..0de7967077a2e 100644
--- a/tools/include/uapi/linux/bpf.h
+++ b/tools/include/uapi/linux/bpf.h
@@ -2659,6 +2659,10 @@ union bpf_attr {
  * 		checked and segments are recalculated by the GSO/GRO engine.
  * 		The size for GSO target is adapted as well.
  *
+ *		On success, an assigned socket is released if its address
+ *		family is incompatible with the new protocol. Assign a
+ *		compatible socket after translation if required.
+ *
  * 		All values for *flags* are reserved for future usage, and must
  * 		be left at zero.
  *
-- 
2.43.0
