Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794162571;
	b=RtciqEkKGMowMh13jv7AxEtzIeprfASsXCXXB+aorXFVXY8A0PajYgK60OGs+DtbKRjf
	 QbUIdSB3aL1+mAZKInv0hWtFaQWdCJ5uDFnR6uroXTqjfrNO3WtlkCAAj+Wj2A7Nw4gVx
	 ZVMbo98IoMtbjO2CDF6u2E13qeFv4LRRxNxz4oSgzzjeekXGArPvSzKlOuk4KuqOL9YDl
	 kih20btfi380w5LqBd/kAihyQwWTFQkPKWyOGN39AAnybY2K+THtk3N3kwwUoAxWADtzU
	 0XZRt3+FoHXq1bke5xQSXQaDkQrldsfyuUQhyD2g1scufGZWOzBvKBrynP5jkzrVeWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794162571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BzkQiIfcLEfWegWq0FERlNVk/16k6R+noDnnrMFOSWI=;
	b=B5k0IvobgKXn2QrOpCysNuzEFuZJZZ1N08EuR/ELdQ9kPqZUn2xd6Nr9lbV1ufBstS1t
	 Za0pszcDwDmICnBYopSRL/LAhmUEzTXvOQPozqscvJ7KvuBg/TfOsQmbhfeiZW5leK0mc
	 jqUwiFoSOPq57ZOdIOApRh1SZ5L6mIZfCaSesDfNUqoE9oFEwzidzeI6lakHEsHueQBgc
	 vUmu4L3LYPn0cg0+OH1QE3UA9Cw1QRSDLY8UQYfs/1hSRWQJf+Oc6DPuLNmHC3kVdSUuL
	 9nnP21eeVG9katNBh388+kD9Up28e9GuL2gdWwOyUajmxSNr3ldJNigstx7ETUiSuhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q62r1FqQ;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F11D606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 18:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F11D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q62r1FqQ
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b4c8b51b58so124420b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 10:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794162570; x=1794767370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BzkQiIfcLEfWegWq0FERlNVk/16k6R+noDnnrMFOSWI=;
        b=q62r1FqQ0xmPaFcqn17m9G2It44P/MJ72snHBR5g2fTrpEdhfWsCssekVZOodumzYz
         7C5ieA2AXVSh7jnzqZXvOTLCIzrao38dh8EMA66iYPDg/Coi5TX3W3+h97AdP+mW/w7U
         RbS7vfvfZ5wrgSsRXwn7jJDSH/aCurvR7mfnmeh9Vsgxp9xF1TQg5iIn4j5/R2EZGS4g
         h1DGNkA1z8yI3ixswdzf5ILk4YC/c/dWB1I4+Tn0IVRkt8aQMwEZZ5km2q7Mo9fUVGGV
         Xyv9e3dawLhzrWV+6qMacUZf6Gs/c7VqP8kPLQwsATkYOQA7aXdYiddWLhrHKofQTbTv
         gwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794162570; x=1794767370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BzkQiIfcLEfWegWq0FERlNVk/16k6R+noDnnrMFOSWI=;
        b=QYrKrUSEQxl+deiTlTpoovT4eMjuAZ0OajOlLZ3821f7nLYBIeuiaKtwp9c4nY7Cl1
         bej1v50QCMeq5FIJJlUd+VDWg1L1knUNDNUVXViZgfNy5IWW0CVVSzHU0NK+S39lTeoF
         bi+v5D3sTPPT6XGK4JdXIhGQeVhwF6jYZ+Wi4rjvsqRF+EkaJAZfYWt5Zw3rWfzqJ7Gr
         lWg3zBSO4xUKd91vwRfvvVKmeT9ZWt9SAsCSrhcucXk4oTPtZraA1wi387FheMynsY4Z
         CYIs+DhqJFQ5GQWEkbJEGj5hzgXZcS90NkF+EkvqQxVg2DvQ3FDbM+DY2josoWglm8rh
         HOMQ==
X-Gm-Message-State: APuU4Z8h/qa5z8N0oiXh19fMJlzK45c2bnwM5pKTeMJcIlUnmtQo8yNl
	EodncMqawSJSnisxhkDI9aaPkWzXAmPuS6ABRclk87F8TsmiGrAOcYJd
X-Gm-Gg: AYBFou1eE5D6zq8mkzyWjwGf+EoOoAVypQb1ZSUQd1b2Hw5hcvwLVao1JAUD+PxRv2v
	3UA8YlHZYoiv8YByloBrRnmE7yI6E0xivwRL3WN9RT+vhpH1wNlt8AHQD9K12yaR/Na1LlHU3Vn
	qWU5fE0kI3OfvW4jdRTlFGgvUuFpe5LOUaBzqR4ComX3kfi+PSErKTXG3g1p8/69Zb9/lgJHsEG
	mIIEuuz5tBofeGbps4V4oS8BU1weNNOmQUrQDOOgHtAK/oPKxJKqS1GKOYSGVe3o2MdufmhQt0k
	REdUjhrkM/6W0SYGvp68bm9dDYnXyZlzHP9BZwF9v0ubO6+g4hFOwFJ+ZCdmbIt+jKrE0L32i1i
	4SGFpgHxRa4cDl6OaZ6SVvUJyVWaRyCJj9xKTb8QgfKsPxSNkrBn5gD4w+xVXS49FVG7N3ZEYlC
	DT7/7gcTBKUkTz3ojpN33L8lj2Orn8vHWcm+b+08pdz73fa8qlrQFtMJAEBy3zst+OVUuKkNvYQ
	FO5FniRS1e4Ov03m9cC6VlcQYlu5snqX/ffdtUNK4Gm0fMMP1+42zblA7UYMVchfunhpYG7cB4R
	RmpBrkaUtyD4yvgcPjOErdSUEjE9wXI735VQH0lk3n7Qgcg04VQWvSvNu05mtHZYdh9aH8vICJB
	o6rBmZt8WoZmh9sxRm2vzt52DaoAn
