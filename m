Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A153DB980
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 18:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791313150; cv=none; b=t32yMuLcnB/rytjOE2kuEc45979XjvpWzVX8LJ4MFB+2QgLT9hYjlbQtMSJWnI+4s9DGTTig0SweW7p3Sw2tzY2m4zpvNwcpdQ28HcXBUDp4MNCYth6N7tK3/BhN9g6XLtpId+zFhYJVlRJ15I+fO2lTpctJAjYneQvuIcZ82ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791313150; c=relaxed/simple;
	bh=tMLsN85UXT6wrJkZlsJXgWH8LDuK7i7RwaHmL8NY3zA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BX/HalFzu74MGODA+NTZog6wglYF2KPkuuJrqy/OWUs7fsCo6eBbB0kDiffI8/pPOpMKS7guWum1gxP/rH4kOtQsolYknfio1g5akJ/nKNqw67sV6Zk7Lps951eRhMe0i/x+YUFk/gnWjtJnyMEF91lRj4M+mivmqTK1lnYMsQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gTk3faZn; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gTk3faZn"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b0f534161so365448f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 11:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791313147; x=1791917947; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VbBKq5PTG+zTXJMhfDnHYLmZDkMnD71kksXBsqcRR9A=;
        b=gTk3faZniuOOApM1Cn1z/p05mDicIPrZGv5HXiwbyhx4OHizma9UB8LwKz96hDH9zo
         wMV2SpSmds3DlW1Bkd7aoScIZxvl0swNspmKKp0GwIlfsDgVqs4t5lyozj0hPH2OmmlF
         69PeCFOAZ4MxRtchKKvUl3rbXmBPRO0bKY8fHWqabWiC+Yv3DXe1wLFhdTYZwVgXEw+2
         We/FfXgHx7ZO4USKq0wV8fgXGPdWsLq7nzLIOLNWCuZ8LygMD98sSrtOSbdm3E+n6ux4
         CpMwZ/i4Ww2erAShwcVbTP4xPCaqJswwzZJzETjLjGNq9s3fsLPTGuqjlGB4+3pN/FLj
         hc/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791313147; x=1791917947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VbBKq5PTG+zTXJMhfDnHYLmZDkMnD71kksXBsqcRR9A=;
        b=01mvrISqymJWoyOh0YdCEgHZP2l+KEJkKJXRdktF6/VhTMv75XiyhBtEFJN2BWekly
         RdwmhTylG0ECMF4GxZLWMD6sk+t8K4SrxWZVkqfdq4xYNg36IcHgFaBtaNPu0wgoNN+u
         pfvqryEwxtjgdorhMALTkfxQsvwTxgcDgoe4C9u6hF6XzjLeHUKuIuRhAZ/iyx7uUReg
         1msvGMcZp9r/gyPCL/VY3DM8kZq91vYYXwrVzCDiCPKEh7yrWp1yQqD+gcPyimvC75F6
         I+oz7jGctn3bpXrLnvTLqf/OscljrBYTALSq/01GffspNLsc8CWzZZ5mr5AAIS/eGyA9
         2aEw==
X-Forwarded-Encrypted: i=1; AKwUvBzRAeaRSVCwLyJbS+qulpqaczsgusSsOF5W1OYiHaAgSyjQ+7rKriun43cKvT3vh9uPbe0s023Cr89znpw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAz8reBoakl/iYYPmizHc0oNGlZC4g3qK1mxFy3WqDE5olVew/
	D6BtYV6dafyWmOikwPT9Wmg7oMLJirresWtwYEgHOxORdyr+88skrww6
