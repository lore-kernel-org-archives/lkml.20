Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793425610;
	b=zZFkQhdykWmafUQfcm70lmeiywRThIPBsesoq4wj2UYHjuj92mTZ3JwcSERiUODA74ba
	 177YxSObN5SCn5h98WZRN36FdWIRtwQzu1SsTNkVQftbAM2exWhIMsIaiSbD+YeD5BMDp
	 BVdq4stwGmbe6x1FSFRNWKmQWwI5Xio2yLZWoQcNd+rFy2wo8IUcHGgrVwF6YFaKCB0jy
	 Az4SNGBBEkrxJFx5OAgn1qXsneKZLnQouJne68hWUAJC4ooq6ulvmviD2AiwUWbEOIMq0
	 pzNZ/NvERahXahfcF/bv5DvMoH/ek012zA+2u+BNKRmnKgEnCZYENquaDST2jd99V0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793425610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UW3BQ/Y5PiheRrkEpcONiNTmtPHiTfQrc+Cn+a3/JAE=;
	b=MSLnIRN3ACj+SiUvKlWuCvqx+uNwgTwcb+M2Zi0MRMZn2vEuXfe7napLeAvyx3EoQlNG
	 20F6ZFmR9IVeye51wXLyDwf7mQHndsJh7163biIagV2cIh5o663PbWaHFZQ2Zq1RfoQdF
	 nWwB0tq6YkGE59F1a1qJ+Ucag4zFCu1HGeZoUxmjrXeZrYX5HVXBg6bphkmZfopd1x8s0
	 y+gfSvhPyl+hcTxukKI2SYR1FscwnyDuLx0vM7EqllsZOOBKo5SJTYT6wXbh/Ab9s2FC3
	 iZNwotgYiXx3kc+NfoXg4n/JwVgSw08y7J5FcAa8T1+l7jWf8q6DdUOIOLcHhfRQnxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O5oaTt9Q;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A97606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:46:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66A97606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O5oaTt9Q
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so2426684eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793425608; x=1794030408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UW3BQ/Y5PiheRrkEpcONiNTmtPHiTfQrc+Cn+a3/JAE=;
        b=O5oaTt9Q4TqZOVrT2B9SV76ivfBonsnDWXbr8gc+d75/IBvHLUOr2ZCt9Z4mzI/J9i
         vR9reN6cLhhyx679o4IwXW9GMGC4LI1Bd5oyVh6Ttq3umuBSLzOhzxZEn0ybaHQQ7SlE
         B1X/6LKEDA5UK+HRO9TliPtsajk/+17mVJycrHt26tyuL2pExAFVsIdJAO3tS8BLiKjd
         BdnU6ATNqcyBAtoEM9FY5kKib9NfWpZ6vkwtUer/d9eMRFsWYW9voLYfG9frPly0UMz0
         PKVCoHLIs0sp7WaPe7jMUSMIxsjSH4hhm8i34ExT20pvmwaEo1/QCRU3geYkw9nLeIPf
         LnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793425608; x=1794030408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UW3BQ/Y5PiheRrkEpcONiNTmtPHiTfQrc+Cn+a3/JAE=;
        b=vBqfAneTiUYgfIGHuDeOOUwRnotDaasJ2R5Tf4hKPdiQUNO2yg2CE07x/vmkMaifq3
         JSYQnFjyMRWOGcszfs7tY+wPmszL7/V39ocEjrIoOmC+y2UONDNbg0Cgac59NCYVcjzD
         XFalOOqkxwjdwHzHHXLTTccRLbxHP4s67BrddtuxhCqqzkr0qUjC7cHPRDYLyWhWit5H
         mrHKGY3HQVfGD74wyKcc1yhEvW6dBg2L3lU/EvOPq2A4CNC4SOLmBJGVJgOSWEC/G1fL
         qI/U79xB4IfwFa/Wt/XzQDbzdNWAaik/NRR3Yr/H5Prbvmx0YBkop+I3AA1DkHFphSuf
         2csQ==
X-Forwarded-Encrypted: i=1; AKwUvBwodGl3WeGkdGAOPeQtanli4yLzKlsdohl4dDJgQpRMuu2rAIivPqh8b+RAdcqDFIIJB6nlSc/S4kjOwq0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYjJyXaWVvuRVqTaY86/iyPsibFGM7tMOuh6kw2va7WNeu94Gt
	EdD0R7Ps64rH2J7PcFHZIdTPCaLz5lgvdjaBUGKA0IChg4cMxQyeiBW+
