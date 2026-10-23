Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792799681;
	b=vWYqgECfQngd62c7esbcWqBvcBryYoA+g+/a0NlKA/im86eSeGGrFdA2cWJUO9mYa5y5
	 /6RX2VGHsxp5o29HhsVTWpD4uHZuRSVnzq9kWfYQEY0DuZQnmp6G+dMePCWl/2yzFsPCU
	 f3x074Jl/u9GHGzs4AgCBBPKtfPId7UcrxYi+H6s22cItMxwanGJgOrW07WqCjhhIyxc8
	 z5nUiGrD3qpy2vlQZSVZkGImzU9ntwRSCTWuyzEzrYomDp6s76pY60L8jQJta2Vu/4Zc5
	 xjeKg1Z3k+JzO9BEYIirIqos+Rvcx+KVmdWWTjXy/mriPhI9oTKIF892srIf03yd2Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792799681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wm65TwXZAYqKujveOXDNg5Hy172URoyh3/UCOTTQUrE=;
	b=uaIUhW6vm6zmRQexLco2XT2Gj/5Z3Ts02M3YrSOkepJtlXU4C7q2zoVrK5UhpcgbH/0S
	 Gq+k9RM+754qO5ZZmDZTj/QujxL8+bsx7dgv1mf9P1FT2jTrYLNazmKOj7chAGC165D2E
	 fhNmYI3HNCBP6JJ0Su6wi7/4aYVjxS1VWHybFUJK66FeG3EuK1kmXvaijCS7g49SDFHcY
	 CQDqXnjazspADP44J+9Ytl5gVUk90I2xPnbVPKmtmobccQaGFgCugpOoN3s4rEkQRlXKW
	 wRplrlOot2py/sDuUCU38JD0QEu0YWK6FyDan/Ys1oIb1itZXbClJTOvW0t2EXes0vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HZmFn4hL;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862C5606A323
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 862C5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HZmFn4hL
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35f1f76ea84so2285612eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792799680; x=1793404480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wm65TwXZAYqKujveOXDNg5Hy172URoyh3/UCOTTQUrE=;
        b=HZmFn4hLsLbDWu6CaB/S7kWx92I9Tw60waCUz1pO1X9fmewKmxSd1lrw1oQx5vMZwB
         iNuUIFMpel+IRBJCxhL+Sj4W6uUXOfNqbDr3IGHMkx1Q0ka8/Js1dImMz7ivZ+AmIrlk
         wcqGmYfqK2c+21q1B1cGfepFK9w6zV9IFd3Jk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792799680; x=1793404480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wm65TwXZAYqKujveOXDNg5Hy172URoyh3/UCOTTQUrE=;
        b=g6PmtZd6E6MyQuZ06PQZNeRxhTnamMV4Tj/KyCdYPEYZwKw4GGN3eXbNwYgBV05mM3
         k5hfLjO9Hv9EE2/6l0jcHwIAgYA/uo1Kx4FR2ZUU4yt+4vGbidfmZsfuv/huXpAE1ANx
         qDWXorzCH3hsfte4UmbWDI6LAtb6qd2h8suRvLq4p5uj5x8BWpxm6fJ+xMkLS4KVeht+
         8SYdb+lx4jKx0IwIki4ZwddFduTITlrEkF/PFYyCKn8TNwjHv+gjaTX1B8Ha8Okbg3jl
         SjlvcCqN/tYg39hga0lmFws7Hhk7sCyBSEM3wLasu/1g7uVXAIKkahbfcKgJ+Uy1QSDj
         0cMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBQKHJZUQqeHSROWhIsz0OfpCB1qlM+eSDNJPYv5Yhl781Q/OObxkrcS58fX80a0VLRsWKYI9rLfoggPI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSy2K4yMfdR1vy92biDhq4oNwpJdIBkoMMfLh/9IKHKCaO1SfE
	7fkl8df2k3ZuwXge937VsQJofPH2bDXMUHz12X2BzoUzII52GkJAB0yVgbYyseLC/w==
X-Gm-Gg: AYBFou3HEbhn0g1FnqagD39Q5y3y5L9gVP4ppj9/+kV6Cuwzm1yINxE12Mh5MPjIlHe
	SiQCYAESAs8PsfHUjOKdmksvzJlC3Qqx90MLezmLeDaJNK5hQwSNrPIQUWf9Til09+0RsY8n/Bn
	sCCWKP50DJ9L36hW6i9zrYC0t5Y6Pu1i8MMO6cOGXXVVXJUmODP6cs7FGHAxFzxuBuK4zUT5J5d
	DyfBSh8zOnLSaBFN/f0/K8fW74JT2jtsKlpko1c6pHRBkSX7l7BET9vaGNCfiye5DmP6NEahdB7
	7j4xzBNURmVIwgajJ1824YCCAMMIG2K9z2CgvudsD7zHjPuIoWXpzyp+0pRu/+UmimRxoaqou1d
	sD+AUNG5upVmO/DnQJnjLNmq7FGfiw/6/+MvmnqVW1Y6S8qkIES74xBeD+lEtqvDCPnWGOeZbFA
	1jsA1mCEToZjfb6XPO/v5TVAZKbTurou86xG5TtpYFzrWex4978iGe78ZhDjWAk/AMSHDO5yg2W
	LEfqEZDV0haDGWyYAl2KveGxw83Am7gGZf1o1Zav9yyuHkQ+JD2uCy2errBT+TjWvwC7kp2Opgx
	Yg+kK633fsywFKn+XhB7uGomF3Typ3gUsECNfg9g
X-Received: by 2002:a05:7300:681c:b0:353:5d9a:9971 with SMTP id 5a478bee46e88-369e84fe389mr940278eec.18.1792799679624;
        Fri, 23 Oct 2026 16:54:39 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:f8c2:b3aa:f878:2faa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8daf444sm1460608eec.18.2026.10.23.16.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:54:38 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Joonwon Kang <joonwonkang@google.com>,
	Subhash Jadavani <sjadavani@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Lucas Wei <lucaswei@google.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] mailbox: Allow #mbox-cells = <0> without specifying a custom xlate
Date: Fri, 23 Oct 2026 16:52:18 -0700
Message-ID: <20261023165211.v2.1.If447263dcf15e73068905eb9c21a9e630f749615@changeid>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
In-Reply-To: <20261023235408.3063350-1-dianders@chromium.org>
References: <20261023235408.3063350-1-dianders@chromium.org>
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

If a mailbox is only providing one channel, there is no reason to
require any extra mbox-cells. Allow specifying 0.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/mailbox/mailbox.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index efacd24a085d..6c9d426f4e58 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -524,7 +524,13 @@ EXPORT_SYMBOL_GPL(mbox_free_channel);
 static struct mbox_chan *fw_mbox_index_xlate(struct mbox_controller *mbox,
 					     const struct fwnode_reference_args *sp)
 {
-	if (sp->nargs < 1 || sp->args[0] >= mbox->num_chans)
+	if (!sp->nargs) {
+		if (mbox->num_chans == 1)
+			return &mbox->chans[0];
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (sp->args[0] >= mbox->num_chans)
 		return ERR_PTR(-EINVAL);
 
 	return &mbox->chans[sp->args[0]];
-- 
2.56.0.257.gf7497c7d27-goog

