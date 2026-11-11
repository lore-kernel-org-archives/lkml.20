Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385733;
	b=IRIVTI1E34yNYfEMysMEv2e5kungUf8eiEv+0I3jGyweq3rTLFCNpeo/katgbIjAiUO/
	 6cG6pzQSQo79+NjoVtnvhzLDO2H4MzffZ+Rz87OILQMA9KX77QB2+Etkb3T6Rig05vU3z
	 mOsi1ZO79V61Jv6/kMvyzvixbqi7stok7n5jrKUl+szp0Aw29J7EubPm6xZvPQ6O2MWji
	 vzkHvBNjKMVDCaCYE3TCgbIgU5veiPJ/rm+FQU+hopMX2lIpJ33AUVDo6HuKapLmguPKi
	 jNn6tHJD3AAp6bxLnISaZRErG56krymo4tvuoxdo6emRhahco13i5Z3rYiQpOU/glHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xkjrXuB4d4ljrfRsDmNsDtP89r5+rOTxD9wMLbDcgl0=;
	b=0H2l4OxJWSkhVQkyOaQl+okr+RdrUL3SUd2M5YAIK82zfhwmBrTrHCHkKvWzJxiQDmvf
	 GWCZn1P0Y+d2LwA7Re6CMiJq6yKYJiDl00iYrKGQKKWxDMEjUKDnlF6P+sAEm2LVmyFrk
	 GGJJ8rHnG22+0ocpuV1QIZnY+F0OPfnhLLsvxyHqpEGkrmWP72jJ3eb2j0KWPMfplspHp
	 BIzVL60A0dUXIqP5beayGswGwUvfiL2kZSpIEyvXC8LTJX6Giw3Q/ZwIH4pneRvDEyb9u
	 /DkEHnJniu8X4UedJvZZ6wHFY1AVyJj/vjs5KRc2b6qLxdmg+BT0LjPcFY98t0uU7hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DOWAkC6h;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9CE60A262D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E9CE60A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DOWAkC6h
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4697404c2bso398160566b.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794385732; x=1794990532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xkjrXuB4d4ljrfRsDmNsDtP89r5+rOTxD9wMLbDcgl0=;
        b=DOWAkC6hgpg1Li2Mi/aQy7d37STcbrFU4fyKJJrm6pxGdhkp2rd2QiWZbIgT1U/KJd
         41OFuznqeDGdJ87PVMnvqZxo7+Ot/TTT8lK2Fyf+OqOSoVpxHTFbWJd49eGjDRM0E7O2
         2mJNQgRyQfSb52el1kVNDXM9Qxuputc3B9i0UwaTIBiB+q9Fo4BrNc8CEI/ua0ZbGr9/
         5BCvvgFdQZlnX9aZ84kYca9P39vjq10Cfi0sfFc2bupRb5zMmidrbL8fkdl5I5BAnqyz
         gwEye5c8xpc0MYFgLyOX8Fa41NVUrhZmyecp7iVH2rzaHALupoqbDLRAz7JsaHQOQ2/T
         IQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794385732; x=1794990532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xkjrXuB4d4ljrfRsDmNsDtP89r5+rOTxD9wMLbDcgl0=;
        b=aYSj/C/Hx1Y3lw0/9rQLKsOqr2QstkZktXora7AMKybD4rSChT/6XSOgyb1/oI6DpK
         RyRAehAVZmh6Bwv2qK5oIDw+K+l8kx2tBeAKd2i9MVbAPzG950FZDT+Mgj4tZ48dyZ/P
         WQQTqmUH3DrOXTOCjtKZXPng9Wf4NXwiT9P2jcfSpbdBzCktg4Xf4cZnxI10laRx4fHG
         hZ7+/JEhgkcDPdQO2Ay+MrrY9jOHVqsU9PNhTh5oNtcv8Pzb7jCF2zKW5DHHO0iYG07Y
         nd0c3ENefs7x46osZGbOuAfnHlUn2W45lutzN3u3pDGPWxHb7aEBOdPreDsBfGRCIgK8
         oOxg==
X-Forwarded-Encrypted: i=1; AL+hErGrceCtvQ/qwdTt8RMLc7q0ZEsxTmEqq+ouBA4ViTxg1HmXNyLVMfx96xwR5j6jD7x1EyiWyRRn01axRo0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kMIXt0H81KsSNEAT9hVBVXfpgNewdVcgs3q1GBHWZIxJn3orl
	HYtTF5GcyWQIUkVskMQd2Qjr4cZ9ZnV7KXEq9ygw0YOjm/9gXbzRDbW5
