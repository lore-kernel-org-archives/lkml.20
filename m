Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15834C33F9
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 18:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791483050; cv=none; b=nliK7lCqY65jG018XGpJxiJaUgnfn/oQdvL7aXnr8B5ErW52hsGcwhlklpNcCsTxGcJB6VuJecwLtKIdSMbMPJqu98kYJpuknjkuR5n1rMf4SJUiFYmaum4n1+BvLL3LKDdgjLEciNfHgjxhXIX+J6dqog+alzgbKtPqPpo0vhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791483050; c=relaxed/simple;
	bh=nuodlO8O5s7zrDX5/UNeJ3IiRnHzTsUkm85sKokUP9s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E9r03T6aaH7ldGvCvhytlm6YDXRV59A9RyzKACPzf0vztOfZlU13IASZNts8evsDSwkirvHYkUtyzxwssk8+VH/UykQ/DrI57kJFCyogwOooXGJ9sCuICZXQNDkA4MRFe5Hd8lKU2vIjDdlZA1GGZwXW1GZqHjGeTNOJ00iItFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XkE8Fvu/; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XkE8Fvu/"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35115b52125so4397200eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791483049; x=1792087849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iGYcOJcF0oZUQLIO0eks08a1W0+2j2uia1YjT6l0DhQ=;
        b=XkE8Fvu/fgTuyxWSA7bdOiCN23dACVbfgYleAJN9opfQpbMIJNcqvWEUHR34TaPVOv
         Cp3xXdvPaPyh33iV/4EIPCXKipaN4wfEv8DmvmJffF3u6AEOVrC4ZnN8uDLodcazMv4b
         8bbw4mhqHsAZtZh3+paYPR3amkJDbr8PTQQfxXZ4bjUeeb9WY8CmEuL+kcgZw4xzSSSb
         fc06OZ1CkMntYhzpiq4ylAm87H7qEYsOosczTmlxrxO0cvVTROyqj/zN5fDmxnMwRjCM
         KMC34F0xfGQr2ydtukyXL1mKNK5ZPkKj2aemjnd4D9jFre96nPWw7zL44mY7EWOKFC3x
         Doxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791483049; x=1792087849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iGYcOJcF0oZUQLIO0eks08a1W0+2j2uia1YjT6l0DhQ=;
        b=1mtBr09XwAr+LVGHswOX50wedU0jWU9hPUv1PB8QQKAgCO6YT/2byBrPZz1qhqL+9s
         1rex4y3N7/nrUQrJcVMXuWcVOkd4X7IiH8+k03F0BH40+grWjefIs/znVxq5voOvsLNu
         i3jHBAv98D3QByRkcNfY7uniS4+nDrDlAW1C5VjmpEqjEWrhcUE2Fr6Rm6TVCTIdMv1R
         hSnwf/uSXNJvEm+ldVIIRMnFtirjxeNVOED2ce0DF7UYOsAMBkWWV7V00hQy79fRv6ad
         37nl5uyTNX+JayELcMpK0NdrJhlE4ymNcF2wEUoewLzta4E/64f0XMS3m8Py0sSuJd5m
         yioA==
X-Forwarded-Encrypted: i=1; AKwUvBxDyJpqfd4Tr6co8aZjP1cl9WSyqc8sSb8xDbRveRI5TlWK7J7FpmJrvJWek9cg9RknXRvycqk5WvVTIlw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfpKEzdTtNnt+uUWaRw3LyuH1BZMBD9ZP43/beLjV+Q/Uf0dDi
	648XB/p3McwP55AkKvDRT6cMYw+1K4MjDGemD4AmeZG+oXd7Dg8AVowYS9Eo3A==
