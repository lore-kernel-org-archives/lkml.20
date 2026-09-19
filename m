Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8853932D8
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789854766; cv=none; b=R7wpqPqGGnkw/G3gI1nlJ1vCQINJzJPQFom+ZiKYuyoz8EhLBliygq1h3ITZdPLxBiq8X7a37gxFIvIWlahBXEJsZ65hKJo9UUWS57lKMFvLYea3Ud3flt0kIw55IQKkZK3WwsW8BybNBW1bHhi6oBdOPzIzIXiTN/eBpxMhHUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789854766; c=relaxed/simple;
	bh=SSPkRM0WzfBTi0eIJHbJXjPIs6gJOKdjQWdjuukdecA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HSIEvFk5DL53cMyKaIRaKjTILVopB5/MQiCPYwOvIGzamp1QO4b2AWzQh8m5gx/sTVBZPvPVapeasvD7x/uTcu5RKySYD17oHLzI8mGsP6YG4r+S/WOiDb2VwC6uiSnUxo5i7hWFqFFCddFn6J8XcWPNoR2/55ljDKrHb+Yblnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+eV4opM; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+eV4opM"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so1644572a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789854759; x=1790459559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FiIS2HG9Xt+NjPTHwM6X6IVVzmDXuxKrK9MYOq1fq70=;
        b=Z+eV4opMXp4wzh7l1hVsNLYidrXkGzoZSrV/zvM27yW8ktr9MKiSXD2zXH4Py5DWB0
         XnZxAIC5y1jB+GyIpiynlfIsoDG4hDCZcZ5RKP+29ArF2eXS9tLIxuyBLISThpnySmWa
         ZbmIYgkCJkYtnY26vp+PhN9o5ica0Kk02YqiqYG/A2HJbdMyZvOJJrJABPOZ0E24X3t4
         LvuodhNKEIXeJwyBfkLEmvIvyFza0LM1MC5/3MomOAa8oLvISXu4Yyq0yzAIyGBrxf3z
         G5paFMujPvmzG9Mbh8htkGRjs1q2sjJaRunLDKd8mSI6gtVjmdbOsXC05VpzWEpPrbqk
         nrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789854759; x=1790459559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FiIS2HG9Xt+NjPTHwM6X6IVVzmDXuxKrK9MYOq1fq70=;
        b=omOgDQZ/Wi7tFmrp7HkYrJ0Jahg5DlD/Vgk/nmgBPmAjUVwZu8JNWPDdcJr2EatZdK
         IuUlIn4la6rDSLCHrSsohFW5zg18QsK/Mf1OvR/RaWYUYYAh7yPwq3Jvf0quSm8QB8nC
         LNGBE2t/Z2WfCRR+0hWb6iow+cmnuGq3Kz/RKhGsLHATWqWUpdn/uRKyXoNnBx7/PRhP
         qFIH1ndjY/HaNZK1dKrJJZcdOuoS25Rb+/mWfsjeSgjbSD0Yr/Nnvha5NuyFZRXdk7Ow
         m+vDh0saDRIQ8mXXdKD49HXV5XNJnYkYkM3wQO+01V+m3jWLC1Q40Je/bhq9LT/iTX7M
         BsQA==
X-Forwarded-Encrypted: i=1; AKwUvBxOJDDw/qI08E83zM7dfAGRquZLUTlA03oTHOUpKERzmSX3cc+x8BYWAAWWg2pVYYrQHUxD1ajTutuZJeI=@vger.kernel.org
X-Gm-Message-State: AFuF++nBNkPqdj0M1T7lwsSfTDDvrjfHz6dvZHfO4faxrwPIdKcecW+g
	lACuMHJhp885BeSaIeVDV49JS63QVKd8UDfIGl/oC0/E6SQGBl5R+Q0w
X-Gm-Gg: AYBFou3PvYFJlOtqRpHsd+ZFb3N1w08TEFpAPEfw4SYYaruWCnVEzAzZCr1bBsK2NE3
	DsOdQMFTofq8QPmggN2jhXsnUoRfQr1rvQvdFC0WIQov6u4DIT/bl1nqInWuHpORmoC2rNjN9yp
	891RGu3U2ZIlQadPBiXlTWp1KU355+q9XsFadSXZIbKER2jdpt2/6PBc+SItlOvgB2mBdV2QwCE
	NoqViZbQR1mT4ysKrIL5AS7J6/lURct+qj9P1guwHMhzDT85X/4aMmGQRJODySuLQ36vlzdxbry
	3zKx0OdBmKPEXbFUx1qNnWrGWpJpxrPEPRf/8f0PsbGljCnTX3EKGqTzSQmePSMK75TS4plR4DP
	GaLAOWzIdSMRER0od5hNo8MkBuc3unsyJT2f2NutpfyiEfrHbcveIYalnpIEFQQUCExE9bxc7bz
	dMdGBzBJbmjUO1gb7+ghb1nLCU6O08nfnTbjf0jtdGATfIdFNuWQxCluQ/Y3072ZqtDwgmeyX1B
	Pfaab9GyPxO/18Azo0sqc4RpE7XpgkGRaPjq7uN5+YJDqpsWA27irw2pVYNSzQKq5YXb1/VwwCs
	w7IiyYITyw==
X-Received: by 2002:a17:90a:1c96:b0:39e:6bec:9eee with SMTP id 98e67ed59e1d1-39e6beca109mr3160708a91.12.1789854759475;
        Sat, 19 Sep 2026 14:52:39 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a023e44854sm1830886a91.4.2026.09.19.14.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:52:39 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	kuniyu@google.com,
	willemb@google.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fou: reject FOU_ENCAP_DIRECT with protocol 0 to prevent sk_buff leak
Date: Sat, 19 Sep 2026 21:52:38 +0000
Message-ID: <20260919215238.3471141-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In fou_udp_recv(), returning -fou->protocol to udp_queue_rcv_one_skb()
triggers IP protocol resubmission when fou->protocol > 0, whereas returning
0 tells the UDP tunnel layer that the skb was consumed without freeing it.
When a FOU_ENCAP_DIRECT socket is configured with FOU_ATTR_IPPROTO == 0,
every received packet returns 0 from fou_udp_recv() and leaks the sk_buff.

Reject FOU_ENCAP_DIRECT configurations with protocol 0 in parse_nl_config()
and drop packets if !fou->protocol in fou_udp_recv().

Fixes: 08d323234d10 ("net: fou: rename the source for linking")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/net/ipv4/fou_core.c b/net/ipv4/fou_core.c
index 5e867f1b5c1d..3fc087c808bc 100644
--- a/net/ipv4/fou_core.c
+++ b/net/ipv4/fou_core.c
@@ -77,6 +77,9 @@ static int fou_udp_recv(struct sock *sk, struct sk_buff *skb)
 	if (!fou)
 		return 1;
 
+	if (unlikely(!fou->protocol))
+		goto drop;
+
 	if (fou_recv_pull(skb, fou, sizeof(struct udphdr)))
 		goto drop;
 
@@ -696,6 +699,9 @@ static int parse_nl_config(struct genl_info *info,
 	if (info->attrs[FOU_ATTR_TYPE])
 		cfg->type = nla_get_u8(info->attrs[FOU_ATTR_TYPE]);
 
+	if (cfg->type == FOU_ENCAP_DIRECT && !cfg->protocol)
+		return -EINVAL;
+
 	if (info->attrs[FOU_ATTR_REMCSUM_NOPARTIAL])
 		cfg->flags |= FOU_F_REMCSUM_NOPARTIAL;
 
