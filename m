Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C902C442B15
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 16:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788626317; cv=none; b=fWAutmsDFVBJFp7fBGWyQyH7s82l6P9V2bmXMpWmCjwVBYS7moAFtnnsaC9aKzsS5FytAs70k+8E7wb5hljINKAqSli/f7NlLHnLk05IVndgIz1c9yi2R51G5PoogCH3TRT3eu4hTs1ZxYVJiIje2r1s69/4SuOF6vz6etYM214=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788626317; c=relaxed/simple;
	bh=3rYlH8LXVBW5SsYx659NfG0lyBaDhUqrzWQwq58K594=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=S8A4qTC4ivA8mnkP3VHSE3wdtRpIFRKhvCW3A9iManef6Y9VwlUwLJrlPKG2mR5OlLlnEhMYizOUV7dRA2C7b4EFrZe3RTCDoB7ltI4rzGpjtY8RwFLO3SHkdpidZkAP7NN+SlLY12NA9KwWv3O36ViCdNQR0Vn3qH5NAMh4030=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com; spf=pass smtp.mailfrom=doyensec.com; dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b=Za5GfO0T; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=doyensec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b="Za5GfO0T"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a6868f18aeso3009340a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 09:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=doyensec.com; s=google; t=1788626314; x=1789231114; darn=vger.kernel.org;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:content-type:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=triNZ5qYyRouWDSU+cvR0dd2XFT1X3RzFe5HPcGxPww=;
        b=Za5GfO0T/q+zzQnnN2CGYAbyZl5gLrr0uJvMES4K8gW1GDUHPZ29sHcV/9Fu4RHsH2
         w6BDa95PZMW7p3wCaRsfoMLu+uxDPRTMibpIMtRiAG57f9paVmKOims/lDkG0AS+DkYy
         awFpFx3p9mkUOe6Rro5ouP7l4ml07VPG/8eeDU940wUxNDWmJ38C8vCzyhrmH68lEUMI
         Nao1k7YGCWBw7Tn52IqVrcAW4CxJWlEqJIcNUj1TaGJhGYMcke8cunb1sWRowlkIsbUT
         //IFf8HHF7RH8sVMrHPq5lir68LXagcAKSNgu/RihruwodP8ATxLlxdiwNhimM3kp/IF
         6mHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788626314; x=1789231114;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:content-type:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=triNZ5qYyRouWDSU+cvR0dd2XFT1X3RzFe5HPcGxPww=;
        b=sFIrZs/0nY9s1S4/LWMJ/YnP0QnTyg5MGZocvFvOcwlJ0XI9YmnKCd0OOs8nhpqT7c
         ya+YZJPMsALCoNuQGt/KJGfzJVtilI0Z07Uw9JFFIiz5XeMrDo42QwM30mQlvl37udYE
         zwzs3/FfqTMnMCLbu2NT566PTmCiPXMEvSUFV49uMs2V596jFeGdNSDTqzxV4V5Eudu4
         lBPYZtQohcid3XDtx7lXpjiT3NeV5WNvBGGEMwXjWXmpfLHUnh3kKvW4X//Jw6/ZEkqf
         s0rIFJdvqiigSspiGQkm/gMn77LpwaQxkgwTLJWCGvpFvl2c3z1C+g1OCmuMlQHdJuFl
         CDZg==
X-Forwarded-Encrypted: i=1; AKwUvBxZN0v6cXMoyXd6TMa+zxdr5CznKoajWshwJfmPK0c40seFrblwD4QC5RfbfKDL+pW0psECf32ONP0mZnU=@vger.kernel.org
X-Gm-Message-State: AFuF++nnybVnQ0ALp+agx89VWWD83gyquM9hzX5xZwHMAOqX6Tt+1IED
	F5x61KED3tOL1X2qwDj0doba2bl+LC4BuccSg7bk3WgXW40AENmGTSj3i89nGzwHq+w=
