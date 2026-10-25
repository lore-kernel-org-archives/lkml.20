Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897608;
	b=jM9plTNr8sNdA+6NNN5b9fM73M8wQIi718DxAmpUyPWjesfbCIuq9piVJzaxwlxZTUF2
	 W1dKh/WdHOCJbqgnVt5OAiVCI3/AXD0pAsvK9za/SUcfeV/si/9SBCxuemxoxj902SA/w
	 NBn40kvZf9oTTF+BcCHUXly0thKLUbxm4De5ZNtwZG6YV5IzCI0g/E8cgvKDzcCSFrRBJ
	 Z24JJZB9FOFi0/f4DqxHz3LSk2f25aQ7G3u4GiYt36lviuvY0IdGsLq/YZa3iasqRaHwh
	 XAdlh9Modm0HRR3EXICsZH3wDnkNTtOkap2CA1f2G4+zAFNnfASDx+mHTNRSSzccZUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=qs00o1EWp7RXAZ6uortmy61vywYTOn5HTBBb0nXYHEs=;
	b=m1sSdDqGZRdQMUUZGv+0GfxZyno6VLzbbfnUz/SixDi/vGsjfsQpT6VbkhE0SmnKbzKI
	 GPA6z8m1xdWq76VTxUzu6R2mrrlFSid3AQ8jCjLnuxwoWdpo06ly5UY22T3k1fwGrF8Ad
	 do9SjIMe7P7ylwAEKwbjh5yA5UBF6bgUAmV42pWF+lX3db6N24ryZh+U+OXQCaxFArmOk
	 8eEpHx399/tCKb2dXNaxRNkFS/PLBFyQEzri1acEtGsW9k2neEPovRi0qDBrt/K/0PZ3f
	 Uq3uzLMZiqX6Yxi6qXHklSXkMC8YXNc/YaDCFoUiy7qGCilxhbz2X2vkXTJg3LhdFpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S0p3pZGF;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3D3606AA6A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:06:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B3D3606AA6A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S0p3pZGF
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-354ba08cfd1so3595764eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897607; x=1793502407; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qs00o1EWp7RXAZ6uortmy61vywYTOn5HTBBb0nXYHEs=;
        b=S0p3pZGFiBa2BNSHyR+uVRvpQ/yPzCTtCUTzvQeeLBIX6nUjemZsCZr7BxncHpUYYT
         6RVNSouPhUYMbKpxte+X0WFUtpVpN3POqUdepglNyOup2qI7HfrkcMsjenVHiB9lWtUw
         +77mzMnN4AWTZdyJKC4dYhJkiCSltXz3BkE9rYdzZ8yMPxav09QyJl7j0tAbkeJwcgRJ
         SfQovq5LWS0zDRi9ut96/aenSD5Np2mZsiINRTOO1+C3TkxEBx0jGnvD55ivrqeRZj+3
         8+yAtngG6YIhYK3sXOIHHdEhwFnLc+YjJVSxcCt8m7K3YTnnSxgI1QGOiQ4a/TRj6ikI
         KoVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897607; x=1793502407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qs00o1EWp7RXAZ6uortmy61vywYTOn5HTBBb0nXYHEs=;
        b=HphYYJFX8HtsRd/so/pqfv3QSj9C6Adl/YggYapo7H1Osfu7cBublFaJIesEOLptkB
         QvFTYLp7RUtlgrqLZjSo1q8KjAOuvHw7p3rvV2A3p28/PqyveY8L+ieEPtOE0XEzPEZ8
         ffzxM6+ki8B/lBt+tpoebyaqWOE31MnVdGZ8AyQU1YpCxEk82IMO3Y5YY4LEYsO5rcbX
         LAhisL/6dijQ/v1uhIp+iBBXjiQvpXglWRtQaBEWrYxoEbBHhUDjR2twx10QdV1+cBLL
         sa3jNMg6bM1bzI1VQxhxcR1btEaspH5L1xFuJbIpn0BGWudMV/pm6+JFqJoVGSJnrza5
         AWFw==
