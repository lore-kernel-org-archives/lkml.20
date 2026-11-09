Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794244918;
	b=dNgmQRLNheIa7EwDqHqMcX2yMPpR7p4ePzN7Q1Kqtca/tzslOziu7FnX9qdiiDYN2OIf
	 6ClPDzIQCVzeoeiN+fxuP91I4zXOXPGUTxMymXgnccRU1wwR8nNN7X0XL4gv82UiqlBV4
	 kKqCcCT+ATBsURr560CIKMZjmc5xTrDfsyt+JeT0hN/0GCSWT7z/Gx09fM7tbIn6JgO/H
	 qeTcrzvDZu1Pi1Z9qf5XFeX0eDUH8QjP4w9PoxO8WU49JYWG5nSlhfh15lsy4xC8PF1Og
	 Ec8PFuoMQojJCfwOyCqu5FTbDubExcxCid5mp0koTQr2iKKLOY18lV5mraIxAfJKrDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794244918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FylPiDKpV6Uqon3wL6seZPAK0gj8Jy6XAVftoBAaEmA=;
	b=cbgSnBsXtpWPAx0eTjVX04UmQat8ObqRy9P5CL3NCfpcNMbCdSFwVh/Q28BJjpAzPzIN
	 /6qSLXaH87O38+oXqgKe0yPep38zdPyX63V6bfjnAjrNyywZ8466wbF+gxGAPHdAgliwi
	 dD32AWXZEX8UP84FJAlekB50oSQlSh9uU+cHW+//8cGIx97eISgZeF+hMvCzrpX6x460G
	 lqD3vBr9ivngTx7LeE5zhwgDeTRJH1Rz/HueMbzJCEDSM0Pgbhsm3/FJ2w2WqF9Toffpz
	 LdAPzE6vfGnacRrguKvMIOiza4pMV1XA1EmxBsX7UGSxoDYl/h8JxBcfHGjJI4vNmzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n7yNEmtk;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA074606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA074606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n7yNEmtk
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15dd124bbe7so891381c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794244917; x=1794849717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FylPiDKpV6Uqon3wL6seZPAK0gj8Jy6XAVftoBAaEmA=;
        b=n7yNEmtk8n5vxuOaeRSbJVx6lI/CuO5X5XDdQmZZliEOordOtFH2x6FOluS6ijSLqL
         pf5NUII/6sv8KwZq1oCs7gTwm8dl2e9Ng3MR89cpOJ2eQGLe0vC3LkNtfM7oDJo9i3wr
         hg58QGCEtJxlEIHOJrV917HR5gtoqIR6ZCTvGQk/qaTaqVQwK7wttRzY7q22nrn3Qz+0
         kMkk7hyDktGEwKY+fiMOMwEpg9QW/iYwuNgRlaVc5R545lBkGQoT4pcsKwXFKDiFoJ/8
         AZacfpzRQBvrOfR3oYC69mz3YjZnjrYQwial2gizh5iM1iy3YsQSnl6QTTMsETj7sKPF
         ZfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794244917; x=1794849717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FylPiDKpV6Uqon3wL6seZPAK0gj8Jy6XAVftoBAaEmA=;
        b=Y2P4Oisw7clQlA1Au4PTb69gXUd47nAJVWAZ/4lD1LFOboNNgpDhy2YwJ9fVc8mngR
         ODGltpoLeqfrOf/pSQTQOsAyaREl75j6OVSFQUNGItsOgIki3kwCO+FuOMwq2RDPr6yc
         zkyFOiYcd69GWCdoeZmFMsq+q8MPK8e6A5mKjuXOOuq8yKvM20kxgzBWIhl+bc1jFaCk
         H9oEYkSsyoqpGC9xR6Lnf8NjtkRt+MHfFojSPNrevS/VxmXJxqyGzXETqp32pM9ix1Zz
         r45LF3MEsfbDHagcXIcxbHonklp5GqkBodVtxAI4oFdgi6RtNvH5R/gYPciwpjKKGnAP
         9ewA==
X-Forwarded-Encrypted: i=1; AL+hErHLQUO79IheOg+eYTPv4z2dMLKnVpBydgQUUydBqIQYOyweSffsrjmg0AvqXXZ0v7zKyRKeB7GJJsDKhxI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WohfXNawRw27GxaGC/F+bjv3/nw1ZfvH5OglnYEcFEa6TX4Ob
	XxY+q1UFveDVC3tW0SeT3Uj6vZ+jcSgeO+fMzYUOjyyCVlU/V6uu5qor
