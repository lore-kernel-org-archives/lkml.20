Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204672;
	b=4G+CeAXrP882Y0AVUYFKAv9pooxXUhddV4GYrY0tN39Q0jXj54lCQtXoJpurXAGnuX2B
	 KfJS5+eGkaPrNx1qhGHSZDvPTIwmeuSU9APc2r8c2GlL0VIixvuEpZTspdvK+VSBAeWjS
	 JhSI6C3/Cep4bPmW0HUVXMugzlGhtNirIqs82AR0SbHcqBSvBQQT6OKTWlbg/fSr/TM/2
	 0zisNAN9AV+V1co1sm4+MCOCnOsIQwXtf2mXIYee67Lz/sa1jHkOoJIyhE8/BHiYvRqen
	 vI4dVGH+yRTFl8r/GVedlS3PsU5hNPALttTfTORMYnUO5wCZ0a3Iy+RuZDgXM2knmnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3Id2km5CxlYm1pWn+dcidbAfMpqvkr28vGXkLmQcZjI=;
	b=r11ZC0bBboXhCuQrlPN+NqY/T7dN0IQU5VFP00WYT6ZXPehX4OfH9BtFkk0DsYAREqro
	 4d2zwd40m2OjsLvmQq4+/kSFNISF4Wlxu4rhbBH6oEHVkS+BhR5zLU/le805axttDeA7+
	 qGBlYQlRmwXXfZMstIgct/lDGQruEDdUJcVuMb5cP6Y4PgFK3uNoyHt7bJcP25gJg4pKw
	 HvGEe0wjLIv9X8yESmAYZEwihkGdyr2VjLAuoVDcvdHB0KmfFOP6T33BCC6VX4Rbsj8/T
	 kbGIYWnUvu2R2XRoggcnU+KgiRdTnq7F4dgOmrBjTlZL9pR+0NTTEufXSc1EGHDlK3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NDQuNPNu;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD359606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD359606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NDQuNPNu
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso1023281eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 22:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794204670; x=1794809470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Id2km5CxlYm1pWn+dcidbAfMpqvkr28vGXkLmQcZjI=;
        b=NDQuNPNu+wO1kS1Dx2SDzKWSRL67InMOdPsMwvGfI+nDQYbctvO10qNrQCKgyl4Qvc
         jWB4bUwuibbuW3fmHUix1a+ixJSRxVQBigcQBvcwwhy5GunugTwUXTgcWu0FSao4WzTA
         iCGPBJnvc6AwcYH52h8QjZxp0GLZKE0ji0dRjrUTLo6Xrcek5ziqHyX/IESkGmqW2Sb6
         NMlYwTArmhUvvLKNEZt+UEih08xp/TDB59pib1PfodnMrgZD3QyH1BVxyRzDNY/FoHZR
         MCpBQCxdH4WcIgmA6xrFafLWP+TI+ESAUHiERV7lqVCr7cH+nhfUBMBg0nH+9kAWiRWD
         dT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204670; x=1794809470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Id2km5CxlYm1pWn+dcidbAfMpqvkr28vGXkLmQcZjI=;
        b=suLPsRgEoOCWfDuhx3f3OjEHeyV91NXUzbgmvUkaMx92lNjE8lM+DAicvkSsLe7GfJ
         Y1+QAr0k92OQ3cOt54hjhQXuw53Z8f91qdIoqMyqOgWU5KhI4wJ6c7QHkVi6EPtSqpvg
         CltST887yYgmcEtikQmudhnFI5ZERCH0olhocqH+s2lLP+pTrTdEtdz2hEpn6KX+VDrl
         TIRRYekLhSjjdGr5wXVrm1e+aY09QPC0aAOyA2n8fTStdpnaqRJu6G/EyaBXFtkbSYQw
         XSFyPYfq6Fa0NLnJXY0LGiPgCNpAFIcJtb/mw/boq/B1FPtst3wMB2r7D1sJotCtyepD
         d9aw==
