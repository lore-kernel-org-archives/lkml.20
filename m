Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621380;
	b=XxqKzMG5zG5/BDsNDzbW1vTPu4GiGhrVmteHBgSSJAIqGf+GcpY2kxwln/X6ECSvhGZG
	 PIEnyNsJGSsW7r7fCa5wAdij0O+ikFt1WebtS/rWGrnV8xEfWNwX6AYt042QxvBeJNHNn
	 R/APcHwk0kRc5kGlv6E75YHRQ8UUoKJ8P2FjDbpLUo8iwBvzha8CugrT9ed5bln9Z+ehZ
	 iW48MgcCrYNxyD06ddLCoQuOqYFvm3nqGg/tyIpOomMINFyS5iME6gd8BLrDeDeVh2Ac+
	 G8hq8muRVhRPb2E63aYOvk++GDlT3lLIMB7VhdKjlpggaNVXYNgubcOvExdj2FDnRgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=h4bBhShGgMtgvUcHfjYjgyBrngfAAZXiORF9a57vGdw=;
	b=0UGsc8C88RK8koArET6p9VXnIVLXjLAZsQtddN9x5T74sVPkXe7KXMyvXCjwJlXnZiwd
	 pHLsKiiLrK8DoYDusX/ewR8Iz1HpoK1wb6NZWJ6w13YBkl2r7GUR/PGFYt2x4vticd/Gq
	 aoPD02xFj/UdT19O4PjuHYORs10OJRynhsqZrTJ/cg2XCSLx3nLKLhsVIgEqZSntBTuRX
	 3TmJZYugbFbY4C/8Bi6pharENUbYFITGJR/TnclfajvRAL7yKTTNudEG68IGwu5Jq4wuG
	 FJ4ojlrwgHPhBK1aW8Na918suJ/9xPVoERxfmRSANlJv+kBHWyvjE+FrMHwb5gWRYeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="fB86neL/";
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6068606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6068606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fB86neL/
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-53ec92375d2so1404943b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793621378; x=1794226178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h4bBhShGgMtgvUcHfjYjgyBrngfAAZXiORF9a57vGdw=;
        b=fB86neL/9KY0NOgH68tG86XXv5ZntiyY4QRbMv1Q/zJ1/20+tKVOIgyOG3j+qP+dWf
         qC36ZFZOEYas9LM2el3mRFDkmLHvZumPInEqCstb93Sa2Jp5fqcsh/8FdwHb6tiuABaA
         5HpT39BRa4aVs5f+eTRHtbhc1h/n+7kod2VBmW9FQysby5uXYLOCMmyaLmxvRtP8uF2r
         KCXqp410+TmI5uZCkjCNzm47gNY4Bi7Cd2bnD0nuEEz4eB+i+Q8tTkfkepAYZ5xuWaki
         wnlSoRlj4icbjoq4n6fp3VgOUGMU1bRfzfy8jLvRFeOuyBO08rZhgzKzOSifbcftpo7c
         vdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621378; x=1794226178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h4bBhShGgMtgvUcHfjYjgyBrngfAAZXiORF9a57vGdw=;
        b=C3T6ZEr28BvpRUlztSe/xjcsdq619qKnQ2a3YWuSFeeF2kgwDn1DCUGBwR8jHBjNUX
         2GQXKRB/M1RJe2KEPdp6FPzxadDBNb8qD+/boxRVNVoBTwZ8/P8F+3qYnA/99L3st2W6
         oRl+CjeBUWIleYYKi3XOEyZ9SVQdkLEA8LJSi0lDmiWk9aCCt8XhmDzXkr0o/8xwfo/R
         RVwPpMXc7MP5OkWzFafRL9AuKSl9Kxj0Oh4bXfXZhd5g9QYLVzqvP7zwUb7F39ePG0IP
         9AL2xsYLeeiLrJn9cm1u1vPP/sNitiirttfO77HH/m+L8GP9k3o+YMWeB2G9PaITKBjq
         RYQg==
X-Forwarded-Encrypted: i=1; AKwUvBxPh4eL/+B6EKKSOmt+M6YH4tUHyf3fkFD0ONpShQGXbw7fYSG22v0m+oJOX7hvakYtAxIzVYqfojFH0S4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKI7/yIRQe+xrvGn2v4mqKvkhpjx1fJLIuaqm0xi57IjWzxgiAq
	XE6mCuluBMB4nTJmLAvUv4jUxAor/AM68d2UnScqGccdlPw3K6br66Uu
