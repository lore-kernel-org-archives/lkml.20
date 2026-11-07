Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794069528;
	b=eIlPs1IOrYo1vEN92JwRcwpa24gwFjwzuoUBmcyBMf3yNzZ4KbWUfjdzm6pXfxX0Oou4
	 gMWfSJAY1kkE3D9at4R73gMrwW2IUI6VAwbHb+QT+Hvhx9PLGJSUL9R7ytq2XvPZssJPQ
	 gA9v/YFovErvcsva0xI2No5BFkXn6n8ydn1HMId/mYeiWU/dasCkZ7KPWsOtnsenUEfKY
	 VSpCEJK8uhZC6ojRMJnAYwS1/sE0jDgfZP4CgRoibZktLrpgxtr2lacCwjuG9pdNn13Q6
	 YHack8R0rmPFkXpRvKET65I4MMtS6mREifDMsJ0trHNFm10AiNyx0mcC+j4yVF8CDHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794069528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=asWdhl3Pp2O56PoH+ShacAZ49+nr8lbfDLql5h7tLgo=;
	b=QViH4V1PgXOERMKHkDK9leLiyEd1uqogPYqprldSu6NHY9BgfJA1K28Na+us/mIHYzbR
	 uLq9lz8+OPzzLiZlIVNQOQ+PAWwGRad5jJss0j9VV13/h0U/RXBbQKpYUsmNMZspfrtcr
	 Wgn+nBJupPgzISFO1bUWlZfD7U965R2MMPlqs+1dTt2aUhgYcV1mnE/5/dl/09+X0eQVx
	 sBbiTG136DOBs+l9x9NyUw7+vZrFNmu0+JxuU9w2FydaYyJnfGsqQT/xlo0ox30Qrb+go
	 bHbQnUWQ5XA+ciZnzNuPmvfq7xVXaHsoyKxz03kwKRgCRIgdbb//zEEGnxXBXuCQzBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="FpkV/aAM";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12ECA606D820
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 16:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12ECA606D820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FpkV/aAM
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso5394095e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 08:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794069526; x=1794674326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=asWdhl3Pp2O56PoH+ShacAZ49+nr8lbfDLql5h7tLgo=;
        b=FpkV/aAMr7B65s3dU4wZfwRG6ueE0oji0xczqtI8Sf+KiHYNVonp7F3oDQiLNkyHPr
         D0dUdLK2U/q0iFgztX4zeOIXRCIF5tTT50QpFbyp2QVF3fLIVFQ83dgbdo03O8cViiMh
         Zqop7tHgJhGuU3joc9KFFz4T/hBeX14GlJm7uiaN6ZHtEkSgt8ep2f8ERIGXCuXpAuSM
         VKOnbUCp0N/g8xnnAmfbmlqtPa5ZF2FzN5xK9aJVMOvC3ZmIUQmAkQ0KhhnsHurErNk9
         MV/cJX1YjBq0qJMErJYN3safbwGBqmZ4QlWwsq+0habamJPfyV9ubiUYd+E9VExqtJNp
         bjrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794069526; x=1794674326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=asWdhl3Pp2O56PoH+ShacAZ49+nr8lbfDLql5h7tLgo=;
        b=bvStmac8442uv/QRMjCIfbwJKeayrdDLM61dTdB1LfbrbxxQFlr8I6JLoctnJQKAuE
         Lluo8QZc7U636WFVQ9d7JATMzbGPOAmaanZGJ77VJyorx/tKKmKsG/SVSnyY1Q2gP47A
         IUTRUo/pAiJi1l4YfEBDgJPolhn5lucMWQ8Opmcg+0mmHrjeXKkojWUKl51RTt+v7EuQ
         zG+R5blbaFLJEJMKBTOhFKRzWaQ4LMRWANXNUYboGinRAPX9RWHTgfVK7qxUc3Ua+5fK
         cEInMg7jkN8rfQD86ckiT3mJ3ZhtVPGE5+IlPEt1SZH3Q/Rk6Kn0iyyev5B52WIkHXiM
         vHUA==
X-Forwarded-Encrypted: i=1; AKwUvBx3nErjACao3WE0UvUk0BkXTDdxWABg9WeYek/z06H9Ag/qYhUgzaYg2blmr41WBYq5FrCr8JykY+RUcKQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xz9RgICQHkVCDmshP4CbRqJCp2LjnCJphoRxRiObqTjEaGzls
	Gtb5u6SV7CAPmfTwDNvg192G4WBgrJ9eMizB7stKdsB4DIBvCCs+XQPL
