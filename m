Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329286;
	b=jHKdCWJv+G+d7/6qK09CKDlD35xqGrsVWkfxexi70m7H2vqV91W9SPj5e46MEozgSa5d
	 xxHd/gm6WoHSAiYvZzO8haXgdUuzHQ4bw4b55ejeIZ9WEPBuaFSXzMeH+4tVHYzz73K9q
	 Dr+th/4S0Vf0lupQN9F17bkPkHO/eCZrtNQVOLP51yhYnIYZ7rDe4YWCJPZeQj9YoLwGR
	 e3dhy8Y5cEsYID5EctpSWB/aI4IPZYgkHKai69hWAMyse1FCauf3ATm952tj1ZJrUAhhX
	 bGIIWopgChrKaQx3e2GqeVMICJuL2pu75ZoQeQOBAJefYnpDxGk6y7dChf82KgQ+sNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Vl1rYhAfjK13R83ED6coEGC+SsdHD84fHmnG4iiIzF0=;
	b=BubqX46VY+Q+5FWhpwa439wf0Z2jMzO44jMGOnKRbJV1e325Mg+/tXYK77MVgOK+Q9H0
	 EM1FuMe/U0gf4ZcVmUn9sRE1psqPTdjJQUn5QlE7lZ8TryzT5UH4whfiH7UArk4M2xE9k
	 LWDyv2l0rwtQy0DjMoQrCqmTqKiLUieA0QtOLSWzub0qe/3OtHOWlYq3GHhNZ1yukDyim
	 2DK31gbFHcK73gMNBpSJv5raSo0N9jh//2GIMt0WJLMUPnhgx4CnxwKA7cDEBrVRrJ2No
	 NJA676gAXPu5ZAC2AwLMmI3jNJGC9MxqIQb8Tb59iOgpQaHR/wIL54IHJ3Hrr9yO2tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kCDks4B9;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4C360A2600
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE4C360A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kCDks4B9
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so13345135e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329284; x=1794934084; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vl1rYhAfjK13R83ED6coEGC+SsdHD84fHmnG4iiIzF0=;
        b=kCDks4B91ibZBhgI2SUudFpYYP0qRr9C46j54tg5GoH7pGmjAmmAq0393io2pUfxdp
         L+YKdYxl/9Y58+JViO5RRpXpXVUzafnGUo1Ph7Dt+HlrgL0nZt3i+V0EgKc0EK1fvEFg
         kp9705fID6vukQQoertnO438nlbZfkg7UCM3cYKSRFxWG6K/4MKTHaJbhrD9zyvFP2+x
         iFIDMXAl1wdbKvY22wyHsvfZxm3pXeQQADEStL3sKUPRXANegW+VKNJxDtgDafrO2aPv
         TbU/5Iyhm2826j3Lqe1ZYqHMiu1mq00w7+JwYFkVbQUN6j04M4CeH6/mPAZgQPHGlBzz
         i+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329284; x=1794934084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vl1rYhAfjK13R83ED6coEGC+SsdHD84fHmnG4iiIzF0=;
        b=NNhSVsCHxE2v8Oij4+EOfSAl3QwXVLKPsUqGZ79teLQiegbO1QjVw704dD8xA6OOT/
         EmKOwUQtC7pktHnfM25myKZ8+YzjCAMdsy2BaX7drXFDRPY0ueUXJ60VmIhvL/gKFX+4
         pPDwAmU8HuHgL69k7Xp65Byh8GGTEzRZafkZ0U9/o6wrW5SbeMXr+uzPQ0F94TlnEa1n
         4QUx/5URyg9G0PdUpoQZ3qg2GTZwNe5+1uhp502enf4vlH2zlnKe53280Af57EFjuDvo
         GMvlX6qOqpyCuZIBVWAv3bZAWqmcE6kgTwvFCuqCxMwdyjP7vuQG30vTZy3K6WSBWIkS
         C7NA==
X-Forwarded-Encrypted: i=1; AL+hErH4jHrXnMJfJVGdBzLbW1Eum7vgkP+sY5aXiwldG5KjfFYU5+VEwdnVKCwCQ0mo2Z7CNnTb/eUcUv4vc8k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ldK/UXWqH1x7KhA9hUFloCvVOdPBOHTLigbgBpR0ENscG0C4Y
	B95d5BCwGNJ0P/C2ZPZqQg8de9xQD9359uIzxNRhURtgmL35H0xAEMNi
