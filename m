Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355605;
	b=dC2VeDFUOuQ3IVi7mQLEWB6lHHKdeRgWNgTMZwZjwVMue9qvvUSee5EyDkYlgtmbP9YQ
	 inJ4CdNJ4pLN65DqLoDt/87vEpnR/UARUc/Oz446BSr72ITLEv/83bMkuNVOs0EoXoTgl
	 6s4Ycxf/Mn0dIcMebORh8htnPwHQUB6QePLJ93oQBcscSt3z8KyglWJMYDzNq5A5oysGP
	 tcau6j7JkYpcygs+spxX0X05pBEkoDoSF4ysU7eFDIMznq0SXMAfjkzbj0x7fBiwvYzlr
	 O3zSbNMNPLf0POmUIO8mhYY0tJqZ2KU1mvh7tG/oYfE73bvjMhGE+42Uvp6RiCHgkeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QVooZCmJPrWWhT96Ks8ytGn0KExMeex3eOhOngE0EKo=;
	b=M7iWxxom+U89EgMDkalKZI+KcujaiIcrwTY9ySjCcdsVmhIKxEe5G/33VIqELvj/Wchp
	 8YOXKgMiOkLAVPVMcVQx53bQIW0VSsqacMmDUKDuEUx7TqI2NTey2Z7LYeRA+ZFLUO7yc
	 69sTE7NqhMTyUy1WjnFPgv5BqKhlFYSasZI67W0cLmJORTrnirfkrbBiAtcX9wO1GfyTA
	 vdc4s0oNUTp6hCi7IkJ41WEaUnFdCh1RCQsiW8LsVMLUHIT7nOeM15iDQQob6TYdcDYmr
	 ysxsDWT94RINhVFBJaYIZZEyFR97adlCHqp3yrsDzhQTbInAtM7IuMdgF98BVjSLGxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l8W675bL;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F83B60A3809
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F83B60A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l8W675bL
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso1544938a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794355605; x=1794960405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QVooZCmJPrWWhT96Ks8ytGn0KExMeex3eOhOngE0EKo=;
        b=l8W675bLrsWjbpK2F3mrBFkG6K78C5ZAp2zxEV7PhWqS5rklWYa6R2AmU4AdBIj8Ft
         X7ZcJs80TDEQ4mdX4B/U5hTNWCtcsta+46BIhrQcfjdtcLhzuWDq+Ny58zpvZqv9O6Vg
         4dkCaqOnILNMn3hH/Imle3E99TOodgLFhuBCghJJoYMzMhixDe4bgbgTy15509g6A8xf
         Beujegev4eaFnh0lhDbJAGbJsodFeoPoORy9FvVVWP0clh5ZYEz+Xb5LHaDfkjSV73IJ
         0m9UPchgMnPHpI1Q17NmJgU7/QC0d9Ry7sz9dyQjtVHy8TEPrP+azTjjc86Q2fSYAmh9
         eOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794355605; x=1794960405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QVooZCmJPrWWhT96Ks8ytGn0KExMeex3eOhOngE0EKo=;
        b=wSn1m9rI8iaBBvqUdPT4GiD0CGHyvfga9z77D592v4P0rocH3sdm+5nEYg0ynPJ0sl
         rG2hwBWvp6/qATEfdmqMmhmDKmnbx+teu6YzQGm/7Er3aebCgBtZjJ05J2He9eH1TR/2
         fR13O4DkcuAxyKXSlHRbhqoqspFtGfdRLTKz/1d471TNhH19Ix3VQt4Nyx8v/jgG5gTI
         5NaoQ3AzqinlN1KXE5fx7808ERnx4OolDpqTZ4mfVemmPnlLOYJTYeXpbjSI6F1+qYI2
         1a3xNVv9AXhnDGFene873JZiwHNYmjKfRyaqT8nawsf8q5ZzdKNk6uTfQI+tjoLx31VJ
         LmPg==