X-Gm-Gg: AYBFou34bEgv+sQsaodBcJ0JlbvHa+JNEqBPnhRD6vjgemDJGctMy8Fl/SjCWFKPGZd
	+omWWqsyy1I3NfatCja0jv9q8VUyFKtx86n5oXR22QOvv+Kuyao4Y/JUK7/HiQnSIjF+2nf8iIr
	Bdg6UHWeZNF67FA8VnkHgYcbCP1SL31O2Qn3C/MfY8TgSSMTVnERyZjTROmr91ucFORjCFy6K/4
	A46xOjJuhQupjrLLwIHQlIUxodHMRuGbrI0/NQKQQvxG1Rn0eQpfWIMXVLknyZS7cJkwYiC9eJl
	4YM8LeyH6RAucyWihygA04VRBpN5u3d/1WUfXX/rzWNS/UVNq1JMsk4RSfM6iJ8AGkLiJDko+Tu
	gt3p3QxbOEFSc1ho/GAt0AB8JcgQ9qub1h8xDX43Omh0yiFKXy2h5WRbTEhljH6Iih92E2eKZ03
	eds/vgoJzJfNSU2RBwoticeFs19ZeobsR6FZehOSYWOQ5pNu9K4lQXTPxcCGoDneD1GWLk/OW8V
	V6TSdXNIjCUpKiGg/6+wKMnjhSwOgP4LG6Ygp8FAQoD1WyQbXkPuJw4jxDuuxXxmeTfJtJV1O5o
	NiwnU/iIu7AOV9bU8n0FC8qEIP4eVGgPM8Wop4c6xiUo5wma8n85xEYcdSsFuc4Z18fNEZqSjTY
	zzxxZEIljjqJbbYR+AsoiDaX1b1Lu5sY809fqA4FXxT+gukK1yqeyE4ajesBdx0ANJkjIttvCn/
	urVqy62rNNuzfrfLN0AwTtcaMH5K50RH367L7tYkIvM+ML
X-Received: by 2002:a17:906:7955:b0:c41:53a9:c65c with SMTP id a640c23a62f3a-c5066b65a54mr108933766b.34.1794385731913;
        Wed, 11 Nov 2026 00:28:51 -0800 (PST)
Received: from fractal.tuxedo-gray.ts.net (c-78-82-25-228.bbcust.telenor.se. [78.82.25.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a56ffc7sm210135866b.17.2026.11.11.00.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:28:51 -0800 (PST)
From: Johan Dahlin <jdahlin@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alwyn Kik <alwyn@kik.pw>,
	Fabio Baltieri <fabio.baltieri@gmail.com>,
	Hamza Mahfooz <someguy@effective-light.com>,
	Johan Dahlin <jdahlin@gmail.com>
Subject: [PATCH v2 4/7] hwmon: (nct6683) Enable fan control on ASRock BC-250
Date: Wed, 11 Nov 2026 09:28:35 +0100
Message-ID: <20261111082838.1418051-5-jdahlin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111082838.1418051-1-jdahlin@gmail.com>
References: <20261111082838.1418051-1-jdahlin@gmail.com>
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

The ASRock BC-250 (customer ID 0x162b) has an NCT6686D with the same fan
control registers as the B850 Steel Legend WiFi, and manual fan control
was reported to work there.

Enable fan control for channels 0 to 7 on this board as well.

Suggested-by: Fabio Baltieri <fabio.baltieri@gmail.com>
Signed-off-by: Johan Dahlin <jdahlin@gmail.com>
---
 Documentation/hwmon/nct6683.rst | 2 +-
 drivers/hwmon/nct6683.c         | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/nct6683.rst b/Documentation/hwmon/nct6683.rst
index 026515c35243..8e5cd1d7dcd2 100644
--- a/Documentation/hwmon/nct6683.rst
+++ b/Documentation/hwmon/nct6683.rst
@@ -59,7 +59,7 @@ fan reported by fanN_input.
 
 It is also supported on the ASRock B850 Steel Legend WiFi (NCT6686D,
 customer ID 0x164a), where pwm1 to pwm6 control the fan headers reported
-by fan1 to fan6.
+by fan1 to fan6, and on the ASRock BC-250 (NCT6686D, customer ID 0x162b).
 
 pwmN_enable selects the fan control mode:
 
diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index 29fbf438c04c..f656b84ee8ac 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -1540,7 +1540,8 @@ nct6683_setup_fans(struct nct6683_data *data)
 		}
 	}
 
-	if (data->customer_id == NCT6683_CUSTOMER_ID_ASROCK8)
+	if (data->customer_id == NCT6683_CUSTOMER_ID_ASROCK8 ||
+	    data->customer_id == NCT6683_CUSTOMER_ID_AMD)
 		data->have_fan_ctrl = data->have_pwm & GENMASK(7, 0);
 }
 
-- 
2.53.0

