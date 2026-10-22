Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792685406;
	b=tTGfTezD9HAq5zwvli42+Co+Lu8RNG43TqXUMNA4PONYAzz5SmES5JIF6HTxXQRerfJZ
	 H0ftGh7PI92XuY3fIPtIcIvaIqdFvGT3bxcXX/qwrn21mjilhWGqmIMUenkIL7rdAXcMw
	 sPCOKeT0YYEs8U+T0s1SXrCSReuWTYFCwwQgIL5LFY9Mq0fN8RCcIPYbesKfzhIqnw+9l
	 TE2va50WmtT93inDARulJ2w0W3utEmbxPl0U5hnLbCTe0A6GZt/Dt//6PXBvOo98itWj4
	 FmEUQtXAMSgdOSwWhToQyr+Zb750vqtckN8G57NJEub3KSVBEude/8emxmeIk2q/S/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792685406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=TKiZFeJUlLaF2cjWlbWxlK679IXDg+jtMCj4786GFco=;
	b=BFinVe8oBFyw/NmTvuiYhZ/7CAol/1iTxhnYfiNcOS2g7aPWN6RHzTTnGb1FAhHSJ5BS
	 b5GDhWLUyKLVr0Ktz+XR1aR+CCtN8DHHGPfdgf0twWWLxP7LSNsOCn8OS75tPoq87vRDK
	 q+pl4oYpWq0BjKaDxzSWObYQaaz+FrwXH/yGs3oUebbifxEmvo7NUO7rzyJ29EDDFoTfg
	 IGv7WC2U4rjQ35aSYjpJeR5/k0WefsqsNErboGXaCylFxOJS0AKDgLYafTpGWRgWxhgXx
	 2tLcnRXMmmqaWOfvdoYGPI02T4JtrlhizXX78iDzDDBsUPfhdg3j8C7YR05zoTYz+Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XmzsW+R5;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33E360A2612
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E33E360A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XmzsW+R5
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-34cbc588a31so980653eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792685405; x=1793290205; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TKiZFeJUlLaF2cjWlbWxlK679IXDg+jtMCj4786GFco=;
        b=XmzsW+R5MOEIC3FBhEhT8nnIUXXiB3mcI0ENYvxy7O1Q8LQ1Pj+WxcuCTDqNcCHQ83
         IaUMrck7a5HM8rXIqEPHb7kN5to9RsNcA8FovdJ9abNnL6eHcWaocb22UYtEYvlClLVE
         1EqL2XYZDUUqyKR9zRJzcl6fKA0y7QUwcT617ZDsxb81VZ8rtuFCAKgVXDu3yUPeeLjc
         5ioPVsWm4GlolS4MrwxSssRt5mYp4AKIXyesOnOhYz4RKxd3ZDgKfhlFbjuNeLNY6XAv
         FmxXPR89luxqUrZ34f3LxHNV9Fn5ycypdfmUh6KMpiqJdYSk0DPLm4/fBQEQEMfsxyKj
         Kznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792685405; x=1793290205;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TKiZFeJUlLaF2cjWlbWxlK679IXDg+jtMCj4786GFco=;
        b=ylQbC9K0bhIoTzh+vabek9P5hBfWqCOS22LNQrZ4/hGBf8hGySzO1UKexeaGHbtoqr
         cRuiuaqaLuLChWLvNteTo67azCr8iWD45rIt98TS5stXdrNs57IXYildnTi7/dscS6QQ
         c8R0bxiAJf32S6TZVmkxVqVrAEeZ3jy4AFJCtr4n3vtTIUfSXapl0SXIkwrC3lqub5jC
         FwbWUC6HsjBHVIfNlJI+vOkfaaiSG7RqdfxaSrRI+rQKKIJvlcXazRegKrO8ZL1AACNo
         cVpXZmcnh/YpAS3dwBWxYJVE/jSUJGPzUABw77RnPi1BA0GBRJ3ujSisyl02SpsgFLp1
         voPw==
X-Forwarded-Encrypted: i=1; AKwUvBxYWXX3Awyu0loy1rLHoRUV1qLlhQ3UELZJ5Rk1clUsVU8IYVwj06bUD9WLIvO0xWFvWRdgC90u6hrw5go=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhJiEmD7jgTyGPKzmTNFP8cxulSxzsu7p6cFtfd8XvSctEayKw
	wsChPzVrbyOyInJhd16bcVjGsGw32q6DdqTDxdKbSOqTwXotvOo5egE9
