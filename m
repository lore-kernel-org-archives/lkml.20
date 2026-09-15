Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409B2280331
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789434818; cv=none; b=HMc3j3aGVSq617auX3LJ0ufb6Z/EOKCikVA+teWNhRnSCRGq1+pLew+gWQL8+DnW1wkUfEqIQbst61KlazRYojl84rxyHIHyAll8gJK2+n+x0T3WxaO5J7MuZTy7+uMoac6Y+jXg/3FtegErKt3J63T5LL9Te4tKaoTsD40P6Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789434818; c=relaxed/simple;
	bh=ArUMxvEg/9Wg+ds61xB4rMefcv6aLplEv1aBo/D5quQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qpu8prIgz1yOWi81kcOhUwzjTWjSOei9gIUsRfbAfsU1cIo9UvuPk5Gp0xwrOdu9FJU+hz+5XKy3ggUnEt2q69Y8vjCB7uDAvIW81VD5jQI8nSgV3ZuuhuS6v85Oas6ecm49nDr+xt4pW2y3XcGuLrrBccBTLaRd7PKKo1wrteQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FnmhLOqr; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FnmhLOqr"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-5311edbc154so818561cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789434815; x=1790039615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AXgWED4DR0uWovVFKapj0G3QwW4Ar6tjesWzskazBmE=;
        b=FnmhLOqrE/AzmawEiKmoUTmXC7lptpm5Dok05KhkdnjSPdfZwCyOvtzkd3z/WC8wuR
         lu84UTHgVSbOZC/A2kw7QM6n3tWynrUz+bcGyq2WI77hce7+VzSnmsT52Qp1k8u6F95c
         DxekIXHqvNzh63kY5lSvPmHfKxKjUoDGjiKyUopXjTrGWDenFoUTM3gBHu9MFdStx/Sf
         hZieqXs0Js19wkKsgE1iRw12TRlQlOLOciLyoyhdUpMPswolMm+dkpUysypn+qdSMsZD
         7BvApNnpvmHWdibqky4DG76eYdEE4Hz5hwgfln0vC3v+EvL+S8RYw2SoRjhSwF93GAf5
         32Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789434815; x=1790039615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AXgWED4DR0uWovVFKapj0G3QwW4Ar6tjesWzskazBmE=;
        b=CIsTQ1UYxQ29Gr67GOmBp0jxZZZ8/Ei19lN4BzYeoz8EY0xOjaYwoIjE5WBtL0hU3Z
         IJLmopTNpa5W1qlBUUZDNR/BhHfhtLdXR9z77RZrHufsgF/nTWWItbDwvUS87WIk3NKn
         LB4eNsyFW8DGqtjztN8QaMl0y/EhHBJ++d/xpAYPLQY9gCBRXmC8vANBirL29m6ksxaF
         zsBkn712l757yibX0ZJFF80iAIkEhn0YeOJw8cNLaBQ2WwkfxnodxkVSJpWpK2JBktzK
         tncugG6fvnhCuftvQq7MGQZKDcTMKpXEWOK+HXjTd6ymXIr3KDB0YHO1V//OhhPvQzmW
         zyQw==
X-Forwarded-Encrypted: i=1; AKwUvByzxDptVbsm4CmeM0A7RuOTtm6tYjEJlgZaZFuLvSWqjMsM/6k9cLw77vq5eYJOnR8YHN3jERxADJy30E0=@vger.kernel.org
X-Gm-Message-State: AFuF++leAzT4SuUi3pi3aZm6iGvImsa1kWx4zRrXhSrd46KJZpjy3pxw
	mbD9F6LmiecYPo9Vdq0yK4uuMCh1IQiz4nFt0xsXNJrMrz/k9Pn4tvE=