X-Gm-Gg: AYBFou0Lg9yiYxqw2RaiGLTI9Bv+lYHdjmHMbsMEbiQ9HZ5jxWrcrcruj+Wi/6XdNpH
	/Yfbcn/dwZf0bJesJcYkKtOPHl7o3gjVGtZXCUGSyXhcszbR+lDRVEVAVdTGvqah7X4xVUzDmMz
	wcJOmRR7+8lj4HAwsrhMI84EzEpJgoijYXhNkQmI6azltRb5MtaCWX9NytWcp3nGtsVzyCpaO0n
	D6ai0OV4EU0YfXBI5WY6lMZNF6z4G9Fw03839+S3qRr8sGehqunVLRIR2d/4mHYExt5PKYlVhaS
	fJGGojFMUonsNdeNczw4qj2+L/y1r8hR9b7k5Og+VToHHsDSO9mKGiNlEmREbKmuUu/fEqCbs7c
	A7AuLKqKPzE0F7AwFs2hWOhSZIgKgDhZDr8UdEJXYTpzY4zpf9tdY5sIoY/ChrUfgEUkz6sBt8O
	VGm+M9BywGhaWTCvc8MRCEfqHM9rAhJ6f1PojMZ0XjCebR2tIyMyrWLj7W+bAUdjCLuFxCf8ild
	r6ZvTdSMYCz58SCIeEJcKEP7Tnmpr2G2Ba3LnuMmmfR+nt5ZUmjwwDvr/7/7AGniAWQhYcA6lc9
	cJjbmJ/Lj/0zevDmgJXRXnmFee0MVXtsIAtWuKliYHaAHTb783aq0hv5T2Dqy0NQPXTyj7jFq/5
	NRznQwEFstocNS67EYe3+E1eRA8PEmBBxGwausA==
X-Received: by 2002:a05:600c:19cf:b0:4a6:42cc:bf66 with SMTP id 5b1f17b1804b1-4b6de789199mr109400575e9.11.1794069526433;
        Sat, 07 Nov 2026 08:38:46 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7bb101537sm36117925e9.0.2026.11.07.08.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:38:46 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Sat, 07 Nov 2026 17:38:09 +0100
Subject: [PATCH 5/6] firmware: raspberrypi: Document memory barriers in
 property list path
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
Message-Id: <20261107-fix-raspberrypi-firmware-v1-5-707362c710cd@gmail.com>
References: <20261107-fix-raspberrypi-firmware-v1-0-707362c710cd@gmail.com>
In-Reply-To: <20261107-fix-raspberrypi-firmware-v1-0-707362c710cd@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sander.speetjens@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1034;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=P9wmJ6Smi8MVD/GA5S6rtkoUUYTGbgyj85KQ4DXkfhY=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq71QRFlLMnlbeWb11lO41qioslLYVWcI/ZHRz/
 v4NLYvUx7CJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCau9UEQAKCRB4zXhFDAXI
 ZwxOD/4og+dmsi4eHShCswi47DDv9ZHedikmZkzDjOGZyYC35LtAC/RuRjfTE6hdkqjCfTZAvLJ
 90kj3EoIKiiB2E3UlFRjsvM7qWyS06TYSpHU+6Y3i3gTfMZTAbGcodIQCCH5Gj2YayYn8tNPtg8
 S17jhQpBQr+eAiHhd2NMtt/PhKCXwmBVfYrck/qZsfSC4xeNQdfi3aaaykGfgvNkWRhqfQi7fQa
 Tfh2JYejd8qdF6TC+VZPgHziKKh/+wh/j0O+aQ1LTCH3aWUVtbF8D1xb9D8esp8Y55MFBgnxJHc
 /QX3fw1yW1aho61RKhNSMQMaKd7+1BCrdCFaHtzbtivpaNTk5ZAPKUL50CEx50ug8Xc9m2lDPjX
 AAw5cs3Jl2aJn+TKZyniqgpgNmtsk4vV0HLJdLFloqfO0YnJPezfK3GnHCvnLNjOyBEK/nvL6Wt
 Xc2iSisov2RiNoQqqnWdZVWnw8l6RtWQWksJXTO3UPfed/BrKG4/cy9QtsMz1Mc+5kzqqUBAenr
 BzTFuJN6wyEhDFpFMbx8dSwugn/gZcae3KcrjcrSZCLcN1t3oU8U1xhIWk4eplcGSP0fxkbbkug
 Kdb3mnv9AQIS/iIGwq27hbJCSgiJ3zseWcEzY1c90pGTAwHlMMxSd9q32scL3qW9UiHRsUIOTd6
 aTudNqUBZQTnN+Q==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867

Add comments explaining the wmb() before the firmware transaction and
the rmb() before reading the response, as required by coding style.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index d9a569a6dae7..57f21e4e65d6 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -110,10 +110,12 @@ int rpi_firmware_property_list(struct rpi_firmware *fw,
 	buf[1] = RPI_FIRMWARE_STATUS_REQUEST;
 	memcpy(&buf[2], data, tag_size);
 	buf[size / 4 - 1] = RPI_FIRMWARE_PROPERTY_END;
+	/* Make sure the writes to the buffer are visible to the firmware. */
 	wmb();
 
 	ret = rpi_firmware_transaction(fw, MBOX_CHAN_PROPERTY, bus_addr);
 
+	/* Make sure we see the firmware's response before reading it. */
 	rmb();
 	memcpy(data, &buf[2], tag_size);
 	if (ret == 0 && buf[1] != RPI_FIRMWARE_STATUS_SUCCESS) {

-- 
2.56.0

