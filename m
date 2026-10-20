Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792466492;
	b=H7enpRiTpE0cl/S1ulKGLpfV33hYVD0wXeosdpe4LIeZeoyUnf+CwcAeCPdsLXlrzhDH
	 Vf5vj/Zo6o3PV5kc/aXUoqr28KvQDOEOwPAbQC9BHqqJUUx3sPBg7+ftBh9wS3EFiWfWI
	 W9B01L7Hk1FKVU7nHO2h458DnMn1s8W6XV1JUZN/6c9HTwGaqKaA7vwZTuwD5BYLxtWjU
	 N5YcBx3ucMnXxyukjBJwbYV9LQFM1uLBkPXhwe4qr5Cbx2kOXcc0Z8Hy+8qOVVOElq86C
	 170aZu9f8pdmtUq3L5USrceNxbnYNml5vZwpVo4FVKtEgxg9oQPx8XLwU0RPg+6rN/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792466492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lLdoywuBRsUnhzRmRUhPliwolaqyJQAaZER5imRmeic=;
	b=FReuaFKZ0454Uo/1vB/gHA6fD3NeNafNUeIlB1Yg/3OpfqYal8pLkTkEVqjA1rdaDUe4
	 bQJ4tOZs/Z6u9SS4UzFsfRu19sOs2Bz6NHJ4XaoKo9cGT8dlDPBT/mfqQOu2SM8K4EYAd
	 IjfecdtGPiAKinEWbSKUTZh+flzHPz7GXaeMtOayqmMllRHSfZ/BkauqzDKf+3lM05uZS
	 6/GMJxmburdS9d5B9GpVByvVoA3GVK7OGKx9G6iH00q55xVNeZtUYFzpJs4S7Jtx6tHpa
	 /xnf3UlSK8cXVOHUnGnZZ7di5q0fOUy0NISVTsv2R8nnBwV1qWkp6PWJb6GZXNzbGOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DbaAIKP6;
	arc=none smtp.remote-ip=74.125.231.132
