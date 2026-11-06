Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946626;
	b=tjPxtTOU0S1mx498N3vFDqtQXIycxVlJm2eMXW2/YKA0Kw4OV0TFPiKexy7sy02nfBEf
	 ANVLyqjWYqio0v1wKGvkfxAmmkSD8ijGk7/rzzfbxGc8hKGEGFH9YZuftbnl+entzGEfW
	 qStzmMXfwcwBNpgP2FH3gu7wcyHmYBwnW1B2UKjczxilHGi6eMXnSBfeTfXmW9wCGxv6d
	 dCsibY4v01oXBemy1Q9/pX7RZx34KZp9cg96X6iNRmJ7hMxAMPrBgn544RXy3gVQ5oCPj
	 5rK0J/CwfWE1P1WmOuhKUb/gk0nkRcvcvoQj3U6xPnmr3Z3lw9HfwSP3oVA7ZhwL2Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=1Ku8/6VaW3K/wjjrFY6r/mW/cVKo9k/p+ByDBfymbSQ=;
	b=mCC6n/AKEgdEAOFVPS0LJaYF3BfM4NrxTa0MNqlLW+hSuNwKPT+QJZLW+PPrTYpifkza
	 ONIczJa01Ail2IVsFBK5SRwE4ZDt8b1/Ynq/s0kapKcWLSEpDuje/QF0OkNz0qYIe7whb
	 CMCbHQewgBXmaAtlrzoXftBAF+dSrHKMiox1Kg8JVorKIszUdjunli4v4eJaOtCBTnRMf
	 I5AYdgaHV0hSpzCBOwuacxtyqJ7rjGDGPplWvlhqIUi7YYgb/XOYkPXIJRlZLBSEy9JPc
	 +MwEgcyeeDgaB8exoYMsrZ4R3DWNp85NzJSKLurbmXT0p2jDrJ30/y49aGj26FTo7pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xb+GN8kz;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF10606A330
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BF10606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xb+GN8kz
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so468542c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 22:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793946624; x=1794551424; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Ku8/6VaW3K/wjjrFY6r/mW/cVKo9k/p+ByDBfymbSQ=;
        b=Xb+GN8kzMCS0E6UynPJF3KUB9tPTBZuiv/zt1uXCM+Pj/61GboNjy3I6BlkGFSQ83O
         yzOx8N9YY3nw7yGweAnRn3MoCFSgMzbxie0usBTZA3GT9LCJcgNgrygFPoZ86+16yt99
         VLnAHSHoyTg+vu59RlEQlwCrPo6v2VFQBTHTPxPs70kNTo0oqDxcaW0tcRvJLpRHjYlv
         j98ekeWqtbqhgYq2U03HtwXzm12GUvwU0aoUTDCSoEI3Y98gPtwApdTwfCKyzuKkJVFr
         IH7BjrWy5BdPpI7/8Tf9sgpS2htpj7KNpQTYrtrsFFc77VyXs3WyLG8jiRDzNUCQBOLe
         7Kgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793946624; x=1794551424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Ku8/6VaW3K/wjjrFY6r/mW/cVKo9k/p+ByDBfymbSQ=;
        b=NGYr6nXYTBOmOGwQQGVPHwVwMpHwEWAwyJXryKujjoKiDmvUVS0igJcO6FEWVGvfo1
         wJV5daJSeLdfQc6OoXzPiShxAY1ekbz5hXzBk94v+22bhlH+g08gVYjZ2cjKUOQLUa1B
         TbwlYsPcoEj9xpKTZZ7l/nN9dpLN/t/K/vzCTaBVk2WCEbkOoJi1/ivznG7+Vg67qMAM
         vii3hAXU6b7yDMt0SLIUbcibNfsOcnPXQl1iK6sdXgFniybfq+JN89WkU6nKissakhtF
         2JDEw6YWJLCxHybbOSou9cq4UnTd30cEdiQpEH0lh1zCYNmzxgrz4qMwSoAJlXwuUo29
         Uppg==
