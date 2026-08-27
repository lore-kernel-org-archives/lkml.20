Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD64E2E7F25
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787817313; cv=none; b=H6oZo1XJ3Mbko3t3+h9H7JMCVMe3ScWa5eviy0TRMDQWOPHfJU/gIkQ54HW05FrDvgssRA3jglP055otOLbmW78RfUdsBeb8g5l28fWX80EBxDnOks95qxTP9YyiWnLk0RdDancGkEvXomLGpox9Frw87Unaqm/N1shSjH2Vvl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787817313; c=relaxed/simple;
	bh=chploxg01RCtkX+bkpeAfG8l7gk0FSv0pjMUj9gd69g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VwomxeFj4y3yMK0glmFdjHFtIF5DcLaYYbYi87Nt62TykntsyAX0VMzEJ4F0Sv0te+iKIbWHbFFRyQNSyaOhoxDHbYhdlEVY2LdMHq33gRUfIxGZGY5TE+RHCy3Q6VgHsMmlY8YIgCdpHevWSd4Gzdk0lTXaRnvxY2beSJEXofg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard.org header.i=@beagleboard.org header.b=QfHzokXE; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard.org header.i=@beagleboard.org header.b="QfHzokXE"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8548db7428aso912051b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard.org; s=google; t=1787817312; x=1788422112; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VgkBfW7YLSVyPZj/IxEMEbW8eMDtz2sSR2ELowijJwk=;
        b=QfHzokXE5dvVPTf1vFyeu929zZFeldrPt4r/MBfitTixGUgQBnGhgMuBVyfGcsnTvA
         NI3h8lrmuxG0P2AO5v00p6lwW69HupTXIg/IyoWdK94xO61FKI3SbPdIhGQjWpE5dt3V
         t99uIWuMuDTtDtpHcwp0DQFlQfvJ2rbw/jj6maN4Z5M2DFf06OpjGWNxaX08//3FBw1K
         Zq0CbS4XlL8O5jhJplo5Lcq8I4mvEKkipEUrmLZEHEdaoHveKN4OfUMxN7kHyUFXN2Ll
         6ZSrt9XdUYuP3XhMvN6n5bAaAZDOSYh1Ki1FyQMwg44mtPG7YJQRW091zWodLzIa9ylq
         W3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787817312; x=1788422112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VgkBfW7YLSVyPZj/IxEMEbW8eMDtz2sSR2ELowijJwk=;
        b=LwLgUw5+3puuzYRGiGD5lQYkPqx+RHQClQTvkcG/s2+IdRzo7fr62ziONmgarjtN20
         Hl8owFFBzvD8UcbFWO5XqMpYe7a0K2038NmnCDk5/7m6oCrpV/DdI1VcUgWEAvd1Yq+Q
         OSFPpNF6eAgPmadAKG8R/PCWw9fI3Ww47exouTZrobyL2FIC/WYu+Ka6cTvJYgpjDOvY
         xUYb8QkVODagLnq/cbHDrjA94jSg/f/lABX1K6hT6gO6Ummhmdjydw+OjBGJrXo8cipo
         t2nA1p8MrL63KgbUFadTuQf4ii5OkmVFSghGhGbbny78Ig7+0MeBG/CNCBwuStf9A7VE
         NlXg==
X-Forwarded-Encrypted: i=1; AHgh+Rp0bnTj21UfXMAAwBw01eCMicsY3k+xBbp2tXde+s1Uq0YlniWBCdLVYFCZLrVeuNjloN1MFBFkQ8IKLaA=@vger.kernel.org
X-Gm-Message-State: AFuF++ktEo2eRSiK/MBAzEnphdQtsYarAoKv2POfl+hrxqXdTuvlKoI1
	mQG6VUwu9ZT/ObT8fDILyp5F18ZPPOwjnJXxWc3c5zbQGjJPtA8TQYzXUxaA4Um34Q==
X-Gm-Gg: AR+sD12TAzT9wMiYtVw9MvHTJRU7VWXRczV/GX1MeOml3rI0wR9LKQLw9yP99kQzX8U
	agZ2/mmgvSbi9pzE1jQeb7rt3ocU1UO2lY18Tsv7jv9nal5sNTnFNHesYmT8Ie8XtvXm2e4XZqF
	mfDTbcArH7aei+yevxKHZ2kh52YTJ5+AsHLDh84C/bxKVQ93iw9XKwrWRUvMLFx58Snsc97phIR
	2zEYaFAEkKjb1YIp7U4lu4zo0dqCVlpxSKHbCefbsz/ebdyyy7CD+xaqkTKER9x6ZvPjzzAp0kI
	WJJcVhJIzQpNSJcZU86A0eHavn+zvLJfBS/ADZUB9O4q9d4OUWc7JNAfBgJvEA46CEd4wjFYP/j
	dXBMSWBQZtgJfZY7I0r1wc56k2Yhr7PlCL1wesrTUMN66FmmsQBomCwqPmjzQ1cnqtur+Uy1Mhn
	IRw6tiWOZ/pX3S93ybpH0u6zOmA9EoKWNC4idX+7Y36nzfBJ35Q886U9hnyzg9DANwmqddQek=
X-Received: by 2002:a05:6300:44:b0:3c3:9070:96b3 with SMTP id adf61e73a8af0-3cf74e42f9bmr29441364637.3.1787817312017;
        Thu, 27 Aug 2026 00:55:12 -0700 (PDT)
