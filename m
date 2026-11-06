Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981965;
	b=B6aRsAEbnS9XYLmUdoDATD+TmUUv+24JI1JaMeOatpRywoOlGDD33oEHqD5H/Bbdszg5
	 4hBQ6M7osoNrMPyzfYPebqF5fT2nVYyqwcr/igeXteoo7JoEZ7KLhjrE+cqWfj7BU0/yO
	 zU0C2ALo3lJieoGSq0NkxayT6CY+j4+Vy2lZ0RAk+Fl6FTPonZyjbLGhRbFk8Ybm+0lEb
	 WKhSoC/EjilWyXGTlV0Vy38DqCrGQoglMa75NfjJ/YJzHkop5N6DLzFhiWABRe772S8pJ
	 japte/tYhgaDjpc3P3q14ejcfHipGikUCwMAare1a5hJGqqC+gvjqRQ7y1Cm1ORWRRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
	b=OZ+0kXr7GVNn5vVhyTeW+ie2wcBu8R5KJWG1kGA41CkT/B/Q4v1HXSF1MmAEQYDouxNy
	 2luOkcw905cBnRdkKv+SX96no8ZMVgc5xeo1ev9adVQdrX3ICIZmkbOvoJ2lCzBwxQQIa
	 j2J/9xJj2ecNq4ls0d2GgDFZ3sOT3jMF5MYNqQj3xO+3rZHQen6LFfPbu1bugJoBtCai3
	 abwAVT4LhKkBv8S+UOfFefwDYoU9Py/ZIJQt8PXdWu/CIDdCC7rWqXSXwsc+tJJJvoyX2
	 JVSNVTIvNnpVcXGuIDQUiKV1apj+Ci4V1LgK/llxJBK8rd4gRCUysHuzmxwQDukSRDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IfrE8Cjb;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36D160A2600
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C36D160A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IfrE8Cjb
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so1148746c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793981964; x=1794586764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
        b=IfrE8CjbKfXBgHyv/oFbCQSS9viFVOpcOupJ7F4rKbJvdypopl9CKbVP9UfoP4cLfQ
         dFMpkeDRm8ELM8uVcxnFdK2nurMQQFDQy1icTEA6GEYR8hEBY2HzFifOEoBSN5+aJ6n3
         e8CeatXd9YN0OHo65HqTNv5bKxhkZIzx0U63io97uZjsusFh1tihnhKDZfByelY8lbR0
         zCfp+P/dEYD1XN7YE82wMryeh/9Yhef7+inhjdBRK4X8lvyomOrdSeR2J9sb9hUB1fk/
         JoaXY60QE/OiA8Y2Q63eazANw81ya/JNhpMpak81rx24WnLOHgVGFsaw1bBLfKgSRvmK
         5l6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793981964; x=1794586764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
        b=wjyl5FNKbhv1+3szDIAO+GSwPojU6T+6fCkl9qnGRYBthjvCNThZ9U0eR/zYqVZNmr
         r1qWK9TrL5/NbYldZJw0wwO9Z768KlS6ADmXDljsXcsiJmN+Gbo4P53SzKRyWN1AyKft
         G1p+jTq2pq7W6oiJt2AzxIGxTW/7QfKMzJFKnmEXpMviZ4d/dj+RytQq/VvsQoVwyJOo
         V6WitkuHgJdqjxuChCuxvDXhcWZcLKIyuErZc2ZG/Gyf6Y7vCeQRVicMNPY+M+sHeMcq
         lGMO8LjYu/K8a7kPKj+KXSIVL4cqPXsBPWWRuFKoftrVJE/3jEPqeB80fFw0S/ejxVpN
         44Ng==
X-Forwarded-Encrypted: i=1; AKwUvByAJ6XCU0j3zIVNaOD8/3LcWA4QgKAMaLNbwKOOF1agl3I/mo8tOnHJzYkdZxqsArH2Xk86kB6Xa+6sqVo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8prfEOAkREaJoOs5BXpIp1ce144ygxKRzqSzEkZ4QlFer4fLJp
	kb8VYXv6ii/q4JnhAhvTKY11b+KcXnw7UHDcKYSPWSPkoXQuzo6u7H7i
X-Gm-Gg: AYBFou1aL9UwT56/NV+jCUU9eyFvpur7NQdh9vsS+MKmvBP30eGpyNPmfdawQpoZjli
	iGUrBO/LxPhyzsAf6VrAW5rALg66a6eVqUGB9FnBfC5t5fk64/Q7oJso7N0zxuDgUHfiIhJcHbi
	caLby2Lh0bi8nbf2iU6+OP6y9RtIRtd0A2BgwSbelcOjQSlkSrllZK2xKyVrdoKIcrIxRDRenL4
	o0ER2Sl83a5DFLrzvryIdIU/pxpjHQR0gcB3+o4rLVtcsyVqorfrZ8qa4qybPE4hurAiV/mxsMO
	w2oQ2yOFdkI8ULfhK3gu+F7Y8dvu1qJ/1vcbUDXgUNiyn/a0VrTKeylqkeUMacSNhIDFokoUW0J
	DX6YHTU/ixOcjOGTx0DAnSj44zsQrIHPyqMV638b5BbDeCK89jxuuH1FaIcBKGCGvWFZyjtU5dB
	NWsBaIFMUbzplADFAX8V4k2kOZnwl9tRL28M59e4FShBltZ2XGQsxCy+65B0ZpIiad27mzna96i
	yoRqiUO5y2XTj6MpyEF3/UbRedl9VY6Hu6E7lakOHf+Km8i06gYYP6Doq3LyVj7hYopD+0+2Cg6
	IhbEt0SvxHVORCBg21xelKaFpFBjBw1F0rBOryy47vovE7OyO3pMz6WXzNEjw3iOCjs+ObPzkGP
	7mt7ts/fxWsbmDC7SCa4W5vKWbOCKzcB65/VaoUyK+A2KHw==
X-Received: by 2002:a05:701b:4211:20b0:147:a685:9125 with SMTP id a92af1059eb24-1b25d28c296mr3676583c88.2.1793981963864;
        Fri, 06 Nov 2026 08:19:23 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4840f3sm13139526c88.5.2026.11.06.08.19.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 08:19:23 -0800 (PST)
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
Subject: [PATCH v19 12/12] docs: describe virtio-sound capture options
Date: Sat,  7 Nov 2026 01:18:38 +0900
Message-ID: <20261106161838.94308-13-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106161838.94308-1-mynameisjune111@gmail.com>
References: <20261106161838.94308-1-mynameisjune111@gmail.com>
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
