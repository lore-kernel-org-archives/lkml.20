Received: from mail-oo2-f13.google.com (mail-oo2-f13.google.com [74.125.231.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5BA3E00B4
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 20:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790369708; cv=none; b=cIHRxnESGWm+0kQRS7rRLvL6ktHb1uLvzjWkQr2uUX1vafqdr55bUjVt+UDXfO5xLqh6cA+AgVlQF+NgKX3fJPP81DNj8fKyxPepWhfwgOHmf3b4+SELSEN2R8V9LuGsrE5ripgBJ+LYMZ19D86rdDN/35wG8SAntrvICNjvcqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790369708; c=relaxed/simple;
	bh=b3FYJR2ie2Yh+fvliYbwgtIZejyG6PAXcYAhpQNpCW4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qlm7P9lhTFTrWHbSehAaht34IOpHTkz1cEgYLA+yEOXcKKoR/iFHSJlnQz9CUmhv5XA2ANtQ6PI1OEQCzizG+bP0ahHo83HxpnU8kVy45R+dH61KGy54bCAd5e0mu4FU81pOcCLYZBBw3L1OCu5i3hQ24JWv1cReVYnPGrKz0ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MMiZCj4D; arc=none smtp.client-ip=74.125.231.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MMiZCj4D"
Received: by mail-oo2-f13.google.com with SMTP id 006d021491bc7-6b1ae7089c0so651595eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790369706; x=1790974506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uVkDm7b8tGoVPxZCZvIvITNn9vMbTScXbMyBf75jcE8=;
        b=MMiZCj4DnZXv1jqGT8uxvcgvqjdxJ3VoatG4nyw4pHlctlUuFDWna1VVu1W0V00HDg
         KI9jQoYk5QFum9YXtcW0KYMIR5jGNCpT2qqiEfQbnTGIjRQAvyvjFRGEkPOGZcUzfOuo
         lE+lO0aVaHrM8Cc9brqDMm4F34Ul+MTW7EoVCb9+HWMFxiVfqqomR666DL0ymALGy4dO
         dYM+tEGLxgXJZDp90eOaeT2Aa5RjBgxRRVjqE6jwEqGfYiRDf8WR8NIjTE6PiuskK12U
         47sssX8V+5D3uzL9Ey4cxdXZjMJk+cTaxPg8Bbnr5KQTDBQKTw8eZJiiWQPS8rNQxmy8
         Ir9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790369706; x=1790974506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uVkDm7b8tGoVPxZCZvIvITNn9vMbTScXbMyBf75jcE8=;
        b=mRBP566wN39/JdHoge4OrwtVx2a/1ASjOUNAj1SH8hkvNyJnKnv1cIwUw3q3BzmdMf
         DG2qFxfTSzNdIdGoMMxVDaxo/ph2urS3+yuZBpmGR4MHHdmZxkS/1ue5JQAqJPvk/2dv
         vJglvBJXmQ8YFGEZaGgLTM2Ppf8/A/kV3YJkdLNvkmjvEPmT+cpijiMET2/HOYhJbmIC
         wZou8sCG+pRLDk5ulm3a/5tWzEe9astySy/pwEFITuQjRlV2cetcmOoxDYsMxEKu5eYh
         T6CUKuVCeBddmogU5Pn7EP273t5rznlm7eXgZR4eDrqSL4nOwn+OoZgZwrXH4+oTznmG
         2gMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQF2NJmTIma6tJ20w9mQTyjkyh9k8BxZP9t+54n26pTEU3TosY0ZOR7ChUxnTaBzT+Poo0gMxd/Uy9lHs=@vger.kernel.org
X-Gm-Message-State: AFuF++mRBAjs7R90wWKcXsIp4JOEXqqUtpuKwLxrqmh/4RVDzHitCjdJ
	3qKKpA5jUhXwOWpVvI25jFI0yS9HphPWfVHsR1b6Y6qt4DzVsH3XrQwin5FAjw==
X-Gm-Gg: AYBFou1Lu8FsxT3keegxyG0Er0wTKg+5+MGD+nKQj45aNLcDDMHCAnJmaAf24TF1Sgb
	ljbxIhgtnObeJM9f4Fog5nlwk71kZRepPgxRChW28ANZGlFEQV4qVSPDr9cRsWBv6MrhwNOL8S2
	QEBXDzDow3OqaFCV5DdZwgUfWjOSt/xcAZ/vy7hY9W1lwuY/0jAATXSQjmLYhLomi9LD9q4fYxu
	5iG8IAQa9uzcJub/UROc9ZEad+pAXk6wq2CPwrC9Acy3EsrvwGrx4TdizH5jMh9zngN2B1kJSh2
	aDazwypgDj8Af851XfLaJEjb+4KoQSx8Kd2APvp9U1wiiDq3+UucU+x9DcR7qa8Gk12WPdwWwLc
	TNu3ol+5kKJMPB0vNSsg1NiA4Q8OUXyjxVIo5bduF1wh2FOFurSBpjcFOk4I8ScakKOi1cA5WVE
	vHAX271oINMRUpesIkpqVzay0dE51DJQXZutdpil9hM/3Whb+i2xwxyW948QJYvq6QIa4QWgY8K
	AzqNIj5lcVYIikBIHw+29SebYLwL7tTGSTURSCh
X-Received: by 2002:a05:6820:179b:b0:6c9:e0a0:af1b with SMTP id 006d021491bc7-6d5b869be64mr3111117eaf.27.1790369705603;
        Fri, 25 Sep 2026 13:55:05 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-493367b617fsm3034952fac.18.2026.09.25.13.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 13:55:04 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH] kselftest/filelock: plan for the five ofdlocks tests
Date: Fri, 25 Sep 2026 15:55:02 -0500
Message-ID: <20260925205502.115327-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ofdlocks reports five results but plans for four, so even when they
all pass it ends with

  # Planned tests != run tests (4 != 5)

and exits with KSFT_FAIL, which run_kselftest.sh reports as a failure.

Fixes: 33d5b13098fb ("kselftest/filelock: report each test in oftlocks separately")
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    Tested on x86_64 with the kselftest build of ofdlocks:
    
    - Arch host (gcc 16.2, 7.2.6 kernel): before, all 5 pass but it exits 1
      with "Planned tests != run tests (4 != 5)"; after, 5/5 and exit 0.
    - Debian trixie guest (gcc 14.2, next-20260925): test 4 fails before and
      after this patch, because it memcmp()s two struct flock whose padding
      was never initialized (bytes 28-29 differ). Zhou Yuhang's "selftests:
      filelock: Initialize the flock to zero" [1] fixes that, and with both
      patches all 5 pass there too.
    
    [1] https://lore.kernel.org/all/?q=s%3A%22filelock%3A+Initialize+the+flock+to+zero%22

 tools/testing/selftests/filelock/ofdlocks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/filelock/ofdlocks.c b/tools/testing/selftests/filelock/ofdlocks.c
index 68bac28b234b..0ab484cb075b 100644
--- a/tools/testing/selftests/filelock/ofdlocks.c
+++ b/tools/testing/selftests/filelock/ofdlocks.c
@@ -40,7 +40,7 @@ int main(void)
 	int fd2 = open("/tmp/aa", O_RDONLY);
 
 	ksft_print_header();
-	ksft_set_plan(4);
+	ksft_set_plan(5);
 
 	unlink("/tmp/aa");
 	assert(fd != -1);

base-commit: aa98230e410f0ed212b6788c46b1e4d49e0ff7ca
-- 
2.55.0

