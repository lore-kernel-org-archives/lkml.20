Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413925;
	b=LKEiOtH7nSYAXnrdOjP7HrWub3t0Fr8Id1vyxlBILFjOustOnMxWvw2DZcYI40eP0mEf
	 Rc6lyUKSlQB4BGnxRDCM9j0SpAaMBCbzOzu8g+Hb6h5J23z+i/rhri/vZRumz3IZRdAKX
	 +A1a2fFqIkbZ5ijK2bERD1igoeGDGQcpptMLhfb4bC4wjPqOD0dKKyKY56PP4UUuhx8I5
	 2u+jOMyoXB2FB/j09TKPU49O6D2pvcy8Xgd/WGKZ5i6aPgY2nBtpVbHTz7XIQJ19vZ6nh
	 wtt2n5Nm6k/63hjA+0SsweHhKBY71I9bqnov9vuhW5jnan07mcJ5qM9jnJHhBoJTvYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SQTg6mu9eOLnWguJd3WECuqCcHwaFD0TQuF9ZQxG35k=;
	b=VnOtOZQ48gwe6Yg/oMUARJbAZAP57/7UA2GECdveup1Dy9taE8qWg65dQnIbkXZJHNbt
	 aSEj6BnUkpKr/TEfkGX9u56AgQylszjKfk2Yea6Y+EUpbfXrIpqjepmEfUmKal2U3ysh8
	 atGd7GDZxctmxUhuMdpf8tj8JekeE/jjzO44yGmafKnJ7omU7DVXo5f3S696ogm5a/Nxu
	 Dt2SSc98Sntk4lv63j8o6xeAh5H4iphqjApNnP8rk43988NEqSCI22aknZGWFisgj5+fA
	 AMxcGO38yQRext7QOG3PIw/ds6A0knOFu9m7Cs19nFGNEBpdgFMnP7gFp3uaeG/UUCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b="L28Sy/53";
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1127D60A383D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1127D60A383D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=L28Sy/53
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-491971ac844so3144143f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1794413923; x=1795018723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SQTg6mu9eOLnWguJd3WECuqCcHwaFD0TQuF9ZQxG35k=;
        b=L28Sy/53fBIDZZA5JNFU3qj7CHWSZMS6zMvqhV8cs690h/ubOdtBbR3+T/B2a7JVTk
         rVQVjtZ+HqfCHbRp/0W3IInVub3vTTcOBJt8pKiQmJO2Ber1TGHkM5n0BVt2BU+d9Ary
         aavTVlcexyEZgM14fKIqNkE/GB45NFm9ffMvANhq1eJRoG2uv2PW3l7E5Bwq/W6assIv
         ZK9Y4cPi5d2/UR6x4cWRCzl3aK82HlMQGOCtZY9uEqEtVmi7T0mMDSY9bkKbKo+cnCLo
         7ZzDuiGmLS4CMjK05w8jpB1fQBJYi48vr0kfClvaYl7dc4aZfhNgZmNnCoEIR78ktG0k
         wj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413923; x=1795018723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SQTg6mu9eOLnWguJd3WECuqCcHwaFD0TQuF9ZQxG35k=;
        b=dhN7P9ZTNXFPPJHjPue2Qe0chJyIePxDgB0OmsCqtVy7bvNXGaPl1KCMKxEzWabTQB
         ce+AOs6TTadUPpfbN+MbPGhEXadSj0CVxifFuUcDh882jVB1Gsuv7zGVowOZekGhw26N
         cab1xpov8SRuwPrz5SQfFdVsd69lwX9GCar5U+ztFum7MyrvE5X26M1+MW1lDuL/nvuN
         szPz8OqfgPKarvrsnPPzjqyVbaVikDQPM/466kBkL5HGPKtInfE+GDI/U75eyvplQm0A
         Qjh3YanvdfVgVFic7Z8HhT5lZDXXiyqFvt4ExajVOOTaxMvipXpC4gvZpt3jI7UMz1tV
         FXsg==
X-Forwarded-Encrypted: i=1; AL+hErHEGijyylvyojFM/UmB79p0jxph/o1ssNh66QpPvSCzk10cXiT3jYPdrVqOnTN0M1SH9BX7mCm4Q1riVUg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9HjIi8fZd6EaLWuvvQ3SF1FTjI4a7weU7UeFu+VAySb0ycSXy
	yxza97kfmnQpTXWIgbTQIo7+eN+mh9JzMAGY0fEf3BAX9c8ee9TIyazdQOZ9YCBNWC8=