Received: from [192.168.29.54] ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60c2b4sm24641685eec.5.2026.08.27.00.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 00:55:11 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Thu, 27 Aug 2026 13:24:38 +0530
Subject: [PATCH v2 2/7] greybus: connection: Add
 gb_connection_hd_find_by_intf()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-gb-uart-transport-v2-2-a03bb1f5fbd1@beagleboard.org>
References: <20260827-gb-uart-transport-v2-0-a03bb1f5fbd1@beagleboard.org>
In-Reply-To: <20260827-gb-uart-transport-v2-0-a03bb1f5fbd1@beagleboard.org>
To: Jason Kridner <jkridner@beagleboard.org>, robertcnelson@gmail.com, 
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
 Ayush Singh <ayush@beagleboard.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Uladzislau Rezki <urezki@gmail.com>
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2419; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=chploxg01RCtkX+bkpeAfG8l7gk0FSv0pjMUj9gd69g=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBqj+1D4HIi/qfHAW0aMKYXRP7y2AGUuKHmObZJT
 E23Cbs4qy6JAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCao/tQwAKCRAFzvXHieVa
 dANWEAC5nWXdzoG6bygb2RpHr1Gh6StNBR+RF4Sn4uvKCQbxGCOwAiDm8wKT8Y3r+5QFnVyJCgi
 xeD/NAquzS/EtXcDsxFPSnGYQsCXeEJ7wAiooLdNswj80XhSFEuG3/YjPgGuKKaXJ2HYXDmtv4c
 M/mgx1bZMiVl+IbZmTKVHqGm5Mx8GJ1aOH4cjwbbKD4xIjAQZDFU0LYT3zDVUJ3/BkfaR3hELc5
 RKVIhvcPYFpynhyS2Ig1C3ArwkgRhjc7FNji8HGuRSh1JqanKKOZPLqu28ZYHvX/GiEeNGnVCUI
 KCeVmzP/1jZ92zPB9xgujHvRHYnAQkRLg1sUSLhX1zZZxrFaKMIKlLoi9o777lGmXN12luYrUQ8
 TE3aDhWU8ou+LeDm/t496WXCZqILPiR4kH1O2uYzhrr331ApsxGqyd8e0se/g6xSWT4DPd7g96t
 +Lb2aKsJM9Pg8bKvBfH77I5RvqTavLz9Oh0/TB48fHyS+CnWZdFlUp7GDyQayP+oTr+BC3eV6Mj
 09af16eyuHwpSJu3/p3Awsb/sYziCaI/luebQabthzaEZMipbM7M+mvNPwaKuAUJO7VeDTXaoVN
 pEMJIx1DB1lOfz20ohu51fcsqarpwsWuE1SyaVhj6z9SCYx2xXFjDHbEuYxHW+XtYDavmbsck6A
 kZshFvHyqRpLPLA==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

gb_connection_hd_find() looks up a connection on a host device by its
host-side CPort id. Callers that only know the remote end of a
connection (the interface id and the CPort id) have no way to find it.

Add gb_connection_hd_find_by_intf(), which walks the host device's
connection list and returns a reference-counted pointer to the matching
connection, or NULL if there is none. The caller is responsible for
dropping the reference with gb_connection_put(). The first user is
gb-softsvc driver, added later in this series.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 drivers/greybus/connection.c       | 23 +++++++++++++++++++++++
 include/linux/greybus/connection.h |  3 +++
 2 files changed, 26 insertions(+)

diff --git a/drivers/greybus/connection.c b/drivers/greybus/connection.c
index f8fda22bc466..dc9eb49a69bc 100644
--- a/drivers/greybus/connection.c
+++ b/drivers/greybus/connection.c
@@ -71,6 +71,29 @@ gb_connection_hd_find(struct gb_host_device *hd, u16 cport_id)
 	return connection;
 }
 
+struct gb_connection *gb_connection_hd_find_by_intf(struct gb_host_device *hd,
+						    u8 intf_id, u16 intf_cport)
+{
+	struct gb_connection *connection;
+	unsigned long flags;
+
+	spin_lock_irqsave(&gb_connections_lock, flags);
+	list_for_each_entry(connection, &hd->connections, hd_links) {
+		if (connection->intf &&
+		    connection->intf->interface_id == intf_id &&
+		    connection->intf_cport_id == intf_cport) {
+			gb_connection_get(connection);
+			goto found;
+		}
+	}
+	connection = NULL;
+found:
+	spin_unlock_irqrestore(&gb_connections_lock, flags);
+
+	return connection;
+}
+EXPORT_SYMBOL_GPL(gb_connection_hd_find_by_intf);
+
 /*
  * Callback from the host driver to let us know that data has been
  * received on the bundle.
diff --git a/include/linux/greybus/connection.h b/include/linux/greybus/connection.h
index b53aad2270d6..589721d46015 100644
--- a/include/linux/greybus/connection.h
+++ b/include/linux/greybus/connection.h
@@ -131,4 +131,7 @@ static inline void gb_connection_set_data(struct gb_connection *connection,
 void gb_connection_get(struct gb_connection *connection);
 void gb_connection_put(struct gb_connection *connection);
 
+struct gb_connection *gb_connection_hd_find_by_intf(struct gb_host_device *hd,
+						    u8 intf_id, u16 intf_cport);
+
 #endif /* __CONNECTION_H */

-- 
2.55.0

