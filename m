Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365871;
	b=RiAzEkMmbiUg4MeuFpqbglpLJ809r3AaryZSpDSxiLyul8ijRYhORNp6qG/ruR8T96gd
	 Ujv2dd0Ce3ccUoOQ3GY4B8zT8oMdaMRvyr6if5DUaVh55WMJTUPN/9ipv2maIXYt+u3Ta
	 asopmTTHh655DVn8XH61wdL+IoA6i4dee+ucmZMQ5FJ5a0/xqt+qaRiym7Ueb67ZWlSWk
	 ywPOuXl8q5Xa6pJTDsResdNahlhIegqDpcXI7vw/Vcasv9sEkMprw3WH10BE/MKt0OyHW
	 asNQ6yr8m26vdRM6Eaanl8nM4ps2nFyxMPm1Jqg9bEYOoFEPmyzPmOXZKRhTy3Sh7Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Imcpwr06twHG+OjD/ubqaM6iJVR63FkGpgLCF254lbY=;
	b=NkN03e3SavKxFIHBmBNundaSOS3VGe+eL44JtD5Mr/K9Bk1UNISqxfwqOdiX6REhvYM8
	 +oC1W70jBEi1xsNYURIYuRzBoxwZmdM9DFFNuTNgODoi6y/btHos0fZ/OTKeTh/9z/JTw
	 DdflehSALleCqzl/c/tr8u1ibFde0oCPGrNI3SANynJTgsmw/oRuog110onulIMqhxzXn
	 EPNxw+Kkrt5Fu72Chh4OS1lYOTccaZp2ZdBbcVmwmnUG09PTfZr5Mpqin9Z5y9iu4/VT5
	 Fl70/dWZ2Hwt3gwrMdpna3G/VgNzpPyk5toUWVVFK+vv9voN8H3zG8/WzHWyWa6WplQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wCK58krO;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B5060A382D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:57:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74B5060A382D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wCK58krO
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33fb4680717so2381642eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794365871; x=1794970671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Imcpwr06twHG+OjD/ubqaM6iJVR63FkGpgLCF254lbY=;
        b=wCK58krOAI48CojkZN/aXq8C2x/OdbMUHdr11OsZv0JN9Soo3jn3VvhMYrRTtZxdHp
         zQUwyhCX5Nc53aNIhhFGX3IiKCkIgxPHI4WROA2ipTyLrpPGPc9+wLkoO5mCFnwpRsww
         Dh0FAq9sESCBI+VyJAEgZJOZFI3q1Jg7mIbr3Ja1Gd5mgK/Kx9x573keiZYCbHD5hoDu
         deQcpziVRobm8x0O6Y7Sw9+sYBy6ukPbss9Yx3WrbIlx4PtYOMEoBHkRFytqEj4GPlAS
         pY0hHvdnslDVsmuTI6TVYCRs1Aai4/nlRQdNiFMQ3Oij6zLACrzQ4AIF3t10nRkRL+8x
         cMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794365871; x=1794970671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Imcpwr06twHG+OjD/ubqaM6iJVR63FkGpgLCF254lbY=;
        b=w2pI5pBtOPS/i9DuKxPEFZbjaQ4NjBXQUwhtyWCh4jX71cGgu3Wk+eXOYgzLYhMfPC
         KjCxmV8PwEOECT3p5+UQB4KxxpjnubDLZ09P8dLEjtyGhorwB3W1lxYhjmRdHIpByel/
         2iWKxpJJrZdIDrjyzpi/emxbtQI7C8CxfGtZicgKLEQQZxqtE9ku3kp6FutOmlWfe5Ks
         sRWxV8TcGW0EZs59WcxkAom8deIRnLLZuZh5M+TCAiMATFdr605YDcYUe7197pf0O3Vd
         U1e0GAtIcWEyfC/xnvsMlazkwczT+lN//V6UuH1RL+PJV2aC1DoC2rK7gfifeENzSqHd
         syUg==
X-Forwarded-Encrypted: i=1; AL+hErEg6/LtKCKBr/qoGEiFXWUp1PLDCGvqZeoFJEU9yV/713zhTa6uJmfbc7LWXIKhvQj5Td3co2twqen17jQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/f2YhgRh8mk5kfgoN0RD3Ya0eCoy2vLDZUXbYdI0K4xdo1ZgWM
	iud3panC+YzSZIgOC3StIEarVOrEoIPVD6TK4PdfbFt91Q3cPmMAACmkTgDDVw==
