Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793081641;
	b=pAWbHWU1aaQgvu4NzU9hxY23r/gGAHMBMOuzfA/b8WBdd9+S2aQ+LI7CKBf3prKzE/bW
	 abF9n2xx3i+b/4QJpnK0WtTMUyFrtxOLeqn6eU3mRVftOW08KjWqiwk3McpNzzKQYdRle
	 xAWVasmatlmUzfYWz0pTbRKmaohCTXMCwSSqwEXnf81SzDyBxUluUhZtIkprZpr/Z1v5J
	 BLXSUV21UHZwcdgcVx9mSyTEm7yYbwYuKwfQ22YgJ2FGGNZEHJLIJfy+nztvpB5JdpySy
	 nTzhMxkW0uwsci47GeJcspA1WNt8WAIsrkrRadXUjfEGswxaG4uRCUNxvFrznG2er/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793081641;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=apJEl19/S8fcqq/gTXB8hKHO07qKnqlfNRNaKKIMO+E=;
	b=O2O0ScPtF0vEz7OS3i2J2sqLXVEgcF/uD+q5hrooeB5ZgoXXKSHI4KChdFH6QPt73o4M
	 vZsARIzoW7IK2q+zMjo+HIwC5MjC28tAcKCP6WkvyvJy/aP1bUx60o2zjFwGd3ZRXUhxS
	 fq2oBa5/CpAFDjjSS3BVHaAym/WHkGTsYee8jtBeh9zD9kuumE9Fx2DUPN0ZQkjjFvr7J
	 lkkQHKZES4Z/ZGfnORuOpymx5C1vb+8JJ+rQYOFBaNmTfNJVioY6FyzDkC+57t7EL0e1D
	 Jo2q/sryJh+BBsOJ18aNcTnOShmf70PS5QvS67FN9VvitYQZbGj/xW00Lr4cqeY9+Nw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m7YxG0Uc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91634606A31A;
	Tue, 27 Oct 2026 06:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m7YxG0Uc
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793081641;
	b=06EqE+ARSR4sZoYn9Ct/Bjodxkt0/Z+nc/SI1Qz6cxa9VSCKrs81IxkLg5tuV5+KQZe+
	 +6/b7SqD6rR4QKPLS2Gjo/NYf269zbujv6AwB3IWv/aLKRV7s0ZJXJeQ61VekbNBaNS+3
	 3UbuR4oM0rzIj8CQpHnIHKuFTgwaLorqDB98nXhSTCosKRC4fI4bQDFvgnbzpIi4nHHNm
	 2dteWqcfXcxRq0szPoB7fXDeZfmIwqQTr6Psp9lps+ag9cejTZo6GhJJHOYGGgZF5oZp/
	 RAybXK0fApZLvTgw5HuKDZxZ6E6HXioZ2QpGPpDTlQG1rvVY1bNpS68nxSddLds00UA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793081641;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=apJEl19/S8fcqq/gTXB8hKHO07qKnqlfNRNaKKIMO+E=;
	b=1M+0hsdppsoNRkhV+Z/996XQsCrRzoAwlxX/s4WhdHA1Y4wYd1p1dIy5soJvl38Ameau
	 CcGTC8LGe9h4yNg6GTd/XBtB1AQO0wLRnMRCdC80uaPWjQ7GpNZZQZRk5SDjuCzYzAFaZ
	 gc1fyfqNmXMQ48O8vdsfuRJDyv4MBDaVhOGTO5PyMqFZ439sw+JUpCM/dE+04uEPwWoSI
	 TOVn3lafHE22h3QnoUUtjWTUKpshGX51dc2zz3OsFWO8gFrfATLiODivCOM7xwse6B+H7
	 UD4McSP1nzVncvET5kcWLfGmtC8WtP5y0KZP7qirjORmCADyo50SGVxY/88iKJNXiaA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A9D481F01825;
	Tue, 27 Oct 2026 06:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793081641;
	bh=apJEl19/S8fcqq/gTXB8hKHO07qKnqlfNRNaKKIMO+E=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=m7YxG0UcMvFGDd22edE1fymG+bVMYGK03h6HDHXu0PIuVoz2dlqg6xXNKuzefC/Dp
	 9XFr6rXDUoTfgVCZ8bOReBvNh21QNdbfIR9a8iAg30kGjadJxe6QAoPUtlRlx8nKCh
	 ypja79upBapb1rjWJD2NGDfoKrWGlm9GKodIvducQ9spWH+xLY7fmjXeN7bgI/FNkY
	 zcLvN9yzJp4DMmQTRzPyYuj0QN38y7BZzh5k15F5RdW2J7MTCcYECedtb94tRMK6HD
	 6fAiBcxzrtEnFdoMayZASe1H1MYn9G0lGezvyxaUZUuXPccKzn/eeKxIBu5/7jfNP3
	 rrIq1FTnqshjQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0655D44FD9;
	Tue, 27 Oct 2026 06:14:00 +0000 (UTC)
