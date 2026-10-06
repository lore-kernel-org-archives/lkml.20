Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2C94A5EC7
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 17:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791306656; cv=none; b=HH3iRDgM2ZcZiueIGs/8u+sY7iO+qVWvY0LCuYdvY12dsrroAqT1MldsD2FwYXIlN2euKPz/6yr57Av/+eBJAUxPTaSFWiHdXv1lasPlo0qZF57/J2pkiZv3o4ty00QkgUA0zmx7Oq0ME9l2TREdSM8Y5UtjVztBGIWimNEjVLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791306656; c=relaxed/simple;
	bh=xX7ZA4Pt/yD9efhp5Id7SFCUZe9AdU5ywHlMrl9VEGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YU2lWuPWRURVR5BDI4LVo/LdXrqOW1AR5epPatf7ZbtLJSJ1Ps/iAmx28e+LttRL+F3grQs4wXEnrMEycmeqm1Q2tnVJXXVGhOa4/cfDMJl4tLIaQkCPEb/7tEYXdUHPM6UmELkSCgN456PIby264rvXCAD9iGR5alTtDHTpI7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=OtU0VIxc; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="OtU0VIxc"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5339199d8c3so8688021cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 10:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791306654; x=1791911454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bnn5ZUBxpD3vBwQoOI4ac0trMLAbv9PIx4bA2k8/Jlo=;
        b=OtU0VIxcBmegf+k58GXtEThgnF2myYR6KyS+QaDEY1NyLeBxF6Cr+96+3pXnkUgV22
         eI5X/ofUfwAEuqrn/a4qATMaWfe5yFP9sYSW2ucSmC//aPd6mmOxoQxlQOBaqOu3UGdS
         I7+OYrnZ5v40fvZjllg0iM6WV4c/oUbErCh3IpA0zL3y2gaAAKKaspqlbK+ogcWUayM6
         jwvDfwTEsPRLlcghzvavVWqBYpXpVlwI1gcUDsRpltYcD3FRhkSlD3etqeOmkSx7MjvO
         jijgQh1oklblHfr9pl3iqy+058p4WiZzVHiteTz3puHk8znMIq6lU0B0z39cy0mv+Bb/
         yV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791306654; x=1791911454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bnn5ZUBxpD3vBwQoOI4ac0trMLAbv9PIx4bA2k8/Jlo=;
        b=hDUSCuKp4L24sKkUA8od2gH+PWSEWTpyEiuJw7c0k+3F0CySsq9DdVxNlp403Z9tf3
         jvTAlOjwS8NKXlQ4Vs3LzrCMreIbJla6sDW7cPx+w1S1ifxR2lvNLW4+60mIwLoo+YXh
         tmzJt2GLUvpwRMaoHbW+9CmXQJ2f9trkrS3LMMLGQ9sA9S5ph8bygvVvfHtti8RyysEs
         PiIfxdSLfXUE39tFqzA9m8rJb7FnWxgB2XTn05/Xufsa5h2yUdHUgPFN5n6yd9QIxT3S
         X+3/179Ls+4EjDGlnjSg/8OTnKsnNxmctb7kpqxZeA7dgV1kEhPmG/GZZH0eW4+P8n6X
         kZQQ==
X-Forwarded-Encrypted: i=1; AKwUvByPENQZZK95sjVYMQQlMDkPmtvLJUlSvFmAM3UczRMJ54mWct/5fCDkkP/aORPhyNMFlGtR8/3/teiM6jo=@vger.kernel.org
X-Gm-Message-State: AFuF++nDuR2SyX//G2BC0BB5N2puJ3aK2yNq+VOemnkbLvyvlzwGE1uc
	Hbjmz5N+QbORtvCvkyvYDncuPwCjjc99YSNoi+lYXNAtvyvBPSJL5Y8FxonmvLE7ZBgV9mvua+Y
	gAvpZ
X-Gm-Gg: AYBFou1/gAu0zMgHlAOzUZUuvQ/pjA+AE8ESa8ZiMvXsMRqq2ktTmpW8mkXH0ysyd6D
	IciDQI5YorhGWZDjz7S4chHGED3EmKUWmfmNvqZgil8AthKnlYf0YacDVNUwwnTWJnfpQ+m4ipn
	ed6wRKbDW51rUBFi1OljVS1MrFf+ZjSZf04Sy4ZtfUo///TJsaBpfUxPAyfSizILFCjkt2mbvfL
	IVAUcoyU6j1Hv1licwWcOIq4yYzvvNVEZWnaSFlfzBuisEsnlVA6Dg6dpAOvKTeQeeu6HWgXhj3
	y2DCNDFmvu3rnWirSNr9w1LB1h9qnW1diGoiXMg5k8HyOjMzRzQdKUwWDG5b/aID8tXpyn5B6TK
	BwUtUPHLU1HPTFNY7zrbMmIAiaBvLgTDl0Cyuj/aUouhsSkO5A/T56/bfIR+Wtw+P9zZrm8NiwX
	0wswFZR6RsEEcgYklg+CoZfwgNeUnZ4AOX9nDHcqmtFcC5BSMXrQDe38Ld15ABu7Rp8EECunlQr
	ahhN5HTHxr+n8I=
X-Received: by 2002:a05:622a:580c:b0:535:e8e:9b5a with SMTP id d75a77b69052e-535668c62fcmr37467101cf.18.1791306653658;
        Tue, 06 Oct 2026 10:10:53 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.240])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53572202defsm223901cf.31.2026.10.06.10.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 10:10:52 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 06 Oct 2026 17:10:23 +0000
Subject: [PATCH net-next 8/9] net: skbuff: don't BUG() on a missing
 head_frag in skb_zerocopy()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-b4-skbuff-bug-on-v1-8-1b4434c5357c@toxicpanda.com>
References: <20261006-b4-skbuff-bug-on-v1-0-1b4434c5357c@toxicpanda.com>
In-Reply-To: <20261006-b4-skbuff-bug-on-v1-0-1b4434c5357c@toxicpanda.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Kaiyuan Zhang <kaiyuanz@google.com>, Mina Almasry <almasrymina@google.com>, 
 Willem de Bruijn <willemb@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1791306634; l=973;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=xX7ZA4Pt/yD9efhp5Id7SFCUZe9AdU5ywHlMrl9VEGo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKn7ZRhDKzsGjGka0wq78eLdjqGiG/lGiR6y0qXeniw6WxfcrOu9kyKr1Pa5yVyVb6T6Pafp3f3
 AfiMDSGOYlwk=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

skb_zerocopy() BUG()s if @from has no head_frag and the caller passed
hlen == 0, meaning the caller didn't ask for the head to be copied and
the head can't be referenced as a page either.  The check runs before
anything is touched, and skb_zerocopy() already documents -EFAULT for
bad skb geometry.  Warn once and return that.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/skbuff.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index e29eda2eaf3f..8c6a45a20eb0 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -3906,7 +3906,8 @@ skb_zerocopy(struct sk_buff *to, struct sk_buff *from, int len, int hlen)
 	struct page *page;
 	unsigned int offset;
 
-	BUG_ON(!from->head_frag && !hlen);
+	if (WARN_ON_ONCE(!from->head_frag && !hlen))
+		return -EFAULT;
 
 	/* dont bother with small payloads */
 	if (len <= skb_tailroom(to))

-- 
2.55.0

