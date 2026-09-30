Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C203F511E9B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784498; cv=none; b=eD2kdffANv5Rm67XJTgipX3MgsV0D7tWyS5eQDqUpp7XqJXrZ9b02yDgGR4v950fk9UpJQXetoh5eSmRappxqthAf6prjDYY39J+jbmSajaLzp2T/Cx7wrfe+qbt/Ck4wqiMxw2IvMlim/eK3UQq9O4aWBcR2CKi/utcgTeJ5tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784498; c=relaxed/simple;
	bh=zJZKQMvC1ys529AS4mRwnIJQMZ7PXCRhjNH/GOfynAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oRL5rQEm8PN2iYSr7UWhpOSBdTJt+dDxVCvdDZak64wUqgUyzDf2pzURBy6qxvM2H7vfvpT207pN0ltTHGmkcN/SYi0A8tDi5fhKSvZiFilgy+ts5VE3wd27mQkgvy41DwR9p9ibZKjB7AZ8sgZdlXIo/keAack7sZs05tVqrLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=FNDqE/Rt; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="FNDqE/Rt"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3920so41675195e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790784491; x=1791389291; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CaDDtrGWSBNMp7ldkJ9Mq01ee6XVOof6NPuczSuozcI=;
        b=FNDqE/Rt9EpyqxjjAgkkneVHs5m+zPEP3nFkAa1e8oL7Fg5e2RPlDPdSlRjBRdY0VW
         2l7u6NDfhVMTUerTWRbED00Hw6jT+eeZEe/v8nnqojy8GEiAqxki/PIvMY95L3FwtF7P
         O+g24iV3Ykz62BWxBywpCsxJ08Q/qwex78qFJ7bvV7Xc/oIF3P3usMpGhxEjiC23w7N3
         Ob5DndFEoFOigml68IYAP/tMTBqTTMtWJke1apltV1mzcJ24qoMlfGRdaeBFosofLZy6
         gYol2HFAfM/UGiuVMZS+pG2VnOWAazwtcQjRL1LZctuJRkpbQaTGtzA+uz4l98OqiIJU
         dEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790784491; x=1791389291;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CaDDtrGWSBNMp7ldkJ9Mq01ee6XVOof6NPuczSuozcI=;
        b=Qxde7V9QkfFq56K4jaAyiu4Sq+rx208Kl1PggABRhybcxzxXC2TlAdg/Jh/82XcUSm
         qbE6dXDeSGRJ4EY6lpVtUgmBZk0kWIv5eK3c1xywv3Ay4wyB6NGdOy4j2sYEK6rsIOLJ
         D+EHOs9HfQTV8csu4bJxRH5PbnmU0uCvpGlzLkwTahffjlr0OF2Kew/P5WSMF8SHlO5R
         jj1vslQCpH+9nseMZijCJ3ZOIpgqmIRJYohmjC8oJSaGqdHoM7v/i01vqnSlB3zE3Nch
         OulEbDn5j/ALb0ZrOX1qkW85kD8rpEJb71A72j7GP0pGbuexB9gG6epVb1dZfOD9zVQQ
         IWHw==
X-Forwarded-Encrypted: i=1; AKwUvBxDd6sbcsir9x9q8vInB2WwdgPYP7koTp6//QYIheksbgppHTLd/6STAtEqSvXX6H9a5zniVq27tooD/C8=@vger.kernel.org
X-Gm-Message-State: AFuF++ms36xowxUwskbDie0m/dc36kuVyKfKZ6r+CSRlCzC1xrZWYhIV
	6vo/qNB/qVTnjeQHWI6qe3hxW7i4lCkPcSvwOqagghJ2YDgqxfgGo8iEdEmfSlPilXrFn2M6OcY
	yCEFd
