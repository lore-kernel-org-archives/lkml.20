Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862430;
	b=zrnFteN5MCblckxD09/Gjv/Q0I2mzSjCJ62SRGV0I57EAp9p1wZEWEbAfjm9jyPISH/V
	 JDPhIobYRpzrPN5AJgWIYHEMVBGbqOtPrzHUqlBOHxu3LLetaxgBGDC7V9+GJ4MOkFOJj
	 hd9AeHhq9SeRspBnPvu/gB9L7yqQer/GrO44KsqsO13aX0rxJqCb5Ird9UoLA4ovjBBBP
	 GTBxcklLX2jzViDnzNXOmLb27tW3Aose9SWruk0i+oXMRPowHNoGlm5kGookhZD6Aktcy
	 o//pV70WQVM9d9jeENArR2gCLaFrKjnjDu+BxDP+m9yBGDXYRJB0woszS8110sgcc7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GqET4a1eR1Im9QVhPOdJb3YbweTmn7DPOs/OXRIvsBI=;
	b=VtIOPkhPDqFoyHp8TTNYbzTWMm1Bnamici2YbsM/ZlfB2Qz/8JaE5AuC654FLSqov7lT
	 /geQGlVCgsu6JWRjH7Kg7yl4vO3ZnpIh0MDhkDPugdBaPODD7eyJq+YDztr28skqQAwk7
	 6XopQlFUGJnlVEIrDIxiwUfDwSGxxt6VI8hyJs2NBdOoC6tbHHrNZBEnJY5fiHo8rEwp6
	 jEKyxqdrIhEtJoCQANC7pWotk57IC+sxO6RW8Ut3ywvXi3b8ZYkxXIdZVFWNOKUw2mAjJ
	 8yzgTwTWx0rRx+g+FkTJsvyPXtyUcxb2g8GgK+BnbuEzh8YWf63kkuLGkEWZkVmsZig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HY2u0o0Z;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6146606A89B
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6146606A89B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HY2u0o0Z
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3704d30b84fso4672946eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794862429; x=1795467229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GqET4a1eR1Im9QVhPOdJb3YbweTmn7DPOs/OXRIvsBI=;
        b=HY2u0o0Z8H3Yq7PlPIizj7S0ypgGnAL7reX/xHU7bT9irZqhQd/73nLumJhnzk9U7q
         tlzHPtaXOoZHTfpvgZerKtGtvx37zqg4rFJrOio47uV3UNZ6lWx4wZ+sN/pKDXFQ0qer
         ECkQqCNQhFSJbw41UPznMmFjeSXSzO1duG6eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862429; x=1795467229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GqET4a1eR1Im9QVhPOdJb3YbweTmn7DPOs/OXRIvsBI=;
        b=eB+ZxM3iVwfJM4mqR3Jb5MGVemKIXqhilXHYKMBrGb2n6sSv6NQ4YeimscVX2GFAJe
         bEujuLNGRFB5SV2xagctcpU6Up2jfEfHtcGEA2FV0M7YxWyeA71CUoYr589Fp7oX/OdX
         Q0QuVS4GmTORbEo6eu5F2MUR42+WkhQpMpO15DlCeDK0VE0ofszM96uMUNvctZeFFlRQ
         KoFekprucKG/thulixr6OyHi8CoglOuOn9g6wtKaJsyfMs9k6dzdSPubqO4cAmvEW4Gk
         V31PtREvXgWbm9pTBGjH3N+k1JQf3p4hNRJYOrpv+56hoXClizrhNzHtcL4CXwYNDsX6
         or4g==
X-Forwarded-Encrypted: i=1; AL+hErEv5cneAwX022E22MysS3MWxQrW771nC/mc1ocv6Hb95441y0ltFq6Y6lnlPCreBzXjYLuBoNma8WRmiWo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GBifGdiWwi6L0qvu4oh9NaDIP9s4BfkQY20eU7JMjN1bzProV
	Xw1/RRzgBy88+L6DI8p0lhMmpJxFex5W4LGGwx/s2e6YOkFxo25mIrWpOdHwoboIKQ==
