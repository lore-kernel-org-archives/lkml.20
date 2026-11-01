Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530026;
	b=Tx9iKrZIcXNousCAU1i5XNcAoG/3cByqMPIJqEnzPTcp7T/iNah+q64H0/9bHYpOjk6l
	 Pk2Ppu+BexN0XVr+Uf0JQNIG1XxwA0T0fWGraRLu2+Lh6nlzc39aKjqmCE/D/91QBJlu2
	 LGfsDxjkGsJisxc7FcJJlW5W4+4uq1POXrf0/cBJMXslNcEqJRrdQ4hQxjtP+8ahmoyVA
	 J4HMZjCqRbPS5dcEfNwad8rl+ayeH3un5A2L6wIhsQXJzyhMPAkxGHl1BDYKfrFbcWzDB
	 yLvB3OKpdkJpbSBa47DB8HXAB0BVUS1FmcP4x8ZCyVdNkArX02rbBoxPEgCCxja27bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=zun4IPymVDL2q+RaGkZ5Ofu94Q9+xrFA9vW8dw/AJJA=;
	b=sIZJ5rSfYAa1/0KDXhjHblpPwjaHopsshdUr2Y7htsONubPvMzTT1MMBSDeU58McSn/1
	 seZf38CvjqrJK0IK9lxfowgBiyJA6hMxFv4n10pxHA+jCBHN4Lnt75im+xHMj4bY7WH/l
	 +lvce8p6IDQ+U1lnxx0a31/8qWS6CKSxl8zcppTCgaxJn8WknYcqurPg0ylovNGWRvNBg
	 iDPojTzERRWIsUYkQBp8PqX+XvzpLIlaxmwfYLGjzmHy4DS3QOEe0eJYRg17wFOQ2+D4R
	 6jWeKgtNsfD3VnSjw5sM0n7HAbC2diqjlX0vtYZKbaBYg+a/i7xDzE/XuVY+p41zNJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M3LRXwiP;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD565606A336
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 10:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD565606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M3LRXwiP
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso1410763f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 02:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793530024; x=1794134824; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zun4IPymVDL2q+RaGkZ5Ofu94Q9+xrFA9vW8dw/AJJA=;
        b=M3LRXwiPKbhRI7NfWThStz7qRQ/Q2Ot3G7Ckyrd07GYSGdOwzz5SawmvUxdoRb0/Vb
         TdewXzl1VPTSIz24ImXOJvjnDl8EyPSvY2r1Uz/Ne2f4aTf1dbs7zJ0s2I389z6DK2wg
         KwQJExxbCjWtrBMW9Ih8oNmFkPMq9mxv4vsTCxPlr4EVaqz0XDGgS0C1XCK4iU25lWLc
         vnsMRIJd9393z/ze9oL70LhbK7h4edt0hIwsXCrwZUI55DztUh0ofO9WtHpIeHLezn2C
         ittmTLRIFSqjS/odqePkaX3NPLVlmBw0AUoRdSWmkLf9gldE/n8kTmMUEEvJgq+KcckN
         nyrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793530024; x=1794134824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zun4IPymVDL2q+RaGkZ5Ofu94Q9+xrFA9vW8dw/AJJA=;
        b=rKUeAcrjQQ/bBVQiTR75psMlQ9ANBJsMZsTNZLNJSiSATQsQ5XHhODO91HSGljLOpD
         E1uOj/GecIWkYwFwZtaMZfyOnCUDbSfV89T7vNcs694Sp3MD6kGvMRIK/f4L5wfJbYnl
         ZE0CdKWgZIY6ES2Li/AEHwSlIPzffUZX0+zY7TXtgQSPZXkoJzk5k+F6zDLU5Mirj1vG
         XQisxsEh6nyjEXotFwLEXG8mJrGLhPun6Ni3mxUJyhi+4n8pdTgp3Uy8TqzszWHyl1yH
         al52gQFZDD38q7+GOj2OmE7IuGguNNEmTlsmwEy9TocrhYiMhhqkcG5pOqtWNPXHSWzl
         mCcg==
X-Forwarded-Encrypted: i=1; AKwUvBywb1TXi/CQO7BlJdxq4T7iw57PdI58jvMThpiurfBXczrPOBVg6p/fBmyAbXBJ3RtjTTolinwdvGd1tlk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUnnuvwurgDIuQT1v7TVjRXckKce5IQ65gUDqTQwIHg9vT4eZ+
	2zI0SZnUboQUai30NjxD8OZ6I9cDkOj7wEAVuPxO0QF0z3EdGiJKd+5b
