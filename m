Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792517459;
	b=jS7CGchZVPP4cyWd3E/4Qaqs+BoxO4fwZAcivvHcS05ivymQYB8L0yBkqvPXUo9lWmBX
	 Shd2T3Yns58iEBWfnkcOsZ6GC5w1k4r8C//RR7peT4g1yg1ObPk//4SEoRFGAsbK56hbv
	 6JBA5iJvMkvDNfUKHtQsVyX3Bzti6UHc9PMgMSb1hUT0xf87tAdViM0c2ksMWxfIjitkY
	 bvd4tCOYyutZ1S7NzencwqbJpLXA3XRUrOrK/RTxNpG9iSVgydOCN1jJY9CJC4rNJk35E
	 NGZR6Jo+M8b1SzE8J37oma4NfAS1FsO/r+NwwFiY/RnfUGvqRkuzk+91UJwh0kWSHMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792517459;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version;
	bh=a9BuPLHKc6kCzFZ4JleiDdHGiHn0vB31Xy2WnAwd6zM=;
	b=DMVRGBdqxjdLNfiIlyCw5U/IwnUX3u0DYWnqAcCKuUTECbtW7sIRyXhDSw0TejO7kmdc
	 6WoCXZ6d4lsmId4q6QOr4RHeEi8Ba3kUodjaFCuNFxN6KlHusrUoa8tU53ICRsf58IfLA
	 S/cjXGf+rAKDpXDlzSj61V9MjWQI48Lk8Y3vGUgjmSXY7tD58bllGIfQ3VM8IilvBUxxW
	 So3S1Owvfhs6E7xP1e9w/+3j9fZXySRMBry0IaxIdm+PwnRrCtEHJ34pz/q6BxsaE9its
	 d258Xo2aBH5zuuqWlrcIhEYw572KqQb6L0MwwxFFPn7Vh7SrReeogabRc3+cAqL1dxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=Vw2hm14t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6CC606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:30:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C6CC606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=Vw2hm14t
