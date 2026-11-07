Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794062111;
	b=0FGIJsAJPWy3ALrP9zh1sZ1ZcCePVchzFijpZJJTJSbMhBsirNHarUsQRJG01dUgpF4O
	 qhCosV5Q8Gub3fqheZVKI3xzfyJQsGmPIBdlS53tkqXVVhkexafBYdpn51AdONyO27nNa
	 e8wr3/p+EhXBtgCzoQUvHElWbGrA+mXHHluggzxf3oT/4SkggoXrcp5pkGJ552K8bAQaH
	 HE7HPNpoQwMjtIyjUpKYrb964vpF7EFBbDMMUfEHN05EFX30z5+Ev6Z3jBlIvZcwe1X3a
	 u6FHHBIUZEYgphZkQy0pOD3q/6hd9v6QA3hwA80RAc/1uLbh1Th7SPM7F9kns0cG27g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794062111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
	b=IzvVl5zK5h8rZp9cP4VW6qBOh4IendfTFnpQUGq5YKUShCFVNiZi3HRj+Jbh2YUtcTPW
	 RTWP/dQhITBizKNQH10uFyolAwytkRXDmxFNgo3WjOgFWB8xKjmJOZHYKmAHqQ9xEiBY1
	 J72jtD8dBB8C5BUfED0hVN4ORnINBcuI3bUx3JnftpE0tNd6CWXEP/+RXJcbhyG9waw5b
	 B79+ctiO4tEJ8YzQ/C0v6mBiQqRM/2Eim/ACIJkiCnl3iRzme2Zr/Plm/GPiX2IsjBnJ2
	 v1rl2Ema2ciDexACp5PeXWf/eOIq0qMQn3rwkP6jc2fRUQ1Z0pCtuqT51XkEUscm4uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o+zWiibx;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AF960A382C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 14:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74AF960A382C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o+zWiibx
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so2578595eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 06:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794062110; x=1794666910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
        b=o+zWiibxlcf1e4Q3HKHmJB6FagtkHkcBWFoJcsvBox0/HYRtbyrR0rs0+PcKHa8RKY
         WkYD0B/eLRXTN2mrXft26PujZ/4+8zklSHs3wxdtYaaiwExmFb2RW5qkNWkEeSsAfSvt
         DISr34BEEG1jadyInKQQFzbTUOzT5/1V51+Ib8+EAll4z/7Qomu4RD6HSXV8kvd5sro9
         PMKfsP/P28cF0zCWziu835NaIH/WnJlII/2Fl3ZABlgUPLAE9GhbeY7Xle/dpli9mq1F
         utn2aHBDM6XT/BGvXmJW8Npx0pH91eYeSc3AwgPQeymRSMVyxtQiz/+WmOWWRSYoCzqr
         hzcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794062110; x=1794666910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
        b=ovqrcsEMeAxPpLisx/xnqMekqSN+wtli3+Bb3CW+0mu2Even8xQ18mA8TV+NsCca9n
         IZ6t6Je+JV4SZM9Yol9kDHe2AbBjcuwARpKZND1clbYBlsjm6TuKNOdLsL6NOKDtvFQI
         +COs2bh0ZBpmTjs3y9iKn9ogSWHQZUNnBN9dcgFlOcCaRWr47QxhbnCPjeRht169hM6a
         75JL4Ub88IbTWzbnb6Cw80l+kBQvSrvfw2bd7VlmQIC9pQ2ymE7iHmxByuyZSQlc+Ue3
         fQFKcdmWSI4KTbV+sR1Z6QunC0Bv0ipY0AJPi8+oxBbOLioJxMXizrw/JImialYUXuFs
         OCuQ==
X-Forwarded-Encrypted: i=1; AL+hErEGrzQoCUm/oAJH4EWI3S2+WMo15JL70vVrrCYRh8HWLr34h1xfzE4/ceFCL9vcZ3JZ1aZJ0PJz9qhEi/M=@vger.kernel.org
X-Gm-Message-State: APuU4Z85qpDkOPtazgNRzzGfeLQLgKdiVWxQt31ZxRxNWBOzlXzVLgXV
	sdCaIdzMVgqrEp8bQMHJgz0moKwzIThmfVv5sTZ42lRI98HHnSmQQhOA
