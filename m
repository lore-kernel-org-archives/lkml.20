Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788675;
	b=vwdmYUkxIMSG4csjjOnBCw+l6szwMAWrXjVw865Orb0JuOzWWZft62+BPqAbnae3HGYy
	 MiWjozUuofIsPZu3VhTdkKpNeZQfmLl2rd3T3gc3dvzjgRNC4TMCOc28HVbo+xFCyy1dz
	 RYpSX1EwCulYado2qz2RkIqIgbqcWZ411P8d095I5u0vpZWvYmOqzhwt1Y1nRXNe6e+HM
	 jP9eLEdghLUR7kSuw2e5aHMDXvJfS4mhfeI5nMg1Ad85PW5LeeB1EkptCskh88o7F8Sq6
	 9tT+Hy23MDz8/vN20y0/sTePja2uhFLCQkokkJa5quNY9hU0KcZFSRmYu2MFX9qss9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=onAfKGASw105JYI87UHnMZzgOAw/UrE5Kfe5HtsiM5Y=;
	b=AXaQ2AhgmmpqkFMgF+h5lOUuxaexoaH4kHJsDxnOFlnfOA6NjFJr5hcgyyg54y4g9wwl
	 4+m0UcKsecYZiZZr8J0h6L5N0jvmXa6rVKYwomUStwC50ZBFXfOdkksNEYAngqchbuZqP
	 609RWas1+bwJSIcIi+BoySQb38o0QU8WnSnOJBlM/LoCh9qHh5Q8foUYxBhH6m36k/nN1
	 KGiKU4KisSe8CTNo/LTbZWnupG37B81jYjNlKoRvY4ioFVTW7CHSBcDLlexKDXk3/15t3
	 PRAXQ6+lU6b6hMjv3iR71eDXG8KW3yfcx4uQFerH2LPXJhSDQmym8c2t/WiHGSMAHow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ky/Vvs7v";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15711606A331
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15711606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ky/Vvs7v
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a210470b49so3625555e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 02:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793788673; x=1794393473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=onAfKGASw105JYI87UHnMZzgOAw/UrE5Kfe5HtsiM5Y=;
        b=ky/Vvs7vq9acnbAepAf0/7PqZUgHqQhJ4a1jWVId1ZL5PMZ9n1cXoI4O/MFd4PCDuN
         mVCr3+rcb95tcGDQ2pM0Z3W/KlfGkuN3rysnVL57YSKjWbxA+d37SlXRl6VteydczA0A
         +P4PEfGGiBxtkM/CTtyxvU3OgfwnnRUNiouA5vud1D6xnJwPoSiy+pNIl5Euv0YYZWsL
         2wbSgTRF9oLjzz+reaRVnj/xSyCLeDXuJe1HiTgncZJXx/QYVH7odhAuTW92cQrh8oiM
         TCNRpahqS22ALACm8jukuWC2qySmc6IalfIOt+blGS5PFLQV0BQ3sT/RylPghRnniv34
         vT/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793788673; x=1794393473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=onAfKGASw105JYI87UHnMZzgOAw/UrE5Kfe5HtsiM5Y=;
        b=cZR2mnevvYDmfRerVxEkeaMgPkcsGxDINoumMv4KHqSKE135JPHViIkGorazIvZrZZ
         fMLjDJX4a2dBnY+rQlnnYpF1kivwLYcpmeChKLNHp4lZjJ9/5Y+mT9ufZKrKmlta69Xd
         ILKJAuKvLTLv1FNSlNEXgVyOdnw9JtUYO3evxHvXKs1g8bAgZsnTFMXUAm1/RGPRy7QU
         Wq+9M3WJEQ1aea5dKayTM0VwCssNYjQ227KLu5/VmtpccqVEl+WYrBnNY2MaetOp0xpn
         ZeKZG4qK19R2uuWsHfR5D4l+dq5G3WBNPb++gyvkmRDubkJgnbaUzKP6p4HaEAuihfdO
         4MDw==
X-Forwarded-Encrypted: i=1; AKwUvBz+Iet8+j+NMigFbCyeplyS5hpWqkaFJaobqZFvPS3FMkEtYggEKYH7SE5ygmMxV/K04YwumufWRMnf15w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SMzWpg4X2og90V1oZoYKi4E1RahMktdyBbQOSH0CUBRWeXGkx
	c1ryDw5lHOpoHDtET2VDnTl41L+E+2J8nh6R/R4jMjj3axkmv95C3jSE
