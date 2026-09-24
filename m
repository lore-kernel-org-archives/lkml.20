Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F84419303
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790271661; cv=none; b=rPt8+HiVEqqeTD2sqyLY076A7+D2bbrBqqIJROsbPzbv4JVnhJ8SQT0pp4ovFyAdbgtlz1voXs/OqIZr9ZYo3ZpqoxG4it6nwiE13Hm1lCd5YzoigQAdNOP88iGEHYeqqLJxdZEyn+r+N5AVrjjqPPXDtFx28O2yKF9rtQvsy7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790271661; c=relaxed/simple;
	bh=yemf7qBVHtplzwIJK6k/1ljMzfRpZRUYczEE/HsMmmo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Eg0ZlxBD3E/yMTfp+vdhwQlhOXOMMNVDYiczX/Jp+IfkgpzrhrEDSq0eOP6C6pZ1AXD2cUd5qxh8iV5KXXx6SLXB+DhR7nuf7JTxYTi2pmnisiHvAnGBEycImso6ton9x7CbunKXzjR4ECekrcFiXVbvgPJbzYee53kDOQGeoKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=GAT2GxIn; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="GAT2GxIn"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so97269a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790271659; x=1790876459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jcavR+kumVH2a25pyfmlJjp3ykD/tBOqZkHbAf7QxFs=;
        b=GAT2GxInqTQb4g1bJ+aVebjC/sgr/c6K3+LbPitNSpV8LZI/883vbFNLwdFRxu+ZBj
         nMcC/8XR3BtP6Q10JSAdyCSC6KfV/y4H+5bCiB1R0LwTY8tfEAvqadWhOmqzZUmmDI07
         pZfBa1XJJ2Pj1f7OxSFIjGaCsrVFGiSrXcw++1TFvQxy1f2bG7oHDJrWqaNZYHM22J/d
         KzLZO6U64JJPaZaB/sncvJQ8ltSeuzl6BhkBwB7QyZuEvI4XFTDClrpYCVuSj0YOvM3U
         FyZKYng7Vko1eTP3Ho70sGLxM1Vu074dJ57bQzWhOMp/q8RQSu2C/f7XgTEiuFpjdVWg
         QRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790271659; x=1790876459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jcavR+kumVH2a25pyfmlJjp3ykD/tBOqZkHbAf7QxFs=;
        b=KxR2ioH8fgYi6okySRoY4o9TbSV6urpAgAES0PM9ZCbnf+96R8RyhAKFQ4XnKb+qTw
         dw6D6pxRdVS8yIpAG1RYvqXF+sTHqcB7Ol7zQBdUqhsZiolYURXv7evImjVNZiuR5vCu
         RhSGb1eU/Aryzrh6hB3Iy0wl4dnp8R4NyUcWP2QdoyD4Y2O56tAc0sIcXCB69KtdCztQ
         x/Cvp1WP7A+M6ixbgIPgfMzI52mwkNgFEA31CT1G6xTk0gsBVi92wPHJugOakSY+eEe9
         swLUCq0xn3KslzjCgTK+kHvhyM1MToDfBYOyvKO1m5VSqBvp6L7aPcsd/dZ/qUJZoAMv
         J2JA==
X-Forwarded-Encrypted: i=1; AKwUvByUi0DKmqckswMwdLyZY+D/r3gM4l8ZwpvzBPWErr9g4MowPBneOuVuQ7jBRK1iNMp73NP7OJXbHe+IWUk=@vger.kernel.org
X-Gm-Message-State: AFuF++mpMg9X9oRYNF2/DyETrrc6uYjUXv5JaFd/lxp5qonoFaUcY2Ir
	4ocKSZK/iWMccfyUIc9H2WmWaYAHUJ/dGmG8DT+KNnNsCmiQpuGt1hi5LDAFNsvWfgg=