X-Gm-Gg: AYBFou16IzgURfJSqvxbedQZrgXQRlMpueNUg26nPD/+eJranQ5leuGS3ZK8PohMph6
	nrzElGXvfXHpmsvzoEoQA+Wa/B2iq1NC2vSCfnehaQECyM1MO3Xd8WPTctJTof0nxc/gdEoCyqS
	peXJuiXDQZQ06e38/s73eOWHwI1heUgH+Bc0QOm7CCOWtMj7v8olELHddm/xP3jV7CZirrsLwUB
	X6pWVzbbZXnKc7RnpmYz4FtwpILcUiA4ODS0plm4YIRJmkVKrqydTBezF4h3sxHVjJ9daLclmiM
	4+oCbgZFfZ5dHlldmL+csFu4c6pMJERoA4tUNWTcsZlXFiA7tnirdpRVhP+bhslAGaf4Akwqrk5
	9n8/fbyx86uZAXLxUB1k3Je3XBpxJzifAjCCnnG/SHEDnkImGtCCeDgdesHYnh3WIAb9SAQJuic
	4Z0VTzBSC5Rd0k9H+55IIpRSQo06j4Ejj7dl1zOH0Hywh95doQpFscdbFt5aiZoME0YZv/2ogSP
	sibWxCsDKIYnaLi65cN9g3FHszpHDqq8GRsuFGavkJj4EP0uhliKRdkmL4kJKWRYn7Qlz9p9SSj
	g7WmbPub3D+a5tN9S7v+/uv2Om22VSZkjLm++PZFZBfVghoLnhPsf+OdFeguyo8yza1gLpwpRGn
	URMM6Xj7LM+fD/G7+g/5ztEPb6wq+iA==
X-Received: by 2002:a05:6000:993:b0:48e:7508:bc20 with SMTP id ffacd0b85a97d-499c38bb64cmr5066357f8f.2.1794413923390;
        Wed, 11 Nov 2026 08:18:43 -0800 (PST)
Received: from raven.intern.cm-ag (p200300dc6f4cbe00023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f4c:be00:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983600bd6esm12209506f8f.28.2026.11.11.08.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:18:42 -0800 (PST)
From: Max Kellermann <max.kellermann@ionos.com>
To: xiubli@redhat.com,
	idryomov@gmail.com,
	amarkuze@redhat.com,
	ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>,
	stable@vger.kernel.org
Subject: [PATCH 8/9] libceph: fix osdmap use-after-free in ceph_wait_for_latest_osdmap()
Date: Wed, 11 Nov 2026 17:18:29 +0100
Message-ID: <20261111161830.1336485-9-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111161830.1336485-1-max.kellermann@ionos.com>
References: <20261111161830.1336485-1-max.kellermann@ionos.com>
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

ceph_wait_for_latest_osdmap() reads osdc->osdmap->epoch without
holding osdc->lock, but ceph_osdc_handle_map() replaces the osdmap and
frees the old one under that lock (held for writing).  The function
waits for the monitor's reply first, so an osdmap update arriving in
the meantime is likely, and the epoch can then be read from freed
memory.

Read the epoch while holding osdc->lock for reading.

Fixes: bb229bbb3bf6 ("libceph: wait for latest osdmap in ceph_monc_blacklist_add()")
Cc: stable@vger.kernel.org
Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 net/ceph/ceph_common.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/net/ceph/ceph_common.c b/net/ceph/ceph_common.c
index 67e88f30409d..39a0ddde3554 100644
--- a/net/ceph/ceph_common.c
+++ b/net/ceph/ceph_common.c
@@ -863,13 +863,19 @@ int ceph_wait_for_latest_osdmap(struct ceph_client *client,
 				unsigned long timeout)
 {
 	u64 newest_epoch;
+	u32 epoch;
 	int ret;
 
 	ret = ceph_monc_get_version(&client->monc, "osdmap", &newest_epoch);
 	if (ret)
 		return ret;
 
-	if (client->osdc.osdmap->epoch >= newest_epoch)
+	/* ceph_osdc_handle_map() replaces and frees the osdmap */
+	down_read(&client->osdc.lock);
+	epoch = client->osdc.osdmap->epoch;
+	up_read(&client->osdc.lock);
+
+	if (epoch >= newest_epoch)
 		return 0;
 
 	ceph_osdc_maybe_request_map(&client->osdc);
-- 
2.53.0

