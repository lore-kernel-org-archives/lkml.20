Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9EC3955F4
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789488336; cv=none; b=XociW2xFzhS0ZZ4/QgLkepb3mmOg0hv7GQBhoJ5vOVYPztmIdseI+3JXyBA3DCYuhwGmfS+sZr89BS0u/Xnq1b3i+xu7W+dIUmJD9jexRHE2jswgl0oh9bDk8PUAOKlcBtJlibj8U5M/IPiZIByJBlx8gelGAWDVE3ycEsVblk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789488336; c=relaxed/simple;
	bh=RS2ojj54irJqVtgopKART9dZOZwm7Vqo2VsmKNwJwzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IccjTJ4ZSYEHq1Qy7jR6rzhnIGY6rEHsHxySKIioDV9H6i3O9tl4/gKwAWRRHcb8rshW5hXOo2+Cv6SoLKYIQNVxKvUWcBDJP9z7CiuR/+8hmsn+ka3GCIxzfQbqehuvyEsT7XYpLvAfs15By7/eBMeU7W9+zDTirrc9XtPFA4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UxksmS59; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UxksmS59"
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-7856441f7d8so275373137.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789488332; x=1790093132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PVT2cVPGriuS8ppyInO1WmGGfCQOnd1cHzGccgmMCGg=;
        b=UxksmS59bWSlPrZrFITCHh7fnjhFF5o9GSKSbYZKsg1fzk4V1yy4/SOTNVVoLKf/Wi
         KnBjFSChfKuTWqGiSX/ypPLa8uDB99N03/lPkhPQswOg0I4scmz8orIIX8upQiSDq1lp
         L5LnlowNU4geU12FkV47+Bu30A7KOhbSBVCHADBVeLmDk3800tIKcsP4awEuTrypbzW7
         315wkaImaIv1jNJiqsN3O7yWHvrHJyvbwQjnZUTd+unV0L/hxjjijv5XFSBZe86GsJQI
         +Xb5r4CeebQ2I0S3XBCW15NMLVfOQ9i86Z7tbE+/V91GGfJE/meTB6J26Rg/7z1FvE0h
         +aOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789488332; x=1790093132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PVT2cVPGriuS8ppyInO1WmGGfCQOnd1cHzGccgmMCGg=;
        b=ygGk11TUnnhI/cbI9VJ81yk0Z0hQGvSQoF7/6rP4qT+5kjCAafpAJ/WFIwbloCe8SM
         1ft5mN+fiYPU6dKIIIaXW/Qu+82DXuEAeJ9vrygGfZxnTQIdpYLIHZm+EBi7qzAT6H2Q
         p/tFknK5F42Ihu6SeggZMIHcdoFfeM4gtLC0szsNC/i7lGtOpCpqBr9vZ4Zfgsn48zjl
         XNCrOfybnyARXLpOD/kDIArlwaEfIIE/kiiBZYoSt6QfSs0h+v2iPA/zA9AkkY+1URyj
         Q9Pcj6lkcPlE+ZPW6bmPqEPQbQz81b/0aF+fM/24qSjcW1kLhYsV4+huPVlRAkZ+ozxD
         PEHw==
X-Forwarded-Encrypted: i=1; AKwUvBw8XaNdKnkUoKHnoZQkZxMcRUGWoE2OlUqfp354gyD9jD+ifx1FFSgTMAp8JXeYcnV9ssVLAzeMjHScGt8=@vger.kernel.org
X-Gm-Message-State: AFuF++lHTFjejyBjK3ywALPA1PK2RuT0kKIAMr65vOA+K1aiIIz/qlSA
	c+dLhy3yzhiAeqVlaWzw98uDHI9aCW02n+lNLHR3PI02ngZK89Td6U1Z
X-Gm-Gg: AYBFou0KRfprSQRNubfUIqL0GX3pPmKhRbSCve6y4tpO6iF0HP5ZLH+uhqRy4vd/0fF
	GZt7IHtYj09wMzvLrwBm85Rd0AHJzB7mkW64vTNk0OxMZ60XJ91kmLonCcPuosIGtS90jwfvemt
	12j7PG9Krv5UPUYllKmbZmvjwvL4C57nmqkBEcnLNieJZPPkA5UAxTpzjp1PtjNJC+t8UDEa5AE
	MjPzua6eCCyZ7jZ2SI0ssHqD5DiXuWW/0hzErnQ3dZalBG+NwCTgb3Vl3/qDirKmB15YSj2CiC6
	lLdLQoqI6IkCWkr4KR7/t3YsMn3QN1BqaMyMObNfQRjUWFpAotOoL852Mf21GWQj+w087LPsxb8
	y8yWjVZxHq0dutFhf7nBwW7f1v8R7jfmDcGAbJRkAkdENDuYQ21q6LI8AaCsjIIACHA32723j24
	Xdh4EHd8eetiUx/t6ZzFSv7o6+ke6gjCH65SE/SvRx+ZVhnEOW4GGwkmaYlT+hvM+ZJQ==
X-Received: by 2002:a05:6102:578f:b0:79e:3401:403a with SMTP id ada2fe7eead31-79ed75369edmr3199196137.8.1789488332138;
        Tue, 15 Sep 2026 09:05:32 -0700 (PDT)
Received: from beelink.. ([187.13.206.89])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-79facab39basm124128137.2.2026.09.15.09.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:05:31 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH 2/2] Bluetooth: ISO: release unused CIS holds after channel attach
Date: Tue, 15 Sep 2026 13:04:30 -0300
Message-ID: <20260915160430.3108071-2-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915160430.3108071-1-qwe.aldo@gmail.com>
References: <20260915160430.3108071-1-qwe.aldo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hci_bind_cis() and hci_connect_cis() return one hci_conn hold for the
ISO layer.  A new channel association consumes that hold, which is
eventually released by iso_conn_free().

There are two cases where iso_chan_add() does not create an association:
it returns success when the socket is already attached to the same
iso_conn, and it returns -EBUSY when another socket is attached.  The
hold returned for the current call is unused in both cases.  This occurs
when deferred setup calls iso_connect_cis() again for its existing
socket, or when another socket attempts to reuse the CIS.

Detect the idempotent case while the connection is locked and release
the unused hold after iso_chan_add().  Also release it on -EBUSY.  Do not
drop it for other errors: a newly allocated iso_conn releases the
transferred hold when its last temporary reference is put.

Fixes: 69997d50ec57 ("Bluetooth: ISO: handle bound CIS cleanup via hci_conn")
Cc: stable@vger.kernel.org
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 net/bluetooth/iso.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/net/bluetooth/iso.c b/net/bluetooth/iso.c
index a461c8a4ef..329bee9c2e 100644
--- a/net/bluetooth/iso.c
+++ b/net/bluetooth/iso.c
@@ -496,6 +496,7 @@ static int iso_connect_cis(struct sock *sk)
 	struct hci_dev  *hdev;
 	bdaddr_t src, dst;
 	u8 src_type;
+	bool already_attached;
 	int err;
 
 	lock_sock(sk);
@@ -568,8 +569,14 @@ static int iso_connect_cis(struct sock *sk)
 		goto unlock;
 	}
 
+	iso_conn_lock(conn);
+	already_attached = iso_pi(sk)->conn == conn && conn->sk == sk;
+	iso_conn_unlock(conn);
+
 	err = iso_chan_add(conn, sk, NULL);
 	iso_conn_put(conn);
+	if (already_attached || err == -EBUSY)
+		hci_conn_drop(hcon);
 	if (err)
 		goto unlock;
 
-- 
2.43.0

