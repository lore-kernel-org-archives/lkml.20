Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793689953;
	b=c47YDh3Gva5NouidtwWTg43LyqBxjPsdJuDtC/bgbes+gZr1jFQQqeqJ8NDvEqohUvd3
	 vQ71e0gmpxc7Wa4lvoJkD13CbOAtFjQmFDn4YAebiS8GtEh5dDcP3S05CE/4RvDT5xdQ6
	 uFpuS12r4IgmhrRVblHD+BXHxTeLL9hyeArQ8y/xEVyFpD2BN4vgOeR5Cy6PXYCl9MrvM
	 sycR0n/Exj/jKukGGPH8zKpGkyyzMkJyszJ8nkf6h5caQ20r/yR6GaEpubBttOPTH48nx
	 wMN5mLWUz/8cOOV+zaicnkJpjYoHnAZMEv/tETfbiwW6IkvL+w1hdL3ovWLDRzejZKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793689953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OfIBFKcwgYoWAWNIWo9NR6YEedzia1O6UyxuCj2s0bE=;
	b=ikEbntweX9yLge3k7gF6ym0Zt33nDWzokD7U3U5Bte2Mxf/vy/gSaHuPYyfw52GtPyxQ
	 Wv//2e7xuWuSGWXDwG2YUr9lvf5Omkh/j7cEy9jcHntxSmElLCNHgUdjrPeyf0r7LhtVT
	 cVt+KOyj8hVcmcRXugwWVvzzvE5h6X5AdXu9j2ai7ZSd3M5txBU2aYvJsjlK3GPyj7uAF
	 DdxJP3TSVJJYiqlo1syZ6VDPSOj9S2fudckcEe5g04ty7AtTvhTs2ZmZ6r3J43/a4KTGc
	 CYU7gTLGz9XpRRkyJb401gZQH0KkgmOlmHrQuVDhRyXIlFm/cVtn085EihNwVGKHm9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=remarkable.no;
	spf=pass smtp.mailfrom=remarkable.no;
	dkim=pass header.d=remarkable.no header.i=@remarkable.no header.a=rsa-sha256 header.s=google header.b=kRsKjm79;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649B0606A332
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:12:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 649B0606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=remarkable.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remarkable.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=remarkable.no header.i=@remarkable.no header.a=rsa-sha256 header.s=google header.b=kRsKjm79
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6af9a9451daso6111952a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remarkable.no; s=google; t=1793689952; x=1794294752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OfIBFKcwgYoWAWNIWo9NR6YEedzia1O6UyxuCj2s0bE=;
        b=kRsKjm79ytPxadXo5CH3NIvr8cel/rIXkiblgrh3W/MZYOT0nOJxeRA2rBFJcfPAUB
         EwL4cCDPmYmcDbB+1hRXYIpAMrha4CjgiMcp26ysG/USdwJ4ep3BYpDaxlyIuvpudhc5
         A5upDAC6uoip5dEwx4HJiGuacaiKaHSVO/C+mxcOt+n3R7m4WsDv9p/HVu2riXl9UxKm
         Ds+N6SvIzJQr1AZxAYN7L61BaQXuA8HIcCXYnR0OArgRyUVM0LWhD3+AK6e9h4rIvHrE
         BbviA26cVfPn6Zud7ZNqTTN1+CdRv/hQi7tV3k2/Qk58shS1ieS9tiRO+Rh8nDhGEuK+
         AmnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793689952; x=1794294752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OfIBFKcwgYoWAWNIWo9NR6YEedzia1O6UyxuCj2s0bE=;
        b=hSogye++udC5rj3u7RMJ+y9H+vnFgogRk85QiIpC4ksVPP93GYt45IYGUrFQSO07h5
         JTCT6cV6QKbJJQ/F4J9ThhQp3Fp5IkU2i8eznlGRYdBA4jRg/JGUGgpgZbCnlEnwbSy8
         q3H2nDTdojRcovRZeZXOnAYH1Acq9jAnxYrxLiLSAShA3FyLj7EmhV3xLk8o91htD9no
         +c2+aKSWDKWcGoY/3cVV6vHv/1r40Xbf7vTHOzfY3C0mYLSA0YEKpGyXClVkL0fF4sFm
         PxmxeVyUN5/HgoLDQCjhWU69W2U99J/zJcuy5v8bigSL7dDXFaY4ljCqt5yl7KnKM2Ou
         l7+A==
