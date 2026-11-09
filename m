Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794250117;
	b=V03lkulq3/Sq4pJE6OGcHjvmhdZoiNZbHDK5ZDsuXL4uFkUN3lgJ5e30QLH2byKxAzPR
	 sy9/IC4CyRJTFmVal7zG81sbVgxFxuSb0pOXDr7YN2YcInNpss1NDdaasozyeqQlpAuy4
	 yWdkEyB2hFNRGpszWJvE8xuEVaEVApiVgELd8zUxSQPcThOgS1THC3bPresfnFjQ2h8Jo
	 sBaHCKT/+TR1MzFkPAQSJONhD4dfJCyqd762JIaIZZfZyn9VqxcanavlzDdu0ybsJbDSv
	 8JP+bSv8gdwAM8pA9cAjzb+c2F2EzYWGbCQvk7K9HR4B+XaxkorQWTRgVfOcfe1c5tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794250117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=zJgT3Df5RlWXlIKxNLqtWOQBSvcfzp5SoEp+FbB1R5Q=;
	b=K1Gyorb4h5Ee+RiKD1sRlUMSumycOZzfCZcdZgjvq+MUpS7VFbAewZtjIWE+ImgSr36z
	 /tYyCPmco1uLrjw6R4/hs8myW2pkcfkvAdCC/WFeYqZTueyaAdn4mgWnYVJnmbjLkF9Mg
	 ey3vBHDRnplcEfoh/4o/8R5FcugaAhfc7FmpTRjtzey8xouVUNwubFlAexVWWaIhkw51j
	 N2fO5VgGAXgqN9ZNv/V1II3FBodQaLpHfg+WfeWNzprnvekPumqEWjyyiN3nj9qt9Iww1
	 8yA4IyE/F8Hfo5Nojwogp0wdBnSjiukaVJApxROC2cVwQPysvYQv2grkrEXx3vEJHjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BcFXoTdx;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B547606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:48:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B547606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BcFXoTdx
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91ebc0351deso9598296d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794250116; x=1794854916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zJgT3Df5RlWXlIKxNLqtWOQBSvcfzp5SoEp+FbB1R5Q=;
        b=BcFXoTdxo+yfjckASKsxogpAjNamyOxhxKZIbqJEfrlC68Fx5vsYLXoR26o9P/E+Cb
         AxR5g6dgArMzJuQtfi6tYFBwwgD4APDT9E0dE7FumOrFwe9/4l8wGdDgM5OamZk7FQ4Q
         XZ+YYzuDRYY4GZXNxIdBCI1oCjMcDlP0+cBsBgxJzqPifaiupHziEjU1CE3TE8k14OR7
         XRTOyK4oTKU66kunlMe3U4UrRQSY7ByX7T4HZFOeNo8vSkbDlHidk4crPJ2Q9t+6bbB4
         Z2/c/2uzHjQdjnvqmjK7svqpu/TmJ2B+TlSis3P/5nYW4c/kUnxUOD0nlaDEIGpm8RQL
         0ngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794250116; x=1794854916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zJgT3Df5RlWXlIKxNLqtWOQBSvcfzp5SoEp+FbB1R5Q=;
        b=OZyIak8041gHBkPjCJ0XA68xRA15cS9qaa9GaqeCa/DXgVSxE9dokc18m+tKozB7WR
         eKbLmbORS4dXB2pIUdhJFI+hHZvSZzjZLZ1dyUJqfgxuAqh71Pz0d6VY6zHP2q/WaZlQ
         E36Vy/39h8Qwpj+OMMMT8bwfl61njHnHkAzDL87N9+jmVrKFOvcTje8B420sreniauJ9
         lr7kOYL8U5JB/ufCpFlyzOQeOzvhelpeBi5HBt1Wbf3LKfJHTYr/PbzjQRCzs2WvSGpT
         sCiLp/W88qtzGLxNMlBPcWXaNJFixRHoH13x4j6gUd8dWCY1yP1Fn7wgK/fLHnaTIiI8
         V5rA==
