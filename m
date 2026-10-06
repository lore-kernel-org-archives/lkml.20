Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307F24AA3F4
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 18:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791313151; cv=none; b=M6V1cn981pVUB9QySv4t7775UVNesV63DQkl7GV3hwfMpY4H/S+OQ7P9MkY8Vn9Tpm/c7pojffthQ6EXrQ2NLq8ypdNgMwZ3vg19qK0rUcOsHIK3otLF9CNiYN5l4p1wyfvosSiSSq66YW+NJDn41eWxY8gmy8MJoSHVIr/KkWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791313151; c=relaxed/simple;
	bh=x9osHjTkkxHenRC3xuwNxDLG48HR3gP9JCYzWuIgq1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aYhkzOXdc7DOMpPR1hqN64j/CW8A7JpC0BpFZYog1a2qgEno2pg84KSpMPUqTJF113rf5zvvHU07VqRki7JMSq9/Bd6DVRF/jyNgQ1Nx55ng61sPiSlGPKxP6OtEq3L7PDvvCGrAcRbROzjaLT1kodxUujH6unnE6hTp3Xn4J9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUCUUu+d; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUCUUu+d"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b02f47696so375005f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 11:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791313148; x=1791917948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sOZRF8MJy2B3jN9+BZ1SftBQ154KCD0egCHuRKb+Ja0=;
        b=QUCUUu+dijZQmwvMPT1HA4qbZCoM2tT1vmGW1FP0hSCA/StJMrmHibrMTsqPFa/qmc
         rh2eeK+mjWyTYC7CidOLuhh27GSuph2t0AjJl1TQl8pJEdPee+w9P/2jiWfoxfyCDhJ/
         gP50pdanfdTJqIj59iX6HFLhSef5ZgOwof8V1ksSgh/rL+P9wW8ihP/o8k/iYr8SC28t
         1zoI+IgdbaHDk7ZQW4wysh8nHo6G4d8iVLHTgNvPGKLEIo5c+H4ntw2Qppj+QWydxQ4g
         3LoaAwoFqERGlu7v7z8u6B+xIjfSnr5srId4UDrhaJqo/RB1AyEqCsT71isJtpeJcwzY
         UM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791313148; x=1791917948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sOZRF8MJy2B3jN9+BZ1SftBQ154KCD0egCHuRKb+Ja0=;
        b=LNNKiMs26bQw8svhhPsR7wTOcDait+iPIysOquSJhmvGhT9qMx8gnuHxNLP+1Uiq6p
         jHu60yyOvHXAwuH2ssVMh9mUJogU7Hc92Sk//ealpfJ6KqgbAMlGbO8i9aCgmIkD4i6e
         +urMgdhicPxWPn4bbBWEj/RuBptAEyGT80bsmrlG7et0vMnrUEYLaQ5geGWTE8waWKZ2
         F6sCVJuLTMQA3HHK3N6yAOLWbdnIPdHlpEIonaHTWaSvgjH+4cTNin4g2uu+nbGrqc8c
         ko64eGLS1xU8z7DXBZv1+4UpAzjJJ8YfXD3VoSuOfJpDCcTxtPMDNL7ywQ1aKLbX9GVj
         Avow==
X-Forwarded-Encrypted: i=1; AKwUvByUknfkUsBhMOE8znH/zcMCLqbCpn+drxTi7IFT5pim+kbwTIxCi2gc/i6DYi3naROjM7NNfvl8SRaIbxo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMxSUtxV2EU2MgP0V4Mj1yINKZQBwRdBhhHKoWy9AhTrRg4E36
	R9T8eMs3fwzMdO1dszHVWS4pZsM0gE1nax+FNH20Ufj9Mx3CVxipTgH6
X-Gm-Gg: AYBFou2cLeI+ybtH4vDPdinVKqZcjmChbo3pJ06Hz6R1O6AzZVqFh4I7kL48YHWj47T
	F2S81M9F1bfA/hp2zZ8QR6uyByFMgbryaW1R2/b0s1eT4itjUCULZTg8cOQMAFRILyJ9dRlOPR3
	ID6swnOnnDgt9q33jK9HM+GJLQkqBwq5VL8EQFKCaG57p/MI1pEnU26KUxWF8Tk8kPkAXkDbYTx
	nqunZZPXx2vAaWh3pEPrZdcI7KcxvxyrmPnCMKB8CTWY8Ke0JCSMvUkyIK7JzJi1OPghwpYyTMF
	JHFQjV/ZF8OVv7av0SdyJsptzkrchQTbexRVRvDFyUKtDpNIxfQ7iIUU2gDHdrehkA2aYnJuWRV
	UkuTdPU5m7wMONZY0wBt7KDnfCXzTlhfbf7zWTrNkHep8J5EHgCLJTUWV52jwAgisOMroBpIlNP
	Y3uIjm3EWZCPh0fr1Pw+D1f+psuGHtXG5ck/UwpC/QL207shGgSJWa
