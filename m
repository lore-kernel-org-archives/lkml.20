Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110773E4106
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 20:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791578829; cv=none; b=DnyFCSy5H1p3oG+wVv7DTUGp0WScaejhRhiX2kGVYwTdFHudFEvlGI7e8/OQNyJuoGViYSBT6zNlly0g3TnHpK/PvZMTZJXOwsHiy6D69NY/xsUaZK2ZveyZP2+ew1dt3Un6MTgTpsMctYjSkqWkFafHM5JnldmOJ33Gwx+Ht00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791578829; c=relaxed/simple;
	bh=tiqiO0cZS3P0Du12CxaD6PNO/Jvwa6j401hWDJU2fn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p6oGfNurN4ncfUEzmB/9nW0XazsO6KUVcMgUIKlkw5ouaGeUjh+03RWcQLp3CQfKO4afygdgS4vG5KifotoTVQNNepl9VKKKCMcfjel6mNbd7rpbi3ofm65qhrf/lRJAD4PnCfw7sTDgA2qhVN4lHCLv/Z46ivt17KdheO6kSgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5rFaW/O; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5rFaW/O"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4f9b643b13aso179582b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 13:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791578825; x=1792183625; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wkTPM/U98JOjfbY2CKmLO5JUg7Voh1inPaDxV7wmGtI=;
        b=Y5rFaW/ODKi37pQ9uSuDlVCq9iF6p/olpmgM4bbpLVWMnSg+LGPjn8glsb8WcomivC
         D+udhMXxg/9AMkQsbE6q20aPQZnA/bfpj+ynDNnBSghQeyJRRrEteSFlak/+swTaTZ/R
         AujtC3XlqXX0UKFM8+hva+ZBOBMuFVu16ZHkaUT1BMr7aNm+EV/Y+/vLVeZJqWoSMDer
         F3vFLoSDLSqGp5Zp4ZXGZhT2pYtNhHzFWuRSg8J3/fRMTG7KTVYmE+YbCAm5v7BDscDj
         jd7TbmJJT5VF0fmT+ogg17oy5ugq7PASPfUJ4zJUojI70/iRrm3IokkXo1cDlTsTtviD
         L9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791578825; x=1792183625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wkTPM/U98JOjfbY2CKmLO5JUg7Voh1inPaDxV7wmGtI=;
        b=jjU9l/qnkqb+6Qrs6HyEvfMgPlQzOIPhDqyxZwUYGegAFauNGcNc1TjKjwafKG5iu8
         ij7TsaBGCUcHU6BAk1Ng2RpeTZ+PlQp3AUf69K3hFy7+rQPHIcXPhyDahF10OuTCamCg
         cMQPD25/MnzBWxAQFisxGaXyrhAnkgvkFef1QIpYd4LymWb4+wVz/YpQbp5Ikqtd0lSM
         HYFFF2YM9KhdXaJagTlhbafFttWxjjH2HtKHCfQ5qc5AkMJIsPVZjGd9IWZXycIyDQKi
         60UKmo5jsW3qW7qeCXKoawFTt2GYs0FtteLZLo48oz3Ncf+sEbc5MGkGV/zErRRSb7jx
         ehRw==
X-Forwarded-Encrypted: i=1; AKwUvBySo5ej8xQQwExI6p5+5X+oNCWJsR3p5m/ZlV64YmpbFzJmJbG5lz2d1i+KWahChkTG9jnnXAi13j1b1L0=@vger.kernel.org
X-Gm-Message-State: AFuF++n3+2UWCsL2fbbuXb1HTcLMONEceAoTl5hnDe5uyfAfBiPj2ajK
	YQCqs8IauUkMKJU8ELLOipaQx5w5ZwEd68XP2kWlplF8rdXH8jGQOIqr
X-Gm-Gg: AYBFou1FpYFFJjXVhLKPLib60n4ra4YXsOLtTFcgMuKHCSf+4KHIFJ5QnPQk+qw6PR+
	EkaAaMC22lflVs5CcyX7ALixjtcMCOviLJD7sOFc9DR5608LXeYeFgT+JO1tQO/5hPCulk1xAjw
	uPVV2bQqVu24z3JlLS+IOn1bVCRvgxucyC1/LWTi5PAquu9hN+HLlqPR89WVilehEgfHWsWPBQQ
	6b31SfhyscWqT7vd6QtSR8LuxMzXIORYcL0LCfgUXZGoLXQs0cxiHYG4RQEv5+n2/bS8h6Cq9wB
	8YS85QuHCMIXgk60Ux36Z53DFXTNr+toiM+GKzKU6B2IEpcXiINI4bGHMaSLaTDNwQWcx6jjKts
	pWyzYtqb8MZdMq7KVGsXyxSuCRpW1nSJRyvT2hBN3Rljp1uIHbxOsBxH809PsS7KnicfCY0fk95
	gcEz61jqByfSdEdHAWlftR+uIUa4EE1hSyZIx7IZG2guoCVdysrdmCVrD15vKlweueCbrF
X-Received: by 2002:a05:6808:10c3:b0:4fb:90ae:2b0c with SMTP id 5614622812f47-50c592a39b8mr2628241b6e.68.1791578825553;
        Fri, 09 Oct 2026 13:47:05 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:74::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a2a860102dsm2863606fac.16.2026.10.09.13.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 13:47:04 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Fri, 09 Oct 2026 13:46:44 -0700
Subject: [PATCH net-next v2 4/7] psp: add core tracked stat for outstanding
 tx keys
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-psp-v2-4-5596ab50f677@gmail.com>
References: <20261009-psp-v2-0-5596ab50f677@gmail.com>
In-Reply-To: <20261009-psp-v2-0-5596ab50f677@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.13.0

