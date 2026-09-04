Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2203951C342
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788545353; cv=none; b=PZ7eJjN9Sh2jU+XX8inOURnIVWERDtF+UmgcoHtmQ+bdOVXEEYK7mARWQMn+6Cta/1a4R+un1rYYR6yc4zF3jH27je83pDB5v1sO573+AgLlmlyMkasVcc3vmbv57sTGbjavuKufHmBownrqPp8uv7SU6ZI8kUb9IXjwAn5TAXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788545353; c=relaxed/simple;
	bh=cOJ8OxC4C2lMANiPHbYWMMXjIpP6bwsiDFodLkUz53A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oNqbTTvSfFxeDLknaDkv8cw+DfSjCkgGYjnlCoj7JnGfN6n0TsCh5A0GEKgNDaHnZ3+Lsvh0LIsNN7gPqj9gXYKlxq3+a6c3Dm3vNghxzuj0qCZAXMuttsSoR7HrvNq9YzwQcCzarrXnFzYOCdPT0vho3e6R0oCf7/aCB445wiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MeI59mND; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MeI59mND"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-92e55b62640so105438485a.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 11:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788545350; x=1789150150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MhB51A6w/OoQrojpsxyxq7p8lUxX8bUIIqyiGqLRUb0=;
        b=MeI59mND87iOaMNWK84U92bOhkqYgMtsweWAIzOODOFD/e730DJQxx9g960NRdUAPx
         m+dBShC9r0ewvFS+W/7a0H4CRUQNrdJO9PCWVtcx0dA9xGG3nKCbYZJAqxyknnURKOEk
         MzwukEl10NFJr1cr6hlh9NdRFYvsOU21Jacc4gfcNIzQsUK2ofjtj3EU/34EnIIlt7oj
         JO94jLYgmJlrp97ktjlE2TgYlGvdBZ3Op05GOnpoeNGKh+qasqcPKrJ2DvNTe4NDF74P
         9t08BpE1TulxXqgmhzaJ/fVLMTxcgBkLs0KBOk/pbi/5rvaqOzeTGwa7Q6IapZduNuRx
         UfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788545350; x=1789150150;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MhB51A6w/OoQrojpsxyxq7p8lUxX8bUIIqyiGqLRUb0=;
        b=X+zLLBb9ByYtp7LSnX5u7UYzg6dXe59iX4rU+YSwQqyw/4qHP2WEnatzq6jbBbycVr
         6DnyPwY+sgWX2TbN12VglYnByh44Lk0MuuXtHkxY8PJFYwy4g0tRH1/lll6cKsEhPz6l
         Q6psZxhMXV1HxVEPi5zRDqxlr/wyoJePz0Ve4wQXSVSUA31lSBLXNM2YJc/cQcPJjQr/
         w1GWeTucOMvjwMV/OfER/NGZDN7BAoSxy4HvlEKNi/WzhwXi/5ZFo7ZqwP8onR1HHPLV
         6S2pwTaw0IhtLGcuGv0TIRwFgHj+fQnkkz95srdHpfn5pcnaRXLGi6MGzLiUm3PDd7a3
         4GDA==
X-Gm-Message-State: AFuF++lvh9bxZdVlrrF946zNUKOP4aJrzuuMj4blgj75Gmk5F2XAhpPB
	LH46RLUFMo+qfbr1PBMGZVzmlL/Ub8DD8a+co7bE2d63C8sabyG5T9w=
