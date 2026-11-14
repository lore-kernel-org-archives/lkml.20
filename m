Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637104;
	b=UyslJ/FrJnZzVEvY8ZvkuhbT6JqhukMYGUsewJtg02stpmelpWTqOMSs1ZSyoChUBpyD
	 ROdmDMFkcslGUhC1IA+M5TyGR6ribDdBh0fFiTakYK2uwbvG9BnVMZ+w6v4r2bJqHnme9
	 2IFcAAk+yC7iSBhXqm7moTIsoe/sieY5ShK2Q4MfnLP0TXKDQQe2bdITSq5RI2RVK81Xp
	 hFbbm2xniuz0/VFfAwkjpm37pYbmHmQY3s7pjG4qJJWWm99PWDo2366+QY1/0ht1LGt1O
	 ID8QPeYoemI9JffaiyirwFge732L2jKQVU9At7r7NdhFLvwaPAUXMGDIWe5coohB8pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/TclRQyw8P3XuUaC5KJPN4mF+Cw73WG2hCQ7XKkVl9s=;
	b=pQtBgDtk09ZshWSdIyKQqOCxKelnpvG6YJ0CODC2N6PXEereHo/lYPXQXaBcqZA0jzIo
	 MYztm2XONOxP72OpAk73vB6bqOjEmEPSM/2ZW+lloRyjp1PWCEIOnoGONrPIfZcctNtX5
	 kmvPh9rBerAxxsztSC5xTK/VJKMyVqS07ACDyfm26uMTHOKMDBskj4yL3Oy9Uwq8ga3Jb
	 42Wv35oQUx9kTw2y0JvouV1PnH/0nPzHC6OI8dP+cLabfIfztqhqY07pg7S0KMm4VVT9z
	 ehyD5Md84saRUBO90mbBwAGvBaMRtCP2p03LJeCyQAfJWyqNAcS26VBVXH2RqMGy29A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D9xKTYcK;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DC2606A89F
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50DC2606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D9xKTYcK
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-37071c0f42aso2539496eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637103; x=1795241903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/TclRQyw8P3XuUaC5KJPN4mF+Cw73WG2hCQ7XKkVl9s=;
        b=D9xKTYcKB+TRK1GKdN3JbOtEgASNTYzA/4mvcqKVOXo6+ynYFx0uSAF2HDNkXo8wIz
         g1oRsXosGiTw3tQje1vGcm7V/fmqqhE9M5Eljjf3okLo39R8tWO148oeDHgKlJZ4ZR4R
         OjDIz1ZEfa5kfpqY2p4pne4sBSuIkJN7Ik09/3Qm/6S7C9Es3LZzWi7TyzFm5jdgdHWn
         2reu0F9/ZEcpIxoqyknWlrkmxI/ef8MMJdbbGtg/MIOVXMPoeUFQmRrDVUUg/za/I0cO
         JTafUfihMNuc2aWGqaksb4LX57mwEAD4zkVgZjhu+aT2FVEi49qOWNPyezMeziicHJzD
         OT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637103; x=1795241903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/TclRQyw8P3XuUaC5KJPN4mF+Cw73WG2hCQ7XKkVl9s=;
        b=en7h6LFYPPVJce8TutKLUfe3wVTreEyoZYbrbCqN/4rGYW0iIbJLaFZcFPigzflypg
         7Ebhh6VHJUVHU8X/pYWnC+sa/ym3gAEXb7A6/uslvnJL5+Onn0yopnbzu9kA6FCsxLxi
         nFPDyI1wFLACyySE/K6LW9tLoNCknuRGOTSU7vR2ezbckGhCxn1g6gLnvWy5kP+S/zAk
         3zYkrWTxK7bHk6xWGSCYo57YNhOvFReiIBmYqRe8fHOXlpzE6g7wYBu8Fd0zZvV+nQME
         gIlPVyPE9HeWM8ZZZ7ZGXZjMgIC3/Xrn6Ty2DIL6fcRc5rZIZ1FAcwyNzPen5Wq1/EiS
         mmJQ==
