Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234304;
	b=cjBEsVCHcmm7+w2SudM9/+sD0LAl7aoAYkvAPQ/e2Qv6GVlOxvyfmKrJMasesHoDUs8v
	 eKQUAVS7TvbtOoVDyp6sY6lIIPt9+oZM3AwqGYB7H7i3NiHceC3z3LbsAcOoi7P0s0Mpx
	 lfBg1Vv7zgH15a5V+LkwZxm6ZUFV3xpYfC6tAWCEVCwe8E3MjJITNSH/+v8IjJtUAvF+S
	 PbRS+H6Op49iG/bEFfXUT0Uip7GCKHIvAUSj6xgwb+mEplm76FDAlLEikDYve35A+NScJ
	 YeahdIwkVlNlmVAw5JtBj4OUQ+VrFvhgDEP9vHXVWroRVlUarDQRYnDuxMS8lT6fKYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GbH9hEkRxL7poVnfKttfcF7GkxvjJPt+uCTzdn29ebA=;
	b=aFfjGQTY8KL1DfhUwvMbckPsBOUiakj0jyzXIHX+yZ0B7UWfDtOYSah9FZL4ImVuiHGz
	 saMpXza6YqjaRKR5ZN+zpktLre2KJ7DrPEmy5HLC/ZSD8DD9551S58RPNHpKpwOHSJmV0
	 xn7XDjX0GdhpiBDCQUf+VRDY+aQ+pbf66SN4Jf3QXUWysUsMU6kKlO4cxc6Ud1d7Z/AJA
	 bsD3WhBI2FWeVpuHi4bIVsq9KiUHE89s5ql7Fr9gZzxInwe/qt58K68Z1RqTQZJrtlXVc
	 0FHlNoAnHxMW/fia8+qa2A0CP0UVPDo0/XqZgTOfzLYbSXWLkTNVvxzwpiTUNRdhNbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Z84m/HJC";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CB0606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:25:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8CB0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z84m/HJC
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36e795af1d4so766283eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794234303; x=1794839103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GbH9hEkRxL7poVnfKttfcF7GkxvjJPt+uCTzdn29ebA=;
        b=Z84m/HJCfCEuqEv/mTlOVa0iXQatdrs27xfDhlKwCMbsssoQ4i0x94wzLOpq2FeZgD
         Fp8Z45ayJyWYEJ+ZCH5XaDNGfz5bW6Ypc8ggi7mZFtPbdnHhRvTyb1y2nwKm/arTkNvS
         mDtJsk7sThj44H4LOyfOMoRiutai89ezKvE6xjI1rWI7xvrfLP409Z/IYIy3jWS7yYRC
         zNu+lqpEQY9xOBNcFajOPyZj/I1kCv0cdE6BMroWHt6Y0DZglY2B1oH1SeLE2crfRjVh
         ccDkUBB07KIoZBQfg0Z/GM6OL109aJrIZS0TlaC+pCqoMmPHspJlZ8KhyqZeA3EONc6E
         9DTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234303; x=1794839103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GbH9hEkRxL7poVnfKttfcF7GkxvjJPt+uCTzdn29ebA=;
        b=eOGCuhc83ywUDABUJZ9BXAMrm8TkEZ+yPlNtvkh28cwMSPjnf4SE02MkKr2WNJiCSw
         uuyyiT+V73Mg2Z0xR94xUl364AsaNscPQh1/0+tk/1TzatkYW+C9AfFB23FmT8OBNKsp
         Xu0ar9DewFX0CEplSQTXqVFteDDhlFfRa6dHzuG9peOfC8kJx70bHvhVi4u6S1SAOxQr
         dlIe++TBwjL/a1rqieup1aJDRq6Q8eK5iorng/R+zaDDX6lRtHwh6g4NdbRyhUOKySBb
         sfNnYSH5LbJGKTLNpqz0PnSYhHdW6kRbWKSVF5txagA38jhEgNu+JHAK9zWUHkCNjHbK
         VyCA==
