Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB1B360EEE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 02:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788230014; cv=none; b=Tjnv9PhKQGPdADuqQ11mvoHX0vRO+ISEJjxn560GUFKfDYLuMJLhfDNfWD6VRFRb5zm3iD4IyjEZof1aX5CFl8sQxYgy57G/Wh+kzGmObaLlmGlMl4yYeyylHqXXq0kXws0K5y7QzgcbIShCWxgpXsOP1Baa69W6dJEg/2Ehc0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788230014; c=relaxed/simple;
	bh=7zvXv2dF/rt84/+WLBvB9wFqWDLTCFcd3fwCRPfFGGM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rEgXHEgulqWR61DQ/SbT47MbV5NYniRfPQvyDZhZBb53PeW4ZvIXyh8XL59AYcRYLXOFz1Bv6kWAtKSnd4NyILlEWNBt9UDMVtHY9ZtyQ4ev9YGFEnqgQmCcbRmPQFMjRan6ySAn5ROvZJ+JZFnoO+hwaPZtWGxt/Y9ocQLqdaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com; dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b=zWKekOV9; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b="zWKekOV9"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so3385618a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=synaptics-corp-partner-google-com.20251104.gappssmtp.com; s=20251104; t=1788230011; x=1788834811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sXWMem3KWnB4LNCEveQl9AbeMx+XsbNgDR8AdypxgbU=;
        b=zWKekOV9Jtgx7b7UtWT/0vTeiciq41iIsNkEroAWKVNx+hetSfUfQa4gDZgcIineyH
         kPDRVJVvuAQbVMxWw1yKdtCFXymI117SBYak60hJalk5I2mJVT17+nF9mnNP45CalVz7
         Tk6bpZM0/woWqsDEBxoTm5YjGzagYAwWd4fK13M9UO1+REtt+f0ON+y9YjCwlL5oEtm+
         CgIbhkjJD06Os/VzDZYGdKhZWQKfF7Ek8SLVhe+TYDP9VnmW9beMKRNX30hLblbxXZx7
         Iv7uhc8Q3gGICjaecLp5TJSD0k59RLukvz6DLGYh+oOckSOVpw0MI2MhQfm4KsVcR3rZ
         j6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788230011; x=1788834811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sXWMem3KWnB4LNCEveQl9AbeMx+XsbNgDR8AdypxgbU=;
        b=VEGhW7JVt6GyAQT1VUjOVm55My10zF7ijtlDV2KHmx3xF1aSf+d1+b3nQdBtsPQ7FR
         gieEgpFBRMYbHZZcC8u9SUKegZH4R5Gk7+ugA7S3nkmm0xKxKipUNCQYs3yzDzX1MTso
         uTGDdP6Xdl8ANex6NN5xPlHONUBfBzyUH1lts8dHVejBy51DVlbDj/sHYHSRJacWbruz
         hND/f14nexh28B49LUSkn+u23t+UXnEXn71Hxfoqawf7Yvzh3p/c2B53KF6HchjxsZa6
         xAMuTQZgyO59fE2bYJI3TzrFt3ZuBRgDdLNNFfS3cp7gnKLeEbW+y7Z1cfja5SJyJ5tf
         Vdjg==
X-Forwarded-Encrypted: i=1; AHgh+RoWo+7AyBx+m0uSRTeYRn2iG5CLqjTcZAmD2Qio0irwZRuI4n3/RYwDAhhzkZmQU3jKLlh4qGTubl4QsKU=@vger.kernel.org
X-Gm-Message-State: AFuF++mcJvJCyu2eADVb8+EwIGERWdRba1I+TLNqhqqKqApvCznNi5YA
	rjiMGbi8m8RrKpD/nDZHONDdyubiftWywEHWyFhRdTbuY8Kl/JLrhD+o5y4EaeIFoMM=
X-Gm-Gg: AR+sD10T3/0uLpcOt/0TZPDLAhDoTY+cTyWGH2Mdi6zHwNzsZyhNCzaqyBU+UIwtTFv
	7Abln1NQXHJSRk/6GWp911Dgh/VeIFr94RE6a93kcFMHMshlQBf1E11OSNWcTyXMeyv8eOtf7YC
	4BUnHto57bPoWddned3+QtD8vUHo/LR5wnF86v0AhKj7wx1K9UgxT28r3vBvyJNFaTST/BcbQ+X
	1ajDZ2emmwxFt8epU33xe8aaFncfTnX5xis5NWIYaq/+6azmtS/lwXiOjOXiM9vGgo+tsIjaQmp
	c5hVz4jms3kLpIQmocGjjPul7MMPokilZSWeMayD1mpB7r+6dplQZijPutomW+uj/B6St7hcG9Z
	Jmc1sxmFNr8Gp9QhnafBukxq370Q+1ZEdrMN7AD60ZMQC21TboiYlqJpkJqLXdD8UopfdXwzPlf
	IkunBFlZay7pU6JDSxVHhyoyeFwVwdbivYJrKrqgzd2LNoK7m1z86iDMimknU+/uqJrMCjqp2tA
	2pZrnPeMIojhQKzvYTJrG2I0x1JZ+qIB5Ldk1A0vKPuzaxv6nBuFzLX0EtUolGycMFkt4sO8VUa
	Dnz+7A==
X-Received: by 2002:a05:6a20:918c:b0:3d0:ba81:79b1 with SMTP id adf61e73a8af0-3d26277130fmr45092724637.0.1788230011288;
        Mon, 31 Aug 2026 19:33:31 -0700 (PDT)
Received: from bt-tpe-server.synaptics-inc.local (59-124-75-166.hinet-ip.hinet.net. [59.124.75.166])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f3312270sm5005565a12.11.2026.08.31.19.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 19:33:29 -0700 (PDT)
From: Andy Chang <andy.chang@synaptics.corp-partner.google.com>
To: linux-bluetooth@vger.kernel.org,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	linux-kernel@vger.kernel.org,
	Andy Chang <andy.chang@synaptics.corp-partner.google.com>
Subject: [PATCH v2 1/2] Bluetooth: dt-bindings: net: bluetooth: add BCM4384
Date: Tue,  1 Sep 2026 10:32:59 +0800
Message-Id: <20260901023300.1382808-2-andy.chang@synaptics.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260901023300.1382808-1-andy.chang@synaptics.corp-partner.google.com>
References: <20260827110242.1203546-2-andy.chang@synaptics.corp-partner.google.com>
 <20260901023300.1382808-1-andy.chang@synaptics.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the brcm,bcm4384-bt compatible string to support the
Synaptics BCM4384 Bluetooth controller.

A fallback compatible is not suitable here because the BCM4384
controller requires a dedicated firmware patch file (.hcd) matching
its specific hardware ID and revision.

Falling back to an existing compatible would cause the driver to
request the wrong firmware binary and fail the controller
initialization.

Signed-off-by: Andy Chang <andy.chang@synaptics.corp-partner.google.com>

---
Changes in v2:
 - Add an explaination for why a fallback compatible is not suitable.
 
 .../devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml
index 95501e858e6f..612d21123aaa 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml
@@ -31,6 +31,7 @@ properties:
           - brcm,bcm43540-bt
           - brcm,bcm4335a0
           - brcm,bcm4349-bt
+          - brcm,bcm4384-bt
           - cypress,cyw4373a0-bt
           - infineon,cyw55572-bt
 
-- 
2.25.1