X-Received: by 2002:a5d:5d08:0:b0:48c:6611:82 with SMTP id ffacd0b85a97d-48c726eeb98mr624395f8f.1.1791313148341;
        Tue, 06 Oct 2026 11:59:08 -0700 (PDT)
Received: from localhost ([2620:10d:c092:500::4:4701])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3b502sm1125420f8f.52.2026.10.06.11.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 11:59:07 -0700 (PDT)
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Tue, 06 Oct 2026 19:58:30 +0100
Subject: [PATCH net-next 2/2] netconsole: remove unnecessary target
 refcounting from the netdev notifier
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-netcons-fixes-next-v1-2-231cd26f8c51@gmail.com>
References: <20261006-netcons-fixes-next-v1-0-231cd26f8c51@gmail.com>
In-Reply-To: <20261006-netcons-fixes-next-v1-0-231cd26f8c51@gmail.com>
To: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gustavo Luiz Duarte <gustavold@gmail.com>
X-Mailer: b4 0.15.2

Since netconsole_netdev_event() holds target_list_lock, there is no need
to also protect each target with netconsole_target_get/put()
refcounting. There is no way a target reachable from the target_list
would go away while we hold target_list_lock.

This is similar to commit a6d403ac9689 ("netconsole: remove unnecessary
netconsole_target_get/out() from write_msg()").

Since this is the only remaining user of netconsole_target_get/put(),
remove those helpers as well.

Signed-off-by: Gustavo Luiz Duarte <gustavold@gmail.com>
---
 drivers/net/netconsole.c | 31 -------------------------------
 1 file changed, 31 deletions(-)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index 188beacb308d..ddc5fcf19fe6 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -262,23 +262,6 @@ static void __exit dynamic_netconsole_exit(void)
 	configfs_unregister_subsystem(&netconsole_subsys);
 }
 
-/*
- * Targets that were created by parsing the boot/module option string
- * do not exist in the configfs hierarchy (and have NULL names) and will
- * never go away, so make these a no-op for them.
- */
-static void netconsole_target_get(struct netconsole_target *nt)
-{
-	if (config_item_name(&nt->group.cg_item))
-		config_group_get(&nt->group);
-}
-
-static void netconsole_target_put(struct netconsole_target *nt)
-{
-	if (config_item_name(&nt->group.cg_item))
-		config_group_put(&nt->group);
-}
-
 static void dynamic_netconsole_mutex_lock(void)
 {
 	mutex_lock(&dynamic_netconsole_mutex);
@@ -300,18 +283,6 @@ static void __exit dynamic_netconsole_exit(void)
 {
 }
 
-/*
- * No danger of targets going away from under us when dynamic
- * reconfigurability is off.
- */
-static void netconsole_target_get(struct netconsole_target *nt)
-{
-}
-
-static void netconsole_target_put(struct netconsole_target *nt)
-{
-}
-
 static void populate_configfs_item(struct netconsole_target *nt,
 				   int cmdline_count)
 {
@@ -1979,7 +1950,6 @@ static int netconsole_netdev_event(struct notifier_block *this,
 	mutex_lock(&target_cleanup_list_lock);
 	spin_lock_irqsave(&target_list_lock, flags);
 	list_for_each_entry_safe(nt, tmp, &target_list, list) {
-		netconsole_target_get(nt);
 		if (nt->np.dev == dev) {
 			switch (event) {
 			case NETDEV_CHANGENAME:
@@ -2009,7 +1979,6 @@ static int netconsole_netdev_event(struct notifier_block *this,
 			 * notifier.
 			 */
 			queue_work(netconsole_wq, &nt->resume_wq);
-		netconsole_target_put(nt);
 	}
 	spin_unlock_irqrestore(&target_list_lock, flags);
 	mutex_unlock(&target_cleanup_list_lock);

-- 
2.55.0

