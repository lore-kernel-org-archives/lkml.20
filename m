Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794050246;
	b=ps2/8ABkvWXzooTODxbjhBstxcE3RibgOLrzp9QWJ/OPJ1KaMym9U0ddHZolc/Gtjtut
	 pfp5MOokzVq44HE97hmVkiKavvRuVFxJdFYm7QMYpWvS6GCjnXGm02le6m1REnh7r9Dt6
	 JnvIzO3W3n3lDw/BGRJM15VZpL4ZJJrqgT/bD5Rsg3Xbl8bRSwrxPWNQ9BuwXf7ttBVJ3
	 jjn4AR+Sct68tyucaR60qRxvo8MsVf9kzuTL9kS+61cUXvqAYjgd/kuoI1aAcgp5Xr9De
	 FQF5drrykDEhhBW/SD9xmLzXCjOaFRRjNvgusWk4GR8M2uVgoFZf2YIcSOXbaGj2tTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794050246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pkGF7dkpGYtBI88D5ga5Ip1hipJc0zynNLG1qkQ2iRk=;
	b=Q0w/iLHw4wq1BvUiJcmZutKAfgYsSAsyFFqYvLfytssEYST9uBBYp3ttAPKdEFRvV11n
	 lHX/2B72AV0Rg7PrfXa2vAU5PS3lan9nQfVk9THPKhPDSxvaL12LhTs71X/y+bzICzt1C
	 KsjvsjpCPVPaoLTEheZAreGLzuTI0KakSpJLMsb6CHUshVwLQFo/rzG7Wo3PNFa0nxYKQ
	 EdcdcemKgN0OHBu4ld4slzgud2fgFFTQs4qEU3kSCbdsZmmTplvS+AfkLx4tyRJ3zX4Ww
	 XhGQkzSMwzxw4GkaHAp16L4ADoIGuHrCrJ7PuFLCkpBcfJiJnVMNX9ztp/62jjdB2uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E02Q3ZKo;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC59606A332
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 11:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDC59606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E02Q3ZKo
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36e795af1d4so411230eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 03:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794050245; x=1794655045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pkGF7dkpGYtBI88D5ga5Ip1hipJc0zynNLG1qkQ2iRk=;
        b=E02Q3ZKoMrebt/8vjpyH5PF9yIbkv/JfHGW3cxCNbqcxdCf4hFIJ6MMYnV3dIeO/+U
         PJUzpUpejBY+uK8gCaJFUBvaSWFu2dvr1jbutoFvY4NycwAcM3XKpoFsggGuy5FdwRgS
         HP3v+SmZtafinZy4Eo5Kb1nfGNmtJqkRfJaJuXs3WSvc5ot+iOdtmvEJtW7ecKcB46nR
         sj8DqeM1pahZk56NgtMHUxv5iOph5mJ/Pnry37fJdFqd4jbOlqvjGrIEqOXXCXT5RFzB
         QBqjeDFIpMxEhwdxvpWTM05MZC6L4F+Bhu6GWQDi0w9ejeP5l9aEc81PAr4wq1Idt9Z9
         TV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794050245; x=1794655045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pkGF7dkpGYtBI88D5ga5Ip1hipJc0zynNLG1qkQ2iRk=;
        b=Npv/rMFJ6Nte7DUW3AGwnXFJjdEStJgzuaZ+3BYrUKaLGbmaZsjfHqV723ZgWlpwvq
         YNeU0pSCXiKepu5QEugljaBrweW7lxnAKU7dTsg8SLC/dZOJTsg60J/Ob73UrgLKFd6i
         wiWyGqcylGTFeWILbub4K+G0kpDEfG07V/MVh8qX8l8HG+9N1mVrRpn5QA83/hCjR+61
         ZpvLdmMMqGcVVVeCw8cEtRyiAoCDoMKJzFIVZKL7vUG4q/wSo0uHR9K1ID8lmZtus9Mx
         1xGujeKU31ZTBL+tJsTqtA2myx+dkytUUkigbAD2tg7LfOWTm04Gpdn/Td5sd3zo14AV
         wYpg==
