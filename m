Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892C1402429
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792341878; cv=none; b=hawKhIR05gi8udkrcdxLi2D3axWkFHMpxN5o4f1zX7lw03E/+sBF879EZ8RSZ4C5ht1hvFrvEvWSEeWeG9v/umxdt+qEAUr4ByEWiD8Ru1FeU62KMidOxJqwoSZyYgHRdmpDZlscGgW3yGFTpW8DzS/h3BQu0M5t5oFSca+SmbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792341878; c=relaxed/simple;
	bh=LWPTncakzMA1NdKYwWnp03DoB2kYRjGmf51L1bPeqhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mHtMHM1bUwa+SYFblRJM+RDRugsaz9wJL4uG/Nj6s2ezIruZ4SB0rfpAu9beBxKHP9nuJWocjxYuMwJJfe04x8lpS7k2O1ujzw/qVqmwDyEUfKtSu1kqzapOoU9a1T7danZhVCvgj37BUl97/lOXhtmjsM8RibytWG2znjTlcDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fEbeL+XS; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fEbeL+XS"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3282db206d3so1702717eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792341870; x=1792946670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FFVVWVKO3HLX1qQu6kZSSrSNRYdIWUkeFrec4EBCv2E=;
        b=fEbeL+XS2JgIkjigsPlGgoc14VOyxpbD/GCxV2nVBy9Nx/X2BjSB46+r/y1hL3wCKM
         uyCi8vPJwgisOQFhwhM+U9/0NFEwUw2ZDFZThlp1aNzJSYYOExmnpdw6KKQp7TOIUBpt
         SCqq5ezdjWO9b98L6CSzBXExenYbsyBA5KrgctysCufIwXtj3+QfI+XmTcCv1LM8o0z0
         aUlTiMDlnyOeyNziRA6xl3lAXykb0JR1zOM9AVINz0h2wUHFJUpw3e4sixXjgDkS467f
         TFArHMgjlnKpUfFvx6+FTiaD/NIrncjoV33kbkmZ0GrzxWBSpw7CcIugeI7bhN0wMdxY
         1Gzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792341870; x=1792946670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FFVVWVKO3HLX1qQu6kZSSrSNRYdIWUkeFrec4EBCv2E=;
        b=nD2bguuyIVo79yYl7MMJHbGxFBFfsCtkdKjnpECP+8Zug1uxPKcWXTTfA/SuMo60Jk
         GvSRkXlund9LWs97HWPDP+anu7/WSq86dTfZnlttD25/lfOc1bQOqo88foY6XhfJp/nk
         WkyLg47diA4LPaeB07ho+4Nir7hcVyA9ebNMsBEXnIe6BK1z2vZM0EevFOCz+MOdB6eE
         P7641A020rcUqtNf+EAbvtFFtWdDByk/pWcKx22200TEhitLQT45MT/+IXDbNHonW0Hk
         sCuNWpztJrOs9/h/ousRmvL8tNs+PHWgEKrNE8zPAO8dd1pyxkT3KKaNB9XxtY9H8jlO
         WFqw==
X-Forwarded-Encrypted: i=1; AKwUvByVxz7VK63zqurMBUytUMyB6rMsKBSwPbyoVkD9gXZlVdbSBzUHtmtl11/C5X0s34lJ02UnNB2ovvHnaLE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOcw4bQF/WbC/oKCIDc2+9L6/B8PueDVCygnqZLB0dvMwmWAJ4
	MB+q/UfA9InhmvsAJFYPlIaLNbyEXxSmTmw202YfbafLOeedMdcF0PjC