X-Gm-Gg: AYBFou1WngtcQ7t2b5Kk0OIQhbjSX6yD023p4CEA5AQ+9H5grAIh2o2ntX0TDnVLqDM
	a2G7NZpFMKdkHQvY+0uwBj/Kbkq2N6vHhtjFrQdRnvBAq/Cmmt+Zy/6Ar9qZ1bYqoRA3MH106te
	xaNF40vd4GMJnAJsEmw6U1nNvGNYOYtoOnDvTImDLOgHhYfHnkr7Egk8cyRDxoUybdkUbAPzV97
	XoQoW0And8i41eR0HEXW946Rjw9OasTfhWvYvhBpMvHqsnZBXtVzpWmi2qDAgs4KD3qyQ7K/h8k
	96Lus6JcfwSiUKX6zYYYYYoGJpadH2xqDzJPYV/Uy8WSMggtz8RUucvS/FmzeQaS35DYMokRg88
	JiZst3B10Jfly6jupr2Kq8whaf74/cDTXRtWyEGfOj7riZmUEb/OyodOJe1InthdSpVvI0FzYLx
	D4e3jx+4M33465e8ifM3RplVzDx3PCzSgXLVF41/37CjoosRRDd5cpAz6zU2l6JUCsALG8716C+
	8ASItZSEL1ljeTzLFysDAEbEVmodqGz9o89xgLUClIiyozduV5hEJh4giXceMIdOD4w6nAV6aNd
	rZfM
X-Received: by 2002:a05:7022:b045:20b0:183:3c2a:ae8 with SMTP id a92af1059eb24-190a84c288fmr7338019c88.41.1792685404837;
        Thu, 22 Oct 2026 09:10:04 -0700 (PDT)
Received: from [127.0.1.1] (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e4f2eacsm14594124c88.23.2026.10.22.09.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:10:04 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Nikolay Aleksandrov <razor@blackwall.org>,
 Ido Schimmel <idosch@nvidia.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 bridge@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tobias Waldekranz <tobias@waldekranz.com>
Subject: [PATCH net] net: bridge: do not bypass port state for MST without
 VLAN filtering
Date: Thu, 22 Oct 2026 08:26:49 -0700
Message-ID: <179268538303.70821.3493915601694605045@gmail.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

br_mst_is_enabled() is true when the bridge MST option is set and the
port has a VLAN group, and nbp_vlan_init() installs a VLAN group on
every port even when VLAN filtering is disabled.  While it is true,
ingress treats the port as forwarding and egress skips the
BR_STATE_FORWARDING check, so that the per-VLAN MST state is enforced
instead.  That state is only checked when VLAN filtering is enabled,
though: br_allowed_ingress() returns early otherwise, and
br_allowed_egress() only checks frames that were VLAN-filtered on
ingress.

With MST enabled and VLAN filtering disabled, no port state is enforced
at all, and a port in BR_STATE_BLOCKING or BR_STATE_DISABLED still
forwards traffic, defeating STP and MRP loop protection.  MST can be
enabled in this configuration, since br_mst_set_enabled() only requires
that no port has a VLAN, for example with default_pvid 0.  In that setup
a BLOCKING port kept forwarding broadcast frames while MST was enabled,
and stopped when MST was disabled.

Commit 8dca36978aa8 ("net: bridge: fix use-after-free due to MST port
state bypass") stopped this bypass during port deletion by also
requiring the port VLAN group; the bypass itself remained.

Also require VLAN filtering in br_mst_is_enabled(), so the normal port
state checks apply until VLAN filtering is enabled.

Fixes: ec7328b59176 ("net: bridge: mst: Multiple Spanning Tree (MST) mode")
Assisted-by: LLM
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
 net/bridge/br_private.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/bridge/br_private.h b/net/bridge/br_private.h
index ff746f036f54..85065304597e 100644
--- a/net/bridge/br_private.h
+++ b/net/bridge/br_private.h
@@ -1953,6 +1953,7 @@ static inline bool br_mst_is_enabled(const struct net_bridge_port *p)
 	/* check the port's vlan group to avoid racing with port deletion */
 	return static_branch_unlikely(&br_mst_used) &&
 	       br_opt_get(p->br, BROPT_MST_ENABLED) &&
+	       br_opt_get(p->br, BROPT_VLAN_ENABLED) &&
 	       rcu_access_pointer(p->vlgrp);
 }
 

base-commit: f4377bf85887f57b59abb5479f7660a81ffe4449
-- 
2.34.1

