Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649305;
	b=WFDAZdmogOCHNfC4ybMoFqGmOdcVcshosNiz0bR1glnV+h/PvdfOhhKqDEeM+xtI+qCu
	 oQKNHDizYuw1vtrHXS0GAsGA9y4jQwxdBRmTGmYqhVqXnGSqe/Ziute6HDP+8f39Ej9QP
	 aySCzxMxEW6fOw9Z792+oFuJsHM4CbiZXtVJJwdcT/NOyn9At68bXF6AuoElWoPZd0BtU
	 kkaleQWvL0foH8DVGD87KIvaEAG1FxX8D8LIs/i1jX5/KU2WcVMTjLF3CrR0swtxGonKk
	 Pl7lb+Lhd6P1yCk6VurGsB4wnnShb9/u/WGpBXBYDEMFbpVXhau6YQEHRi/wfC94Iow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=2rjL+KHDROa2tYJf5SaQLKL0slmT+VtmFOvPhR55jiM=;
	b=f2NdkhSzRbGBDtdQtSFey1DfuLRxPXWP5TQJXgNdJ2kjmcvM147u2FnrHz9mxudJpdFx
	 K5sYjuTM5ejl/YzhWigZze0tkCi6U6H3cRWy6mJzqxdBkXZdhMIy88EdoE5PVzcoprA7w
	 ReKoQbRoL31xlhgkBqBclYGqt4l+2Hflkf8zOqQWKNr8EBxzrCQtwCu9Uama1+F7hg9r7
	 eUN0odCXBXiPUG5QGRy6B5HztIM/IljAK1GNa2ZKzTRGKN28tLQOF0her4sQCsALGe+jT
	 p3GY56FfV/aV94a03NCrVhz/mq6qpRrbpSymvK/HjioZsWQE8ayQbBVg7i1b+bx2Vag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CZMW7CrU;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3A5606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:55:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C3A5606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CZMW7CrU
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a59ffacb51so4978835e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649304; x=1794254104; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2rjL+KHDROa2tYJf5SaQLKL0slmT+VtmFOvPhR55jiM=;
        b=CZMW7CrUmrF93/sElpC2szy9tCLdqI+uBY7Xivbb4Vv++HTp3FgWTB+2C/6aheNeXD
         GKFSijLFdFVHXDDWOL5Nz8wvt2OJn9U7pBzyOzTcNv/0tzbwjCRd3gWi/FpbjH3Q0ufv
         IiItIyO1GnCc63hXSXW3ttDQm+TlyLADC/TcNFaoh90jfZUm/AAow9G1+1W36GOjKRSL
         qZb6vw93EmV5Hqj0+66TCbcBBD0A4OjPw9qjpRRi0w26yf5iHyrAj2EIKa5oFnmea/7V
         7wlgMTFwna9bT6Ccw8rBRfg2q9Xr/Oy17uSOpM3OMwl1Wf9kMf+t6fy7k+i6paFudqfV
         rzQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649304; x=1794254104;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2rjL+KHDROa2tYJf5SaQLKL0slmT+VtmFOvPhR55jiM=;
        b=1xcoMRvCQqlCWjD/HsCOr7UEIuD/JouOlQWM64DJ7nsHatphdr6aptJx5DSj/6tWWq
         r5+OAgBr4w/QkxKoMyPUaKJftheQ0unUp6fMBDCV8M4AHZKVhLapOsQjiPySMr/V0T7O
         VOiYTW/CXoWMkts/rb8US+83Qsk/aMPSDUR29Mg0gN955AzP4+eEHSybX/cuvMkco04A
         GP9b2LTc74d8uIs/YwIzn4DSVUuSxxR6BmJV9yWq9jZyeS/EZewgpyf8DeR5j34MVxXA
         EiRr+NMhufYvFLlsuD7w+R0lCEM/zD/N4+f0D5HHIP0CWh5mIf98vnpoSFccALngQca3
         3ZZw==
X-Forwarded-Encrypted: i=1; AKwUvByUVAAzVKvYRuRuwY/JrY03wv0PvYOesf+YaQufqtLog+mPzHFTtOVcvACNKN0f+xkE5GA/Ctwy4N7DXcA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8Id5LXWcGqfdijbF2smQ7iKsSyEafIkkqXko8K1ztXJZIqhnp
	EFmEeI0yksTOt/15eXWUQ0LvD8+FADFhoOGKppE8nJ2t6/xbsEYkZ8ki