X-Gm-Gg: AYBFou3pA1fQDeGuAnJhMUhK91InjjvIpNu6PtFgjMohX+Hn51nFJW2ci2RyrMy5S96
	sIz04eCaAva+bHLSkzFVueBwfgrGQsz3P+jkC5zGgB15WA3nUXUg+5ESTLq9xhMPO2xaY6XE7MY
	vtAR1WEetyjbSt7nBjRLJAZfNBtf8GXYA8cuctJS1fsge630gD5aand7WjUTj9el8RyUFtugWkZ
	r9pOwbQmsZmau6DdbMMTgZtrqQIjlDHNAA0bhP/Hb0yeRZF9HWLKxYJczpjJaV723Xjd9LNdG2b
	zFDaNNHUd/ZDKVutApmfStyLj7FKhbfaID8DWaDQCJn9QVK3ZwugKJF6ZiLeHSEK0cqE36Uv7Ae
	A7VmT2y8C/dDCC5zKVEIX32ItcdjSkvHI9E6PpmvB5j51m08h/1OCY0uiYDUCLR83kNAFGlX52l
	VmK3tENPM6esImfGoMPB8esZET+ysElWHBmPxcsKTrGJmz2U0vlyO6Sf1TpS+buF6OnLQ7c4fvn
	ymnLzalWvapJ4o/ZA==
X-Received: by 2002:a05:7301:2727:b0:343:fb75:a5f2 with SMTP id 5a478bee46e88-361a1865981mr7975622eec.9.1792341870232;
        Sun, 18 Oct 2026 09:44:30 -0700 (PDT)
Received: from Vicious.localdomain ([117.99.24.166])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm31431363eec.20.2026.10.18.09.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:44:29 -0700 (PDT)
From: Ashmit Kumar <work.ashmitkumar@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ashmit Kumar <work.ashmitkumar@gmail.com>
Subject: [PATCH 2/3] staging: rtl8723bs: remove unnecessary pointer-to-integer casts
Date: Sun, 18 Oct 2026 16:44:01 +0000
Message-ID: <20261018164403.14921-3-work.ashmitkumar@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018164403.14921-1-work.ashmitkumar@gmail.com>
References: <20261018164403.14921-1-work.ashmitkumar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pointer pframe in rtw_mlme_ext.c is cast to (SIZE_PTR) before
being passed as an argument or evaluated in expressions where it is
already a pointer type. In xmit_linux.c, the buffer length was
calculated using unnecessary casts:
(SIZE_PTR)pfile->cur_addr - (SIZE_PTR)pfile->buf_start
where standard pointer subtraction pfile->cur_addr - pfile->buf_start
yields ptrdiff_t directly without any casting.

Remove these redundant casts to simplify the code and use standard C
pointer arithmetic.

Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 8 ++++----
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 511eccf5b5a3..9e89d4a0392d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -707,8 +707,8 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 		offset = 4;
 	}
 
-	algorithm = le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset));
-	seq	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 2));
+	algorithm = le16_to_cpu(*(__le16 *)(pframe + WLAN_HDR_A3_LEN + offset));
+	seq	= le16_to_cpu(*(__le16 *)(pframe + WLAN_HDR_A3_LEN + offset + 2));
 
 	if (auth_mode == 2 &&
 			psecuritypriv->dot11_privacy_algrthm != _WEP40_ &&
@@ -856,8 +856,8 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 
 	offset = (GetPrivacy(pframe)) ? 4 : 0;
 
-	seq	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 2));
-	status	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 4));
+	seq	= le16_to_cpu(*(__le16 *)(pframe + WLAN_HDR_A3_LEN + offset + 2));
+	status	= le16_to_cpu(*(__le16 *)(pframe + WLAN_HDR_A3_LEN + offset + 4));
 
 	if (status != 0) {
 		if (status == 13) { /*  pmlmeinfo->auth_algo == dot11_auth_algrthm_auto) */
diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 6ee2a1f29aa4..91ab0f8bcb69 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -9,7 +9,7 @@
 
 unsigned int rtw_remainder_len(struct pkt_file *pfile)
 {
-	return (pfile->buf_len - ((SIZE_PTR)(pfile->cur_addr) - (SIZE_PTR)(pfile->buf_start)));
+	return pfile->buf_len - (pfile->cur_addr - pfile->buf_start);
 }
 
 void _rtw_open_pktfile(struct sk_buff *pktptr, struct pkt_file *pfile)
-- 
2.43.0