From: Ernst Persson via B4 Relay <devnull+ernstp.gmail.com@kernel.org>
Date: Tue, 27 Oct 2026 07:13:44 +0100
Subject: [PATCH] ALSA: hda/realtek: Extend quirk for HP Pavilion All-in-One
 27-ca1xxx
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
Message-Id: <20261027-realtek-alc274-v1-1-c0eae15d0c55@gmail.com>
X-B4-Tracking: v=1; b=H4sIABhB4GoC/yXMwQ5EMBRG4VeRu54mdYPKvIrMourHNcKkRSTi3
 dVYfotzDgrwgkDv5CCPTYLMU0T6Ssj1duqgpIkm1lykmo3ysOOCr7KjY5MprXPLpWlLNI5i9PN
 oZf8Pq8/jsNYD3HJf6DwvyefPMXIAAAA=
X-Change-ID: 20261027-realtek-alc274-005a287f8edc
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 zhangheng@kylinos.cn, Ernst Persson <ernstp@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2032; i=ernstp@gmail.com;
 h=from:subject:message-id;
 bh=VjuNIrX9RVYCmjZADt89pdF/VDabfyZw4IScOGTvRZE=;
 b=owEBbQKS/ZANAwAKAfbNHl4MU4sXAcsmYgBq4EEnT1xsuGtL6oT5pZmYnZVxjc43epEUXcz8E
 6QOtx181QKJAjMEAAEKAB0WIQSoaWiqhDU91g8HVDb2zR5eDFOLFwUCauBBJwAKCRD2zR5eDFOL
 F8dAEACnnamrJQfV7VTVON4ycmgT8fHr4F+LIP5c4DD0x4oM+MzOB6VDYf42kLOFi8MEwpQuO78
 zJZMWMgZaI9L5b7LndK0gx5L+bQMdrx8/OQlykzO+Wu94BnCVZHUzrl13gfO5Xlj5ApM2ZGBqts
 D8ITzC4yrCbe4xcF+oFOVbV6jaRZJWtg+xOxfEt9zXTP+Zum7/XSMfMeOqXaBVHOi3AV5OnFz44
 AIP1PWyTT0pbSK5U6mn+WKeehUiXeAabHMZCwol2xv/5O2w2LtSOeGDgMkiKgTxn45DqrkoLU+E
 yjGUHXaZ2eOar0N7cJOurTMavJ01l/4dE+Nz47Lpy9Rbe3oYvbiW6MnSZoVRxk7IOl7k/k+lDzT
 IxTGi+1OHLFEvEvwllptAs8y1dVL3qatb1Zd16KcuMeTSmrtQu3uDJDAlDfYq/C6Z870dsRna48
 LzRfsd3FReMmc0R9v3PJUcs2xV2t4KW2BPJqGTaFDTCU6COzj7Q2gyzwZhVJ6DO8kd1hbWPrnF5
 GZioo37Qz7FFK6n81rgfGR2FNLRtlB9abD0CXRcpgBxi7ttAtd54TyY913Cr2qcvEk+i0An7UG3
 zIAoLZHZ5NsEY/E9NYjYum1BPZCPKvAJXp46xPqcJKd1NeluM5bk0w7VrOtG6Ln56aBfQM1zBc2
 zxs0xKSzlJmcrZA==
X-Developer-Key: i=ernstp@gmail.com; a=openpgp;
 fpr=002A73BE25C829CA09A174A229DAA1DAF1638E68
X-Endpoint-Received: by B4 Relay for ernstp@gmail.com/default with
 auth_id=1331
X-Original-From: Ernst Persson <ernstp@gmail.com>
Reply-To: ernstp@gmail.com
Content-Transfer-Encoding: 7bit

From: Ernst Persson <ernstp@gmail.com>

A quirk was added in commit 704de5697008 ("ALSA: hda/realtek: Add quirk
for HP Pavilion All-in-One 27-ca1xxx")
Also enable the quirk for the actual 89e9 model named there.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=216139
Signed-off-by: Ernst Persson <ernstp@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 sound/hda/controllers/intel.c     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 23aa175faedd..e198ce86ab4a 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7869,6 +7869,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8a4f, "HP Victus 15-fa0xxx (MB 8A4F)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8a50, "HP Victus 15-fa0xxx (MB 8A50)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8a6b, "HP Pavilion All-in-One Desktop 27-ca1xxx", ALC274_FIXUP_HP_VERBS),
+	SND_PCI_QUIRK(0x103c, 0x89e9, "HP Pavilion All-in-One Desktop 27-ca1xxx", ALC274_FIXUP_HP_VERBS),
 	SND_PCI_QUIRK(0x103c, 0x8a6e, "HP EDNA 360", ALC287_FIXUP_CS35L41_I2C_4),
 	SND_PCI_QUIRK(0x103c, 0x8a74, "HP ProBook 440 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a75, "HP ProBook 450 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 6b80b59b8743..95211952804e 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -2329,6 +2329,7 @@ static const struct snd_pci_quirk power_save_denylist[] = {
 	SND_PCI_QUIRK(0x17aa, 0x5079, "Lenovo Thinkpad E15", 0),
 	/* https://bugzilla.kernel.org/show_bug.cgi?id=220694 */
 	SND_PCI_QUIRK(0x103c, 0x8a6b, "HP 89E9", 0),
+	SND_PCI_QUIRK(0x103c, 0x89e9, "HP 89E9", 0),
 	{}
 };
 

---
base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
change-id: 20261027-realtek-alc274-005a287f8edc

Best regards,
--  
Ernst Persson <ernstp@gmail.com>