X-Gm-Gg: AYBFou2OUZP1+w0wZhCDa6ch4pDkuAVnG46SrrZazUunJTxJztJiRc/fe4TyMIha4jK
	zZ2h82Qvb9Fn9JR/n7g1hz6sdl3Hai8/2SRqO8xb4ciDog2aivHO7Pnb3obCVPjkVrRA/akFn8b
	ytaVG/JaZlis20mPBad6z6H5ZNlbcXXmcYqhbtn+kKDp/NfQddaxqSc9LSiz6OlZHhYH8I0ezJ6
	AHazCKIpCBx+P5uzcCz+cpRgXM7jtmFYWbq8bdBZiF7ECOXJDd4IN/ZgDik4wDKSKjWG38MKimh
	Rc+kmPydIVMHukOd/q40QcPZgv+rxMvUDupq5Bh2T2t8eyCTkDbZ/Z8d9TSuabOOCjTlb0w3TgD
	GPbhEWIU1femtwgkuDX1Fd2En8J1ZCEdLOObclcXMVNHTnUtNWlVH3PiM8u1sIG6b65DJkTFXrq
	gzB5AK9/GTKvJGIEKPbIzJbb/ymevo3zO3ZfaGWWelcl4LRiDY7xfbNr/RXG7M0ON7w10t2Bwr5
	Mw3fFC7czH1gRPviElVfNL7mfw+pLCMDErrgJmisAx8FEyBzKOAZhYgppmPoRU88Hb/ne9gcHHC
	1RvTootNvSssL/ArWanRk0speH2yDDdicSp1pGGX6bB6/ZKOwqWsHJ9qg8N+NmtBF+Ln8SfN/l8
	=
X-Received: by 2002:a05:622a:506:b0:530:5ecf:6e9a with SMTP id d75a77b69052e-5310cf6d5c1mr80899411cf.22.1789434814869;
        Mon, 14 Sep 2026 18:13:34 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4b699bsm109060396d6.37.2026.09.14.18.13.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:13:34 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] media: sti: hva: Drop redundant clock preparation in probe
Date: Mon, 14 Sep 2026 21:13:26 -0400
Message-ID: <20260915011327.57695-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hva_hw_probe() prepares the clock separately from the runtime PM
callbacks. The callbacks balance their own clk_prepare_enable() and
clk_disable_unprepare() calls, leaving the probe's extra prepare
reference behind on removal.

Let runtime PM own clock preparation. Runtime resume already prepares
the clock before the IP version check and encoding operations, so the
extra reference is unnecessary.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 57b2c0628b60 ("[media] st-hva: multi-format video encoder V4L2 driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/st/sti/hva/hva-hw.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/st/sti/hva/hva-hw.c b/drivers/media/platform/st/sti/hva/hva-hw.c
--- a/drivers/media/platform/st/sti/hva/hva-hw.c
+++ b/drivers/media/platform/st/sti/hva/hva-hw.c
@@ -329,17 +329,10 @@ int hva_hw_probe(struct platform_device *pdev, struct hva_dev *hva)
 		return PTR_ERR(hva->clk);
 	}
 
-	ret = clk_prepare(hva->clk);
-	if (ret < 0) {
-		dev_err(dev, "%s     failed to prepare clock\n", HVA_PREFIX);
-		hva->clk = ERR_PTR(-EINVAL);
-		return ret;
-	}
-
 	/* get status interruption resource */
 	ret  = platform_get_irq(pdev, 0);
 	if (ret < 0)
-		goto err_clk;
+		return ret;
 	hva->irq_its = ret;
 
 	ret = devm_request_threaded_irq(dev, hva->irq_its, hva_hw_its_interrupt,
@@ -349,14 +342,14 @@ int hva_hw_probe(struct platform_device *pdev, struct hva_dev *hva)
 	if (ret) {
 		dev_err(dev, "%s     failed to install status IRQ 0x%x\n",
 			HVA_PREFIX, hva->irq_its);
-		goto err_clk;
+		return ret;
 	}
 	disable_irq(hva->irq_its);
 
 	/* get error interruption resource */
 	ret = platform_get_irq(pdev, 1);
 	if (ret < 0)
-		goto err_clk;
+		return ret;
 	hva->irq_err = ret;
 
 	ret = devm_request_threaded_irq(dev, hva->irq_err, hva_hw_err_interrupt,
@@ -366,7 +359,7 @@ int hva_hw_probe(struct platform_device *pdev, struct hva_dev *hva)
 	if (ret) {
 		dev_err(dev, "%s     failed to install error IRQ 0x%x\n",
 			HVA_PREFIX, hva->irq_err);
-		goto err_clk;
+		return ret;
 	}
 	disable_irq(hva->irq_err);
 
@@ -405,8 +398,6 @@ err_pm:
 	pm_runtime_put(dev);
 err_disable:
 	pm_runtime_disable(dev);
-err_clk:
-	clk_unprepare(hva->clk);
 
 	return ret;
 }
-- 
2.51.0