X-Forwarded-Encrypted: i=1; AKwUvBxIhKROiQLyULxnv+lnQgcK6fljiyA+Q6V8tnDbkNULJ2Lvwu63VrBWrg7IWw/ulYcDif+vC85nN0z47TI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vsE+a84EpuNxlOu94Cz3d1NVjtT8/lYlzwaMOaQQdAulNlFkW
	yKlr3w2gXGJZ3pIkeh1VRMHTVFsCwKZuerrNg9KRaockh0OrM2zQ98xT
X-Gm-Gg: AYBFou1oeroQR3MGnZ8A7M2KxlWVFwkgELaShVQogaKhQ2neeV7yHWf2ETcGHj07Y9f
	hU7v3weifN3vGeBNwm38yPkCNC7O6qPezqUjEHk0AkhiNYQnNuOzDJ8JJxtbIpVFu/XOGNcWa7v
	RF/6251hZOX52d4RjpHXG72zGj144ixGrivxnIN+ZopxmNeLiWcNZM43Ml5ggfGEK1GBrTiSJYZ
	PDZHChzp3z3pTzll8rMPGUSQaNbhhOwqgrT527ekwetmaIUlrCrOeiU30jqZe5IZLXhEIwA+O6+
	n8gpG8UuFCpXMow3F/GQ/WTXMz7OJ9nm15txk8EHNBZYGv9VVu74AMWAjs5qPwcBEQaYbvm9bX3
	JvrOvoUxUJuDvMk/tAaNQazr9njngLZ7tALL5hVe3EGmkElYlrXEjsbdcmdtnatX43MtHs9cmBL
	Koy3s49H3XnoTOqwZRL7ekjnnj/ihp80oxdAeOFIjFO8YLWq20x7l9rUxl+09v4OkNMibS0Efa1
	fdM31Q9cO7BlwezR4ncp23/wJQGrgzZaNA+6TPqdz6Mm8fjmdLkg+Vxw4P51P8Ej2YsbeznG9xe
	UOoG/VKE4hMWJlXfXd9r61pFlOjdMcYf7nfdxYwT6K+VvHro806hAeOa8mQNhpLTqWRErc7U4ky
	ydqo6WCDVn3Obgu/OoIUmEHpu1C6DQPrvvIMxIvQ=
X-Received: by 2002:a05:701b:2916:b0:198:b1e:90d9 with SMTP id a92af1059eb24-1b25d315409mr1601587c88.10.1793946624411;
        Thu, 05 Nov 2026 22:30:24 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:64e:8358:c9cb:c17b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a63f6sm3734266c88.9.2026.11.05.22.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:30:23 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 05 Nov 2026 22:30:16 -0800
Subject: [PATCH v3 2/8] gpiolib: fix fast-path cancellation in
 gpiod_get_array()
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-b4-gpiolib-free-v3-2-bb47ad58642d@gmail.com>
References: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
In-Reply-To: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.17-dev-e56a4

In gpiod_get_array(), when a pin on the same chip is not in hardware
order and the preceding pins form a contiguous block, the fast path is
cancelled by setting array_info to NULL. However, descs->info was
already populated with the array_info pointer during the first
iteration, leaving descs->info pointing to the aborted array_info.
Consequently, subsequent array operations still use the fast path with
remaining bits set in the masks and wrong hardware pin numbers.

Clear descs->info alongside array_info when cancelling the fast path so
callers do not erroneously use the aborted array_info.

Fixes: c4c958aa64f3 ("gpiolib: Fix array members of same chip processed separately")
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index a5a519c0f001..e095aaef0a09 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5307,6 +5307,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 			 * hardware number is different from its array index.
 			 */
 			if (bitmap_full(array_info->get_mask, i)) {
+				descs->info = NULL;
 				array_info = NULL;
 			} else {
 				__clear_bit(i, array_info->get_mask);

-- 
2.56.0.506.g506a7eabc5-goog

