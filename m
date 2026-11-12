Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794456118;
	b=n1F4Ggag6hTWyALwp8E6AoYVYfalNhFFYAklF37OiDnSZJBT5uQSPxKP1V83QPkYUPfm
	 UEOlHMzu0VwUbS48LiofhGZihy/AqoYljQvjsGbaB9PU7b38L0idOkyVnGXe3QBULDljh
	 FVjQI3A0DIiVQeakP8opDufMA0fEq85eD7q9ogdLctfQre5jG6ACLt02Fg+EUb+DTllFp
	 OTHwtTjXVLuBe6axOetbI1mpUeLZArNGpuOr83V6w5Eu2j7KKz/VUwMAVwSoEeU5LZOOB
	 JVM1UWgrp1n/1nU5W/S5jSKATKdv1w0dd5d2E+AdoMlZUCVmfGK/qbDgj52HtxeoQeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794456118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=6Eh5gMzjLNrE9pzuzA3bYCBZpoMbXdPIaF66JFz3LTM=;
	b=L+/cTV0dDWTXAeY8o5nCsO4VdCn8tOGfZjrdlp122OodHulm6VmwVwy6pmTmHhSWChVa
	 Wlp+yf3cQEOPA/VHFwATltjuWBC0IZnU44KA8zVZ/q1KpsBkbkwrJaUArt0nGmaTSVxel
	 UiL0c0SSCGquwRaYpmVbPEMu47V6bTet2hXy63VKbU6ANIX+HH1ejgDh7M2YDu7yMzuSI
	 8JIrPXcyjBSHAKfL6oLh36tnLp2sZ446bKobK5e7voODMnNNFFkwIcPBzHSx8xqBph+oq
	 0mtzP8QQYrb6UOnRG0J9lAJYfoFbvVBoq6pIHqYcBaPjpKWfTAd0ZMPyqxVKbNCcOYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dankook.ac.kr;
	spf=pass smtp.mailfrom=dankook.ac.kr;
	dkim=pass header.d=dankook-ac-kr.20260707.gappssmtp.com header.i=@dankook-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KdAKyYMu;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AA1606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90AA1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dankook.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dankook.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dankook-ac-kr.20260707.gappssmtp.com header.i=@dankook-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KdAKyYMu
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b31ca7e0bcso43397077b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dankook-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794456116; x=1795060916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Eh5gMzjLNrE9pzuzA3bYCBZpoMbXdPIaF66JFz3LTM=;
        b=KdAKyYMuYZofS2NMibKZIgNh2OtbF9bBkLbZHhk1ID6gsVSR7oqpDEVNXLv2HOIPBU
         Ovr4fG6LVHA2GpaVMhEvkJxH0bRlRcKsrc9XNALo3ty5njB8kJoRxjeDZXHTnuH/gFYI
         c6cF3h0VkpdaFm8W0UtN38l3geZeK5SjtgvcIKSwOFc0oVGoHCVF2t3p3R5rWhowd//z
         JdS0sFR/vJOJwVqIuAILZ7KaRQ6RvrAcmH4VFkikUiYsPyNhpCa8w/YxpqLpNkrqEgnB
         ZhizjJ9Zgy8gUccaL5ZumXMF/nFY6cFEqBlvkYt64HEJOvXVyjhH6x4Se2j4k52b6Sj1
         qygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794456116; x=1795060916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Eh5gMzjLNrE9pzuzA3bYCBZpoMbXdPIaF66JFz3LTM=;
        b=ozP+s5h6/+JxIUdXYWq8dtZS/qJVctfZn3IWZVxLRBVcTuTDvuTKlIttoGbYlbu+Bt
         9kDs0EFr6qMS07A21MJjAa2DDjrgUTTOl6eDs61CmzCrkssfL8pNQTI3zcBoYxZFogzK
         r8JLOh43dK3U9BRppSQhKfMFBSD/A4zKar3Q8/Q8wL+pssa701qA2s/tlifOgDS92yUt
         flpeLSTcCBdddP+BIea9EVLVmY2KzDR/zUSp6YLRgL6uhHl9xbf+mjfKclMgRMazsI+2
         lnAw+IfIcF7vNtIJXvw8Ubc5NGAK/LzhW+osbXBXk3pa/F+1tX3RCQYOfNWNS4FYm40H
         hFyw==
X-Forwarded-Encrypted: i=1; AL+hErH6r3RXTIMU6l4Iwt6QQYtyu8Z7EIyPCtq3XQ+7rbgUOhIM1esRAtVZwWa8GpUSWzTgUWnSlEzwdX3OrZE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MLQwuD9sgChm1+ZjjfzNMkkjtsGG/sZ/WieB8lGqe/AHmFzLt
	vErAv5CdLf0qM4S2ayYzndglZMFVE7DQRODZ37+nn7RyIYZLmwVSagW0A9/LrOU8ink=
