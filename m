Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406432;
	b=f4IA1i9eUO0Sy4vAWUWFkLQFqvtOGvEot5ehwLLQoQedgTUw/kffgqN/5X2F3YucIoKr
	 bt2ikxzxAF/zJKMvkCvysw6mtHg7syhSkivTKOOkeCHZAVxbO3meh6sS1Zgi0T1zQjEuV
	 qAmwgVUyxIOiwWHNuqPp9j84UvkFgqjLXEOq1YspuGhonhtFP3H85acq7u0o4EZ3Ub0Lb
	 /RWbnsI1JW1N3BDpCyxDKq0GwXs/nMzu+JT40l+uw1YBTz78REMiaKhjAufNveEi8PNCs
	 xF0coDMzKWPubq9LzebGptHABLqoiQq1MDnL7tYbps93K0SIetXCO9UVYeUcYqRZvjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lm9VncPkpHuUMf6V3GLKH7/yLlzBilRZyjcQhAoy+ig=;
	b=ApM5Q/kuRHFa3uT3VApZpMxcHvt9eZGdqmrTQz+FLZS8nNB/2I3rDyrZO4x5JZXGAaWH
	 hO8KXlL1Mpi0fkct0/Vf7wQ6xoCc/HPRNb0DuZVIVOiPZrECNFFhpFVVam8pJbi8BA6Jy
	 JcIJX7lFX1F9jIfPMWt2jVEA7OjPHawTiG9DRYY0gWK+54If0DQ+pv/5CBjQeQmvxgRBx
	 lS5PhYYmO5rYgnpGKMhHm0mlSy4jvO2k+EEIC8b/itQ5KD0TBEfjhL7WQV2KYSV3S76nU
	 BECUCnri0y63jSPIi/ubgLs9deLlU7o/cUlSolOZqLhdTjIJ9gYWZcicPCo+heV3VSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u84WoHx2;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A09F60A262C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A09F60A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u84WoHx2
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdb45e96d2bso1340263a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794406430; x=1795011230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lm9VncPkpHuUMf6V3GLKH7/yLlzBilRZyjcQhAoy+ig=;
        b=u84WoHx2LFq6Ko6RxBMcr8AnLKz8YdHDcEN0t8eXbMbrIVAJgBnObGJBAxzM996pLG
         Js/KJAv7mqeBtKSPRK5EDC80VInTmYFpLadRyUDiJXJo2FC2kXkBVNToYTwdSVZWHFXk
         SEc97FjnIwuXhkYZ3OgCeqyTCRIgrvRrYd0YvS71dVLgNUTDOI0ivwvnWe48PJXGZb2q
         rF7uaXrmrG0m4Too5ZpxKs4V/3ZyH0IqHosBODsNlI1WjuyyeRkD3sIT9Wq4HFJUlYDn
         7In835f4rUP2/7wz2n8M7zSMjOAICgzFm29xdH3uDHn4StSwJhlx+cIeYEMwcAwhv0Bw
         +ucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406430; x=1795011230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lm9VncPkpHuUMf6V3GLKH7/yLlzBilRZyjcQhAoy+ig=;
        b=jmLjF993VdJ5UTsBhZLbWDe3VtXtslNT5M2a16ockqRKn/xlOxykHB1CKsatTt4h8v
         DxU7cjqYMVCrPYE/4IbbrGBDF2pydLZv8HTxwvqu2rWQAaX/egoeztdP+N7Z5Z1UAYbX
         8k6rk1ADUlvjAO9uncAPW/qW2YyUNAl4xj+hc+g1Myk8GhdjHmYWPbS3oBaE7hp42w/k
         v5vJ0ot+qoZtFq5ig6Nd8g/7Z7r/YSiIq/VXEbIT6bv9Ml9VsNRdFgUb5cbLyPQpu2Fi
         9jYaokG1dxSUzDl3T+VMTeTLADzIxbKQqt13M/i3JlHQuai7DBUF+bk5rZ111e3dviOj
         Zv0g==
X-Forwarded-Encrypted: i=1; AL+hErE6DXjhcdulky8XOViCc28z6+d3vL2UjICdXxTCFJhV5PjZCNPN9lrFTo9ojYFaYVhRUa9JyHn0YQ9tqQo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+z2ZZSGuP5eGNbXGYyCPh3m4mJ9bwqcSIA5nwSHKJL4J/4E/Iw
	moIueEL9bJVeyZ1rz82nGz+ehmA6h9RjAo8Q4xbPH6nx6DovvCAeHILH
