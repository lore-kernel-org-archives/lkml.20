Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD9B37F330
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618475; cv=none; b=ebfqdyAHd9msfZ9qhFcLnLgqDgHqXhOvNpIeOLfpwihPkxbMMDD19PUGuxVfvHkJokxQ+3SUqO9S8Cgyadrki/0MRTyBt2xz4dN5dfq0XOQ/96T3J2kBMBZLlugGOCpbY34Lbp81RomXRD+gunN63619zP03aAtz8ILXjakYGq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618475; c=relaxed/simple;
	bh=MLoOgdgamwvKpLuHxrXRbyWeQguYU9XHzrGDgAYZM8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pgAltfLQG0CSL1vIgQ66asln+JtjGYPpyc8tNiT1a0BUD83G7+TIun1bLnv+iBZWVXQlJBK7sr/EyfnWFAsB544Ql8ae/3ZFNY+P8k6xt96Z7zXLKlQJ/10WF4DzfTX0wDi+J/uwpsK71lRFRyAJyf8RT8DrIltWKWZkVC6X3eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pS28ad27; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pS28ad27"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-488837e7eccso335030f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790618473; x=1791223273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yzM+wuGo8xGnnJ9h7U2YxWtdWl494XOm0tmOIUnpiXI=;
        b=pS28ad27xcYcIGB+bOGbdOYkglLdOHMCa34e85c9d5+JX4Ng2+avM9irla5ccxhNRo
         oex6RV8RWBAS2jHLJgnhKO1qYom6oErmUygl8QXMAGElcc1aoAlRUce8E0uepIyVogpP
         i17xx0py6LisYqlgSyVFYTnDJQ1trQbhfC2ucUbDvBlGd+rX2G5pJuwZTHOgYJ7mrMTB
         34NBeT4mDdNxCStcVWx6qE2i1I1Xs1/g0i80exlyazoEv1VtDsRmmSpf3/0dQdHaAZEI
         99sSuUYaACtSlDq1FXb/wTmacVIetIli0tqiNgvmh3iuog4Z7LX47HqNWDERw4er07Ql
         u5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618473; x=1791223273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yzM+wuGo8xGnnJ9h7U2YxWtdWl494XOm0tmOIUnpiXI=;
        b=qeHDbwP4HoKTGX7cF5grwHEH4YwnQ9etuGFAN56y6kiNX8InyWZD/p+GFgJjT6vVrC
         GgKZBF22NxecdWwgJzOld4FQjISmBTlIqqHNGfbYggt+PtdndApY6SYsLHrJwcNFwmZ1
         A1xo1lRrDaCmsahxthuL2lkuRqJRDatHpAO0WMGEGPUawaPRxHq862suUjfu1t826kiG
         vSEMMxyMyL9aRG9LQPA65neZDZFu6mNqKZ4nr/99Q+5WA2YaztFp3XNOjoVK0zRupimj
         G5TdpYC7PGwxHn1y9kTfV3uWBW2azsmE+Iuk6dO24Rt8qMyYF9uoz43XlNthXvJWoCer
         ZdfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnNT04Iyar/e56eYxqb77NbZejWQin6lW18OWdgdbW0RcXBYYnoxzSrcLPV3fNVF/+hT8HxE+ZhyenZBE=@vger.kernel.org
X-Gm-Message-State: AFuF++n65jwr/GLG/uAChTuXLH2Bq7xpl07rJP7fQghKSQqSaY4XFPEC
	8LPJtDeKxtFTrCfSzKmxSFjhmCc38dFmoUhCsCa/ZQkVI9PueB5Q2MTQ
X-Gm-Gg: AYBFou1Rs3znDo/wWAUwu4aoOV9Q6Ke+N7FmNScpjcvYcnLMecF7oMrKtCOCbyNcK5A
	avfA0fhvoVJFjco2x0r6C8Npvq4tpuoZbcplKoS8OknYppBekrsYEpTvK1UZ75hIB38JPAUFKm+
	9/yNsRRxOXs7F4qfyzhaGjj0/x4mLMyU1NAQrY1ZGbabCk1vtsmxO13KzU8Qk8fAx6xAvIQdSq+
	A0x64y/c9v05bHCMGDW5XcVxjW/bRut+FWRr+J4FkxR+nglVGYWU6zw14znROsDWHR79O9c8EPB
	2IbpFB3NRs0hbqBJJQBCkxB4/XcKnvzYNyBix5rbuvl6BU5+QOchuuh6H75KtRNQHidPhXIWma3
	VmK/2C9gMeJRQ3bA84YpInwgxhZRoULDDEvLQbKcuZNnOs5gytKNyudsjy+XtogKAPw4DkfqRLd
	0G1EZQDridAwph3rSmGvihCoqxP3AZIwNWhALbxqskRQoV93y+IshrtezGskloJAE=
X-Received: by 2002:a05:600c:859a:b0:4a0:73b:a222 with SMTP id 5b1f17b1804b1-4a0073ba3ebmr29396585e9.0.1790618472590;
        Mon, 28 Sep 2026 11:01:12 -0700 (PDT)
