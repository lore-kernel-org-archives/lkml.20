Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6AF559CA4
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957466; cv=none; b=ZQ+hwSjuPYCr7QCgtCmvq1v4k+9jj32zcXuWDh0Mw8iaSUbEZP2Zq/xQYO0BSvOQPuOUAvRJRVdRPCoNsCJfDE4BnT90u70Ef+l6/b7/n8Jtn+TtltmsVS20Whgc7gODWYcLkzLjQTrnnYZTZVnPe5GlRS8iY4b3DP/tf16QfNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957466; c=relaxed/simple;
	bh=3+ese/BC7ABQtPNeXTWrPYUi2tWpSVRo5ACoFFtlpsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HqkH8M0auResG0CPdipQnOpP2lovolvgGMLA3shW95KzrZmy72hSRd/KuSHtnNy7A2sw1kQ7VRqxXIXjfc4A+gh90XSQGKt9+kvmE+sRRWBconK90nKJOWbLysgBc85JtgtiNiJxv6bTDHPmW7A6oqx9DJLlAgmJ9KmsyyaV2o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=bk6wRSPB; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="bk6wRSPB"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-868cfc5c244so100519b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1788957462; x=1789562262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lVbHlHnf4CwWKZF41ARDlFSQjSg4eEO9OdDQSzP1YhU=;
        b=bk6wRSPBMtx6Jo1Qm6kkuv9oSKbxX9A4Siz2pZnLbU+5AD01yi86DncZVKmeWooNJq
         h7muHQD8ccwflhAxDqmdRvVcdiTGT997sQWf1nc0yzwFNwj+W8VNki+uhFbwAMYmwQfu
         g+kXFVamRKEq82nc2/JmySfFHgU4ItBKEKP/I9iO4T5ysMHG4fdR5b4WKq5iE/G+IvhA
         pFSO4AX8CDrLkXIS0uzXZgRdsmrlmT6DBUZK1mXvDmqJBP/GAq/qGDEQjZZSS5eshW86
         T8XrUG5f8skQNzP9AIgnx5Sm+eVhh6pBzcy98t0mlgWvD1UF3ZyZ/S/p41iVWKnltxpc
         xYfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957462; x=1789562262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lVbHlHnf4CwWKZF41ARDlFSQjSg4eEO9OdDQSzP1YhU=;
        b=KqjiuGy7malWIODivj+0BUipXXtQdm9KHT7/YP/tI+5nS9e8FnJnuc2Vo99dh4TU+/
         /GoVanzoeHjrBB9yMa/JcO4tAfggsxyFCSJafHFpIocWRTChWS2u9sl5SDRPxtHFkMwL
         /DtBKiiaV0hxgISFYYo4Q3IxTrSN8KF94LNT4Pd9eeFiCtMcHBG3d6VN8EnlSFbvUFsB
         ZaCmJII0Fi/qtHFR4Oxex1d74VMvc8KXKQKGqGDXGfYN01J5UBAXzz2s07n4xmEKDCYw
         XcN3G4W6uQXxY8/q3Xa+Xqs1JlQ0ldLmjW1Hm3/oOeDS63tjINgwFLuILf5E6dmNqLlR
         Uw9g==
X-Forwarded-Encrypted: i=1; AKwUvBxhLwkyWg1huE2E4VW6mo7/YMm43UkqQlYcgYDxm4nF8/We4IvixaGMUmevcA5MHwuUL7X77gf1BLqdGM4=@vger.kernel.org
X-Gm-Message-State: AFuF++lNeu/n8NX86lJn7ufcbIDKohtMOgyiFnkwZlEyBS0aBoQjhoPC
	lgNQVPB8k6xEbgL2tj7oFMGenrLr1Vi26kOaW+tFAsIXeSX3mKJke/TAYfX3Yg7Cepfd
