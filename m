Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007084;
	b=EfMngIr2r5j0L6oeqSKQ/AvxV3BViBJCAZcKV/OkRY9bc8DIrcEoocqvMosRde/A+xO1
	 EwcbW6SxW2mUtkvfTLtIMe4gwJ1a/4AUvK6/mb9s9cZrvJq1LLch2EEqqr5TlaZaCqVsj
	 PLZlthkJgcunLREp39yZmK1TuQdU+6iLyO7d4X62YIbAonYO04iKdATRBj2mjf/68GmUU
	 z17blYfwvBTkoXi2ACkVgUP//0axVpD4pangtazJKdghYfCjuFIlfDXUMA2nrr0/9kLaM
	 yB9cOiquIbyrYa0n2i0VYB+cVQEXLDxse6e8Q55pSXCxHcmfTjOFDjjWYmIXNwURVmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=W8Mga2ustW/C+r7h5ElKYQM659dh0dLRlTT/X6xp4Hk=;
	b=it//C2CQAbg9xKkZfbgOZJCJuK0O/72YXDFi0kZqIaKlxXT+tFQx9o2LSv//Uc2Pc9v2
	 VZ0a1c8Lwrjl+ifyB3Peb+msNQHch8fAtVKaJ8KnKVJj8oJ/Bu87SnMflj2pm7ZD0PkLl
	 3BQGdGqmnZ3coAeHdvLkU2Tm2+5axQY27NLlIJpbUG81X7DehnXtbD/KIRli2RaDH60r4
	 mjNRkTKGDQlUIPiLy8m4PESuMMu/GVyzLxHXX3WLb9GSBheAn3tix7/h/VtV0wVXy/s/4
	 mkLiBMStdSkbiZjK9ydjsFOFqrB4AbsaE08WhEnwXXXiWocvKQ3+zL2IFsMGUsR0yXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernelgen.org;
	spf=none smtp.mailfrom=kernelgen.org;
	dkim=pass header.d=kernelgen-org.20251104.gappssmtp.com header.i=@kernelgen-org.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=s8ELpLIg;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F44D606A332
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F44D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelgen.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelgen.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelgen-org.20251104.gappssmtp.com header.i=@kernelgen-org.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=s8ELpLIg
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dc1508191so437625f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelgen-org.20251104.gappssmtp.com; s=20251104; t=1793007083; x=1793611883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W8Mga2ustW/C+r7h5ElKYQM659dh0dLRlTT/X6xp4Hk=;
        b=s8ELpLIgRvmZKl4lDv563HGJYeGt9I2gDk5yb5Oha5jj+AfYxh26jXG37Q8sHeHuE8
         tXXwty8OKSgWati7lbBB6bKW1yYHWWQVS93IO67RnI9O/Dtj7iAK9Ll1pqqomtIF8nQq
         nircMpJ+YhbTSnpIIG5/oRjVCPsx8H6vVO3WWHHHh233TV/rQ9u5AEPAxD3NwxW0KRUw
         ZeDOLpgnNCZN2E3vaFEhiWnGY3cI678Fp4JLhEKTmpIRytTYOrHPm5VFY0QG9futefIa
         F/RG/pdJmueM/hghsX9FCpDec7X862q5LGXuc1o3wwPUxlz1HIqSDD2qrCgCSWdRjdge
         eJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007083; x=1793611883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W8Mga2ustW/C+r7h5ElKYQM659dh0dLRlTT/X6xp4Hk=;
        b=M7+5nenBaMrmxnyE6KTbr8OV8jcRx2V0dNtmpgSkC2p8UB7IHxyXFydRqWWxmVbeJQ
         vCTUvnwRFRb/pB6J00ON4stR3L87/XYgB8wlZbLAdKLcU+enS7uEoECzIl9/11Adrtck
         zldLB1lMh8D2oOyp49Q173QHYAZe1eTLDT0YvW6hwzM2W39YzGL+LjghgC629jcWmBdT
         PHS7SUIF4aAmIpgHHS9ha5VYWjwhsEOZurRACBEFros9MAl8Jh9usorVLMnCoLpZLWpb
         0dy5gq1ADAM2wzVnqItdo/XH0+6YXqOgX0fdTgrRzPINEV94UTGcj75IEEyN0yGg8A0n
         CxAw==