X-Gm-Gg: AYBFou1/kgpTjyKO0Crd/ZFXILu8rfFlO6vdOenbr36loM1o7VS2q5qQjyvcFKz/f9Q
	On/iUsX4K72cYI/wm/yJfGUIJCX+3uN+/gshk6i7uamsNZNo1onhhJJgKjXXUSItjbTDiGVGb2A
	0+gokdJhP8CvQD6pk7xGchnfvP/ifNxi78woPkc1VjSSOB4arVus+8RrcoPon8NyrolYiSqD/Ll
	F3IvoL8Axl0LB36ZIUMqcVt4H/t5mmK61SXspqmzt8jbn0lCexi+1ySUTJ9BGJHNQ4+O9mytOMm
	ZR2o8+YXNcm91ZSfTPRzukFmAI1I/9pllW08UYkH0MLF9aUbiAT0L50HSX8byBsPqhiTi6vtoxH
	sslrT7BWgMwKYBu633c+pm+P/eYXBoPJ660H1gYifXqyHNj/ip6wm2z+t2GpkLZbEty3yttaqho
	UAgqOX1WxZ8Wo60zx08QQUAMYNATEwVnrh4IQ7drP+2FAKCY9GQ3oM
X-Received: by 2002:a05:6000:4810:b0:48c:4802:e253 with SMTP id ffacd0b85a97d-48c7288f1eemr562307f8f.6.1791313146607;
        Tue, 06 Oct 2026 11:59:06 -0700 (PDT)
Received: from localhost ([2620:10d:c092:500::4:4701])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71c0b604sm1150678f8f.13.2026.10.06.11.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 11:59:06 -0700 (PDT)
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Tue, 06 Oct 2026 19:58:29 +0100
Subject: [PATCH net-next 1/2] netconsole: avoid printing partially updated
 target attributes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-netcons-fixes-next-v1-1-231cd26f8c51@gmail.com>
References: <20261006-netcons-fixes-next-v1-0-231cd26f8c51@gmail.com>
In-Reply-To: <20261006-netcons-fixes-next-v1-0-231cd26f8c51@gmail.com>
To: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gustavo Luiz Duarte <gustavold@gmail.com>, 
 Sashiko <netdev-bot+sashiko@kernel.org>
X-Mailer: b4 0.15.2

The configfs store callbacks all serialize on dynamic_netconsole_mutex
but not on the read side, so reading an attribute while it is being
written returns a partially updated value.

Hold dynamic_netconsole_mutex on *_show() callbacks to avoid racing with
writers.

The dev_name_show() callback can also race with
netconsole_netdev_event() writing to np.dev_name due to
NETDEV_CHANGENAME. So it needs to hold RTNL in addition to
dynamic_netconsole_mutex.

Reported-by: Sashiko <netdev-bot+sashiko@kernel.org>
Closes: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260814-netcons_ipv6-v3-7-bc0915e8c75f@gmail.com
Closes: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260928-netcons-fixes-v1-0-bb5ffe5e698a%40gmail.com
Signed-off-by: Gustavo Luiz Duarte <gustavold@gmail.com>
---
 drivers/net/netconsole.c | 62 +++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 51 insertions(+), 11 deletions(-)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index 267254f046de..188beacb308d 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -859,7 +859,19 @@ static ssize_t release_show(struct config_item *item, char *buf)
 
 static ssize_t dev_name_show(struct config_item *item, char *buf)
 {
-	return sysfs_emit(buf, "%s\n", to_target(item)->np.dev_name);
+	struct netconsole_target *nt = to_target(item);
+	int ret;
+
+	dynamic_netconsole_mutex_lock();
+	/* Hold RTNL to prevent racing against netconsole_netdev_event()
+	 * changing np.dev_name.
+	 */
+	rtnl_lock();
+	ret = sysfs_emit(buf, "%s\n", nt->np.dev_name);
+	rtnl_unlock();
+	dynamic_netconsole_mutex_unlock();
+
+	return ret;
 }
 
 static ssize_t local_port_show(struct config_item *item, char *buf)
@@ -875,25 +887,39 @@ static ssize_t remote_port_show(struct config_item *item, char *buf)
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
@@ -906,7 +932,14 @@ static ssize_t local_mac_show(struct config_item *item, char *buf)
 
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
@@ -1342,7 +1375,14 @@ static struct netconsole_target *userdata_to_target(struct userdata *ud)
 
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

