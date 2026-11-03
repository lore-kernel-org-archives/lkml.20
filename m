Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793746478;
	b=eTDQZXV8/on9pvn4RnOoHD7U9RoThg7AtvJF5H4Q2bC92EqC8Q1Exolxu7LH0wOHi942
	 zVnn4xl5sxNqNGw8vUnLjuBPAjRmAzuvsO7ASozjOr1Yg7UNXDUoRIjSNl6EPTkhZD5KX
	 hi1rZD4f2NegO2JIkUaAaLe+IIVS1jvKhucwMr1//kcoHKCq4Q8Lr3m0cuI2Lx1fRDoKW
	 F3hoVJlYh6pnQwWwNN26tkGOq38nPhGih0k/n/TRn9UkFMjEofeXzK8kgzC/UB6q020ze
	 NUSuEBQoGAJdhlkxnZoqcf0irFiUeIikhGUHBVvH7r7RPgjk4ljOX/0nMaq+ozVe2pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793746478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xbkQk7xEpPULe6XnGsruaXsaytLDEuTXeVWS47gy+VI=;
	b=U38xe7sL05TO+NfEl3y2b/LfLFylEorN9ZI4XlkuoLZSLzP/73ByzY81ncTge20/C72A
	 XHBu4QvOSoWXfkaCl5+Ben4k3iS4AtD+GSId0oa+0Fgfsc1YyNalA9iGBeZPWR407EWAn
	 4+GXnt7ysVL3Lh4oNW5Ht0BJ12WC9N83KSXbJH/ak/UrHv781KgweHaoQ5hCO+3DlwMrC
	 B+YG/tKsqyaqXd8loGXzh9mysljjMulkUhI3mIGssNppC1rXBvrbmpZqNhv4jFIoOE2ki
	 KSU52G8lgko+FisQ2YunoKwzSfE8GeSHVFJqoY4To/PX6KHAnk/hadK3oirIgn2oVsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z1PMi9ue;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4F8606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB4F8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z1PMi9ue
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e0d1da913so1334f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793746476; x=1794351276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xbkQk7xEpPULe6XnGsruaXsaytLDEuTXeVWS47gy+VI=;
        b=z1PMi9uen9u+BceBTw1Bp4O0O7qibnTFDOvdW2V9nxpKU4T9mq+UORihIspufmyTuq
         +tKmHO8DN62tY6XJr8BmuYWcrsZjZgMF5xWwbyfa0I/1XTlSpKMqbZN/DuS/4+qWaYeU
         fycn+8p1uPLbG2ZDQqILoavc/uVH0hNirHD6zd2MJ1D8ywza/m/iKd0jOswE5oC1HDO/
         qknO+nhNoexLQ9b04mCwrGVYx3xiw28kX8W+MYhhPYMfovDHJT9SoHttev+WWPzIQ7Ur
         xttrjiiTXFx9zV8xcGs5+jbkodiZ4mNGMV3z2OoFT5ANiQUbXb/HvIcWtOQQ6Dm8Xw/5
         +J/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793746476; x=1794351276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xbkQk7xEpPULe6XnGsruaXsaytLDEuTXeVWS47gy+VI=;
        b=Ep+oB2K+ZlpGY157gk7Q/i0Nr7iqJvNR4o7Zrp+9jduUluHECoRgnBCd+A0Rr73CUB
         +/wu3wg8XcWGtXIZInwrmGW9T8xMUfOitkm8vYRYmBZAfOcUvcqoVGeWacjXZqXw12a/
         jUgh7235pdSitS3cvaPmLXW4DcBwDz4iUjt9MunPGcvZSVwzzFfx0Ym5uzLUJ4KqZayD
         3vw6yDz+c+ye0hb8mGK1Faq2OrGoIRg9KLHV58T+w2KvI02afBo+7jfzxYAO5gdmYYVc
         2FeXKORYXD8O3faryFnEoLihVE2dC2Ay6M3Nb44pFZHkVkgY1JY1g8r2y7BJ5VTzPlCf
         840w==