X-Gm-Gg: AYBFou32234Mg/FgNLIT0EQ88yrSwuwcxn3W5zukNf/B+1628iK7e33OyzTDsXt5uWj
	2SZAMon3ZJkXIA9POVjlHuKPjqjDtCZONdxxq2gL+EBH+z18TYLhRLwJj7cDDa73Tb0lkr5UI9e
	NZ5zWXjSnrCK30n9Uqu9u1gJYh2tA3muSN20AHGfPLy7y0Bt4mxvx2Q1gwPcWCz9lg7vstmkDLp
	VnZAiB2rplIcavsmQSMCdMdO9VqJGC/i56Lpc2NF0DSlHoydL+qajxowNm0RGTbOl2XyCnMCAEC
	fNK5zBl9EqhBWZdFG+hCZoJqprnjGebFa6fAClFaijV3kchuXaaiankuJAWRHQ/m8qmil6XrdjJ
	XqkxrXL5eeWwIdeCYPT55W0mPfXY0jDpdV4KLqpE4v2Qb2xWhFFTv3PGFVOK4jpPTmRA54j9dyk
	jGbPRlSRmtbCaRSzj537YMvQWzKwWxfmrqhMP53Bn/q0/P/jgZF3qRMk5bBB3BXmp9yK9yUWXjF
	HpFRTnkle70hhbp7lKn2wgz/FDCT01RWTYvq5BaHOztLhq1+hWt8KbUZXAFdQ9o1dkt/1C0SMIS
	ZPfdQYMr28Muu9LuETAcSSpoJYiUJkNfR+zmJS3RmNU/r8rNlM1Tfojq4Ycn+kGe9B7Vr1Ck8ul
	l3mnU8aSUqCwqx8+aW0EzbwGGNCbpd64FJtx4HUb44b5u8CoMno1KtjL27nMLlFKl0jy5cfjszR
	z8qCGOj/U3CBItYmYAiCg=
X-Received: by 2002:a05:6808:16a8:b0:4e6:e72a:1ba0 with SMTP id 5614622812f47-5640dcb7459mr6360233b6e.12.1793621378085;
        Mon, 02 Nov 2026 04:09:38 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd95dc0sm8461851b6e.6.2026.11.02.04.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:09:36 -0800 (PST)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	linux-kernel@vger.kernel.org,
	Anil Kaushik <anilkaushikwireless@gmail.com>
Subject: [PATCH net] netlink: Do not call the unbind callback with the table locked
Date: Mon,  2 Nov 2026 12:09:29 +0000
Message-Id: <20261102120929.4077030-1-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
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

When netlink_bind() fails to insert the socket, it calls
netlink_undo_bind() with the table locked. genl_unbind() then takes
cb_lock, while genl_unregister_family() and genl_register_family() take
cb_lock for writing and then wait in netlink_table_grab() for the table
users to go away:

  netlink_bind()                 genl_unregister_family()
    netlink_lock_table()           down_write(&cb_lock)
    netlink_insert() fails
    netlink_undo_bind()            netlink_table_grab()
      genl_unbind()                  waits for nl_table_users == 0
        down_read(&cb_lock)

An unprivileged user can get here by binding to a port ID that is in
use, with nl_groups set. Lockdep does not see it, as nl_table_users is a
plain counter.

Unlock the table first, as the comment in netlink_release() asks for.

Link: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261101101347.3910654-1-anilkaushikwireless@gmail.com
Fixes: 3de21a8990d3 ("genetlink: Add per family bind/unbind callbacks")
Signed-off-by: Anil Kaushik <anilkaushikwireless@gmail.com>
---
 net/netlink/af_netlink.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
index fec2879c497d..666a0ba03ca1 100644
--- a/net/netlink/af_netlink.c
+++ b/net/netlink/af_netlink.c
@@ -1047,8 +1047,9 @@ static int netlink_bind(struct socket *sock, struct sockaddr_unsized *addr,
 			netlink_insert(sk, nladdr->nl_pid) :
 			netlink_autobind(sock);
 		if (err) {
+			netlink_unlock_table();
 			netlink_undo_bind(BITS_PER_TYPE(u32), groups, sk);
-			goto unlock;
+			return err;
 		}
 	}
 
-- 
2.25.1

