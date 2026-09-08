Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF96C3B9D93
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 20:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788900735; cv=none; b=oscQG8ySZanA6WkIdtfnhFFdKNBIH8Ft3sbCuFxl2wneURaGQSDbwolMoGiAAmYXjvA0oebsWa/kIsn+se2a+nPlwC4+UpGlZJuiGEY0Hp6udF21ajfnc26N8xqIzW8dj051QNJQKHF3H/kgVXKhowTc2hg9/sRzBkzw648HpbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788900735; c=relaxed/simple;
	bh=Kpu5kBclnHVhSmz3WE9GOefxBeuAI5GUjzbrXGDi3ag=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZIJ+2XYPsvmoRbm8Tv/x6ShHReOI9MLzIQLr7a2gqLGsB3cRTVbY2VE366/3XnsepmJ8XCykcQ7EwgqErZBnxdQpuiNmC3ncbsn2VZ4C7GE3IIiwwzgq4gMmz9KB2RrxUiJtmvdXOZZNp4Pm6/AHT9EXi+4YTUaIPsh0zK4jdvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YY74F9Tp; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YY74F9Tp"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49b8687630fso43474125e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 13:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788900732; x=1789505532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8YsqsoNDEKQnLJ62BEZDMso3RhbAevKRTh54YJUBzi4=;
        b=YY74F9TplJpdkje1IBXw2lpGONEZ/5DzllWYuQ006NXMhun6b6UfMlgPJPH/e2ynnm
         /ywcbUuXMfUj3JpV3Oa38JtOLFetDAWkCY0ORidXQfh4xjWHYh/xMLGJYg6kmHvDfVmD
         0nURfCX+ShxUTnGU1bJPt/jHQxMZhPSWJAgE89OPHbpSKVxs2pk3MKpIYp5pZPqgQZ2f
         vw+19CUdfLJ1KNeJCEJXZx9nWBHC1MslEovahcYn6oILFYi8LXlgeh8rsKqr3fUUwWwH
         BnBQL/t1VmBJoVLB0TmlIjaAwJbZd/fj9aVEFEfbEeA+oMwJkHeVY8c/an3AvfaRfdHn
         uolA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788900732; x=1789505532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8YsqsoNDEKQnLJ62BEZDMso3RhbAevKRTh54YJUBzi4=;
        b=LyF1ZK7wJZXgV7zwWTx71McyRDGeQFS39ADFunWD+/u04XVqb61Qj5Hv+XnJdhWdo+
         Q50G0i9YinJKKo8O1zwGKbopQhR5srYht8meCHQ6ZMo+W8H5eKGbIvNE/AF1BMkUBvN5
         VgDBs82sfiOjQYqd8pAm+a1/66b5ODR2j5hi8TUDy6I+z/p6lZNrPwF567N7MHU7zZiF
         Izj88cYXTaRzX5b751nvtCALW9H2uDb3FaSFZrbamm9ZmTc9PMYkeWs4Uv0vuKv3eZ2X
         1MajgrmdU7NPvLUbxJvJVrbyaoD1jgATi8XiVq8w/N5tZvfXhcqJdYlq9OXgNXQmT23e
         GU3Q==
X-Forwarded-Encrypted: i=1; AKwUvBz8wnl90Fm9gRNekVtmbsPxiw3WLnqGd3Awo1g8ldWrYgD38Daf1mpaXHEkUXww634FcBXLkxNzNKdXCZ8=@vger.kernel.org
X-Gm-Message-State: AFuF++kAiLIG5sSo4FpWozfwPgUi7neZLmXqDVQFvJkGc6iXZrg8tOp3
	7xf6LvA9gEJR/EEE8QLPRsK35miB2gP+FCVI061t7x4sWM/yyLcxLqcJLz4dxRD1
X-Gm-Gg: AYBFou1Cg/bQckq4g+qlyDkEihoGdOgx9jRmsMpaqqYutAhz6ZaxswBwwnkzvfD9c9q
	GEKoxIoNZZLYfl9CgWwj7/5LcedCEXVA6IOlJDEbUVgaJFLjuEMUkVovOkQEFr500sOfY53W6id
	BVqJcZkvvYmbJJ5FFqBs5rQz1wcUovd1p6njVhablMusNjzmHYFPpfg3k0Hd9pZXoLqsBUhB7eR
	4yUPRsxk3cLmPzmr7LT9LGkXzZbNVWAVkq9KilsKRb4p82+tho9BTJibFQbJsqt2HhVBdcmnott
	91tclft/wAFvEZMpPsse/h+4bCHMmAsE4D3UvFEW6odgTwP4D5N/3oB0PIolXKrXN0TcZXMWhIY
	ROdMijtiBWf+7kOGCUZU2UBWK/FXWViRhQdwlP4qoYKgo9/92xmSFutg/FQUHQ8V8q9VBfoB0IF
	zuZKkurK8lpZnxC+6nA1n2v9GQu/nfV5qYDOFAlD/NHN+OwuHG70A0EsGqqkT0dpfx6ELjMqoRg
	7TW0TIJygiN66bOrXoHMRWCjXrFhi/IEECUPTIAhrtU
X-Received: by 2002:a05:600c:c48f:b0:497:fecd:5b00 with SMTP id 5b1f17b1804b1-49cf825d507mr320789835e9.9.1788900731833;
        Tue, 08 Sep 2026 13:52:11 -0700 (PDT)
Received: from arch.home ([2a02:1210:2e28:2800:36a5:7f85:ccb8:1176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm565265465e9.5.2026.09.08.13.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 13:52:11 -0700 (PDT)
From: Gabriel Windlin <gawindlin@gmail.com>
To: Peter Senna Tschudin <peter.senna@gmail.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Martyn Welch <martyn.welch@collabora.co.uk>,
	Frank Li <Frank.Li@nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Gabriel Windlin <gawindlin@gmail.com>
Subject: [PATCH] MAINTAINERS: update MEGACHIPS dt-binding path to yaml
Date: Tue,  8 Sep 2026 22:52:02 +0200
Message-ID: <20260908205203.649957-1-gawindlin@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 74459b0dacce ("dt-bindings: display: bridge: convert
        megachips-stdpxxxx-ge-b850v3-fw.txt to yaml") converted the legacy text
binding to YAML schema and renamed the file, but forgot to update the
corresponding entry in MAINTAINERS.

Fix the path to point to the new YAML binding schema.

Fixes: 74459b0dacce ("dt-bindings: display: bridge: convert megachips-stdpxxxx-ge-b850v3-fw.txt to yaml")

Signed-off-by: Gabriel Windlin <gawindlin@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index da3e42d2d190..e830a31525d4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16848,7 +16848,7 @@ M:	Peter Senna Tschudin <peter.senna@gmail.com>
 M:	Ian Ray <ian.ray@gehealthcare.com>
 M:	Martyn Welch <martyn.welch@collabora.co.uk>
 S:	Maintained
-F:	Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
+F:  Documentation/devicetree/bindings/display/bridge/megachips,stdp2690-ge-b850v3-fw.yaml
 F:	drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
 
 MEGARAID SCSI/SAS DRIVERS

base-commit: 5acbae5f7eb3d5275120abfe698c394b7325dcec
-- 
2.55.0

