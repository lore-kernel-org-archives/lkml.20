Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793292860;
	b=Ai0PeAOXgUZZEAFWFkZMUiRHHGkcsT+2HQHYikiRHgJgr6w5GNb0aCjXEVQ/+FVo0/ur
	 dAUte1DKV08YM9HD7W0KwIev4x7VoPH+RukjHyKpgC52KxtVYdhB9qdcGxJY2a2U62v5R
	 90jYXLHGqNmonEOL2uvleJVEuzo53ARYGnCmHP3IR39/NYUWyR8qAF3PhgEGN4NT7Bgx4
	 Jm8rdgGSPuTMQaRyXFlbquv8mwf887E26AuKLUOSv9Mz2YR01XTJxpIixwTwScOFNiGKE
	 MRWqod2xtepfnmlAK0VY1ZdhLyW/ZhUIxbw3XwosCjiR2C4tRFWi1Y0stigqn79nucA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=rWfNIvd9KHSVhrKI7F5X/cP2Aw32Q6yFR8REkiH5EXY=;
	b=VFOJudFqhm9/H8YCqLxGZiDDT9eLhCg4LNatAQle3/CleblQmh8sakbaLegjq56x4PAQ
	 5YKhbC7F1T3z9Ty3KHxDlTV8U68+qsdPhaokiMZrvCO/7cNFVmwlz4AbOX7wwKQbNjMJf
	 bjtTWyc30qLe5jwZo7S9AOpbK/ajGzwxv3ZyDZ9VeKKMP4BiO1FXzCkI/b2GU+lPRPNsG
	 daRLjHwpvu7jNu7jUE1PnVhcykz+JtCXuhLnLKQakpZ/43iCN8DvdaCAO0Fk7GL770m1v
	 4/eDPQVCQQtmovakRi2PZlGPBj+SOHpwXt0rYlxygz63UFduSMZAwzvPBjH+D/FNgqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=FTIkw6Pk;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B48606A321
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:54:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18B48606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=FTIkw6Pk
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e0d1da913so702687f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1793292858; x=1793897658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rWfNIvd9KHSVhrKI7F5X/cP2Aw32Q6yFR8REkiH5EXY=;
        b=FTIkw6PkN/tJBLpPjCD5eLda/R7udutck5k9tmyoNRO0xtJ+Yqxw4qkWhUzLBXPBX/
         QN0yEuAJQug62Z9jCa28dse2m30LDvEidEOChn3cWnP7PKp93HheoBvreB5ahapQDtob
         GOCdwgJMo2VUyw6avEXB9Q004IVCxZx9RQtIAJLtYNfnUwykQVVxljfLTrkA7mRESez3
         pVFgxLItrTPRYF7I8w8yfv1J42GKqYT+pwoDgkeVAbIoguTbbQI7p9w7pwFRBMAp4HK3
         6VlTl1grNBnZbeAqqJnam1HGsrK6EUq/M/zbtE98wx26qjmRcZVcvmO2m1xWpSGQFhex
         h64A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793292858; x=1793897658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rWfNIvd9KHSVhrKI7F5X/cP2Aw32Q6yFR8REkiH5EXY=;
        b=xRQaFc2AJvrCcATvtBLhX8Ixg2snW6CcL54mw3ch7kOD3MYPdfiksFqLcOj6g9m8uC
         H4DD4Rx+x4e2WebRS1ie05dGnY4sNChuGj0DAtLm3PrkY8Kh8Gwty0OFcB0YMTzyuvHM
         BxdnEoNWa+6gHy6gT5jwRCjCg8K16H5d/mLzPWNcPeDYyHgd8nFTO3suydcMNovLS2JS
         TLFUjwWVl84GhoYpHlfgJIvgv/8Jr3e4evWnL2EwP2XLq4YJdvGpMiBSFS9zZazKbF4D
         tgpekJYT9InizyTdnayIdSkqoP9zmJ081UfiosGngvFFrtjNP1s0ijtRcfM82xo4d/Mc
         DGWg==
X-Forwarded-Encrypted: i=1; AKwUvByFveXYQaORJKfI8OiwHqJznY2PaMCQEAt9KFVu0PbwSDl2l9rqohq6hdOn1xjsiAFXQL/RKKlUrUb82yY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIF18JyeImQxOUvy6OE4IBrm9hD9QlYRdikyHQVgu93MLBRnmfO
	gzRRKU322XHjS5YsbWOY+ac81UkkWABq5o1cK9VaWCw2T1/eJ+g2XnOn5q4kgxQ3ntE=
