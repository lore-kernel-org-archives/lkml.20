Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E9A372EC0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 01:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788485658; cv=none; b=bEFPXEu4NCLF7jUSWMU/94WZBrDHmCq9AKQ7MgbrVlGSCNhFt2H1PTAk2eGLqo0mpbwCbVTZnTSxmp8cvIqD2zofU65pUrtjaZb5JNCXKWk025D3tikrLwGep1S50wBpQhhvpVKoqUY09mpxmwCEsHAAWGOSFC3hRsXu6t+wCh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788485658; c=relaxed/simple;
	bh=o78dihvCR4QZ4C3mta/CvUdV7mYAuNVF1FtlYFhOjm4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KNUgPw/YXitqcIv1hvO1RorsdMLrWm5uZZJqmbqyxhbneBztlc329GDH2dYo+DB1V+j8eO9EcrSW1xMZ2xSp6AIEhouafps88R7H0zqmsdouxr6pU5IP9cDKV6/jhEH56V7pWPLVQXfb5OmeP16YbMUS7w0SEWWY5xXKxBUEcF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FPT86kYB; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FPT86kYB"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4b21f09ec76so393119b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 18:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788485656; x=1789090456; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gmQ5igFexm4sUQOCZXQ5PKCRuhBD2HGUSJLv3v9h5RA=;
        b=FPT86kYBCtfQWn/n/uWSGsQtw3LHcblK3tdzd6+pUE3fvneQmjrKXZAAaXvJJQjJXP
         rmR1G6kOWJnOFywJVfZArxCC1K/wyVUpMJrcZrk/rsVPYhTUNHiB6VKtaHQCa57/UF34
         vvLdX2JH2BfSc6qM/HuZkKc1KTzbYikqg2YgoE9c616Lu9GlXE8qSfKYGx5SYKQqjexj
         ks8qQPZTExcIuVpHtB2Pu4PpN951LJLiDuASEObpNSBFVgaAV8ee2QYqjVLuw+2RuWyO
         eh/Mv3OeQn5JYB9Sq3Eek1RltOviOdfCvWTRptrpOCx89Ps0K+4txdhLsNanak2jsepX
         ItEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788485656; x=1789090456;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gmQ5igFexm4sUQOCZXQ5PKCRuhBD2HGUSJLv3v9h5RA=;
        b=EfDYZgUAsha2otPapada/muir0iuCAtBWTyhB2JCMK4QzilPtFXobopnzSUdymO5z/
         qJ33naPfCxZAujKis+AhCQ84WvAo9ZxvLAdX5Na8WiU/EhQVlJ88YjrexhKS+Q2LOGbT
         73Tmo6EaVN6+nyVT4ATZTmiVXQGYROvrjaEtCNGw+E4ud/XL+qprV7Vo5O6WJltm00UE
         1T8cEzp/KLHvLzUGWibr2mlU6B/fQS52+uIDAsi09jlo2iYfr8lyhMZNHD2x1vttq2Wh
         mGwZzRt0adRlMT1wJr3M13e489VWObff7NKEGp/c6XpzOWg7W7H+Z74kGiiwigrqkZyt
         5zXQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4WO4okHxNM0NX1dImowYweT+UXmnuVtqGoip/EUAvoQ8gbsk0Xn6e8MbXnH9iF3JCbi1ZwsTCBQpFOuk=@vger.kernel.org
X-Gm-Message-State: AFuF++lYK5ypoQefASHQQFPhc/pgyhnRLOuiMCl76ZjKtZ7J4Xg2DDqL
	19WoR7qluqktJxkcYEDnmd3obgCydkAsC1cueVXl7tZJuKnmfvSrh+zT
