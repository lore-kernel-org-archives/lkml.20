Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793370472;
	b=uWn8FahHl63K8jJA2BT5382SMuHsBVvn6IvrLBgSxAgF9Tt1uTpSsXTdcZlRSBTkJQqg
	 Y3cDKdVRDM8ypDgTb+bvRsY6kCDqGnkY0qsANI/4W9kR2qdy3GpDadoVjl66UzvXB/AK7
	 476Y7lnZhxqgrzr/m6sa+ezfyFMWRF6pOai0uxYtUgS1CEdplIh2HANq8JKVaLA8aUvLY
	 P0x5nEZf2APnPFYXCBxXvp7YimEZzaX0LQMH3/SzLU9W63m+pk7CTlI5YElZQddG4ce9j
	 qO6O51YNuoc6uOO46Qr/WLsbaO1JZBPn8fdrN9VzB2yJFb8Y0cFbmSUrcApba+iJD6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793370472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0KAayqZiomA+R77ysFRyaCC655BD8Hvw7toET98kCQo=;
	b=1y+Rt8GH+xGPJ5QqjkuTVbO92ynbK40Irq/Z5QREOr49lnXXK9p8SsLNSfj1yapyRbN7
	 n9UVeGRE/ALelmJXZCQXGMYOdxUb5y0Omqb8aZuY5SYHbzC84KsAhDSA6OeZm0njf4ZIg
	 0cgegFn2PAR5JOphBejjhPezbqJIeNBUnzCIdkbQW00Je4OjoCIn0d4mu3yVd+0a4BhxG
	 ZR/1k3G0G29lBuN5DM3K/cOhgrnaCDZRXUgP+GQi6bYegv7PYLfsY7ZvGAqQSEGmWnoCw
	 yyPvlrQSHF4o1RDsBEEQYYxqFPds3TuzjpgvfjVBTry+bc/F+mS+TN2HVjt83O7UxFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="U/9BE6ou";
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB93606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:27:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DB93606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U/9BE6ou
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a070755c8cso363997b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793370472; x=1793975272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0KAayqZiomA+R77ysFRyaCC655BD8Hvw7toET98kCQo=;
        b=U/9BE6ou4bWevQacr1zVcL7CWZZHv0knEkBGjgG77M26caLB1y45uWlY23FT4ActMp
         pqU0tuA5tn7LLzF24UI/kUQZcCorxhIgnJlhqnkxfFpsbEPrSZja+k9lOW7lPllt+JkJ
         9xySMeFvGMwLbkoixA8C9gbq8csZKqlBN+kSvpTeMbUKlJyO5uaIry6cKO6lSINUEqVo
         Em6abhuMiUgR4OLM9We9g7B8AjB1N9DISeNgvTKYD9wACJZqLTLxs5nC8/MteeZhoLTT
         uj7MeQEZDtX/8j2hvOj/9rOAXu+xXtBN3t1hfOqkWGhItiborvueHoyGyvFtoUW+yROW
         wUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793370472; x=1793975272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0KAayqZiomA+R77ysFRyaCC655BD8Hvw7toET98kCQo=;
        b=vt75q1qFz3mRAW4ltFVve06gPgJQDOF8dpuWU8GX3ajBA4CX/nk1819mbxfRbVpUeh
         CKe1LTetitCeR51RBC9Wa1UMQlpmmr+HWUQTvfoRzEv6kryBDOKUmqeIt/YdAs3FMpkK
         Im78cUxjRYwdBBKa3iyeh9fzWnB3NKzpdTZewLpfoma2vdz1RtHocWM2yK8mPxkI1VY+
         AjUVqL7tu/23NicpSM/ABCqAKzj+UwTZ0C5jlAW11Jf1nVZLR1jINEhfxqp+e9LaCTK4
         azLanlu9xbF0hUObsh9JK7rH1amjaan2JlcMDpckNDz3SsC97b6fVfh4s8rBctYEyYmg
         j3Ag==
X-Forwarded-Encrypted: i=1; AKwUvBwjlOeb3iiESEzIywuXFEuOQcS1lWX+chJcR96UkoTzOndz7v5wXVQs2/09909GDzpr5wIu/O7pehcrrLo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJnXifwxMaZsX8jzHh+kEG4MOlrMZE7cZ8XthZVtKvnYBBAcz/
	bHdKnS9IGL6+LHA/Eb8IjL8shvJ7lIDv9wuTIvO/hfJX7GbTpmTKhMpi
X-Gm-Gg: AYBFou30Gf4+T3iCegUnsffvX42sF9Dq+/hgogCEkECSjOmqJDLjyV7IgxyUXC5k6g1
	72RAkCYoBay+Zm3bapHaYHQE1jj/7kICiM6C0pUcbZ0udqyPtZ2hVFcnR6Eu5wRHCmZQnIOefFx
	/DBIwll4BQMcjGJrNkiIGuvBCa7JM2yQiEdlXqfRVn7yuitUlkV0VqX044uNK/gyle8Kthe3riJ
	vwHyVF18+uOo2OowG5MsS1Emrdmka6w8TJbTn9NvlrbbHK758UN1svjfcb61wV+hWK35gzVe9s2
	2+C0+o/FFOO7LhAbamxxo/wn87HbCw5wOk3rFmztwx9/j4FYm9Pj3EPhB3jnMC4q9ebHK8dJqWG
	/rP+hO5h1z59nGLukw1GX2b5M3oY9sMPLXkl4HbQpW3iboK26aUy7RSbInDe+cmDUPF7VLu/ytq
	qFn1dSGcLhPV+TYSRO1eZCoO0OGSH5mPT0u9cLozSMXcSpmURwj/ASa2DorELhYreWUY8m1Sd1k
	Hjq843k8BshIBS2vCS9OdeILoOfbMfT4ze2uRhMZ3Fb5dhL4S0TDXpzay0uVPFTzfyxarXHuMPr
	8VJ0cGpHlzGLr5rr/EzpeZC0
X-Received: by 2002:a05:6a00:12d6:b0:8a0:683b:f662 with SMTP id d2e1a72fcca58-8a9bb0d0c13mr2275609b3a.5.1793370471498;
        Fri, 30 Oct 2026 07:27:51 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad43ab44asm74093b3a.0.2026.10.30.07.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:27:51 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH 0/2] Bluetooth: Fix advertising instance accesses without hdev->lock
Date: Fri, 30 Oct 2026 22:27:43 +0800
Message-Id: <pm-bluetooth-objects-candidate-0245-v9-6b34bc036455ad3dd4ea-0@gmail.com>
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

Commit cdc36db204ff ("Bluetooth: hci_sync: Fix advertising data UAFs")
fixed the extended advertising data paths that use advertising
instances without hdev->lock. Patch 1 fixes the remaining request paths
with the same problem in the same way, and copies the instance numbers
under the lock for walks that send commands, as commit cac164b6246f
("Bluetooth: hci_sync: Copy the LE accept list under hdev->lock") does.

Patch 2 stops hci_add_adv_instance() from reinitializing the RPA work
of an existing instance, which lets hci_remove_adv_instance() free the
instance while the work runs.

Cen Zhang (2):
  Bluetooth: hci_sync: Fix remaining advertising instance UAFs
  Bluetooth: hci_core: Initialize advertising RPA work only once

 net/bluetooth/hci_core.c |   5 +-
 net/bluetooth/hci_sync.c | 296 +++++++++++++++++++++++++++++----------
 net/bluetooth/mgmt.c     |  34 ++++-
 3 files changed, 255 insertions(+), 80 deletions(-)

---
