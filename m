Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281594A43FE
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 18:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791310953; cv=none; b=YL06H4tzwyMRL03GBLS2vInQCQVm07Fz4Aksnwq7/ORyvEI3Zo2A8KE4fA4/4/so2/Qakm5uD52OjfmKQFHUwoZfA2Ill2w/OBjOzGRXDNzwTOfAwNyZHB2EsvwKKNNDNDwudDxb5wviBBUYyxiCyZe9LcQSvt9UeesBqmK8zg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791310953; c=relaxed/simple;
	bh=EPgKzaoJgstcSFA4vVpNd50KL37zoeGTt4wYgKNHB8U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YBTkod4sJPWl3vezviZQrv2iiX/mEKKHu8hJ6kNhJdUug4tyMwCO/ksD7mXiow0DHmZbbtr4oZPj4TqeaL14en7V0uHTmbRuIv37B5uuL8P1sSpkMezGJrbCKLQtRUi6qllvYK+SICWq55kk9xFClA8uqbMQx01Qv5uNbfxYQMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pyLovpcI; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pyLovpcI"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49fbc3db5fbso1790475e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 11:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791310949; x=1791915749; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9u9L32THq/S3e/dlOZfHwPUcMWY4OrkYhCdcRMC2Rs0=;
        b=pyLovpcIa+ToAq7K55Z1buUg8qfrxyASYf9uxX95+d3cy9+MUYhO1HIeBB1JrmaqjA
         uDtFz/XGdC8jrRBTgGUz/QEzINFIMtUR/A3K7xt1iT19hB29S8kTaQOZphQJQ1yCECch
         CSKqdPCh2h4WJedUngsVWzLYqnoOnjGt6vF3TxyMngmAhMi6UUAbC2OnW8z5g/U6+v9d
         I2VLWn3FTa6UJc0FlLRDpwMN5qCBBo8KbazKPvLuK/8uVwA1iSoddPakg9FGrDUmrHJi
         KciD+7zhRGy2fiLl+aDpDbJcObSgSkBsrLSyfDXrCxk6SaCASj/nsIxGk4t7+4NdT1Vz
         VwAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791310949; x=1791915749;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9u9L32THq/S3e/dlOZfHwPUcMWY4OrkYhCdcRMC2Rs0=;
        b=bVkNYWR/JZFEy3vmE3RVeJSLs7bhLIe5COUSQVRwmW/FBSWQGETKoOsZFwLzljbUI2
         B+vQ3tYO5nE3WeonZEnUXqE4iO4DIecsXY0VMgSX1w0qw/YOnioBu0ok601YOHf356uS
         X3i5QgOcGOUfARQc2S5zxNTTbLyrFTYq2mL81zBtKzPMXKt+Q5h4M4bgO7fnxbqwB6tH
         fVxMs4hQ4vS5MtVTj/UDchiqA9R36kd8gpuOoCwAcE7evD0LA/Bj9N5TPFiZSG84WGhJ
         ByDpq3yQd3F4Jkdf+B0Y2UjuFW0Tacwg7v3QwnTnDMFoHXw9qvReOJRzEwskrb9IZPaU
         /1ww==
X-Forwarded-Encrypted: i=1; AKwUvBwgpUp5xqBsL8+1PY7sgsyGBNANnylJQJ9a1Pe/bnKzTCH5DL2lp6spYaaA5xjZaBEJGVzsXIKR2TsF5oU=@vger.kernel.org
X-Gm-Message-State: AFuF++mCn9GmII47MaUgILcAqCWi5AK392XQNOJm+XFOSfSdltvdJRzu
	IYQvYDY8uVzUYl8anBLla7wX+jahUQPSeFnPJmgjQxy1kK6XtgJ46aNJKeoE/sSxb74OTw==
X-Gm-Gg: AYBFou22vPTc7KtbX1aXWwyYFW4hM5RgEVG2JeVheBS4a7KEvztzJgYPXUKvUqkUsd7
	DI/3Is1FP/Pixk1gQNKH2gnRmR8ZA1u4ceHpzuqVKpd4Q5zslkamwpz40gTsgPjcEgLXFq8rwn6
	iuE13GJtRpCc+SbGpu3zx5hFEEGIKppawoIsgdWo6D6dLaIrFy6qkfiBdCVwaAZtP++GFBOJQ6t
	fdXcFMn8yjDRo8z77gTzXM/7lSFOGzK5p4n2aB52sFiPlvhbDdomXjvvPkEYWV8QbQLvXzGccSd
	E5GKeVzhDuwJEwCIfIfEz6wXrL4L2hGf2s/BlwEjw3GPgUUtbtj4tc6ZP4BH05TjHVlvQUNwGIu
	fCKSNxV/+qN48WOdNdoHcLe4tGxdr6p0x/+X83y0LPwU+TXZE0Y3nsNFK74BKIJtTnIR8GG5KUb
	tX2bCG1AVH3UgesKfKJO6/hoa/7t1dv0xuKJxJ8ZtDHFS4YRn3XtlB
X-Received: by 2002:a05:600c:6217:b0:4a0:1f9e:5f78 with SMTP id 5b1f17b1804b1-4a027452677mr236959715e9.0.1791310948864;
        Tue, 06 Oct 2026 11:22:28 -0700 (PDT)
Received: from localhost ([2620:10d:c092:500::4:4701])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f4882d3sm4005345e9.4.2026.10.06.11.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 11:22:28 -0700 (PDT)
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Subject: [PATCH net v2 0/2] netconsole: fix target enable race and configfs
 read locking
Date: Tue, 06 Oct 2026 19:21:24 +0100
Message-Id: <20261006-netcons-fixes-v2-0-ca652d55fd4a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12NQQ6CMBBFr0JmbQ0US8CV9zAs2jrAGGlJpxIN4
 e4WdOXy/3l/3gKMgZDhnC0QcCYm71KQhwzsoF2Pgm4pg8xllTdSCYfReseioxeyaEpdYnEqZWU
 UpM0UcD+kyRUSCu235Ke5o43bpw0biKMP7906Fzv8E9R/grkQuTBGdR0qrJpaX/pR0+No/Qjtu
 q4fOkmi1MEAAAA=
X-Change-ID: 20260925-netcons-fixes-93a3e14326b5
To: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Stephen Hemminger <stephen@networkplumber.org>
Cc: Gustavo Luiz Duarte <gustavold@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

While looking into the sashiko report about local_ip_show() and
remote_ip_show() missing proper locking [1], I noticed a couple other
places that need locking: patch 1/2 fixes a null-ptr-deref when enabling
a target races against a NETDEV_UNREGISTER event, and patch 2/2 fixes a
use-after-free when the local_mac_show() callback races against a
NETDEV_UNREGISTER event.

[1] https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260814-netcons_ipv6-v3-7-bc0915e8c75f@gmail.com

Signed-off-by: Gustavo Luiz Duarte <gustavold@gmail.com>
---
Changes in v2:
- Resending for the 'net' tree.
- Link to v1: https://patch.msgid.link/20260928-netcons-fixes-v1-0-bb5ffe5e698a@gmail.com

To: Breno Leitao <leitao@debian.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Gustavo Luiz Duarte (2):
      netconsole: finish enabling the target before releasing RTNL
      netconsole: read np.dev under the RTNL in local_mac_show()

 drivers/net/netconsole.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)
---
base-commit: d5a007b9b457c915ab1a53227e8939e4018aa97a
change-id: 20260925-netcons-fixes-93a3e14326b5

Best regards,
--  
Gustavo Luiz Duarte <gustavold@gmail.com>

