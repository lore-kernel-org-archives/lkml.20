Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897574;
	b=aV7GFvvE2fn3WCNSqReqIV3YAdlVIpwka2rvCJXAqCZZBkxhPA/7XxJ7wZGREOGS1tll
	 5we7UEzK5s5qJCafZErzfKJoHXkvUeC8wL31FixYNzytOjBRJvo0QhGdnTL5wgTODK9fe
	 ZG0EEe5qzUZnvlyZ35y+nxs1z01agxuLE3UykDBeerbl2h67/0bZuj/SISJWsK4IwULq9
	 42usuqe7BAR5TFghydWZo7svAAxmhFqJGX3FGF5V34iJsEcYFIvpSAcJT0PDX2j4v40ce
	 fpVztaVOga+2vxk9FI029ZDxWuWCKkFYeTSkxzU7/B5MWC2tIMOb0X2zFtmPybEyNHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=mwnvOx73d1ku66N7XjhN6sBeA5of7cWYXLsPW/HqYxY=;
	b=PWm3q1ezX027K3jaE1mzP93MPKFRvp6BndC966ifbiA0RFX0PjMn8OZHDdtrwGDX91z3
	 K7lGkcUGLUAM811jbLmXPU0DuuCiyXWHnj85G6WiFkFck2wtd45Uezr8J6sWEonZ9Tlyt
	 //zfW8DJ9SANPmUjk0Fw6+PjNagNj6LRclFo5PFByocV30sTPCVW/kP8yvi9X72c43dNH
	 YkBgQPiznIDEXJ5s3OW53I27YFhNqevsmHVQM2Yv0IP0M7PL5W6j1M7UQ+JFSGlH8nUiv
	 pz1AA/QYu8g6ZQ2+ZvTQkGV9DCj0VfSSFAkszyZqD3hPdRJ2N1anZKrYxsgPpJDZKRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="f8/jou0+";
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E501C606A335
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E501C606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f8/jou0+
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3535a54bed9so3213281eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897573; x=1793502373; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mwnvOx73d1ku66N7XjhN6sBeA5of7cWYXLsPW/HqYxY=;
        b=f8/jou0+9Dl2rlDG3pvpfcXRWFgjLFworrVfNF7G+VT7wEZq9o+5yJR8yidwn9Z/Rw
         WnwUTAibnt3h62mFYjfwDwLW/Y2Hw7PaEXlwRzm9KOTGgAFEijlAkZDGM9DtshCVDH8u
         omtQ+qy1/fpt0eZ2uA0LIC4ZaYf8y29+z/Q1WyXxvKkFgEMm9+dQO10d0DJS6+sipXs6
         Wye8u9hr77QHbp9WqL7yfhTPk1Xbi996hR/d6qW7MwwC461NFp0I5CNJORTboES/0kNw
         0az9GCK3/18KrFDJIr/yK0p8/Elo9nI8sKzZCqhiYpFKGsnieESSnLINl+o6lOFjyext
         j8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897573; x=1793502373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mwnvOx73d1ku66N7XjhN6sBeA5of7cWYXLsPW/HqYxY=;
        b=ECz3sjKRyMJu4yVtTE9pbeiCfZgga0IUpWSYloTI5oSgvK7phhAkBQEtwpTVpnqVvV
         SJ/quFAdiUGt5gyVn7xqkplaUmRh7t/0j/c4dmWQ9ctoFH+U419awi7ajePq/R88w51c
         IYFVlHW0Hnhvs9d8tp2RVLqrXYulVt4jYszygfIk6k3iR1/vf8tj22f/iLHKFvfY5oR2
         ycczW3f5wKMbjpMMQXMBdBGGXsY3HZjfCtqMq6WIlZzVskQgk7QBjGZlSF8jACvByvGB
         nB+2XOa4l40+Ha8THKdpEsnoYCPYuXke+qsLVPfPQw/hpjzmZn45NfnNOAi/d62ljKUy
         tH8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzcWO9bXKAvPK5xfZpOnMD+LWxf8rcXAHOOJBdUHm9hy6ujGyDvotrZfS0dkw/pAQPB349tMvaXoOqUM0Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCyNNkw4OOzbAMGim9zLXiiY9HVsUKgupSg1jURqJIQoTKAGJ+
	hq3knTIHlEBxZRN0j9nUlYtFbUEkxITfcIhYmt+vJaiUaFQofS8qv5E3