X-Gm-Gg: AYBFou3bcAf52/Wg1XosGyHx/Rx02ubLKMd0W+VmpSPl0PUQpC6e9CjJVx8H9X49z/a
	SoNH9dIxMhB7jqYQ0kiauUrFSygboI4OMjD2HBPNawZN59gh+s8z5vGkMiBL4fuI6FjVd8e13GT
	8qkashD6JcvnXQH7zDtp43Zr811zZMhbt6i50RhGQXaH02A+83t8Qn3qEwx022mZ30Vx36V9ZkI
	E8mkVQrJe90YoxKCVxoSkvoE5oV+2zHXzYN9STkbDukAONSzBhWzfWCM0sI0AQu2J6zXG1T1Q/i
	xFV9oeCgwcHwH7QSkaERx/WduEbwrtqqUjqXeqTNynTTTXVvKmBvAkBHvNs/SNmkV3Xg7gDMcLS
	8Eit0cg45SEpFNoGY1Eqh5heWu1C9USMEWr6egUytxg7FDHdjgJ4gALdAb77M0gRjK31aELDSd1
	gN4HaUqtE5FyIz0QLRJXw9Rz6fRs3abb5gW+pEa3V9xzaSMaAHrmFlbnL63DhZzrJt80QODSyXq
	RlT1Li7aXRxpQJBwI7A1FRKikqU2JsHsi6zusMj6cr6vb29j2Ixb/KVwZ7W52oCoXFF8gXTn40P
	YQlTZJSMQdr9B5jC9Bp6YHXI
X-Received: by 2002:a05:690e:4505:20b0:679:fa73:7313 with SMTP id 956f58d0204a3-67c67effe84mr2408584d50.22.1794456116554;
        Wed, 11 Nov 2026 20:01:56 -0800 (PST)
Received: from myarch ([220.149.255.19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589cf1fcsm6209654d50.13.2026.11.11.20.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:01:55 -0800 (PST)
From: fixca <jaehoon1744@dankook.ac.kr>
X-Google-Original-From: fixca <jaehoon1744@gmail.com>
To: shumingf@realtek.com
Cc: broonie@kernel.org,
	Vijendar.Mukunda@amd.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	JaeHoon Kim <jaehoon1744@dankook.ac.kr>
Subject: [PATCH RFC 0/1] ASoC: rt1320: LG gram 16Z95U speaker works with the BIOS init values
Date: Thu, 12 Nov 2026 13:01:42 +0900
Message-ID: <20261112040143.6945-1-jaehoon1744@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261111013953.4011-1-jaehoon1744@gmail.com>
References: <20261111013953.4011-1-jaehoon1744@gmail.com>
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

From: JaeHoon Kim <jaehoon1744@dankook.ac.kr>

Hi Shuming,

Follow-up on the silent RT1320 speaker on the LG gram 16Z95U (SSID
1854:056c), from the "SoundWire audio for LG gram 16Z95U" thread. Thanks
to Mark for applying the two ACP patches, and to Vijendar for confirming
the AUDIO1_TX pin.

The speakers now work, with one change in the RT1320 driver: using the
values from the BIOS SDCA function initialization table of the SmartAmp
function instead of rt1320_vc_blind_write[].

Results on 7.2.15 (version_id=2, dev_id=0x6981):

  rt1320_vc_blind_write[]     stream runs without errors, silent at 0 dB
  BIOS init values (patch)    speakers work, correct L/R, no distortion

The BIOS table has the same structure as rt1320_vc_blind_write[]. The
differences are listed in the patch description. Two of them stand out:

 - The L/R mapping in 0x1000db15-0x1000db23 is swapped compared to the
   driver, and the swapped (BIOS) mapping gives the correct channels on
   this machine.
 - Several registers are written only by the BIOS table (0xc5c2-0xc5d0,
   0xc050-0xc063, 0xc582, 0xc60b, 0xc682, 0xdc20, 0xcd00, 0xcf02,
   0xce1b-0xce44), and 0xc900/0xc901 and 0xd471/0xd479 have different
   values.

The attached patch is a test patch against v7.2.15, not meant for merging:
it changes about 50 registers at once and I do not know which ones are
required. DSP firmware and RAE files are still not loaded on this
machine, so the speaker protection that Windows sets up (R0 calibration,
EnableAdvanceMode) is not active.

Questions:

 1. Which of these registers does this design actually need? I can
    test a smaller patch, or narrow it down by removing groups of
    registers if that helps.
 2. Would you prefer the driver to apply the BIOS
    "mipi-sdca-function-initialization-table" in general, or a
    per-machine table like in this patch?
 3. Could Realtek provide DSP firmware / RAE files for this machine
    for linux-firmware?

Thanks,
JaeHoon Kim