X-Forwarded-Encrypted: i=1; AKwUvBzg7GVcc1kTW4+14D9sv8wfInWVW+ByWsh7h6WWm3wy/bWUBIY+Gd2qTrhe5TcHw/ETxqQOuIPXSU60+u4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeIKVVQ2EeYDAYRBbxNFmiZvppPreXBRoDHUoM4S6clSiZnYwM
	WM8u3fNsWkdbm4vwFkE3prCs+8nQsDkmw/kkLYWp59mO+8XVih7CupHC
X-Gm-Gg: AYBFou2qqiLeNjM58bxO8rP4gHbIJFCkO3FVBDdwanXvjJUh/kF4lP/ZW/GM2zvveK+
	pw/F1F2HihEpW5+lomnfO0h1mHZyjFrkHoklPihbGy2aBH71pWRR9HfTx8RrtTwiy2gOBpdqKUZ
	bRC4diW8JYRTouwKFlWRKIwtOv+QAWk2dAJlK6HMaM/IBFcDMJC6+PKp13+EipRKAoowO4Cg6fx
	f+nHFwDBcd+tej0z1sZPw5We4h7/zObvAWfcjzGMjNdcqZlDrmu0blJFwThgDoZ2yVFdM56RZTF
	O1ws0BFkvnFLGI9FA5jlK0S8Zl3QKca+VwjUJHjSAu2os2rrkBzd0zf+1xfFgvAxqkfsQcuwZ+8
	O9wPDn086VlSB6fXAJn06PlqAAO4oIyD8ImArPHkK9x5Pz4cK8WAjgPqCVkN8dz7zmWgYMfUe5q
	MyBdLmARZnhqRGCLV6+jNVHvcV361dqStfSLelnRuSST/eozxELp2OcHWg5BOml9X25673ljNbL
	f/kwL0YTeU6nZnI1WYJUfkzYzCCyh2EKSLWFYyltKS7A7uM0hQ6v7JbLPRdA1vr2TM4ruGv+LcT
	CmY+8e3VYTNN8pjow+p+ywGldtvtbtmXqD/xtkGEqoZ/ZsytEV2rGX9ybkO8GBlu
X-Received: by 2002:a05:7301:3d10:b0:35d:ea6f:b85e with SMTP id 5a478bee46e88-369e8358affmr7506744eec.1.1792897606521;
        Sat, 24 Oct 2026 20:06:46 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:45 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:30 -0700
Subject: [PATCH 27/31] hwmon: (pmbus/stpddc60) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-27-e81941ad0cd3@gmail.com>
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

Pass sizeof(device_id) - 1 to i2c_smbus_read_block_data() in
stpddc60_probe() to leave room for the NUL terminator, and ensure the
buffer is NUL-terminated before string comparisons.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/stpddc60.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/stpddc60.c b/drivers/hwmon/pmbus/stpddc60.c
index b5ce7f975eea..9118517eabe8 100644
--- a/drivers/hwmon/pmbus/stpddc60.c
+++ b/drivers/hwmon/pmbus/stpddc60.c
@@ -205,11 +205,13 @@ static int stpddc60_probe(struct i2c_client *client)
 				     | I2C_FUNC_SMBUS_BLOCK_DATA))
 		return -ENODEV;
 
-	status = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, device_id);
+	status = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL,
+					   sizeof(device_id) - 1, device_id);
 	if (status < 0) {
 		dev_err(&client->dev, "Failed to read Manufacturer Model\n");
 		return status;
 	}
+	device_id[status] = '\0';
 	for (mid = stpddc60_id; mid->name[0]; mid++) {
 		if (!strncasecmp(mid->name, device_id, strlen(mid->name)))
 			break;

-- 
2.56.0.257.gf7497c7d27-goog