Received: from pps.filterd (m0528009.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KGtp2a094062
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:30:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	pps82601-s2048-2026-q3; bh=a9BuPLHKc6kCzFZ4JleiDdHGiHn0vB31Xy2Wn
	Awd6zM=; b=Vw2hm14tvzG/9NN24U2W3mhwY88Cvn41XDUQx1OaUdq2gaxJqDpyA
	eFhSvx+1MxW1HdHgF+brD7m1NpFNFIhaxWgK/8QqfnDf53GfcU8VGcKM0dZz2sxS
	pRQmA+XrQoxMB7H+Xk6aPQyfU4AxbfFJtufZhPDL5u0j3UVmtp6EYwtK4Kc6Zb1H
	cR6q1JJYTsykqWpnUGdvXEBKmNKGWdF+z0+dy2fyFItxL7+IEL8v4sUv6yeM6ejv
	GpebGIw2P5hWqb8ao3uRAXxFDQ27ktRs+BjJMxZ28yo1vQdWNmNX9/X8H4ET+y91
	njk2x2Ei+2QzV5+tn3KX9mfogKYt8oyYQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hdw50dav3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:30:57 -0700 (PDT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a065e2933fso3091134b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:30:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792517457; cv=none;
        d=google.com; s=arc-20260327;
        b=qEkZnACEsHTLeWO7mVlXpOmqSxyMIEHsX88ni/dHP7bVrkUvc6causuJqnMMw46MDR
         E8Tu0y964isiq0zKlcugb6k+4q5f2qZrG49dx9nUMeA/5eHooCRKP1+ULNYd9QPzLygu
         pV400rO4lYthVJoVUKf6v1GRyZ8uv9w5V5gTNt7CjoF8NWtKjdjbaqNCiwUlgPl5rcv+
         6NaxVfUmfjdspXNnlK8QGSRRzXWtNCyDBxYw5SwgP0hjqIak+mNKU09WjoZ+OHnz0ncN
         BtVAIShy/NRVftEedDzxGChQW7zk5usKxwQDD7QJmIeLZr0PxEu0uHQZIFEbgPFRJrol
         GYCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version;
        bh=a9BuPLHKc6kCzFZ4JleiDdHGiHn0vB31Xy2WnAwd6zM=;
        fh=TH7lHr8WnBCX4YAn3h7fMRYxB+9erT0+wHPL6273GxQ=;
        b=mX/nA8kDmd9EaLP7ScSmwtfDRtITrY//IidjVC6Tjq+dJ1AXIOL73izA/jVy4QIuCZ
         QFSmLO31s9kJFjojxSBfxvmNzACSljNb0oKBsv9KGkB9EGg84Otg2TQoOP68ELfxCxDH
         wHaBAWgCy8TK9W/4OU/MpnWTq58plTE6hp2W7FZWff7RJ14EpwT+JmI8yFohCmU+ZQDx
         5Z8KPDyBeKaX4K69UG3UeWA6M36ZlKvczyY7CIRIkh3XhTp5ebBm7s3B9Rb+3PyoZzKU
         hmCg03vVGU5mpzB+WcmNkud/IMLY+n5FIUj2El3OlNLkXGUwN1uvuKlvsZQ7ZIw9eh46
         Vf4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792517457; x=1793122257;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a9BuPLHKc6kCzFZ4JleiDdHGiHn0vB31Xy2WnAwd6zM=;
        b=Z+wNeZTmEiBJCqkinbXnhHyR8DcQdlqD1cmKdkCpsxQFNGbSole+A3jc1JNOGZbn8B
         pROa5yzDBY62fpa0pVCRBf/2oTax3pnTGQbcJQoeE5gA/aEadFeNyj+e1TBkKMdCnoMR
         TKMy44qHxXG6HXYbZX4yqIlzGC22tTZ7Z0xpzJ5ob3tEMArg043BXLouOb41LHkRztHd
         7mqoG7vWd6ZBb+P1qVUQb4vJGR4WzhC82rAK5YoVGKWBysi7fd7MhTYtXLc1AsMj9hY1
         IOgEI70h1HDBZfwCeysQOlqCVtFmCS1CIYaxZJ70lW+8+LQgDPu1DKDrQ5T67Zi1khMa
         vCbg==
X-Forwarded-Encrypted: i=1; AKwUvBx0Uf7Fq0xOokTyOG6DaxJ8l91ViXyNBjpd97GgR6TGyzq3bTsTKhI3KqhaXPQgLT24MuVlemAO8915+rY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9xyZZm+W5FPKRJQgNX179clhRIcDWF7EZpYd2R8QX4A5D3mu8
	ECpZ80AQHEqT+2Q6yX8/eZWtHWQnTEMZUxvcmJ/FEbKL0Z2B8A7ATVvtoFBos6flZS3BDGbVlG7
	Icse5AUzJkdx6lzX83vkcATzAzSLlGexUBrjdtUyvxEvCQi+YTxhrOII9u+YwBgTg4jkkKus+Dx
	6VmFC7wGArI2pPQN7hqvqMlIExQJFyKzfnHT+8jtiSn6RMfJRZl5L4
X-Gm-Gg: AYBFou2/1k9iAbk5tZ4LQdB/2CQCGwLrRtX8Pm49M6T9YQeRD99ccmIlQHxT4YG/KLK
	ReUkHKvRj1yaJMqGhXQMSAUTvF0A3P07MdePjUoJEnaQOwMEi9Pza2a4KvJdQBTvY2CMQ0PUm62
	NxJLHu6ZdFEJJoLDIGHQmO4zAJtjrTf/sjXARKHRgETFNlPthhEevweId0yijb7xqoOk7i3EVL
X-Received: by 2002:a05:6a00:919f:b0:8a0:5d6f:8a9d with SMTP id d2e1a72fcca58-8a05d8e44bemr6708467b3a.35.1792517456663;
        Tue, 20 Oct 2026 10:30:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:919f:b0:8a0:5d6f:8a9d with SMTP id
 d2e1a72fcca58-8a05d8e44bemr6708405b3a.35.1792517454846; Tue, 20 Oct 2026
 10:30:54 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Nik Tsytsarkin <nikt@meta.com>
Date: Tue, 20 Oct 2026 12:30:41 -0500
X-Gm-Features: AclHuK9WyYINhPFTJ0qkN5fmOJVLbIYzSD_8ziE-c0sB8ayjG2TnMNx8s0uCK68
Message-ID: <CAN8mxQpCCO3QNXb0pimRsNqfLs1qS0epZmB59q2sd8QCLhgOpA@mail.gmail.com>
Subject: [PATCH] apparmor: fix NULL peer label deref for connected SOCK_DGRAM sockets
To: John Johansen <john.johansen@canonical.com>,
        Georgia Garcia <georgia.garcia@canonical.com>,
        Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, apparmor@lists.ubuntu.com,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sam Dlinn <sledge@meta.com>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=WLnqzXsR c=1 sm=1 tr=0 ts=6ad7a551 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=U_y8lYiYyhHBU5rMqhb2:22
 a=FOH2dFAWAAAA:8 a=sM3mXklEuYsKxauXXZ4A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA2OSBTYWx0ZWRfX/SzVan9vHtDf
 qIyDO6xt8vtF/hU4135AZqRiBJK0oTTwpMXh/HcBUuDvM+kgYv5c4yJwhVJC0VZY7fRlxL2Jm0+
 Dlzq+MPcc5jejScEar6XZzmkTSH58wO3MvG9DpJ02sq40xylB/jerPqqMqRMghwlDyEbYg9yrih
 VhpELs7uxkRuhR5Vqd1ZpoGJ1QMkFXeBfOYNxg08xIFdhYH6zSxdlEa1OlNpguL9KkkXXod76lq
 UUH+voU4B8HOWMh+TwK/hlOVr+mYMeNg9TxQgLaXkSYyN3FX+xjwKxl3EYjRF5YaGQI4z7zPbuH
 5Wv3mnUuqIahTF0Np7LFVMbhyPFY2i511BVsUy+SEOBTiYHfN5khhFeZHBNzWq+YLIoD+HG5UYD
 vDDeXNcR6aCjFuU61UMabp+h31SqXjUyteyQsl+yFajEPLQLJUSmBRUpCtV2J26bvGNZoAZ42Yb
 lee9tndFAm2/e2Xl7SA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA2OSBTYWx0ZWRfXxG2Er9lEXRy+
 WzIlvhn3AaF4OBQ6rkdnhmScs5sOj6Y7DQU139DMbCsydNV2mGbR35ErJDJRIJaDlnYNt6nZ9vm
 wgdAsW2bXmk5YJOfGj6hATSem7J+K9Y=
X-Proofpoint-ORIG-GUID: tbv-6YJ-lHWs9cE4AU7X_vBeGBb9M5kV
X-Proofpoint-GUID: tbv-6YJ-lHWs9cE4AU7X_vBeGBb9M5kV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_03,2026-10-19_02,2025-10-01_01

apparmor_sk_alloc_security() initializes ctx->peer and
ctx->peer_lastupdate to NULL, and unix_connect_peers() is the only
place they are set.  It is called from the unix_stream_connect and
socket_socketpair hooks, but not for SOCK_DGRAM sockets paired with
connect(2): the dgram connect path only goes through the unix_may_send
hook, which does not touch the socket's apparmor context.  So after
connect(2) on an AF_UNIX SOCK_DGRAM socket, unix_peer(sk) is set while
ctx->peer stays NULL.

When a confined task later triggers file revalidation on such a
socket (its first write(2) on the fd suffices, with or without a
profile change in between), aa_unix_file_perm() runs the post-check
cache update with peer_sk != NULL and a NULL cached peer label, and
both update paths dereference the NULL label:

  - update_peer_ctx() calls aa_label_merge(old, label, ...) with
    old == NULL, which reads old->size;
  - update_sk_ctx() calls aa_label_is_subset(plabel, old) with
    old == NULL, which reads old->size via
    __aa_label_next_not_in_set().

The AA_BUG() NULL assertions in those helpers compile out without
CONFIG_SECURITY_APPARMOR_DEBUG_ASSERTS, so production builds oops
under spin_lock(&unix_sk(sk)->lock).  An unprivileged confined task
can trigger this whenever its profile mediates unix sockets (complain
mode included).  Because the oops happens under the unix sock
spinlock, the dying task then deadlocks against itself in
unix_release_sock() on exit, leaving an unkillable spinning task and
an RCU stall on that CPU (and a full crash with panic_on_oops=1).

  BUG: kernel NULL pointer dereference, address: 000000000000004c
  RIP: 0010:aa_label_merge+0x63/0x730
  Call Trace:
   aa_unix_file_perm+0x477/0x800
   aa_file_perm+0x434/0x550
   common_file_perm+0x58/0x150
   security_file_permission+0x22/0x50
   vfs_write+0x76/0x410
   ksys_write+0xb3/0xd0

Treat a NULL cached peer label as "not initialized yet" in both
update helpers: have update_peer_ctx() adopt the checked label
instead of merging with the missing old one, and have update_sk_ctx()
initialize ctx->peer/ctx->peer_lastupdate when no peer label was
recorded.  This lazily completes, at first revalidation, the peer
cross-referencing that unix_connect_peers() performs for stream and
socketpair sockets.

Fixes: c05e705812d1 ("apparmor: add fine grained af_unix mediation")
Assisted-by: LLM
Signed-off-by: Nik Tsytsarkin (nikt@fb.com)
---
 security/apparmor/af_unix.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/af_unix.c b/security/apparmor/af_unix.c
index b908e744818c..e802538b0e54 100644
--- a/security/apparmor/af_unix.c
+++ b/security/apparmor/af_unix.c
@@ -682,7 +682,7 @@ static void update_sk_ctx(struct sock *sk, struct
aa_label *label,
  if (old == plabel) {
  rcu_assign_pointer(ctx->peer_lastupdate,
    aa_get_label(plabel));
- } else if (aa_label_is_subset(plabel, old)) {
+ } else if (!old || aa_label_is_subset(plabel, old)) {
  rcu_assign_pointer(ctx->peer_lastupdate,
    aa_get_label(plabel));
  rcu_assign_pointer(ctx->peer, aa_get_label(plabel));
@@ -700,7 +700,11 @@ static void update_peer_ctx(struct sock *sk,
struct aa_sk_ctx *ctx,
  spin_lock(&unix_sk(sk)->lock);
  old = rcu_dereference_protected(ctx->peer,
  lockdep_is_held(&unix_sk(sk)->lock));
- l = aa_label_merge(old, label, GFP_ATOMIC);
+ if (old)
+ l = aa_label_merge(old, label, GFP_ATOMIC);
+ else
+ /* connected dgram socket, peer ctx was never initialized */
+ l = aa_get_label(label);
  if (l) {
  if (l != old) {
  rcu_assign_pointer(ctx->peer, l);
--