Received: from localhost ([2620:10d:c092:500::5:c231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00c10c656sm30484605e9.2.2026.09.28.11.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 11:01:12 -0700 (PDT)
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Mon, 28 Sep 2026 19:00:05 +0100
Subject: [PATCH net-next 3/4] netconsole: avoid printing partially updated
 target attributes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-netcons-fixes-v1-3-bb5ffe5e698a@gmail.com>
References: <20260928-netcons-fixes-v1-0-bb5ffe5e698a@gmail.com>
In-Reply-To: <20260928-netcons-fixes-v1-0-bb5ffe5e698a@gmail.com>
To: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matt Mackall <mpm@selenic.com>, 
 =?utf-8?q?Bruno_Pr=C3=A9mont?= <bonbons@linux-vserver.org>, 
 Stephen Hemminger <stephen@networkplumber.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gustavo Luiz Duarte <gustavold@gmail.com>, 
 Sashiko <netdev-bot+sashiko@kernel.org>
X-Mailer: b4 0.15.2

The configfs store callbacks all serialize on dynamic_netconsole_mutex
but not on the read side, so reading an attribute while it is being
written returns a partially updated value.

Hold dynamic_netconsole_mutex on *_show() callbacks to avoid racing with
writers.

Reported-by: Sashiko <netdev-bot+sashiko@kernel.org>
Closes: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260814-netcons_ipv6-v3-7-bc0915e8c75f@gmail.com
Signed-off-by: Gustavo Luiz Duarte <gustavold@gmail.com>
---
 drivers/net/netconsole.c | 57 ++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 46 insertions(+), 11 deletions(-)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index 5f4311726d11..627475f16383 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -861,7 +861,14 @@ static ssize_t release_show(struct config_item *item, char *buf)
 
 static ssize_t dev_name_show(struct config_item *item, char *buf)
 {
-	return sysfs_emit(buf, "%s\n", to_target(item)->np.dev_name);
+	struct netconsole_target *nt = to_target(item);
+	int ret;
+
+	dynamic_netconsole_mutex_lock();
+	ret = sysfs_emit(buf, "%s\n", nt->np.dev_name);
+	dynamic_netconsole_mutex_unlock();
+
+	return ret;
 }
 
 static ssize_t local_port_show(struct config_item *item, char *buf)
@@ -877,25 +884,39 @@ static ssize_t remote_port_show(struct config_item *item, char *buf)
 static ssize_t local_ip_show(struct config_item *item, char *buf)
 {
 	struct netconsole_target *nt = to_target(item);
+	int ret;
+
+	dynamic_netconsole_mutex_lock();
 
 	if (nt->local_ip.family == AF_UNSPEC)
-		return sysfs_emit(buf, "\n");
-	if (nt->local_ip.family == AF_INET6)
-		return sysfs_emit(buf, "%pI6c\n", &nt->local_ip.in6);
+		ret = sysfs_emit(buf, "\n");
+	else if (nt->local_ip.family == AF_INET6)
+		ret = sysfs_emit(buf, "%pI6c\n", &nt->local_ip.in6);
 	else
-		return sysfs_emit(buf, "%pI4\n", &nt->local_ip.ip);
+		ret = sysfs_emit(buf, "%pI4\n", &nt->local_ip.ip);
+
+	dynamic_netconsole_mutex_unlock();
+
+	return ret;
 }
 
 static ssize_t remote_ip_show(struct config_item *item, char *buf)
 {
 	struct netconsole_target *nt = to_target(item);
+	int ret;
+
+	dynamic_netconsole_mutex_lock();
 
 	if (nt->remote_ip.family == AF_UNSPEC)
-		return sysfs_emit(buf, "\n");
-	if (nt->remote_ip.family == AF_INET6)
-		return sysfs_emit(buf, "%pI6c\n", &nt->remote_ip.in6);
+		ret = sysfs_emit(buf, "\n");
+	else if (nt->remote_ip.family == AF_INET6)
+		ret = sysfs_emit(buf, "%pI6c\n", &nt->remote_ip.in6);
 	else
-		return sysfs_emit(buf, "%pI4\n", &nt->remote_ip.ip);
+		ret = sysfs_emit(buf, "%pI4\n", &nt->remote_ip.ip);
+
+	dynamic_netconsole_mutex_unlock();
+
+	return ret;
 }
 
 static ssize_t local_mac_show(struct config_item *item, char *buf)
@@ -915,7 +936,14 @@ static ssize_t local_mac_show(struct config_item *item, char *buf)
 
 static ssize_t remote_mac_show(struct config_item *item, char *buf)
 {
-	return sysfs_emit(buf, "%pM\n", to_target(item)->remote_mac);
+	struct netconsole_target *nt = to_target(item);
+	int ret;
+
+	dynamic_netconsole_mutex_lock();
+	ret = sysfs_emit(buf, "%pM\n", nt->remote_mac);
+	dynamic_netconsole_mutex_unlock();
+
+	return ret;
 }
 
 static ssize_t transmit_errors_show(struct config_item *item, char *buf)
@@ -1350,7 +1378,14 @@ static struct netconsole_target *userdata_to_target(struct userdata *ud)
 
 static ssize_t userdatum_value_show(struct config_item *item, char *buf)
 {
-	return sysfs_emit(buf, "%s\n", &(to_userdatum(item)->value[0]));
+	struct userdatum *udm = to_userdatum(item);
+	int ret;
+
+	dynamic_netconsole_mutex_lock();
+	ret = sysfs_emit(buf, "%s\n", udm->value);
+	dynamic_netconsole_mutex_unlock();
+
+	return ret;
 }
 
 /* Navigate configfs and calculate the lentgh of the formatted string

-- 
2.55.0

