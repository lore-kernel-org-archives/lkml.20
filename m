Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792896536;
	b=KIymc3uouq5kI4DUR9L6QwKiFeWyWnyJYpwpizDqoMPRoMuiFSK9OwEjoF2ZEgtKPTrf
	 vDWijKXyDk+3jVfrPpa8IPbBszGwlOb02zjPBnK/CoRifnZ+58APOQOExeoqzJ3j5dpqP
	 BVjdbeXvuxo3Ds93we5Nnqo0sKSe5ClQpmGBfM+yERyMV5V05Wmq12fZch45ZbSB/xSnp
	 +tUcxuAc2i7MPl1mO/drByX3RK9EVBJcQUqq7lvKeVEZ1NFTgQ2RVG2Zeli3rhel9C3od
	 y2ds92uOXfBIuJGeBWwJ1vz3A/S/nmvvRgtlceSkc2UgaP50/YMfo5+9484BxOMV0SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792896536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=K6RWQvZ0010QMq8qM7UpBKJiUI/Pg5qFMdimoJtiVT4=;
	b=kdZGtH0rY8RUjCbN8Lmq/gmJla2Fq7KOpU60Kd5WO2YbmsGSR8BFEw/1LoSQTlZrcwxa
	 2Xegn8rIZZLy8dn6sy0kSzVRIox4m57ASvedXX2JpSXCfGn55dOU40nd0W29m8RtpriVS
	 txzGpeaVQ4PHclIfVrDZBlNU0IXjZtbmpaGyTeiMcT6QiYRCzsHObgC0dUOit5Rjtdw3g
	 EznKyjs5XsVBzgN7EeD51/y5y/U8NRANwHUz724ChJ2enkHTAXby+aJI59b1wxgku4wr4
	 jjzSM2Jh4/Bq+vap3AOlTBRZmatMqL2912Br8AFKc0Riy4Oa004qpiThEZZ9N1rMQrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jY+GWyYS;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C50F606A326
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C50F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jY+GWyYS
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35f036b17easo4771089eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792896535; x=1793501335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K6RWQvZ0010QMq8qM7UpBKJiUI/Pg5qFMdimoJtiVT4=;
        b=jY+GWyYS06WKW7sEDFJqidwo1kj5aZiu+FCc59Yl6t+aaUEEs04DN9aHOSFvf4pJ8Z
         qDTsGyTd2hnl7k5Ym46s4MK+M0SwUS6QT0od/3PXQUY9mRrVY4wqzdWTtw/7QLtKhHPa
         Wl1hqNxbGN8k3SsCbjwlCsOrJRQMs4gMf/tZHs8fW9xwTRoGmWNJzJ/3nkRIzMHK2jEx
         7Yvg/dWXiInPgUoSXDzs3Y09VvZo+NgZaXTjGaJ6myy/TWg725XOGN2XlqtCb0y6wNjt
         /5awgzg0f9X0YKC3fb5ZWJ1bxfPVtsB3fUtQFpxRIUQdbgAmX+A1x2JOoOg4XWscVZWx
         qdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792896535; x=1793501335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K6RWQvZ0010QMq8qM7UpBKJiUI/Pg5qFMdimoJtiVT4=;
        b=iaF2+I1XeiAuI8RBu0jlbi6tsAlgh34hLdmQvFlX6X0EpDyZVC+HQpaago+79ikRWU
         5WorBhVcVeaz1N18CilA9vY/XwIOKQ3FeIYrwABVSSoI0ngxeqolhwz/HgG0bxLmYlh3
         chJ5xj9CJzcXPif05MZOFVi99aper4B6ryeXrYT2aZ0r4fA8vIyyJQPn6Hfp+qPaMkBp
         RORPe7Dm9lHBAxL8yn3vLofU7dOirpJ/RuD+EGeOXhKst+8BKEBBn+16MNPLn9omcW29
         K1gTllaf7zuKkN4Drbk3cEtakYT7ash5tgWoGyckf15g2XwdFJBXh01j1k+AwdiSOOL0
         1hiw==