X-Gm-Gg: AYBFou1dWrfPN6qfQLvgyvdP40AZU3wDPufaGzuN/qU4lwuSdAsqi3si1gm12cfSKja
	lyv72gMS/aOTB8qD5Y4E9cg+Zdz/864SZViVL880bL2sfhmMZVS3UpuvslckfqgBtjr/UG9SKXG
	pyRX9IbIlUyC513dag0O164lSz5hHIbHogm5tmq2ey5jAh+VkxYwIy4KlLPiQXMSZCZqhkj3Gme
	hEa6iVBPcvci6+Rahgwdgtfxn7Fycf5DhEQm7B1rgz7dDruq/Nk21VQyFKDp04yZh8z0zW9fdGl
	qG7tfexcqvPrNNAt4hF5IAR/3BzARSrrpeKMdPbnOi1iBJbqR8tZBBPZVIwHG6qU3C3rBuaI8an
	9kCQFXPiGJUFYXsGxxCijmsPrk0vtDyInVg68gyV2Pf9T+AZgU4C37eQsbninalEpAwSQG/DXkZ
	URNg3IyeuZpgeQXYF37ctQ5IXkV7aJsrIkygmgDoHYfi9BUmzL3rZDcv2/
X-Received: by 2002:a05:6808:1404:b0:4b3:7fa3:890b with SMTP id 5614622812f47-4b95fb4f409mr2553182b6e.2.1788485656136;
        Thu, 03 Sep 2026 18:34:16 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:8::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971b97c72sm1056170b6e.15.2026.09.03.18.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 18:34:15 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Subject: [PATCH net-next 0/4] psp: make tx key ops optional for drivers
Date: Thu, 03 Sep 2026 18:33:58 -0700
Message-Id: <20260903-psp-prep-v1-0-d47e9c4c375d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAYgmmoC/x2MSwqAMBDFriKzdmD8INWriAs/T51NLa1IQXp3i
 8uEkJcCvCLQULzk8WjQy2aoyoLWc7YHWLfMVEvdSS8Nu+DYeTg2a7cI2koMesp5lrvGfzWSxc0
 W8aYppQ/Ee41NZAAAAA==
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0

This is the first of two series which together implement rekeying PSP
protected tcp connections. Here are both series together on github:
https://github.com/danieldzahka/linux/commits/psp-rekey-split/

This first series is mostly non-functional changes, except for the minor
difference that netdevsim driver implements tx key ops. Its tx key ops
were basically NOPs, and in the future PSP core can subsume the assoc
counting that it was doing.

The purpose of the refactors is to make code reusable from paths that
will be added to the code in the rekeying series.

Patch 1 exists to setup two paths for tx key deletion, one where keys
are deleted as they are now in psp_assoc_free() when the assoc refcount
drops to 0, and a different path in series two, where the keys will get
put onto a queue for deferred deletion.

Patch 2 exists to allow tx assoc state to be set either from the
connection setup path, or in series two, from a tx rekeying path.

Patch 3 makes implementing tx_key_add and tx_key_del optional for
drivers. These callbacks only make sense for devices that utilize a tx
SADB. This distinction is important once rekeying is involved, because
an SADB implies a race between in flight tx packets and key deletion,
that does not exist for non-SADB implementations.

Patch 4 removes the unnecessary tx key ops in netdevsim.

No new tests are added to this series. There is no real user visible
change of behavior.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
Daniel Zahka (4):
      psp: refactor psp_dev_tx_key_del()
      psp: move code from psp_sock_assoc_set_tx() into helper functions
      psp: allow drivers to omit tx key add/del ops
      netdevsim: psp: drop tx key ops

 drivers/net/netdevsim/netdevsim.h |   1 -
 drivers/net/netdevsim/psp.c       |  33 -----------
 include/net/psp/functions.h       |   5 --
 include/net/psp/types.h           |   4 ++
 net/psp/psp.h                     |  12 ++++
 net/psp/psp_main.c                |  13 +++--
 net/psp/psp_sock.c                | 115 ++++++++++++++++++++++++--------------
 7 files changed, 97 insertions(+), 86 deletions(-)
---
base-commit: 6ebcf5074cff0402730c6981d2397139fee6322d
change-id: 20260903-psp-prep-8c6b0e4108e9

Best regards,
-- 
Daniel Zahka <daniel.zahka@gmail.com>