X-Gm-Gg: AYBFou15Yo0dKMzNXyKZc2pjgxYuyKucJO92gtjByY2JzG6FDNR9GX1s4S03KlttA45
	cbEClGyHRvRktnsv4lltCj0/MvS+3NcZ/2zrysySiDcN4to4e2TcCg0MR+8n8haOxpcViyjmf18
	NtjsV0Mahv65X+gUBl/8Ou+GC6TG1c5ZLe+1ErrRhT7NnVhHfF+NTkhe0CNeSH2YP0nrppfJ7TC
	qoDcE8bujsfoIu7dxlpjzJ+azDJWktHLyxWzFYCr3vKr6eopXg8TFZwyiHjU267RGUU3qtcGNoR
	yVoUMxd9017kK7B77U1pC2988mke2aptJZRJNnOjQ42v30x0fNMKEvSpGUTD3XjkuX6pc7kTLHO
	V0l4fv3BbLjNM8Tjp/m6rH1ympWOggecuYnvUm/isux+EmUSK02yYh6kjCn1BhmVE1hKQ0DHJM9
	ILlbGkBHsP6T4O2v9Ag0gO9UifMke1PVUP+bsS0nn6FKLX+PcF7JpC3hACZM+Mo/AgbxfTpaKfQ
	szlpFbYSbDwHlFQGFbzM5qXYzEEk6V01zlJAfJAIh8vAGvX1RJBvjvoUoaxLVi8z+8ldqMN/zIx
	Ketfo7afPadre679oBL2z9dOTAg3KwOHhrd1EWjCRm2joHVvX2YBvOaFj0oFG3FWIBs/NQpfKzV
	oDDULDfGG8g8Zn5ArxOhl7dQ=
X-Received: by 2002:a05:600c:8b06:b0:4a2:d:5ccc with SMTP id 5b1f17b1804b1-4ac17b2bc63mr368842285e9.10.1793788673254;
        Wed, 04 Nov 2026 02:37:53 -0800 (PST)
Received: from andreayoga.wind3.hub ([151.76.4.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b40ff10f88sm36342995e9.0.2026.11.04.02.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:37:52 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Shuah Khan <shuah@kernel.org>,
	Rodrigo Campos <rodrigo@kinvolk.io>,
	Christian Brauner <brauner@kernel.org>,
	Tycho Andersen <tycho@tycho.pizza>,
	Sargun Dhillon <sargun@sargun.me>,
	Hui Peng <benquike@gmail.com>,
	Bradley Morgan <brads@mainlining.org>,
	Cong Wang <cwang@multikernel.io>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH 3/4] seccomp: add a helper to move a notification to SENT
Date: Wed,  4 Nov 2026 11:37:33 +0100
Message-ID: <20261104103736.71956-4-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104103736.71956-1-parri.andrea@gmail.com>
References: <20261104103736.71956-1-parri.andrea@gmail.com>
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

seccomp_notify_recv(), seccomp_handle_addfd() and seccomp_notify_addfd()
each move a user notification to the SENT state.  The notification then
accepts a reply, so each site must also wake EPOLLOUT waiters.  Both
addfd paths have missed that wakeup before.

Move the state change and the wakeup into seccomp_notify_set_sent() so a
new path cannot set SENT without waking poll waiters.  The helper asserts
that notify_lock is held, as all three callers already do.

No functional change intended.

The change was written with the help of an LLM.

Cc: stable@vger.kernel.org # 7.4.x
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 kernel/seccomp.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index ee94a071736ef..75a758128db2d 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -1125,6 +1125,15 @@ static u64 seccomp_next_notify_id(struct seccomp_filter *filter)
 	return filter->notif->next_id++;
 }
 
+/* A notification in SENT state accepts a reply; tell poll waiters. */
+static void seccomp_notify_set_sent(struct seccomp_filter *filter,
+				    struct seccomp_knotif *n)
+{
+	lockdep_assert_held(&filter->notify_lock);
+	n->state = SECCOMP_NOTIFY_SENT;
+	wake_up_poll(&filter->wqh, EPOLLOUT | EPOLLWRNORM);
+}
+
 static void seccomp_handle_addfd(struct seccomp_filter *filter,
 				 struct seccomp_kaddfd *addfd,
 				 struct seccomp_knotif *n)
@@ -1145,8 +1154,7 @@ static void seccomp_handle_addfd(struct seccomp_filter *filter,
 	if (addfd->ioctl_flags & SECCOMP_ADDFD_FLAG_SEND) {
 		/* If we fail reset and return an error to the notifier */
 		if (fd < 0) {
-			n->state = SECCOMP_NOTIFY_SENT;
-			wake_up_poll(&filter->wqh, EPOLLOUT | EPOLLWRNORM);
+			seccomp_notify_set_sent(filter, n);
 		} else {
 			/* Return the FD we just added */
 			n->flags = 0;
@@ -1600,8 +1608,7 @@ static long seccomp_notify_recv(struct seccomp_filter *filter,
 	unotif.pid = task_pid_vnr(knotif->task);
 	unotif.data = *(knotif->data);
 
-	knotif->state = SECCOMP_NOTIFY_SENT;
-	wake_up_poll(&filter->wqh, EPOLLOUT | EPOLLWRNORM);
+	seccomp_notify_set_sent(filter, knotif);
 	ret = 0;
 out:
 	mutex_unlock(&filter->notify_lock);
@@ -1824,10 +1831,8 @@ static long seccomp_notify_addfd(struct seccomp_filter *filter,
 		ret = kaddfd.ret;
 	} else {
 		list_del(&kaddfd.list);
-		if (addfd.flags & SECCOMP_ADDFD_FLAG_SEND) {
-			knotif->state = SECCOMP_NOTIFY_SENT;
-			wake_up_poll(&filter->wqh, EPOLLOUT | EPOLLWRNORM);
-		}
+		if (addfd.flags & SECCOMP_ADDFD_FLAG_SEND)
+			seccomp_notify_set_sent(filter, knotif);
 	}
 
 out_unlock:
-- 
2.53.0