X-Gm-Gg: AYBFou35rx97t9+Ow6YCO5rY7aisu2No+xBkcqE50KwmtMPdR7Sh5mo+ZCXYs0ENGhn
	wCDyrm0dW1VVOnRFXGEW213R1ADFlZeYHXashobp4Rt5ULj5QmeXbbgTHFeq3rsSLE+beSW1HxO
	Z7QnYxv1wXxWkAJT3wG2lgo+J+VMphlqrGrD6SyCnH50nyW+h7T2VA+3mMbyATXjWFoZZk50vCO
	/NCeZR0Tu/32w3T514A/qH4Ax69WBoi+78GOlNayG0hFRbVeY1YO45c9ILCyYB4cCbFqd7jUqCa
	e77s651bLTrBa8T2X0fMdiCOb1GFrfUMMgBKr/R1zvgcsWT1n9ulbz8JPl7O/Q1qMtsgr0u6QSL
	iXeBbRDzrwxXYC5aRB+u/+xpLDTuJGmOV3mwuoNmlCGiVw0yIM/oTe76FgxWQIUraJ5kMQW/dly
	ENjVi3x7P9INWhb2xJj1xuEC0t4+hQeb/18T1RNRchdtUB7xXYprg39eZQA7EXEvt2WezO9vFXJ
	d+64+PIiBnxXlab5bFewAF+0PjVs9qqK3iqaCdd5z+eq6APZLh7dWgk3y8nrKxs+tvPyK74xpVb
	m47JEiGZ9hk=
X-Received: by 2002:a05:600c:c08c:b0:4a0:1e9f:64f6 with SMTP id 5b1f17b1804b1-4ac12193b17mr206341205e9.0.1793649303477;
        Mon, 02 Nov 2026 11:55:03 -0800 (PST)
Received: from localhost ([2620:10d:c092:500::7:f93e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm199719785e9.1.2026.11.02.11.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:55:02 -0800 (PST)
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Subject: [PATCH net v5 0/4] netconsole: fix target enable race and configfs
 read locking
Date: Mon, 02 Nov 2026 19:54:48 +0000
Message-Id: <20261102-netcons-fixes-v5-0-bdada2f03563@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XNwQ6CMAwG4FcxOzuzdesAT76H8TBGkRkFw5BoD
 O/uRGPIPLb9v/5PFqj3FNh29WQ9jT74ro0DrlfMNbY9EvdVnBkIMKIA5C0NrmsDr/2dAi+UVSS
 1AlMii+ba03yIZM9ilB0+y3ArT+SG96d3rPFh6PrH3DrKOfwtyJOCUXLByxLrmpBMkdvd8WL9e
 eO6y/x7hJ+WQphUQ9TOGoQKsa70n1YLLSHVKmpprcuRqswYTLVeaJCp1lGrHDMJwhmlxVJP0/Q
 CDIK5unsBAAA=
X-Change-ID: 20260925-netcons-fixes-93a3e14326b5
To: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Stephen Hemminger <stephen@networkplumber.org>
Cc: Gustavo Luiz Duarte <gustavold@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

While looking into the sashiko report about local_ip_show() and
remote_ip_show() missing proper locking [1], I noticed a couple other
places that need locking:

Patch 1 fixes a null-ptr-deref when enabling a target races against a
NETDEV_UNREGISTER event.

Patch 2 fixes a use-after-free when the local_mac_show() callback
races against a NETDEV_UNREGISTER event.

Patch 3 fixes yet another race, in netcons_netpoll_setup(), where
netconsole could miss the NETDEV_UNREGISTER notification and keep
holding a reference to an unregistered device.

[1] https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260814-netcons_ipv6-v3-7-bc0915e8c75f@gmail.com

Signed-off-by: Gustavo Luiz Duarte <gustavold@gmail.com>
---
Changes in v5:
- Add patch 4: netconsole: stop waiting for carrier once the device is unregistered.
- Link to v4: https://patch.msgid.link/20261021-netcons-fixes-v4-0-3857120c6340@gmail.com

Changes in v4:
- Add patch 3: netconsole: fix target enable race and configfs read locking.
- Link to v3: https://patch.msgid.link/20261012-netcons-fixes-v3-0-1aac85ed7665@gmail.com

Changes in v3:
- Use target_list_lock instead of RTNL in local_mac_show.
- Link to v2: https://patch.msgid.link/20261006-netcons-fixes-v2-0-ca652d55fd4a@gmail.com

Changes in v2:
- Resending for the 'net' tree.
- Link to v1: https://patch.msgid.link/20260928-netcons-fixes-v1-0-bb5ffe5e698a@gmail.com

To: Breno Leitao <leitao@debian.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Gustavo Luiz Duarte (4):
      netconsole: finish enabling the target before releasing RTNL
      netconsole: read np.dev under target_list_lock in local_mac_show()
      netconsole: recheck device registration after waiting for carrier
      netconsole: stop waiting for carrier once the device is unregistered

 drivers/net/netconsole.c | 42 +++++++++++++++++++++++++++++++++---------
 1 file changed, 33 insertions(+), 9 deletions(-)
---
base-commit: 7308ef8b4a6779a39f68d053c19b53a5c584a663
change-id: 20260925-netcons-fixes-93a3e14326b5

Best regards,
--  
Gustavo Luiz Duarte <gustavold@gmail.com>

