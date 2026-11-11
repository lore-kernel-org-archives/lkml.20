Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411078;
	b=OBJlV5LXVUWV6nLL5ZyFRdyNwK8OKG9AVoDyfJOySAKEZzcvfKG9w1gLATvqY8nTePHw
	 fSOkEJvCc/R18gTAUDKcUnFZJnhWW61ZGaBu2zNmZR8grkt/mSTpQ9ONQGPWdJP33jxR7
	 On/TQzzuYeLKyHukfP50+EBgDOJCFrfd4RD2QV4JEcD1/RwGgkyPC7FGjQAK7SoA+TlGu
	 H7U7+S6Qh6o6OFLQywe5PXFK6IxUe2Fz8SsLzvUUkldHMWTHy/UTzGMG/I3WJsCM+r8iq
	 /T7zVmk6oTLDf01Ek0Wm8QoFryXWw8Q6PqR3zLrp4qDcuMgPjDgxlbpXo3l/fpFOF8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jMbE98rH640PDimDt/5oPcA8BfJO9FWfDPET1eqatTE=;
	b=QWEBOydhjNThNyYDtjflx1EzpE9eLCfM5LIzXEP/AeD9dvCTUDS182MkxLIAxuYPFyqi
	 IurWJA3ABfrJxUpRCRUoc4wcFCoH61pq7+GYWJGi9sPCiCO3g1nKzKs8gYT+JCxeTOVug
	 x5T1EgcbAtu1ihZaKyGvb2N7KF+Jryms5fTMDBuPX3PG1JzP2nhaCG/fo93hcOuRKcIDu
	 iSEpgZ7Vv5xadH8FhwKJYpfrGC1jUBwXrEyEl6uWggOGeZkFFq4+hlMAbRGl3Uh+NId62
	 98XI0568Pgpk73g1zzDAIs8u0oG5dfhmWY6V5cjeuGrzkSfmoGUGDYku8ffe3u/6ofA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QwZFkqnk;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F6D606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67F6D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QwZFkqnk
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so28984795e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794411077; x=1795015877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jMbE98rH640PDimDt/5oPcA8BfJO9FWfDPET1eqatTE=;
        b=QwZFkqnkqQgmKMaucvqUUEhBhCr0CHfKdRo56wmiBm1nt1B06ewHmhGQFcN1McJkGi
         Y/h/HgWV5gvyg000piSpcg7wedMpZsjEd0iTLO+PD30VerIoqP9qIeSPzs/jGZpZAAWl
         p3YkVlhx22iVP4VgqJXKfdnOtzciiHM5NqJO5vHBstLl/najug9+sUBetrRtwIFoufl5
         JQJGDf20tM/YDaiCXhIvherz/n7N6yUNO8dsm59dUOnRPnhMWvVQgCm2Xg0jmnmKH5fy
         vB5OHjhNq00CTpz2vuPlCSMcqs12L90cc4QJi2Rxbh4lE18kbfkYVfn4K0CY/Gds6XLg
         89YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411077; x=1795015877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jMbE98rH640PDimDt/5oPcA8BfJO9FWfDPET1eqatTE=;
        b=xMnG+sS/2RfmNM42pncuDn6nLByi5TONa1xVnuJTqjxp6UBIp9c931rhgfXznf4j09
         p4xCVq+DnZ64FfUo7mXBQvd6BsxuhpbbmeNaQu20fSGlIjGAUOB/J7U/qdF09Qu+VAOv
         kqc7x7xWQggC2vni1nlPxK0PYMyvWxqC2JcWGkYvGPMK/cpu4G/XHI7ghZu3CMZNyh7Q
         C2fctkE7/Dff/qIukArnwnCyoVbX37sunmz+rGlUA4H7g8KECUKrqLm3TzuIN+xkAbZO
         H2XANJyr+U04Pcp2zsQm8FD5NDNPyFRrkB7hq1S/7UO942bNw7eYZ5iyHQvRYYY/GT40
         0/Qw==
X-Forwarded-Encrypted: i=1; AL+hErGp93lXQYeevY+EGt58E9KFiwl5QQxX9pUxCHNZOIzN8142De+p97mi/zDtSoS3WrRn9nuczM/ywGDJ1WM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jPV0qCGVP1dttXOhXkThnYU90q6o58soXSc2YvW16ZkI6FuFI
	+4NFUvy7qFmfpKPpbfiDf3j8VVNmPU9yGkprus6se58OWEHc7rFX+Ys=
