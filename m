Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657097;
	b=gxLTM+30cr/amWMMplYObz+q7+hl5vJwXE9RF5q1p5M6OpDkczCCVm8524GB+SWd+2AT
	 7WDyzFMe/xr/N4MlKvGjOsYgDrAZHI5Xmaf/FbQsMUAw87WkkMCX4n9rlw1vfGZP63Ej4
	 HbgFnb0ZkPZYq/oPaSXcS0RJVOeECMfdSV3uAsPnaAj7WpKrb6mKd97SpWoqpCqhNG3Z+
	 ggbyU0QE5AzbIK00z/fBmAdpa8SuEN0Kv72DBuzrM91Ba5JvEXwy3mOD+YFZ8fUvuXehB
	 4rcPwLMF/X2nGp8tocA+Gi0u9kKebdfHMcy3NS+jlTcI1utocH8ySMcM/Fh/VXPg0SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=GUWlaGlH5mz8susnJ1tc1MkzHAkxNXlsievDEYhf0Jg=;
	b=Rx77lgbW8Uhuckq6uMAL56CjshH8056F2qV+50qBqwCELogy0WpMLIHh4Q8PyN4lfduA
	 UPUuPQTBxvtyxInCPWkCjXnvEoxB6UBMHJ+kIGSgRtc8l+f53PnYPmDq/8QL/oZiY9/tW
	 yUFv7oLE/fxHicjant2nNq5QwRz2GPnjNZTYQ4vIzbNveee/VCIcQa7w0MBKaySIvpTLT
	 FlUUvL8ZRyNVrIBoopAY5INWwqUfOWf1tZUNU8Rbz1D3TggdFBNJJuLa1bA6fUQ9NWRna
	 j8GlLaDH7F7D3KRjNURtjLbtLrmKcq7dffnRqW0EcSg6c0MCclvkYjnGv3vap+ecdVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=luXXcERe;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869E8606D828
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:04:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 869E8606D828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=luXXcERe
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36a1947498bso2741310eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793657097; x=1794261897; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GUWlaGlH5mz8susnJ1tc1MkzHAkxNXlsievDEYhf0Jg=;
        b=luXXcERe0DLoxr+m5iCUqVR7TXPe8qmgr/VZKDEqrp2+P+rKrC4TF8cZH4ma4ATHjv
         AEe8YuQLREM7gRcTJHn5nghwnZj1zXOTJP/mwgrfZbNtbNthBkTsg+F5FJwiUTNWDnHO
         HcoHjrs/tEDy6uU1p2RQbY89F6EKYIGuiiAxnIYruAIwqoLT5AbPboScigYsUnYjmxgS
         DvsGig2TxElhsEe0IsPJ/aSWWhxxuxoNz5R0wNQCqpemAZlWc6ZW+UpaM5f5KBJjvcLr
         aPyfTjnzMtQAQmulPofVcKjlA1UfhQbOca50MWnqhD9U8vO/yN3LL+1zEty6pkrQtlDm
         XQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657097; x=1794261897;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GUWlaGlH5mz8susnJ1tc1MkzHAkxNXlsievDEYhf0Jg=;
        b=FQF9Ww5yiU5dAcypvtq+ZZ8uqGAeTIOPKFa//YjixipSLVoZyiXbeEaIOUa5SqqAAQ
         th+3uVFvrIibgBPYqMeIdNZPyDgwkhHv6bS9n04YFGAHN6vV1iW1nm78FcfpeWkCMQDl
         mV6FKwG4HZ4M0U07CDgFj6ahu5ZpmpqDMi/RgOeaEj/rwPBpPKgaOcTvLn0UItes0XB3
         2ppx/nWhR14uzOa3sf5tYZNhOyYK0kcEfbUE4nMZfWLzftehKJX0g6LIG8kqEFNDOM6i
         eeKUKhSWZG1QEInb4ZdfrApb/6NCY2IzufyA3DhWDzmXXJc2Je3CZW5KwHHT6017SlWd
         x4HQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmtfr4xbGZsl6pj7NxwYGShvu7mL3j1uyinKg4/H7cbGKc6zXBDVPKCDwPoPdH8Lf3Q7r7gYivJOtbKxw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oKR66bV2+mYl4WrCUV0OUR4g3x+fPOft50/PoEHxarjv3k3A1
	C5ARfCcVwhyIAqDRjHXNVqcWJ6DpxDW25w3msYJXrFr49rlt8fEv8iWy