X-Gm-Gg: AYBFou0YilQAPHg7iHjEcCxYsJl4QDw3hpg4kiNfxTMdO31zVImzjc54RMkF1Gg+tbG
	0RJWYInu1hO30jahGrUDr4wuB+rb5F8Rfv3WA1b4hLfL47VA7WJNS7lgzA9wLg4c3KgnAKrtFW0
	jgNAV9KxXSeMqA8azNuTL8Si6HvudpdXkhx1z7LxO67qcB8yuLwxgX5BHpsr8GQ/AKvZT5dIjZq
	dLCOgDwtMzGnoAMGsbxwBPw3NWE/42nzREL8P8tSoo72XzJP2S0C8062UhZTOWJWCn4Q2N7tFm6
	tDQRXB23EJabwgnWRjlZnPh29TTI49W3i2UoiGy47XGs96DnzHSy640J6wktBy5M+RU0WHAsvvF
	RJjFP9IIMk4gePuMc/D5jVTwlIs6g5+QVeG0fz60W7dqd7BTtL/JTk7LFs/0D+PSpwvTD1a6rTP
	w/cjayUUJcUe/KoVsvBBbiJA9dA8EMzcXzzrFYxYc8gyoSOY2slwd6eNEs0zoZmiJq4D1rFsRkF
	oaeltJdleEHvDL6V3qx5WoYr7zHN2386V4gTHQwlv3K1KxVS3biiDR7TG/xzMGEdhzj5kkvsDpf
	wnJUB+nGPNrZupM50YND9CDFhnA4ZWJoSpO9SRCRr5D7tFvg
X-Received: by 2002:a05:7022:3f0e:b0:15a:2b63:a0cb with SMTP id a92af1059eb24-1b3b6054c2amr123720c88.13.1794244915328;
        Mon, 09 Nov 2026 09:21:55 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11346sm364288c88.7.2026.11.09.09.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:21:54 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Oder Chiou <oder_chiou@realtek.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] ASoC: rt5665: cancel jack detect work on removal to avoid use-after-free
Date: Tue, 10 Nov 2026 02:21:44 +0900
Message-ID: <20261109172144.1851173-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

rt5665_jack_detect_work() runs from the delayed work jack_detect_work,
which is queued from the jack IRQ handler and from the jack-detect setup,
and the jd_check_work polls button state; both dereference the driver
data via container_of().

struct rt5665_priv and the jack IRQ are both allocated with devm against
the i2c device. The i2c driver has no .remove callback, and the component
.remove and the .shutdown callback only reset the chip; neither disables
the IRQ nor cancels the delayed work. On unbind devres frees the IRQ and
rt5665_priv while jack_detect_work (or jd_check_work) can still be queued,
so the pending work then runs against freed memory (use-after-free).

Disable the IRQ and cancel both delayed works before the chip reset, and
wire that teardown into a new i2c .remove callback so it runs on unbind,
mirroring the sibling rt5682 driver.

Found by static analysis and code review; not runtime-reproduced (needs
RT5665 hardware).

Fixes: 33ada14a26c8 ("ASoC: add rt5665 codec driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 sound/soc/codecs/rt5665.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index 0000000..0000000 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -4837,9 +4837,19 @@ static void rt5665_i2c_shutdown(struct i2c_client *client)
 {
 	struct rt5665_priv *rt5665 = i2c_get_clientdata(client);

+	if (client->irq)
+		disable_irq(client->irq);
+	cancel_delayed_work_sync(&rt5665->jack_detect_work);
+	cancel_delayed_work_sync(&rt5665->jd_check_work);
+
 	regmap_write(rt5665->regmap, RT5665_RESET, 0);
 }

+static void rt5665_i2c_remove(struct i2c_client *client)
+{
+	rt5665_i2c_shutdown(client);
+}
+
 #ifdef CONFIG_OF
 static const struct of_device_id rt5665_of_match[] = {
 	{.compatible = "realtek,rt5665"},
@@ -4865,6 +4875,7 @@ static struct i2c_driver rt5665_i2c_driver = {
 		.acpi_match_table = ACPI_PTR(rt5665_acpi_match),
 	},
 	.probe = rt5665_i2c_probe,
+	.remove = rt5665_i2c_remove,
 	.shutdown = rt5665_i2c_shutdown,
 	.id_table = rt5665_i2c_id,
 };
--
2.43.0