X-Gm-Gg: AYBFou3wbRWtylBeXqPWmWehf3qS5xS8y1D4vPWr9cSR35UpQ+3PstiTHYc1o0Ha/Mv
	BvK2cvyOa3kenKuomk5A0KPgt+0Bao6ZzHOX1Yzgyh3vwIoRZPAAJ+pX0fRwG9c2LiweY7PIOUH
	VS9EKge53SvARdSTObBzhbauOPTViTtlD3Ck/j/R6HWQ3KZsvMgluV8btxtQvPdVcKr11AFqVAe
	WqNQVO9kkyg4EtijYiScdq+8yls64UvjMqXokrNgUe+sZJ5IIOy4XHAhXTX1DxYHdAGYtAF/88v
	LGTEM1hSNvi2cu7DzL5J0+ztgt6izUt5f6jkDuRrh0srM4pTeF36GSaJkXznxpq2RCcnDVx4F1T
	gvryhCvflKhopNz9qIekv4+x+QY/8j4X+9Ip154RS+nVf9Rk8l+YByjYxpd73XN28mvjr93I8rR
	I8FWyL0S3R9GL35MXEJranS8JFexkTNx5yrh3TLW7i56uJ7hnpfx2HUhJzFjGSSlOTVjSAm+Zmf
	I94iqLCVcs9Ffs+FhTZNy5UABOhecDROYgJb0AMvTZmr4sf9jbho9TxOu4Ef9Y5GZPG5bvY02dQ
	z66eMf4t3ir3KgIS3X+muPejGmjqEzu5D5Voq7Ejn0E/KY5WDQe0l1s6jqHO2Z8hjwW8b92QP5B
	panprh3yIcbi8cU/EwyjrXINt0Okl57TkBO5tspFm8e5MHCU=
X-Received: by 2002:a05:7301:5f87:b0:377:678:2309 with SMTP id 5a478bee46e88-37706782738mr104860eec.15.1794365870693;
        Tue, 10 Nov 2026 18:57:50 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm12390018eec.17.2026.11.10.18.57.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 18:57:50 -0800 (PST)
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
Subject: [PATCH v25 14/16] docs: describe virtio-sound capture options
Date: Wed, 11 Nov 2026 11:56:53 +0900
Message-ID: <20261111025655.63951-15-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111025655.63951-1-mynameisjune111@gmail.com>
References: <20261111025655.63951-1-mynameisjune111@gmail.com>
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

Document request-owned capture in the ALSA configuration guide,
including MMU vmalloc page rounding, retained allocation lifetime and
the copy into the ALSA ring.

Describe the two default-off compatibility parameters in the kernel
parameter guide. Native capture pause uses STOP and START. The optional
restart path uses STOP and RELEASE at pause, then PREPARE and START on
resume.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
Documentation/admin-guide/kernel-parameters.txt |   14 ++++++++++++++
 Documentation/sound/alsa-configuration.rst      |   15 +++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8344,6 +8344,20 @@
 
 			Can be used multiple times for multiple devices.
 
+	virtio_snd.capture_packed_status= [HW,ALSA]
+			Read an explicitly enabled packed status trailer after
+			the returned capture data. The fixed status scatterlist is
+			used by default.
+			Format: <bool>
+			Default: false.
+
+	virtio_snd.capture_pause_restart= [HW,ALSA]
+			Stop and release the stream when pausing capture. On
+			resume, send PREPARE and START. If disabled, pause uses
+			STOP and START while retaining the prepared stream.
+			Format: <bool>
+			Default: false.
+
 	vga=		[BOOT,X86-32] Select a particular video mode
 			See Documentation/arch/x86/boot.rst and
 			Documentation/admin-guide/svga.rst.
diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -2537,6 +2537,21 @@
 
 This module supports multiple cards.
 
+Module virtio-snd
+-----------------
+
+Virtio-sound capture receives data into a separate request buffer for each
+PCM period. The driver validates the responses and appends frame-aligned audio
+to the ALSA ring in request order. Valid short responses are retained. Empty
+responses are accepted only during bounded startup or for requests already in
+flight at STOP or PAUSE.
+
+On MMU systems, the request buffers are vmalloc-backed and page-rounded
+individually. Allocator rounding can make total additional memory exceed the
+ALSA ring size, especially with small periods. The request buffers remain
+allocated from hw_params until hw_free.
+Captured audio is copied from each request buffer into the ALSA ring.
+
 Module snd-virtuoso
 -------------------
 
