Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621974;
	b=lYGiFOOR/T8WXu/FPalTcbY+EBodkqVkP0Ygq1r/iqMmG8h5mFHEXxkeJTVmExsJHt7i
	 BiJWHj/wdZxA54VVAbdYkPrIP6dHnRDSDMUHxWg5mTv2DrZNT4rGEh4jgdid7q27dGkxX
	 qhFGOcWJj+JHMFcUKKadJUI6U2+tyOTZtcjYIcDL03Fjp96DuzIIvOWhaAAW7MEoXGiUf
	 q/W75rsTgGoKMB+5vMWcC2R9o59XcWPsjMerwL/bFmdFdClJ7sMLpp6ue67wuKIL+StlI
	 rIsDM3pys3c18JRMF/A5NTKkem1AXmjGF7HRoghcDF1C0ZZ18fEoAw03hAF9BfehGKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NOwKFTDoEguLb3kIIHfznAhArwn4FDch8KZcfkKCFSQ=;
	b=qy34niHmldCOmljWkMcyWxg6IvG2fU7gFXR7SoNRf2bL0LAdicjldGAlpz2kKBYWltU8
	 TwUGGMrKXOhbno9qmDrpM7NgIcaSpBos7zOz2d3QDyPDh9qWGI95lbjlRfeBS6NS8DDaj
	 cQt6h0yoLRuc5exNq/I0NbWuVuC8VQZN/CnSmS24pWee1BK9TxhqoNfuk/3phYF24N3l7
	 32PZsK5rTxjB4VuZNY5kbyyx5V5bLpJNnhv7QCwAC9TX36GZ+O3KVvHtB73wVxy8MUm5c
	 4/8w9Gsw8es59NvwIhpN+f+gAP1KGtsL6AXONQbhZ8Y1FSxTbNV8nwmmoS8MNy6FK3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=remarkable.no;
	spf=pass smtp.mailfrom=remarkable.no;
	dkim=pass header.d=remarkable.no header.i=@remarkable.no header.a=rsa-sha256 header.s=google header.b=FyN4u5Aq;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3415C606A84D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3415C606A84D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=remarkable.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remarkable.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=remarkable.no header.i=@remarkable.no header.a=rsa-sha256 header.s=google header.b=FyN4u5Aq
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c411e139259so244999866b.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remarkable.no; s=google; t=1793621972; x=1794226772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NOwKFTDoEguLb3kIIHfznAhArwn4FDch8KZcfkKCFSQ=;
        b=FyN4u5Aqva1CpQZyIrjtbRqokvPeaCfdwazIeEWS+Q6H1J1wVqsjWNQR5bECcBlnr3
         yExLuqdVEPM7ILYbZszmI3/buLIiZnKtyjQiElIdX3FpsWXkEPuWqWh+SFYeWtUr06KJ
         gFqzUSaHCl5cn9AhALgmanUIDciCdHRPXwhqz/7sUyII0h/ire/a48OY+10Uhch5ZECT
         Ruu9pk7lRo3Z6fA69Z6aTDtonMzD/1otKa8YJXYk7hlSTlrKEiSVhWjzceFGMcFsEpVF
         eKcqWvhgzh0BNlf/TP+DBjFojFhnGE2KL55UaGAZf8YgtDAoNBsWjkDReDhy9ccqGAVv
         StYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621972; x=1794226772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NOwKFTDoEguLb3kIIHfznAhArwn4FDch8KZcfkKCFSQ=;
        b=iGjQexOrRqtvI+y7TTLSeRBZyhg2GAqG2/XVmK2m4lkdSx6MdfQka5As5iGKk+uAwk
         t980s2Tcka9Jc5rIXtzfO/C4bAh76CEeXmj6JTwtT3sxnoIo34ljvnJwlKgTc+xx1GZX
         oBUlSOryXGdzdUv0xKynVgwDgDi4z6lgFM47GrTpHmPQHPGyLB8MgRvKqliSCbBT4kQ4
         WFrSFPE1VDz3blnGK9SFZDDgo76bvbiWiIyfCUTj9OAWh8EeWWL/EySQMH8mFVnZKMH0
         VHfxuNf7eITnmTbk5PtEL9S9agDN1iv+jQ2xMoOEvkcwVlqXkJXYmV49D40hMBiX1gyz
         gFNw==
X-Forwarded-Encrypted: i=1; AKwUvBwQPHG3HyvbLyqs16nhtEHHm1y0cqQ8nbLwXrkjaSghjZt9h+FnI/ZKzHh3G47Rq3A4j9TLe5zBMsK7+t4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIs42XpBW0pvUnuohupw2TY6xCBlfb7vw3CAwgSMe3XBUmUJ3LC
	eHfV6rL3u5DhMe2aLo3KV9dwLIHvZ4bV9QNMTYKkbEpvRfedTJd/OIQ4yZ7/y7HNZRx3yylPqpp
	itf7fYs0=
