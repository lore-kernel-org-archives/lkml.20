Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDA44749F4
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788191718; cv=none; b=SzE/LIRh0cf2Q5vWz94GCIx9VjE3J9t1vwieGj5J3QiNDmFjgigM92sstTXbnvZWWLePq7f1PBTsLX97crfxf2fzTRmc139sWxmeLpYhbP9mjE8PeP1o6GnR3vkQhiUMfkdPGbOIJNU2Eohp4KA6NyPDncT2KXnPaaCKXZUrMvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788191718; c=relaxed/simple;
	bh=kyBxHFkuQn3FS5OvT3QiCa4szxRN8wQSZLeSF+Xb4P4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QY/ec6Pm1QHKOWXe/EiAUGqVFwC2LfH4LcxEl2ToYqbzvzi720MkkN4nln1shRx3MHGUUmFEfCMA42NRv3foEJE2+Sg+8KRr0/IY6nbrcKnSkxRUow0YtiV3/z7GRGr0TIb3Cz5dXb/TcfRHyjiLqtpwiN4euf7yyx/KACvmVhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sa4Akin7; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sa4Akin7"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-484415c8cb1so105240f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788191715; x=1788796515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bh1KXOOmBOjDBOj2ACsh+u/Pu6jBtIO7BgsluZcPxUo=;
        b=Sa4Akin7qk8AsFq1+Me4krvf9BHB4KFnxRAaUwTbc73Y1HhOXoh+3w+47pFZ9ryVBY
         ZqNtP7ien+j/k/3CYR0wUOsbFlLOBpxALqmTBQSGKcxhaUNCIFckjuhcPs2LxbKgV8h/
         9Anaihk6i4FmZbzQn+umraKs+WFXng0yDzRTyPpIqbI4crre99clxymtZ8JXW14KU6Sy
         stYS5ifsV8Jt1axHZN8mIqDCdOZW/UcYBLCLfbpFiI9uXSmhBBvqWL4Olva15rko38n7
         gwPrqrnU1zjXb+b8v4e6ryLchtzMEFyfc4dVq2mkyH1HIk90MxW+NynTz45FVM9VaYc2
         nlRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788191715; x=1788796515;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bh1KXOOmBOjDBOj2ACsh+u/Pu6jBtIO7BgsluZcPxUo=;
        b=QsaF733QqOPESV9ldlfko32qghh/Lq1h+UUmPbRG+lAWyUOLUCUZU1uvK0veHAvxkg
         PDIojMnWjRWJfLeBVKRnuT7rrlKOmonYnS81JGXUXnzy+mI+CE+9VYg+RuyDMpv3XmNR
         E90ZIj6TOCHpMtx73VBhTpvPgCPlthZjG2xvpwGOR5UbnviovsM+zrtKzPPX7CJRjZZN
         /CWeONUUWIRXRulOePqrZ6bS+H7je2O7/H/2rkirNMFXqXOCHIsKMOgk5ZOltmiqDwdy
         XHh8rGfTQIRbS+ancD1/b7vaHNUGhkxMvdTADgyS2L5S7FKGDkneC7hzywZ90+KXqgH7
         DPPw==
X-Forwarded-Encrypted: i=1; AKwUvBxd/SaugNjP62edpBojKNhMDVPC6tXSfXWV/+WrgJ0FefdqEN65XbIE0zqx2ibcBAYS+oU/HH4e3jt7qLo=@vger.kernel.org
X-Gm-Message-State: AFuF++maUkZkZFiIqs6pQ9ZLvIBqEK7xLZtolk/OknzVkkoAddn/cNX1
	RMVJU7MUdVYg6LEzFYN0WJ2VpBrpejdddQTHS2taRCTE56TmpjET9G08
X-Gm-Gg: AYBFou1obfLwgc2n2Aj9tJq1vPwODc4asTk1Yr6vSezc1elUIWNNMDBCK774mP0YhjQ
	968/P7u0P+qBIG3rAtlsunRHdX38GP20tQmpWju0tLMiHGxPihYC1xOyaSO34ErFrbWyYFwc9ey
	UIMQM9ujUMQI2gHyLQNxQgttcarl+2caKFu1KaQnUZmT+UTC5JMzvIpRPsqW6HKkJ2T9z2DO5rt
	8eBE3GCjZfKxxo0zCYWiRinKzGdGCIwA8pD9vGI8Wvd/sMMf983SQA/W/2Y0gqkQOhDme4XbX8P
	8LW2Rx24FuzLWCgvSzYXJeAKTpdbQP39Uqn8H0y2035H/5fFwScdlV8/xY5YBd61FMvI9CSTs/J
	AM5Wx/LnWDweFUtjaEG8f502FMhP+WyKr8/9QO0NCXGFOLM14+HymR2YpPntCtrJm3EpZOmbMP7
	pqxbFpIVg3JFp7L6f8lLaxvCbnOEJvYYibk00X1/FZbc2ryo7lULF+qoOPQfdD5c6ryuYgeJ+wU
	rG8rvNfxjMKJKn6EdcqJcsZRGd9TmfqlOk=
X-Received: by 2002:a05:6000:981:b0:484:3604:c7bd with SMTP id ffacd0b85a97d-48440ff8ec9mr3258271f8f.17.1788191714553;
        Mon, 31 Aug 2026 08:55:14 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48436e2af3asm12949099f8f.12.2026.08.31.08.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:55:13 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH v1 4/5] docs: ABI: complete power_supply type valid values
Date: Mon, 31 Aug 2026 12:53:38 -0300
Message-ID: <20260831155339.181487-5-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831155339.181487-1-ivanrwcm25@gmail.com>
References: <20260831155339.181487-1-ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

sysfs type already exposes USB_DCP/CDP/ACA, USB_C, USB_PD,
USB_PD_DRP, BrickID and Unknown via POWER_SUPPLY_TYPE_TEXT[]. Update
the ABI document so Valid values match the implementation.

Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 Documentation/ABI/testing/sysfs-class-power | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-class-power b/Documentation/ABI/testing/sysfs-class-power
index 5641f1fd5fd6..08afb75973d2 100644
--- a/Documentation/ABI/testing/sysfs-class-power
+++ b/Documentation/ABI/testing/sysfs-class-power
@@ -34,7 +34,9 @@ Description:
 		Describes the main type of the supply.
 
 		Access: Read
-		Valid values: "Battery", "UPS", "Mains", "USB", "Wireless"
+		Valid values: "Unknown", "Battery", "UPS", "Mains", "USB",
+		"USB_DCP", "USB_CDP", "USB_ACA", "USB_C", "USB_PD",
+		"USB_PD_DRP", "BrickID", "Wireless"
 
 **Battery and USB properties**
 
-- 
2.43.0

