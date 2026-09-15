Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE42314D18
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789490312; cv=none; b=gksV1AvT1VChOrFsis+5BAjNB3ZBAIQjju4RnwZ0vHfeVKQ9zl8uvMiFx/4aatSGiyxEdEPLWg1XXNS5rudQg10m09VEqT8kI+KSgiBJkeCwDkI3rGe7MhbCmXz+buV0vDRl9Htj+t7CyTZtNfjAP+Tm3Uzmrd0JJMlD5olORn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789490312; c=relaxed/simple;
	bh=6ELEPNAljckPlD6cu3sMDHyfV4ZBlNMANRsZPyU68TU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qtX02dDbN2MI+s2mc1dMV71JFiUcVDZVfQsFbrTvPobyiLkbQe2HIpdffURjoX9S04HNz1+UDpUXRnE15HJqJKjd8bXMPnNIKpAVK6jO68+9dUP9TxGNhbn7Rg1kwqf0OuNXDfTsnuVo1ir+qYHMODbXBThcyhYoSuAdJqy66s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SKg98tnf; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SKg98tnf"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e620fa473so115735e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789490308; x=1790095108; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+bodKOi7EpykbglHFBM7e/cbMPilWZdOwZgiEEbG8xg=;
        b=SKg98tnf8xaqtbLzKSap6dJSsXQuOt5kjJLCtrRjFsAqM5ur8bjQheteyb4jiHYh8i
         fg+5/8C7zHx5ELXBnohA3vJoSYZ0pNKsBmtaQjzFlorUIl5sl9+eciQx3pH9LxR0dfYs
         qTvrgepmQVSNyGOHDaiWLFLhwIjKKBg/9Wd5i8Bu+F4F+/EfEDo5k6Ig/ezNxd8toriU
         D9rsnHZU/l+gsVD2Pw+W0mPShhn1CBnb6Joly6NOqbhOkdi5tzppAgr7wriOp5oPSLoR
         w69RkdRlGUFpT7cspctgicYeKuhcIEsIIwH3nWfR2npjx/7cj3r/am+EGWWsM6PR+GQ4
         eqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789490308; x=1790095108;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+bodKOi7EpykbglHFBM7e/cbMPilWZdOwZgiEEbG8xg=;
        b=jS2aNUrbdEE26Nwzw65Y/W85Sqk6rPuotqlmw39j+zpsaLAmrJWOTxY+1QYDZbJhqj
         bLxLWcKVULE9D1Ua+fRP5ryvqNtyhegxbn8Dz3MEcEPzkKm+8VFkuJoTHDUthi4SbATO
         uFUT+R3JmB34AWfYAB4WvzTRzVm9tixJjB6tuP3rfsDrE1/oHnWuqoQuFpupTEYlkv0s
         eGxehsI8Ouyxw/PaMh3u8jFoO+5oY3A7/0MEV8m26hQE0zcENHCzBbU5n1QIn/QwDJE8
         xsce4HcooNocmtWGRhH7UztZ6X4VQAEJsUi5uVzolDO/UQoM3HnSoe/9sG3nmwVpfqe6
         Gb/g==
X-Forwarded-Encrypted: i=1; AKwUvBxHiSberwWEsF1/8FfscROI0HSWK8T55IylCp5qf0+3of4Kg79/kX4YFzsIyiJ+Qmm0/MVZe6cZY66Pz4Q=@vger.kernel.org
X-Gm-Message-State: AFuF++n64+gEO71zc1NadSj2l5ReDlCvjHOm1RGfS9zDiz5ylkkgl2C+
	cajPTrZZA99SGEuOAa2F0nCMku7zOOF6yJYby5mS1FTszkgPIVyHYcuu
X-Gm-Gg: AYBFou2/i+IGFf6LIh/EOr5g6C/kqWBPCmMa/wa7xgo2O+dGvtqxfdVQYDIo/IKKdez
	rVA1iF7SFLMJr60S2joRfNrtemcsQQbl/AyA5SGpHAHMChjrOHuAafXLkBsac12t7tjNiQFqhFL
	qBt1dJq7d7yPXPasRiC7NvYTBhA44WS2lnNXGAhNdkrX3tzZFZdMOYo2DZ/FOdwEMD2IgLH93pe
	Z3CwW7zFdDmajHuGHib9MYwBdPzowcB5x660ZpIiHOef6GiN4ssV0aG0AEHR27lOGohDdhSq6wZ
	vjvSKfn7PvLj74MOvQN6N4S3hJlubSXp1si8HwhcsUDtCyaNVroPYDwa7FPXWt8q8pILFtaNSys
	62wKuI3gaw9nQwYlV8vyZ4tD6JWaSx312HR75bxVfTE2gz2AkR6yfeXij/y19bxJnHZmP7DZZR+
	LXteKI3C62PJaacEIVkkcmaJB13HAHZRt/Xsg9fMOo7HBQW0YzXFBwLYM8Ur4SlcEkGAk=
X-Received: by 2002:a05:600c:4e54:b0:49c:dada:f581 with SMTP id 5b1f17b1804b1-49e7a5ed78amr115583195e9.0.1789490308303;
        Tue, 15 Sep 2026 09:38:28 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83fb5021sm49735e9.3.2026.09.15.09.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:38:27 -0700 (PDT)
Date: Tue, 15 Sep 2026 19:38:23 +0300
From: Dan Carpenter <error27@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] clk: Document of_clk_get_by_name() return values
Message-ID: <b3de48fdbaaade69cce126b59bd6dfb8f437b495.1789451862.git.error27@gmail.com>
References: <cover.1789451862.git.error27@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1789451862.git.error27@gmail.com>

Callers should test the return from of_clk_get_by_name() with IS_ERR().
The function returns a valid clock on success and an error pointer on
failure; NULL is not a valid return value.

Document this explicitly to prevent callers from treating NULL as a
separate failure case.

Assisted-by: ChatGPT:gpt-5
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
There are a few other functions which look like they return NULL but
never actually do.  This is one which has caused some confusion in
the past.

 drivers/clk/clk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index f1756fe59372..a71bcf780de4 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -5430,6 +5430,9 @@ EXPORT_SYMBOL(of_clk_get);
  * This function parses the clocks and clock-names properties,
  * and uses them to look up the struct clk from the registered list of clock
  * providers.
+ *
+ * Returns: A clock pointer on success or an error pointer on failure.  This
+ * function never returns NULL.
  */
 struct clk *of_clk_get_by_name(struct device_node *np, const char *name)
 {
-- 
2.53.0

