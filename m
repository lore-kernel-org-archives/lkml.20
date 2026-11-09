Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184160;
	b=talCj/RgeRz0iiwJMYdpQzbww1/a1RNN4n2Dvbo3QJZUPT9f6EVJCmBPupAnO58BenMK
	 vSj51s/mW8Fwbt45dJoZhHP+20BHDbpapECMAB+mi/8kB3ekrRbgvht3+8e3Zbz+phDDS
	 kDC8TsZX6aOWbxLxXMn7phVrwSRc7CKvT2Vk+se/UMzGR3t9f4LS36/uy0COqRYItk2EE
	 FgmwlTD17GvGbRi/ZU+SDUIf8epn1l3F00csh5ihFZpPkofdUtAOiP5RbMWeB2UArD7Zg
	 Qlm3OfNTL4v/1j6zRGZ5+hA4R1XRbPoz82SF+bJdJK9F/0c+XyojqkZFgiM0cWjEb+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=FMkbUjw206vKz1URfzQvJ+TU8ZKRTl3W+WHPyPa9fpA=;
	b=eCeNudB2Ll+3vsBeh5TXmzYaepBaDCYjsRXzKDley7N62anCWcRd5QqRj+eK6rMfCTUJ
	 POvCutHwW8/64E8WhAgn/OatKb0W2Q6aDOn/nFjxfP2o6UDLQxi14MOZqoZU5yLxZUp3V
	 9RrFNPFEsKOktNEpNxuMwQBesiXz/JKrlDF8TBO03I9LBde81bnyWuU5W+IbSTRIf5Rx0
	 g5LK+Ls1CZUir5dEh23/oNcYlJv0kQco04z04aA2/5oa+9OBNIBDQ5sWYK+LjvxHVETty
	 zkf6sBChbGfiVt4SkP0Zad12K1Ntas7iP5uQd/d51zI0NtBv8DhHzj+ulhnglKoYkjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nr+rvJPK;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF58E606A335
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 00:29:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF58E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nr+rvJPK
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so2491905e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 16:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184158; x=1794788958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FMkbUjw206vKz1URfzQvJ+TU8ZKRTl3W+WHPyPa9fpA=;
        b=nr+rvJPK3LgSefZHQcMuNoy5ys5xeLDvzoC9dL9bjp8RsH4nbUvtSXjE99yObhKnrI
         KVL569qwb1cNWqejwxbmHvDHlCCM9a0KALsd+kBI6FvzO7MIFWyCNFlZuDEIbHakXCkO
         zfIMQfOZFaAE3OJ8FnLCKYM7zUrDs21JikhpKZqp8aXIXjfaoZTJGEDD7K6S/o4SX5ax
         oowccfChKBzSGvGYv+RX3eVnKnndMe0cVvbZC/RuWGeZ2dWFUr7H18zUaqz5ZW33sdsS
         wL85GB4wROuyI9HV41fK5wDrYkNmeiq3h3ee4AveMIdzJFeUnF6yICT2l2yCcUrEu8vb
         jQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184158; x=1794788958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FMkbUjw206vKz1URfzQvJ+TU8ZKRTl3W+WHPyPa9fpA=;
        b=Bj4hfFBUUUUcD21dgDV7UvpZDa4f2hDBGvCCZUretDys/7jn/ehwQHjCRYl36jMY3V
         UAS69JoPYpXjW1k9vB1sSJ3A/biFpb210OV7K+cV3OoZWzlYY8PkF21fcD6emB6LUKI6
         uWI63s5OI7mYLy0dErhL8FXhuE1PozFgBE8QiyTaqO0/y1RZaf7xcYzsjuJr11zA/UvB
         g/vSnXgvrUBeR99hpmlSPhQuXjLOiPxq02uv7qE9p36aqkQe+K8j/NRdhEstmsEnhLAV
         qCY55VjG4ZPte4ueGOboSZGWcS3W+AoMSh2b0LvvScr465dvLH8OgU0p/pZI3/XwAd06
         353A==