X-Gm-Gg: AYBFou0568H8+3QqICG7MLZHtTqYpTzoxstE/4BF+QORW7RetUDkyGuCHg4xgmb+OtS
	DsEB/ra1PGRoLQsQkGYIYrwuXlIHcTa8E9TPOKL1OsZwh+ppWebesVEYg7tft5zkFEi4ocsoiGM
	tYsawUeOAI+pvp/CSeawqfWxMI/3xnQTljV+ZT/8HZpEr/hJAoLCie/1TMDem92wHxBbqUUP5u3
	x4wlHmlyS5kub7yPb60i8WjKntAGDbSOQHayHZOo+ZkfFJrYv+BOzjV84bUwPizoLEA8Or0fFIS
	QQ13f6Z6CviBJXd/geHxxF1o2Mz6piD/76cAbZBBLrMCvA+SueeTaIA3EiEX0s+Guprtv1jbhs4
	c7mNfl3efx2+/bcqE8BQv6HZ3Yl/Srq1LnzWZRr1A9cA7L+I+kEkBlzqHkD7eY3/0PMjGOsAlYo
	wj1/8WZgAXn5t7Mu7wSjrRs8d5KKHGvfnyWz6SlnoKU6Y5Hra6VZHkYyBG0Rv2XGfxA73Z0U2X8
	eqbTcWKoxi91ggqRsvtB0aC01wBSdHLyIPNqLCUm5QgqgnfY1CedaX0l+OJiyRrwmvx0Pof2Xni
	+D4yCreCexNEwhDHVbbrpmDDfpsWGoDC44NsIE3K2m0=
X-Received: by 2002:a05:693c:87d9:20b0:369:987f:d15e with SMTP id 5a478bee46e88-369e8336389mr5141005eec.2.1792897572926;
        Sat, 24 Oct 2026 20:06:12 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:12 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:06 -0700
Subject: [PATCH 03/31] hwmon: (pt5161l) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-3-e81941ad0cd3@gmail.com>
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

Pass the chunk length and destination buffer directly to
i2c_smbus_read_block_data() instead of copying through an intermediate
buffer.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pt5161l.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pt5161l.c b/drivers/hwmon/pt5161l.c
index 1638f54f8eae..b38b1f63627a 100644
--- a/drivers/hwmon/pt5161l.c
+++ b/drivers/hwmon/pt5161l.c
@@ -121,7 +121,7 @@ static int pt5161l_read_block_data(struct pt5161l_data *data, u32 address,
 	int ret, tries;
 	u8 remain_len = len;
 	u8 curr_len;
-	u8 wbuf[16], rbuf[I2C_SMBUS_BLOCK_MAX];
+	u8 wbuf[16];
 	u8 cmd = 0x08; /* [7]:pec_en, [4:2]:func, [1]:start, [0]:end */
 	u8 config = 0x00; /* [6]:cfg_type, [4:1]:burst_len, [0]:address bit16 */
 
@@ -146,14 +146,13 @@ static int pt5161l_read_block_data(struct pt5161l_data *data, u32 address,
 				return ret;
 
 			ret = i2c_smbus_read_block_data(client, (cmd | 0x1),
-							rbuf);
+							curr_len, val);
 			if (ret == curr_len)
 				break;
 		}
 		if (tries >= 3)
 			return ret < 0 ? ret : -EIO;
 
-		memcpy(val, rbuf, curr_len);
 		val += curr_len;
 		address += curr_len;
 	}

-- 
2.56.0.257.gf7497c7d27-goog