X-Forwarded-Encrypted: i=1; AL+hErFdd058QdMebhwHLpjhf41FMR7b9tmOKWXTvTnTibIkQu39s2mSi0QrlKbqjrAmyBCJ/lDHc4pZ5YusLvk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/J742lvJHRH9Z2WpzpMlbXEsxgXNX4tj11zRbcM8tnsNR5HIfb
	oTKILORrXHfmMQtynbdCjA1J4tdE+Jm9tDEpHyUp+YnR0c/N+9HyKqvE
X-Gm-Gg: AYBFou0tWzu0rX/IbK036w6lYZIsv+ue6aYxWSVOV8sEZu57ljzsLz8FC8cxHozeOGt
	0hTe9YZaosZLd9cIYJCgLi9L5Yb2q3y+Jey2hYmdTB8fAyoyoseVYFcVuCqiv9u40DjJ2QEUlmu
	hNkQ3p/IT8HQKwWbxyVMmraeJMG0i3wngLbu5x+ykNV2gkPXx8zPJcCeasgWmy9ACAKlVxaXPIf
	vOf79XxtGx1aiyuCi/dUNqjBtwB1yClGsPlvZhMpG7WOpF7tdL9fu2jh/5K2MLaLNXGWPXYGkyQ
	E7ABBqkIMH9DXXPgPbcCYnOqWGKp1f1Mvz40krGhtRHnCAPaz9IZile7oBG2QwKVonZu7yS2RBB
	uzFiCQDL0kUSFtjDU34bbjwDRLJJgtUmEgjq3vdMvXpQgePrALL8yGyqC048Z+xVbO5lrkDZQgE
	5Hi0YtCvEZtZ6uCB+Es6GrbH3MO4krqC8JBlDr9f/n40VhxgFX7ILR3GNkZ1Zj37OLFsvWCz8JB
	sqsJgwePKmLLuntjBFXYK29CTrI4iMW7hPU5CQ97FMNRWqOHY3GA/VrPZ2jTOgzd6RbMwf65a8a
	XOJ2G6zr5HSCtjSveNbwa2zhG9rhEexG+FpoialxWZrR2BlDpiHvF86UODkmLP+Cem92D/vIATT
	HVZamoGXg0+/8jh4MNwIMO/Vw+eEoDnY7vvXk3USD4yKmx98=
X-Received: by 2002:a17:90b:224e:b0:3a4:f75d:d194 with SMTP id 98e67ed59e1d1-3b182ec22a1mr635276a91.36.1794355604794;
        Tue, 10 Nov 2026 16:06:44 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1838e616dsm474361a91.4.2026.11.10.16.06.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 16:06:43 -0800 (PST)
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
Subject: [PATCH v24 14/16] docs: describe virtio-sound capture options
Date: Wed, 11 Nov 2026 09:05:41 +0900
Message-ID: <20261111000543.28550-15-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111000543.28550-1-mynameisjune111@gmail.com>
References: <20261111000543.28550-1-mynameisjune111@gmail.com>
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

Document the request-owned default capture path, its temporary memory
and copy cost, and the two remaining default-off compatibility
parameters. Remove the earlier opt-in staging and short/empty-response
descriptions.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
Documentation/admin-guide/kernel-parameters.txt |   23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8344,6 +8344,29 @@
 
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
+			resume, send SET_PARAMS, PREPARE, and START. With this
+			option disabled, pause uses STOP and START while retaining
+			the prepared stream.
+			Format: <bool>
+			Default: false.
+
+			Capture always receives into request-owned buffers, then
+			appends validated, frame-aligned audio to the ALSA ring in
+			request order. A valid short response is retained. Empty
+			responses are tolerated only during bounded startup or for
+			requests already in flight at STOP or PAUSE. This uses up
+			to one PCM buffer of temporary memory and copies returned
+			audio into the ALSA ring.
+
 	vga=		[BOOT,X86-32] Select a particular video mode
 			See Documentation/arch/x86/boot.rst and
 			Documentation/admin-guide/svga.rst.
