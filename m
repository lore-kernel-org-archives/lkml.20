Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794712033;
	b=Cayd2XrMKpdKOcuQ20dpL2yvRBvWOL6gNMG2SaGaNvxe7H6jMWE0sbjyjj4dwVcqSc55
	 l2AVzpaoXsOGrem5cAcxIyZRW0MpPI0HGJF2d6AcVtSAgvRV0uTkrSfYiBRjCYH60GT/+
	 hb0ZoRqZDGphv1bKPN0TpKWQoCQzqpS1MpMD7SZ4MYpX04Ydp/We7aj2UMGaoXMLOt37r
	 6n2CBf1Bg25CgYN8bQ8aOyQji4Mz6lTK3DVyWCrlW2N+dVX3kNYenWl1rBnQTX+yV9J6V
	 H1TmSBdRtOmPeA5idSwPU8JmSGZhDfVsxRkhX/t8VD8421vUyRueTIrZ4XzJWIfAkIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794712033;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QlfIoOulKqR//jecUTZfJjjp8+vB6/pWGpBLndALDCY=;
	b=5mVz6pDm1Nkv86qEEuH7gfVD86bIv+RUOUi+236zYaiVpokyoGznZ+NEgq3Co/HKrntg
	 zwnXsX7dnTs0W94dV6IH/mhi0dr9k6/LzxdLK/Fn7vRDyAVkb9wrsIoTaNzooSBlgJZLv
	 3MiCRo/V/dS3GpMhtMYT8QQLs3EuTL1zONsRn06meVIlh5SotsCHjbMR3R4x0xawixE93
	 41sqXWZRMGwkh6zwYgPJ/W1mvw5tSfcyp0zJSllo5G/P1l0jWb/wvjKHU/8rcCUA8Rc+r
	 OuJmYupaUmeGcDJ6NYg3acXRT3p5r199SeohwzFUnS2yTVn2rNKoez38a9sGfRemN5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="yySj/SJX";
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A3E606A327
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 03:07:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41A3E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yySj/SJX
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso2832774c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794712032; x=1795316832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QlfIoOulKqR//jecUTZfJjjp8+vB6/pWGpBLndALDCY=;
        b=yySj/SJX2FvEG/OaPjmArin1HcFhZW5/1joPoJKQBvx/MgLiHV40gA+GZOnlaeX+s1
         J5t+R0H2+a5V7I45OVP8fwt6K8Dejo3MAEd09wJ1RS+tKuDyUMwoiihPbSymzazGMeKr
         ZmDRyW12r92TrWC21FhsDIciNEbp4ObcapD36mGeOZ/CnbAuhdpcwwdNr8KrTh7qDNyY
         j+Yl0ire77a5klJI2uqR+I7eNvwZ6+2yeS5ZztxQRsx6RsIZD6IkeFzCB5ABksq1YbjC
         gjrDDTnmew9biFo2sbj59Wfl9XHKlCaBpn11RbYYILnGjD2kTw4yNMZUN2KPeSY5kcLJ
         bDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794712032; x=1795316832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QlfIoOulKqR//jecUTZfJjjp8+vB6/pWGpBLndALDCY=;
        b=T0xmUWb5LKua8X7XYi2Dw6CmF2vqe3esfIXna/AAtLXll3KEuTJZforo6luHOcsSUy
         cZFr57kRIzUiFV9z/+gB4Yk3Akize4sdZSQ841OGJYLRAgR9hAfIRawWzujHmtKG2fgx
         jPXIUSj22YN009MQ58NFkjlLnaHttooAYxmEDcuUzb0zl8LotQGVO0v0bEfqx9UeVaBC
         T+nLdqziOZbGNHgLgUdIixXxRoZOuBMwLOFU41MG6z1kYA3hLnPP2Y53HPU+Ur16vk8U
         +CKHO54s77bGVxa8z6R4k6++7/l02IDTKhrATxMe5NTF5Qjt1svR/b6/FPktSLb9sY02
         Fj5A==
X-Forwarded-Encrypted: i=1; AL+hErGAyHV+b98mRhVjA4HmUOjgWxG0Z+xknnwdlDlb0gZBt+tBF1QaTDY8B9Oc0+hbb3/rHAdSQDKi3qrxZBU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hWHUAV1l/k/uOpnpP8wNDAqSIUu+mBA2n0x36p4lXq4mngSXu
	P7Ph09xNbl9NdyTAZhCbTBR9nPH8WJBUdqOH/iGBL4A7gWVmYd3Cj+3P