X-Forwarded-Encrypted: i=1; AKwUvBz2k2/eeHY7BLl7RlKtzK89qrA4ltQ4HawXEMvivJX6Tznsk/CkZ7rJzpBbgUqTMKQnW4s/tN9sDLmGRAo=@vger.kernel.org
X-Gm-Message-State: APuU4Z81HEk0O4dT7UhmnVpDLMjlQVe5+Y6Y3/N000vQiWbZa1h7lydC
	2sbUcneF8QDA9bzIHcxuz//Cgz4yqoqH1tYVXaP5UgEeg9h3cmL+UdeMuFDiq4zM5Ss=
X-Gm-Gg: AYBFou0WQxmVTXOEw9Pw0ZctY0CWeDlZVVu0/nsD6tJBV6FA6GVndb/Odv77E3NSFij
	c92MVElz8K1bQxnywx117ttcSguyGqsUJHKKJgk9jS2Y4FKJnTdvJsevrKeL7KUz7j2zCUIspvz
	FsmO9VHKU30jhYd8d8ZO4OOWK2QDMqUmUG03Wqm5SLDR/iKSc3dzTa4D10qgU7mu6sKlLIDi6mA
	YCIyUwWO0s58G96uNgAvDg1xeQ2/68Z8O6OGDTtyAtW96rcGnHmp/NvhcWXboSZts6YkltNBZp4
	cRq0aKiU2TS7ovOh/xqHvUrbXt/m1iKcJaEtK4i9qRNN3rpXi17fLpMoeG3vFTJ1KNd+yZYY+fD
	Gm4wIZZCdI5Fd/QR/g6upM/rY5GGPWvfUQ53RvGW3tVEs9JTSDXyVYk4r6IualdZ7/6WQlh9ea2
	iTmpE9CPJLeTktUCqlTKpAd/hcb2wY1ri7EraPiuS+pL2rk4iEPuhVgtSWpTeFBETRUEMChqxZZ
	vsMvq8emNN2XdPjI9En8T7nmE3japVcmmc7wPX3T/sfpYzkj6n6P4i1+tteZa4r1xCLVEpTuJw2
	cIT/AwN3QSWEns6kiF1WytDeoTcXbygY5Qvie67x/xjW
X-Received: by 2002:a05:6402:234c:b0:6ac:c618:8e76 with SMTP id 4fb4d7f45d1cf-6b4d4d6dc82mr8676361a12.16.1793689951912;
        Mon, 02 Nov 2026 23:12:31 -0800 (PST)
Received: from vkn-desktop.lan ([213.52.63.204])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9ee537sm3895470a12.10.2026.11.02.23.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:12:31 -0800 (PST)
From: Viktor Korsnes <viktor.korsnes@remarkable.no>
To: Jeff Chen <jeff.chen_1@nxp.com>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Viktor Korsnes <viktor.korsnes@remarkable.no>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless v2 2/2] wifi: nxpwifi: add missing header to HOST_CMD_CFG_DATA
Date: Tue,  3 Nov 2026 08:12:00 +0100
Message-ID: <20261103071203.1288146-2-viktor.korsnes@remarkable.no>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103071203.1288146-1-viktor.korsnes@remarkable.no>
References: <20261103071203.1288146-1-viktor.korsnes@remarkable.no>
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

