Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D3E3A6417
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790744315; cv=none; b=Y7W/eVat/OGtugoXt5UBodjQ6IiZZbkukFCmDVzuPb0lVUHiDmtGd/vVTrshVjwm9n7aGEJ1MZ4bt9RBfhX4mtHsYZlVzSWriBzOLLnpNSTbg+cG6rprzKNLO2SQkMm0qbcsN/KP/JsnoOw9o8+W4x9a8fHVf1WSL9wIK09dZ/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790744315; c=relaxed/simple;
	bh=+d/B0EyrO8v0rwBj0UZLa2+ev9ays+neQ9d64Tmh2Tk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qb2jvboG8Q4kjpW/pkEuLUf0GSuTGRbQeXFQI+1qS697vpACZW7O8oT+N1SjFIiT1zz9pRKVi6icsXH+8W1DJsFzf61tM/yu7WzDDYaYSxfd1DIejtCTYRy0dHK5IJJUte7krE+8N0DwDoAuTcjzlkpIUrI/ewmkrE8eUA0gvms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kuScn2ZH; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kuScn2ZH"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a156f4so2814936eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790744312; x=1791349112; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wb+aoLgtZDdjk4LEKDzfD9vu8cYmjgubpEwv6XHPhUA=;
        b=kuScn2ZHHF3foKiN8FH1xy+vWAlZKJdkctLkRj+adF+y3yzoG9PRAI9s086WXBsFBE
         qqjsZ5TMZLIV3htzDhXfoAdjwiPhym4xZwJyMV1P0Lifh2QyHB9MThwTIQrzUQBj6PJf
         J/SuaDXwyg380flSR84s0RactYKWQfvlkz8ayTYEbmp0zpdJCjmbrEwBL6DxHdPJi5S3
         7jK8ansnVVEA0LgTBgXXD2VzxnfqzilibWW+YYdn56fCxc16ptNXrWjl1b913ocnudci
         8AfPj3xMCla1AJlvZMJb2fk7SqGRYqhpnCPwpzlb6C6pFsUZkUfTU776JuCMPaTY2vhS
         5fqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790744312; x=1791349112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wb+aoLgtZDdjk4LEKDzfD9vu8cYmjgubpEwv6XHPhUA=;
        b=VJsopEahLI8YafQcAC9SglYMj/ecUpC5W8etlg9orWs//ZKweTpJMp19/zaafZOFsq
         0BiL8MAeIlhmvCWoDKeblWWRGjz4enc0LmKgQKURZRMHQNAj+fVk2RMtqBpV5hmojkTV
         Re8+wzzVRefKQZWHyN2O/D9Lsnv7DA1XpfJBDEzrw2ySFnV+95pXoIK8n77XyxGDXrVH
         FrEpSWjLusiPiXwedlXm2zzJxP4Y7fqKychGRI1TaFIE1DBF6ysf0Ww7dB0o2Ptb9w0J
         6lJCI3/h03sa2tbce1rG7TeNam24/5AzQPjXZ1f9GGbVacgWz636UqV1m0VmBMfeewoy
         ZzJg==
X-Forwarded-Encrypted: i=1; AKwUvBwz8Wbcwk5JN3IDhWcWkJ1dAUWWg9iCTXyeGZhinLHGMMuM5z64FMjHYrXXgcXXEb00e/OGaXu1l73BfkE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfSWN7+6EKX5bArcwR91RHMjRF1L4aObEwhZr9mL4Zt6awUSuu
	4BdbHG1woX4d/a1bI6Vpjfee9xbidKTGd1QByvcLwN/uC2gdO/sfGlIsGOmHFvIN