X-Forwarded-Encrypted: i=1; AL+hErEbdlX0P4dw8g9kuEvT6OoSuoaeFpthQDc9TV7GTo5u6xe0o9VzXBZsyx05XWOTgG1UYuPuYNnDW6YgcSQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z80JtUqAmOu1Y7qnX3tFZX7IDAAIF/sGMVvdX0gCHToX0wDmqkO
	Cci4Tq8zrD6q7a5iBmpwGb/h8liELPMSO7OBYcZPv4FRB+m/vFAe/fmo
X-Gm-Gg: AYBFou189iesV1glbcXuYvCVtEPB9iVBUZzI9C0cna7S8YFHFRzSpBO/7by6dDUANCD
	bUgN2sqVj94Qcu9RLmFL2pEPlBnDuvD3HWmRB5g3TVYcSlP1yho/h/yfef3Duz7o1AZ0N1dcnKo
	GpZBt3M7HJ7MGINuKwuNVu3Fw8pfWebabd5QgtFwlcRU7mW03QjF3SccJWIjBK2yQRaEX2tuMye
	tcJzMQqRMpe02rXLZYkiOUXje4gbRYjclPG8xg0/i0wDQxE5Yt1x9wEsvGA6iW01nH6AsQDX702
	WnOb5QPizy8k2RQuJEI43XBONadP6abiXv6c8aO7NDu09g+4rmSDGcMRu9n/0a32/9UanQEZFrd
	lxatwsI7myfzLdrl/txRgcwxx5pseNO28p+lT2wZIxBnhq4x3QPw05FRSQgOzSleExL+SHhahRV
	MKEF/WDh1yiQeOj8BbyV8k3xXDiB/CoEutFbRpQo/+hfSPccJJmbE5aG61ZjvPYbVMxnEso1PDH
	GNPPJgtrSJbInpinvvBOqGNvLSZBsgi+yYlsdkWF2IJASeebfEBXukU3b6aAOOaQa5aAUM7WzQQ
	bYqBrvM9C7ffCGIWAl6EYKBczW1eFope4ycaGk7I
X-Received: by 2002:a05:600c:3e0a:b0:4b7:6aac:7406 with SMTP id 5b1f17b1804b1-4b94d762f58mr49204685e9.3.1794184158186;
        Sun, 08 Nov 2026 16:29:18 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee1de2esm91295785e9.5.2026.11.08.16.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:29:17 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:29:10 +0000
Subject: [PATCH 1/5] dt-bindings: clock: qcom: document the Halliday RPMh
 Clock Controller
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
Message-Id: <20261109-halliday-clk-v1-1-20c3ba8be0bd@gmail.com>
References: <20261109-halliday-clk-v1-0-20c3ba8be0bd@gmail.com>
In-Reply-To: <20261109-halliday-clk-v1-0-20c3ba8be0bd@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184152; l=820;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=ra2CqCyJU+PQw7aYPTd3iwXLS2r2IgX39NQHfJ7L+7w=;
 b=2nnGBX79rTyj90QOmojpA8vtdMSBp8gr0IrLIj+ozjNak9ZQIQyO+HH7+ULR7mGoGIXokPJ88
 iUIUnzmfx4CBKWS7MIXWXCNck7cizjy6ph3FLkNDcHhSietAdpSWg45
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the RPMh Clock Controller on the Qualcomm Halliday SoC
(SXR2250P).

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 5c9b653bc2aa..72223566da1e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -20,6 +20,7 @@ properties:
       - enum:
           - qcom,eliza-rpmh-clk
           - qcom,glymur-rpmh-clk
+          - qcom,halliday-rpmh-clk
           - qcom,hawi-rpmh-clk
           - qcom,kaanapali-rpmh-clk
           - qcom,kuno-rpmh-clk

-- 
2.55.0