X-Gm-Gg: AYBFou39rF0ctWOm9JdiWBuH99DHIFb3g6JjZBFCbUvPy/Rtr4WoUVJ4S6xpL+6tkK6
	ebzioYmnBB/dK1bBssy/AGOk05Mcz9tjVBqlZvyJ05nup1X65u+SYg15jMw7DBuUD1DfY+ndMX4
	x08R/nwIeFpr9XQjnzanXKsSFnrwgKNU14s7WsV9H2/NFH0QGSctefkaBGEkrGSkpbicI+OFQpM
	g5/tBMrj1YuYVBdXtIbAc6vSteilDQx5L3BKUyJ53O5xpGW+Cgatk2Vq+877ClPsZQcgkzzqXNs
	ToXQyqywDh4gPF3uhFVMCDu2TV8cqYUwYRRbyI1PRpqo7lRED7fxgoa89vz3bAUpJYkhNQcXaEA
	Qt0Gam/7c6uCRKPwLK2c7NjG9K++S/ToXrU0geKSOFSM32+XbkJRCOa663OXGo25oBtcaFfMxSu
	eoBuX6cDxKit4V793V9+NXp7fpeWuOr/gmGveF0pp1WFfVu4WSIbSWUyOYd8vioMt4HlNaANO8r
	qq2UinkIMqRjibWHp1sBhYYeJnk99Xnllqol9VhLlnPzCQRtbtqMWnuz6VLX5Dz/BrrCAvNFbmS
	HPuOSYvqkLEIxFTyAx9vIPQGxg0=
X-Received: by 2002:a05:600c:34cf:b0:4a2:fe3:121b with SMTP id 5b1f17b1804b1-4ac18d68ba0mr149859905e9.28.1793530024067;
        Sun, 01 Nov 2026 02:47:04 -0800 (PST)
Received: from [127.0.1.1] ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm255602715e9.2.2026.11.01.02.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:47:03 -0800 (PST)
From: Bartu Alev <bartualev@gmail.com>
Date: Sun, 01 Nov 2026 13:46:43 +0300
Subject: [PATCH 3/7] platform/x86: asus-wmi: define the fan floor table
 DEVIDs
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
Message-Id: <20261101-asus-fan-floors-v4-v1-3-b8d1c31a99a9@gmail.com>
References: <20261101-asus-fan-floors-v4-v1-0-b8d1c31a99a9@gmail.com>
In-Reply-To: <20261101-asus-fan-floors-v4-v1-0-b8d1c31a99a9@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
 linux-api@vger.kernel.org, Bartu Alev <bartualev@gmail.com>
X-Mailer: b4 0.15.2

On some ASUS laptops, the embedded controller enforces minimum fan
duties on top of custom fan curves and reports them through three
read-only DSTS methods:

  0x00110026  CPU fan floor table
  0x00110027  GPU fan floor table
  0x00110033  mid fan floor table

The mid fan floor uses 0x00110033 rather than the adjacent 0x00110028.
On examined firmware (FA507, G614PR), 0x00110028 and 0x00110029 are
stubs; while GV601 exposes a GFLB(0x28) AML selector, it is unrelated
to the DSTS devid.

Define these DEVIDs so a follow-up commit can read the tables.

Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
 include/linux/platform_data/x86/asus-wmi.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 66c7ab35d6c81..44189c5e6f2cb 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -102,7 +102,10 @@
 #define ASUS_WMI_DEVID_MID_FAN_CTRL 0x00110031
 #define ASUS_WMI_DEVID_CPU_FAN_CURVE	0x00110024
 #define ASUS_WMI_DEVID_GPU_FAN_CURVE	0x00110025
+#define ASUS_WMI_DEVID_CPU_FAN_FLOOR	0x00110026
+#define ASUS_WMI_DEVID_GPU_FAN_FLOOR	0x00110027
 #define ASUS_WMI_DEVID_MID_FAN_CURVE	0x00110032
+#define ASUS_WMI_DEVID_MID_FAN_FLOOR	0x00110033
 
 /* Tunables for AUS ROG laptops */
 #define ASUS_WMI_DEVID_PPT_PL2_SPPT		0x001200A0

-- 
2.56.0