X-Forwarded-Encrypted: i=1; AL+hErEOcKi4oCBb6SEidri+tNSZHJh6N6IytZkinxX1+tUfZ9x+xfL9vmpVwxqoIk0gS9OriWuHB8uOsnMmOcE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uKvR/Z6piXo2dqdb8dTqIWX3YdAht8GudnvWHz4cbh6h+mTrh
	wzoEHv0iZze48N2K5oe2q58CrkXWv+3BQ4VeH65qRJYcDRkl7rBp9Tpm
X-Gm-Gg: AYBFou3LciaynacLElTpUK22qLcx3WHjMhVDnuZyNE7Ycqib1wsuS3EXO9zg9cbbWsd
	P80BAKFi6iY71eKwieQTg8IRCnGn1bGLe8QsZJ8Ey/H/xfFKVsDN1xQvO6w6PJl+gUi7HAVCbg9
	S/TejA5Tsoj0ZgIwmn5rdmxyzVXcST+/v4ndpjKkqGD96Ml4+2VjzIhysJFACBJJeLDSILV9Jao
	JbrrRZ68bOlXbX5Eq0jOFHo9YZbJ+LrmFgIhYedE5r6jSgRhV3LwxVnEEVBtxfknlYTsAekIMWV
	nfS5jOulRPmhWbYUbIAB6Q1DVEnJxvtAzpBX51dktXL+tdU+P3ObwzekfhS3DsK+oN2oZHIwLuz
	pVPwkZ46AkHa2unYLEYS4MvKhRJZ5ss0M9bDchGpiKlmArGcl+L0ZA+fR03xCMN5T2U91Il66o3
	+od5okT23+jpxu5YJcq/YtP0FDiFS/Lam1y7Viuy1g5QwUvPXNMVeVl27Cf5J9rS92CKhiVWw9L
	dEauihCEc5faDuYTo2K1U/FZBtZDQVvOlMKZF5eFRcv+JxWxrJu+okMpLbgP22WBrEgUOZQ5oVg
	7k55JacFO90+rFwNNmQJXw8IxjedXJinQq/SLj1ze8Zk7RM1sL/HDBp7X4z37EhCD0TR3TgiB7A
	PCWpuhlHtv5eV0ekz
X-Received: by 2002:a05:7301:1908:b0:36a:180f:3154 with SMTP id 5a478bee46e88-37256615db7mr5282253eec.18.1794204670493;
        Sun, 08 Nov 2026 22:11:10 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:3588:b56:78bf:db5e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372661ede11sm12201192eec.21.2026.11.08.22.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:11:09 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>,
	Hans de Goede <hansg@kernel.org>,
	Edwin Velds <e.velds@gmail.com>,
	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 02/18] HID: logitech-hidpp: use GFP_ATOMIC in hidpp_ff_queue_work()
Date: Sun,  8 Nov 2026 22:10:46 -0800
Message-ID: <20261109061103.2887636-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
In-Reply-To: <20261109061103.2887636-1-dmitry.torokhov@gmail.com>
References: <20261109061103.2887636-1-dmitry.torokhov@gmail.com>
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

Force-feedback playback, gain, and autocenter updates are invoked by the
input force-feedback core while holding the input device event spinlock
with interrupts disabled. Allocating work items with GFP_KERNEL in
hidpp_ff_queue_work() can therefore sleep in atomic context.

Allocate work items with GFP_ATOMIC instead so force-feedback commands
can be queued safely while event locks are held.

Fixes: ff21a635dd1a ("HID: logitech-hidpp: Force feedback support for the Logitech G920")
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 6b1f55483385..40ebab5241b7 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2542,9 +2542,10 @@ static void hidpp_ff_work_handler(struct work_struct *w)
 
 static int hidpp_ff_queue_work(struct hidpp_ff_private_data *data, int effect_id, u8 command, u8 *params, u8 size)
 {
-	struct hidpp_ff_work_data *wd = kzalloc_obj(*wd);
+	struct hidpp_ff_work_data *wd;
 	int s;
 
+	wd = kzalloc_obj(*wd, GFP_ATOMIC);
 	if (!wd)
 		return -ENOMEM;
 
-- 
2.56.0.506.g506a7eabc5-goog