X-Forwarded-Encrypted: i=1; AL+hErEPf7o6GHy++bOetgcY7A2hDwfZ/f2uMWQ7X1DQDtENBWqXVngFoirI9+zM7WdmBzIlmgBCTY++18csHOg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FCDlRa+0fd0fqpq8G2dPaIG1fE8yGONbjjhEEg3fidp+97LRd
	v4THDlITLRyvA/cyrNpeKUbAza3k/w8LmvTSkqcqQcDPrw2cgpxqdDOE
X-Gm-Gg: AYBFou0eDbMoTKUTMXcfTPxju8xfo6NYuk1V5lVuUx2WlksSrf7E52PDDC3trRI/KV9
	vd2XHxA28rao9Nf2xQrSlKU1QKLNKw/EqKxjR9x/jiPulex/DkJbriOEaWCgJyV1o4Aag0gzl3H
	Temn963T5Iw5neOAu8hXwoqwVrEU3Ft1Yjc2plBCIunyb/3ECa58DnqvXhwA/ZrQY3dGylSOVMV
	EyOUpXeiQ+jKp1GLltkImy6uegqaAhvfwYAA2GaQ+liyZzb089arvvf63Vr1JVZpe0S7W/eD9S4
	xtCxhQ5ZjmU6jcLb9yHqEOsfNixCTlgJE6ykqdU2YiAc3pOf1ZHChuQ3QB1uCozHtzfaOt4Nz+R
	QwgS8v0zqpRBTwiPJhLwpgrgJ7UmEwfsYR0JFCcg0p1PK7m12V/obQvPfW1/eszFagLqJMx4ntA
	BdiAAGWIP1UpFZSLtM8ezVEhVUVYwKtDHrnkVcZ3TjXJTitQ5eRycS5MQ+NI4nGwff7JHVKvwHQ
	IHhxnnag12UKDs+wbkTM9OrrN/rGG/MsxqGh08fPJAmFXkS/MMgipkH3NPQopBOMMb4eumsgnKq
	V8bCNAz6EiROu7ki0pI7Q3d0CvBCOb/dijxfEkUERtiDdYr5pg==
X-Received: by 2002:a05:7301:dc1:b0:362:2e2f:c261 with SMTP id 5a478bee46e88-370f8269e2cmr10965596eec.27.1794234301815;
        Mon, 09 Nov 2026 06:25:01 -0800 (PST)
Received: from localhost.localdomain ([103.170.54.70])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372661ede11sm16138027eec.21.2026.11.09.06.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:25:01 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com
Cc: hare@kernel.org,
	hare@suse.de,
	hch@lst.de,
	kbusch@kernel.org,
	kch@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	sagi@grimberg.me
Subject: [PATCH v2] nvmet: reject invalid write-protect feature values
Date: Mon,  9 Nov 2026 14:24:28 +0000
Message-ID: <20261109142428.2612-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261109135536.2772-1-sreekuttan2156239@gmail.com>
References: <20261109135536.2772-1-sreekuttan2156239@gmail.com>
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

The Set Features handler for namespace write protection currently
accepts unsupported values. The default case in the write-protect
switch leaves the status unchanged, causing the command to return
success even though no valid setting was applied.

Return NVME_SC_INVALID_FIELD | NVME_STATUS_DNR for unsupported
values. This also prevents issuing a namespace-change notification
for an invalid request.

Fixes: 3a1f7c79ae6d ("nvmet: make nvmet_find_namespace() req based")
Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
 - Add Fixes trailer

 drivers/nvme/target/admin-cmd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvme/target/admin-cmd.c b/drivers/nvme/target/admin-cmd.c
index f12d83098644..ee8be237485e 100644
--- a/drivers/nvme/target/admin-cmd.c
+++ b/drivers/nvme/target/admin-cmd.c
@@ -1223,6 +1223,7 @@ static u16 nvmet_set_feat_write_protect(struct nvmet_req *req)
 		status = 0;
 		break;
 	default:
+		status = NVME_SC_INVALID_FIELD | NVME_STATUS_DNR;
 		break;
 	}
 
-- 
2.55.0

