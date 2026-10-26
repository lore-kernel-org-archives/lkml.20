Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008373;
	b=KclahURPqCRbArAKO8gmSJpDdJNbNvVXs68EEF+SkfbajfWGO2oWIGG1TUODkZHfE0Om
	 VK60vdbChr0IbH+iz47jt+x7tUgA3N/lYlM93XGLSnRedwjd1oQJdXakKwEh+BVHEy5VA
	 +bRJMmiKGUyodaaM/+MNMO1R/kK8t+ia6n5FOk88xEgB4hF7fAN1tjhZKRNHjrWnjOyd7
	 Gbi/T4twx9rgH8gfgD9vmKb97MIYu5MkT2ctUi+2Hl5pE+0ZX3Nh5KurxjZ2Ke1uW24bX
	 bd/eMYqhLaI1tbfpy9qukJPx3ARJQoNnLLLOq+GegqyVeftPCStj0jSSS7Sbbpiv4yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ru2m+eMCX0FjLxa4pELR8RW+a5n6pURQSPpGAy5s8lE=;
	b=NmfmDs+/ifs/yMwjHmFOVT97XHnRWjpBhysNWxA//OFQHKbygMKJcids82R2dJUYIVGy
	 olB/T5BkVLy4rVpVEN4KLP1HKaPyYHdLbEBVSX3fYyoBepY3rTB+orahR2UHNprFp2sWt
	 5xTuDn3d3LerVnautVrgGGrl/J6tNN6V5J8cVVZRUAg8PpNQ0HZ4oENyqb6Rcni/1miJP
	 +aFNdUoiIqjjRNXDsVW4f3jJkIbx67hT+wp+Ar0f+oagEpzaSahEGnW90Ct60gS6QlO6e
	 /bDFoHeVcCgSvoMn4AAmcuEg01Y549ebVy9TD2ZaZ1APa2tMdjlF7zWA/vbkzJGA+4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fBRmqHQm;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C399960A2607
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C399960A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fBRmqHQm
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1656828f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008371; x=1793613171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ru2m+eMCX0FjLxa4pELR8RW+a5n6pURQSPpGAy5s8lE=;
        b=fBRmqHQm9FmItrZS3o26UQLzMWLRuYch9xsJch0E/yb8WZhp0HON4hBqgZUzN//CH1
         AuVCJZfNXn78BcjOf9z3dbEMffeVkvxz2kcscpeF2PyFVY0tbFPsCBtWfOOZ9B7YhXDG
         6mIiJW12tMUSc0GMixbFeCq13TGesCf3QQ8md5FXtlb62NPXCR4DmQfSDIINf6GYeaxM
         45OBZ7981GqFZEmYz5R0NOd2nU6gsY4Dkfbuv4DhyRYUQiBI2tTFVVo4C1fUDWQxmHnh
         0OFCDHVYVGYms1oiFkrCnIqpfPKCSLqAWoZmIK9H2mWLrzmaZR89fCMgZ38V6gzn3FhM
         YknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008371; x=1793613171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ru2m+eMCX0FjLxa4pELR8RW+a5n6pURQSPpGAy5s8lE=;
        b=qC49wsLQf6totUcmboDIMcO4jdsZVso1wXIT2kQUUOnE5xDQ8oxmk9UL8lCo0cEMop
         em6zF9AjQ85MkyqYFT8UTm2ufPk8MPCaVnJVH0z29lkuvNmH/QNhlX1UGLStdBX6uE/F
         1gWcbl0pQIfsFPUs8eZ5wjI+RNmYBdLFSLWtex/Jx8jrYs0cMINQ6ITj67J9l/AEi9fv
         5ES0DHNf7j1XMxChVdoVILYL6iXJ+oh5606FdxWmwcLcOXl/pPBKzKeNHXFEGdO0XEkQ
         QeWnXsaxGpHLcEqc5ZArHy7glhTTtXZqNdmEcuenJTZXi0eMJxOYezK9Gg3oFkpjgzIf
         dHeA==
X-Forwarded-Encrypted: i=1; AKwUvBy2Qbimwom3t1dvzQZZsF1EG1pOzCs4FxlnhC93D5KiNcpB8VeZZWDt99GMXafkprKo36Lh8xi0fXgEAlA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIe7NVY2SyjXSVLAog1RRcyKW9naWDKyTea0hOhItjnN1DSVFds
	biv4eIaVSjbSARojbC1rgaWRUWlYuoJOV7xWD/xUVQhMifY8vIGsm3R6