X-Gm-Gg: AYBFou3biTTbq9401oxj+ZVxBO5/Ih7qsNG+wk8o7sdWh+P/ctI9CWpB/snnwXxBJ/K
	ATtagHUk0Fawi7AWJOf2OU6shkSTELITWi5EVXwds90EesoDsJ4Oe2lQVeI6jxRtJ1IH4O2QfIB
	Q14c4XZzwLYPlC4++4eWy73zVG+vpHAF6yA4mVkNgcHsBrEPtr4WU4LzdEbzSriiEBHgayUcA+O
	7LmbxSUn5SguPVU1eL7oKmBbWQ6rVe1+obTnQ0wvwZ5vMDUvgLw6xnXUFFLsZ9ykTLb4eb18AIn
	qzQUPY+l9QETbF+Fbx6+4Js5pmu0zuLkZooSMq6UpzEA1mbrcxA2vC8j/uvMfU/XpeY0LqC7hky
	EfyzWQwkx0J2iiIMySbxbtm+9D6sMoSnWjfgomj8fIcM0w9ay57vkEykcMa79ASWpUDVB9nkrSd
	KSU/wDVqGFaA2Z/BmsQLWwJ4FbaIGRmnd8KUPxlwr+ot850X4MZguIfd0D5d8kfX1Ie9DaYYY7f
	7O00SxfW1SntENJhADL/FSaWnf3qMGSVn+8ysm8HlhE6JaB+WP1JDbn7DYYqkWc/B280PX33J4M
	Uikb1rg3nzgIG5cq3gzTpRX5CDpdIijsUgsBev+NUycGeDYWOo8XPyz7C8aLKfRW5ydh6w6wdqg
	R2nvWgHSsyTkZEZdmwTzSFHFGWuiRoiq4lUQaKYjh3Ff2IQ==
X-Received: by 2002:a05:693c:6213:b0:36e:2b8b:a098 with SMTP id 5a478bee46e88-36f77ce5f6dmr8295810eec.31.1794062109556;
        Sat, 07 Nov 2026 06:35:09 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm27881873eec.15.2026.11.07.06.35.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 06:35:09 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v20 12/12] docs: describe virtio-sound capture options
Date: Sat,  7 Nov 2026 23:34:22 +0900
Message-ID: <20261107143422.29319-13-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261107143422.29319-1-mynameisjune111@gmail.com>
References: <20261107143422.29319-1-mynameisjune111@gmail.com>
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

Document the five opt-in virtio_snd capture module parameters. State
that capture_allow_empty, capture_allow_short, capture_packed_status and
capture_pause_restart require capture_staging, and use the ALSA kernel
parameter restriction tag for each entry.
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
Documentation/admin-guide/kernel-parameters.txt |   29 +++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8344,6 +8344,35 @@
 
 			Can be used multiple times for multiple devices.
 
+	virtio_snd.capture_allow_empty= [HW,ALSA]
+			Retry a bounded number of empty startup capture replies
+			when virtio_snd.capture_staging=1.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
+	virtio_snd.capture_allow_short= [HW,ALSA]
+			Accept non-empty, frame-aligned short capture replies
+			when virtio_snd.capture_staging=1.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
+	virtio_snd.capture_packed_status= [HW,ALSA]
+			Read status immediately after the returned capture data
+			when virtio_snd.capture_staging=1.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
+	virtio_snd.capture_pause_restart= [HW,ALSA]
+			Release and reprepare capture streams across pause when
+			virtio_snd.capture_staging=1.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
+	virtio_snd.capture_staging= [HW,ALSA]
+			Enable staged capture using request-owned buffers.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
 	vga=		[BOOT,X86-32] Select a particular video mode
 			See Documentation/arch/x86/boot.rst and
 			Documentation/admin-guide/svga.rst.
