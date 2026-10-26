Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013718;
	b=Yz3eDBY/PRwUf2f/qA++j/ZCpSMXraBdaO9t35mks+AteD0WuNYML1KrBx63alPIl9au
	 huTzcZdVG+9p8FhHG0iAEu7k0dLjUiKBeRV4mhFteEdsdwnY+DR4N1TnWY1XFBj3ZxdNo
	 5VH4KzzoVa+13uEI56/Xn2N1aZqvwkMPauvxhcv7uNgWl7byrvJtM79fz7daKakDWk8gz
	 8q5t3A6wBijN6VPI64DWF3428h1Ilmnub2cAwMdBOC1SzfTYhhaz6HJM9keJzGcb7IlA2
	 soYZsruA6ufmvh19GXyMsuEtQFgTF/pUeZOrnMFKnKjfA2rjuCLbWfctd2WBECoP1Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xZ3hvppsJXNIOs0Q7rs6a6KCMDKrK3IMk+V7dGRWIBo=;
	b=d0Rv3lQjBlX5iX2LhRmMUHNNHmWVgicnzFL6umXxTc43FfKQjzHljfL77bcYKzhDYzA0
	 kxhhu4X3lHPHeF3jkB48FSLQuJxctDfgodi9vCyRPbVCkd4UJ14JjSgTQnqDQB5KLqSr3
	 eq64HgqZfvC2WB+xupNXrcOLhUpcva2yBynuxepUVwftN0Nwk6JY7zGiYmUGqCjydM7Xy
	 RCBxG3hco1Mn21V1CdZ7Ib6tNLxEGvgb1pGB8ckJVGomt1NM1oB8Qs4POVZnFFs8LuLdF
	 n0fOLDzpDWva2LsyPbFExURmz+4Q3xzP7Qg+X0ZktzvOfydxV0FtY1yidnw1hwjPswA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fZe1YKnc;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D7360A2601
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1D7360A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fZe1YKnc
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b042c0759so1604118f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013716; x=1793618516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xZ3hvppsJXNIOs0Q7rs6a6KCMDKrK3IMk+V7dGRWIBo=;
        b=fZe1YKncduevfg7NRuTy7rSWE+XGiGSVEcRN2B0KUQRf3H0Ky8Xsymf98qiiGW47nA
         T01E+nvTV9OYNFD4pi7cViYa3rciBKhLiwCobizFfV70x5vKYQVU0b2IJDfB+8gbkhZt
         LK12IZWnOk4dH+90/2AW8JyEfrBgo7wAUyIQjghgHNv+/R8f7lY9eIic9epayqPX1kzI
         EDVVMXykiPZqoEqa7ISHSItDHmts9xImVsFym5q8aKW5bwuqb9+1kdj5s7x6P9zlSBva
         xpQNxS+f3VHPjDsgdg6eHhVR1DLCga0yWK6NlLuerecx+b233tOOC4FsbFKFfBOhjWbT
         fBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013716; x=1793618516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xZ3hvppsJXNIOs0Q7rs6a6KCMDKrK3IMk+V7dGRWIBo=;
        b=qzotBcvc5hezszGm3CNC1qx1TXk7D58bkPOL2mM6K+emabQ5rY0r6GvDcsQnKdxPHp
         20UaPjG+X4RtHWfSVB47BebonREmXdmMVIDKy/KUS/l4MkDk0II9N48TQwnq5TieYy8l
         29DZid3edwGmPywH5yeqzubGhWRODCYNHH4p337AsxaSFTjZDEvPpYmDNTe03JPvZv5o
         +kmcrmLBpD+xLvPwHvZBVu8Crlv3uPGH5PsH6cSWVdFizkcEfYsz2nWVnQbxI5yy5VAP
         T9VwT0e7xIwUE1YA7RCYye3+dbPi+4P1Kyr3THkCZ8StXuRRPbS6Bm+GjGnvTowQKTx5
         Z+Rw==