Received: from mail-oo2-f4.google.com (mail-oo2-f4.google.com [74.125.231.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E423606A327
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E423606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DbaAIKP6
Received: by mail-oo2-f4.google.com with SMTP id 006d021491bc7-702f1150a16so292981eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792466490; x=1793071290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lLdoywuBRsUnhzRmRUhPliwolaqyJQAaZER5imRmeic=;
        b=DbaAIKP6yVtLasOewGk+VzRGyBf4i3jOCBNiVUNDdZ3HXL7CfNwu76Wkqt3aJ86AeQ
         I9OL/c1z11QNRx5qmcy0fi3UTcnw1dRDNR9nhOWQdKu5bWT7cVrF1FyppUJ8xZKMlDn0
         yNnpgXAq1pW9Kn8p/iBqf5MbdA+aNZmWMSlHva4OIGoxyGr+enEfid1dw/zjJn07IXrE
         ATjNzTrRj0tOD3ajVrTjHU14ssNIZ9NB4T2ZWibtGhCcnN2Hhglm55IuqLiqzapce0Ff
         zNt9TNfVs7VfEG4rTcbWGFK+PYB+Nd+lyd6PaomF/Rsc4DuyUrvMTZuLPaT1ze/wbLAu
         CFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792466490; x=1793071290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lLdoywuBRsUnhzRmRUhPliwolaqyJQAaZER5imRmeic=;
        b=W/7fwe9BuYW04MCCZAGq1vgtbaG/3xoBkwKx4M3DLiMAR/yEFw8Lb6r1MCXnLRYQxX
         H5RZZxBfpfJISWO8CCfUAQzSoMrXRNv4GSJGxDVvhAfTHpLy2EiqiRC38cWoGcGTevpz
         CoNg5HFXSMxEhshlERuAGVhFK+9gH2MBoswNiIn05Nk5QJc/ocOCWMfFSfzQ/UJzddOf
         WX8NwMIrdN6aweE62Us7mfR87hNm2h+F4hQKbm/gajNRAoDBHMN6m7R1Mm5ZrT8U7X8F
         cs2BX/KYL4q9bVROvC+6niisbm6dln7r0p7nZ3hX6NzmPCWKSKgPKgke8aRh6xYpwhXy
         QShw==
X-Forwarded-Encrypted: i=1; AKwUvBycd5CAx5YBZ6Wq7DX16AvQYUAZWoupsGvhkiIzN/lHLi+xQZqMkcIVze0pgMAKEREPpdStIAgzSmbU+W4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRPovaO87jDBKSh4Mu+DbrJ7cWShsmi5GDvpfncpp5AoLGO0wo
	kJ+yPthX7JSCdhe3dN0f/I2CYx2qEiPEy6E02oOesfReS2aOJ7aBkGt/
X-Gm-Gg: AYBFou2qYSNCwoJ3U7VwOiEkGijYJ5y8DrykBJxI14qH4KEIUq11MMfEWjwP1CVBgE4
	Twj/6C2ZhOu3P5l0symUCyBPoUQ8GSO1z5URW/KYEM6pZz/8bftuyJYNQTUd/R1BQo3sUXVJVWq
	7dwwUXHBZwAry0235s8Kj/32AKpOckjjMsaHhdAa96H7dkKx+fN3PWUZYUXcHyeQZO0TD8oQJvS
	ugadw0wioUtSodm1YaURevnuss2zm++qZR7aYhNPB6g3yyHTIy6I8SMBD6KguyfvERiJXpu7kFL
	0DyY0PGn4qNeuyZRCEqAA6iS48iOBNrn64Qu4Uj2EhniX7oWPL4j7Kx4w4xc7xmK8VgdoduwPhZ
	VUnVRvXaogKZDjA+78NlnZMmsVaRNYWCRJWRxf6LuCyeykhKFLZrobXNMGWj8gYFfMaf/E5OL97
	6gKLGByPpXuvId/mgjEd3cYDiaZHMvHN0fTitfciI1suWMwCVHmqWMOkxPcM8szAJkbThIcZmDg
	SEzgqnHSURfmjqadr81G2A3U2N7LND9y0OsbA==
X-Received: by 2002:a05:6820:4cc5:b0:6f6:61c5:d929 with SMTP id 006d021491bc7-7035618b5ccmr6920440eaf.38.1792466490415;
        Mon, 19 Oct 2026 20:21:30 -0700 (PDT)
Received: from localhost.localdomain ([14.22.11.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-701900722d9sm8338676eaf.10.2026.10.19.20.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 20:21:28 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Kees Cook <kees@kernel.org>,
	Ilya Maximets <i.maximets@ovn.org>,
	Breno Leitao <leitao@debian.org>,
	Jeff Layton <jlayton@kernel.org>,
	Kexin Sun <kexinsun@smail.nju.edu.cn>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH net v3] netlink: fix out-of-bounds bitmap access clearing stale mc groups
Date: Tue, 20 Oct 2026 11:21:19 +0800
Message-ID: <20261020032119.1334986-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
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

netlink_realloc_groups() sizes nlk->groups to the number of groups
that exist at bind/ADD_MEMBERSHIP time.  When more multicast groups
are registered later (e.g. a new genl family), existing sockets keep
their smaller bitmap.

When clearing a multicast group of a departing family,
__netlink_clear_multicast_users() runs netlink_update_socket_mc() on
each socket on mc_list, which does test_bit()/__assign_bit() on
group - 1 with no regard to nlk->ngroups.  Skip groups that lie
beyond the socket's bitmap: such a socket could never have joined
them.  This is the same guard do_one_broadcast() already applies.

The overflow windows differ per architecture, both needing privileged
module (un)loading.  On 32-bit kernels the ~54 dynamically allocated
genl groups already exceed the initial 32-bit bitmap, so the table
can grow there directly.  On 64-bit kernels the same in-tree set
fits the initial 64-bit bitmap only while allocation stays
contiguous: genl_allocate_reserve_groups() takes the first free
contiguous range and unregister does not compact, so an
unload/reload sequence can fragment the ~59 free IDs until no
fitting range remains, forcing the table past 64 bits and reaching
the same stale-bitmap overflow on the next family teardown.

This issue was discovered by Tencent CodeBuddy Security.

Fixes: 84659eb529b3 ("[NETLIKN]: Allow removing multicast groups.")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---

v3: Correct the reachability again (sashiko review): 64-bit is also
    reachable - group IDs are allocated in contiguous ranges without
    compaction, so fragmentation from an unload/reload sequence can
    force the table past the initial 64-bit bitmap too.

v2: Correct the Fixes tag (the clear path was added by 84659eb529b3,
    not by the dynamic bitmap commit), drop Cc: stable and describe
    the actual reachability (32-bit kernels with in-tree families)
    instead of implying generic heap corruption.

 net/netlink/af_netlink.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
index 9fdf964224ab4..8cc655aa927f1 100644
--- a/net/netlink/af_netlink.c
+++ b/net/netlink/af_netlink.c
@@ -1657,6 +1657,12 @@ static void netlink_update_socket_mc(struct netlink_sock *nlk,
 {
 	int old, new = !!is_new, subscriptions;
 
+	/* A socket whose bitmap predates this group can never be a member;
+	 * don't touch bits beyond its allocation.
+	 */
+	if (group - 1 >= nlk->ngroups)
+		return;
+
 	old = test_bit(group - 1, nlk->groups);
 	subscriptions = nlk->subscriptions - old + new;
 	__assign_bit(group - 1, nlk->groups, new);
-- 
2.43.7
