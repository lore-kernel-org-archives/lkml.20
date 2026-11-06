Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793923650;
	b=FsbJGXMQ9ERB9d6yoWbQ1MLdC4IiwUuUbYDUesQV2zmdsYkUMkBrNPLAIlC2uOle91nu
	 /ASOz2HmrqPiRg+HAKjgT8qv6E4kv11J3HXEncmo0qsFYJ2Ra8KilcqL6ODFoBtB5hnpa
	 UDKz6ofeKrO40whAFQoEaoNtvjS1CKM9I1Ts+rkt698PHGdDpiudxn5As0rODRf74BXZK
	 Rx0ZENo9lddlsTzolDh0R0EmcKh4uKR4URxbK0ZaBTJGhd4ZcgGKxTJMI4lx7ORRhpZ+1
	 JTB01opXpKZZ1dwGm/Mcv9idFwjjX+xKIE7VcL0maMGxPNQmxKL9iPr5RL0MceKmfqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793923650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
	b=Dpact0oF69sB8pa7IoqKKLIM0NzTktNn6epCWKwtADMNakpIueTdakUPU7PpoaLWxPbs
	 Ge4Kv0jFAlot1/uYf7wELF4w35ZebXRcJ5AusGmR/BDBgbhBWgvtXu2B4VpreMaL9qEBj
	 PKO+JT4ylDybqAZyJ+Xdv443fEOvN6SGz14dwUF4Go0X6wQpw1Tpvri3dwznQcXjGQVPA
	 Grr+fXhZmKfWjGxswnY7mrl4ZqAcfCn8OaMf9vyqStBa9bQUZc/uBMOJq7TUpxolp+PBi
	 hYUA0Xhe1k3+Hn4c57HtAbzU5hgRT00/nroHPy/ceyPhpbksmnJaZb4r5kdgnlbOagg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EJ3orVT0;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6F8606D817
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:07:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B6F8606D817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EJ3orVT0
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso137831eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793923649; x=1794528449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
        b=EJ3orVT0lSr5+QEqDFmgmshDZGEl5+IkiNLUmMz6fPT/aQ+d4KSwj1qZwKWMftKpAm
         +Q3R7BfT+9TbXqv47RlK+WEcrwEYwqMrNghm/xNUgWZUQDnlNfnSmPrMV0GAFQCHNbRi
         SHQpIa3V3cxRvxR0C2cYa4sSWl4dJAsoBvBrgWV6gtDbIIrGbzGO1x0Ejl75dBlQuJej
         ahaT1mdKuDVSS7JSoLX0cNSvN1s7ECCJIcv7ZQNUYFvEmCEPrhr6xQOy51Op+5KYkSEE
         glgi6ji9QUjuS4qsC5lAwWTlUwGTCMzryHTDjPw63OxSEURKC+xoy/c6xpCSJ6ztfx6s
         qKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793923649; x=1794528449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
        b=ITK3A81iVpCBHuccaCaHFBDURdUIZhP25QenDWDcSyseR9dFSW5NK5zGSY1A6d5Ova
         T8p9E+H/HbP5neMMZ2aAjN8O6Lr+4lwEXT+11Wwhq7eehAWjPnCxAEB9iPxnuh6o2ynm
         4k6pcJaYd49PIBcgHcP+yRh4BXnp1v3FBrLKW0BBxroaG/RnyclR01Yz9cYSfFXta3rf
         dvyWJIOO03tFcFqbmsbsoDfNNmfMvFwxUahcEuR5M7xou6qMM5xV9c244V7NEKokdejm
         R4AnrPbRjVgLNS3U2BnwVvHhLHNRSYBaBv6Ii+I3L9o/xJUFM0ct2Vqgd6Fbw1TcSMZ1
         A2XA==
X-Forwarded-Encrypted: i=1; AKwUvByhjKjrBKa+x8t73E9LCkOQAGhtg4iMQ80LZ+1ygEfckQU4LiksGE18Ed6iAc1ZTsgFpIgmBICGTFdX8QQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/X2ryYJmZ6MdZH35NGAgsnpHVsdrVkVq9Vkd8eEUGsamHcISgo
	Tcx8nKW9aPMBDH6JdCJ8CcSdZayxblC4C7yIPb3MwSHSODY8Px6NL49R
X-Gm-Gg: AYBFou2Es56DLX5AD5XQ/lhRecgND+xE+iajWc9GfhBCLdEywn5nDpQ1HYIdUDhZVjA
	og0uLI9EhPzc0WrnfUxO/xQbyaWuJhtTNyPRpGbkhS5dkLOSSg1vdpYFlH3mddAdAkWdOYYN5mx
	APDSSw2w14ONzxR7ixP7lm5hWzbxvQh6Gh8raAlYz6r9YjlgGjL33Uw5p6NUUl/x+pROUPxbLgl
	EUJe1EanozzpqXP3DtzwYVBUDBzvWjKKD5LT1a5SoSytgQKSqe7rR1rTbHXR/2o4+P9HpX0WtAR
	YCIt5LbdPH5wXXkdIZ1L8MZezuHtxMmI/dtexMDEFO/wsGh7pTMnc6Oyr7+jI6cbokVx5xtg4Ca
	iiRRlx+3p2shKBR0fqKdM+iRmXkOgAHo7WvV5aV7dR/tFHubcGuDZubsLQu4BtsaEF+fccDKsui
	3IL5BG9VvxN5SwrUyoAx/XpU0jgskEh8w06NjbcWq6sVSnKcn3gGtS86cIDMiUDz6FezaCCYpWQ
	Q2XzrPj6AvFWmr93pmVKQZK0F1n5B6YjP5HEFA1XbgqyHvUmgLdElXvrdhF2I1SkO8Iwi38trwZ
	sNyYY85tzgbm9nyyLl07tmDSwaMGeO43MeZdgtQ1weZsPidf0GiwDeWbg8ixzXdBOzLZb5CiS07
	Q3v8WKXY6PGVVgMjdyi0a8F/T8+LF3p9/QwevhKpcL5AX/nQ=
X-Received: by 2002:a05:7022:1306:b0:1b2:44b3:8ed2 with SMTP id a92af1059eb24-1b25d373302mr766303c88.42.1793923649075;
        Thu, 05 Nov 2026 16:07:29 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4e079esm371165c88.19.2026.11.05.16.07.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 16:07:28 -0800 (PST)
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
Subject: [PATCH v18 12/12] docs: describe virtio-sound capture options
Date: Fri,  6 Nov 2026 09:06:44 +0900
Message-ID: <20261106000644.20460-13-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106000644.20460-1-mynameisjune111@gmail.com>
References: <20261106000644.20460-1-mynameisjune111@gmail.com>
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
