Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98B4415F07
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270452; cv=none; b=jkIZoOtHceRztca1s+Nn/4v5X7SLboXmVDqFii3wSn1JD6kU3RC61/KYOZ4vR7saSsU99hWvB2KS9S3KcCekICcQUumUKxjnAhRVNhQ/9+aK+cvnvzX/ruKyLHnAd3nwGob9a7kx2QmaWApF82p+PPOSfwy+DUVyHtr/YhzfIK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270452; c=relaxed/simple;
	bh=WJ/jvuEsNTw48GNguN8zrKKJvyVSevOBTt7qy4g+rxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ufNR6JcddT7IjNOXHVxyktSW50qSM0c5E42veNlc5XfUFVEnTz/Tuqj0d2cF9kW7s2/X9mDqn6IMRf9vluFkNs2OPy7Juhp9bvPGu6QeqyUcAIHfCEFE3UVA8wyBI4wNIZyEH5x0Yu3IcARQVOhLjgqhGZJto7voBn0Rn43Bwvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QV0fmUx/; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QV0fmUx/"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f17450so58330e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790270449; x=1790875249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M39j3RN/o0/NumnXpt5nKH9FIQ/d20wF6j50zvt/Yc4=;
        b=QV0fmUx/1ywrinJLDPCxI5tkg1ej8HfjAr3FaqfWz7No5GBtvZ7SyCQMxwhfYoFg0t
         hPxFwty/yIZUMNiSbNw+42tqCjkW9FUTPa7qBge5Lbc2BhxR61JUphdEPDv2JLDgMKO2
         QzDYyGznSK2qFFFpYvKUkwLFN6Hmhtl+MmUhEKMeIt98O367p9j6P8uAys3PVXXpECAV
         MV0/m1sdEr/KgsqIbPdV+SEr+Fyqppb+YIC5aKzTTAUdlw1KBYYyiZE53KjXZgQVmK62
         vUaQaDSUcR1D9Hd4wAhWkoB/WNAl+2Lu3imOnltkVeK+F5LRUJ4oMdSTdQwOrggaAbJF
         pLcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270449; x=1790875249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M39j3RN/o0/NumnXpt5nKH9FIQ/d20wF6j50zvt/Yc4=;
        b=kJIjzI49+5xqLjGFBNSMA09xPpVukiPyIbY5hjgPs4dW8rveyrZQYliVZj9wt31Nry
         T5F0jXkec9ZGbf6/Zo/P7ZHOS/68f7g8X4yku7cw/Ynhx9agPXhVwfTYicS3NzAvbBBr
         cD1ELqZ6dGYPXCtBhmLC4odqdk7d6TI8b4LJ+j+/YOehFYFy83bRg/4ag+rOgI2KRIRj
         dqQIHfiRz+HaooyxuwdmQWWvqHvtlnUXhfY9pJjE86tkcEg3uf3xsB8Uw+F/8ExGKLuf
         oyovvspBV8/5oLKlDT+VtweyOkJyRm8pzbQQLD2BIgZqW23bMBfXiSvDCUNhKxrAGxWo
         6SVA==
X-Forwarded-Encrypted: i=1; AKwUvBxYR0JSj9ZSp8Zm9gcHhKNee1+k239m3FFazXgeOr3wEEYDIJ+iaQ5nNUVVadYtbDgvJIcKc80VKKSN2R8=@vger.kernel.org
X-Gm-Message-State: AFuF++lNPfR/Vrm0YP6IYDVBF107F1niylgTbU09KSZoy7yf1XizTX0B
	+080oW1OXFihOjII+3lNcBGG46IqfrZVrAX5kBxxOAEvY6eu0QUi08eJ
X-Gm-Gg: AYBFou08zyckhIxHNJyd1ZgL1eXEQxla0VRrMVzQzQjDc17saxQVzt6fnpFdj5w14S1
	hRKR3MN5Hg/KiEqnJu0HxvZrkAWVSnSXPdSWNQNpQhpTnJkA6/puVR0flvXMQhclc7MtILiCERv
	PwjxX54TclOlEKsraSQQ7L5agi+8X7DdvZxVijkPEl7XQAr38wthZ3eqtfyz5MLmdlXIPX5V/Ai
	kxG4vEXnYn+LHVI6BQmyKH28IwCkyq/WmnTi0cdWIHXo7ndjsVt/DHpaYdKkc3DL69YwgzLrn0a
	rKlIMnuS6blKKmRaFFEk/zOkDAOWcmUQ/c2i62IlpbEjufN3kMvON2ts2PE8YWVBYHPK83Sx2ME
	ZbJAWtP43HqThiX2IZg2p+hBDbJPrUm5uQ7/bjeZd9PgR0MyLUwMcaIr9kx8v7OpKaxJXc66NcT
	pz2q2miI+me9vHFNOUehXkzHRFualGMaTj+WfikxPG1BDS+4sQ/iWxPxx0vJO9ZjwWPrM4s/1PE
	x4xY0y9Yg4XM5M=
X-Received: by 2002:a05:6512:3e1a:b0:5b6:183c:5c86 with SMTP id 2adb3069b0e04-5b8e0a086dcmr1008333e87.36.1790270448439;
        Thu, 24 Sep 2026 10:20:48 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([104.194.144.188])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d859505csm1611065e87.74.2026.09.24.10.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:20:48 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org,
	rillian.grant@gmail.com
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruslan Koreev <koreev.r@gmail.com>
Subject: [PATCH 0/2] leds: flash: lm3643: standby fix and ACPI LED description
Date: Thu, 24 Sep 2026 20:20:38 +0300
Message-ID: <20260924172040.1185688-1-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821083620.68324-1-rillian.grant@gmail.com>
References: <20260821083620.68324-1-rillian.grant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These apply on top of Rillian Grant's "[RFC PATCH 0/2] leds: flash:
LM3643 dual LED flash driver" and answer two things from that thread.

Patch 1 addresses the two state-machine problems flagged by the Sashiko
review of the RFC, which Lee Jones asked to have addressed: switching
the last active output off left the chip in torch or flash mode instead
of standby.

Patch 2 addresses the question in the RFC cover letter about supplying
a default configuration on ACPI machines, where the chip is enumerated
as TXNW3643 without LED child nodes: it adds a DMI table describing the
LED as a software node, starting with the Lenovo ThinkPad X1 Carbon
Gen 14, where the LM3643 drives the Windows Hello IR flood illuminator
with both current sources feeding one LED. The limits are 100 mA torch
and 300 mA flash per output, well below the chip's maximums.

Tested on that laptop with Fedora 44 (kernel 7.2.5): the LED appears as
ir:flash, torch mode lights the ST VD55G1 IR camera's field of view and
the chip returns to standby when the torch is switched off, and face
authentication with howdy works on those frames.

Rillian, if you prefer to fold these into a v2 of your series, please
do; a DMI entry for the X9-15 Gen 1 only needs its product version
string.

Ruslan Koreev (2):
  leds: flash: lm3643: Return to standby when the last output is
    switched off
  leds: flash: lm3643: Describe the LED of ACPI boards without LED nodes

 drivers/leds/flash/leds-lm3643.c | 115 +++++++++++++++++++++++++++++--
 1 file changed, 109 insertions(+), 6 deletions(-)

-- 
2.55.0

