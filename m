Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFC3490BFE
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525956; cv=none; b=EHOHEndpCcaU8S+LUUO4XOgFwGuw8jZJhKuSugdQphbMoZDdcctKXXeyx/mcZVtezou5tGsEEh2igV5djgoZqMtpPiBsbGYXofR/zjD6XX3Yo50zAtsnhE9xh3j0x7FGzvJE4JU1+jMz8MMjKBDuM8T9sc3MNVAlT+L4K23cN+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525956; c=relaxed/simple;
	bh=fOloAHRgdeLksJbr9YCfXbNpB+ehC4R05ST1dX0wcoM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K9qVAfJe8SnwyH6NDyg6R87ROY8mYuLlcGg8DtAkNWH+blODWq/Niw2H1Q2rZn6hFYZP+sn7uDU6lHH2ykq1q9dRKAlXr32qYWN5jOWO05sJ8d4PIfGf0PVFvvRwbiAYM4v4bh728rlJxzXiv4vhZBnGU6RkVyeENrxcGzyzxCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eBLoOohv; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBLoOohv"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-467f09c00c2so288420fac.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525954; x=1789130754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5CKWYHFFj2+Ay68a1spLAYVC7QQVQgeLpgvyjnrg6qw=;
        b=eBLoOohvbOhrzDwpo1zpKjbFRCnKTcVbWqm5fZ0KxbGjlpqd+UU2OjAfBGuQYZn9SG
         +x9P8YdrImMrBz3B1d+l4aKSHhqx5n29AgBr5hKvLnQIyxc+BJTrhCsCfKMcFbCSY5S3
         QZ3nTD+qulKMzPlud1fV+cq4a03DSCEX56+NCOx6ZXjkuVAp7kBNIA/FLjdaJrP83jO3
         9mfpXfUNxAiGs0ok9k3JesfuFMceAs8ers2+L6HXF4lW4S80a5eRlIwHF1McMJZS5GQk
         FTqLi6bL+6hH0S8j6YUAHhvywopmPYy0/tQdVurPrdkWxHjcAncY1YVheAhRJgeAy2EE
         BMaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525954; x=1789130754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5CKWYHFFj2+Ay68a1spLAYVC7QQVQgeLpgvyjnrg6qw=;
        b=Ycm6S+yRoOS0DwwjWXKfNeJIX3m64sTAaE0tUpeGfYoWFJNDXJUMaiOly0S/Z28MuH
         99MzqqygNmL2RbBjVo5WFUlQBvR+a3rcPc8FKUo7sMPoZj1H0DDcRq1xNFcOox0PuJqc
         mA1hbT6Tmu2tAJ4TgZdw9dCAPwDOe6drr4GSkOHHtr+bS2g6pLVGQbvhmMTEV5ojHleE
         /Gqox1w5aiYYzEAMrj6FjIv7FqmHQJsMd4YRAOwgNnKBivrFo6ET48NhXdcOoEy2b405
         aJo7kK+2K04E9p/YJKUPbkI2yt6GYlbqxzfVFxboIxmRrMcpAVNPZSBBinogVgFJVv65
         JKFg==
X-Gm-Message-State: AFuF++mH/J66G+CFfBUrZChEJ4vjs8kZTXZKbz+Q3aAZYPL4PcBLVQdQ
	YE83tjqAw6YHfGuT1goaSePhsGD5sa/1RgFZoa75EOOuYQdpNM31YV73PucWS7fLeE0=
X-Gm-Gg: AYBFou36ZFY2YrSUouiI7Y78uh4s0Eeu8DaMJ4XHrWfnfXZ+OrCkN+XlFneAal9YC4q
	RwgRKn4IrBCo0iRCDOUrnrk3gvTubwb1KY/53CZsWnbeIxbjSzPlrYVA2o6qfXty2bKnG748m5i
	LPCAQc8Se5MFPeW9DeGdjMiu6Sq53TMJybjpj1NglSpVGIoyxK44r1fOFZ4TyVIDTuMWymEnyku
	cpEex0xvjqbmT6QTF+eWrr+e3SBY7vH5AGXoPJ5iOCY2Js5l8eEcmzPYRmd8I4OW/Nz+grFcQ5z
	C/Ynyf3rsJZSpw8MGntm19y8Z8iWdUbwCvxWtWfYO6hbdF0Cq+B9zNY/6LUapXyVetCXJhl5/n8
	W+jUNZAMUhL+5sRw1fg94kBR9jD9HSEmkb3pD0tk8mb8EscxHOvv9YnQ/Q6pxhYOw9X02s3PjZX
	CHTz1YS8RCDh4fPACReCzyhCzpQ4sy9KS7Wc3g2xAs4HwNuZMSLXKcbYaP4lGYZknbJRcLVKRwG
	knLbInw8rCFjBA=
X-Received: by 2002:a05:6820:858e:20b0:6b7:e065:c4f9 with SMTP id 006d021491bc7-6b7e065c573mr613694eaf.57.1788525954014;
        Fri, 04 Sep 2026 05:45:54 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243f780csm6477419c88.13.2026.09.04.05.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:45:53 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] macintosh: fix repeated word 'up' in comment
Date: Fri,  4 Sep 2026 18:15:37 +0530
Message-ID: <20260904124540.7652-4-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904124540.7652-1-hemanth.selam@gmail.com>
References: <20260904124540.7652-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the second 'up', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/macintosh/mediabay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/macintosh/mediabay.c b/drivers/macintosh/mediabay.c
index 36070c6586d1..c5115b88beb6 100644
--- a/drivers/macintosh/mediabay.c
+++ b/drivers/macintosh/mediabay.c
@@ -331,7 +331,7 @@ static void keylargo_mb_un_reset_ide(struct media_bay_info* bay)
 
 static inline void set_mb_power(struct media_bay_info* bay, int onoff)
 {
-	/* Power up up and assert the bay reset line */
+	/* Power up and assert the bay reset line */
 	if (onoff) {
 		bay->ops->power(bay, 1);
 		bay->state = mb_powering_up;
-- 
2.48.1