X-Forwarded-Encrypted: i=1; AKwUvBzNVm5rY3A6eswEiS4/9BO58vRkvxcdMDmXcQ3v0ymr9k+nnJD6SEhnQIAP+zKvXO+v/X86cnGqepcohBg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvCnfwok0mo0QlhobUdfqrkPm9FzJi1aUy6xQxIJ4l4rpP4Wiw
	8sV1C5BsJ6Lqoe6evC1KTRxEMuQDcThaUZ/Bf9ZSMgCrVnumv5NVhuw=
X-Gm-Gg: AYBFou0dEV6R8SNd7oBfS7EyReWk+ePLW160oitJEFzRvccltT+pZjogAFwr/gurwI0
	nLOXeGd1L8y3tdXaOdD+cwo5OfFLMUs/CGEJM2MQ4d3DpInQLEB1vdsbu4xnm1OFo/Pg4rgDjy3
	3e71YH+hZP/N35eU4Y9CBsITJnYALECVK8B8JHMJBTk1b5jdaBO/KVOsAt6kMPq0hynS7FEufJe
	GMoOpPO9WUkKX6PN4ATqUPKKSO+GQlEW3qC9GjXEBp5wnzAxAxB0izPHGpb5gZO0rqYy/ciMEJ5
	EHeo5Q5Cd68LourtecwW8AvWbMnxyYMI6A4cdCBKuCgGJoAkTEwrbP+pSA2lEAGXYUlRbrf/7f4
	mHCZWcOg730FITzRwD8QZYvFlZU2Oas4H1UpS8JH3gnSyyCv6M8F2YU+JCOt+84q6FJroqOdiJf
	XPKoDIGSbo1zKywIzioi78peBfLHKqbwHh4EeUoCSK5gBSVd0xNdx7cGwfdZCVqC13amrd7Niq6
	zQlgb616vDQ4kPWO6XAuuysqECINxhj4htxitaayxUsLQ==
X-Received: by 2002:a05:6000:160d:b0:48e:35d4:55b5 with SMTP id ffacd0b85a97d-48e545bcbe7mr305812f8f.52.1793013715854;
        Mon, 26 Oct 2026 04:21:55 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm15048703f8f.56.2026.10.26.04.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:21:55 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Christian Lamparter <chunkeey@googlemail.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>
Cc: Ivo van Doorn <ivdoorn@gmail.com>,
	"John W . Linville" <linville@tuxdriver.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Kees Cook <kees@kernel.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH wireless 3/3] wifi: p54: fix IE parsing loop bounds check
Date: Mon, 26 Oct 2026 11:21:51 +0000
Message-ID: <20261026112151.2515228-3-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026112151.2515228-1-tristmd@gmail.com>
References: <20261026112151.2515228-1-tristmd@gmail.com>
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

From: Tristan Madani <tristan@talencesecurity.com>

p54_find_ie() iterates over information elements using a loop condition
of while (pos < end). When only one byte remains (pos == end - 1),
the loop body accesses pos[1] which reads one byte beyond the validated
buffer boundary. The read happens in the bounds check expression
pos + 2 + pos[1] > end before the result of that check can prevent
the access.

Fix by tightening the loop condition to while (pos + 2 <= end),
which ensures that at least the IE id (pos[0]) and length (pos[1])
bytes are within bounds before any access.

Fixes: 0ac0d6cedf611 ("p54: Move mac80211 glue code")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/net/wireless/intersil/p54/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/intersil/p54/main.c b/drivers/net/wireless/intersil/p54/main.c
index 57a62108cbc35..16614f65dfa5f 100644
--- a/drivers/net/wireless/intersil/p54/main.c
+++ b/drivers/net/wireless/intersil/p54/main.c
@@ -81,7 +81,7 @@ u8 *p54_find_ie(struct sk_buff *skb, u8 ie)
 
 	pos = (u8 *)mgmt->u.beacon.variable;
 	end = skb->data + skb->len;
-	while (pos < end) {
+	while (pos + 2 <= end) {
 		if (pos + 2 + pos[1] > end)
 			return NULL;
 
-- 
2.47.3