X-Forwarded-Encrypted: i=1; AKwUvBxI0a+Z70K3zl6PdeJgScL5I5Ec/uGduKavIgPTXpVsXQgS7w1yt/61zwMaUZ1/vaoc48S+4ySji5EOv9g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLksQSa/V+KoED/ypf206KIHSnGAkQ2+wiwETKWkcD0TJvY9TK0
	CMDZACwnjl7f9z3OuB1clNbTnpGs3tw2eswSEWzcss8bUCGQYIl2e33Q
X-Gm-Gg: AYBFou1ONnNQuoPPRksGymczpTrL+Okr5D1i4CwA+muUFskr0T8cqRVtXAipIQ4rfLm
	ru1jNtqnrJCvv8EdD1aPIcobMSRail1ytDYUuCEuFBVbdXZprnNjMEG1Pv+OvCEP6pACRy9KvzK
	312xJi4sunhzYDO/mtU3ALstVpw4hC6jCXi01EjSvlayAzKjkvBAGWb5uYZKwJdcTzE7Q2DU5It
	sKR9w0offoo9GKog+6heoeKzjMZEmsjMl39SDB4M8WyywMmu2EJ4nggllUACMpAL79BEcgIw5/1
	YgxJeqCap5FB/W3mAEHxYmUAMFeZauptzRKc6TO0rWAWMdXLsNdDyLZ5B5aEr4/Jh0D7wURencC
	iEugVbGbVyXB1QNLUHa+HQL5NyxfLOpeynKtPzr6qc7AqIisVFYxugmgFCh9wUycRJ+3LX3zK1R
	89n3ckwY/nAevJXxCeLdBhTJ2MoIdq+gReySIQElvD2ar1mH8GyWY4qo3y8JAWWV6Nq5PcTMGYC
	f32POgvhBrxRceB6chJfRFOhHqyvgoIEAU/qXRVsBSXpoeb5uC35pxC6GOlaquT7TZytEWhWL5P
	vPewFRIQ/WKpUevI4dmLrRoSYel3VnSA8z5DOh/DK/E=
X-Received: by 2002:a05:701a:ca07:b0:184:d593:2897 with SMTP id a92af1059eb24-1993f3ecfb6mr5382379c88.29.1792896534741;
        Sat, 24 Oct 2026 19:48:54 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2e32479sm10521272c88.21.2026.10.24.19.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:48:54 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 19:48:45 -0700
Subject: [PATCH 5/8] Input: synaptics-rmi4 - use 4-argument
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
Message-Id: <20261024-i2c-smbus-read-block-data-v1-5-19bb97467982@gmail.com>
References: <20261024-i2c-smbus-read-block-data-v1-0-19bb97467982@gmail.com>
In-Reply-To: <20261024-i2c-smbus-read-block-data-v1-0-19bb97467982@gmail.com>
To: Mika Westerberg <westeri@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Corey Minyard <corey@minyard.net>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Sebastian Reichel <sre@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 openipmi-developer@lists.sourceforge.net, 
 platform-driver-x86@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Pass the transfer length to i2c_smbus_read_block_data() in
smb_block_read().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/rmi4/rmi_smbus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/rmi4/rmi_smbus.c b/drivers/input/rmi4/rmi_smbus.c
index 8b61c2382297..a180becb7670 100644
--- a/drivers/input/rmi4/rmi_smbus.c
+++ b/drivers/input/rmi4/rmi_smbus.c
@@ -172,13 +172,13 @@ static int rmi_smb_write_block(struct rmi_transport_dev *xport, u16 rmiaddr,
 
 /* SMB block read - wrapper over ic2_smb_read_block */
 static int smb_block_read(struct rmi_transport_dev *xport,
-			     u8 commandcode, void *buf, size_t len)
+			  u8 commandcode, void *buf, size_t len)
 {
 	struct rmi_smb_xport *rmi_smb =
 		container_of(xport, struct rmi_smb_xport, xport);
 	struct i2c_client *client = rmi_smb->client;
 
-	return i2c_smbus_read_block_data(client, commandcode, buf);
+	return i2c_smbus_read_block_data(client, commandcode, len, buf);
 }
 
 static int rmi_smb_read_block(struct rmi_transport_dev *xport, u16 rmiaddr,

-- 
2.56.0.257.gf7497c7d27-goog