X-Forwarded-Encrypted: i=1; AL+hErEI29IKNMn1oKBekvXQajcM2iIYPkUCVgksFuvA6WqxMjsdhQ/1TZFfcVlmjiL0mpRcARxTAdqFFrSCLCQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qBvyNo8A4oW5P9F5u1mh3t8c2sUSrGBcG7HwP5RHIGhazddbj
	CghrL4V2WvKULUQB2UPxx8BFFTeNIW0Vt5I5+pVCKjEJ3+x6j0EaplEL
X-Gm-Gg: AYBFou0I0G1L6XrTyw/dPdb5oGNYNjOsUUesDE9/ytegHIf7+3tuC+lq2yQFhtACZ9+
	4HLEKxv10d/An9FEod94P43q02g1e1/a06ROIcjr2S9fsafRlVrn7SUbvpKE0gn1zDIHY5GdG+P
	7WmUnGo7oybMPPZm+QLoyR7c8Y7jiELjZj139DPAHMb7bfuZkPu6WPRGsdhc3cVzi8TjmxBjOfe
	EMqyLUnMJbdy+8Dq9N0sUUC10ktS/IdTsZkIdHUWbuqJkpZJnNuUWr9qI1wSx/1N/hEEgpeBnP1
	9LA4oF8ai+6uDhUHVcNlRkLzVW/tLJe2FaS43CV2rNEie0EwOYlHDl/w4A6G8umLe3YGfqd2wug
	L4+Z7N+UbgLuJZAPrj2sVWyNOCx9VeNH1m2eFUnUT5h/0sjxEDP/uDHEhZ7k0pz/Y/DlR8WU0ho
	bdgHP66aypgT+SmrUCVyfq4CQVcpXiI6FyrYH/F2a9ePWZapuJ21vtd2OxpAlnVyv+lzDyYQxb7
	0aD5G3AOwwvN/3a/5h07Xr4sJ549kRC2uSOWw7m0HIU49GyYksF6NSGV1jrgSs6eCTc/roQJp9h
	q4K7apRQNYSylv/QzYbeDjKKRTk1SIRu4pSciuxhWMBh8P8FiF0iUgTqgrqzOibqkpnpA2u9+y4
	ennyD/gmAtZJlfbtvYlAi0UG0xcudQpJKlyeVmpZPyh53hR61c0/I9OQD6ZLdZPaxjbgPFmObpw
	T3grVw+yo2jQ/iz4ledEfEnBToLP7W93XEXUYwAWPMKQ==
X-Received: by 2002:a05:7300:6da0:b0:361:a195:c46e with SMTP id 5a478bee46e88-370f427ff8amr3861783eec.1.1794050244748;
        Sat, 07 Nov 2026 03:17:24 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9fd0000sm13284120eec.21.2026.11.07.03.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 03:17:24 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH 1/2] iio: proximity: sx9310: reject unsupported hardware gain values
Date: Sat,  7 Nov 2026 16:47:03 +0530
Message-ID: <20261107111710.442318-2-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107111710.442318-1-kapoorarnav43@gmail.com>
References: <20261107111710.442318-1-kapoorarnav43@gmail.com>
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

sx9310_write_gain() passes any value from userspace to ilog2() and then
FIELD_PREP() into the 2-bit gain field without checking it. Only gains
of 1, 2, 4 and 8 are supported (and listed in hardwaregain_available),
but other values are not rejected; they are silently changed:

  - 3, 5, 6, 7 are rounded down to the next power of two;
  - 16 and larger wrap around in the 2-bit field, e.g. 16 sets a gain
    of 1 and 32 a gain of 2;
  - 0 and negative values set the maximum gain of 8, because ilog2(0)
    is -1 and a negative int becomes a large unsigned value.

The write returns success in every case, so userspace cannot tell that
the gain it asked for was not applied.

Return -EINVAL for anything other than 1, 2, 4 or 8.

Fixes: 227c83faa2f8 ("iio: sx9310: Support hardware gain factor")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/sx9310.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iio/proximity/sx9310.c b/drivers/iio/proximity/sx9310.c
index 2585b9c6fb69..27b5d604a409 100644
--- a/drivers/iio/proximity/sx9310.c
+++ b/drivers/iio/proximity/sx9310.c
@@ -665,6 +665,9 @@ static int sx9310_write_gain(struct sx_common_data *data,
 {
 	unsigned int gain, mask;
 
+	if (val <= 0 || val > 8 || !is_power_of_2(val))
+		return -EINVAL;
+
 	gain = ilog2(val);
 
 	switch (chan->channel) {
-- 
2.53.0

