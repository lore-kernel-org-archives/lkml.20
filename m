Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592386;
	b=KabKMHN/79B5jDEanFrL6I9m3fbZxHKWfGUyjhaAHoUyqQdJwfhXkjWtA2M6EaD+N2PO
	 h/AbDFOk9+hFhUZToqS97Yi7u7csYJ7FZ02hWVsC+WvtBx0zijcXghkv4LtTw8nhvXP3I
	 Lx0f33xuIgZ+PNCzBWvPjuTc5W8qsOWbVd6Ziui9UX23fWJzh45ZNm6cj4vxUb/LghTe3
	 /TqM3G28jvQbO2ItQkRavovSn8sfu1fhCav7wRv1YCCMGHV5SKz1UcBr58MGMd/awVOtC
	 s77l4JYmAFp2aGPdV7hGiWa0xmnbRasFHB6K0eGnyFhNDZ1fqFJh0O+44wFvAO0ZjrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=xZE1hno674x2taHCO5d6NjAT9iH9OyhYJiZL+LV6wH4=;
	b=OW/HFWBrd1+6K8+Q5dJ6jvVnHobc+yHoSb9MSSZO9L0yRP6HWmktviVYNdEXM1/zAu7L
	 GxwyRq/YDutrsZDHKa9/uCGQIaJfpVAD5tHTqHBeDPEwLri0/i+Mi2ZT+6c95em/BjjIX
	 n4ln5HSX+HRRpXrXJ1E/I0/98m4x6i0mXr0qkRSXS2k9UB902ZsyaSuGZb9+IF8zz3Uq6
	 iVmR6mjlMgH0d76ZAIZsZ7w2ZnJT2Yhkf7q194f37+baBKFUuZU7R4WwEIup+IMMqTsFD
	 4QcSEEcltWYm9iQQIX68j6fmCbWDJNw9skkd5RI6vmMblorTY2f6DhgzQBxlob9RoFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iTkWpyyc;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76077606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76077606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iTkWpyyc
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1b0168fafso973075e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792592385; x=1793197185; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xZE1hno674x2taHCO5d6NjAT9iH9OyhYJiZL+LV6wH4=;
        b=iTkWpyyc/EjfBErstsZseyJuQgR+H5M3FT/BnZZoAAAhQTUda00m0YXs10NTKhcm/e
         UfqiycjE+MTIImowm1JutrP42yeP6hf5dcSmH0SerVFExLtSHMNFIDibbsl9NLgTQrZ9
         WKLKcp5Fvk/+cQX1dSFIGSO+ChLs2HhW1WPuqDU8dq2IxhfxcKNkZ39D5z23mkcLx1VO
         8NA3CTEHz7uzUFF6SnzDXzE7C3s1L4UxpBsJmJqtsPYtJ5i1qBuVZTBN8lystUiPd711
         UmDFtojJ5tgC3ZTGrZMlXU53NAo9w3iecR93uNWiU/hAyJ64TWIOc8V7VtMh3Cg3S6vh
         SqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592385; x=1793197185;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xZE1hno674x2taHCO5d6NjAT9iH9OyhYJiZL+LV6wH4=;
        b=w53k0vRV8/1AivRB116j2Y8oXnk3klKxBm4AVLNwPDhpxvISID7A02OjCNCGTqrulj
         BWSWQiCThmXruQvxk7xrsnFTE7lEp3aq3BRbn3phQxJRI12avhZfvAaeDVlyjctU8u0O
         nasbTF8UqtqdNIytXhbP3i6ge56AQMQAhyO469Ble828fia0f48lkp75N1hIuBIyGHis
         R5PelkA0FWSE3WgONjzSQ4ZAGxCPvmQZhDVxbMtdpow6B+nzeCkNb6Y7PYgoPpyd8Rha
         SV18Ney00wjGDRGQBZ3wMhSsVOSvJ3fDR4L6duC6GZBUjdbu8PPe2+QSU1DByazoJQvn
         pDtg==
