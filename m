Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5474C23645D
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791939361; cv=none; b=BCobLs26pRSlgR9RHHe0vXz2FNFLARm+mMsSE8xXH3ReE3EBsrNAWYoeKU+98130JI+EODQQstP9cprI8QIWYHv7KEjmuAeRK05rY2I8wsvVBgvMLGjGlnHfsMFeeN+Qdljw+HpXrf/Smmp15txGqXrEVzFWzwOmBgySW1uxZoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791939361; c=relaxed/simple;
	bh=0rogUu4QkF17ZLJAaaspEh/DNCFstmo4ri+cWV90+MM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gndxlOJEqRKbZecqv5LCAZ8fMxzOGeebRyxVnnvzy9LGnB3hmxJpl/YJf80M174twgaLogRHV5b9b5+WNpnBOMdB3GH5DWiiNu7wtgMiTugwgi2iAtvOBxWSy4qRO0EihCG1V16fB6cnG53p9j7Rar/DjFE4CvAl4Qa81r4/NzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yg986yzG; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yg986yzG"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1419d3416ceso695179c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791939359; x=1792544159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XxW2/JWpAEpLHapcMk1I83pgwiqBPA5dyGFRHFqowQk=;
        b=Yg986yzGDiDWhD8xTLi8ry/d9oYlDgWx6reUjjx7hpi5kIUhwAt9kafsYWjMGl36sJ
         PsYDLcW7aakggbhEyahvLLcjtgsvdfVm394EsUV2tFnmPyIG0ZB975aN+ucad1WhafhU
         Ydkt+vv6ifYRfcphUIzsyMuQbLEQKyL7TK75ISU/P4DKDPAsc2VSCJOgDwd4GmbFFt0i
         weuU8xg8lBpRTFXcAW1HHJ1N6EiXBQhkZSfF2fhoFJoZCjEkCXAPHqDsitChLV8s8/pL
         q7zX4Bq7ReRD3SleV/+xAE1GNZGEB9Vu8WW1dWZdauDpM+nQFznLAPj8Ka7t4cf3F99b
         MscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791939359; x=1792544159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XxW2/JWpAEpLHapcMk1I83pgwiqBPA5dyGFRHFqowQk=;
        b=AxIXzTesxJr8dUBKkgCa1IGldXvGMIH6UZ3HXf/eQZ6uA3pK1XoPtzajnMLDrlZyNk
         NMsluJBo3h0VeoRqmgswFLA9PvAEGoKDUVjOMcqVASD8Gz3M6RdYij9PJ74qRio2uxiu
         0zrHqgx/1ZFLytI5JINxKGmZ6gbcPji6DaSV/7beSpCLA90ZvvE+n9dexu9SP4fz1g/1
         Tf5DsePjo2J76aEuS8p4tyDE9vRh9X7M0unl8PZ+0p/X7S6EODccxOZKXn+XuwBpUaH3
         vRxkAftGMNNmqJJi4+SjgRfCyxUhfickZvF2JEkJiLcCVxnWE4aJ1bulF+R6OywCtmbr
         6+3g==
X-Forwarded-Encrypted: i=1; AKwUvBwmBkdi03LMKpiFxu0IlJ5BjyCcmOPArQMQSH5SoRByVb4f36W1+I9f0nCI7GGtnCBmQoSqNkyn7+t2rGM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgmuLoznC2tSCW/3SyNIRT2gPVdZYKr/NZDQw65eC6PdoLqfRA
	sFoHqQttcznro9sTLiYSx+Gph8HVBOXgGUYO1xXkEpv3e5f8tHckeNIl
