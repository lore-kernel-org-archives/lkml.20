Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793656295;
	b=5LqbAnCIl+Tj+UxIEuR9grcHu5ofdu+u+l+Tvlf8724u9YfZ5URPMyQdKzls2vNHiB/W
	 Tsc3JJdRAfcsQVMlxo4uNUsyCGW0WoOqRoHPlPZtnbSxcgdT0XBsvRHYT5HHCxdcvzVTm
	 bscL4o5zAsWnOhQMIKsTSEL5nw3saLsoULHogxmp7ykeksg5Fi2P5YQtvTbGmWwwjWK8h
	 +kRWUOYLOzSHsoq2dXKGYPzbppQVzvab9BaccHvm8196cB3TnEN+v7TYSjWtCo4URah5c
	 b0QyVnSX7Db4m4+vvHAWvtulywez8Q2nwLx0wnW3T5Zip3Hk3ktMga7KhAI2DQboRzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793656295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7jSwJK/207WO58UQjI6Ts9YDU9KElEsJfJqCrITWK3Y=;
	b=bglsXu+CktJCYevzkj1iijy8WiYqQvqJSZBJbxxU40d2nMQySIftmdb7sOHrJuWaHFyo
	 OXeX27UhWDTgzz9sM67V6A4NrtWyBGMIjkzlwO4woD3u3BiMK0IfhU9GIAM6lLAYiZQz+
	 PBK1z4hIlMtpVR68k876MeDxxtw3sEyUYazYcbSgc1uD+q3U4DmJpb726yJK+A15qTDCs
	 wisf5ukKjuyw+48Tybberysk7e2bPCycAAQac4ZxbNumjMFviT5xYcyrQRX0OaICzHCcV
	 HJ9N66oQrhuur7fu0xFO2PDEPxJGwGZboRWBzRDNqlDAGr05GoqEE9tcOySsn3sZRmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dNTSo+Ar;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBA4606D83B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BBA4606D83B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dNTSo+Ar
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36a17a332ecso5462758eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793656294; x=1794261094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7jSwJK/207WO58UQjI6Ts9YDU9KElEsJfJqCrITWK3Y=;
        b=dNTSo+ArHEY1p8y6b1Gl1CtTGFOW2OPldm8D157toJld7B0aLlPSHWAsnx771XKWWv
         +acgqY+siIoIZGU5HoMCJ+UxlcZ0Y9XJLQh9Ed1A1camRF1+gKook+dsdrXZpjT9BRpM
         v62LnC8uAIBlkJ7zCyQVHZUfsepAmSfeuuhCG/p6sHcJyBDWCNi9biiNteKhCP4UQmj3
         L/96MDWkO8t2uQjrLSjd8EnrCbd7XfVWWqvzVO2vnnE6HwU3mv5kb+Ur8wxDDXbiO5Ja
         6dOp55l8ef5KzbOYHo6IftBbkj6JfE/Yv7LIW2wPg8vxOB9IRaY1mNFy8/wevuonr9kK
         vJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793656294; x=1794261094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7jSwJK/207WO58UQjI6Ts9YDU9KElEsJfJqCrITWK3Y=;
        b=DktLWwpxfAzx509NnHX0QTLAvRMZQ+6ETeThXwHoXLYrlix+VJsV1yGd1v16xhcDhS
         pj4xCaY9RKRmnv/ZXIFL+EO3NnjzyqGjq4gCaSfjIbV5evbOqrVTQhB4PX37Jzqz0New
         HkYp5KNlebc8dDAcA3fM5Zm6nC4FISw46c1voOaaIeZXBiORrKynv5QQ5Snj4yGGHWQ9
         H3WZSe+E5IAbRIlv2am4de4Ti9E6cQDm+E9o6gLfqHPKYeguN82+EBheGGfkH4L3B5Fn
         RcMsyv0Too5a6y2MgM5HiLE9VlCN05ZDhr1A+f7p2T601xnwj6o6AXZEooiW/4oq/ML0
         a31A==
X-Forwarded-Encrypted: i=1; AKwUvBw5SjK7Um0mOTRbrkQjdfPQvzXPVLetP/x7D/vKnWVP9RAvbMKPhmadAgGlD2GjhEXe+RgD2BEK0smE3ug=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DLZzCwnPN3rQrqMYs8DvXmAOfvognh0lkjGa9j37hiBqPMgoi
	3hHsSOxDksDDuzz3puNkHspX6M0fTRKeI8Vz+NkM8i5SfcjNweIUf484
X-Gm-Gg: AYBFou03+A0XBwoVEkmO/XtxzjKFp5Z5Xkiwq8+cGl/i+c17tkcvPKegV7mcQNqFqs1
	SxbGzcXnwuDBihrpUoB8L6+Azx/CNXGNydWObaS7A0k62Afy/rv0YfMsVrnoPMYwB6i3Eubh0Iv
	hDQ0Q8zh2oOHKbviQ5RWu99DwTwyBqWpbJO1AGaBTmIcjUp9IDLrY0c85eZ1CZ6QNzQbViOEol9
	dL7hhLNqORQnHlAoqS64owT3siJ0XUC7lpabCvvDy2LGdRu4z0MOiQxP6f5WbONm8TNgOQzO/8R
	7JQLOg9+QL0uQOJtzNzosCIHOqpKkK2fTpiZmKm84Lp58/4KMTzqsis3ngOzMxDAuB4nMH2QbuG
	UD3i3/BqT6MpPGraZQIscgsmk4fc3/4FY+GwPRxkzzZMlwP6m7w5cv25uHptbyTy3GNbrZjPiqs
	LwQup9azFkJ30gL2Hye/57ZQdp/TIzyaLvQChDJwzG6wmQw4hGvWHcy1dPFx/nCGmvpkr7BRacY
	q2JAq5wJJfxeiIAg0vmeBeCJSH5ISqvRZDMmMohMSjbvYKNoZx1wp6kuLXZRzb2q50USunwDQq/
	9wJgUTq7yRfaKkUZLr5+ZMAx3sLt+WRsjiGiccZ6gm+w
X-Received: by 2002:a05:693c:88d6:20b0:35f:8c5d:5928 with SMTP id 5a478bee46e88-36a4244db5emr16226283eec.30.1793656294172;
        Mon, 02 Nov 2026 13:51:34 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm54710712eec.16.2026.11.02.13.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:51:33 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: abelvesa@kernel.org,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: kaanapali: Mark the USB controller as a Type-C mode switch
Date: Tue,  3 Nov 2026 06:51:20 +0900
Message-ID: <20261102215121.738-4-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261102215121.738-1-26rote@gmail.com>
References: <20261102215121.738-1-26rote@gmail.com>
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

When the USB3-DP combo PHY is a mode switch, DisplayPort pin
assignments C and E put it in DP-only mode, where it stops the USB3
PIPE clock. Make the USB controller a mode switch as well, so that it
moves to the UTMI clock first and keeps its USB 2.0 port working.

Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..a06d5d867488 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3941,6 +3941,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			tx-fifo-resize;
 			dma-coherent;
 
+			mode-switch;
 			usb-role-switch;
 			wakeup-source;
 
-- 
2.43.0