X-Forwarded-Encrypted: i=1; AKwUvBwhni+njfxIBTV1doJa+sBu19dOrWW0iMms9s6VZw3ltNeuI8OrM0WqxJueS+JDXXpTZu2llbhaAmMrjAM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLD/J0hvpWviw27xkk5DqW3OL/YVue9OXJC4smvVjpREVkASjyD
	dxwcrYmSq0cd6414BagD/QFdV1ifYoGCQ4iwhn5wi+MRcrnxAizu0cRktxIk001mj9s=
X-Gm-Gg: AYBFou1+5XJurGpza9dvDVaOTzO3eyIehOFChH3K1KxB6Iba9Qy9qeo6r8a1CIKZc+G
	22dYY8xvkpuGpdxwu8cAxNzvpzu6xF0mhkzQE4dZnpF74N+Zk93kFv5itomkeAGStuIIOUPbs9Y
	yKCEqV7gX55DVRDQmmYta3eFFJBcwJUP8kSm1l5wcZQU6PCuteM8qJjAyGdGJjK9GKxUtSEXLSg
	19P1TG9f9HiWF6NpA+QyFheEQOnHzLOMgIxhE7K6GGbQvoWLqY/cF31UjRv8nGq7n1muN9jmyMd
	s/rShO3zczLeituCFmcL5Er/P6VtkLe4qiXfXshRo22e/U5FaqhfyKfS+rRBBYAlwzyENkyrdyX
	peb3Asg8HcI1JTkdlsHmV/i7bf4tEMEDqi/S93B30kDZ6LJW5rbAXV+RYr7xSR9gZRHNoEBPax4
	9wLb/gC+viepYKVpBcfXWBdd7JwkQc6rr2EBltah/lxzwZmd5BDrzhkLR5tqfLbrpAgkX4T6wPP
	d0H1SX06a8I13z93s3/JX1qoT7akzAot8B65d879R2bvSlxDI7XIc98eTXuqibQcrF71/ZOi+51
	ValAAXxN9Bb9/C7S+7QHXijObsaNHftkYLJneFs1/6vbfYbBN/0TbmtLoz1Y6e2TReXvQDYZiw=
	=
X-Received: by 2002:a5d:5506:0:b0:48d:1b82:46c5 with SMTP id ffacd0b85a97d-48e3eb8e7f6mr9172381f8f.6.1793007082724;
        Mon, 26 Oct 2026 02:31:22 -0700 (PDT)
Received: from kernelgen.org ([2a04:ee41:83:91ea:29ae:67de:9d1a:d368])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f305sm14217710f8f.3.2026.10.26.02.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:31:22 -0700 (PDT)
From: Dmitry Mikushin <dmitry@kernelgen.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Dmitry Mikushin <dmitry@kernelgen.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] Input: synaptics - add LEN2072 to smbus_pnp_ids for ThinkPad P14s Gen 2i
Date: Mon, 26 Oct 2026 10:31:18 +0100
Message-ID: <20261026093118.2312302-3-dmitry@kernelgen.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026093118.2312302-1-dmitry@kernelgen.org>
References: <20261026093118.2312302-1-dmitry@kernelgen.org>
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

The ThinkPad P14s Gen 2i (20VX) has a Synaptics TM3471-030 touchpad
(PNP ID LEN2072, firmware 3324237) that supports SMBus/RMI4, but it is
not in smbus_pnp_ids[], so psmouse drives it in legacy PS/2 mode. There
it is limited to two tracked contacts and shares the i8042 channel with
the TrackPoint.

With psmouse.synaptics_intertouch=1 the touchpad binds to rmi4 at SMBus
address 0x2c, reports four contacts, and the TrackPoint keeps working
through the RMI4 pass-through port. Suspend/resume (s2idle) works.

Add LEN2072 to the smbus_pnp_ids[] passlist.

Signed-off-by: Dmitry Mikushin <dmitry@kernelgen.org>
---
 drivers/input/mouse/synaptics.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index 1ed9261bff..b007e642ea 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -194,6 +194,7 @@ static const char * const smbus_pnp_ids[] = {
 	"LEN2058", /* E490 */
 	"LEN205b", /* T490 */
 	"LEN2068", /* T14 Gen 1 */
+	"LEN2072", /* P14s Gen 2i */
 	"SYN1221", /* TUXEDO InfinityBook Pro 14 v5 */
 	"SYN3003", /* HP EliteBook 850 G1 */
 	"SYN3015", /* HP EliteBook 840 G2 */
-- 
2.56.0

