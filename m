Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A685E3CF217
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789437339; cv=none; b=plh7qdbviCrOx1GtKzCS4F2emY9cbPAnrgzLJFq0UNUWIZdMd1bEfJtp1LOhEdaJ3cvSMn+DxlZXLUWXMoxGgQgf3noYkHK80AnOdmU0VZ+o8f725jO23mYy5Bghd81jKrTC93cYn6/oGpDs2Y1NbyDxH9rPOrbeYiXf7NNJ9Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789437339; c=relaxed/simple;
	bh=YSvTJwjDAjCvoWE2T05StqLkRwhDOCuesdzub+bU8P8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c3bgw49PcwxzVvEC+5ZUzakWnbdgq+2gPhxG5vC5rswwk4nZpBLzctop/2r7QiVRsk3P5fj5w2MVZTDYI4GOZXiCjtKO0Ak7XFS8VccS6LnbjgjcOreMgAWa8vUHi1bpwaYXfYXMJZh5ne6WfqFH2IBJZN5y+b3ZRtbY1rgecQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+GZCKmf; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+GZCKmf"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb7692a57so30520931cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789437337; x=1790042137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sQzxIfg2AQzCkVpbVYXrLDBgU99fKCXJvWhA7g6zSYM=;
        b=A+GZCKmfuOTbccApiqULuH46tzXOjRXMUGLUEbjteF8ZhP8mPCWRUQPre5tNan3k+S
         eS9mxuoij3LXCk7BG1EaILuTIJ/sPZ/8A1NkNX+3JvtnHGZ0+gZuBbNxQDPTCABeL9dA
         RmVcl2E2cQ6ruP0wmmvB4HacfnSYB5bD8fwtTkpcI6XhGfpgj/tVIoqywwrsFgT+z70j
         IgsAdp2N8Uiba5O67b0JAfWq3KQcEy0srgiyHr+nCoKLEl0rnKme/iZd/Zc8EEaPOVUu
         /I4v3Gcrko/eSTEjlp2qIb2DxlyJl7WOW4a2yl2lIS5nVQNC13aw2Ig9ESk/mONy5dmD
         Q/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437337; x=1790042137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sQzxIfg2AQzCkVpbVYXrLDBgU99fKCXJvWhA7g6zSYM=;
        b=ZlmDSrRYUFxJryOO8LtJtS8PW1gpjtQ0oJsuMZoIqKnQjEQKp7LcaefP408O9A6m/n
         cHWvryaYFTpp8MkB+U5+8w+Rkew0Bpo9YDQEesFA9fU0ZOz6e98P1AMfrsK3mqNcpmfv
         lZc0+d1BLo22cC67NsFccD/trlYSxW6G8g3Qeh1JKWxFV160geGpwz1ZTG7CJI43ozVj
         YU/drLft4LHabjgmjezvqSxeQZzxcUh1HFofHnNYBERP5GocUAjQA5HuppmzwrtETA1w
         B+mYAnN0Qjxm2aJGQaJrmBoPl6Nr6QxjbhPtsHow3y5tB4Kz6E8jyjIRVMYRqpBNt8fb
         lujA==
X-Forwarded-Encrypted: i=1; AKwUvByzhottUXJICseB/YNhIs4W8PoQlQoILRF0EYIf8ZUMxwq2zN+GukKTliuxg8xZRmPajits1zyNCLaTiQk=@vger.kernel.org
X-Gm-Message-State: AFuF++n+434ELbC/poD5CdKPNNjifVSiq2mM9QdpVaI/Fl70w8Fk33Rc
	IpMFvDbmT/xFUGB5bTaov4DnN4E+AWLeRJ7/2QSXiJ53+aLzo8fpkEB01iPeRlCHcw==
X-Gm-Gg: AYBFou0HHhF8e1BpQvyAO+8quXa1xmFg9k+3+pR/cz3B0OgdDPsZ9mdxL2pdc8aOTqp
	ZWIPeuwaL+M5xf04RdZjgBUBSOQLFIAfyfLpw4LsBnIMr4F9mg6nRxXHjHvbw6i8cuRLzlgsdbj
	baseGLRBGrDjdG7CewoFgA0YMmS80EBQYw3GRq0xD/J46cycNZERs6+gKaQcRalbBJBny56x1U2
	88QJh55goLbxzO7y9TZ1QIGxLkiUq0hHaNA5ZxRuyzF4ZCvRycif2Hu/uLZ3aKAk4r3YHi+n2VK
	ECU+9p9ugFoUJOfwUR43bsuSf9TCmo0W5LVL8zcwd3vjc1Q5uP0u42xmYa8VHeKZ4iZddN+HwdE
	+HXMtqxqfjXRGhgkh4Eg+kDd3y+9crCTDqzNJIhhi7VJ/vcSJYSUz7mEAuenSC6vvj7QxSCLD7+
	SlQd8W10G+87zDx/iRzZR41tNvz/lix6DWnrix7AcumXGDTMWX2NI4v3wfMjUI/pm96FMmXKu1A
	AmmhwJ26PCFXhgjybii3bkmOJXJbxfxVZpyXnoiB3ubdqzpFloKV4yjAI7/iQYC7HU8W0uKhBJ/
	yivQux7u1xTr1yzMx0cVC1jRggzTa2PW/qgKwtp5bPAVnWYkNE/cdYf8Z8ZhS/75aR9ONQ==
X-Received: by 2002:a05:622a:387:b0:530:ba79:edd3 with SMTP id d75a77b69052e-5310d09f26emr80280201cf.62.1789437336690;
        Mon, 14 Sep 2026 18:55:36 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f5ebc79sm109264546d6.48.2026.09.14.18.55.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:55:35 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 3/3] EDAC/x38: Balance PCI device enablement
Date: Mon, 14 Sep 2026 21:55:19 -0400
Message-ID: <20260915015519.83833-4-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260915015519.83833-1-mhun512@gmail.com>
References: <20260915015519.83833-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

x38_init_one() leaves the PCI enable reference held when probing fails
and when the controller is removed. Disable the device on probe failure
and after removing the EDAC controller. Keep explicit cleanup because
module initialization can call x38_init_one() outside PCI driver binding.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: df8bc08c192f ("edac x38: new MC driver module")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/edac/x38_edac.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/edac/x38_edac.c b/drivers/edac/x38_edac.c
--- a/drivers/edac/x38_edac.c
+++ b/drivers/edac/x38_edac.c
@@ -423,6 +423,8 @@ static int x38_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return -EIO;
 
 	rc = x38_probe1(pdev, ent->driver_data);
+	if (rc)
+		pci_disable_device(pdev);
 	if (!mci_pdev)
 		mci_pdev = pci_dev_get(pdev);
 
@@ -439,9 +441,11 @@ static void x38_remove_one(struct pci_dev *pdev)
 	if (!mci)
 		return;
 
 	iounmap(mci->pvt_info);
 
 	edac_mc_free(mci);
+
+	pci_disable_device(pdev);
 }
 
 static const struct pci_device_id x38_pci_tbl[] = {