X-Gm-Gg: AYBFou05PppjxArCFFAjVJiC0scDU5x7MSpIgMm879bGIHRAOD8pJgouPfpu7PwvR4Q
	lLtpwBW37/R/jwI27kvwv9uM16iunW7xTHVaao4ihi5kTQS6avFS+xFPFHkhBQGulBxejzlzfrM
	2kLwdlBe9J6ARIQPv5msBlMZXNFAGZ+wG8iC9a42FHpXtLZmTPTcGpovrdDVUMHiy8ig1CgfR4V
	XCaJylu+Y5Az2NssvO/cHSVkzSu7zzOo60D+EMd74Ut/2V+oIbXHMreG0bwJW3hguMvbB6YxByw
	quW5VAnQvFCY75wvXQSw35XBHVoptrwRdjS4r/dmQh7dxIRA2LVyo9V8RYmjOvY6BGhkyZu0SJ7
	xi+uO14hGveiOEE4mE+GwF/jJjEbnzUNu8feXRyu9MtvRkrTgVmmdun0F4sq/a7ox/1OvBC2sq0
	21bv/Ect4ea62Frl1w46HD1FK3b89LiUOXS9ZDSqU4mAZecdiOMOxcqEXErCQ/Cu9fEHfgQCRVz
	9GZzrSB6B0TYTMT6MjpVRhNLCIpqGgmdCnFe+FRnM5cELALDbXl
X-Received: by 2002:a05:6402:218b:10b0:6a7:f2d5:dfcc with SMTP id 4fb4d7f45d1cf-6a7f2d5e240mr2090775a12.36.1788626313718;
        Sat, 05 Sep 2026 09:38:33 -0700 (PDT)
Received: from smtpclient.apple (83.10.35.35.ipv4.supernova.orange.pl. [83.10.35.35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d03635csm243336466b.7.2026.09.05.09.38.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 05 Sep 2026 09:38:32 -0700 (PDT)
From: Norbert Szetei <norbert@doyensec.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: [PATCH net] net/sched: cls_u32: take a reference on the hash table in
 u32_change()
Message-Id: <79DB27AC-0FC0-42B2-A795-A8B585B73CFB@doyensec.com>
Date: Sat, 5 Sep 2026 18:38:20 +0200
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
 Jiri Pirko <jiri@resnulli.us>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>,
 Cong Wang <xiyou.wangcong@gmail.com>,
 linux-kernel@vger.kernel.org
To: netdev@vger.kernel.org
X-Mailer: Apple Mail (2.3826.700.81.1.4)

u32_change() keeps the target hash table in a local variable without
taking a reference. u32_set_parms() may then drop rtnl to load an action
module, and on a failed load returns without asking the caller to
replay (-ENOENT). A concurrent RTM_DELTFILTER can free the table in
that window, and u32_change() then removes the node id it reserved from
the freed table.

Take a reference on the table across u32_set_parms(). A racing
u32_delete() then fails its refcount_dec_if_one() and returns -EBUSY
instead of freeing it.

Fixes: e7614370d6f0 ("net_sched: use idr to allocate u32 filter =
handles")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Norbert Szetei <norbert@doyensec.com>
---
Reproducer available on request.

 net/sched/cls_u32.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/sched/cls_u32.c b/net/sched/cls_u32.c
index a3e65c8cf29e..0e9128f2f33e 100644
--- a/net/sched/cls_u32.c
+++ b/net/sched/cls_u32.c
@@ -1180,8 +1180,11 @@ static int u32_change(struct net *net, struct =
sk_buff *in_skb,
 	}
 #endif
=20
+	/* u32_set_parms() may drop rtnl; keep ht alive across it */
+	refcount_inc(&ht->refcnt);
 	err =3D u32_set_parms(net, tp, n, tb, tca[TCA_RATE],
 			    flags, n->flags, extack);
+	refcount_dec(&ht->refcnt);
=20
 	u32_bind_filter(tp, n, base, tb);
=20
--=20
2.55.0