X-Gm-Gg: AYBFou1LEVUCPsrh4L6CHwZ9cb2DHJBdBv3WyJla2OlK+0LnuziuKRNwq80JcfniSi/
	7r/jCcROApAGGrpOyclp2CV8JdpvJuXvagFXujw+SrWtCom14inU53w72nc6bXRfVLGx9InKjXA
	zaUjwYnRkgoTixsPDu8FotRkE6AEzLTijqqRQOgcDxJvtF7uYxFQ+MF9Z8SeODQ8tQI5kuL76X0
	7QTa03kzfGJUyc0/tC4YZdsIV48rSESFAK1VF36uQoMBHS35AS3lICD8Jl9YtolUrpMv3DSGyDg
	4vCvN/O2DESsAEARwGuk6423JBMadaNKmZJzfMemAVVthI9HOOslIKTwTzn1rlZ9HrO6r4rYEym
	Ja/Ar8OQjF2URjyB678MwAl6vw8wDbzA1rMEySEOSEv5xe5Wr4Asdu3ptDMM8SIrsPyIvjgnvAr
	oatUItcRW6/l6JlPtlY2edGoiq6PPLJn6skml6QSEbJEXbrplfAoxnBEWhcSmoS7EBuzSu9Sdfc
	KWx/LGE8UD5oaxdGqXkX0Btk+ag/xm85SDCDJ9unxig9tZF3+p6wyqsMWky430I353bB/gFabtR
	c6MWoDW0WVvlEg1GW+TRt4Yv0jYfKbJKpieqLG9jqfbO
X-Received: by 2002:a17:907:7294:b0:c42:fc8b:6c7a with SMTP id a640c23a62f3a-c4ca7b601d3mr772506666b.41.1793621972466;
        Mon, 02 Nov 2026 04:19:32 -0800 (PST)
Received: from vkn-desktop.lan ([213.52.63.204])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfd22bsm378293666b.28.2026.11.02.04.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:19:32 -0800 (PST)
From: Viktor Korsnes <viktor.korsnes@remarkable.no>
To: Jeff Chen <jeff.chen_1@nxp.com>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Viktor Korsnes <viktor.korsnes@remarkable.no>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless 1/2] wifi: nxpwifi: fix hex parsing in nxpwifi_parse_cal_cfg()
Date: Mon,  2 Nov 2026 13:17:59 +0100
Message-ID: <20261102121856.1011263-1-viktor.korsnes@remarkable.no>
X-Mailer: git-send-email 2.53.0
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

nxpwifi_parse_cal_cfg() passes a pointer into the raw firmware buffer to
kstrtou8(). Because kstrtou8() requires a NUL- or newline-terminated
string, it fails with -EINVAL as soon as it encounters a space after the
first byte, causing nxpwifi_parse_cal_cfg() to return 0 bytes.

Use hex2bin() instead to parse each two-character hex byte, bound the
output buffer to the command buffer capacity, and return -EINVAL when
no calibration data is parsed.

Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
Assisted-by: GitHub-Copilot:Gemini-4-Argon
Signed-off-by: Viktor Korsnes <viktor.korsnes@remarkable.no>
---
 drivers/net/wireless/nxp/nxpwifi/sta_cmd.c | 23 +++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/nxp/nxpwifi/sta_cmd.c b/drivers/net/wireless/nxp/nxpwifi/sta_cmd.c
index 5e8ffd306b31..f3cd5a51c438 100644
--- a/drivers/net/wireless/nxp/nxpwifi/sta_cmd.c
+++ b/drivers/net/wireless/nxp/nxpwifi/sta_cmd.c
@@ -1391,7 +1391,7 @@ nxpwifi_ret_sta_mem_access(struct nxpwifi_private *priv,
 	return 0;
 }
 
-static u32 nxpwifi_parse_cal_cfg(u8 *src, size_t len, u8 *dst)
+static u32 nxpwifi_parse_cal_cfg(u8 *src, size_t len, u8 *dst, size_t dst_size)
 {
 	u8 *s = src, *d = dst;
 
@@ -1401,7 +1401,8 @@ static u32 nxpwifi_parse_cal_cfg(u8 *src, size_t len, u8 *dst)
 			continue;
 		}
 		if (isxdigit(*s)) {
-			if (kstrtou8(s, 16, d))
+			if (d - dst >= dst_size || src + len - s < 2 ||
+			    hex2bin(d, s, 1))
 				return 0;
 			d++;
 			s += 2;
@@ -1423,14 +1424,18 @@ nxpwifi_cmd_sta_cfg_data(struct nxpwifi_private *priv,
 	u32 len;
 	u8 *data = (u8 *)cmd + S_DS_GEN;
 
-	if (adapter->cal_data->data && adapter->cal_data->size > 0) {
-		len = nxpwifi_parse_cal_cfg((u8 *)adapter->cal_data->data,
-					    adapter->cal_data->size, data);
-		nxpwifi_dbg(adapter, INFO,
-			    "download cfg_data from config file\n");
-	} else {
+	if (!adapter->cal_data || !adapter->cal_data->data ||
+	    !adapter->cal_data->size)
 		return -EINVAL;
-	}
+
+	len = nxpwifi_parse_cal_cfg((u8 *)adapter->cal_data->data,
+				    adapter->cal_data->size, data,
+				    NXPWIFI_SIZE_OF_CMD_BUFFER - S_DS_GEN);
+	if (!len)
+		return -EINVAL;
+
+	nxpwifi_dbg(adapter, INFO,
+		    "download cfg_data from config file\n");
 
 	cmd->command = cpu_to_le16(HOST_CMD_CFG_DATA);
 	cmd->size = cpu_to_le16(S_DS_GEN + len);
-- 
2.53.0

