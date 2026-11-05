Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866727;
	b=xTln3QQlD/ioGPgz295P7dYkTzQ12tNghwOsWlRo9eFvSTO5BHvKlA21Wf+NUkPMCoEH
	 wgf2Jsu5ut8SPVYpqNLSYjwwf9GrBa+Ndnd7lRuEqQvF2MOO+lhXnu/gNlXo3nYestUzq
	 9kuQL7/dhQvyXvd/vZ4LWYq3g/FZASOFvrAsgx9tSm+eNESn2yrvmMt3VVQ4HEHMQ4aXJ
	 4EJfDMfxffj75dBbhruQ55ZW1Mf3/DT9IaQJy3Znn2OlxT8fAK/AtVvip8qL8oherTXhV
	 KW84EWoWv/VjrhxXkMKlDg2zLcUGkFcp8n0Oug2NxHSTHgM6Y9I5O9+Foc6uwLAl0PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866727;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=wMMaHhKFGPel4o9R+b5ZeHtuJGRm5DfNPq77qvI5+Fk=;
	b=xmG54iOqxFaZh92E+6tdH5AXYIkQQyT/R4+UPoXJ3rObrc1IjSzcNvxDw29o7i+Tw/A0
	 mPs3hBtiEaiNRNggPj/PywgS5cBgx9aTFn5PPS9mdf68xN7fiaVe8HNdItQE3n7PJTBHi
	 GC0lrVr9PFqN85JCPPNF5xZ24/jKgF8SCszPA73V5/gsa4dLXDKPW21paUOBe3k4hhnsi
	 Mxun16yhzuG6pvQmzjVe3q+/pGCTu6NFwiTzWkRTvhWmX2fmCGFWl5R3TeFLpsNV4tnkd
	 niy9zYLAjb+VOkECKM77bBBedc5K/8uoxoyVxUS+2aQe0CqamFJbYIheCFjEOb8Snfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HLZLba9v;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=SYUskHBm;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5951606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:18:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5951606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HLZLba9v;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=SYUskHBm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793866725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wMMaHhKFGPel4o9R+b5ZeHtuJGRm5DfNPq77qvI5+Fk=;
	b=HLZLba9vPQE+rRy3G5SrfuwCURlVsazB2aZh2aA1mt/KLLe185S++ZjlPuhcOD1WJEOEEf
	hG8JQnZLlRnHogmDlwKZM/7fGugcKSOimomMA55G6VYyr3gFV5Q+47ixzGEmAIkmERBevd
	hfwd0jQT+hTJrmQv7TBwT+Fm4KA03OQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-1cDqsT_oNXyuL8ouhjN9sw-1; Thu, 05 Nov 2026 03:18:44 -0500
X-MC-Unique: 1cDqsT_oNXyuL8ouhjN9sw-1
X-Mimecast-MFC-AGG-ID: 1cDqsT_oNXyuL8ouhjN9sw_1793866723
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a1bd21fb0fso2222985e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793866723; x=1794471523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wMMaHhKFGPel4o9R+b5ZeHtuJGRm5DfNPq77qvI5+Fk=;
        b=SYUskHBmHv4HPJ3e7/EjHVtvUky6CkIXCmBBYafb0vpInznW8c989ZMnvku8KZ2ICi
         bYiCoWey09yTBybuH1NUnJA2toBVxZux5PigkQ04VFJJFBQDNeCOKwvGNB8bItfp/ZmG
         lzhmSQwEA1mebYZ8PRMBewnz8v34rWWyurQICSSCmHGayDnfuTo7tXGq698gzWVGjb84
         /V4lmODNkVzg2F6dxwEZafmCDYA835mQ41PbpfcmDymA6914LZCF3OQQX1MfFA9Ah5wr
         4LPqF/aVgYII5d/RcAemhoWtgJGwQzRDcAbL2LgTlbwZTb7icxCGZdSlRFriFsYcHHuf
         MTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793866723; x=1794471523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wMMaHhKFGPel4o9R+b5ZeHtuJGRm5DfNPq77qvI5+Fk=;
        b=thQ+ePoCoH3HUjjJ8mlznKPLHKGS/xDN19sjhbUcrSMsfI42RI+0si5fSIFL1e/w4A
         5fBSOXadkOOx+97iitlNl3KmJ4jHu5hzYlv3VLnoLw47TdXyxfbYGeYpKneGP8WB+SrG
         RCPCdWCRV2jJCInlTDQd49u73CqO0wzagXoG1JffK4npL7G4LXce3QALmVDbJRTaUZ9/
         khSfzQqz97IkUmfiyLgBp0eXqKBWWxPDQb3ps1P6+pRIOip60gO1gPvu26MWcOZRgw6O
         uD7ebU1B0Yj4+pgILbF1HMRmusj+fhkQPvMrLeLUAgpd16oGnMRIpA5xtvpgyhBaE4jn
         m1Dg==
