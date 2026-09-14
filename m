Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E152C26AE5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789352767; cv=none; b=USwj3cfWjyzZGOnOCHap1uVfO/MImhdvJ9hPR+L2Eg5O9NUxQDD/xMcNX8xoMVTMoiWHuu+KwalgsSIO9Lflj5Pbw4BolULLotxehmvuSnE6wEq8QSNJfhMFrO+vNptX+xRw48paZG8PZ6BSc4679hYe5i1ELLiaK5lXiRPC+aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789352767; c=relaxed/simple;
	bh=020bxIcSthkJsnM8YVR4dA+lUbFE4ozDEoobnkmHsT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LM8LiJQnHKV57vBgBZg3YB5ok0/FbKkzrv8VkWg2KPSzy+p1mz0HQngZrJfOTeaOg2dksJHoTWTfCNK1STUkpnR4e4Pwb1RrRuNZG81M3OLE2WUhQ+ubsOGoiSPJALAxrXw/ubc99MTzZVLLuUn/7enhKNtJ0h0rVq8BSHfoPGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQ+ClQRE; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQ+ClQRE"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b965f447cso10174855e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 19:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789352764; x=1789957564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=020bxIcSthkJsnM8YVR4dA+lUbFE4ozDEoobnkmHsT4=;
        b=KQ+ClQRE7mdMsFp7cCGOS8lJHcoQgpbcUcQSnEbB+wl2bkuQH+YXA86kuK7SE4/WmQ
         pVSPmGG2v2T6IS2AUJAbxXYw9suR9DtaMDQGHL4mdmB90TITrSZDnku1BNb53SkwjSZA
         DQis0e25rnIDhCUda8wQRnDCN6MWV6WTL4BOZwSTpsfLnJge1McGBn94YND/bWf7/cY7
         UMBcZ3FZ/lYu97xQzCl1W5Y0t4gx76x6QgzU19neSeprXLdChkqtdz2TpUkdzd1TmWsJ
         8yG2HV3Ck5iIPCMdyTNS7vJMf2UXP+0N4YoiUNO6Elz+/SljlyLUbrnKqUcpl5jOPIa4
         8XOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789352764; x=1789957564;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=020bxIcSthkJsnM8YVR4dA+lUbFE4ozDEoobnkmHsT4=;
        b=N4PhX4JPbfTET0TUUs9m0gb/ug0gEDp+bRFjY4e43N9HCZGJyc9ZbJnAPIwvuDU4LY
         p2bdOrHX+SZkt7R+CUNeVEVwgn+bqf/ctPowOX9eje4kV0kiBxK6Y6+t3XuqkE3tcigQ
         U+/exjMsN84aMQzeEJIZOtZmTtfVrjoHoYy155DyriLr2SMH4FN/N/qUzYSfWC/hSFPb
         BhS8+6YBH3I7BrSMM4Dpzv9cOFGsodEzRSP+Jey4PdYIXnMA2N7eoopIHuII6TZJilaX
         0raPwLiSfkpIl9u9E9kwgGxtBhyxhC91MqIFGFk2dCEq5JhjUbJv+azfg77wwA0MzAmR
         z2Jg==
X-Forwarded-Encrypted: i=1; AKwUvBzsZbxAxwTxvOsL6urdNZseymCUrBvbPdFEW4ywXyNK6Of2fD545aCTjQ5YcSJrocHwMy2VLNPEbgGq0KM=@vger.kernel.org
X-Gm-Message-State: AFuF++mVXXv92zf+5ZmRfqPbbcBZzthbERo0wmN6WKxEiVvM9x2+jPGf
	ObL+uFfJBgY1Pdr4/vextq8WpptNWW7TMxBuaNT3ceh6ZgvMvLfYEA+F3MXH
X-Gm-Gg: AYBFou3i1OEuhYPemSF2TokztM7r1KiKf8+SFzRxAbwGsfWA/2s5p6kaJ4oypbfb0iE
	qny3rFt4IYEU0fWC/4AWhwL9Hwi6XYulxQq0str3aDOINzyMeovkWjwNvMVzzJ46bfwMlSWBg7M
	3RzHxItZpkpXjAjigDgGqZvC/qzyYREQEfyUemyVknwU4XmckTyFSdzPKPZfZKb5288AclrE5JR
	FFiN58mdiw8uwQK/8T9c7QSkBi0q3SRbmzBvjTcLdRdYMu1znVuiJqleDeH+zTr4maDRSEPckWs
	ZGvUr5GhkSI2fwxVF/TdrwKmJ9QMpjyWy1pmlv0ZqsbMWzXsAvfi6atPapyauSkO5qy7MAnP35T
	GbDhGXrTSZUPBNqw3QPifAN1bBLwmXfL0ktgCLntp9sweackqpLq/ozQtypPHJNDidMftpjKvo1
	f/10dMrAySZDwK499v72GEeUxyflo1/Cu8te0D+91rNkKAipNR6xgNba+N4CRHJ5As0BQe/swvL
	DmDWffVBCwHa58HcKjyN2Hah8S1IM8W1F6BfgYTbpOO7nUSHBJVWXO2kBy3RjwO1UjGXkV9vU1E
	+NiCoLlv0j8agyo=
X-Received: by 2002:a05:600c:1c0f:b0:49c:dcec:bd27 with SMTP id 5b1f17b1804b1-49e7a648ab0mr6027235e9.8.1789352763861;
        Sun, 13 Sep 2026 19:26:03 -0700 (PDT)
Received: from nn ([2001:1ab8:1003:0:5454:f357:ba89:4e22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm417415975e9.14.2026.09.13.19.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 19:26:02 -0700 (PDT)
Sender: N B <gen.benner@gmail.com>
From: =?UTF-8?q?Nerijus=20Bend=C5=BEi=C5=ABnas?= <nerijus.bendziunas@gmail.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] wifi: ath9k: stop a failed register read from opening the RX filter
Date: Mon, 14 Sep 2026 05:25:57 +0300
Message-ID: <20260914022557.1141231-1-nerijus.bendziunas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <5f892b6a-7c02-483f-84c3-43c1161ef251@oss.qualcomm.com>
References: <20260911014653.1566388-1-nerijus.bendziunas@gmail.com> <20260911014653.1566388-2-nerijus.bendziunas@gmail.com> <5f892b6a-7c02-483f-84c3-43c1161ef251@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On Fri, 11 Sep 2026 10:06:21 -0700, Jeff Johnson wrote:
> On 9/10/2026 6:46 PM, Nerijus Bendžiūnas wrote:
>> +/*
>> + * Set bits in the RX filter without reading it back: on USB a failed read
>> + * returns all ones, and writing that back would open every filter bit.
>> + */
>> +void ath9k_hw_enable_rxfilter(struct ath_hw *ah, u32 bits)
>
> there is a standard for kernel function documentation
>
> https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#function-documentation

Thanks, I will change this to kernel-doc.

Per Toke's request on the cover letter, this patch and the other ath9k
fixes will come back as one series once, with the dependencies and the
testing explained, rather than as a v4 on this thread.

Nerijus