X-Gm-Gg: AYBFou0cxGNrOAPWF/M6SIJJWJMGV1nieXymaXhJNH1O343FL4xOEEXKPUZdQuys6bm
	TGmjtus0t3UHrAD3rOwymAk5uIWq1wuU81T5WRoQTjrjo4YjOLH97vWDR43tV5Zz1HGcqYlj4tM
	I66Td+jaLkVbpJR/KzRaN8/O70PByvhMzzrjg8DmV5MeBlzr0tjUITUDjGJgwVP03sj3ARBRePp
	XSWIk77rd2ESuemDCosSmrUtjHHiro7e39ESpnFnxG2gOywjOI4HgtJD9DOrusMbjjZS93JdWcg
	+pJH6yBJU/yqjAdm3y7ZqMfD2BK2dbsjOlnvhE5sxcfzF6r7caa9b5RtqGHy0vNlJQidM4zlGIK
	CMfhDM1C9hNju2chrD+vd1OGFyBet/7lGcSfSFE1QnCXDeekcnC137APBcEWLVhxDCSHKCt7UVm
	v+dcGwvtqhfES6vjqW7KRhGC4V2WJXze4+l9pbLY2OqI7VoRk0opz/nLCd65ukCq6GuPlew1FoH
	7MkwQzKM2KD6Etv4WTT4owyYFPJPlR7DZa/foK/Xwm6gU+WLU4jhsuENmDg4tPC35imTSW8ZpYf
	i/Msl5xr0t8z9xTeik0Fkjzsr6W4UAkrnqAPadNhj30=
X-Received: by 2002:a05:7300:fd0e:b0:352:3bdd:423b with SMTP id 5a478bee46e88-3523bdd4437mr3732131eec.21.1791483048483;
        Thu, 08 Oct 2026 11:10:48 -0700 (PDT)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537b479e76sm162161eec.26.2026.10.08.11.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 11:10:47 -0700 (PDT)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Harald Welte <laforge@gnumonks.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	osmocom-net-gprs@lists.osmocom.org,
	linux-kernel@vger.kernel.org,
	Anil Kaushik <anilkaushikwireless@gmail.com>
Subject: [PATCH net-next v2 1/3] gtp: set a valid genl command in PDP context get and dump replies
Date: Thu,  8 Oct 2026 18:10:29 +0000
Message-Id: <20261008181031.4129029-2-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261008181031.4129029-1-anilkaushikwireless@gmail.com>
References: <20261008181031.4129029-1-anilkaushikwireless@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gtp_genl_fill_info() stamps the reply with the command its callers pass
in. gtp_genl_get_pdp() and gtp_genl_dump_pdp() pass nlmsg_type, which in
a genl message is the dynamically assigned family id rather than a
GTP_CMD_* value, so replies to a PDP context get or dump carry a
meaningless command number.

libgtpnl ignores the command and is unaffected, but parsers that check
it (for example the ynl tooling) treat the reply as an unknown command
and discard it. Pass GTP_CMD_GETPDP, as gtp_tunnel_notify() already
passes a real command on the notification path. No uapi change.

Fixes: 459aa660eb1d ("gtp: add initial driver for datapath of GPRS Tunneling Protocol (GTP-U)")
Signed-off-by: Anil Kaushik <anilkaushikwireless@gmail.com>
---
 drivers/net/gtp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/gtp.c b/drivers/net/gtp.c
index 4aff23bcf..99836b773 100644
--- a/drivers/net/gtp.c
+++ b/drivers/net/gtp.c
@@ -2279,7 +2279,7 @@ static int gtp_genl_get_pdp(struct sk_buff *skb, struct genl_info *info)
 	}
 
 	err = gtp_genl_fill_info(skb2, NETLINK_CB(skb).portid, info->snd_seq,
-				 0, info->nlhdr->nlmsg_type, pctx);
+				 0, GTP_CMD_GETPDP, pctx);
 	if (err < 0)
 		goto err_unlock_free;
 
@@ -2326,7 +2326,7 @@ static int gtp_genl_dump_pdp(struct sk_buff *skb,
 					    NETLINK_CB(cb->skb).portid,
 					    cb->nlh->nlmsg_seq,
 					    NLM_F_MULTI,
-					    cb->nlh->nlmsg_type, pctx)) {
+					    GTP_CMD_GETPDP, pctx)) {
 					cb->args[0] = i;
 					cb->args[1] = j;
 					cb->args[2] = (unsigned long)gtp;
-- 
2.25.1