X-Gm-Gg: AYBFou3MaQtGLfFnSfIgkOyJpwmgK1j1nz14ki+GfGjR1YvaMFIKG1r98T2hqLDqGUp
	ChD78ysEqx30vYBChrh7sv5yXsizTWJBWxUaDgCUSTU7SVuMSPvLlLXjeKngrwNQ0TmhmqGKzqS
	nseROWEMgk4A0sTsXUJVpaJEs+g+0CrcUtmoAhDqITgdVz2LsPKraKqrK/7MEYjZvV0EZJQaiSm
	uJckKzcitMilh1PA1mXRjJID8rgQfE/Kj1NR3o5GQ3xEUx+ddO+yhiOSJ0vjyPNmN9k/D8qqsKv
	aTWYGHv3A2gBhORapaxRASGKrc83uIz8vj009MlD0aCztIiyW767+hp2CmhSWBTLPeZUmb/Jc1A
	QdrpfPLKrQ+zpSIEp2uOAKh9wRGd2G2t7CgM6ovghQQXOU8aQQArsbQnrFmt6GMY0AjiFrrv/Z4
	qkeLirGeIMz3o+nDaGen4NbpOad2H5jrJ2VygciT7y30ihkNNZXMtzcmIAqbOuPynKAafyq2I6l
	0kxkJ9WsMz6G4gn3w==
X-Received: by 2002:a05:600d:82e3:b0:49f:fdca:c34d with SMTP id 5b1f17b1804b1-4a01aff3bc0mr40168695e9.8.1790784490851;
        Wed, 30 Sep 2026 09:08:10 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01eba0d3csm348905e9.6.2026.09.30.09.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:08:10 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 30 Sep 2026 20:07:45 +0400
Subject: [PATCH] PCI/pwrctrl: generic: Fix leaking array from
 of_regulator_bulk_get_all()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-pci-pwrctrl-kfree-v1-1-f09bbffd8da3@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ7CIBBA0as0s3YSSiMtXsW4EBx0bFPJUG0Tw
 t2LunyL/zMkEqYEpyaD0IcTv+aK9tCAf1znOyHfqkErbZTtFEbPGFfxi0w4BiFCdxyMbvtusEp
 D7aJQ4O33PF/+Tm/3JL98R1DKDkzCjgN1AAAA
X-Change-ID: 20260930-pci-pwrctrl-kfree-b58621738902
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1264; i=alchark@flipper.net;
 h=from:subject:message-id; bh=zJZKQMvC1ys529AS4mRwnIJQMZ7PXCRhjNH/GOfynAs=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTtNX65+WWP/Mfzu941zmZlS7rP0rEj86TahXffNCdct
 qgydQ+X7JjIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10jHWMGLg4BWCqozwZ/hdpzbU7EyD6oHZh0YndG81Kd2a+tfh76oxC1OuXned2LM5iZGh4ubL
 TVivZzuSjrV5I9WTHxGuTO2U7+rd7HtV6Xj5XnBsA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

of_regulator_bulk_get_all() allocates the consumers array and hands it to
the caller, who is expected to free it at an appropriate time.
PCI pwrctrl never did, leading to a memory leak.

Add an explicit kfree() for the consumers array.

Cc: stable@vger.kernel.org
Fixes: 75996c92f4de ("PCI/pwrctrl: Add pwrctrl driver for PCI slots")
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Split out from [1] for easier application per Mark's feedback

[1] https://lore.kernel.org/all/20260929-regulator-get-all-v1-0-e887c66a47f1@flipper.net/
---
 drivers/pci/pwrctrl/generic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/pwrctrl/generic.c b/drivers/pci/pwrctrl/generic.c
index d56171e0ee24..4b6cbbb52248 100644
--- a/drivers/pci/pwrctrl/generic.c
+++ b/drivers/pci/pwrctrl/generic.c
@@ -63,6 +63,7 @@ static void devm_slot_pwrctrl_release(void *data)
 	struct slot_pwrctrl *slot = data;
 
 	regulator_bulk_free(slot->num_supplies, slot->supplies);
+	kfree(slot->supplies);
 }
 
 static int slot_pwrctrl_probe(struct platform_device *pdev)

---
base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
change-id: 20260930-pci-pwrctrl-kfree-b58621738902

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

