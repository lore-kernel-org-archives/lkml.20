Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A97531E85B
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 08:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788598339; cv=none; b=nWwahVkmH0qN6BVP/iHt78picPPKPCeH+IISir28xLsDVnmLSuUef57XXf55Y/sBWd4BDm7KZUDSLITqmW8DNvEREm/jy2Z0duLjFP5C6HUF9KQ1O7iOPAlX1cIQ2pS2V215FCvZm90azJwQ6rBVDM5n8EGGdvTvVnOupjR7RRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788598339; c=relaxed/simple;
	bh=miKG78CIHx4clQwji0PO9K/QeOzt6iK5U2albASuWT4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ncYVSD+0ITTPe9TA7PmK1akatBfAgkTN7WpMiXJHa+Krq15BNX7GT1pS6pAIAEIRNhaaPbRhxx9bGdkrk88M3mdm7Hr5ExFFDowBRDggsXmeE//Isk64hHE1q9B/DrEdEL2L0uewyceZivm4maEK7FBPzJ6TCh39kdbLRCKl1AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m3WrUtuV; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m3WrUtuV"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-484374f54d0so1093601f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 01:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788598335; x=1789203135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CDGhb3vDecChWtUPbvLVyZ/RLgOgMEw1nfoKZoDLnlQ=;
        b=m3WrUtuVk+tl95C3eQcf7eXs7w0NEI1XUQnT+cl2IhTmxysEg5TZmAFAweinHtXti4
         q6YsZwUi+ZuuVgT14wOXSyi1l/i6cJRmn9JyHAoiXy5iKMhzxCbgXSxmvUP7j+9uqXrA
         EhBvh2FhgJKVMuAOa2g75ZZmdbUcODaXwfgYFBHCExx3RYljqhZwRE9bwj72/KqBpBMj
         nmJJxIKPAXW3kB5LASE46g16lZWDASAe0v4kQU339eTIUb/6bvLXBs7GYJ53sTNJiuEM
         axFDdvlKEj1Ly18I6T/loMy6i2ZoRP4DaJrHlZhMFWQl/gO278ELLMAwno3h5MSNtcmK
         KseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788598335; x=1789203135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CDGhb3vDecChWtUPbvLVyZ/RLgOgMEw1nfoKZoDLnlQ=;
        b=ULsr8eAX7oHFGjEUpVJu8yP3i/RGlcFHpjUXobNC0c05PalTLFTbF6NuW7X9yS3otJ
         P0PiewaH8SOgR5s1p14x/Bz0T/uDt3jL93B6s3SbJ6NAZhuicNjQF9IBoN2AvaReMpQt
         /90SHJl2z/EM3L9W4aaKAbfsDNSD9A7AJgK4OqMzCCpWw00stfnEgcJWiJo8DStYcifo
         GmKUnpCDhn1ftW+3i4gLdUSaxdhtTahvuSWQQMArJqwKRDDnCEb/+MMivWGhElaEfoeC
         4N+t3pw3YrBK/8yzS3eOVj0UxIY+tYq/QfVp1ysDRv7l21NH0735Qpr9Sw2tNl+dGJvH
         qShg==
X-Forwarded-Encrypted: i=1; AKwUvBwhY2g1ZSylWoNWoxbRRe+kUJrGkZr4dXjvk2XXjHsewwbKNbD8905DLRqUfxw3vmerg/4tmP/T26ebCa8=@vger.kernel.org
X-Gm-Message-State: AFuF++mdBBVwCS4EG18GZT6t5mJOJXTkXfjVqNDhn/ifIXMBXVL0Yj+Q
	bdbQZyiWTn8eIi1l/15XKwxGBp39NBiq2UpXsq1hi32m2Akxdf+I+mmd
X-Gm-Gg: AYBFou3YICKXctXICtHPnUgLuQy2J+QYRw77PV5FICK841cPGvQjaPZPwVDkkzyNGlU
	BPfAHRs3NkAlpp2JN7zBmrwvdOlr0bIad1De6bSQKB04o4ww/k2GLPlJ1H8ZOcZ3ewTVE9+3cF6
	2Xc/FrVp4oZaJtVg9VdI9Ey0Ad/zJ+7s85B9xTpb0omxuj1/FaAVFQVCTq/jej6rX9bGznaBmd7
	rBU7yNZ3PGbV1HghK0IzHmVAMyV+SqvnNaLoP6s86/SyRa9Gte+w0aKh20BmYUYunf62dvC3s1f
	rWRAhOekEmzr+WtUDOJj8b0SUc4XPoNXeD5lyGtERwaQJkyEhQvUJfRji9HKoFVAQtnNVIfcIvr
	pWLzAh/kUpd2smZsHWy6cT1mr7gaZbJ+uTU21Pwcx7pWH911vQmk0sPJdZA45fGpYfwpfKzyusI
	KAMY6tueZix3Y0k4zMX7JGKW3mcFUiUboy1lb67ZiqPQH1PfGiV2lbxzs7CAqE3BCceAzl4rirS
	A9bFJcwmvTXkIASITAazuzCFH2kj7cJAcVQfA22tL7gq4AjtHuV6FKIAdbClOFm7duqlhZMb3nR
	BdPxrpW9k3OhZIX8WAsJdFDA8kcIhxSzA3Oj4SKWXz04+mDrTlmuGjW27dfLrWVR5Ls=
X-Received: by 2002:a05:6000:29d9:b0:484:3310:710f with SMTP id ffacd0b85a97d-485872934dcmr17557621f8f.27.1788598334606;
        Sat, 05 Sep 2026 01:52:14 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883959f0sm12995609f8f.10.2026.09.05.01.52.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 01:52:14 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] Documentation: reset: Use fwnode_reset_simple_xlate() in the kernel-doc directive
Date: Sat,  5 Sep 2026 10:52:11 +0200
Message-Id: <20260905085211.40286-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

reset.rst asks drivers/reset/core.c for of_reset_simple_xlate(). Commit
9035073d0ef1 ("reset: convert reset core to using firmware nodes")
replaced it with fwnode_reset_simple_xlate(). Since then the directive
finds nothing for it and the default translation helper is missing from
the rendered controller API section.

Use the current name.

Fixes: 9035073d0ef1 ("reset: convert reset core to using firmware nodes")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/driver-api/reset.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/reset.rst b/Documentation/driver-api/reset.rst
index 7a6571849664..932699c57d1e 100644
--- a/Documentation/driver-api/reset.rst
+++ b/Documentation/driver-api/reset.rst
@@ -213,7 +213,7 @@ devm_reset_controller_register().
    :internal:
 
 .. kernel-doc:: drivers/reset/core.c
-   :functions: of_reset_simple_xlate
+   :functions: fwnode_reset_simple_xlate
                reset_controller_register
                reset_controller_unregister
                devm_reset_controller_register
-- 
2.53.0

