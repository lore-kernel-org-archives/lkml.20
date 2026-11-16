Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794849506;
	b=wwun8V9gX2cFxbkotvuX41wlNNsmBnmlhCq/w8NBPaklYeDnJohi0aJe1VsyeWKhz0yo
	 vhejVMBk9owNykPoWyz9WrMy0v8/+Fk5kb4wEJOZHd6IzqqL3hq2kMN3Ceg4VO31x4Ivt
	 MMShd1oMpitavDsr+he9WidRAhQMaigSzrgnXAUFN8ccoJMyiDjSrz0mEb77JEsMX4scw
	 VdqwUfQGxaFpZNT39OdoalgNZ6OQKEFys/zU1UvpKM5hBPYSG0FJ+Mr0YTKmj3DLco128
	 XjfIiJA4BCvQvZHZD2ZiXK0qnnyptDKMw2tKgc5ydXaYHTwYQEkNb32ViWa4EcyvcSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794849506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y7Ml2BhA/CMPyDRBgPTdQ/lnKCFAMxSxJnPWD3wvhfY=;
	b=rPH0q/IVubGTZYCsUx9ZVAccmmuK82VfCFUi7ABG5kNudw+pmEihdileFkLJ0fO1XlpB
	 rQmPCvK90Jdl3cViTslM8IcY93sPGTo5S8sfk/2SPoYBTrALGmaEF0WESiaSi9BqFJFfF
	 jHyTDc69sB7/mDaQxW7CLhIu6uajHElWCJ6yKbvCSWwTA6UpgPZXdWYyKXnrsqZyP8aNW
	 ut6vYKFFWNLBsYDzpl4PHRqbneq/6s7IkK/8il/RIQLJYJEdYye1L7mAIsUPkJ60VAp7S
	 YD3M5bC5s0RiZlKvoGlExuon/gMiKz9etpO8qhrpDP8kzL3gpbx9vfgWEAEAT98L6Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x7W3L7KS;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5301D606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:18:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5301D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x7W3L7KS
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so4838218eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794849505; x=1795454305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y7Ml2BhA/CMPyDRBgPTdQ/lnKCFAMxSxJnPWD3wvhfY=;
        b=x7W3L7KSmaZ8OqpO5MOm6QC2PLVVUrvrzIJYMfIBy5ijKDIolXVYWSXMx+5XlIteQX
         o70iJBJX0Q5Ga8Fts1frUdIvpaeVpryacI9xplFNQPVocPb+Zl5pxVhMW5Fa8hAc9e6i
         f2BpledfebaJjmXX9gBw99R/HLxNhtc0xdrvZkLRHN2VVmrol8f+fMME2twVtPh1w5f/
         btu1iEfA8coutFHTDtSbX0geMaByBfyt7990nXaTVVqzND6LUnNaCLSrRTK83AzrlzZS
         p2u3dPBduCS9O5RIK27VlzQa8zqkiySgCBw6unR+t4CYDnvQes8giPnYnV5W2M+730Ry
         0ZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794849505; x=1795454305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y7Ml2BhA/CMPyDRBgPTdQ/lnKCFAMxSxJnPWD3wvhfY=;
        b=Kz4M3R5CTXyfykqBOOnrtOWhWbWz2n3dn3qQqa4nT9c2nTXxc9u+qhMoJF0QkPTdmk
         pxFvFm0YTx15GTJTd9yZaHt/4OjFr8vHULTFCZZtf1DgoTY1oSR+QKQ3WVm04YlT/8Y7
         yWbddGpcuFd9WZrjG/tnfMfMY/cb23M8POKvtPhPZyXzXDZqpZBoY65+oFyJV9XvjuaU
         logx3+F38GbOzqklte9ulAGmxyMCEjVWheRTVCsWIJJYOxMUSV0Ubm9TO5isdm2GSTqi
         oDbVVl9m4/U1euHqmKIVPqvYS/3NhO07NlOil3EhOUDjod8Nv4i76qfqKtWUVzOoMIdT
         0yFQ==
X-Forwarded-Encrypted: i=1; AL+hErGOqd2dfwCmZNF0JVm11+ZB1QAolgvUUOSOUcylChukOgEU0M5VynNdjig3M8W1nOwpEOJ2g3qvmVBddis=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KvgMzneQWftm6D5zmxd29Tq0IMY866CX3I6w5HXFxEJn/tgwY
	8onk0DCsiyBjWiJ4aby1RTNDnA3QqpD8renz+kt+8I4wD/hr9qZToe+G