X-Gm-Gg: AYBFou2zzdooHJz12lteSEi/boNk3j6HCsFaPRS4OyRBtIDrr93STXj85hDk1DABytT
	j5wvJ3iV2j1N9Can5N8zLbICjNuF48VyJ2iV7hsYbC9qe62Rx2B0ytwJELF214p5bul0z4fgFtR
	xyWVdxMUxaKzAI33Bg8rlL07TAxRHaKC2CuOV5oPBHOuj5MRQhqeVJofRmObg5bfNosYLLDBI5c
	Xfo8TNa3ACz5eNoXeDJPPLGsUJ6TMxEV+2GEKLCX3EtY3G7ETtI++EjtVnyt0XPKwJLIrOIqkZf
	/Tsfe6vpse9rHk0N6Gg0uEkvr5bmlkckXTft7KckXIPsXDVVgDkHwT+nAtfmsuVWDBiw6VPWCVp
	zdCtvIQFsYM5djeyvQh6olWTB6jGa5ZHp6C1iXPqaIdFc1cO86FznVxwPMRLX1pta1ThNOslemY
	MKGmmPVKQiGqiByeRxHOQUOXwvWVH61LttBHsXdJFzjZ1zsY425cnx/Tf84o5v9NN3uPb55l8e+
	znQ1Zg8icpm8hXBxQph/3ZQlD2yDw==
X-Received: by 2002:a05:6a00:985:b0:857:7384:b5fc with SMTP id d2e1a72fcca58-86948d28ecamr1113151b3a.24.1788957462456;
        Wed, 09 Sep 2026 05:37:42 -0700 (PDT)
Received: from b6ad5085b32f.. ([122.51.212.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86153027951sm6828614b3a.40.2026.09.09.05.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:37:41 -0700 (PDT)
From: Zihan Xi <zihanx@nebusec.ai>
To: Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org
Cc: Zihan Xi <zihanx@nebusec.ai>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mariano Baragiola <mbaragiola@linux.com>,
	James Guan <guan_yufei@163.com>,
	Kees Cook <kees@kernel.org>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Alexander Popov <alex.popov@linux.com>,
	Breno Leitao <leitao@debian.org>,
	Alistair Strachan <astrachan@google.com>,
	Tristan Muntsinger <muntsinger@google.com>,
	Cody Schuffelen <schuffelen@google.com>,
	Greg Hartman <ghartman@google.com>,
	stable@vger.kernel.org,
	Vega <vega@nebusec.ai>,
	Luxing Yin <root@tr0jan.top>
Subject: [PATCH v2 1/1] wifi: virt_wifi: don't transfer operstate before register
Date: Wed,  9 Sep 2026 12:37:18 +0000
Message-ID: <f5a832fb0ab228ce6e2b5a91fba4ca8b79198a2f.1788948455.git.zihanx@nebusec.ai>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788948455.git.zihanx@nebusec.ai>
References: <cover.1788948455.git.zihanx@nebusec.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

virt_wifi_newlink() calls netif_stacked_transfer_operstate() before
register_netdevice(). If the lower device is dormant, that queues the
new netdev on lweventlist while it is still uninitialized. If
registration fails after that, for example because of an invalid name
such as "bad/name", free_netdev() immediately frees the object. A
later linkwatch_fire_event() then use-after-frees the list entry.

Move the transfer to after netdev_upper_dev_link(), as macvlan and
ipvlan already do.

Fixes: c7cdba31ed8b ("mac80211-next: rtnetlink wifi simulation device")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Assisted-by: LLM
Co-developed-by: Luxing Yin <root@tr0jan.top>
Signed-off-by: Luxing Yin <root@tr0jan.top>
Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
---
changes in v2:
  - Fix virt_wifi_newlink() instead of dropping events in
    linkwatch_fire_event().
  - Fixes: c7cdba31ed8b, the commit that added virt_wifi.
  - v1 Link:
    https://lore.kernel.org/all/cover.1788500348.git.zihanx@nebusec.ai/

 drivers/net/wireless/virtual/virt_wifi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/virtual/virt_wifi.c b/drivers/net/wireless/virtual/virt_wifi.c
index b69a4650fba85..48afc2432f93a 100644
--- a/drivers/net/wireless/virtual/virt_wifi.c
+++ b/drivers/net/wireless/virtual/virt_wifi.c
@@ -558,7 +558,6 @@ static int virt_wifi_newlink(struct net_device *dev,
 	}
 
 	eth_hw_addr_inherit(dev, priv->lowerdev);
-	netif_stacked_transfer_operstate(priv->lowerdev, dev);
 
 	dev->ieee80211_ptr = kzalloc_obj(*dev->ieee80211_ptr);
 
@@ -584,6 +583,8 @@ static int virt_wifi_newlink(struct net_device *dev,
 		goto unregister_netdev;
 	}
 
+	netif_stacked_transfer_operstate(priv->lowerdev, dev);
+
 	dev->priv_destructor = virt_wifi_net_device_destructor;
 	priv->being_deleted = false;
 	priv->is_connected = false;
-- 
2.43.0