X-Forwarded-Encrypted: i=1; AKwUvBzVTpkzcdgM16ivY1KIsw5S8aMI6foU3YRgkgVdVD7yGl07jUfVigA8vBzlzFNB96FRHyVHGn3wc5fbJto=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEgsDG7WYHUvfI4xCg5uNe5KhSpLN5KTJ/PyefCN3HKFo7WQqR
	jXhxqP6XX0PSNLi7veSoUC3no6xGeQjBUY97Zo6Mlp9+fQIoj8Sk6o1n
X-Gm-Gg: AYBFou2kGCIDMdvf4XJAQLQHEv1b7LHeuqHH5ACE+t4A2TCvLKCvZX7kaWikSwkKWCJ
	BbxczRbWcYqt2MgM9ugAJABK2CAZarT5A0cQSJR98EYoLGDT1Hyu/wTtwE8jSl9rpVsU+PLzDSn
	kCO2TgJEY9z4sk2b9aR4MgSkaCNIaBdDz+YW+U/jGTuV/7zci7Bpo6hiCrAzHZPZTEUNvZLvup3
	KImSb8Awcu7Rv6uKHSYnQYXSSCRHjUrEva/qZ5JR4zMliYkD55YRd1JcWljNeQIqZQS9bzetQv0
	XmSlBHfS8zlSykGh0lHWipKUjIF29iPurdJ4GjnHfLttNnV71l+qkoXx0il7j09sY1Di+/J4yKu
	ZGUhJRsAPuayx/5kNJdUxyYLzQhP4MLGDDgSZuGV3LN+wuk1wemY7foRFB/8A1X1TybmPnvOYY7
	VCUyA8RS5IjGpSj4/LQxATL1r4kwngDifliWKmbNKBOXKPuBestuNns+0966pKSXNWWiY9w7uMI
	KH+ji0pO7n+LdyGRi2OwsZ0GsjLC0lJnaXoMz9ra86ui/cayV8WqFTn
X-Received: by 2002:a05:600c:3e87:b0:4a1:d899:b633 with SMTP id 5b1f17b1804b1-4a1fdae0e9cmr45391125e9.1.1792592384342;
        Wed, 21 Oct 2026 07:19:44 -0700 (PDT)
Received: from localhost ([2a01:4b00:bd1d:5d00:1a26:c015:c64b:f840])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a201d7ac99sm19837805e9.9.2026.10.21.07.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:19:43 -0700 (PDT)
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Subject: [PATCH net v4 0/3] netconsole: fix target enable race and configfs
 read locking
Date: Wed, 21 Oct 2026 15:19:04 +0100
Message-Id: <20261021-netcons-fixes-v4-0-3857120c6340@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XNTQ6CMBAF4KuQrq3pD1PBlfcwLtoyQI0UQ5FoC
 He3oDEElzPzvnkjCdg5DOSYjKTDwQXX+jiku4TYWvsKqSviTAQTiuUCqMfetj7Q0j0x0FxqiTy
 VQhkg0dw7XA6RnEmMkstnGR7mirafP82x2oW+7V5L68CX8Lcg2xQMnDJqDJQlAqo806eq0e62t
 22z/B7ET3PG1FaLqK1WIAqAskj/tFxpLrZaRs21thlgcVAK1nqapjehKyJlPQEAAA==
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
Gustavo Luiz Duarte (3):
      netconsole: finish enabling the target before releasing RTNL
      netconsole: read np.dev under target_list_lock in local_mac_show()
      netconsole: recheck device registration after waiting for carrier

 drivers/net/netconsole.c | 40 +++++++++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 9 deletions(-)
---
base-commit: abeacca61eea4f6803df4a595b656ea45c2d3249
change-id: 20260925-netcons-fixes-93a3e14326b5

Best regards,
--  
Gustavo Luiz Duarte <gustavold@gmail.com>

