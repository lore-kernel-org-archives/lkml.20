Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927343;
	b=h9w6RMGcCPpUMemukWhW88KJ9vE+X8IK1G0xI33Bu3IOJCuD4CGWIzgW1CW2v/9hw8Jp
	 FmOPWMUQlulrL5oL+kC5Wr/lE9E9AV7VZHpRluZRaobyylvPZ1rpo4hkVyDMOQv1y5Ez0
	 hL0gshbKCLz3ppx4sB5AJzRoTngLi2OW5w9c4Ayg4RI+TR1lKnveCs+zB8+D+jUqoHu27
	 DNnjDtBmxVjrm4/G5dAAw+9+o9VE+deK6SY0Yza/VOhyW1TMyUidCgFm9VSkzPo9MU1My
	 j1h1gpGNn8l4BmaVES/iD8Bxzflyb73YqEyY6/lK9IByoJsaUL1TmJfBA9GcoUfQ6UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=HLnUN4SFxuLePJET60hqALFh8R854ScCCjNPuZCVkMs=;
	b=rqKhrL0G2YHS6+68+igWmTwmrnDZB2+s1tbn4aIqNd2R3jIAiWmvZFfS9hXKr1Bw9+EM
	 Sk3WggLimKLwOESQDwhCy8rCCckoHU+djNPezBuxh1xUBkHoO56CDt5GDcZpmcOLfdogc
	 OtTSehykPVXnS9IWs2xk1w3xeW7gNaYoX4hTpLkEHBZvjeyEo/BGXO/qQlHwZ+K5sYnPS
	 mKaAfNckIoXhT1BY2vyXqqCUYCJl8w8vpo74xfMkfOtR1+SypL5xc64se/iSQ+Pe9PdEC
	 hISVTJuQ3cuX7InP45hkDhkKCKQeM3lU8kDaDuyENYBdNQ5J7ckJhMDBy77Y3ylN+dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stani.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NvdE1A0h;
	arc=none smtp.remote-ip=209.85.222.197
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9DB606A880
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC9DB606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stani.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NvdE1A0h
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2c0e6653so500935785a.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794927342; x=1795532142; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HLnUN4SFxuLePJET60hqALFh8R854ScCCjNPuZCVkMs=;
        b=NvdE1A0hxlUkz6GJhAxddDB40AtROW+rNaSpm/1Bf+iC67LrFamdjIgMurLaP1pOLb
         QUANGGF7o/pvk8tuIHbLsNjpP+G/aGHAWb/1bBZ/ocg+69WIP5fuIobG5Y5WChPDTmV+
         XUXX+C9ObvQY3s9Xj+FH13NdOg+uvXpJbzLdsdVhPcHurDgZw/jsCZqAGpLUao75Dt/8
         /EVVaO9avdpREJX7Ti4kyitwcyLe95+z4wNGyxupNPwpEIz3StA65jrBX0AbsnPlQlfc
         maw0Gnv+ENPMzDvWUinYtG2Im2yeB2QFAE6nrc368MdGpMv+6/AYtHCa2WV31fQgzcc7
         NDoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794927342; x=1795532142;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HLnUN4SFxuLePJET60hqALFh8R854ScCCjNPuZCVkMs=;
        b=QBgJWJS1XlcgNrlD6tOjn7TyIWeVGY2ghA6uIIxhDugqr/c6cp5SV9PE6VkICEc3x6
         LDT83Ae8IRAY4sa1WlgaTRvrqIWuC7EA3RAtxhgQHbR3Cw8iQi02W6lv2eFjzAPC7v0z
         dT98/257ARD16eEg7M1QKeFxJfA7tagGU22kLw28usvRcCXdQ6qCIzJ89cAhsmrGXNB5
         L8+h3u0YV7gTPDmPk87a2Dmo1mSMrPuoiE/ihSQvAeW/+qQbC59NfYcYoD78Z9NjTYNg
         x/FvrRrCQvfPyS/QsG1AUAmj/kI530LZcJKNH7Sr8KHHHnvaLgiUcSQveu/qZNV4LF4b
         kjig==
X-Forwarded-Encrypted: i=1; AL+hErHn1VgEjWp0jWKXe+n4BW/Tt2fh1ojIz3HOTTg3edriRgvrkXPvLPTaVwvpAl8tu6HwBSfWBGD9FUAeVZE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jn83w5YbZueKqaJXHZKqCWJnUJNDRX70YJ3z/l1FA1tkCI5Et
	A9VOnoOQ1YTd+pf5r5sJ56f+bwXFsUt39aact5MAtUIb0aqt2j+5/XAqDaCx9OrK1fPhimHHIUS
	jkQ==
X-Received: from qknvm11.prod.google.com ([2002:a05:620a:718b:b0:93f:43a4:a480])
 (user=stani job=prod-delivery.src-stubby-dispatcher) by 2002:a05:620a:bc7:b0:944:1291:6cd9
 with SMTP id af79cd13be357-9494bbeb488mr2333610585a.68.1794927341308; Tue, 17
 Nov 2026 06:55:41 -0800 (PST)
Date: Tue, 17 Nov 2026 14:55:09 +0000
In-Reply-To: <20261117145522.1910636-1-stani@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117145522.1910636-1-stani@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117145522.1910636-4-stani@google.com>
Subject: [PATCH iwl-next 03/15] idpf: make the mailbox workqueue visible in sysfs
From: Stan Iliev <stani@google.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, intel-wired-lan@lists.osuosl.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Decotigny <decot@google.com>, Madhu Chittim <madhu.chittim@intel.com>, 
	Emil Tantilov <emil.s.tantilov@intel.com>, Sridhar Samudrala <sridhar.samudrala@intel.com>, 
	Brian Vazquez <brianvv@google.com>, Li Li <boolli@google.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Daniel Zahka <daniel.zahka@gmail.com>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add WQ_SYSFS to the mailbox workqueue: the workqueue attributes are then
exported in /sys/devices/virtual/workqueue/, e.g. to inspect or change
the CPU mask and the nice level of the mailbox workqueue while debugging
mailbox latency. This is one of those cases where, when the need arises,
we wish we had that flag enabled, see https://lwn.net/Articles/967016/.
The PSP workqueue added later in this series sets it too.

Signed-off-by: Stan Iliev <stani@google.com>
---
 drivers/net/ethernet/intel/idpf/idpf_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/idpf/idpf_main.c b/drivers/net/ethernet/intel/idpf/idpf_main.c
index c855572c5315..566d5804c8c1 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_main.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_main.c
@@ -319,7 +319,8 @@ static int idpf_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		goto err_serv_wq_alloc;
 	}
 
-	adapter->mbx_wq = alloc_workqueue("%s-%s-mbx", WQ_UNBOUND | WQ_HIGHPRI,
+	adapter->mbx_wq = alloc_workqueue("%s-%s-mbx",
+					  WQ_UNBOUND | WQ_HIGHPRI | WQ_SYSFS,
 					  0, dev_driver_string(dev),
 					  dev_name(dev));
 	if (!adapter->mbx_wq) {
-- 
2.56.0.679.gc527c65306-goog