X-Gm-Gg: AYBFou0gLX47v04+qevWgvAmmG1WQMaNSx5/hcs009NGD8NR3IKHPpRcs/Vz9fskzk2
	85/N5sQBLDkmSeqOviUyQAzhm9p2vKmH+YE41Eovpblbj0WrePsS6WQfVe7AkdBfBe1saMy6hHW
	0pmdLJ5GWuddNy2s50rthxb3G6vU3Z0fERwsrtNKiUAbEbu85HPpH+zgffvtBAwEDM78oOOBm+C
	2lD+9C/60V+FF7lMNpLhRCu+fqLiPpXgs58xmdaEDVG8V1cUrMYfE23ntl9EAbtxv05oJ4lKhgK
	zhlrBldgBjIhmlv5b2IVk4bf6dMXy38mKIcHqPAaDVJNGO/im4O9qZZwpMs8HRZ1Es6vMA6Y95F
	V+zsotb4p+qiaWUH1muZO4Y2rja6yx62BVck5SoLwf3EeHK4dSK7hqnPr0Ceq80ZOk2PK+Gtiyb
	xJLDyjix3swhXOOuLVAoB7peSPH25G1FJmEJ4yeZp++0z4SVv1oITb4bxOUji359ojaq+pz+rY7
	b38hjzlA8MihJx1bx0cDkdRWw0xNNkB3PnYojdjm8sOiwDrtkUyNhezOmKtdI1LZF3PBm/RIT4t
	9K9/10eUncXK4Ak=
X-Received: by 2002:a05:600c:1986:b0:4ba:eb:eb9b with SMTP id 5b1f17b1804b1-4ba0935dad6mr50320995e9.8.1794411076662;
        Wed, 11 Nov 2026 07:31:16 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c5e2fd6sm2261365e9.10.2026.11.11.07.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:31:15 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH net] net/sched: cls_flow: pin file with get_file_rcu before reading f_cred
Date: Wed, 11 Nov 2026 15:31:06 +0000
Message-ID: <20261111153106.580776-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

flow_get_skuid() and flow_get_skgid() read sk->sk_socket->file->f_cred
without holding a reference to the file. Since the file slab uses
SLAB_TYPESAFE_BY_RCU, a concurrent close() may free and recycle the file
object, causing stale credential data to be read through f_cred.

Pin the file with get_file_rcu() before accessing its credentials and
release with fput() afterwards.

Fixes: 0ede61d8589cc ("file: convert to SLAB_TYPESAFE_BY_RCU")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 net/sched/cls_flow.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/net/sched/cls_flow.c b/net/sched/cls_flow.c
index a9ac3acf6eda0..233ca13299930 100644
--- a/net/sched/cls_flow.c
+++ b/net/sched/cls_flow.c
@@ -17,6 +17,7 @@
 #include <linux/ipv6.h>
 #include <linux/if_vlan.h>
 #include <linux/slab.h>
+#include <linux/fs.h>
 #include <linux/module.h>
 #include <net/inet_sock.h>
 
@@ -208,10 +209,16 @@ static u32 flow_get_rtclassid(const struct sk_buff *skb)
 static u32 flow_get_skuid(const struct sk_buff *skb)
 {
 	struct sock *sk = skb_to_full_sk(skb);
+	struct file *filp;
 
-	if (sk && sk->sk_socket && sk->sk_socket->file) {
-		kuid_t skuid = sk->sk_socket->file->f_cred->fsuid;
+	if (!sk || !sk->sk_socket)
+		return 0;
+
+	filp = get_file_rcu(&sk->sk_socket->file);
+	if (filp) {
+		kuid_t skuid = filp->f_cred->fsuid;
 
+		fput(filp);
 		return from_kuid(&init_user_ns, skuid);
 	}
 	return 0;
@@ -220,10 +227,16 @@ static u32 flow_get_skuid(const struct sk_buff *skb)
 static u32 flow_get_skgid(const struct sk_buff *skb)
 {
 	struct sock *sk = skb_to_full_sk(skb);
+	struct file *filp;
+
+	if (!sk || !sk->sk_socket)
+		return 0;
 
-	if (sk && sk->sk_socket && sk->sk_socket->file) {
-		kgid_t skgid = sk->sk_socket->file->f_cred->fsgid;
+	filp = get_file_rcu(&sk->sk_socket->file);
+	if (filp) {
+		kgid_t skgid = filp->f_cred->fsgid;
 
+		fput(filp);
 		return from_kgid(&init_user_ns, skgid);
 	}
 	return 0;
-- 
2.47.3