X-Gm-Gg: AYBFou01Nkb/WbDoq21po5nBxEyqsVTilvMG2vECV6NRy5ywyqR9P+x/YyJvIZK2QV+
	63tJ8Tsse2xdK1ZVmpokh9cprwiR7qeK8iLgql6G7Ie8bI//GluowzeSSZL4VR+GPgmfreBks5b
	Xm0lhvde+3ilG3NynguxnOq2teVVAs8jut3lkhcLIpCnbNXy6ZcIwvBn4djVtcbs7Oa2VYnuohI
	2vuJcegH5vC7uCuAbiGCA/362bfMgOIYdEMVQLJj0DyjHquc+NG3bhyCZm1II0SlsSd7r7m6QVK
	rJLiUU/TvdpzIxmeW1u+rWt8VUsvHpz8NY1gTSBEXUwc1T7qjKzO4Nm44l/6WqS8+jhDnq3pHsH
	YbZFgfPrKrcjrWsu2ccRir/nNKokFrt5ilil7dkxJECH7WbDvi8wr/V2LEJktiSCE+Ig0FflE11
	sXUeeyx8oRFrCMrG27o5DEWeRes5LmYhTrLVSQgNu8yLWJx74oGiUhW9LAjI7aKWycyRp4Lf+6b
	Xegprv9m41BAHzPIiQ+fLWtrC+BR/5mm9REql5wxRqdubPIKHwsY81aGuihYtjelJ4k2AUBsDfH
	R97rBHi2TqYUfbo=
X-Received: by 2002:a05:620a:6e1a:b0:92e:d7c7:7de9 with SMTP id af79cd13be357-93980325353mr601007985a.8.1788545349740;
        Fri, 04 Sep 2026 11:09:09 -0700 (PDT)
Received: from nn ([2001:1ab8:1003:0:5454:f357:ba89:4e22])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fba21d6sm260739085a.37.2026.09.04.11.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 11:09:09 -0700 (PDT)
Sender: N B <gen.benner@gmail.com>
From: =?UTF-8?q?Nerijus=20Bend=C5=BEi=C5=ABnas?= <nerijus.bendziunas@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2] wifi: ath9k_htc: fix the byte count of a full RMW buffer flush
Date: Fri,  4 Sep 2026 21:08:49 +0300
Message-ID: <20260904180849.775404-1-nerijus.bendziunas@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ath9k_reg_rmw_buffer() flushes the buffer when it is full, but sizes
the WMI command with sizeof(struct register_write), which is 8 bytes.
The buffer holds struct register_rmw entries, which are 12 bytes. For
the 15 entries of a full buffer the firmware receives 120 bytes instead
of 180 and applies only the first 10 read-modify-writes.

ath9k_reg_rmw_flush() already uses the correct size. Use it in the
full-buffer path as well.

No current caller fills the buffer; ath9k_hw_4k_set_gain() comes
closest with 14 entries. The first caller to queue a 15th entry loses
its last five writes without any error, which is why this is worth
having in stable trees before one appears.

Fixes: 8badb50cfab6 ("ath9k_htc: add new WMI_REG_RMW_CMDID command")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Nerijus Bendžiūnas <nerijus.bendziunas@gmail.com>
---
Changes in v2:
- Add Assisted-by, rewrite the commit message, rebase onto ath-next. No
  code change.

 drivers/net/wireless/ath/ath9k/htc_drv_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_init.c b/drivers/net/wireless/ath/ath9k/htc_drv_init.c
index 6de78ae85726..0b49d2cc99f0 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_init.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_init.c
@@ -405,7 +405,7 @@ static void ath9k_reg_rmw_buffer(void *hw_priv,
 	if (priv->wmi->multi_rmw_idx == MAX_RMW_CMD_NUMBER) {
 		r = ath9k_wmi_cmd(priv->wmi, WMI_REG_RMW_CMDID,
 			  (u8 *) &priv->wmi->multi_rmw,
-			  sizeof(struct register_write) * priv->wmi->multi_rmw_idx,
+			  sizeof(struct register_rmw) * priv->wmi->multi_rmw_idx,
 			  (u8 *) &rsp_status, sizeof(rsp_status),
 			  100);
 		if (unlikely(r)) {

base-commit: 1d8e73163ef933624341075f576e2f36ef9133f7
-- 
2.55.0