It is useful to keep track of tx_key_cnt: the number of outstanding tx
keys from the hw's perspective. Userspace can monitor this to
determine if there is a key leak (leak in the sense that some device
resource like an SADB entry has been leaked, not that the crypto key
has been exposed).

It also may be of interest to userspace if a device is approaching its
SADB capacity.

Only report this stat to userspace if the driver uses an SADB.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 Documentation/netlink/specs/psp.yaml | 8 ++++++++
 include/net/psp/types.h              | 2 ++
 include/uapi/linux/psp.h             | 1 +
 net/psp/psp_main.c                   | 3 +++
 net/psp/psp_nl.c                     | 4 ++++
 net/psp/psp_sock.c                   | 6 +++++-
 6 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/Documentation/netlink/specs/psp.yaml b/Documentation/netlink/specs/psp.yaml
index f3266763c325..d14c11d09891 100644
--- a/Documentation/netlink/specs/psp.yaml
+++ b/Documentation/netlink/specs/psp.yaml
@@ -190,6 +190,13 @@ attribute-sets:
         doc: |
           Number of PSP packets for transmission with errors.
           Device statistic (from the PSP spec).
+      -
+        name: tx-key-count
+        type: uint
+        doc: |
+          Current number of Tx keys installed on the device.
+          Only visible if the driver stores keys on device.
+          Kernel statistic.
 
 operations:
   list:
@@ -316,6 +323,7 @@ operations:
             - tx-packets
             - tx-bytes
             - tx-error
+            - tx-key-count
         pre: psp-device-get-locked
         post: psp-device-unlock
       dump:
diff --git a/include/net/psp/types.h b/include/net/psp/types.h
index 8ffc566cec2a..970801cb6502 100644
--- a/include/net/psp/types.h
+++ b/include/net/psp/types.h
@@ -90,6 +90,7 @@ struct psp_assoc_dev {
  * @stats:	statistics maintained by the core
  * @stats.rotations:	See stats attr key-rotations
  * @stats.stales:	See stats attr stale-events
+ * @stats.tx_key_cnt:	See stats attr tx-key-count
  *
  * @rcu:	RCU head for freeing the structure
  */
@@ -125,6 +126,7 @@ struct psp_dev {
 	struct {
 		unsigned long rotations;
 		unsigned long stales;
+		unsigned long tx_key_cnt;
 	} stats;
 
 	struct rcu_head rcu;
diff --git a/include/uapi/linux/psp.h b/include/uapi/linux/psp.h
index 1c8899cd4da5..21810e8a7229 100644
--- a/include/uapi/linux/psp.h
+++ b/include/uapi/linux/psp.h
@@ -69,6 +69,7 @@ enum {
 	PSP_A_STATS_TX_PACKETS,
 	PSP_A_STATS_TX_BYTES,
 	PSP_A_STATS_TX_ERROR,
+	PSP_A_STATS_TX_KEY_COUNT,
 
 	__PSP_A_STATS_MAX,
 	PSP_A_STATS_MAX = (__PSP_A_STATS_MAX - 1)
diff --git a/net/psp/psp_main.c b/net/psp/psp_main.c
index e118b8019e7e..9f256157d88b 100644
--- a/net/psp/psp_main.c
+++ b/net/psp/psp_main.c
@@ -169,6 +169,9 @@ void psp_dev_unregister(struct psp_dev *psd)
 		list_del(&pas->assocs_list);
 	}
 
+	WARN(psd->stats.tx_key_cnt, "psp: %s: %lu Tx keys still installed\n",
+	     netdev_name(psd->main_netdev), psd->stats.tx_key_cnt);
+
 	list_for_each_entry_safe(entry, entry_tmp, &psd->assoc_dev_list,
 				 dev_list) {
 		list_del(&entry->dev_list);
diff --git a/net/psp/psp_nl.c b/net/psp/psp_nl.c
index cdfc2d72fb39..494022ab5a71 100644
--- a/net/psp/psp_nl.c
+++ b/net/psp/psp_nl.c
@@ -934,6 +934,10 @@ psp_nl_stats_fill(struct psp_dev *psd, struct sk_buff *rsp,
 	    nla_put_uint(rsp, PSP_A_STATS_TX_ERROR, stats.tx_error))
 		goto err_cancel_msg;
 
+	if (psp_dev_has_sadb(psd) &&
+	    nla_put_uint(rsp, PSP_A_STATS_TX_KEY_COUNT, psd->stats.tx_key_cnt))
+		goto err_cancel_msg;
+
 	genlmsg_end(rsp, hdr);
 	return 0;
 
diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
index d21f7afd830a..c458bc551b4b 100644
--- a/net/psp/psp_sock.c
+++ b/net/psp/psp_sock.c
@@ -94,9 +94,11 @@ static int psp_dev_tx_key_add(struct psp_dev *psd, struct psp_assoc *pas,
 
 	memcpy(&dummy->tx, key, sizeof(*key));
 	err = psd->ops->tx_key_add(psd, dummy, extack);
-	if (!err)
+	if (!err) {
+		psd->stats.tx_key_cnt++;
 		memcpy(pas->drv_data, dummy->drv_data,
 		       psd->caps->assoc_drv_spc);
+	}
 
 	kfree(dummy);
 	return err;
@@ -105,6 +107,8 @@ static int psp_dev_tx_key_add(struct psp_dev *psd, struct psp_assoc *pas,
 void psp_dev_tx_key_del(struct psp_dev *psd, struct psp_assoc *pas)
 {
 	psd->ops->tx_key_del(psd, pas);
+	if (!WARN_ON_ONCE(!psd->stats.tx_key_cnt))
+		psd->stats.tx_key_cnt--;
 }
 
 static void psp_assoc_free(struct work_struct *work)

-- 
2.52.0

