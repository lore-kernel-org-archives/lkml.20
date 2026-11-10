Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298589;
	b=VZLwahoiO9PXyv1wl/LPdg8EgHOurbIs036l27yGaQD8UDs+NS/8vNKjMDgEHnRbYMP3
	 6X/PRIKbzLodHF5t2F55cs8Fl9Y7eZIKsKJuW/91MZooraPVpcwk7xQjytOoLVfiOsSqP
	 jN1j8hnOZy5fh+Kfdpuo4J4DMYMQQKfNGV6daD5yvKmkUwNQnu3a/5Aks1t0Z3bKuKX+z
	 rDmIfgMgZlSHHVa8Lr+80Okaq7zxpkdDpt3NRQZsXhe3qaVR0rAQKEveXcMWB+ytvwsr0
	 f/u89KxQR/keZ8CDmgOBsPgKlrDrJDzEaLXl4AFxipzV+LnM9gEZhysBvNxycSbITZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=esd16OW0Lew55lMSuVcuYFtBqCpJVqbCAV6xh+QEm90=;
	b=FFBkAuzocFoMGHfNIwJ4iFlWbhAHOqu05fD2oC4Yy3ySIt1ymS8/YylqbyTDX0remjKE
	 gB9HJdkN8kqe8Uuua2/Vb548BX24YOOVggCo7fQ5ktGRmMID2BaduVxcGkSm7FJuuka4i
	 cfbrQEHWOq3CVF5DPW3ZNEnPcWhiZUkZPIRMGxMGlzsyaqdY0mwrDYmerfoimGEds31JV
	 HsPGiQMs0hyqToOc2gGKOe8QHp/I4kBvjRFTdr1iHoklMBluuq/DPd+gd6SREFOlvIK3N
	 CpftMg8oA5fwhWGQ5lbavhGl7SiQ9xF7zbq5Rdzc4s5nL7+9lFNxZwQH3U10mhJpT1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="V0Na/iiX";
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE86B606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE86B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V0Na/iiX
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36dbde64409so3536010eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794298588; x=1794903388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=esd16OW0Lew55lMSuVcuYFtBqCpJVqbCAV6xh+QEm90=;
        b=V0Na/iiXWy/VFC6ieE8aF0WK1gJyWNvHVUnhFTLz1RFUla88V7kBM9+2FGk1gOSYvR
         IC4jCMJh1zL4B8buij3ENxsNmGscbnxX7KmvNjjbNlPZ4GwzgQlcUXWKWL4Sn3wibf+9
         Fn3+m4gl5xkrzxUmfSOxfdimF42f1Rsu1Jb1o50kjOYNt6Fwt4i8nA9AjgeQSGTOWR4K
         clFU+xA0kMAIOSTrMwF1C1TznV78jgZPkb1DE8so3tYpJjzyNdSgyGXepC4g3cho1j58
         BVVWYq7gCGSqqPxpmnuAb1cpw/cafYk/2wWR0ExjrGHyhiaHfuTBSux9IyWbmOMsK9Mf
         bsDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794298588; x=1794903388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=esd16OW0Lew55lMSuVcuYFtBqCpJVqbCAV6xh+QEm90=;
        b=us8qNl15HIBi6Y3HStHW93rBLD+NCSMufxVkw2Q54Db0iPkQ5FlFMOo1Aep7eksaCF
         NNpwCOG2VyDqhT48TRZ49YVhL74FFoOprnOT2B56newUdc0v9tPrFExBmYXkcNKMRcap
         dZPL0oqItsEZE+xXGD+SW4aDrgFy5b6Pte878r7e1pH3pj2UIs9Apg8JCfbo10sztWDN
         Cm/8/pyFrysQ/+9uPjwrJXiDKgqv10r1YdjDfc8yx7vk5AEKM5wycrXsLNhf7Psu+rMw
         Bof5zcFbuNKKSweezFD9GdYtLns5nz2XatysX5bPuepQ4CqEVDp71B6KiDT/CE8v+OUX
         6nTA==