X-Gm-Message-State: APuU4Z8kij5kgedbbDFRGCsFvp0SolyZUtlQoPez6KiFjtMKCe0vhiv1
	GbP+43m5ulUNpARgSacnvrieIX9MhA1pvO26t7muPaPOSD1E/AJ3DAGW
X-Gm-Gg: AYBFou2ZvMp7paIH8jogXd+0ymMG0arsxgpkPJrcZnhQsrEHzVefIL/nQgF707AfBYw
	3rgyiHm81My+GIsBsIMnnJNAZqM29w2AdyXGG6CGJgldn6QmmqVks2dkVtMzIucWRIBrPBsFSLK
	q0JKgiTFV9OMjc+kkMpNR94kPaWkANzmtU1Ys7NS64lU10T+HePwETpWk9fKYmobQxyAGx5/JwC
	TU0ck0ba0RYyYqtechZIa3HnvLuytyBZD4y35vfmSSlAteqNUfU46tBfjGeoU4lUxyhut2a8mkR
	KJ3kuijTh5AQVJfKdiH9Mm1QHKCMd+KgGNft0OjEQxj8J1Pa1aA8bVTDWpRkOXjR9mnDWB194Sw
	aK7UDbAsyKzbn23wbFkjMfUDFaj6bc8t9U6pGNEZxakzx50Am6v/t0KMf+E0QjNxGYxIIqIZ3gQ
	2ix5p+0KAkeGUP8JvKXSB1RMoWCfHGAXNQPNwABKdJGYNv5u/oP9kc6ex/mhiYlMPfzqZfo2PJW
	9QYbr7cBCMVdH0WRYZebitLbeNWLNWJY0ioyrYh/xx4Uisi+33SC3TH6iKKCc3V3oj3dV9VPQLT
	jOOPycOfe2NxO73B2g==
X-Received: by 2002:a05:6214:3197:b0:91e:87a9:beec with SMTP id 6a1803df08f44-91eef490879mr10416736d6.0.1794250115930;
        Mon, 09 Nov 2026 10:48:35 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef052360asm2307396d6.38.2026.11.09.10.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 10:48:35 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Alex Dubov <oakad@yahoo.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH] misc: tifm: Remove the adapter ID after device_del()
Date: Mon,  9 Nov 2026 13:48:32 -0500
Message-ID: <20261109184832.1256641-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
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

tifm_remove_adapter() removes the adapter ID from tifm_adapter_idr
before device_del() removes the "tifm<N>" device. An adapter added in
between, for example by another TI FlashMedia controller being probed,
can get the same ID, and its device_add() fails:

  sysfs: cannot create duplicate filename '/class/tifm_adapter/tifm0'

Remove the ID after device_del(), as the error path of
tifm_add_adapter() already does.

Fixes: 6113ed73e61a ("tifm: move common adapter management tasks from tifm_7xx1 to tifm_core")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Reproduced in QEMU (x86_64) with a test module that runs two kthreads
for 20 seconds. Each kthread allocates, adds, removes and frees an
adapter in a loop, under its own platform device as the parent.
Without this patch, tifm_add_adapter() failed with -EEXIST 125066 to
126356 times per run in three runs. With it, it never failed in three
runs.
Not tested on TI FlashMedia hardware.

 drivers/misc/tifm_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/tifm_core.c b/drivers/misc/tifm_core.c
index 03d1324bc253..91f9b377588d 100644
--- a/drivers/misc/tifm_core.c
+++ b/drivers/misc/tifm_core.c
@@ -223,10 +223,10 @@ void tifm_remove_adapter(struct tifm_adapter *fm)
 			device_unregister(&fm->sockets[cnt]->dev);
 	}
 
+	device_del(&fm->dev);
 	spin_lock(&tifm_adapter_lock);
 	idr_remove(&tifm_adapter_idr, fm->id);
 	spin_unlock(&tifm_adapter_lock);
-	device_del(&fm->dev);
 }
 EXPORT_SYMBOL(tifm_remove_adapter);
 

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0

