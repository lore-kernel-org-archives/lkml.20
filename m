Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794463353;
	b=ufQIlgphJI4fX9/dq0AIrP9gbK4mwQdgtss8S4BK8QmN5W09XuTG7/LLtepAcHlSD1kL
	 YmsOFoOhj/Zml4BTFz1Fk5A9tITiyFIEcgH8gj6aoFnhsYJ1g1WZEVPkGLyQB0V12RA3z
	 FBauo8+R6wAgqgqX7gyILKxEEDyYz/kPMQ03cBMnylsIYL5swdaOYozgWhFvj2iZAPVcZ
	 hqpX70eRkH8dPkGBSYDoau7lmQwsHACWH7U1CLwrZvz6VaGjJhqOsJ1iQGThgz2kRz3V7
	 6osW0ZqkuP/PVGN6nwSnUkAeasjU3dEXVHNXHg71B2a7io4/lLZtSNL8MeSRoEg/lDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794463353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Rw7Bx0dLkNzuOX+yqngAb7zMgStoCLsXZz0OyPBFN3k=;
	b=41q4yspc7T05b4ax8euIguArIhFqCqd1766qxCOBz8YaDxBTpXf4Fzg/QuuloJzKVIR/
	 9LlU59dN7DI7ynxRA39d3QK1xEbdQatap0FTodn4GRqSqVs1Po86KV2pzxbej+/NHcfTn
	 7PFyl/zOyLSP1F8xwBSVhairgrGp5OhtT+xhimZvYGStIAk7DPWSDlP7Y67IoiiR/UPDu
	 6vQCrJg/nFFFfWhgrWYxVUi0DljmFy+u5UsnkwcWdnifQ9//OP+teGyobwPDwq28GzE2v
	 LQdV4jKDj36ptSxc45x7VhgyyjFKJv76HFLNhnEL6yQY1JEU5/uwPYhuF0Qu2QnmlPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a46UpnvK;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36266606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36266606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a46UpnvK
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b15e46698aso1964014a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794463352; x=1795068152; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Rw7Bx0dLkNzuOX+yqngAb7zMgStoCLsXZz0OyPBFN3k=;
        b=a46UpnvKbWTNlsCa+FpDBLlf/4fLcpzR2NUPtorGMWEnbpDpK9/8303wJ6S0fITbpD
         EZTIqtKNtt/9pwIRkhnmNr8rMBGuI3CErXj3shpsSB79t84OGOXeWMEffSp9zfUFzdzw
         q2pqI7m5VlWh5skqpYgyt9o+2MeFn7SmvrcPj5fC7FEMHZZENXtOD5aCA1mVzG/wq332
         I5km1JgJNizRSyWkvcNAV2FecjH5V3L6uot7ls0+JzsVa4Hm1jI77cexThx9P5jC3QdO
         mqOlBqTC80NNZGeMFNCYHMfrnt6ivd6QCaQDvU59cpc8UEKX4zZJ5smwaKNhxyQs+2S6
         YDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794463352; x=1795068152;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Rw7Bx0dLkNzuOX+yqngAb7zMgStoCLsXZz0OyPBFN3k=;
        b=vTprC4MDMdUiT6mzo/lKANZQB7O7c71Hax8BugI9bifvtMi84eKIDqm7CXL4b0Hr4X
         IBb/a8Q9Mye1Axrsc3Vxy+ESvL8HCMjnhwUKoAWtTiVh+9gquttIm9t5GMhJGvkUvgSS
         SZwG2hDO3FO39i8dqEfEoisJYL6tXAJOVtAQjj1TrSvqxeaSkq5lFT44Pj8HqVd93VUt
         E76jo4BNgpnhqfJ/pG716s4hFCi+gnUFCJa+LHlpiWRiaxE3HngYSW2hvBjME7RWQ4Eu
         ARIi2vm0T13J1OSjqcphFVOz8MEkJEQTN9C76vQyL6EHkrsWGluL8aJDoyls2gIRYJwR
         5neA==
X-Forwarded-Encrypted: i=1; AL+hErFbOrMeoVbWrm4xm8hTdOYt3vp9AfIDCOB44elHlUpPhZgMapBusGRsu2dem8BnrOBpf/iL7rQ8gc8YS38=@vger.kernel.org
X-Gm-Message-State: APuU4Z9utGy29YYVrcGNV/xsilyW0wCZUruf7A4FaIE4rQpn4uLnJaif
	ZQ9VJTHlENNmb9FkNAu8ZgFzPjPr+blem5Rq+3j+m/A/O6YCMTGG2+hW