X-Gm-Gg: AYBFou1CpM4ANNr4SRBV3/+5/OGGzzJS+TFw8X+LbwTOjsmUnr/GZpWYG5mOXSuDgfz
	B8O64ogOGe4QKmpTm05iVy+b5T/jIQRV+Y0Hj33yTdjcEB/RxP4G+PQIEHOyH2t+Ai2kMjP/OKF
	Kcjb7UuMPSjcvQlXnBDSpgxb4GnbGC8f66RGfME/7ikUBtZfXeWUcxcgijWVv0+e6JpHYytNtOF
	192NQZSMUqjkgT71NtHqjYUhyOhXFgm0zaPZNoPl4rFMrEQdQrRrwYL05vbH7Tm1xSBZ/VvK6t4
	a2T4r3w/SBkryRiS0MZMjPUVCi7FdtUFnEMvPJzzBdnEwLTf1dSxc5ZY2eRBodNJ5ibmvZU/wIZ
	DmX7J9kc28pJFG7H/Pjd87Y/Kz/sWZwpxo7Q7ivVUc2kz5HCAR1UXumsw6R3sn+39Y+JYLITMkZ
	CCr3QQOE7ubS17PVGH1+Lcp73xrT94CiXKPAlo/c03Z5tgYmiFZz7ISAgatJuzO6N60hiMd8hAy
	AJA7u49qF+cWWjSNVhbwNqMoX5mWx67kiZRrm4KFuM=
X-Received: by 2002:a05:7022:1608:b0:150:1cea:31a8 with SMTP id a92af1059eb24-16a60bf2778mr16551597c88.19.1791939359163;
        Tue, 13 Oct 2026 17:55:59 -0700 (PDT)
Received: from homik.fullerton.edu ([137.151.175.208])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a4429603sm39561692c88.17.2026.10.13.17.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 17:55:58 -0700 (PDT)
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	morbo@google.com,
	kees@kernel.org,
	justinstitt@google.com,
	codemender-patching+linux@google.com,
	Mariia Nikitash <nikitash.mariiaw@gmail.com>
Subject: [PATCH] wifi: brcmfmac: Replace strlcat() with snprintf() in brcmf_fw_alloc_request()
Date: Tue, 13 Oct 2026 17:55:52 -0700
Message-ID: <20261014005553.71803-1-nikitash.mariiaw@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bill Wendling <morbo@google.com>

brcmf_fw_alloc_request() constructs firmware file paths by chaining
strscpy() and multiple strlcat() calls for the module parameter path,
separator, base name, and extension.

In preparation for removing the deprecated strlcat() API[1], format the
complete firmware path in a single snprintf() call.

Link: https://github.com/KSPP/linux/issues/370 [1]
Cc: codemender-patching+linux@google.com
Assisted-by: LLM
Signed-off-by: Bill Wendling <morbo@google.com>
Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
---

This patch was originally part of Bill Wendling's strlcat() removal
series [2], and I am shepherding it individually to the subsystem
maintainers.

No code changes from the original posting [3].

[2] https://lore.kernel.org/all/20260915081910.4142719-1-morbo@google.com/
[3] https://lore.kernel.org/all/20260915081910.4142719-12-morbo@google.com/

 .../broadcom/brcm80211/brcmfmac/firmware.c    | 21 +++++++------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c
index 22ff326f1924..2f74a952599e 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c
@@ -845,22 +845,17 @@ brcmf_fw_alloc_request(u32 chip, u32 chiprev,
 	fwreq->n_items = n_fwnames;
 
 	for (j = 0; j < n_fwnames; j++) {
-		fwreq->items[j].path = fwnames[j].path;
-		fwnames[j].path[0] = '\0';
 		/* check if firmware path is provided by module parameter */
 		if (brcmf_mp_global.firmware_path[0] != '\0') {
-			strscpy(fwnames[j].path, mp_path,
-				BRCMF_FW_NAME_LEN);
-
-			if (end != '/') {
-				strlcat(fwnames[j].path, "/",
-					BRCMF_FW_NAME_LEN);
-			}
+			snprintf(fwnames[j].path, BRCMF_FW_NAME_LEN, "%s%s%s%s",
+				 mp_path, (end == '/') ? "" : "/",
+				 mapping_table[i].fw_base,
+				 fwnames[j].extension);
+		} else {
+			snprintf(fwnames[j].path, BRCMF_FW_NAME_LEN, "%s%s",
+				 mapping_table[i].fw_base,
+				 fwnames[j].extension);
 		}
-		strlcat(fwnames[j].path, mapping_table[i].fw_base,
-			BRCMF_FW_NAME_LEN);
-		strlcat(fwnames[j].path, fwnames[j].extension,
-			BRCMF_FW_NAME_LEN);
 		fwreq->items[j].path = fwnames[j].path;
 	}
 
-- 
2.43.0