X-Gm-Gg: AYBFou2SSSn6CMGjCggUCk7klvF/p/3YXl+Hy/UzpdbQ2LigG4Nt4ZYAz1tZ75EyGWz
	CkMdV2Ty5sXGoiEU/3FFHnz/iNqV2oKxY5ObHhDLUvWfQ69AHP6D6zDIM1HefM8X33gYVXrRfUG
	pG7OUK6Ujmad/UPv3jRBcVWwLZWlUsl977cSkaeAKbarXI+2V6+hnVeKzxI6CA7Zxgb63TCIiG8
	VAOpUEFJpgZD8vtaCzhd1JQLJd+6zese0gT+lKLVTb3p7lOnJfRu2e/Jzajh9qLv9ekO7JspR0N
	Uv5+rXmcew6RmWo4G9K7qdCCqLKXhwBsxFy7kD1fWqMYWzCmVW5XOs7nBzqYJHctNczo9SzEb0f
	dK+tOVppcNl4DdZpyGIUwe0aaajqxffxpmBIFuj9r1VTjOUpcSk8rr3EbZMP40KkxV1hlLRUizi
	CoFv5GL0jdGBWr1PbPi0QqTS33ob13IFfBxeYoDXtL9tHEvWYBWO556sI0yAFwabKfAVvWcpwWU
	AhNxl8AvmKsb8o5iDJOv9qWJxMdzm0r5yyjzTjCP+ILovFI+puaKwdcbIT0YnJgBfvFsS7c13xX
	Zng=
X-Received: by 2002:a17:90b:3bc3:b0:3b0:9a1b:b709 with SMTP id 98e67ed59e1d1-3b1830046f3mr2991563a91.54.1794406430379;
        Wed, 11 Nov 2026 06:13:50 -0800 (PST)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db319bdsm4789970a91.6.2026.11.11.06.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:13:49 -0800 (PST)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Jame Jao <jaojame6@gmail.com>,
	Serhiy Shliapuhin <shlyapugin@gmail.com>,
	okluar <okluar@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v16 6/6] platform/x86: bitland-mifs-wmi: Fallback to balanced platform profile if last performance profile is not available
Date: Wed, 11 Nov 2026 22:12:26 +0800
Message-ID: <20261111141226.9482-7-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111141226.9482-1-qby140326@gmail.com>
References: <20261111141226.9482-1-qby140326@gmail.com>
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

On Bitland laptops, performance profiles require an external power
supply. If the system enters suspend in a performance profile and the AC
adapter is unplugged while the machine is asleep, laptop_profile_set()
fails with -EOPNOTSUPP during resume when attempting to re-apply
saved_profile.

Returning an error from the resume callback simply because the power
cable was removed during sleep is undesirable, as the device is
otherwise
fully functional.

Gracefully handle this condition by falling back to
PLATFORM_PROFILE_BALANCED
whenever restoring the saved profile returns -EOPNOTSUPP. Update
saved_profile accordingly and notify user space via
platform_profile_notify() so daemons such as power-profiles-daemon stay
in sync with the actual hardware state.

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index d9678b979620..517bc241cdef 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -392,13 +392,27 @@ static int bitland_mifs_wmi_suspend(struct device *dev)
 static int bitland_mifs_wmi_resume(struct device *dev)
 {
 	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+	int ret;
 
 	/* Skip event device */
 	if (!data->pp_dev)
 		return 0;
 
+	ret = laptop_profile_set(dev, data->saved_profile);
+
+	if (ret == -EOPNOTSUPP && data->saved_profile != PLATFORM_PROFILE_BALANCED) {
+		dev_dbg(dev, "Cannot restore profile %d (likely on battery), falling back to balanced\n",
+			data->saved_profile);
+
+		ret = laptop_profile_set(dev, PLATFORM_PROFILE_BALANCED);
+		if (!ret) {
+			data->saved_profile = PLATFORM_PROFILE_BALANCED;
+			platform_profile_notify(data->pp_dev);
+		}
+	}
+
 	dev_dbg(dev, "Resuming, restoring profile %d\n", data->saved_profile);
-	return laptop_profile_set(dev, data->saved_profile);
+	return ret;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(bitland_mifs_wmi_pm_ops,
-- 
2.56.0