X-Gm-Gg: AZFdTZckfnGUlyRTlkjARx8Xa3vs0NQqW0flrieWYCYcI6NY08Teq+uqn7dF3e0HLuS
	4UIYcXdtfVTl0fK3+CqbDo7xJ3EKMdkr4dcANfpw10QXOScV8H/xf7goJVxnHTthRgIsXtS4JlL
	PvACQNbJgrYjoJN6HRG7AGrTbg3UstoBT/WBb81cD1eNWDFoWxv+tRDTKxE930L7LPjz/sdyIVj
	3C2xtuyCdN0Zky/RkGiCPlh88IiCULDKAkffi/vmtWA5Ct9hmFPcg9Pj5zLjWxuWrXSYTRNCwss
	mcvmCe/0jhi/d9eQMO5R/ZAvDdUDIz5hybgPFBlJeSJkdO4FTG6yGt13AG/089V08QFIOs8u9HT
	RmAtCYNYnxJjq5o5bsUUFx6Laq2SRE4D9ijtsAlm/QsSG0cQcpiqVRTUhsYD5IAIE+hdZF9lvk2
	xpm+/74lMxechQJUaWRBlXOpAmr+ZUf1QlFxNSrRoceAjv7qrtywMkjiGqP5KOY0j7swnqm64Xz
	53sTvtqjDgsc+UbMs8/EX7IkfokfWIQeeGkTF1cUJYz/EStIRHVb0n5nGEmKPTSsoJds7klgrTn
	9XBrAl3EIe/yogCkPrc2Uo/IGN14ckVWYgJpK3ztg6nevbYFY1lfIc4L01mwgPq+c+ImJb63FWG
	rTbFdzT6DR+lRIA==
X-Received: by 2002:a05:7301:2a9c:b0:372:79a0:e8a3 with SMTP id 5a478bee46e88-37963374fdemr11690960eec.1.1794862428808;
        Mon, 16 Nov 2026 12:53:48 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:40c8:6e27:a2df:3321])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm67120390eec.21.2026.11.16.12.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:53:46 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Simon Glass <sjg@chromium.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Julius Werner <jwerner@chromium.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v4 05/14] pylibfdt: Unpack Property.as_list() in a single struct.unpack() call
Date: Mon, 16 Nov 2026 12:53:02 -0800
Message-ID: <20261116205320.1621386-6-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
In-Reply-To: <20261116205320.1621386-1-dianders@chromium.org>
References: <20261116205320.1621386-1-dianders@chromium.org>
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

`Property.as_list()` currently decodes multi-cell properties via
`list(map(lambda x: x[0], struct.iter_unpack('>' + fmt, self)))`, which
constructs an iterator and `map` wrapper and invokes a Python `lambda`
for every cell.

Compute the element size via `struct.calcsize('>' + fmt)` and unpack all
elements in a single C `struct.unpack()` call instead.

On one stress test (decoding ~301k `/__local_fixups__` cell lists across
438 arm64 Qualcomm DTBs) this reduced `Property.as_list()` time by
~2.1x.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Found this speedup while benchmarking fdtfactor. It's not critical to
functionality, but seems like a nice win.

Changes in v4:
- New patch speeding up Property.as_list() with a single struct.unpack()
  call

 pylibfdt/libfdt.i | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index ff9210d123cb..e4a9357d278a 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -931,7 +931,8 @@ class Property(bytes):
         return self.as_cell('q')
 
     def as_list(self, fmt):
-        return list(map(lambda x: x[0], struct.iter_unpack('>' + fmt, self)))
+        size = struct.calcsize('>' + fmt)
+        return list(struct.unpack(f'>{len(self) // size}{fmt}', self))
 
     def as_uint32_list(self):
         return self.as_list('L')
-- 
2.56.0.679.gc527c65306-goog

