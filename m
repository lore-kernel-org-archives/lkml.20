Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793036681;
	b=oE08iK+LAj0+y6p7bSnghcLrc3x5BoJMnFnKcd9h4t4D1R9k1I/1NtfvyI9hGVogCvJr
	 1mZdzNKg8wkp9Juu0gFWSyT9Cx4yNIW9cSS7JA+y09dvRZ2vdypuOED3Y1DlzXaQqnKC/
	 j1Zi2C72m84XSTy3oW4Nl1nP1f0/48zRttjawyzIg8WcH5p+c3Ol6fuSCvGKRc2gwd/zT
	 JnjLmVmJeyXYgFfNPel9zHJm3zm1QKxcJSzwVEaBCfoXm1ZAjiea4Q7QWO1vnI1P7nIB+
	 +CYEITiEn8QYVCNvJljTlag7U/70WV27yfW7xQZv+acU4q/KZqTthO7mxOb7I0Adjvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793036681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=VCDyE/Rla7ZTFbrWbkl5F+i2vdziDZVe9ErSwypy7mI=;
	b=cUcvnzH95wro9C+NPSCjwHzfa4jf/vdM9MjwbDa+sRe6L2GbYoj9SO8DZWiLwI48VZM1
	 XteRJvb19OQd/YaVFKHgU+Phj0LVKojY0U+08MSK3La7Hnx5S8BMx0iUBd5EE+fGmR/Zw
	 emsRwwDIiMKF6V2CWrqHVdlmsv+nSxymwprSLyfTqona6rdLsYPL4LPLgbDXshNqo+Ylk
	 qIsEx155wrtaMOJhyQ81OsHk0FVEdao43Ka1BvBsBxYlDjI782VugY0zzu8rqllh0K/Q2
	 a4uJwBSFZM/TNjRm6gBSuCq8lzTEOPVcyNHift6gNcmA66XIwPQ3fTvD51DQYsOo2Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mswin.me;
	spf=none smtp.mailfrom=mswin.me;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1EE606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F1EE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mswin.me
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mswin.me
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c468bd799ecso416491866b.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mswin-me.20251104.gappssmtp.com; s=20251104; t=1793036680; x=1793641480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VCDyE/Rla7ZTFbrWbkl5F+i2vdziDZVe9ErSwypy7mI=;
        b=L8E5XqA6Tqzxzv5x+x3Dnt/A7KPA1+eFip+NQx04KhL6C2dStKFQf8ld29c5xMK85c
         HiIGJx+dO+lPi5qreXNsifCsc+BQaLcL/U9MYK7FV/DNzeJYAJnHYRztxN2Wns5cfLJN
         Fd3hX293ZhuHlLBFZY2Or4chX0tVIgcEykewJFRKVzhX9SeyxGIAuwK2ArvLos6ryo4t
         EP5bMzSifgq7ShQPG6eVE8cJoM02VumKLSRxxaCUObgQej9ox6C1Fnp1VwnsqEe/Ievh
         oMCY9pIt3nAHEWRF0LJx0TCO9asKtk6+4CNp83eGh3wlNc94zDh5mV/5jS9hyxTDUx9c
         fEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793036680; x=1793641480;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VCDyE/Rla7ZTFbrWbkl5F+i2vdziDZVe9ErSwypy7mI=;
        b=2pHSXU2hIx6iEO9h/PiidPXZEBWUhXFJXuouTbi+6J7N7xUGqpPRTI5s7jLsSt8ZwO
         dI4XspNpUMgrjTGruejiWkNKNJJqR9F/oF7R9Y/AL1eIubaROllh7c2Rp0NVsWTDS580
         SgtDpZOFNv9F4//VAhS7W3ah10U+4Ii4u6dyMEAnJc1LAEtIxyLGQ9srzlm5Er2t9J6x
         HL3RZ4KhjXe4mNt+LJdIcNv2VBGJqnm3qEreR+Z4sZxpLlYU6+lAdrrNvfqZ81ycjUhi
         AZ9rIsQnsGdVm4p/oEcIvw9486nU6vkFzHDO57xjlHtMGN4C8z4YKtOhamsIer06creW
         CR7A==
X-Forwarded-Encrypted: i=1; AKwUvBwAmvZ8cpGeqBm0MfIIG4I+xAj3j1cdizTVZjmwlGJ3IkL4ddFv5aUDUmwuQoSYF82ECK5GRrURFpy/bj4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLd9RG6vadtmyradFKmM3Z8993xBJVtDYDQXmFknQl31oTvz9/8
	F33WO56l1Wm8N9wetIN5dJbpBTTZPl56WE37tFAjW0bbwaRm5yA+izJitutMiESprf8=
