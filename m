Received: from mail-oo2-f10.google.com (mail-oo2-f10.google.com [74.125.231.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC1A42FCA1
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791617178; cv=none; b=kdTJnQ0f3eyzRG7fdXaOk6uE2xvWhuKVtJpaNOz1XA6m5R4/QR2G77Ts25bdbDUgjz10A8R5dWCQwkin3O6nJLwLepmqFcF/xdIs/nGnqLKrfgYOWYFJ9+DtTLtsirtrLo3sWPH5y9EJQ4dNZGEgm6da8KKZkitgXHrxnsiPg8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791617178; c=relaxed/simple;
	bh=1BJI6RqgRXXaPfIjDpZ/Tk3L6uiOOCPDZoEMfApIfLs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CHSwMIkgo5xHIYw7v1OCSqLVvudG4YL9AXZaaoZXTWmBbvmBbpsFJc5OMLlMIg4uhZDHlCcYDAEOAfgCENPfKHxehbWXx77riGwfrwRrvYaFZ1uNE0FfkzeEVAt1uvTfSQIhe8CvLIv5/oEl4XB6pp5bL1JpJGwqRlttzR1anCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J9Ow7pzE; arc=none smtp.client-ip=74.125.231.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J9Ow7pzE"
Received: by mail-oo2-f10.google.com with SMTP id 46e09a7af769-820ff812cd8so146906a34.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 00:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791617173; x=1792221973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mDFHjBnY303o958EHwnt5dwofd1cu368Wqal9QhhyB0=;
        b=J9Ow7pzEXhYJBo/CutWlMdER/L828ZZqqrordMXz997m1fwSeH7DCPOYfWIOb9FTM+
         hptYhtSLYpuoJ/08Wzu85Y5WOwkvrLld49sLtd/dgy1BLvZdgMMWfTSoeFPQW/FRinAI
         59OvE4Xk1GpOKDur54w5pQ79SpH92rihBADOsjVzyYm/SU6JEgLTr1tS4Z1gRyBMvYKZ
         nT3WQyrYCyDiUO4bBbNZCwEsCyydlz5V+1M7Kd0E6Cvn6D77fwpG+stimEcPg4JPB55h
         N36AwLKO2wtz9NIhhbEnL8qbEoYkF8TJEGHr1H079oaihLHCYpnqt/HhMoBawRKZfx0A
         bMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791617173; x=1792221973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mDFHjBnY303o958EHwnt5dwofd1cu368Wqal9QhhyB0=;
        b=R+TCH6jjQtcjJmqRCHTBAELofDncbTJowbd/K2fDfmnk+UVQI1Zg8TPvXiV0R1pgo8
         27zJiX5l7UXA/Nu/5XUYRCdD3vnAXN7tSs5oWNV8d1HZiaYyeOE4qwbXj7NTWGX5Y5cs
         gqCXHApKHLRdQ2OWyJRIDmL7yhEpKUDi5wCkUb6QjNArDhb0Bf/0hqloWz5UgcIfHEOI
         Xz71yqbxIziP6jyDK54LjEFll2/0rWhFhYlUO+jJz+j/Ff0prItjdI1BniISnc17J3Mz
         BAmmEoi/HxV0D1EfnD5haqqGBE3spOyORA1dElO9VjTcajpvQ+4NeckyqlqrvAqhVJ2j
         6ozQ==
X-Forwarded-Encrypted: i=1; AKwUvBzt1PP5v+W2Ro+QYMDnQlkFPPjBsDnPBhHymCnnsxiosnZsKs+Erc8aYjmDGRo+MSdNKaUVkjnIXfWZwSc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqpgfyHu1ZvTQulXXGnc/SdCTnwnON7R4CNqNeKDfnE8BTmdYe
	Prrk5zO4DfkK+DNrOzHbGITx9OI+vFL6rVBTvyX3BuaIlCwmd7E2SuR3
X-Gm-Gg: AYBFou01X/4M0VgyEBav0f/jIMYzxj0gYiwn7FrjN6vslV7yf7Q7CCzjuDCL8eMjxXf
	9KAytZQcdw6BSa4xSPhewcrgkGgwh91mOUB7RUKgi5xFl8LUnyaxdS3lUobrTQyHLiCEmzabtkn
	Z48NnCiKM2/59sxq9asowzZ+eUwuKJGtLr+lLnBmA8zpfyqF0QKulTOty8BX+m3nZ+baLARZTSB
	JC6UZ9vzD71zOkUkkQYS9FDsh8lQvmjO2MxfUWc5u2zmgArtEukh7n3A918PgZNNVD9QdkcaILt
	LTiDTHStO61yvttQagI12EqIPya9xPBefrOvUSK98NDBQEcMcSgFDvbsSS/9nWA/Nj3Z81EE3dT
	EpV2zL0T/8cOqFmX2gdWTP0Il0I/Eq8tlYJz5+OivY7vUKb/NraKgc6QZVOC/koF+cwN/u6Bd4F
	cgCQIRwa0SRd2Ynb5gXRLoXft8447HUVPwo3YmqlxnQMyi7sAOLE1xcf2CiKrR0xN75WI622+Ux
	ZPTCwGzV07Eb0ZGQ+4/zU2KLWQW8T9V2efc
X-Received: by 2002:a05:6830:490d:b0:823:25c3:30a0 with SMTP id 46e09a7af769-83097e67433mr3451675a34.18.1791617172787;
        Sat, 10 Oct 2026 00:26:12 -0700 (PDT)
Received: from localhost.localdomain ([14.22.11.166])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8303916e485sm4561707a34.15.2026.10.10.00.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 00:26:10 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@kernel.org>,
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
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] netlink: fix out-of-bounds bitmap access clearing stale mc groups
Date: Sat, 10 Oct 2026 15:25:48 +0800
Message-ID: <20261010072548.2869465-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

netlink_realloc_groups() sizes nlk->groups to the number of groups
that exist at bind/ADD_MEMBERSHIP time.  When more multicast groups
are registered later (e.g. a new genl family), existing sockets keep
their smaller bitmap.

__netlink_clear_multicast_users() however iterates every group of
the departing family and calls netlink_update_socket_mc() for each
socket on mc_list, which does test_bit()/__assign_bit() on group - 1
with no regard to nlk->ngroups.  A stale socket therefore gets bits
read and cleared past its bitmap allocation, corrupting whichever
heap object follows it; the corruption repeats on every family
unregister.

Skip groups that lie beyond the socket's bitmap: such a socket could
never have joined them.

This issue was discovered by Tencent CodeBuddy Security.

Cc: stable@vger.kernel.org
Fixes: b4ff4f0419ae ("[NETLINK]: allocate group bitmaps dynamically")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
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

