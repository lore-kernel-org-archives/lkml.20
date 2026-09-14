Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE839480356
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789396683; cv=none; b=W5izfc0Pg6xop+1wt0KgPrjbXbZKrbW+Im9rG75COfDK/zo7hl0ycQRuN/x3asmW2Fw/arNJD6zPwb9Ypm6nVB3DAjoHXMjCLu0lTMgk4G64hrEMZFBnLaXOtzzz2uttLcLw10UTSG6Fh1JhYyrs3VkQEl6S9n0Fsk2LWFfD6zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789396683; c=relaxed/simple;
	bh=An5kVD+QUS2KRFPqoTzuP3KiyxlNWixnd0SrSGxYc80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oWB6SMRj9qpPk0CQ2AMkMuWqYw9IE9TxnC9UhugfZWrjLRIPHe6pFNOdUHhdjUW8FyCdgGbesHuC6V4gYySkkIkOmE9f0rG8eF/vMUNGjnOTuNPVeAbMHz6OVRbzxbF2CD5H1itsvk05EdpKUdZTUjKXv1OUgz08DPOS2Pavq0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=tOhblX1H; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="tOhblX1H"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f6c7a58so229802566b.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789396678; x=1790001478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g8LfNC9HXmpFwQ3HeSQNxdEPD6YaISqvodeZzu0yt/c=;
        b=tOhblX1HbQWKzAbGVxfCQOKLCcponVlAb5+wv3zW7icjHVLMjLY5y+zpaVX43texjG
         P4N/vm0WysYAn406Hr1A7j2tMt77H/PPcXiWtry8n2DQgknKKABgfyjOfKHtSaB6+U/a
         N4/a0Tot2sdqt3eG39Ddt+dzjD37EqeXxuvurBVH67+yHv0VVcK3ArItDkCTW5B+umGY
         lp/aidzMO/D/AuVjpqBadygLkpYR7BQq05Cp/7Vw29uecbeJB2qoWFkUl15LYrfHtlzx
         SFdDUav+oOO+BL+MFeXbWqeKv1cch89a7rg432aoIj5up85VXxkdiAd7ykOAUfhAdz4E
         gWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789396678; x=1790001478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g8LfNC9HXmpFwQ3HeSQNxdEPD6YaISqvodeZzu0yt/c=;
        b=sICQn7fIGBQZLM33sTLC1dfCBxPryMZU9YBWvUp6QGYwDRta3j/dOq9DMM5kFD0drK
         xQ9+A7svC1K5CHZDWVgfb1pFXbjr/y7VpR9ad8X4t+obvJLQYfHKcq15bemp6msVpp6J
         y/vQzDKt58XXb8ki3Q5+rNDTj1qvVy0YvYXAhszRROCn02UoDUiDKBnScUgSyhF44yju
         Qu3pOkMPLuSJmXlzADULfEMwGaVeusVS1lrdhDOMQNDHD/2qQosjyJI9uHTATOgAVkhX
         9LdhaPKp1pjqz7COjKsVsThWG243S6W2uDN29EpT8FahXnWw2YWGpZwWyIZw4GpAvt3J
         Dvdg==
X-Forwarded-Encrypted: i=1; AKwUvBweMxaa4jk4Mr1qRWU3l/3h9aX5rjkiSh51ZP9pB7O1KPXLnT0pw5/0dPBlhaVq2AyqRJ6p6qmnnQHuXxc=@vger.kernel.org
X-Gm-Message-State: AFuF++mNGv9RC+qDW4BVGAJBIqkzbCQUXi34ld9Prt7PFk2bCXdJ/w5L
	3RuuJBqG6QMyKcD4trRWGmq5tNea8d+H4k5zUb4qjlobNoGFTdpe3yimDADaG3shSD4=
X-Gm-Gg: AYBFou0UhFP0HloS5qz+QzV8ntfHE/7Fk6nW6OFdRXHlTtExFtMcBR5NhfNUV3jLv6r
	GeX+u9AXbpNanfmAZdMdD6302FeIKGoWzWyb0daFf9HgzQ3OcB78n+SSu4lP7OLtl0FfRj9Uw/a
	38g56eALpLHBRhHj9jJBNdvW9Nz5q+wnoJEYOyFovFk9iab+oH2NkiBlL4JLQ+VWa9PJxmlkTe/
	bdTJUMigye8oG08bLe5To7bIFOD7XmoPZabU9ZnZof/121p/QmXBHFgCJ643hV2BGL+ePP9cYtf
	5RqfQ/44ivbaFlW8AHJmBJXObNX6kMCKMgFbJK+39eXQv7gLZhvAB9keIDAO6yXHW2IQt2yFUHP
	2Z3UaqRPYmmhbgHQdlJnRPiUggXDzyqV/UFlsDsDWSpUz1dUsUZHX/IKePCcT3o+vo9tVvk7RlO
	X5YSbbOcowycbJVnW39Sz0+QEmWX9iFM/lFBQZ99vCa/S8W/a6JDZ5BZ2j9GcwCL8mVU7lVA0E9
	R2FhgJeLw1mNtjCVX11xgEUkvrMJsPepxEkAW5UxsolBwiOGKy+MtI9VvCjg1uG3mWz
X-Received: by 2002:a17:907:d19:b0:c29:5340:182e with SMTP id a640c23a62f3a-c29b84d2b89mr181142266b.2.1789396678031;
        Mon, 14 Sep 2026 07:37:58 -0700 (PDT)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660b29a7sm449634266b.43.2026.09.14.07.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:37:57 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Mon, 14 Sep 2026 16:37:49 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Add AW8695
 haptics
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-aw8695_haptic_fp4_driver-v1-3-156f7549149a@fairphone.com>
References: <20260914-aw8695_haptic_fp4_driver-v1-0-156f7549149a@fairphone.com>
In-Reply-To: <20260914-aw8695_haptic_fp4_driver-v1-0-156f7549149a@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789396675; l=1538;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=fEJxwk1bbs1F94cymqRXVbWtKaMJcVnL63UV2RvymTM=;
 b=pX9xn5+XqtBfjlYTYtS6dF5s9O1svEi9nf7O+5BRvhnBYR1PYcmL023f/AwzJ4KXl32012Grz
 eiDmUOn79YVBSgQHaBsK6xqF7gFbhw75sh1WUvishlk6BeGR5fp0vUd
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

From: Luca Weiss <luca.weiss@fairphone.com>

Add a node for the haptics driver found on the phone.

Co-developed-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 26 ++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 23f950067a08b5ac4f7f9f61cbe060fa00b9f485..8a55a1d3426bce699a076e75b948b3def698fc36 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -707,7 +707,17 @@ vreg_l7p: ldo7 {
 
 	/* PX8618 @ 26 */
 	/* SMB1395 PMIC @ 34 */
-	/* awinic,aw8695 @ 5a */
+
+	haptics@5a {
+		compatible = "awinic,aw8695";
+		reg = <0x5a>;
+
+		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 90 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&aw8695_int_default>, <&aw8695_reset_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &ipa {
@@ -1178,6 +1188,20 @@ reset-n-pins {
 			bias-disable;
 		};
 	};
+
+	aw8695_int_default: aw8695-int-default-state {
+		pins = "gpio85";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	aw8695_reset_default: aw8695-reset-default-state {
+		pins = "gpio90";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
 };
 
 &uart1 {

-- 
2.43.0

