Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793417241;
	b=QBE6RWYujE+gwql81hDpah/y76v8OL7k9eAwOJ0kHiQz9HS7WIDvcka3+NYHCxdVDsIP
	 DH+Nq2MvZH1HuLAVHSH1kelTOj2gU8ED3gusmX/du/WLSu+s+mxUfLBVPerwC50YUORur
	 x5+c9hgm9n4kLiESZDf1iVEpbhGV2muJNjmvl90+w3ZWAyZkB4/ztgrcwkermGjw4NgYq
	 mBTEIOH0DmEvfZERgq/hTCJF9x3b6lXwkIZeh9sCS2qmTyJZSF0d8dwXZuNQoRLrWh2Jj
	 q0kOKLguZeMOhBOgmbxXk5/0TESozWxAVgb3G+pY+P2Cdl0pv8PCORRR5/tGvaTkplQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793417241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uH6hK/H9JVYEm/NtIKeeSCgyp6yYaM59G3HYCFQCfN8=;
	b=ScQKDo+3xm45lfD/7je2SHQaxaK0i4+omai96S64C0F+72kkmq8IwsVGCfVynJYhuVTj
	 HYAUUGhV4G6b+bYo7RA4Kv0jryVv5kwkmW+9TImqXc6QwxTUOF4+P+On2LPJ5u/UpRaA3
	 lZF1crgGnXV7UQkiD7kt6pUFWtjCE8g3POX9/c70xs9saFG9o/1yCNl9Hoq0elMXrLJNA
	 dV4tTJIf1AlOF1jHcJ/FmoVhzOLa8876dR27R20VajxUkwuFX7CabdhzQ0cWBp4AgMyLr
	 fVO0xcV2L+YdlaS0EZ5syTaOY+G51J4v1FKzooZgB2Ob796ZB/zGy5hJcK3QAZzcLGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iJ56TXaH;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217BD606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:27:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 217BD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iJ56TXaH
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e9d7791b00so10759545ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793417240; x=1794022040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uH6hK/H9JVYEm/NtIKeeSCgyp6yYaM59G3HYCFQCfN8=;
        b=iJ56TXaH/PKn54XbWz7ljFKCbtMUUa9B6F303ZSClcEWbM13PLFWkK97ccxNgbihY9
         vNdQAKppPddvQYTdi1o1fMtlgDtQmxBaNV6AHd6Xa16CiYPmBtkKlOYTIHpgj+YWVtjv
         NXFRLkXbOQzaCxJ3HndoQXpZUuGccdds9ONG+Hl3X9N9Q2bQX5kaoc5m9lkJ2EKuB43O
         j+y526xwdK3sC1ejZq8/v0ISJXjETMN/zNckSZMAE4QkHSkZwo08y6DR/A202oFNHD67
         I80Tswxv/rG3xtBxqka8Ujc+44G5vlrl4nqCrObOhjTwieT1dj/BXYHEh4tHuEzOyE7g
         6kcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793417240; x=1794022040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uH6hK/H9JVYEm/NtIKeeSCgyp6yYaM59G3HYCFQCfN8=;
        b=BDLEyQbd+9DbdKt9NJQIcvBLa8+BNDdhBvKiOpKeQinjlkr1OAZS7T61S3Dw9OrkA9
         emRaG78axNgfx0GcFlp+yx4Mw+KYEVLA9cXgRSEO7r45df4nkJ1qsB2MmRBaM2rwN1jI
         RJVQWk6pX2zChrcRfISfkjFXcW2mAZ/7PpZvB1GOS3tuTGZSrmJ94YKh7QIrkFdD3VSR
         TOPlQVAnL4JljuwA0fZ/cXXaVbtTKlRPKcPQRReJURq3xIzNEATC278x3ejnetMKA2Ns
         XEBT2BYeQn4hrtGSVEd/MHT4X/7UN9m3HmIZI80PrEJdhgQH6HtFJPX5VQcgUKMtzPl4
         pzPA==
X-Forwarded-Encrypted: i=1; AKwUvBwSQneulIBVxYy2Uct+ceDLnmlFkT6KHkxI+SyIJEpdssUEqKHzVARLM48JhCpcVF2ix8+Kx49utEBSDDs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCzY380jV8cRB4qVSPS5T84bclk5HACOuMfQDuia16Y1a0FLeg
	QDWeQ48q5f6AyRDfX5vX3BrtbgAwQql7kB28ej3tvcuHE5vmsIC0CP9x