X-Received: by 2002:a05:6a00:1c9c:b0:869:84b4:4b36 with SMTP id d2e1a72fcca58-8b66ee0c6d9mr1873502b3a.16.1794162570228;
        Sun, 08 Nov 2026 10:29:30 -0800 (PST)
Received: from localhost.localdomain ([2401:f40:1397:9:5496:ab84:534b:ad67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b6498209a5sm692938b3a.36.2026.11.08.10.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 10:29:29 -0800 (PST)
From: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ping-Ke Shih <pkshih@realtek.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Kalle Valo <kvalo@kernel.org>
Subject: [PATCH RESEND rtw-next v2 1/2] wifi: rtw88: 8822c: fix out-of-bounds access in cck_pd_set
Date: Mon,  9 Nov 2026 00:28:36 +0600
Message-ID: <20261108182837.682661-2-zeshanahmednobin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261108182837.682661-1-zeshanahmednobin@gmail.com>
References: <20261108182837.682661-1-zeshanahmednobin@gmail.com>
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

rtw8822c_phy_cck_pd_set() reads the bandwidth from a 2-bit register
field and uses it as the first index into dm_info->cck_pd_lv[], which
only has entries for 20 and 40 MHz.

When the chip stops responding on the PCIe bus, register reads return
all ones and bw becomes 3. The function then reads cck_pd_lv[3][nrx],
past the end of the array. If that byte differs from new_lvl, it calls
rtw8822c_phy_cck_pd_set_reg(), which rejects bw with WARN_ON(), and
then writes new_lvl to cck_pd_lv[3][nrx] anyway. UBSAN reports the
first of these accesses as:

  UBSAN: array-index-out-of-bounds in .../rtw88/rtw8822c.c:4407:21
  index 3 is out of range for type 'u8 [2][4]'
  Workqueue: phy0 rtw_watch_dog_work [rtw88_core]
  Call Trace:
   <TASK>
   __ubsan_handle_out_of_bounds+0xdd/0x120
   rtw8822c_phy_cck_pd_set+0x33c/0x510 [rtw88_8822c]
   rtw_phy_dynamic_mechanism+0x310/0x330 [rtw88_core]
   rtw_watch_dog_work+0x217/0x330 [rtw88_core]

Return early when bw is out of range. The chip is already unusable at
that point; this only stops the driver from corrupting its own state.

The fix and this message were drafted with an AI coding assistant
(Claude Opus 5.5 by Anthropic), then reviewed and tested by the
submitter.

Fixes: 479c4ee931a6 ("rtw88: add dynamic cck pd mechanism")
Cc: stable@vger.kernel.org
Signed-off-by: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>
---

Notes:
    Testing, on an RTL8822CE in an ASUS TUF Gaming A15 (FA506IU) whose chip
    intermittently drops off the PCIe bus:
    - Without this patch, on Ubuntu's 6.8.0-147 and 7.0.0-42 kernels, 22 of
      the 23 boots with a chip failure logged three UBSAN reports for the
      reads, the WARN_ON() and one report for the write; the other logged
      neither. Boots without a failure logged neither. The trace above is
      from 7.0.0-42, whose line numbers are three lower than mainline here.
    - With v1 applied to 6.8.0-147, 5 boots with chip failures logged no
      UBSAN report and no WARN_ON().
    - v2 on 6.8.0-147, with a debug-only change that forces bw to 3 on a
      working chip: in 12 s the function ran 6 times and returned early each
      time, with no UBSAN report and no WARN_ON(). With the new check also
      skipped, the same input brought back the UBSAN reports for the three
      reads and the write and the WARN_ON(), plus two more for
      pd_lvl[cur_lvl] and cs_lvl[cur_lvl] ("index 36 is out of range for
      type 's8 [5]'").
    - Build-tested on rtw-next (dc16902cad9c) with W=1: no warnings.

 drivers/net/wireless/realtek/rtw88/rtw8822c.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/rtw8822c.c b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
index 09315d23e2c4..6343568285bc 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8822c.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
@@ -4406,6 +4406,13 @@ static void rtw8822c_phy_cck_pd_set(struct rtw_dev *rtwdev, u8 new_lvl)
 	nrx = (u8)rtw_read32_mask(rtwdev, 0x1a2c, 0x60000);
 	bw = (u8)rtw_read32_mask(rtwdev, 0x9b0, 0xc);
 
+	/*
+	 * cck_pd_lv[] only has entries for 20 and 40 MHz. A chip that stops
+	 * responding on the PCIe bus reads back as all ones, giving bw = 3.
+	 */
+	if (bw >= ARRAY_SIZE(dm_info->cck_pd_lv))
+		return;
+
 	rtw_dbg(rtwdev, RTW_DBG_PHY, "lv: (%d) -> (%d) bw=%d nr=%d cck_fa_avg=%d\n",
 		dm_info->cck_pd_lv[bw][nrx], new_lvl, bw, nrx,
 		dm_info->cck_fa_avg);
-- 
2.43.0

