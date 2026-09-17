Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BF5572680
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789656153; cv=none; b=UIETBsoZ/WI1jnN54H287i1kSicvszzsI4M4whWeXIYcwzBt2f+2NJFObr01BPY+WknfzyMkIYNYyrn6vAkv+S4opvszBK7DF3MmSD8Iuv9clD1caUo+nchFjoVJK8DhTVjrQRn6IqrxFovZEwhn4apgRWTbR35wfYxJojLR3fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789656153; c=relaxed/simple;
	bh=kw4TipmbKGg8CFX/QSiBbtXEfjEf0OiG5AFkDXCIye0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DD+kD+j/n0MX98FJl3ewl3ulkmv7le/Oe581k26MmnRmndjX1S0HqPHoQESY1LvI8IAC0m6q+osrqm6TsycqEXwF1vXbxWyOM7XVDJ7334UdPUvFSM3WGIs6oxkaOK4V0f8ipnyLPzgVtIb4++eKokNLO8ITe5aDNfZubBl+ljg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJP29yOK; arc=none smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJP29yOK"
Received: by mail-oi2-f12.google.com with SMTP id 46e09a7af769-804ef461aedso516420a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789656136; x=1790260936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VLiAuQyw2H6SVXJcusiyWm3lbA7Z/rT3zG0bbVq+oY8=;
        b=iJP29yOKsag5ZMS/VtzRGF+y8gZdaGMk1pcIv3lM2jLydpxBZ1BdHKr7z081KyMhMW
         HVgVPkeY21v0SYJPofM/LNMgYvbHbgcYl5c4UGJ6la90AiW4vB38gwc/av3OucVz2zIR
         vN1NYGhaM/W9amuzKd0kJGTSZORbukRQMfW+K7AMpqTntGZCu+kHJiSc+lhBPI+Vyn0W
         mBHNOC74GbrX4VY3HISngKzWvtMApX9w7GjJdzQyQZXq/z73aoJc2DhY3Aj3zVs724zJ
         +5wFgrk9NbzkeyKeYK+mJTw5h8yXCsIsm49B6ptX6LREOKsGElU5H1kWAGD/RtEuOwi2
         uVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789656136; x=1790260936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VLiAuQyw2H6SVXJcusiyWm3lbA7Z/rT3zG0bbVq+oY8=;
        b=FS0PunUccZRU8eyJIaXtdShd2egzratdlTN8A484TrH1QcCfUVw0LaFDwJWu4TkKAC
         eEhx5LQ0mMF4BLsc0Gcbis/wC8r1RAWdT865lr9+Rm5FZ5xAq2f7i+eRCH8eKht96CI8
         SiU7/BzklLXfhxBvaGwPKQbjBmTopRA66pvRAhCS6YoVaZ6BGzYw9jU/vG8S31VQWaB2
         VSaZFJT7SYbGz02KMv9zJR6ZONvGyxLpwICK6CZgD51Ml059Ag0yOdXLA3bNrn2NDSdO
         6yLd93O0nfBw8Jvm8d3od5El9XKEzrGZ+oUmc3Tac7SRAUWe2ENyNtD6DyED/ak6EYhT
         rQMw==
X-Forwarded-Encrypted: i=1; AKwUvByqmGagvs8Pc8l1V/WSqZirXyPq8lufhTV3hel8GNHTcomsyBGmHMJGfD+fW7It3OdcrX8VbSLKYv7bzwc=@vger.kernel.org
X-Gm-Message-State: AFuF++lFkun4EzuK1kLhR1aPGRYHVzg5u0HeFAuE15B42KS8Dq3lST/3
	1dtGZQ9/DPpf7LzXaLrqJBM0AvVJPFFcGTWi/CpjwbWiFrPFPw7DLYq3