X-Gm-Message-State: APuU4Z8AB6vmWO0X+mtqdLpbqEM3Lm+W2GBeCvJKbGG4alJJZA0cQb6d
	leDlLrnyeYNxAqIDF8VL62O2TPM1sB4MEfkySGlhs06PGyJcKO0es95qZ/GuMb2k
X-Gm-Gg: AYBFou2htkwta8mmjWJ6v9J15PV3kwjh7dHlgBzoMcNSr2PAhxDejK7BCIb1o6dEPeO
	d7+vNPCXqwLQSFMKhs4Mn9/iI7zlP6WPOFzIQpoVROoK8NG2r0AhofnMYlvQeCDDiddmVR8bgdG
	EP8iBTxCeOy8P3ZT0mGJKJ5/gDviNijo/Wsu0w64UJFX+onDNJjbU4zMDd2Rjt2baaWy6q+FwuY
	pPLgifyCbVcK17397k4ApqaLgCPS6q3t0/8G3Zln+h389LFSGFmC+zhsyPnj6x85evZZlw2i8pe
	j6vHVROqL4MVVYnBFo0liz9qfr+z0CRhid0tYqZuiNOmTOh4FfmJovtj2TxEGOzlxzrsFpXtSrQ
	jS5vuSkKXsKNyIkv7iDIt1ZXs+uGlv1r7Nv1jN/exp4PacKmDbqpauwRZFbdKmEPMkb3DvwR+P0
	gvWXiOVwj59IsQoDmsUxLNk1OdG4oNX7W2tSLYfWLoKN9J3x30AzCOGnh9oyNOeNoNIRkDcdcdy
	efFT4vfhKPkm755fDWuXEMGRyPcX0kGf5t3VDWJuOcqFQn88KqS9GePWbsj7oAXvajcics0rJ2U
	0PZ6CjahJjXX7PjiG62xeHc6qaueHafOQ9r8wVFsqzbWbC4NkZQ=
X-Received: by 2002:a05:7022:6985:b0:182:6c6c:d876 with SMTP id a92af1059eb24-1b3b6037d0amr3423422c88.8.1794298587594;
        Tue, 10 Nov 2026 00:16:27 -0800 (PST)
Received: from localhost.localdomain ([103.179.231.66])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm10891140c88.10.2026.11.10.00.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:16:26 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: hare@kernel.org,
	hare@suse.de,
	hch@lst.de,
	kbusch@kernel.org,
	kch@nvidia.com,
	sagi@grimberg.me
Cc: linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH v2] nvmet: synchronize DH-CHAP secret removal
Date: Tue, 10 Nov 2026 08:15:59 +0000
Message-ID: <20261110081559.2730-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
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

The empty-secret path in nvmet_auth_set_key() modifies and frees
host authentication secrets without holding nvmet_config_sem.

nvmet_setup_auth() accesses these fields under the read lock,
allowing concurrent secret removal to cause a use-after-free.

Acquire nvmet_config_sem for writing while clearing the secrets
to synchronize with authentication setup.

Fixes: bb2df18958b4 ("nvmet-auth: allow to clear DH-HMAC-CHAP keys")
Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
 - Add Fixes trailer.

 drivers/nvme/target/auth.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/nvme/target/auth.c b/drivers/nvme/target/auth.c
index ccba84b1344e..8fe521690ccd 100644
--- a/drivers/nvme/target/auth.c
+++ b/drivers/nvme/target/auth.c
@@ -26,6 +26,7 @@ int nvmet_auth_set_key(struct nvmet_host *host, const char *secret,
 	char *dhchap_secret;
 
 	if (!strlen(secret)) {
+		down_write(&nvmet_config_sem);
 		if (set_ctrl) {
 			kfree(host->dhchap_ctrl_secret);
 			host->dhchap_ctrl_secret = NULL;
@@ -35,6 +36,7 @@ int nvmet_auth_set_key(struct nvmet_host *host, const char *secret,
 			host->dhchap_secret = NULL;
 			host->dhchap_key_hash = 0;
 		}
+		up_write(&nvmet_config_sem);
 		return 0;
 	}
 	if (sscanf(secret, "DHHC-1:%hhd:%*s", &key_hash) != 1)
-- 
2.55.0

