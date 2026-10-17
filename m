Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68E5377004
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 05:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792214385; cv=none; b=fJDw9ebECR/d28k3nl6xJ+9NXTZr6JLdVkFfG3+Kr9s/b80c//g9kQXhVJZCxarRwahS7S60D8j5fe7bFcNNN7GTbWcRjNMi5DfFlBL/sN3bHpkK8uIbSqjdbvU92y7A+s+/WSGex03PyfIQI5JV4Isi6Q7NbvVrAYbTYvY5txU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792214385; c=relaxed/simple;
	bh=ky6PePi/fpetxqkSpkooLbGaqEzmRUTxqPP/Cm69q4U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CcHD4vwxfLD2duHyLRclhMBlLeMPv20TeCgwddI5Q0Wcgu8uZnVtGad/PuHCnTOMfirDrEa6/Bpr51uMrBDhAb9WVq1KQyBnW8oxXhZhwP9d4QiMHcd+2y1AVDS7+ELFe14hzQ+hXJ0NOHKNDJ3McF6EgH8oYzCKIqidIh/0N1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=okFXP1LQ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="okFXP1LQ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so5785515e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792214382; x=1792819182; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jI5B6P/xW04ozzor4R64wJbnVhuui+cU4FBwYRf4wko=;
        b=okFXP1LQCHhsR6CaDNvjGINHKyFbBoZ/WxFo7PdwyISuvckUtoC4LUiD6768UXfIXj
         FEF8KmAnOlTslAqaX5z3lves3Ou/Bk+lH6qpoUT8+lD+P63qJZk3ylPB0d1Y/qoBqh7t
         xZ+C3QuzyPhuGoBrfxNuZtfd7SgRx30VdSPMY13OdxoVWH62I9Pe3zzO5+pJlramaXI5
         UHumHwzbSx5iSE1u5CGJjQYIBIPfKrXSG4hekNCWBqPynZDYq2PDvR47KLK1Dar9lZck
         9RKd7Ge89TLVNgThyd28nHE1TghZbpri5qugzt34aE3NwZsFqKt2Fy/6mQHu/ckjHwNo
         6Wrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792214382; x=1792819182;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jI5B6P/xW04ozzor4R64wJbnVhuui+cU4FBwYRf4wko=;
        b=CJ+Rb+C0KIkb9jk5Ix7dV82Efh/YYR4ETIaKqfPtnlddf3jvWKEvzrwZzc4qZ/ckvX
         BPXpWDHyWet8lXBgt9uhv6HhSTifCtt7Ou/oaO7rxVoG02CwRR4s7mlnaGBjRdvz3/+W
         djRMYXw8ghLeQFegBwFg9zPjJvkvkw6yMN9nNC8qrpE7NS8dOH1H4ymgRzo3ZQI/ovwC
         sfBI0O1F9TAV46SzYVCDc+VmvtZvDv85DN7yJahKFLscHUavwjvqySWHsJI6XsYNiake
         PC8ZY3HYlrjpbYelkICzzhkQD/6JvtHLVYF5U8OrxI45HY0OpEk2b85JWrnZdusoIGVg
         Lxug==
X-Forwarded-Encrypted: i=1; AKwUvBxZRdzwSX4+aVF8An0ISq8/kFNwv7KNXMf0WARJQA5VRNl+6DYaiw022smABi/mOkxwBoQOlcxE78gaJEA=@vger.kernel.org
X-Gm-Message-State: AFq9FYINvW72aft8a4OS6gIPHhrOm64Bl9av7bC4lFaIGbqqiJfhvHpA
	0kdkRhcvxy0FDO4KCBj5XC1twFZ7smxJTkREJlATDa2XpRMEF3lGoFF+