X-Forwarded-Encrypted: i=1; AKwUvBw/eTGGCPpgNIwQ/9qepWTQD7VP3ANtkxq2BtzMznt7N8VxtgUo4RxbUHeNyJ0ZdUscJVwThdQjNz76ZSM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UjXkQ6vWf15nLUAKPnRIC/IE8tDyNMDiqQZNKzUY2LrpcZwl0
	twPSVdH+7Tk8X39tag1EYJOUuU6Ao86PUc+fmDDSHDshZEw32UN8Pd4=
X-Gm-Gg: AYBFou3Bmah0U+EMje72YOHe4hsoKX8ZQsbgswUL9DvXK/13he2lOGvWlloZvljnd2v
	f7QPe+Z/R1B26YLTqJDoznby+Ezc293LlGw/MYUPIznRj14hae+FC8KXIz0WAq4SHsk0ODvGHEI
	ZwEtQMvlpW8o5uoixq1Lf+KHGGe6rv9wpQ0lAAe0X7upQr319OBwqJCdfo0FK+H1e7C8sS8p0N3
	1QmAk/3W7SnyMTn/ZHTXaoCoYtWMLfRg+QbBLYQL+jPGg2zon2LrIIGyzG4WpFJSPwsSVFmNUvS
	SKFoaMfWk5MlKrTjv+98KN5a4SS8mp9Nb/wsAS/DGZ52v6fa6dv84ktMbwqB262oyfb15WE7Itb
	tTit7MZ9Gu8KiP/UmvyNagYDYQszF9TwNHpfTpuDj21OF60xpjdaAGisEr0lge+TdFC3fBUkO6H
	zTGHF8D8cA0feuILL/CK3bJ/4Cu6MyG37iKIVRMVCnihk4HauvU2HsqNaZQ+tiZ1W1fXChK6wek
	W4nIn3j4iveBbFa84gTR4ERtR8YZafnusjHozwUGJRNezVZ3sKQZ5LxjvbpROdr1NZvasxO+1Rw
	gkbrjAH0LQtLtJN926Q=
X-Received: by 2002:a05:6000:3101:b0:48f:bbb5:61c2 with SMTP id ffacd0b85a97d-48fbbb563a3mr6323217f8f.4.1793746476097;
        Tue, 03 Nov 2026 14:54:36 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fece99b33sm413768f8f.23.2026.11.03.14.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:54:34 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Jon Maloy <jmaloy@redhat.com>,
	Tung Quang Nguyen <tung.quang.nguyen@est.tech>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: Richard Alpe <richard.alpe@ericsson.com>,
	Ying Xue <ying.xue@windriver.com>,
	Erik Hugne <erik.hugne@ericsson.com>,
	netdev@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH net] tipc: fix division by zero in perc()
Date: Tue,  3 Nov 2026 22:54:33 +0000
Message-ID: <20261103225433.2663943-1-tristmd@gmail.com>
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

The perc() function divides count by total without checking whether
total is zero. When link statistics are queried on a freshly
established link that has not yet exchanged messages,
TIPC_NLA_STATS_MSG_PROF_TOT is zero, causing a division by zero
in tipc_nl_compat_link_stat_dump().

Add a zero check to return 0 when total is zero.

Fixes: f2b3b2d4ccbf ("tipc: convert legacy nl link stat to nl compat")
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 net/tipc/netlink_compat.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/tipc/netlink_compat.c b/net/tipc/netlink_compat.c
index d9a4f94ea2d43..75f3193a2a6cf 100644
--- a/net/tipc/netlink_compat.c
+++ b/net/tipc/netlink_compat.c
@@ -497,6 +497,9 @@ static int tipc_nl_compat_bearer_disable(struct tipc_nl_compat_cmd_doit *cmd,
 
 static inline u32 perc(u32 count, u32 total)
 {
+	if (!total)
+		return 0;
+
 	return (count * 100 + (total / 2)) / total;
 }
 
-- 
2.47.3