X-Gm-Gg: AYBFou1+4s9+TUgwfAAcpbCZNrBei/YV47Vt1zANcFGlTsYMawCtG1D0aeoIngPJX3R
	X2xyV5aNN1S8umESNca16a9exkOvzjecJAoVZvhFIzy3645y4lIIDDuSm2z3tI79oKTp2zE4UTy
	OHD168i+cno1hGDka3K/URo7NYFXxoTxoKGP3ryNGLv9jVsXq9RKptiVIf2L9nwOJfgVF7YcXhM
	z7mNP2P+Rfl70nHANav2p06jXNHmF+W1BFPxNPxG11ZiJbnJo5TFGW2mf0bhONwn63OtDx0SwTr
	lUel8vFmtR0782nGm5vV1Nqte9BnFnJGAj3DH++9D6ep/VMQt7pDlSCwdZLHZwlPv5zMr+YDog7
	eNkyTLKcjcDw/7Y4mHhlRS4gDISHvPHtsr/giVMhhovCAiry3LamcNPKYQ9FmiLIJnRHqbWZZtd
	DlRlzCVxsu5qxDooFJFF4AdIIbnDllP5zrf43cPZn2MLYozGSsPHBOb8nTRrFaYC2gtqj5C1N1q
	NfJyC/RwT7p+MMe0aWhsQcob/SRjn+MObvcG0Ews7hQXlnE7TT3oInlYMlKJ5w/nDoKQHPofIVe
	4e465CqVZStwhheTiID+O987I3YJKZ3jbqoUGmHRSVfP3NteKw/HHXgoLsitTZQySAmmqE1NgjK
	paXFVi3H3rfraln0C0qrExPYoxqrtGOKcBH3eafeV+efsPsTIvI2kgS5YfgNaEymv1sLKsTNRYL
	T7HLJaw4vGK3OUTFLp1GR5M1lRS8fV7bWVLCaCRC1RJNiGYpfH5S3kLg==
X-Received: by 2002:a17:90b:4a51:b0:3b0:accf:5c66 with SMTP id 98e67ed59e1d1-3b182f29822mr4190053a91.49.1794463352444;
        Wed, 11 Nov 2026 22:02:32 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa (2001-b400-e25c-c447-65e5-0e2f-5b6d-25ff.emome-ip6.hinet.net. [2001:b400:e25c:c447:65e5:e2f:5b6d:25ff])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181beffcfsm3177149a91.0.2026.11.11.22.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:02:31 -0800 (PST)
From: Wayne Ho <wayneho219@gmail.com>
Date: Thu, 12 Nov 2026 14:01:57 +0800
Subject: [PATCH] hwmon: (sht3x) Fix alarm attribute names in documentation
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
Message-Id: <20261112-sht3x-doc-alarm-attr-v1-1-91676362d133@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDQAxA4atI1g2YKUjxKqWLOBM1xZ+STIsg3
 r1ju/wW7+3gYioObbWDyUdd16WALhXEkZdBUFMxhDo0RBTQx3zdMK0ReWKbkXM2JLql1EsXGxY
 o6cuk1+23vT/+9nf3lJjPFxzHF56ob094AAAA
X-Change-ID: 20261112-sht3x-doc-alarm-attr-118ddfebc6ae
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Pascal Sachs <pascal.sachs@sensirion.com>, linux-hwmon@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794463349; l=1932;
 i=wayneho219@gmail.com; s=20261001; h=from:subject:message-id;
 bh=zsSKgXhZU6KjZKkVqHl4QSQxcP74nzzHdwMx2Z6u6Pw=;
 b=8KLjbsfdy1taUMi+ZXefmWeolEFLVJeha699NRMSlNH6Es2k+WrvtaJGADLbhzB4Rw0bPZ2xQ
 ex4V/XP4UCXB9kOWMNojNXrLRihF4L6ErBXsXYtwLM7IHhIpQm626eS
X-Developer-Key: i=wayneho219@gmail.com; a=ed25519;
 pk=j25LRSikYRlv0PpovZSgSrCQwsy7WDzIYum/mydUa3A=

The description of the periodic measure mode says that "the alert
attribute" is set when a reading exceeds the configured limits. The
driver has no such attribute, and never had one. The alarm state has
been exposed through temp1_alarm and humidity1_alarm since the driver
was added, which is also what the sysfs interface table further down in
the same document lists.

Refer to the actual attribute names.

Fixes: 7c84f7f80d6f ("hwmon: add support for Sensirion SHT3x sensors")
Signed-off-by: Wayne Ho <wayneho219@gmail.com>
---
 Documentation/hwmon/sht3x.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/hwmon/sht3x.rst b/Documentation/hwmon/sht3x.rst
index 4f67671eb0c..3c022c058be 100644
--- a/Documentation/hwmon/sht3x.rst
+++ b/Documentation/hwmon/sht3x.rst
@@ -78,11 +78,11 @@ The allowed update_interval in milliseconds are as follows:
 
 In the periodic measure mode, the sensor automatically triggers a measurement
 with the configured update interval on the chip. When a temperature or humidity
-reading exceeds the configured limits, the alert attribute is set to 1 and
-the alert pin on the sensor is set to high.
+reading exceeds the configured limits, the temp1_alarm or humidity1_alarm
+attribute is set to 1 and the alert pin on the sensor is set to high.
 When the temperature and humidity readings move back between the hysteresis
-values, the alert bit is set to 0 and the alert pin on the sensor is set to
-low.
+values, the alarm attribute is set to 0 and the alert pin on the sensor is set
+to low.
 
 The serial number exposed to debugfs allows for unique identification of the
 sensors. For sts32, sts33 and sht33, the manufacturer provides calibration

---
base-commit: 44c8ceae2dd3ae536c5f4f956cedb24c157aac23
change-id: 20261112-sht3x-doc-alarm-attr-118ddfebc6ae

Best regards,
--  
Wayne Ho <wayneho219@gmail.com>

