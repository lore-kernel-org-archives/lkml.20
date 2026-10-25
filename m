Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897610;
	b=Uai3TeFwXgWM4NB2ok/e3FDPwZAa2qUczCSD577ph7JkLzOIGifIAuAtAxlPx20Znhbi
	 oJ+v9MKOsJv2gMcZnzAbWKC74grBpfIagltuhS6UuEzERLK927wcvNB9+1etkYnfEuldL
	 tJABF257xuhyMCCGGO5NkZqJojiDJ6uwc+QfY/51s58REjUq7Belq6YraC4I68BXMKAwu
	 ZH4b4dmD9dcmU21Zl3q+f5vMOTSA6/nEyh+vmeRw3EC5BUe9jYDTKUXK2iMZMTpng3sRe
	 OrjP1nf+0pVqsWt6Wj9oJndeMBhUYz8LUq1lae2wJxzEk+4IN6yvnC4s2RO6CvGO97w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ENk4A+RlULy01C+nr6yI9DTf6CQ3igs3yO+YxFh8EPU=;
	b=Qs1XE9quhPDeVwaZ2agfVP41/g+Fn6E2LwCzfmmriKv2pFBP5LgdAHm9pVl6w9dqPKRG
	 smcglCbSd46Ra28qg+bv+mO3+EIrB9nJGTThZ//jyeuuU/a6x1Xze9ieDFtkxpjzGvAFA
	 Gjgv2te5KKZOqSwDHvEEd9jJw6gqdVck9RTbI6pz0VW6HNWdTey3cMVtx3WvqCDmJIRhC
	 Sv/IBfTUtxfNUSfa5/E2ocCyPBHj7ZTDzPTw4j4TP13WnOcxANo5izoIduC7H0zA3h6XE
	 NNuXAr2lLt7c2ADfmnfNHtnvkvGuPQVtqW55jAWqgnnFOLAbodA6LTTev9zvQV2W0Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xqu1xBTL;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F66360A261A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F66360A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xqu1xBTL
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36681e85e87so1520337eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897610; x=1793502410; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ENk4A+RlULy01C+nr6yI9DTf6CQ3igs3yO+YxFh8EPU=;
        b=Xqu1xBTLF+JuQ1VnvXwa8sjTYzw1pmgo9tVPnnvFep/n2EWpGWt9KaN/cq2BFK2vGv
         gchptLZ+QWw3Ct4fdYIdhBy8NfgZr7AbBPVLDP1G6UlFMIboIcfPv7xfSOeJfAKpkAbF
         svsolpB28HyfQjNuLdG4Nt2YyjE3TVts4nMx0nzn03v1BKaKqZaQ9ztCtKPQP5SD/OV6
         /TWLZnGJMQqEBbiHMKJNFzEGjpFkID5NIwA1ztbybAvrvWGS7ES9cr1aMFYecAcmPHz4
         wcf0zgs59upkwOYtsdrpxeHokh+bMCMl5rdq/kKO4P/4kUp8QmdshtsHhrXY/5aymdkC
         oVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897610; x=1793502410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ENk4A+RlULy01C+nr6yI9DTf6CQ3igs3yO+YxFh8EPU=;
        b=rxL8m3Eh97MPOIzYo5rwtlCn7ceFynQLIvJ/bCi0/qEV78gjDHZ96HdeqMkvKmhDE1
         WliT2CBA3m2TRJHh/3LvJ2/Ntk1XrzdJQEzas7ttiwPmJXhhKRoZtCqcc7fjPG6vXcIV
         6f+3yz9kiyKWoLMp3IQEkz63dMIYUq7w1XDpLiESd6IQGnNC+nyZdbN5uQX9Wx7OfbhE
         EPmcVtiP/qaZcsC2j8dLl5HtY6ZWYuVR+SJ+AbvgG8eK5I5YYqmOAAxXHu0svrxtn1ly
         OEXuXUb3WvXO9k/82uIgxcreqhwDGn5Aaa2mk7GB2vMVGVUDlIRKGbkHk79NP6W+XcRX
         MvkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxiDpkHVEzy6w5BTbwPDTriNAvIi/nMMRKHiGU+hm8HpA4zftWuRxIxg+dNXsmVbJs9xqOSDvfuLARYl9g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdtHjuBArR9m1B07LqW2upWptfCSDYE5NNfJ6I0AgEn0bGh/YT
	y/QrcVDjJQQpxnrSAlZTHLrRXNIZ7j0FzpoDOPP+wbCLfGm5F3UONCUJ