X-Gm-Gg: AYBFou3H2XUJom9a6QombysCODBHOwaJG7mz/JcJKXi6N7/5AoFa5LeS/2QuhD6YtD5
	oKE564QUFVtwAo80OVU9QhTwDg9StLGNFWjFntNRePNLeq700SP2nM9IdTFKPU/GXk805PDFgI/
	UJoYnD2Qt04F7qG4kFnebAEWtZMZb1xgBD5uJ+IHD14yLODc+24VF4hLfF0GqXi8QtMFIzkT2aG
	3zfS7KARH33MVc5jhzxA+Ep0+FADcZyv1oc6clk0Jl/2cfv3IuRdPFXNon8Lg1X0zs5M0aJggA6
	uwttZrRS702XOfxBfgXeS/e39qZIpAXfjwVh5LppH2ojxKZevqVGV/0dvvoWWcXcYkTJoaPBmvW
	dZaBDnn6R3198Jg6rFNNVV1ehxFmUMqrhYT0xNbALj03F+F7SCNJWFRqe91wnCToDE6jiXBENX8
	B7pt3nPjiH9DrgqqckOnqxPaeqE7I/xHRgV1z5XNCrhltnCViuOcC8AHRaG5hgFXOdqdrdHOxlC
	awu2w+ioAZlYYfvXXtMI/GC0UyfazHAOSPTWEijW7L8GgILovkgl/PTf80boulE1yvBZss=
X-Received: by 2002:a17:90b:3c0e:b0:39b:92bb:9eef with SMTP id 98e67ed59e1d1-3a098ce1c3emr3210269a91.22.1790271658828;
        Thu, 24 Sep 2026 10:40:58 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:f875:3165:4649:e818])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9144e6e4sm120375ad.64.2026.09.24.10.40.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 24 Sep 2026 10:40:58 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Yan-Hsuan Chuang <tony0620emma@gmail.com>,
	Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>,
	Ping-Ke Shih <pkshih@realtek.com>
Subject: [PATCH 6.1.y] wifi: rtw88: delete timer and free skb queue when unloading
Date: Thu, 24 Sep 2026 13:40:53 -0400
Message-ID: <20260924174054.88252-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmitry Antipov <dmantipov@yandex.ru>

[ Upstream commit 634fcbcaa4062db39aeb5ac6ed1bc1feb8dd5216 ]

Fix possible crash and memory leak on driver unload by deleting
TX purge timer and freeing C2H queue in 'rtw_core_deinit()',
shrink critical section in the latter by freeing COEX queue
out of TX report lock scope.

Reviewed-by: Ping-Ke Shih <pkshih@realtek.com>
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
Signed-off-by: Kalle Valo <kvalo@kernel.org>
Link: https://lore.kernel.org/r/20230628072327.167196-1-dmantipov@yandex.ru

[ Backport to 6.1.y: the source change is unchanged; only hunk locations
  in rtw_core_deinit() differ. The target-only Fixes trailer names the
  initial rtw88 driver commit, which introduced this lifetime. ]
Fixes: e3037485c68e ("rtw88: new Realtek 802.11ac driver")
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi Greg, Sasha, and rtw88 maintainers,

I am continuing with CVE backports still missing from 6.1.y.
This fix is inherited by v6.6 and every later mainline release, but 6.1.y
still has the affected code. The target-specific adjustment is described
in the bracketed note above.

Could you please queue it for 6.1.y?

Thanks,
Artem Dinaburg

CVE: CVE-2023-53574

Build: This patch was included in the x86_64 allmodconfig and
CONFIG_WERROR=y build.
It produced vmlinux and modules with no new warnings or errors.

AI assistance: An LLM helped find, adapt, and validate this
backport; I reviewed the patch and test output.

 drivers/net/wireless/realtek/rtw88/main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index 8f486152fbd9fe..53c61758d57a0e 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -2135,10 +2135,12 @@ void rtw_core_deinit(struct rtw_dev *rtwdev)
 		release_firmware(wow_fw->firmware);
 
 	destroy_workqueue(rtwdev->tx_wq);
+	timer_delete_sync(&rtwdev->tx_report.purge_timer);
 	spin_lock_irqsave(&rtwdev->tx_report.q_lock, flags);
 	ieee80211_purge_tx_queue(rtwdev->hw, &rtwdev->tx_report.queue);
-	skb_queue_purge(&rtwdev->coex.queue);
 	spin_unlock_irqrestore(&rtwdev->tx_report.q_lock, flags);
+	skb_queue_purge(&rtwdev->coex.queue);
+	skb_queue_purge(&rtwdev->c2h_queue);
 
 	list_for_each_entry_safe(rsvd_pkt, tmp, &rtwdev->rsvd_page_list,
 				 build_list) {
-- 
2.39.5
