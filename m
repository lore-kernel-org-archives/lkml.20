Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793286125;
	b=0JexSJ14rao5wTOv3sxUUQpJKdG6+TRkxUMQSXCMKh3uPIFbvgkgILJtpU2+lnMq9ome
	 x98dPrlBtVvIWgYD9pYUjaod+cBEaIdfJGGOtFjND6qSjLUrj+v73aznUWmE4n/d9Bi2W
	 CpxJCB5iX7m4UxMJKIkijYLYw4csl+/QZGXiq5INvZQfn2A3p1LwuYbRPDIuUpjLaTRzP
	 aXE+cw47cj1rMPqVattfabJG4xYv67Qnzbp9IzOzJNBHM/bUQfJMBjuGvrTW7ousk1GQQ
	 P1PBncwmssIpL81hS+Umaz6IqjpffkRwPY9K13Chm7YziWOXikgqzZYDRQu7DSI1q7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793286125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2dzY1VlFFnKOfznTWW/4WF7kG0zTG9oXRoGUydpsGfY=;
	b=YimLkp8Fs3CLaWntwFSdZtctF7CYc9H9nZNGYKqL9Zy7evQK95Oq7+3ajmljNiWF/olp
	 qCtQ8jC7t2tKep7CvnCTEk3FGBXOykH6/MKavcvKLfwoqyWVmxg1/XwBnAIIi/cgmr1gS
	 ywz4QlbQUPdrfIeWAezs9EOwyLs4V7xboPf929mSR6JB0lRsyhO7KU9d0I2eRPST+A+bE
	 W2OWB8niaspFAL0/erqVXHq4UewJD79voEF8wYwT6IaO7SglhKRRg7F4Mn6bXquOBAsFA
	 T3pVedRzVNh0iJAOak0nkyuZwz6FOFLiV78J1CW4DYhrOMKYPdp5lg1U+Oql+47pcCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eqMw4KqB;
	arc=none smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36325606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36325606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eqMw4KqB
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be4a2d94adso2272212e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793286122; x=1793890922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2dzY1VlFFnKOfznTWW/4WF7kG0zTG9oXRoGUydpsGfY=;
        b=eqMw4KqBocIxMJmGei4723yesql9KLte9N+AZ5pOiWjjIoGut3mKmKnbPvGwi22AkV
         UAn/zbJKsOcsfwdI7CFbvJJFVxzDV6kdFq8JZHXhaXb/CUicufWgb4qScQdW0gJ56or8
         1/RyvFydhPtEwlYa6eBroZSDoPDOc1PtkJ8URie8mM6GBHZ6GK6e1zsw3hZuav8evHc5
         0hkqcU+SHvQ4BeTuyTy4Fm9/hmbG/hK6NuhuKvH6tPhUjAuztA7AmtM2ZbAdYN42uXkQ
         Iwzc9Eh6l3piRuonxFgDcVe/4aiWSOO/rbaP1Rdpa/6VwaFvs2mCH/XiXnXUTOQx5eNx
         MdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793286122; x=1793890922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2dzY1VlFFnKOfznTWW/4WF7kG0zTG9oXRoGUydpsGfY=;
        b=MzgmMg4f2SBT3MEcIpTLScDUP0PGwc6DRzt68BNCR56s9WrYNdIu1eEcEEbzU3EtaE
         YQ0jyYK1QvQJdfs58IJNIvI97QpMa2qnNhIUe6qRx4tMFlLYfqkuKpkAmcFARCw8/T6A
         FnZLVzgeiES6f8lRG/1xS4EZekJymsFliZXqqE4hVwljACjJoDao3yOW8prTfrH9YhsK
         /Z1BF1qJ3JfBclLaFJPfbf5AU+XW5zS5XoNYl/vAck4k6cFOpgX0YbJomK/oYm+fdINZ
         mijPMJbW0EmaszfQ4xF07SerEOIAWygGE4eks7ATuRZnHrvkhCIeunymIEJx2y67gT5N
         rhqQ==
X-Forwarded-Encrypted: i=1; AKwUvByXrcxDg9Gr62b9iVFh65rKGAmiF9qtZXa2M59c/0Jum8YxZ6h40sSw2aGYdTPVWCqo5Tl3tuTg5PRZMuc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPtKezvrbR9nLGwiYZMq+QSuV75aDynRAV4dxWrizH2QewRlFL
	GdLW581Xc8/79VqMO8idPo8XEoEU9Xrt3P1/PNEs1OON06VYkA0Gvx4wDeUeSrn2c0Q=
X-Gm-Gg: AYBFou2ZAo4QcGxN6ebm2trzo+YY8FcG7NZnNWgWZn/cN1eIVPeSHHiQG1C9yemzqYc
	ZyJTx2cNC3fMPqAshvi30Mam6XhJJk+6FoJ1t5ZbdgynagCugRxN4jGXhV32eSBt7fgwPEfbFDu
	eEWL4Fclv7ma0j0DA04lAD6Lv3JNUjMn3xUsYXPOiAIDGfanNU07ceP3/nSpxb2NQDi8QnL/ePC
	vRqT0PsPc93mcmR1oxP54VNAn+4ILqZybX6uVWncaVLbl9AytkpMSpPQ2CIEE0xpXyvjuTZGtdn
	H8GsmwZSJH63Hcb2UYh1UrNmLlUsFMlXODvK25kOcV6sevDU0Lj8pHage5v4rXzY8VnqtUpeh6/
	+nkZ27wwHz/AHji/3Y1s9iJ5v5j64LV3bzc0rODa6zILDDl8aH7pPM3/YqmIs/JZQYxMy80zyeE
	OuRkdMBi1DynG85pe2XkmoRH1HWzWhDdd8euEJbZwPh0lIZuwSpJVzs089J5dQHmFL1RPRIf+Hz
	NWLCXxn2cZ0oboK6bgXaFVmSOTLXTtII3VzCIt+FiJg7e7Wer2XB6m+FHAMkibOB1VBVvsBpnPr
	Jvtl2lFzafERz2p85MJc9tT+upON9eCXkG7Eu08=
X-Received: by 2002:a05:6512:3a93:b0:5bf:a193:7a5b with SMTP id 2adb3069b0e04-5bfcad4618bmr2446673e87.34.1793286122095;
        Thu, 29 Oct 2026 08:02:02 -0700 (PDT)
Received: from archlinux ([194.28.181.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfca5a485csm1306117e87.57.2026.10.29.08.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:01:59 -0700 (PDT)
From: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
Subject: [PATCH] rust: macros: add descriptive doc-comment to internal fmt function
Date: Thu, 29 Oct 2026 17:01:47 +0200
Message-ID: <20261029150147.11989-1-mbkchelofficialdev@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Add descriptive documentation comments to the internal formatting function,

explaining its role in parsing format strings and wrapping arguments into

the Adapter helper.

Signed-off-by: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
---
 rust/macros/fmt.rs | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/rust/macros/fmt.rs b/rust/macros/fmt.rs
index ce6c72493..676156dc9 100644
--- a/rust/macros/fmt.rs
+++ b/rust/macros/fmt.rs
@@ -6,6 +6,9 @@
 use quote::quote_spanned;
 
 /// Please see [`crate::fmt`] for documentation.
+///
+/// This function parses the format string, extracts named arguments from curly braces,
+/// and wraps arguments into the `Adapter` helper.
 pub(crate) fn fmt(input: TokenStream) -> TokenStream {
     let mut input = input.into_iter();
 
-- 
2.56.0

