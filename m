Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A244BEE5E
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789171532; cv=none; b=ZdWUWAe0CpfGX+/V2IUB/ktzLG23J8TmU8oym1vmFDrx3DvBE5RmrQBwKr2luuapyIXfEqwE0tHEyCNZkJfIZ5kc/nwY+GScjECSVGSd5pk/04iPYlhQa5VOY7KzEiHJar9cz75XO6RHRk8qer7kORkzC4ydROb/Z8F++sO4N0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789171532; c=relaxed/simple;
	bh=/rAmJh/EIGGw58+WmpOp3WZLjb4iciRyMYt4abh+ONQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lmGzZSiO3ZfM6265iOEBQDgbHgqzouhZZqjn4haXHENZigos4p6w8vrnVr+FbjCisfKG/sjNllaD55S4T8RQV9jSSJ3Q6fmujN1qvNyWYabonYfzVf3eSCPN0Y/7/Lz+DrY4nl7D+tIVc3lxqC5djH4ivf8JCtOV4dFwXjmtLnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K4xlz+km; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K4xlz+km"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5309d6188e1so5462801cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789171530; x=1789776330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kXFkUUSERusmiOZxFKcpCM04OYHSm47q3Lv6FIZm0GU=;
        b=K4xlz+km1Skegega25yy4h9wPGY94a7XNqS2RjAiO3K3R/032e5s6m9lqJ2ERRx2HI
         Vhn3+XpFZUdjy0IrYJWD8otSathNu4U5tRCkhU/pnEZyp8BbvOMTHfSkyxOEq2RdvmDj
         s8krs5pOOev7d6VDfPaUNFFoLGKw1FDaMFXdhauRh9nltkOE/rW/1ObS93SVODuQI1lU
         27monnh5Rwom6B039liTE8CKz+yVow8Tfq7iNg4h462JMkRUzbDnnIo7fNEvR4uIqikW
         UQXyP3u/cdgGvsZfeM2NVjmnDq7XATuxXxJIh0Dp30t+xKfDHgy+D9QyJqLM2AP1xXbw
         vgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789171530; x=1789776330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kXFkUUSERusmiOZxFKcpCM04OYHSm47q3Lv6FIZm0GU=;
        b=WrOa64EdXTS+nRSA2YxZAopqszoAVnruAVOiSxzI9Jwyb5JUi79GD64dOJPQPG8NNg
         I/yzX6KkjgxOv69i031EWNFHbO5t9tfzuAHUhXH4q9MBNMo308TxOAPevEVHdjAOfiTf
         EUoBbfr+DXImm8NfAtJrAqfWSzaW4JqRfSgsuGhrgLQanlFY6VujKQDcbgHAq/lsRGoG
         fOs/oTs8uJJpaqeC+GyzS/SwDi2yjfTDHFpsvzTIUW91mGmzStNMjN/dv/AOloJ4nZMa
         Yzzrb+b+hvB4RoU2Kx2KnfPsMqOKBAcp513SezBth/YqzcJd7Zsw7siYEAa2hbLaYkAr
         UM3g==
X-Forwarded-Encrypted: i=1; AKwUvBxMQgX0yOlYMcGlqprOuoIvZwSp9D1QNBRW54pOnqCidec/Kkmmz4KL16BcWFMUknDMbHqvZoMS1LooSuA=@vger.kernel.org
X-Gm-Message-State: AFuF++khaWaInG6P5e/Kbe9wkisvuueD5y4jDOKfTnidfYxmQz9nJ3Rs
	E3p5uRh74Aj97ybHgpzYRGhmbrJ+h7IjTLW4TLJfwoQ1pWcuIker46Rr
X-Gm-Gg: AYBFou17WOz047h2Nik011DU42MI8SlVpLMKpwtCJBdC/AN/U4dgJUCASX8U+TJRP7l
	wcug8odNStldUU6WYawWLStfqnNTcW2I3LGT3BiaFQgW/smruSp4CmG3evb1zC38mnvCPStG/rD
	sVi/U6muVbC/g7MObeiUcM9xbUTbBdL57Z38TxO/5p3pjFVX1zclDqoxSOO4vGOHBoZqCL2DwV+
	MXP8iUeCRpewRleyW3Vmxg3z+WQsVZNq6PoedntNYA5dHbvekIcOwQDi7e2zU+FzuPu+MKweKkq
	MQeibdmc5PYCW+54il24SBbOarLwg2hE1juaXKKEfBPs1S/r0rID2lgbHasbenWA/JLabWU/J5Z
	04zxOorDvAegWNAr+L31UQg5Z9FueeNx7xNTkYqgkzp/Cjwb1gvjbBXgsDOMNp4pkX3mj6H9OBP
	uAc3icJWJfi6ul1HVF38mdV0W3XTp9xCk3TgheEOrFUJLNpXUY4qJuDFjX8d7y8vM2eUb8rBbeH
	M68UoqfGbPShHptmPCPaOmd/h+aOrD8nfLGcGhj5nZw/4np9qQ3Mm6kjN5nXv8r6U0NlThJu6bW
	9KCeQkZJxYKFCy+8Hszjae2XBoPSspH2PwPIsCStrnFk7HE0
X-Received: by 2002:a05:622a:4d8d:b0:530:430e:8126 with SMTP id d75a77b69052e-530c876fcfemr131514161cf.47.1789171530137;
        Fri, 11 Sep 2026 17:05:30 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f47a239sm32910836d6.26.2026.09.11.17.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 17:05:29 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ACTIONS SEMI ARCHITECTURE),
	linux-actions@lists.infradead.org (moderated list:ARM/ACTIONS SEMI ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] clk: actions: owl-pll: cast delay to unsigned long for udelay()
Date: Fri, 11 Sep 2026 17:05:27 -0700
Message-ID: <20260912000527.231245-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'delay' field in struct owl_pll_hw is u8, but udelay() internally
compares its argument against MAX_UDELAY_MS * 1000 (2000). Since a u8
can never exceed 255, the compiler warns of a tautological comparison
that is always false:

  drivers/clk/actions/owl-pll.c:189:2: error: result of comparison of
  constant 2000 with expression of type 'u8' is always false

Cast the delay value to unsigned long to widen the type and silence the
W=1 warning without changing behavior.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: fix uelay typo. mention W=1.
 drivers/clk/actions/owl-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/actions/owl-pll.c b/drivers/clk/actions/owl-pll.c
index 869690b79cc1..5e30ce35f2f5 100644
--- a/drivers/clk/actions/owl-pll.c
+++ b/drivers/clk/actions/owl-pll.c
@@ -186,7 +186,7 @@ static int owl_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	regmap_write(common->regmap, pll_hw->reg, reg);
 
-	udelay(pll_hw->delay);
+	udelay((unsigned long)pll_hw->delay);
 
 	return 0;
 }
-- 
2.55.0

