Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935410;
	b=nuI+NCCnC3svxisp80zx5+InRj++7jRdIb1VDG+QKS4Q5oK+383xPT1uIppthQ/Sh9/Z
	 4QCPXjETLdRAy6TP9+M7LCNe4QuOy5oHRfQj028A6Tyx4PR8VoS1enkP/Iuc5w1NEoLLu
	 d71gS+LA6uLnyv6ZuBkYy1w4VqdKMIES6bZWUnfEal8bxuFfJrd0icaxij6rcftl/MccD
	 TP+OL4AeeZxv6wzhgL1u1orqmgDGpzpCUf+VdpKEL3j0cP06pgA5dEvk+8bByyMksKZLg
	 7/tFIA0o2zMcS3MY0bRrpQPL43m/bAAfKXMmu3I8+paZTyV17QruHjREZXjR35SO3NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CoRmN1rx1+FlXyRXu71X9XZHSrkqHgUxmdKVAdzAPz8=;
	b=vAudXhcHC93nZC5ti2BAWKmfr1+b2nY+A4/65v5StTNm3Zn8hSxHE+LZlsrJLo6oIujn
	 YCdfTQm9elGrE/KxOW+pg3nQaH9U9xxu1lsf1+DPPbW4fBM2QF8V3mwNY6iK3CsruKKEL
	 bKRvI6yqS8vJfhHJeWXTLISPpr5tq4jN0rvwwMWVNbT+n1mC22vTHuZdK+XJNXpZmQdLO
	 hUzcNxDi9F3/a8Nt4VdxhobnWoPEEltTKU0mk5ErTmAwPi6NnVWeJys1RN+8288GISG0q
	 TnCyyMxXdXm9C3b2yQMEJcgUjagr7b1d/RhUmwFViydIqfbLLP/h4hJ82nuc13xLJrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TBDEyX1l;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB42F606A8AD
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:10:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB42F606A8AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TBDEyX1l
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-49d64a88222so763855f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794935408; x=1795540208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CoRmN1rx1+FlXyRXu71X9XZHSrkqHgUxmdKVAdzAPz8=;
        b=TBDEyX1lIcLXoGaoP01j646LcuXOvZZ3kW13uJf0qLjMH0tUDrshOcQuzxodhV292q
         +o3SQFy/fTMixvzDb7QduZWPnBil5eyBhANvSF8+r+j9U1ragZnNu9iPb23C9v1/t+Qr
         Ka3I0UrqQcnvtQ+UUZ0F42JuA0LGasmKfh6wMjW33iGDUMmHmOSW0WzRAc6DUizfw0rq
         WN01o7KKLcFtqU7xeaYmIVggsi5bBRyPZ+KgeVP9oU7WACALWplfux97fVgsdmbypReE
         y0ATMn9QqokAs2TH4dh3hWRgEmtCG1PvDzWEZnE2mOH6nDfKQ/bsMoxH2jk4xwgYFq5K
         Aq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935408; x=1795540208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CoRmN1rx1+FlXyRXu71X9XZHSrkqHgUxmdKVAdzAPz8=;
        b=O4wq409smJk+hMgc9M1KFhliNjbKIAyEwJuK0ORZB051OngAfjO0Kr9oyw6pjI6VGi
         r4yGjAWCexhYC2rzMXS20/1vBXwdlSVomhtb0s4EVNZPCYdZ2i62fnz9PemijjhzRXP3
         0ZgSMvCTO2pSiX3Lo4+R5IYd+m7oQBj3BdhJAdHfQ1ntJSgoPOM398EPLJWemaoY6fo0
         wzlRpF2lCrTNo63Y7pXPHZX5NuPsa1isVtppbTT6zKTujw9BSkDXwkoT/a6kRh46+KD5
         unGlM24S1XlarhiU7F4IQTwk11+WMP4kUTfXTs67Y7rJ9mvljGHJbh/bUZwAz06IrPxA
         uAEg==
X-Forwarded-Encrypted: i=1; AL+hErHa5CX4H1dZnQ++clskpmhRbGFVT20lxpoACgCJm87edYvF4mSfAe/8jQNegky81UdZsnM3d1ib6gujzGQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZCPlIcubkGdvmRHmDW917U8QSrHlJFZYm9fU7uxNOa/2i5ORY
	YB/7rOfsnr1XDjCEE6gUzrKAO8utx+fgnwwBppZ3Il+a1DCmzoG52tEMXfeATENu
X-Gm-Gg: AZFdTZdHWrl5P/0QpfahiP5Mu0JW+/XzT41t6PiWZfyemx0H2FnFehb0RkLPrdrKPeM
	CO+9FMiWiTNlD1wQWLaqHPk0V9D0JpcQouRKtvVL9reMNh9rHIZ6aHT1F4e30yAjjQ22jMGyB3C
	ky1Cr1yrhW2YXzqfmBnxi9cR7aTlou55cZtgGAwYnc93CxAGPoXmbUL7Fr1FqQu07DRNwZF9pq/
	gOD2SuVidOYh7JPQHMEUnw5uO18j1g6PRaklha2/Jk5E+X6gKSPnx+6xd21Uy6Or2xUmB3TEAHn
	Rt3ihxYmorvbgcXgOkLts6IOIvbobrn2KULZWK5yEiMZSM5TTUeqhExEdANhx9vTPf7gcQsS9Na
	LLE+NrjDFEEKesaIEwwx1CHZF+VMgjrdnpPUScZVetMqBYIofb25PA8ir2EAhPy+7EPdr5Nf2hW
	uQ5Tsj/1dFamMJuoeDPV2C1O4wOQrDYiJJLsRr0xRtmguodZ7OznyacesCnqv8CDvqa8+7uel0c
	L3XHbgrJds8QeJiyPjxCpZRHdIqIoQl/oCzXWo3wFsxFh+0GgwbqlwQnBRQz0N2eSFtA/B8e1bz
	OYm7h6+I2CgwejcBjBjlneHpsXg8FHRNsNM=