X-Gm-Gg: AYBFou00i4Sxfu7I6UraDyEVcP2tv9jV9Vef4dmm8+ICiq3Ex+xQ4lDm1QOnKTkzdyJ
	hVfrVLcaXz29NCdBJ6XNnlUeHMgzppddbSRil6S4L1TJkKF59uriSotnxgV8CUFyMihvTT76o1S
	2J3iGUQE9UbLvn4KRObZGjlMxAAdYTcEa6150IrhZZMClxAul2HCH3DGjSHpE0mx0gdgk5VEuCU
	EMVkOz631k8QaRuQifhNcYlM+tNgAsSy6uZeR7CjJMS2mGD1Y29BOjNEKQaggiyYaK0bIW1b/hT
	GWgn2gGTi2xVux4No8LfoHKw6cpacXFg0bcMmOr1WqUsykULONEcq8/iQF9+CMnTrKTCb6Heva2
	piQwX3HNMQCoHPySpwPRvYyQc0TPOKtdyX6ZfuO5eDNhX7f2rLDvAyBwoSCJb9BXwlgpna7hBBa
	9j/JiG/ymBcqHchNAuXqa6UGz5eWELllQ66it243Yom/mp255n1Iol3ZHX2G+medxN6tBe5Jm6n
	0IGH+PRGnEWrRf/1talkG1NGBbt+w3zaoymUNjpY7qJ4eeUru/6DlWskuOs5TBgRktcz00CRgBW
	9ekXwTzSRVzBgHzlDmQiMqQT
X-Received: by 2002:a17:902:cf4c:b0:2dd:c100:7cc8 with SMTP id d9443c01a7336-2eb3651f559mr37166605ad.68.1793417240011;
        Fri, 30 Oct 2026 20:27:20 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39231422sm13203495ad.23.2026.10.30.20.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:27:19 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v2 0/2] Bluetooth: SMP: Serialize root channel updates
Date: Sat, 31 Oct 2026 11:27:12 +0800
Message-Id: <pm-bluetooth-objects-candidate-0184-v8-60106ad0c49170f5bfb4-0@gmail.com>
X-Mailer: git-send-email 2.34.1
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

The SMP root channels in hdev->smp_data and hdev->smp_bredr_data are
used by HCI event processing under hdev->lock and by SMP receive
callbacks on hdev->workqueue. Power-off already removes them under
hdev->lock in hci_dev_close_sync(). Two other writers do not serialize
with these users:

  1/2 The force_bredr_smp debugfs switch creates and removes the BR/EDR
      root without hdev->lock. A connection confirmation can see a root
      whose operations are not set yet, and a disable can race with
      power-off and release the channel twice. Take hdev->lock in the
      writer, and skip the deletion when power-off already emptied the
      slot.

  2/2 smp_register() replaces both roots when management powers on a
      controller that is already up with HCI_AUTO_OFF set, while HCI
      event processing and SMP receive callbacks can still be using the
      old roots. Run the registration on hdev->workqueue, where it ran
      before commit 2ff13894cfb8 ("Bluetooth: Perform HCI update for
      power on synchronously"), and hold hdev->lock while it replaces
      the roots. The caller waits for the work without holding
      hdev->lock, which HCI event processing on that workqueue takes.

smp_register() still warns when it replaces the channels on that path.
This series only makes the replacement safe.

Cen Zhang (2):
  Bluetooth: SMP: Serialize forced BR/EDR channel changes
  Bluetooth: SMP: Serialize root channel replacement

 net/bluetooth/hci_debugfs.c |  2 ++
 net/bluetooth/smp.c         | 38 +++++++++++++++++++++++++++++++++++--
 net/bluetooth/smp.h         |  3 ++-
 3 files changed, 40 insertions(+), 3 deletions(-)

---
Changes in v2:
- Address the CheckPatch and GitLint long-line failures reported by the
  Bluetooth CI: https://patchwork.kernel.org/series/1197223/
- Trim the crash reports in both commit messages to the headline, call trace
  and allocation/free stacks; no code changes.

Link to v1: https://lore.kernel.org/r/pm-bluetooth-objects-candidate-0184-v7-c26e53b52c260063ab6a-0@gmail.com