nxpwifi_cmd_sta_cfg_data() writes the parsed calibration payload
directly at S_DS_GEN without prepending the 6-byte
host_cmd_ds_802_11_cfg_data header (action, type, data_len) expected by
the firmware for HOST_CMD_CFG_DATA (0x008f), matching upstream mwifiex
commit 9868c4ce9481 ("wifi: mwifiex: Fix RF calibration data download
from file").

Add struct host_cmd_ds_802_11_cfg_data to struct host_cmd_ds_command,
populate the header before the calibration payload, and include its size
in cmd->size.

Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
Assisted-by: GitHub-Copilot:Gemini-4-Argon
Signed-off-by: Viktor Korsnes <viktor.korsnes@remarkable.no>
---
v2:
 - No changes

Tested on i.MX8MM with IW611 (SDIO, FW 18.99.8.p136.0) using a 458-byte
calibration configuration file: verified via kprobes on
nxpwifi_ret_sta_cfg_data() that HOST_CMD_CFG_DATA (0x8f) succeeds
(result=0, action=1, type=0x2, data_len=458, size=472) and the firmware
parses and endian-converts all 113 32-bit calibration words from the file.

 drivers/net/wireless/nxp/nxpwifi/fw.h      | 10 ++++++++++
 drivers/net/wireless/nxp/nxpwifi/sta_cmd.c | 12 ++++++++----
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/nxp/nxpwifi/fw.h b/drivers/net/wireless/nxp/nxpwifi/fw.h
index 124728a72442..d4fe29faedea 100644
--- a/drivers/net/wireless/nxp/nxpwifi/fw.h
+++ b/drivers/net/wireless/nxp/nxpwifi/fw.h
@@ -2375,6 +2375,15 @@ struct host_cmd_twt_cfg {
 	u8 val[];
 } __packed;
 
+#define NXPWIFI_CFG_TYPE_CAL	0x2
+
+struct host_cmd_ds_802_11_cfg_data {
+	__le16 action;
+	__le16 type;
+	__le16 data_len;
+	u8 data[];
+} __packed;
+
 struct host_cmd_ds_command {
 	__le16 command;
 	__le16 size;
@@ -2382,6 +2391,7 @@ struct host_cmd_ds_command {
 	__le16 result;
 	union {
 		struct host_cmd_ds_get_hw_spec hw_spec;
+		struct host_cmd_ds_802_11_cfg_data cfg_data;
 		struct host_cmd_ds_mac_control mac_ctrl;
 		struct host_cmd_ds_802_11_mac_address mac_addr;
 		struct host_cmd_ds_mac_multicast_adr mc_addr;
diff --git a/drivers/net/wireless/nxp/nxpwifi/sta_cmd.c b/drivers/net/wireless/nxp/nxpwifi/sta_cmd.c
index c2ab32fc8e12..2536bc34f0a8 100644
--- a/drivers/net/wireless/nxp/nxpwifi/sta_cmd.c
+++ b/drivers/net/wireless/nxp/nxpwifi/sta_cmd.c
@@ -1425,24 +1425,28 @@ nxpwifi_cmd_sta_cfg_data(struct nxpwifi_private *priv,
 			 u16 cmd_action, u32 cmd_type)
 {
 	struct nxpwifi_adapter *adapter = priv->adapter;
+	struct host_cmd_ds_802_11_cfg_data *pcfg_data = &cmd->params.cfg_data;
 	u32 len;
-	u8 *data = (u8 *)cmd + S_DS_GEN;
 
 	if (!adapter->cal_data || !adapter->cal_data->data ||
 	    !adapter->cal_data->size)
 		return -EINVAL;
 
-	len = nxpwifi_parse_cal_cfg((const char *)adapter->cal_data->data,
-				    adapter->cal_data->size, data,
-				    NXPWIFI_SIZE_OF_CMD_BUFFER - S_DS_GEN);
+	len = nxpwifi_parse_cal_cfg((const char *)adapter->cal_data->data,
+				    adapter->cal_data->size, pcfg_data->data,
+				    NXPWIFI_SIZE_OF_CMD_BUFFER - S_DS_GEN -
+				    sizeof(*pcfg_data));
 	if (!len)
 		return -EINVAL;
 
+	pcfg_data->action = cpu_to_le16(cmd_action);
+	pcfg_data->type = cpu_to_le16(NXPWIFI_CFG_TYPE_CAL);
+	pcfg_data->data_len = cpu_to_le16(len);
 	nxpwifi_dbg(adapter, INFO,
 		    "download cfg_data from config file\n");
 
 	cmd->command = cpu_to_le16(HOST_CMD_CFG_DATA);
-	cmd->size = cpu_to_le16(S_DS_GEN + len);
+	cmd->size = cpu_to_le16(S_DS_GEN + sizeof(*pcfg_data) + len);
 
 	return 0;
 }
-- 
2.53.0