X-Received: by 2002:a05:6000:4213:b0:49a:94e6:378d with SMTP id ffacd0b85a97d-4a377f4f68bmr6704100f8f.30.1794935408012;
        Tue, 17 Nov 2026 09:10:08 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6d079a2asm26828762f8f.16.2026.11.17.09.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:10:07 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Zong-Zhe Yang <kevin_yang@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v3 3/5] wifi: rtw88: do not drop stations when collecting them for an iteration
Date: Tue, 17 Nov 2026 18:10:01 +0100
Message-ID: <20261117171003.1840491-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117171003.1840491-1-mehmet.fide@gmail.com>
References: <20261117171003.1840491-1-mehmet.fide@gmail.com>
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

rtw_iterate_stas() collects the stations with an atomic iterator and
calls the iterator for them afterwards. It allocates an entry for each
station with GFP_ATOMIC and silently skips the station when that fails.

The firmware recovery resets the stations through it with the next
patch. A skipped station keeps its TX queues on rtwdev->txqs, and when
mac80211 adds it again, rtw_txq_init() reinitializes the list node of a
queue that is still linked there.

Link the stations through a list node in struct rtw_sta_info instead,
so the collection cannot fail. All callers hold rtwdev->mutex, which
keeps two collections apart, and no station iterator collects again.

Reported-by: Luka Gejak <luka.gejak@linux.dev>
Closes: https://lore.kernel.org/linux-wireless/4EE3D95E-988D-4514-9849-9546CD49D8E9@linux.dev/
Fixes: 78d5bf925f30 ("wifi: rtw88: iterate over vif/sta list non-atomically")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    v3: new, recovery resets every station through rtw_iterate_stas() with
        the next patch (Luka Gejak)

 drivers/net/wireless/realtek/rtw88/main.h |  1 +
 drivers/net/wireless/realtek/rtw88/util.c | 24 ++++++-----------------
 2 files changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/main.h b/drivers/net/wireless/realtek/rtw88/main.h
index 6ecbeb4ffe4b..6b26c517c738 100644
--- a/drivers/net/wireless/realtek/rtw88/main.h
+++ b/drivers/net/wireless/realtek/rtw88/main.h
@@ -792,6 +792,7 @@ struct rtw_sta_info {
 	struct cfg80211_bitrate_mask *mask;
 
 	struct work_struct rc_work;
+	struct list_head iter_list;
 };
 
 enum rtw_bfee_role {
diff --git a/drivers/net/wireless/realtek/rtw88/util.c b/drivers/net/wireless/realtek/rtw88/util.c
index fcd6eb1ab32a..3e8a520177d1 100644
--- a/drivers/net/wireless/realtek/rtw88/util.c
+++ b/drivers/net/wireless/realtek/rtw88/util.c
@@ -107,11 +107,6 @@ void rtw_desc_to_mcsrate(u16 rate, u8 *mcs, u8 *nss)
 	}
 }
 
-struct rtw_stas_entry {
-	struct list_head list;
-	struct ieee80211_sta *sta;
-};
-
 struct rtw_iter_stas_data {
 	struct rtw_dev *rtwdev;
 	struct list_head list;
@@ -120,14 +115,9 @@ struct rtw_iter_stas_data {
 static void rtw_collect_sta_iter(void *data, struct ieee80211_sta *sta)
 {
 	struct rtw_iter_stas_data *iter_stas = data;
-	struct rtw_stas_entry *stas_entry;
+	struct rtw_sta_info *si = (struct rtw_sta_info *)sta->drv_priv;
 
-	stas_entry = kmalloc_obj(*stas_entry, GFP_ATOMIC);
-	if (!stas_entry)
-		return;
-
-	stas_entry->sta = sta;
-	list_add_tail(&stas_entry->list, &iter_stas->list);
+	list_add_tail(&si->iter_list, &iter_stas->list);
 }
 
 void rtw_iterate_stas(struct rtw_dev *rtwdev,
@@ -136,7 +126,7 @@ void rtw_iterate_stas(struct rtw_dev *rtwdev,
 		      void *data)
 {
 	struct rtw_iter_stas_data iter_data;
-	struct rtw_stas_entry *sta_entry, *tmp;
+	struct rtw_sta_info *si, *tmp;
 
 	/* &rtwdev->mutex makes sure no stations can be removed between
 	 * collecting the stations and iterating over them.
@@ -149,11 +139,9 @@ void rtw_iterate_stas(struct rtw_dev *rtwdev,
 	ieee80211_iterate_stations_atomic(rtwdev->hw, rtw_collect_sta_iter,
 					  &iter_data);
 
-	list_for_each_entry_safe(sta_entry, tmp, &iter_data.list,
-				 list) {
-		list_del_init(&sta_entry->list);
-		iterator(data, sta_entry->sta);
-		kfree(sta_entry);
+	list_for_each_entry_safe(si, tmp, &iter_data.list, iter_list) {
+		list_del_init(&si->iter_list);
+		iterator(data, si->sta);
 	}
 }
 
-- 
2.56.0