X-Forwarded-Encrypted: i=1; AL+hErGbFvHie0OYVaRynS32Uz4OluPw7/CGQffZN72cADkPMRhnFU0/ATSDF0D5PZFjqeqe+/7SelD/BYmfn1k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5Ny15jbwsXq/9+NHNPLD3hIFvT9FX/UjLvMq4/V6a4psgpNWN
	GPYDpztDbroffRQF0gl6lc2hQQLCAnQ/klPpoqIAMWJIAGjVyAGZe6mJ
X-Gm-Gg: AYBFou2xOZNhAbgG3joTNA7zjvT+LowRbvT0KylkRhxxH/LaL/IPUH4L7Heqa8Te5sU
	3H1d4q947tkUUawuzxHDeCXzO4HHEEgc0gXAWGiTelYnIVNlL6X0UTBbgYYY6hOU83TlyFTjNud
	lO/hPPNPl18RC3WQg+oIeDadflk5NL3fMmSplR/w4Rw4larhPeRHpAGMdNN7yski0Dy8dhaq6ja
	0gw4diLnbQO53iXznGY7pIBYK29keQplBEQ/qYlR2H7hrfubQfFNAwh0MtytNtWtjmrYnnaO4vm
	0RDBlPLo/U1Ak85Zg0knputT3pjMg8s9qxoHVTMOYuL/kVF/lgXGrjk50yFnmQqWl6c7buRPiF+
	vm7fehq9FPDqx8JBemu996U/xf+z+LPDpKqs6VoUURxv+GaI0IEQlR9b/sDoEeyz4ld828bV4No
	xj02WiZSM5gnOmPlPtlMmVXAE2NMWI1mTYfxLbTHpKmgzS5q+y4ws409SGAXh8Vs0dK5xyDR+DA
	aY1VLVlnaRBCxH8+zcHuuJbFoDrEASNvvgGj4qtoHAVoJTXp0R1y+jHZvLjCMrbNUbOrpz0GPRA
	MV1m05JYDHhMZN6KqcwB38Q2RcOxqwrJ8mByC4E4riy/cW6DYu0oYks0/FYdQc3XPuutBwcAsg9
	6Un3RxJpqx6flFqpAswJLQPeNmX42PcxOq3bz9uYQIs1/CGETf/gWxzLA7eGPRyuOTpFlXmkm5E
	LTOA==
X-Received: by 2002:a05:7300:f18e:b0:375:894f:2524 with SMTP id 5a478bee46e88-37966b52646mr5653813eec.12.1794637103365;
        Fri, 13 Nov 2026 22:18:23 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm13200536eec.15.2026.11.13.22.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:18:22 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Stuart Hayes <stuart.w.hayes@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Doug Warzecha <Douglas_Warzecha@dell.com>,
	Andrew Morton <akpm@osdl.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] platform/x86: dell: dcdbas: Suppress bind attributes of the platform driver
Date: Fri, 13 Nov 2026 22:17:55 -0800
Message-ID: <fa93ff8c72aa9f8a12d032dfc8422d77782f2c6d.1794633178.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794633178.git.rosenp@gmail.com>
References: <cover.1794633178.git.rosenp@gmail.com>
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

The dcdbas platform device is created by the module itself and stays
in use for as long as the module is loaded: dell-smbios-smm allocates
its SMI buffers against it through dcdbas_smi_alloc() whether or not
the driver is bound.

Binding the driver again after an unbind also leaks state:
dcdbas_check_wsmt() runs a second time and memremap()s the firmware
SMI buffer again, overwriting bios_buffer and leaking the previous
mapping.

Unbinding or rebinding the device by hand is not useful, so hide the
bind and unbind files.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dcdbas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/dell/dcdbas.c b/drivers/platform/x86/dell/dcdbas.c
index a5917093d539..601ee8ca92e4 100644
--- a/drivers/platform/x86/dell/dcdbas.c
+++ b/drivers/platform/x86/dell/dcdbas.c
@@ -708,6 +708,7 @@ static void dcdbas_remove(struct platform_device *dev)
 static struct platform_driver dcdbas_driver = {
 	.driver		= {
 		.name	= DRIVER_NAME,
+		.suppress_bind_attrs = true,
 	},
 	.probe		= dcdbas_probe,
 	.remove		= dcdbas_remove,
-- 
2.56.0