X-Gm-Gg: AYBFou0HYZbKMBIh4U+uawePbeWPbQCoR6/HE+WUtU0REP8sC6OiIGivyWyBIY+t8Ot
	QwLscNFCdYPMCyBW/A1TEyKbB4TKQwBIdkGS9wuoikUv0325MsXqqJ7/Txz9TU0jK36paL4hydf
	ErIi7r9eqaf6Gl7A/qc3Q3onXQKL8G2RKqndnkeuZJ1Wc9lnInUE0cL6HoQOxJNL7ewvI5Z/q5f
	XEMggFOk5wV8jQv6ZOsEA4nseK8GtkrhUOYT/hkvguKopza0v8erlMu9vUUo+r1KPPpskQPKeFh
	S3Ked9ZKEHlfyEc+MNSTEuqeIvu086gVTNsbNSGOTYb0MpB9R9ANDz+NPGvBY4nhaj2DdSbkKqm
	34aV13I//kKraEjk49Pu+UNAtFHYYBXErZ2vzEQ/QAmk8dl+iR3yAdXSAdtgPmUZAJETT9vDgG3
	18pJuoWhKe04Q2Bghiw6A5laXA0NSHkItm4ZjbST6DiKpzVxDYm4T/ZqF+bdpYKm98IdkA89Cb
X-Received: by 2002:a05:6830:6b09:b0:7fa:ac4f:77d with SMTP id 46e09a7af769-80b2f9e3449mr6878507a34.28.1789656135911;
        Thu, 17 Sep 2026 07:42:15 -0700 (PDT)
Received: from archlinux ([2402:e280:411b:ec:aa93:b1ec:5a6b:5fce])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80c4619a868sm3092468a34.8.2026.09.17.07.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 07:42:15 -0700 (PDT)
From: Adarsh Das <adarshdas950@gmail.com>
To: gregkh@linuxfoundation.org
Cc: rafael@kernel.org,
	dakr@kernel.org,
	driver-core@lists.linux.dev,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adarsh Das <adarshdas950@gmail.com>,
	syzbot <syzbot+4393dfdddf166f2de2b0@syzkaller.appspotmail.com>
Subject: [PATCH] kobject: fix uevent socket use-after-free on net namespace delete
Date: Thu, 17 Sep 2026 20:12:06 +0530
Message-ID: <20260917144206.85836-1-adarshdas950@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a network namespace is deleted, we free its uevent socket. But
sometimes a device in that namespace is still being removed and tries to
send a uevent through that socket. The socket is already freed, so KASAN
reports a use-after-free.

This patch attempts the fix of taking a lock around both the send path
and the free path, and clear the pointer before freeing so nobody uses
it after free.

Reported-by: syzbot <syzbot+4393dfdddf166f2de2b0@syzkaller.appspotmail.com>
Link: https://syzkaller.appspot.com/bug?extid=4393dfdddf166f2de2b0
Signed-off-by: Adarsh Das <adarshdas950@gmail.com>
---
 lib/kobject_uevent.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
index ddbc4d7482d2..ecba33abb6b1 100644
--- a/lib/kobject_uevent.c
+++ b/lib/kobject_uevent.c
@@ -411,9 +411,15 @@ static int kobject_uevent_net_broadcast(struct kobject *kobj,
 						    devpath);
 	else {
 		const struct net *net = container_of(ns, struct net, ns);
+		struct uevent_sock *ue_sk;
 
-		ret = uevent_net_broadcast_tagged(net->uevent_sock->sk, env,
-						  action_string, devpath);
+		mutex_lock(&uevent_sock_mutex);
+		ue_sk = net->uevent_sock;
+		if (ue_sk && ue_sk->sk)
+			ret = uevent_net_broadcast_tagged(ue_sk->sk, env,
+							  action_string,
+							  devpath);
+		mutex_unlock(&uevent_sock_mutex);
 	}
 #endif
 
@@ -804,13 +810,17 @@ static int uevent_net_init(struct net *net)
 
 static void uevent_net_exit(struct net *net)
 {
-	struct uevent_sock *ue_sk = net->uevent_sock;
+	struct uevent_sock *ue_sk;
 
-	if (sock_net(ue_sk->sk)->user_ns == &init_user_ns) {
-		mutex_lock(&uevent_sock_mutex);
+	mutex_lock(&uevent_sock_mutex);
+	ue_sk = net->uevent_sock;
+	net->uevent_sock = NULL;
+	if (ue_sk && sock_net(ue_sk->sk)->user_ns == &init_user_ns)
 		list_del(&ue_sk->list);
-		mutex_unlock(&uevent_sock_mutex);
-	}
+	mutex_unlock(&uevent_sock_mutex);
+
+	if (!ue_sk)
+		return;
 
 	netlink_kernel_release(ue_sk->sk);
 	kfree(ue_sk);
-- 
2.55.0

