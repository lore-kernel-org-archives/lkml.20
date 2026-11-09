Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794267705;
	b=P/l9n1elcnrn6PYXGe8gE4960Lv5h1f7vvPxH79jvcovsk0nFtCuJfpQcjEf2Tfczhy+
	 3NP9NGjuxPQqJDvHwSs7elyB3Jp5cVkQUlsnXxtuFPIxrUeHdHzcZsfQYIYA6XIPGxqiy
	 6J9q1utP3WXZrRRljUjooauJnlZrd/XJKJfCJUq264L55YEENWMcshyYb9fznH8HLe4a6
	 aK8U5GQtJwS7JI31uZwK3sqN8Zbea2lKzZGvckpub9Sq48UDSkyE3AdHuh4/3d40mNcPo
	 q+yoYvUXrWThjLf4kcirjoyCgzoHqqZQm5eHGkgzHFEH6ylNHRmldPzPWUWu/mhitCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794267705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GCeNfDJOwvZXuY8dgM3rlag3FgqE7583M6Aa4tPPS8I=;
	b=JT5fNmzs88KYXr7Zh6gU4nCunBaSFGEromrwoB2wUiIelaq5bF5rszJK4m8VjDs6VnWn
	 MC0H0M/cDq+ObUjAsM5ZzrHEj2gbOEiUA8SfNay2biwi33xF6AUubt4BTqeqyhI2j5qVU
	 TSwSNC/qeNiQLyagYhyF5WDo4xdNA78MMSxUgrNHFbFs7FgmNupUAmXutW00b4Ok5kEAo
	 qdMWm6M8lXLGm54g0eBjry3Fwe2gDSjIeIW/AIf/szwtRNpJhC4T21wDRX3QA8Vla+EB9
	 vkTPh7GGyq2Qqg5dbbAzTnz6DHqzKqu92//1jH61jFnFHNKPMJXaxxocM4KDzBmE92A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nmcIAWFw;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364FD60A5BD5
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:41:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 364FD60A5BD5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nmcIAWFw
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a2af4c8d00so2460896c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794267704; x=1794872504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GCeNfDJOwvZXuY8dgM3rlag3FgqE7583M6Aa4tPPS8I=;
        b=nmcIAWFw/n8RfPX81fr9NsZRJSbTr2HV/ycuyxDSLyPKUO6oC7t7hUcObhwj7MFDSW
         +Kww1rTEKgWwGSJAlpnUvTzhNb8vHyitkojcjY3b/PbO2g4ZB3dLdxF+VL93HL9omZvp
         hyLk5j4Kjm3IGx4dGasCKVLaqhHJCk6dzRm6N2bPTE7zoYVMmE1Eq4iUBZ6spEeZ4vkt
         nJ5LjoemwYG3swyL+b1RlLPVTYMOXRXvuVhNZCSUGG3z73hLIYRRnJ5jm7j653iFVAX5
         ITicfRqhURpO0gpEA7eHOJWSW5z5EWzlohdqi+4DEJgIKC4Xtnw2zVbvsWmXHhKnItPg
         CMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794267704; x=1794872504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GCeNfDJOwvZXuY8dgM3rlag3FgqE7583M6Aa4tPPS8I=;
        b=iW2uscWJhh7FUgApKJSB/7JgiEHC3hQ8f7tmeAgz+SH09iKt/o2khlGQe6IW0nLMbJ
         BN/ifAxqsaJ3D2BHBf1vfZ34qtUFIqbopjLQOH5voL8IAdNcXTMc1mCYgtBHOCH8tADz
         X7H5jnBYXAhyOPFLyhQNizumji/45WU+u+xSef9QDGZnLhGHtO2BGTfECfm5SZoLqe85
         tOeQTmsMK71PI3ik4xNs/5rdXjZ3qdP9SFA9fGr0OhCOAroTaAWeEUYwf6x88YCqbnGd
         nwRIR3fomkEtw4v0s+pQT2dUfZ+GronDgtlgBbhOwcOGiZ81zs7aeaKHXfFUcz5H3i/J
         weFA==
X-Forwarded-Encrypted: i=1; AL+hErH4VE5zD5UVDBRHvNPB/IwiM4dJmptQRMyIU87r5pi8tiuz8iESt/EbEAVV+uYNDw+5c9ZJMjZMLtQBYPw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CIgANvYIgEaj6OXRRZ2MjBcLbgm/DXj1DOxWXY5R5dE5BtP46
	yTyqa/w5AEbzWaEy+9njeRgiAFvP1spRvnh8dTlKSGn+tg7FryljVhWd
X-Gm-Gg: AYBFou2Cftkm1CALT6RDSOYlKoKCXXavmkoZkX9xkvxjiLEQmAVFXS0C9kTUZgPKS70
	xO5Kn6uXHkePOGmkxlupr0HadBZPT44bxMpjctMDeT1yCt8G6muWwdtmJGMozK0eFfGGV3JPmL6
	/854mjlT0bdZ7p5kKJEHkw8o/7UXxJB9pmEU1c7I6pWuyQ1OTqdLAklzsuFcdiISKDV6mutBPzg
	NEl0d7vNhHE82YUhQKvPWVxFjdJEacRWROyL6a+kWHqqgUrcqIY7882g3MMWoZ6S9Vc+xP8cG52
	AMjpGeFJLMCDxj1dBaVPlZ2N3Kzj7BeJXYJgaNRRi4eYC641LHMad5d1BKYP0CMM8oiOz8utv5Z
	Gv1bfKxMvfCh+XKo1uVfeUoT1/l3wZGG+/im56VJEM5SdIjrdk9Hr+EoMzWrj8K8L2DzG1l+rqa
	eiptXiT5dTi5K1DVQ5jZvpjxqu/hxx83/vWeWTsYQIDYdyZcQKrKWkkOg8nuWhWBDBNZURSt9/0
	BBY7PwVdBRfT69Io4fAwUhXZM5zVwDfe0p1oByiEKLbJ8RYuZffWYXaFEDnCcSbjfuEXyhXLLHc
	Fy+xVkyiotki51CAL8RsaC0H32OHcPOa9NXKqVTI1W/fA0X3qB7940PEtv0HhVD2ZaE1qerzS5O
	X1MxO2MPk2DZqiU4QMzLghkN67x0/0h11hAxu6b6K3nzAjnU=
X-Received: by 2002:a05:7300:d204:b0:370:1652:5ff4 with SMTP id 5a478bee46e88-3751e99347fmr1011593eec.6.1794267704227;
        Mon, 09 Nov 2026 15:41:44 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm1739049eec.5.2026.11.09.15.41.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 15:41:39 -0800 (PST)
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
Subject: [PATCH v23 14/14] docs: describe virtio-sound capture options
Date: Tue, 10 Nov 2026 08:40:49 +0900
Message-ID: <20261109234049.79534-15-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109234049.79534-1-mynameisjune111@gmail.com>
References: <20261109234049.79534-1-mynameisjune111@gmail.com>
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

Assisted-by: LLM
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