X-Gm-Gg: AZFdTZejTxLEP3n7fU8uFslwfvoN24wInICZEJwm5g95FdToI8rbJL4QaCo/ihxBh1z
	sw/jdCAIKOdjkJeCAqRw/Cr2qd2r8Yo9bEUexzPoeejZRKVuI0rTSMEdj+WQlmQZM5hqalSYE5u
	DzodBjO3APL0CWcF8C1TnIs1LfaDpwrlDzhu2VGIDARYp15gSHg1jILsqzNmo4aUDKz2ChBrZzl
	RTHM1YvjzT7s7acAvt/gbc0D36OQYzU+N2e2fkxorgDpfHXUqYJGRPTyHCw+/wUG6rN6PrLas1h
	K74gCvsy1m6hkCgobEuaRXnRFH14IYKBgSgtFERthqaNfrV+ozp06rJLxftf4yZavhEILeOy9de
	ptemS1N/asQnDSX2CS46nk1fJWnLW0WhactwnzSHvWmNyGWyUaxqOknid32dS2VFaCnEAQiyojI
	qmilEFToqLIFf4nqgS5xROMFObSdDb2egL38VTkeB4Sm4tOA2nVN53Pu/KD6Lg7kfC/SQq+kaaC
	+0HbycFOppmt/mF36v85E/KIa+hspEtdnF51MmBT9lvsBxnnVagwZ58ulFox0PMZFjK7AeEFOqF
	CA0oF+FHUn5E6XkuxizhYqb46Aa15Kwlx+G2Gxaw5YFmN7lEcCIp5eteM04a60cBj/jc1Odi0Yt
	Ajz+Pvy1l1Z/CmbVry8QzP3ZJAFipX9drPZf0jn7b84rLPzNwMpkR1DIHlw/QzOx5Zug7sjd7WF
	hCZ8IvNZKSIlAqVEfCXEJM0BDYfq2MdZmtFWcoCBalmg==
X-Received: by 2002:a05:7300:72cc:b0:372:598d:c0bb with SMTP id 5a478bee46e88-37966e3ad18mr17310894eec.13.1794849505368;
        Mon, 16 Nov 2026 09:18:25 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379559189e8sm36847831eec.11.2026.11.16.09.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:18:24 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Ike Panhc <ikepanhc@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH] platform/x86: ideapad-laptop: Add V14 G2 ITL to ideapad_dytc_v4_allow_table[]
Date: Mon, 16 Nov 2026 22:48:10 +0530
Message-ID: <20261116171817.21802-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The Lenovo V14 G2 ITL (82KA) uses DYTC version 4 for platform profile
control, so ideapad-laptop currently skips it and logs:

  DYTC_VERSION 4 support may not work. Pass ideapad_laptop.allow_v4_dytc=Y on the kernel commandline to enable

With allow_v4_dytc=Y, platform_profile registers with low-power,
balanced and performance. Each profile reads back after it is set, no
ACPI errors are logged when switching, and the firmware applies it:
with all CPUs busy on AC power, the sustained package power was about
14 W in low-power, 17 W in balanced and 24 W in performance.

Add the V14 G2 ITL to ideapad_dytc_v4_allow_table[].

Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
Tested on a V14 G2 ITL (BIOS GGCN55WW) with the 7.0 kernel's
ideapad-laptop and allow_v4_dytc=Y, which takes the same path as this
table entry; the patch itself is build-tested (W=1) on pdx86 for-next.
Package power is the RAPL energy
counter over the last 20 s of a 45 s all-CPU busy loop, on AC, with
60 s of cooldown between profiles. Fn+Q does not switch profiles on
this model.

 drivers/platform/x86/lenovo/ideapad-laptop.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 91a8d11c79c5..ebd4bf6c8798 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -1134,6 +1134,13 @@ static const struct dmi_system_id ideapad_dytc_v4_allow_table[] = {
 			DMI_MATCH(DMI_PRODUCT_VERSION, "IdeaPad 5 15ITL05")
 		}
 	},
+	{
+		/* V14 G2 ITL */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "V14 G2 ITL")
+		}
+	},
 	{}
 };
 

base-commit: a362539b42193dcdb17f8fba40031a515c53885c
-- 
2.53.0