X-Gm-Gg: AYBFou3w70CXqseHOJUKFCwV8CNlJKExQdRcqjLC069KHnm9ohND/Y+jCN16gbjcm3O
	1CZWF+72ljKkfYX68nKIWYMGGK5zMdFUJdtKiUbhEMTW6TiNtQJLAxPfD5j7Mf4nmzPv2CsDB04
	K55kFVpdbfakbxZJ6udBwMdCODGyS8j37qxtyx7zSbafDOgtb0sNs1lj6iGlaPtI3ZwLpGqsElX
	W7fF4IDA9fb3tVQpOrFexmEeqE1SGomPDqR+Z61V5FQeLM2FmDAgMDy97RuG20zBbXd7aKEqJGy
	6x4Is4unsnitYq2/x6fOGFJ0wnRLfpUhHgELoMyVIZImz2XMwQtY5kELmi7jKIIfSgk9ViI+aUA
	fsHEhDrs61PP3QXdAkDQnNtUkUlD9l1uFGQ+7I6x+B4LZlVpLjbaxSuLfoNHF4+6gIS6qRKfRNU
	YQ81Rv8ZjmofDWByPRd9Hln8Qqn6B1RGXbKE9358XYyIhgeykCeUo9n+hwbBO/KJS2BhF60VO7v
	0xtQ14e9o9X4fExgxQ8Dhvc+HKXKtykJnU/OKaitZkggH/q6gN9OwY39ERJMd67Eq2CMr9/0+3Y
	kSryzwDQbBrO88Cpe3nS21a+6tyhZULEV+RNjfzECsZ1iYfJA1Fqusm4J4mPUkFLMNDcXUXSgQP
	oVVJqFl3EoU2UNSc=
X-Received: by 2002:a05:600c:8b2a:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4ba02351468mr52396945e9.16.1794329284254;
        Tue, 10 Nov 2026 08:48:04 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0233e5d7sm58289665e9.1.2026.11.10.08.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:48:03 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Tue, 10 Nov 2026 17:47:49 +0100
Subject: [PATCH v3 3/5] firmware: raspberrypi: Add blank line after
 declaration in probe error path
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
Message-Id: <20261110-fix-raspberrypi-firmware-v3-3-e001feb542dd@gmail.com>
References: <20261110-fix-raspberrypi-firmware-v3-0-e001feb542dd@gmail.com>
In-Reply-To: <20261110-fix-raspberrypi-firmware-v3-0-e001feb542dd@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sander.speetjens@gmail.com, Manuel Ebner <manuelebnerli@mailbox.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=759;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=oATCWeVNja5PpD9R+W2V7XOTEMrBChRYypl1NtcmQ5o=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq80rAIRFFQXasrIwqGTrwSpqg3wa5LcMTP4/9P
 Xz7kuhtWDmJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCavNKwAAKCRB4zXhFDAXI
 Z4bVD/9FjhVpXzZfrbS0bLJE0dn5UsBGcQyplnPX00c8QKHXHi9uYRS1E5E1yBhUnGHNX0/7mEu
 NkO7ZbXhdzVYxO+klLVGZWXaEy91QGigTWq6d/1ZrnVUEtvkzXveNO2owghVYfF15tmXHfl91Yx
 hCishgAVMlL9V0b5BC/Yy89y0F6aMJ6oQsKi+Xv8YH0ppjg35NiRT4Kk6UWlLgDFixRcyMW+6fF
 IzYX9Bpb3vRYenPvt/Y+s5CuPaPF08kjk2/JFima+Xh2Ma8kCMnZfiAQvA/6nnrlG0j9XrMiKet
 xrKgYlUNBpUYAaX76s5L8Z2kJohBUwJN/uuIHpwwO4qBYzlkZHd+0PFDZEJL030udF7iPIFWNjv
 XXnytqCdEaCQhNzOC/hz89Zh4A5jJXooYPGnDz1DRij+IgfUKPnHQV4zH06iGTAokTRqcCembdJ
 WUCFNN/tDxIFNXhzFg9KTszfPd2zBUNrdAR+QHnVdXekr87nsfR9Xe2/gkJoPxwvL545FvO/4jK
 yHO8Xi7MuJNVL6i3llJ+Oq01293Yj4CHOY9ym3jHwuZavGc7jFeFfr39VBDl9fwUk2MYSkFHZrm
 xugHWzfsei+tYtxPtCqKoPpm6baf1rdvSilo8uBXbMqKcA5ULIBLRs2Ijg9q5ww61g+YJOx1DPl
 0US1McX57zjl8hA==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867

Add the conventional blank line after the local variable declaration.

Reviewed-by: Manuel Ebner <manuelebnerli@mailbox.org>
Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index e0c91719b4d0..04163c3f385d 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -315,6 +315,7 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 	fw->chan = mbox_request_channel(&fw->cl, 0);
 	if (IS_ERR(fw->chan)) {
 		int ret = PTR_ERR(fw->chan);
+
 		kfree(fw);
 		return dev_err_probe(dev, ret, "Failed to get mbox channel\n");
 	}

-- 
2.56.0