X-Gm-Gg: AYBFou3nxrJEMoxhmc5frsBSPbtkEwx9upcVqUG1BM1Lv62Vjlmib9vBO2EOBaaEvKd
	VewkTd0M6f9bpqE4/rTTJ95zTAte2PjiCBQ4JX5uZx+QwvHcfIcer8gx0HFKmqn2+lv1U0Tr6Yz
	mKj9V1PyhORn9fE77giBGJkCvzHfcGmmqFZjbnlgd0CF3Tyu4JqJGNb41RFULQJqNLurHlW/+ak
	Y4F/u+Xm8B0I4nEMYWLYRkSQgu0czEDUN7lShDj3fpWO7a20vfdt9/kC8foAYlEghBJJK5Q+TJL
	VhKaHgtyQR0ZlHCPZ4WT6xhLBfSKMSacoPoNYeXAPkms3pViCx1F0KxVqM8NJE2Uv69t+9QXLnz
	FrJOkl06LvGzmTxXbnDtT0jshb9tD7h3tI0ttMQLdKeflp3Er6wHrHM0LEuwFe7TjVqdcXHLMqj
	31pKjWZHuyvivQ6hiBWIrTtLc9OdUl/jMxrADdUN7+00IvfE4CRKqRpXni1hVXE2fLTcTgx+oJT
	dxXqpk0xmp/dEz7H03kJaoarybUKsBtBz4WnQfawIg3B06Ehi+QZJ3YeZGYB6A=
X-Received: by 2002:a17:907:d16:b0:c46:9ca9:f522 with SMTP id a640c23a62f3a-c46bde42195mr863150266b.26.1793036679205;
        Mon, 26 Oct 2026 10:44:39 -0700 (PDT)
Received: from zephyr.int.serkovo.ru ([95.135.208.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd520838sm346004566b.31.2026.10.26.10.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 10:44:38 -0700 (PDT)
From: Roman Linev <admin@mswin.me>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	barnabas.czeman@mainlining.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] arm64: dts: qcom: sm6125: enlarge reserved_mem1
Date: Mon, 26 Oct 2026 20:44:36 +0300
Message-ID: <20261026174436.305327-1-admin@mswin.me>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260824155535.335494-1-admin@mswin.me>
References: <20260821032541.1856299-1-admin@mswin.me> <20260824155535.335494-1-admin@mswin.me>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

reserved_mem1@46200000 is sized 0x2d00000 (45 MiB) in the SoC dtsi, so it
ends at 0x48f00000, while camera_mem begins at 0x4ab00000. The reference
firmware memory map for sm6125 reserves 0x4900000 (73 MiB) at this base,
ending exactly where camera_mem starts, so the 28 MiB in between belongs to
firmware and not to the kernel. The dtsi nevertheless leaves that span as
normal System RAM and hands it to the page allocator.

Every sm6125 board inherits this reservation and none of them overrides it
or places another region in the gap, so size it for the firmware map in the
common dtsi.

On laurel-sprout the mismatch is observable: page-cache pressure eventually
reaches the span, and a store into it never completes, which hard-locks the
machine. Before this change the board wedged at roughly one lockup per
59 MiB of buffered reads; after enlarging the region the same workload ran
691 GiB of buffered reads with no lockups. Booting with CONFIG_MEMTEST=y
and memtest=1 sweeps 17 free ranges with no bad ranges reported and skips
0x46200000..0x4ab00000 entirely, confirming the carveout is out of the page
allocator's pool.

The downstream laurel_sprout device tree describes the same base as
removed_region@46200000 with a size of 0x4900000, so the reserved bytes are
not a new claim about this hardware family.

Signed-off-by: Roman Linev <admin@mswin.me>
---
Changes in v3 (from Konrad's review of v2):
 - Move the reservation into the common SoC dtsi, as the size follows the
   reference firmware map and applies to every sm6125 board. The v2
   board-level &reserved_mem1 override is dropped; v3 touches no board file.
 - State that no sm6125 board overrides this region or places another region
   in 0x48f00000..0x4ab00000, and that all four affected boards build with
   the enlarged span ending exactly at camera_mem.

v2: https://lore.kernel.org/r/20260824155535.335494-1-admin@mswin.me
v1: https://lore.kernel.org/r/20260821032541.1856299-1-admin@mswin.me

---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 86de156..fb126db 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -282,7 +282,7 @@ smem_mem: memory@46000000 {
 		};
 
 		reserved_mem1: memory@46200000 {
-			reg = <0x0 0x46200000 0x0 0x2d00000>;
+			reg = <0x0 0x46200000 0x0 0x4900000>;
 			no-map;
 		};
 