X-Gm-Gg: AYBFou2d/JR0sXlZtnn2mimWWctibeZ2CWmRC91/TdJ9VM2xoSrRODj9pwhQuJnN+I4
	sOiwnziBh4F5ZYq1X5qWWCZDMwx2EtDc6fk4c8vqvxBCFAQiI9dCmEX+lg3ElbDINlbQ90ZMpd9
	7Ga4WyLAIGNacJxfa8txUZj/Uxc+2VBWbDEwMTma96tY8eYI8ksbD0BNjaeVBZxcnrcoginZJfe
	z2Nx1EmY/AVt7Gk2GS1rbw+d+amMtjhPZ4r4KhhRtMAdY/g9SlsuzQv6O490J9zh1CcE4XMzkq4
	i8cTvMCZ7W0Y75tO76G0F0qdmUlGjp5y69xtF0QpkRtPOUsiNXdA6MroHpA0nkBl0uf8cvFiOYj
	KD7wor2k3TvreZjS3TTh/orVx5zKka8u0Bhkk+EWsiRayG+Jg62UdQeHT8S00fGrmY/vIUNQtE5
	YGj3XC4IC5sychQj0Cn3Nq3gSE6jAr1s1CLzRycwvBn9sSKZyPTryM0RDlQsQpeX8Y/xJkWM0jO
	bij2e9b/1reRCwE1sTeXl4sH1EEM9hSAHM5WOah2Tjw7w8/M3/696CUZLT70ZedRwrHGbvVGOIc
	FrEl/Uku4X3mWwo4BpIdXWqNg9CDJao/+Gr7XBEl/tXvG8xVxqw=
X-Received: by 2002:a05:6000:144c:b0:48e:4318:8854 with SMTP id ffacd0b85a97d-48e431888dbmr10254651f8f.20.1793008370716;
        Mon, 26 Oct 2026 02:52:50 -0700 (PDT)
Received: from zheweiy-mac.corp.tfbnw.net ([2620:10d:c092:500::5:7f66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e542ed998sm494513f8f.13.2026.10.26.02.52.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 02:52:50 -0700 (PDT)
From: Zhewei Yuan <yzwlhm@gmail.com>
To: netdev@vger.kernel.org
Cc: Zhewei Yuan <yzwlhm@gmail.com>,
	linux-kernel@vger.kernel.org,
	Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Subject: [PATCH net v2] tcp: Fix fastreuse cache initialization on first bind
Date: Mon, 26 Oct 2026 09:52:07 +0000
Message-ID: <20261026095208.58504-1-yzwlhm@gmail.com>
X-Mailer: git-send-email 2.55.0
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

inet_csk_update_fastreuse() initializes the reuse caches only when
tb->bhash2 is empty, but both inet_csk_get_port() and
__inet_inherit_port() link tb2 before calling it, so the first-bind
branch is never taken.

As a result, SO_REUSEADDR binds never get fastreuse=1 and keep
scanning existing owners, and SO_REUSEPORT starts in STRICT instead
of ANY.

Initialize the caches when tb2 is the only entry in tb->bhash2 and has
no owners. Timewait sockets are also linked on tb2->owners, so this is
equivalent to the old hlist_empty(&tb->owners) test.

Found by manual code inspection and confirmed with GDB. Binding 16000
SO_REUSEADDR sockets to one address/port in a KVM guest takes 4.18 s
before and 19.4 ms after this patch. Existing bind/reuse selftests
pass. Analysis and testing were assisted by an AI tool (Codex).

Fixes: 8002d44fe84d ("tcp: Check hlist_empty(&tb->bhash2) instead of hlist_empty(&tb->owners).")
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
Signed-off-by: Zhewei Yuan <yzwlhm@gmail.com>
---
v2: drop the KUnit patch and the cover letter, shorten the changelog,
    add Eric's Reviewed-by.
Link to v1: https://lore.kernel.org/netdev/20261025090048.27870-2-yzwlhm@gmail.com/

 net/ipv4/inet_connection_sock.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_sock.c
index 8151c638a24..93b306d91b6 100644
--- a/net/ipv4/inet_connection_sock.c
+++ b/net/ipv4/inet_connection_sock.c
@@ -446,7 +446,8 @@ void inet_csk_update_fastreuse(const struct sock *sk,
 {
 	bool reuse = sk->sk_reuse && sk->sk_state != TCP_LISTEN;

-	if (hlist_empty(&tb->bhash2)) {
+	if (hlist_is_singular_node(&tb2->bhash_node, &tb->bhash2) &&
+	    hlist_empty(&tb2->owners)) {
 		tb->fastreuse = reuse;
 		if (sk->sk_reuseport) {
 			tb->fastreuseport = FASTREUSEPORT_ANY;

base-commit: 7076f684d5132e6a6145e1da2fa74771ecd052e5
--
2.52.0