X-Gm-Gg: AYBFou13ZxvcSH7fJ/pfBcQNz76FMQM+AmP8U9OaUTbbNt5TNTVRkANxoEuAQu2CQYa
	cSQMwJRRou+ZPFcmGkyRJUOuXNO4OoAHtyPYdl/a+7rWRlRA2SLoO4QoTES9lf0rLxK+riVO8fh
	gF+EK90+CJ3gplnWtecVXncqFAqkvOR+8jrbblZcF0OnS3eb09RWdmdZG7IVOPRCz90bnM3U9Ok
	gDt5kFTJcssG7vofY/PvGCyqKtr8heGmnm/KW28PhVyhwBiHWYbw6eRQbKMspBQy9XJbe4TVF+W
	cqeIOiGeEmKQlccA4dzaxIUuLvIy8h3aWJT8e8D7iVWDgZ6mOBXa0Z/oLlu2BESPwtNhMJn75KI
	8XkXssWzaRmjSZxrEe06ZYlhEQr1gtvyWvFNUMxsnD9Pl2WqSV82+z+EJ4Jx1kKmT3T07U5NeJv
	ymCypX/+lc96cx/fgfTEhiljzD1b1MZEDIgjKeqp0uNbktr1vfqPQC4+g8b8x4O708JuTxDt6OB
	tel9btODvoHrxGAcGtZbQM5xgb6QWcMHuoKKyMrGkFQydh9r9gZFjWhBGElKZKTmyHWE9j/fHJa
	J0ILEi3FPQ0P0RsVTPnHxp8A8JFa38g5iCGffD6w4xdaNC8We3v13ba+KcP5hqDOZQi8SmEC5oM
	09OjeJl+xWLpxBwxYYWUHSriDQiYqrZWPcO2ZG+LGBS41NPNcgj/JdMrDQFXGex6geI8Np/ZXCg
	==
X-Received: by 2002:a05:7301:f8b:b0:36a:2383:eb51 with SMTP id 5a478bee46e88-36a423c4070mr5816413eec.26.1793425608219;
        Fri, 30 Oct 2026 22:46:48 -0700 (PDT)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429018casm11668877eec.14.2026.10.30.22.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 22:46:47 -0700 (PDT)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	XingWang Xiang <v3rdant.xiang@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 2/2] genetlink: Clear stale members when assigning multicast group IDs
Date: Sat, 31 Oct 2026 05:46:32 +0000
Message-Id: <20261031054632.3697295-3-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261031054632.3697295-1-anilkaushikwireless@gmail.com>
References: <20261031054632.3697295-1-anilkaushikwireless@gmail.com>
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

genl_bind() checks a group under cb_lock, but netlink_setsockopt() and
netlink_bind() set the membership bit only after it returns and the lock
is dropped. If the family is unregistered in between, its members are
cleared before this socket is one, and the socket stays a member of a
group ID that no family owns. A family registered later can get that ID
and its GENL_MCAST_CAP_* flags are never checked for the socket.

Clear the members of the group IDs when a family is given them, the
same way genl_unregister_mc_groups() does when they are freed. No socket
can be a valid member at that point: cb_lock is held for writing, so
genl_bind() cannot see the new family yet.

Link: https://lore.kernel.org/netdev/179340003139.3131.11274717768928642724@kernel.org/
Fixes: e03781879a0d ("drop_monitor: Require 'CAP_SYS_ADMIN' when joining "events" group")
Signed-off-by: Anil Kaushik <anilkaushikwireless@gmail.com>
---
 net/netlink/genetlink.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/net/netlink/genetlink.c b/net/netlink/genetlink.c
index f038f04ef4ea..0ddebd828585 100644
--- a/net/netlink/genetlink.c
+++ b/net/netlink/genetlink.c
@@ -452,6 +452,22 @@ static int genl_allocate_reserve_groups(int n_groups, int *first_id)
 
 static struct genl_family genl_ctrl;
 
+static void genl_clear_mc_users(const struct genl_family *family)
+{
+	struct net *net;
+	int i;
+
+	netlink_table_grab();
+	rcu_read_lock();
+	for_each_net_rcu(net) {
+		for (i = 0; i < family->n_mcgrps; i++)
+			__netlink_clear_multicast_users(net->genl_sock,
+							family->mcgrp_offset + i);
+	}
+	rcu_read_unlock();
+	netlink_table_ungrab();
+}
+
 static int genl_validate_assign_mc_groups(struct genl_family *family)
 {
 	int first_id;
@@ -527,23 +543,18 @@ static int genl_validate_assign_mc_groups(struct genl_family *family)
 			clear_bit(family->mcgrp_offset + i, mc_groups);
 	}
 
+	/* drop sockets that joined the IDs while no family owned them */
+	if (!err)
+		genl_clear_mc_users(family);
+
 	return err;
 }
 
 static void genl_unregister_mc_groups(const struct genl_family *family)
 {
-	struct net *net;
 	int i;
 
-	netlink_table_grab();
-	rcu_read_lock();
-	for_each_net_rcu(net) {
-		for (i = 0; i < family->n_mcgrps; i++)
-			__netlink_clear_multicast_users(
-				net->genl_sock, family->mcgrp_offset + i);
-	}
-	rcu_read_unlock();
-	netlink_table_ungrab();
+	genl_clear_mc_users(family);
 
 	for (i = 0; i < family->n_mcgrps; i++) {
 		int grp_id = family->mcgrp_offset + i;
-- 
2.25.1

