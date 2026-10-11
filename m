Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1AE34D93B
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 08:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791707187; cv=none; b=n6QvxCVeC8xTsDRaoBm0qQOLxaoDYFwwDM6K22XNbVT/pQDQSNf5ASWgH35urtKYu5wEafIT1Poj/jlY8gKD3mNmD2H62PW1EcXhkMRuHqYGT3t7tWf12cMa5eVLWAVhrHGmI9fvJyBD2uIytOaaIEAjlY8u7slbOMa0h/6hbdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791707187; c=relaxed/simple;
	bh=y1QwkgceHzfBH6MZ8up+J75RMMDg6/896hgV8nyn0sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PAEKnbnxfxZS260zGkL+l3pBRTO+sgq6B9yo+ylq+lBFWrvulz9aN2EDUCLZJcfV2f1+xSJbRH4HUAn+Bj/ccK58E30ev5wx105/vuZGCoctvHueWXBAQyfJjs/N7b/GVyzxCu54AHgUQGjMybmXGvpxJaQnLnxz0WBeRRlpgwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iPKv9TRQ; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iPKv9TRQ"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35115b52125so1327101eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 01:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791707185; x=1792311985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8/K6Rj92lKxX9ixsqo45OJ1kJLg7bhafYq1xFabLpUE=;
        b=iPKv9TRQwWEFLkkrUmX7bd9BpBCe0wFbIl6W1J3Xcrg73D5TIAWSqZzDldOrML4kMA
         28HdfSIwMAl3LZ4fBmpPM4f4BYLw/d1hhmvWaJiNarhV+QgU1dB1stFsks3SvEw4bHAp
         xPR7SfrLsqA5j1cKI+/ibJgBlNLRM+grpyPIFVpfSrI3SwS1q4I6HaHIqkmdeN0z+JBR
         mUrk3OzB5cJxCEz+VQW5BlK6PFtIyXmgRFqneKdNILPKn5mH7aFDu8UQkVRS4h3kOvk/
         mwWt+Spvvi9o1MZfB8nY0iVBVJXCH67GhBLDqMtxpMV03z7JKVPLfdh7kCoREhVtyIGy
         SH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791707185; x=1792311985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8/K6Rj92lKxX9ixsqo45OJ1kJLg7bhafYq1xFabLpUE=;
        b=23MmZXys6DTAkzQcLIjp3Sdzdf5HQAE0sMT/O/mJ9kbeV2Pt4Z5hjAclo0q9NkG1nK
         Cgji5wAUXFjtG8CeboA/a/dt/HPd1u7Q/YslJHSv+EYcU/I6QU2ucSSaXycSxW0WN0PO
         cDpVPlhq5ytQ2xXlqOS2+dQSbXN8CQ/drsDPhQwkwwjAfPQTIulOnel6zn2bP80QXyqo
         pTx+5Y2YeoWgGOW2f3JfsbVreKyvxoziTePN8EiYptXXSLOWj/4F8Zof7HGhKNQ7EEPc
         muWCQ2z/jFLzFLMZh9D9VcopzYlKRZtEsbih22LDu519O4C7wmg2meiYEPer0LzHLDBP
         mRYw==
X-Forwarded-Encrypted: i=1; AKwUvByAnoJ502jfXLkXdXhu8bcr7tiKgUEV3mUpVaoonvz4iapnhWFcbLn/9uZg6gXBz2oAzDL5kGac9MhmE0o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJS03zXhCwaAk0v+PvtjLTVYWC5rY5l7sGr9khTw8EJPnKq9auH
	/GPRTaA7JvOi2RIQKNlZ1DqD81SKRvj/1qnKalOCPDQo+OiQmUfB+/2l
X-Gm-Gg: AYBFou3atdznbZKI51+Ql+OM42C8kzCOqBPnz1PgcTCBAPodKp9juae180d8W0We4pz
	W7eOn5MR8Ji85yxA0dyK2FbALfVHxm07co4/S2S/AOnVuIYToag+KjTeP+y+Xw4M9wBFedUJNFM
	iC2X4zypwGfqQMF+X5hNBBcOehtNMQcoTIAlb5CMSI/zmcrMiHDzqULANf4rigsZh49c5ZSFpUV
	eaNU2KYC7keCCR1uHr5EXJ7hUHpYxo7YiIx7LtDSA4Qu04pcAVx1dzosEK+INeEDjuQ8W/u0KAA
	M3qYsyipZAv4yFMAyw0lm40/U0GFlF2UoqIKyu8QJFiEGh3S5lFNiceMhCEGaUHdzSTf30OFCWD
	Lot2ouXmB9fcLLT+msX54Hq3/28UZkccRo08SpEE/QwjhuW3cya+qlyIrMea+Sr+7WJ/slXMaMd
	69VFSM5YlGKOyfftKlcIjwt0Tf90G1rnKa1Apif16ntECyk20XOJ/EA94dztVok64gYzQ3gvpkU
	KADHkLO1ugAFx7B4Y7FMNBg0TD6Ua6IFyqlVrajWCrNq/0IfeWcvQsDJVfUvSeQIoIfmzYOE2No
	Rzvj3g==
X-Received: by 2002:a05:7300:f0ce:b0:34b:b410:9352 with SMTP id 5a478bee46e88-3537de1ce96mr8934868eec.1.1791707185179;
        Sun, 11 Oct 2026 01:26:25 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain ([129.126.57.197])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca67b21sm21731611eec.11.2026.10.11.01.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:26:23 -0700 (PDT)
From: Wei Jie LAW <98lawweijie@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: 98lawweijie@gmail.com,
	aduggan@synaptics.com,
	bentiss@kernel.org,
	jikos@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 1/2] Input: synaptics-rmi4 - fix irq[] overrun with 7 interrupt sources
Date: Sun, 11 Oct 2026 16:26:05 +0800
Message-ID: <20261011082605.220206-1-98lawweijie@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <asm1vCJYVKA5bHnd@google.com>
References: <20260825103123.12216-1-98lawweijie@gmail.com> <20260825103123.12216-2-98lawweijie@gmail.com> <asm1vCJYVKA5bHnd@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Jie Law <98lawweijie@gmail.com>

On Fri, Oct 09, 2026 at 08:49:45PM -0700, Dmitry Torokhov wrote:

> Per the Synaptics RMI4 specification (Section "Function Descriptor
> registers"), only values 0 through 6 directly specify an interrupt
> count, while value 7 is reserved to indicate "more than 6 interrupt
> sources" (which is why the comment above RMI_FN_MAX_IRQS states "up
> to 6 interrupt sources in the normal manner").

Thanks for the correction.

> Since the driver does not implement support for functions with more than
> 6 interrupt sources, we should keep RMI_FN_MAX_IRQS as 6 and reject
> functions reporting interrupt_source_count > RMI_FN_MAX_IRQS with
> -EINVAL during PDT scanning in rmi_scan_pdt_page() (after the
> RMI4_END_OF_PDT() check so unpopulated 0xff entries still terminate the
> scan cleanly).

Agreed, I'll be sending a v5 patch that does that.  Tested on v6.12.105 
with an emulated device: a function declaring 7 sources now fails the 
probe with -EINVAL, and a device whose PDT ends in an all-0xff entry 
still probes.  With the check moved before RMI4_END_OF_PDT() that second 
device is rejected, so the ordering does matter.

Thanks,
Wei Jie
