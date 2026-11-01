Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570608;
	b=2Tr7Ec57rY3IJtl7K/ViuxMeDpTE6eQwiREMiqIpzEtc7OY1G1A0DUTq1IzYPWEiqZLO
	 vMrLmCyz6n2jYVKcCC/xb6rYAQpS7yG3uDS/AuDQi2tZjoqH3D3ia+ZrIWYI42hZlLxkw
	 cIByhC/3F1GKVQyEP7WgELeh0mzVZXwqsSY0dFEYB03CAvIk01vEwIiwssd0PXnlhE+AI
	 ETW2SXfp4ZXmygz0W/muRLo9rBl4JpQQCArOVbRUrAAta+YYzNfzVni/tOrAn1x6MqfSp
	 FcvIn8Zqoj/n0AtuajjTNEZSAiE7vpvLY9HFRYss0n2uJx6bo5Q2j3R5Rc7j6KIKrmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=z5HwIFPda1w4a8mgq8cAR9fw2WdrV327kIQbUNNoV+Y=;
	b=r0OI5VAULKTn0nKP2fXGEd1jn/QQXRzUCrMy1Cu5VxSyAH3PjlJkY5kLI0skPbgNx1TG
	 mog51aCNTyc7dsO1APJonqR7KostjBDutz4iqWuhN1RnTlM28OqPfpA0cDdONr//bPZ4a
	 2tdI7q+aSetT1yEkbwmxEPKoKbx93J9z3lQc4ei45aD8fhfDvGp19QGwORoKbwvE3++Km
	 2I0sd1epB4TmqfdM6Xo2wSy8I9betbUAwdBmQEXvpxh76L8L/lNYPE+0Ft2e6nLVq7p2F
	 2tAqGS4wQHvLwQ8L1MOxv9cHSsrm6aKjAyUZGYSOsM2tL2Lid0Np/at+CwXCLJFzoQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Oh0Wa4AK;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F03606A332
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1F03606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Oh0Wa4AK
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1931ff67a29so3964731c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570607; x=1794175407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z5HwIFPda1w4a8mgq8cAR9fw2WdrV327kIQbUNNoV+Y=;
        b=Oh0Wa4AKdc7iROHr31BGwvbHlO/NJGLhoESDgT8sSOB1NzFqWpVVXTVzj14BuO/uJI
         +X4kINBdEpOUfCF78tdKmT14rd91xZBfOIUPjcUumd+9eere6w3TiR5SYooBNMS7mxGc
         omaDkWqfjFwf9/yzSfoiurmYaGttHpgVpBK1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570607; x=1794175407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z5HwIFPda1w4a8mgq8cAR9fw2WdrV327kIQbUNNoV+Y=;
        b=vazct+rMxK83bxAlsn7m+tsPUl8Zo8wOcFdhhuDoIZ7KXwBQqXMSofVUCqj9Ds0wyU
         BDiSy29JFOeP50DQmMD6zmmYlHQ861yDzBrgLQWC3043yuQfpZemIvBCwq3Y0JLqNnSc
         45/mg53OVsPRhGnGeU4qHVFcIGdwTjNPOr2+CYdzm8NSk+zeHnicDSxPAu1lKANgLUTq
         +PnNnUN+TyfC5nctXi+glUVghACE0a/WBAZ8sfQcteQ6TUJGc1DmkcaQcZmKKRtFrRW/
         qxafP6pSi5vVzZFALdfE3hNx01Piu/OPJIMC8ipzyM+tiXLLHcaC3hxsY5Yp0FO4S0wv
         2lKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkR/vS/yiD2nAJUq0gYlWXvGTxeSBzN9LHFrGtptXKjXpv8RxZLpZ4qJXD390LgjIHj0LMYE+tIRxzeWI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKo9BaWHnBw+uy55C5DXtISVAHFrgDBSGZg/Q/C9E39vOZSfYI
	rbHMXwLVsQymTwButVAIcRqoptsuSyYY3TmIz/mgmnP8SZeFdvsJCSz2/6a0JcVv6g==
X-Gm-Gg: AYBFou3aH5h9AUoyrAlFnZkuwP4qHo51K2sjmNS8X+a9ttDtSzDL8IV7h+9y1nTyLjL
	E/MSWU2BxjuoJAvBgtf7w0/2+lSjuS2XedIDZl6kD87GpadPr1pSfJr2lUBSI1gu+jw0fToLYQI
	tr9kUmNYl3iaoATXh9nFWpX/iJNZ5tqaqDlSTxBKfQlaFWGcuI2jRuYjFfjN3s6X+NWVeKAcqxm
	pueFRAhf5dmA5M97MC/ScZhiPC41P05SgTGvKJXFGJZ6S3A5jxU44cZApqmfw6l4ny55phA6zeK
	FMRK/4QmZBdB0rf5xMVDnVsAPt6Mj/+/IKgLfbaOvux0byzKAtgCvX8/DC9wKDf0vqeR9QueSUr
	odzklIIEQapttQNjKjQ7XJhPmVx6/64Pp/yjCzrLnAJKSYm5FnThzaOLzq4S50FUeSpmkQUjEFl
	WQQ6IIkZGPObH2YBN6OaJe4c4aN6Esf28YME54QHSSVJ0HddB7Nt2EfvHCMBZh2FxjWv4f2lFql
	T0g7TyolgKgmRz+7Ur5jczzIprxIL1j/286QFigyJuDkI7Nvru4UDkj/WGAGBc/KXX+iCGPuoao
	new4fb3PhHQo3i7SGtSc5fOC5r4uTYN2Lxu0j7oBoYx2WlQI6iWn1ErEXutwCHfPtxfuCTAfuDi
	H/WxLBCB9olzDHA==
X-Received: by 2002:a05:701b:4348:b0:196:d6e1:108b with SMTP id a92af1059eb24-1aed79b3f6amr8350791c88.10.1793570606920;
        Sun, 01 Nov 2026 14:03:26 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:cbd8:5ca8:653a:11f9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm11097266c88.9.2026.11.01.14.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:03:22 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Brian Norris <briannorris@chromium.org>,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v3 02/15] libfdt: overlay: Drop redundant *sep != ':' checks after memchr()
Date: Sun,  1 Nov 2026 14:01:09 -0800
Message-ID: <20261101220224.1436242-3-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
In-Reply-To: <20261101220224.1436242-1-dianders@chromium.org>
References: <20261101220224.1436242-1-dianders@chromium.org>
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

In `overlay_fixup_phandle()`, `sep` is obtained via `memchr(..., ':',
...)`. When `sep` is non-NULL, `*sep` is guaranteed to be `':'`, so the
`|| *sep != ':'` checks are redundant. Drop them.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Split the removal of redundant *sep != ':' checks out of "libfdt:
  overlay: Prepare fixup and fragment path helpers for reuse" into a
  standalone patch

 libfdt/fdt_overlay.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index c6dc4774cff3..8d96428af04f 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -432,7 +432,7 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 
 		path = fixup_str;
 		sep = memchr(fixup_str, ':', fixup_len);
-		if (!sep || *sep != ':')
+		if (!sep)
 			return -FDT_ERR_BADOVERLAY;
 
 		path_len = sep - path;
@@ -442,7 +442,7 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 		fixup_len -= path_len + 1;
 		name = sep + 1;
 		sep = memchr(name, ':', fixup_len);
-		if (!sep || *sep != ':')
+		if (!sep)
 			return -FDT_ERR_BADOVERLAY;
 
 		name_len = sep - name;
-- 
2.56.0.317.g454f8302e1-goog