X-Gm-Gg: AYBFou19Hbm3YLwcpK4Q6gUkCkZygA1tG45IBnhzdE91rpjfylfaqytczsc9X7zucR3
	ss/TlWH3uZ9Avtz1E7wUOMgpXrFlBQpUaDotsJzVFJqtlwSp/BW2pB18F4BQzxkS7kzjWDBbX8Z
	DU1VWvPswi4TPevMSfW1A4CnAOMKwMM7Ajkunyoogm2vTFEjHat+w8irVZarMaA7GK4GpHk3///
	eva1YDHxXViWjI7AEHil+GWxt7Pc5r4uDWypRGQVq1sW8qMyHasdyS7NQ5Mx6VcDSM6rqy7inVO
	fssACeU5PJvBrCKsDl24g/DYAWkx4A8slsYftF3jw+Wcpc8wf1TtWaGcE3aGXU62UmYGHrCW1U0
	wmq4XOdizxtkF+cz3QowwoO6q8vj/6PfNOvCXSG5dnT1O9oJCm9V69Cg2ft9Q/QESA6RlrfTUYN
	5S6rFza8tB6lUTfo98/NLSunL9AYAS/NTSVMR/m3YAN7O12wr5BzR8xrvGAwRqZ1rpMF+Yo7zkh
	fznijgsUivmQ/UTDyDmXPcBUQFc7NldYYBtzzsl5FtVbRhtTdByXi8JSS1fVEJxv+oWRRDzg5D/
	TLAgh4s18rK6Huh/BT+tFgHmdrVcmk5RaaZjbZBLopc=
X-Received: by 2002:a5d:69c9:0:b0:48e:55bd:9ce2 with SMTP id ffacd0b85a97d-48e64cc70d2mr5526326f8f.20.1793292858506;
        Thu, 29 Oct 2026 09:54:18 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:db5:c0cf:53f4:d20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6df87fdbsm310880f8f.13.2026.10.29.09.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:54:18 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Thu, 29 Oct 2026 16:54:13 +0000
Subject: [PATCH 1/5] media: cec: seco: Use named initializers for
 acpi_device_id
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
Message-Id: <20261029-acpi-media-v1-1-eb50f0a34e36@thegoodpenguin.co.uk>
References: <20261029-acpi-media-v1-0-eb50f0a34e36@thegoodpenguin.co.uk>
In-Reply-To: <20261029-acpi-media-v1-0-eb50f0a34e36@thegoodpenguin.co.uk>
To: Ettore Chimenti <ek5.chimenti@gmail.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Miguel Vadillo <miguel.vadillo@intel.com>, 
 Antti Laakso <antti.laakso@linux.intel.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Bingbu Cao <bingbu.cao@amd.com>, Bryan O'Donoghue <bod@kernel.org>, 
 Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, 
 Arec Kao <arec.kao@intel.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, Kate Hsuan <hpa@redhat.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793292856; l=1075;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=G7LrNd+dF624ZiXyk14jYht6szTrrJKNGSWqp5QLf+U=;
 b=oc0ISUO/Ys+wXb++/90Cl1FqTqKn4Mgr63H2IC6cDhi+ghcSZwFbi4USMACYUSeNTnvayaC0S
 zBVVDIec7ogC12jzUBzS15DTuUhzoP3n7V/XuE1moxfBQsIKCTBEPW7
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base. Also drop explicitly setting fields to 0
where it is redundant.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/media/cec/platform/seco/seco-cec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/cec/platform/seco/seco-cec.c b/drivers/media/cec/platform/seco/seco-cec.c
index 12db6dca602b..2d7ee5638eba 100644
--- a/drivers/media/cec/platform/seco/seco-cec.c
+++ b/drivers/media/cec/platform/seco/seco-cec.c
@@ -768,8 +768,8 @@ static SIMPLE_DEV_PM_OPS(secocec_pm_ops, secocec_suspend, secocec_resume);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id secocec_acpi_match[] = {
-	{"CEC00001", 0},
-	{},
+	{ .id = "CEC00001" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, secocec_acpi_match);

-- 
2.53.0