X-Gm-Gg: AYBFou0QE6Sod8MMlZzsjpSta0SY9qnLLTXMyTeCKLCyfXejGHbptTV0CchSriGdQCC
	9WkHYD59NJaehqFEG5DXBzVeTiTTDR7nbrdRTVoXim8LJqjWDt5SAYRak7NWDQjkWLPERNmr3ZJ
	XyATA3fDDkhKujMFY/Cmv7eDT7EAJWW3RoShfwoHZdU5OOn8Y0vL9adbqFX8MQI+SVgV8+1ZNun
	lIOK3IZ4J8c5Ux5eOJCTOcWGiMUncvabEIpA+zkRDNq9x7Y5fvINS1gxQRm2cxz9j6BU3Pdbs3u
	6toblQuvAFYb6/E4/jCxyJh/4WkwfaO1QaQC8KkIYM/1tbEE6PlwtbGr94I6AV6pELRjoLBb1oD
	COyQz1utghqLqYPShpTD48GA4X23/Hkw9xOyCSVb5VpUkuHGH66BePoVhGSkql/+Qz2/6RU51j/
	SQZ6sk2nomTOt8hxRwgi4udvN3IwI1Lules9nYdDlR8oc0HMvOdw99rzm5UVeNJ/cN2eh/gBSBH
	kEj2SoWbfHP2oAtpXLLALCFSWPEjoDSoslXxmQlXBvO4PSZs8clALgL9CdYt5nDia/Xo5u8gqc6
	bNZhV9lMUjucopwKM+Z+dve/bksm7PY+SVB4qve3b69l
X-Received: by 2002:a05:693c:66cf:20b0:369:f18f:34ab with SMTP id 5a478bee46e88-369f18f376amr2468251eec.11.1792897609664;
        Sat, 24 Oct 2026 20:06:49 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:48 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:32 -0700
Subject: [PATCH 29/31] hwmon: (pmbus/ucd9000) use 4-argument
 i2c_smbus_read_block_data()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-29-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Andy Chung <andy.chung@amd.com>, 
 Ninad Palsule <ninad@linux.ibm.com>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Robert Marko <robert.marko@sartura.hr>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, 
 Daniel Nilsson <daniel.nilsson@flex.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Pass the buffer size to i2c_smbus_read_block_data() in
ucd9000_get_mfr_status() and ucd9000_probe().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/ucd9000.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index f76c2913c9ca..2645d3e78e3f 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -390,7 +390,8 @@ static int ucd9000_get_mfr_status(struct i2c_client *client, u8 *buffer)
 	if (ret < 0)
 		return ret;
 
-	return i2c_smbus_read_block_data(client, UCD9000_MFR_STATUS, buffer);
+	return i2c_smbus_read_block_data(client, UCD9000_MFR_STATUS,
+					  I2C_SMBUS_BLOCK_MAX, buffer);
 }
 
 static int ucd9000_debugfs_show_mfr_status_bit(void *data, u64 *val)
@@ -515,7 +516,7 @@ static int ucd9000_probe(struct i2c_client *client)
 		return -ENODEV;
 
 	ret = i2c_smbus_read_block_data(client, UCD9000_DEVICE_ID,
-					block_buffer);
+					sizeof(block_buffer) - 1, block_buffer);
 	if (ret < 0) {
 		dev_err(&client->dev, "Failed to read device ID\n");
 		return ret;
@@ -565,7 +566,7 @@ static int ucd9000_probe(struct i2c_client *client)
 
 	/* Everything else is configurable */
 	ret = i2c_smbus_read_block_data(client, UCD9000_MONITOR_CONFIG,
-					block_buffer);
+					sizeof(block_buffer) - 1, block_buffer);
 	if (ret <= 0) {
 		dev_err(&client->dev, "Failed to read configuration data\n");
 		return -ENODEV;
@@ -602,6 +603,7 @@ static int ucd9000_probe(struct i2c_client *client)
 						  UCD9000_FAN_CONFIG_INDEX, i);
 			ret = i2c_smbus_read_block_data(client,
 							UCD9000_FAN_CONFIG,
+							sizeof(data->fan_data[i]),
 							data->fan_data[i]);
 			if (ret < 0)
 				return ret;

-- 
2.56.0.257.gf7497c7d27-goog