X-Gm-Gg: AYBFou1jfkrDce3uXsmdgIeS/LqisLCxu6jsPK/xRnqvYoboiKsJhVMcgopkJPGAU5p
	THPkz4cfNzM71Irp4IWglo5uLt5oiGUElk/ZKfPwzSAmJ6r97VyW5PtbPcc4++2zFIjVR7mEl9q
	0i10R1hd9eF26vcHnkcxM5laYF9o9T4qbF8ZTp4bJHhp31VTvEJSa0LmbUQi5hZahYPpo6H5We4
	CciUCh0cbY/tSTwWphYXKued6YbF9azLcTULU29H5t3d8+41y8Y9Yzzb4i4jag9APeTgqzKFZVj
	oQK9CA3JsLDjVHYyG2Y6W79u0fh4ccU3qmnXDTAbMpy+h3FkfqnZo0EOw08uYEdXFCfYbdtpRTM
	kGcQ2z9cehMPwzhS1aPb1xwf1f1Qt6w8pLvZ4ZVEMxoRKNrbDPOKy4I+bArOxJA8RpDVHZPOzK7
	c5hZ79jqKLswdtPfS0SxHw8Yf2wBv4e/iRbCOTSebVnhyRZBm7E7hVdsgyjNDKm4Ef3jnzAFR77
	eFIm8xQWk8q7LUQLhY25GSH6zPVcZbl48bFANNDB8SsyihVrSl2hM8IRxlQi5f0Xa+e6qXQ9+AX
	qSzzvd5YWDLu1CjhdJ4Z7jMl62Mc0rny54484qOxW7QT5fbkDzx5Lp18uCYpfnvbH7cwqkCaDir
	FuBjs1UV0Qf0TPSEWM1hNqguwIQVFK8Gq8e6CgD/BjDEeZnp4HwNs3A3gofmsZdx/V16TuX3beo
	9jdRKQFuG8BR8=
X-Received: by 2002:a05:7022:286:20b0:1b3:ae32:7a57 with SMTP id a92af1059eb24-1b5031051bbmr7117595c88.47.1794712032179;
        Sat, 14 Nov 2026 19:07:12 -0800 (PST)
Received: from sanjays-pc.govzhome.govindz.co.nz ([14.137.24.183])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e195sm23510960c88.8.2026.11.14.19.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 19:07:11 -0800 (PST)
From: Sanjay Govind <sanjay.govind9@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Rosalie Wanders <rosalie@mailbox.org>,
	Brenton Simpson <appsforartists@google.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sanjay Govind <sanjay.govind9@gmail.com>
Subject: [PATCH] HID: sony: fix RB3 Pro full report poke timer on 32-bit
Date: Sun, 15 Nov 2026 16:05:06 +1300
Message-ID: <20261115030505.633497-2-sanjay.govind9@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Rock Band 3 Pro instruments need a feature request before they send full
reports, and rb3_pro_instrument_raw_event() rate limits that request
with time_after(jiffies, sc->rb3_pro_poke_jiffies). sony_probe()
initialises rb3_pro_poke_jiffies to 0 so that the first navigation
report triggers the request.

jiffies starts at INITIAL_JIFFIES, which on 32-bit kernels is
-300 * HZ. time_after(jiffies, 0) is therefore false until jiffies
wraps five minutes after boot, so an instrument connected during that
time stays in navigation-only mode until then. 64-bit kernels are not
affected, as INITIAL_JIFFIES is positive there.

Initialise rb3_pro_poke_jiffies to the current jiffies instead, so the
request is sent as soon as navigation reports arrive after probe,
regardless of the jiffies value.

Fixes: 7245b0017d12 ("HID: sony: add support for more instruments")
Signed-off-by: Sanjay Govind <sanjay.govind9@gmail.com>
---

Notes:
    Reported by the Sashiko AI review bot as a pre-existing issue while
    reviewing "HID: sony: fix sleeping in atomic context in RB3 Pro raw
    event handler". Built with W=1 on x86_64. The 32-bit early boot case
    was found by reading include/linux/jiffies.h and was not reproduced.
    
    The fix and changelog were written with the help of an AI coding
    assistant (Claude Opus 5.5).

 drivers/hid/hid-sony.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index 50f5ad6bbeb4..8f19d3cc73b1 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -2392,7 +2392,7 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	}
 
 	if (sc->quirks & RB3_PRO_INSTRUMENT)
-		sc->rb3_pro_poke_jiffies = 0;
+		sc->rb3_pro_poke_jiffies = jiffies;
 
 	if (sc->quirks & (GHL_GUITAR_PS3WIIU | GHL_GUITAR_PS4)) {
 		if (!hid_is_usb(hdev)) {
-- 
2.56.0