X-Gm-Message-State: APuU4Z/giNcEGJ02OY4En396dJy0X+ciOs4AcQTK+YxS9tZWlDe3S+xo
	XGioM3IMftPtFUGX0mytGfHujlq2A0mgrXwBRYtas1hH+bf5ALsfgdXUzIg66LqVXIl/vp3+mpa
	AHa7YyT9sf7cqRYccr2Q4PqmeUlq4Y1OKMYZToqIAEbQn/Vb4UIKQt3LsDLVTEB/SrOHVcLTr+a
	sq
X-Gm-Gg: AYBFou3imx3lQsxuHECw+TQ9qaROwp6a9RNaKzzgTGe2Px9cKU0Wup9baXG3uO/mRMm
	kGpO2xaKqGIIWdtZE1PW1rIsdkx+cAxp4DIcoqRSmi5z1ABCCMoN/z4gsVlhqV7YtPwmmx4EtwP
	cnRw7rBdLk9xBSH6iL+tWDrhSgUlG2OPEmOCq/CJVVKqjgtKnEXEGliDox2M6dGc4xNS3LYKOpV
	EAF9D0ZbyipQ07sLypDtvZbCiHDFzd9p0lOlobsrQ5zAar21ejnaYiFHbIRx+r3/cpLI+LWlppF
	iv+b8NFt+Ui7k4lDjAqqS/hHAcQFZjtX0k4AsuKVXYwXe9J3RtgXpjRXxhmR6hYkVY0ilUH8tHE
	dEge5g/gh+mERA67LyaZfrZCIzqMwjK4ZvOsVuLmRBrkOA0fgSov1i/CyCfpTuqwDeYv+S3PxtF
	GKl+HTyZVU6WYKkg==
X-Received: by 2002:a7b:ce0d:0:b0:4a1:715d:1913 with SMTP id 5b1f17b1804b1-4ac177538c5mr306355995e9.1.1793866723494;
        Thu, 05 Nov 2026 00:18:43 -0800 (PST)
X-Received: by 2002:a7b:ce0d:0:b0:4a1:715d:1913 with SMTP id 5b1f17b1804b1-4ac177538c5mr306355815e9.1.1793866723106;
        Thu, 05 Nov 2026 00:18:43 -0800 (PST)
Received: from localhost (119.red-83-42-172.dynamicip.rima-tde.net. [83.42.172.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b63863d490sm4513405e9.2.2026.11.05.00.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:18:42 -0800 (PST)
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Thu, 05 Nov 2026 09:18:32 +0100
Subject: [PATCH v3 1/3] clocksource/drivers/nxp-stm: Fix max_delta overflow
 on 64-bit platforms
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
Message-Id: <20261105-nxp-stm-fixes-v3-1-8129b912e74b@redhat.com>
References: <20261105-nxp-stm-fixes-v3-0-8129b912e74b@redhat.com>
In-Reply-To: <20261105-nxp-stm-fixes-v3-0-8129b912e74b@redhat.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rt-devel@lists.linux.dev, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, stable@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Enric Balletbo i Serra <eballetb@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793866718; l=1276;
 i=eballetb@redhat.com; s=20261026; h=from:subject:message-id;
 bh=3tQAzS65C+p+CwI89Nw27cv/4Q7pCmNGpT6liQLCnCM=;
 b=jaRNvqRfj8/W4VNEnG8r/OzoSDqnNebhjk7Le5MPZPZ/1fZnzaB0e9g3Nb/3xrmRC6O+hw35m
 fCu2NAhD8LSCYKJ4rEV4PM5QL7RRiLqTSmrebz0QAFyprAwC68ZJ6nd
X-Developer-Key: i=eballetb@redhat.com; a=ed25519;
 pk=5zh6xuAxTiQwglL2NXQFqWuyRPmCE8T5KPXLbNXhnKI=

The NXP STM timer has a 32-bit counter and 32-bit compare registers.
Using ULONG_MAX as the max_delta parameter for
clockevents_config_and_register() is incorrect on 64-bit platforms where
unsigned long is 64 bits, as this exceeds the hardware's capability.

Cap the max_delta to 0x7FFFFFFFU to match the 32-bit compare channel
width, avoiding potential timer event misses or unexpected delays caused
by programming an unreachable compare value.

Fixes: cec32ac75827 ("clocksource/drivers/nxp-timer: Add the System Timer Module for the s32gx platforms")
Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
---
 drivers/clocksource/timer-nxp-stm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-nxp-stm.c b/drivers/clocksource/timer-nxp-stm.c
index 6fe098a4a33f..ee249fed1b91 100644
--- a/drivers/clocksource/timer-nxp-stm.c
+++ b/drivers/clocksource/timer-nxp-stm.c
@@ -346,7 +346,7 @@ static int nxp_stm_clockevent_starting_cpu(unsigned int cpu)
 	 * minimum ticks = (rate / MICRO) * 2
 	 */
 	clockevents_config_and_register(&stm_timer->ced, stm_timer->rate,
-					(stm_timer->rate / MICRO) * 2, ULONG_MAX);
+					(stm_timer->rate / MICRO) * 2, 0x7FFFFFFFU);
 
 	return 0;
 }

-- 
2.56.0