X-Gm-Gg: AYBFou3zcAj4O4gYtH3d2FaAnxVOkdccQ76mICjYsU6uR7xqwUg6NPo0qiSiPgOUYFr
	IaXr4UOlL/N4EpbfJ7v5sYGM8TVwU5DEi+nT5CIQuDi6NoPCuPDSUtCcqqnKG+VHVI3oBW53Lri
	yzeSqgUtjhfYw5h1IiB7keb8hEhLs7dFwjzCpbRCtY/tCm09oSTC5VjjbI03e6Kx64Jzz3Ck60Z
	IiLsDJIMv+P9XRIRxbR2ncXxYYLAcfD1x4U7wYTKCg6HXGH7OrtRJeG/yBak415qIYjszQUJvZU
	V3QX6b3edVc54cMUj6qc8cThgrik1pg7BK2LsNL8NXiXbcV+UkhlPTHQBosiBMq7rAbyoSBdAdP
	aJtYy22sGvL2h5wWxo62zA+4IuPecrGJEEuO/8atW8AN0Jsbl5AeRyVfzIRFNd9qqf9XLAbIdM6
	/orJSpDJs1jTKPk2V2PLIf0jCtTPOCU6UJ2ayjgev7q2kJidps2LNrCbZLgNkq7WEoLhOjW6Z2x
	+pCY7GtJrii05zrPkklye2DXSifbRN8e4ocZuWsW5GBjrALxu+YTflHIUv+wGK5P48bBKL2jIkv
	cPkzcIjipnwPljK0qYW/mq4NHpVCMHSg3eAPM78xTdHBQD7nvL9vOK72hLcem/a/ow==
X-Received: by 2002:a05:7300:a945:b0:35d:d9a9:e455 with SMTP id 5a478bee46e88-36a423b3556mr31228630eec.21.1793657096394;
        Mon, 02 Nov 2026 14:04:56 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm39334485eec.6.2026.11.02.14.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:04:55 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	vkoul@kernel.org
Cc: neil.armstrong@linaro.org,
	mani@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	val@packett.cool,
	wesley.cheng@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] phy: qcom: qmp-combo: Leave the USB PCS alone in DP-only mode
Date: Tue,  3 Nov 2026 07:04:56 +0900
Message-ID: <20261102220456.1687-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <6cd9240d-5628-4c35-b7ca-bbbae7f62fe9@oss.qualcomm.com>
References: <20261023123512.1912-1-26rote@gmail.com> <6cd9240d-5628-4c35-b7ca-bbbae7f62fe9@oss.qualcomm.com>
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

On 11/2/26 10:34 PM, Konrad Dybcio wrote:
> On 10/23/26 2:35 PM, Joonhoe Kim wrote:
[...]
>> On a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with a USB-C monitor
>> in pin assignment C, resume from s2idle fails with "phy initialization
>> timed-out", the dwc3 resume returns -110 and the following xHCI resume
>> hangs the system.
>
> This sounds like a gap in the DWC3 driver, we should bail out of r/w
> any registers if resume failed

Agreed, that is a separate problem. This patch only removes the PHY
timeout behind the -110 in this case.

I need to correct the last part, though. The hang was with an
out-of-tree dwc3 change that passes power_lost to xhci-plat. With it,
xhci_resume() went into xhci_reset() with the long timeout and
interrupts off. I haven't checked what mainline does after the failed
dwc3 resume. In v3 I'll end that paragraph with "the dwc3 resume
returns -110 and USB stops working".

Thanks,
Joonhoe Kim