X-Gm-Gg: AYBFou0wgVPZTAkAq+qIkYBUGVH6SeqgfEmbXIakrX26HPXA2mQoVxBNk3rV/fLxJvC
	dbbpCWpqHu/Wzcb90W0A0zkL0tXhONfY1vYh10tvqEHhfDKoY4HnsILH9z551VrK/8hilDVyeZK
	6FU1ThTe2nab7qGTeK3kq2v4CB+LLsrCLK0k+38If3LTQfiq4gpp1FDBGio1E39Qs9w5aVGWATO
	h1QonhPLb908ryAKqbdkub0MAoov6Tv2ZUqIQ8ZULOGxhiI5/4rf79zqxxCb3KYzy0HgOLswB1p
	y+1yhHK0DtcCEhjzUV4Z1MeARu4oUqY/LlrED/Rr0NGxDFdbktsIxZrBTeFWyArVb1lE/XuA6Ai
	wuhzm/uCaTKOIbCQUFL51MVu0BrQfZb8zs0RIjGnj9cUIWWi+r/iEeMejSKOdQn4XnSOY04DUDC
	TNaL3CUFHKA4F0gBESHqM5byuYwwcaiRMSfKm7k4N1kW78LEUfI+KgubVKCB685BxRiJlwmRPRd
	rvA/+vDalhEUwlCRMryBqabQ99I5YCMZS0l2gBouNJ8Ffd+uPmaRqTeaQejIMc=
X-Received: by 2002:a05:693c:83d9:10b0:33e:518c:6837 with SMTP id 5a478bee46e88-34cdc4cf951mr526549eec.24.1790744311778;
        Tue, 29 Sep 2026 21:58:31 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:101a:5ce6:a15e:d8ca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf514b783sm571056eec.13.2026.09.29.21.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 21:58:31 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 29 Sep 2026 21:58:03 -0700
Subject: [PATCH v3 4/5] pinctrl: renesas: gpio: support software nodes for
 function GPIOs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-rsk7203-properties-v3-4-02f84aeb8e47@gmail.com>
References: <20260929-rsk7203-properties-v3-0-02f84aeb8e47@gmail.com>
In-Reply-To: <20260929-rsk7203-properties-v3-0-02f84aeb8e47@gmail.com>
To: Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Arnd Bergmann <arnd@kernel.org>, linux-sh@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev-6c14f

This patch extends the sh-pfc GPIO driver to support software-node-based
configuration for the secondary 'function' GPIO chip.

While the primary GPIO chip typically uses the firmware node attached to
the parent platform device, the secondary chip should target a specific
child node to avoid ambiguity when defining GPIO hogs or properties.

Update gpio_function_setup() to look for a child node named 'functions',
but only when the parent is a software node. This ensures the behavior
is restricted to legacy platforms being migrated to software nodes.

Assisted-by: LLM
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/pinctrl/renesas/gpio.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/renesas/gpio.c b/drivers/pinctrl/renesas/gpio.c
index 4e59dadb7364..b49a3e14da91 100644
--- a/drivers/pinctrl/renesas/gpio.c
+++ b/drivers/pinctrl/renesas/gpio.c
@@ -271,18 +271,40 @@ static int gpio_function_request(struct gpio_chip *gc, unsigned offset)
 	return ret;
 }
 
+static void sh_pfc_fwnode_put(void *data)
+{
+	fwnode_handle_put(data);
+}
+
 static int gpio_function_setup(struct sh_pfc_chip *chip)
 {
 	struct sh_pfc *pfc = chip->pfc;
 	struct gpio_chip *gc = &chip->gpio_chip;
+	struct fwnode_handle *fwnode = dev_fwnode(pfc->dev);
 
 	gc->request = gpio_function_request;
 
+	if (is_software_node(fwnode)) {
+		fwnode = fwnode_get_named_child_node(fwnode, "functions");
+		if (fwnode) {
+			int ret;
+
+			ret = devm_add_action_or_reset(pfc->dev,
+						       sh_pfc_fwnode_put,
+						       fwnode);
+			if (ret)
+				return ret;
+
+			gc->fwnode = fwnode;
+		}
+	}
+
 	/*
-	 * Explicitly mask the parent's fwnode to prevent gpiolib from
-	 * reusing it for function GPIOs.
+	 * If we did not find 'functions' node, explicitly mask the parent's
+	 * fwnode to prevent gpiolib from reusing it for function GPIOs.
 	 */
-	gc->fwnode = ERR_PTR(-ENODEV);
+	if (!gc->fwnode)
+		gc->fwnode = ERR_PTR(-ENODEV);
 
 	gc->label = pfc->info->name;
 	gc->owner = THIS_MODULE;

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