X-Gm-Gg: AYBFou3ikboJuC9vFGgN0YfKG3JvOP/ol6H6d2DEAByudlArgagRDF1N3TiCLqTi2Y9
	JXlj86fuoGCEdan9D02Dmliy6EHQ78spJFJr/8PQvRYlnqCxIhP/W4s9ppTlLzK52vIvqWlTqtM
	ldKODJGFx2GFfFo6vDzuAwBydmtcDSYNB+RixlvJ16j2pEpfXzvdNTjlpQdvathQVsJlMJAQF0C
	QHjepueGj5IiXIKqtV7GcdAWxBmR6DUqqQttpoRXV+KlAYFMcVjQOVk41w8gGOJBybaRN3uf2IO
	qnRmt+VJ+cnr2LnRDf3PFcKKrZwdsRDf3kFxpmX4qb065kv24hDxGeQl6Wz7HBkCIDMwC5XauEz
	m30m6g5ta5adH5SYNp22tvFjGPFO/ZvZbFb3luPEyRz+YenCPfJj+RvvH8M8d0iDuQ8rrsVe8VL
	19zSjj3wQkD7ENbeoEvtIMg9mLsXd6Blvhu/D7YGFP4neltYkCmuK6NWAXYdQgd5TPBafw2v43M
	zCjaYIOSeOXM7ow2Np49wy1vXksIcIOXqH3VktNzYzHNyrxW00FqjBe8lpefzWZLN3JfmYlnfSv
	iu2CCYrnz9gibiZByhWVEDHhBWVwh3xWvjS7okgnXW8LBju286A5keVNOVoyZzMYVhahaSkghdG
	vSuE/yK4RccTjZCmFYbcU3u8+QoAT/AQc+zbTNT+Fc3kY0vRwGDyHclpRPSzQOdKZQJoFcZvB
X-Received: by 2002:a05:600c:1f83:b0:4a0:27eb:49b with SMTP id 5b1f17b1804b1-4a1d761b900mr33747025e9.30.1792214382055;
        Fri, 16 Oct 2026 22:19:42 -0700 (PDT)
Received: from [10.200.7.52] (109-81-110-105.rct.o2.cz. [109.81.110.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1dc952d63sm16432585e9.2.2026.10.16.22.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 22:19:41 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH v3 0/2] iio: gyro: mpu3050: add missing trigger cleanup
Date: Sat, 17 Oct 2026 07:19:19 +0200
Message-Id: <20261017-mpu3050-fix-v3-0-d6f29f335a2b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Myw6CMBAAf4Xs2ZrulgX05H8YDzwWaCJCWm00h
 H+3cMLE40wyM4MXZ8XDOZnBSbDejo8I5pBA3ZePTpRtIgNpylAjqmF6Gc1atfatMOUyzxsmOlU
 Qi8lJ1NvteovcW/8c3WebB1zt/09AhaplrnSDpqgkvXRDae/Hehxg/QTat/zbUmzZtLnhAiWje
 t8uy/IFzir2HuIAAAA=
X-Change-ID: 20261011-mpu3050-fix-145a77d5229b
To: Linus Walleij <linusw@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joshua Crofts <joshua.crofts1@gmail.com>, stable@vger.kernel.org, 
 Dingisoul <dingiso.kernel@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792214381; l=1108;
 i=joshua.crofts1@gmail.com; s=20261015; h=from:subject:message-id;
 bh=ky6PePi/fpetxqkSpkooLbGaqEzmRUTxqPP/Cm69q4U=;
 b=M0LgvKOdE5yjdYECNlUil2WtEt41lBcIPYWXooIAJS+O/mKpogTlJtcVyXYXIjFBabRb+aQ+6
 VaGsWIXoEAzBZKdoyX5/8zWm+alcUgHmEZ9pO5ndFzUM3twFjICAXHo
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

This series fixes an ignored error return value that causes the device
to behave in a weird polling state and a subsequent use-after-free bug
reported by Dingisoul.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
Changes in v3:
- Add a separate patch addressing the missing goto on trigger register
  failure
- Link to v2: https://lore.kernel.org/r/20261015-mpu3050-fix-v2-1-53f73581e62c@gmail.com

Changes in v2:
- Add a local struct iio_trigger and assign it to the data struct only
  after a successful IRQ request to prevent a null pointer deref as
  pointed out by Sashiko
- Link to v1: https://lore.kernel.org/r/20261011-mpu3050-fix-v1-1-f55b0d138be4@gmail.com

---
Joshua Crofts (2):
      iio: gyro: mpu3050: fail probe() on trigger registration failure
      iio: gyro: mpu3050: add missing trigger cleanup on remove()

 drivers/iio/gyro/mpu3050-core.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)
---
base-commit: a3b3580713f3ac5a32dc2874ee546828977a1d68
change-id: 20261011-mpu3050-fix-145a77d5229b

Best regards,
-- 
Joshua Crofts

